package kr.co.example.config;

import org.apache.ibatis.session.AutoMappingBehavior;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration
@MapperScan(basePackages="kr.co.example.*.mapper"
        ,sqlSessionFactoryRef="sqlSessionFactory")
@EnableTransactionManagement
public class DataBaseConfig {

    @Autowired
    ApplicationContext applicationContext;

    @Bean(name="dataSource")
    @Primary
    @ConfigurationProperties(prefix="spring.datasource.hikari")
    public DataSource dataSource() {
        DataSource	dataSource	= DataSourceBuilder.create().build();
        return dataSource;
    }

    @Bean(name="sqlSessionFactory")
    @Primary
    public SqlSessionFactory sqlSessionFactory(@Qualifier("dataSource") DataSource writeDataSource, ApplicationContext applicationContext) throws Exception {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();

        factoryBean.setDataSource(writeDataSource);
        factoryBean.setTypeAliasesPackage("kr.co.example.**.model");
        factoryBean.setMapperLocations(applicationContext.getResources("classpath:mapper/**/*.xml"));

        factoryBean.getObject().getConfiguration().setMapUnderscoreToCamelCase(true);
        factoryBean.getObject().getConfiguration().setAutoMappingBehavior(AutoMappingBehavior.PARTIAL);

        return factoryBean.getObject();
    }

    @Bean(name="sqlSessionTemplate")
    @Primary
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {

        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean
    @Primary
    public PlatformTransactionManager txManager() {
        DataSourceTransactionManager transactionManager	= new DataSourceTransactionManager(dataSource());
        transactionManager.setGlobalRollbackOnParticipationFailure(false);
        return transactionManager;
    }

}