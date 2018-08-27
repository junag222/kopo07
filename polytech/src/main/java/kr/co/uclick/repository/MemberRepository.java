package kr.co.uclick.repository;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kr.co.uclick.entity.Member;

public interface MemberRepository
		extends JpaRepository<Member, Long>, QuerydslPredicateExecutor<Member>, CustomSampleRepository {
//Query 를 이용한 동적 SQL 처리
	@Cacheable(value="area")
	public List<Member> findMemberByNameContaining(String name);

}
