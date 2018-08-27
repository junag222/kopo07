package kr.co.uclick.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.uclick.entity.Member;
import kr.co.uclick.repository.MemberRepository;

@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	public void delete(Member member) {
		memberRepository.delete(member);
	}
	@Cacheable(value = "area")
	@Transactional(readOnly = true)
	public List<Member> findAll() { //findAll에 정렬 메서드 적용
		return memberRepository.findAll(sortByregdate());
	}
	@Cacheable(value = "area")
	@Transactional(readOnly = true)
	public List<Member> findMemberByNameContaining(String name) {

		//sampleRepository.findAll(QSample.sample.name.eq(name));
		memberRepository.doSample(name);

		return memberRepository.findMemberByNameContaining(name);
	}
    @CacheEvict(value = "area", allEntries = true)
	public void save(Member member) {
		memberRepository.save(member);
	}
    @Cacheable(value = "area")
	public Optional<Member> findById(Long id) {
		return memberRepository.findById(id);
	}
    @Cacheable(value = "area")
	public Sort sortByregdate() { //정렬 메서드
		// TODO Auto-generated method stub
		return new Sort(Sort.Direction.DESC, "regdate");
	}
}
