package kr.co.uclick.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kr.co.uclick.entity.Sample;

public interface SampleRepository
		extends JpaRepository<Sample, Long>, QuerydslPredicateExecutor<Sample>, CustomSampleRepository {
//Query 를 이용한 동적 SQL 처리 pom.xml 메이븐에 구현체를 만들어줌 
	public List<Sample> findSampleByName(String name);

}
