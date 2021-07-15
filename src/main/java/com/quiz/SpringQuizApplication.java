package com.quiz;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;


@MapperScan(basePackages = "com.quiz")
@ComponentScan(basePackages = "com.*")

@SpringBootApplication
public class SpringQuizApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringQuizApplication.class, args);
	}
	
	
	@Bean // Spring 이 알아서 처리해주는
	 public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		 
		 //SQL관련내용 연결해주는 객체
	     SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean(); 
	     sessionFactory.setDataSource(dataSource);

	     Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*Mapper.xml");
	     //classpath:mappers/*Mapper.xml 
	     //mappers폴더 하위에/(user)Mapper.xml -- > 등등 모두 읽어온다
	     
	     
	     sessionFactory.setMapperLocations(res);

	     return sessionFactory.getObject();
	 }

}
