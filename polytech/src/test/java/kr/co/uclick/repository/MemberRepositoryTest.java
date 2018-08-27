package kr.co.uclick.repository;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.co.uclick.configuration.SpringConfiguration;
import kr.co.uclick.entity.Member;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class MemberRepositoryTest {

	@Autowired
	MemberRepository memberRepository;
	
	@Test
	public void test() {
//		Sample sample = new Sample();
//		sample.setName("park");
//		sample.setNumber(10);
//		sampleService.save(sample);
//		for(int i=2; i<=10; i++) {
//			Member member = new Member();
//			member.setName("내용"+i);
//			memberRepository.save(member);
//		}
//		Optional<Member> m = memberRepository.findById(1L);
//		Member member = m.get();
//		
//		assertEquals(1,member.getId().longValue());
//		
	}
	
//	@Test
//	public void testFindAll() {
//		List<Member> mm = memberRepository.findAll();
//		
//		for(Member m: mm) {
//			System.out.println(m.getName());
//		}
//		
//		assertEquals(1, 2);
//		
//	}
	
	@Test
	public void testRead() {
		List<Member> member = memberRepository.findMemberByNameContaining("쯔위");
		
		member.forEach(Member -> System.out.println(member));
		//like 처리로 이름검색하여 리스트 출력
	}


}
