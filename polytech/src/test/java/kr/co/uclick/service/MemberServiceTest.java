package kr.co.uclick.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.co.uclick.configuration.SpringConfiguration;
import kr.co.uclick.entity.Member;
import kr.co.uclick.entity.Phone;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class MemberServiceTest {

	@Autowired
	MemberService memberService;
	
//	@Test
//	public void testFindAll() {
////		List<Member> mm = memberService.findAll();
////		
////		for(Member m: mm) {
////			System.out.println(m.getName());
////		}
//////		
//		List<Member> member = memberService.findMemberByNameContaining("내용2");
//		
//		for(Member m: member) {
//			System.out.println(m.getName());
//		}
//		System.out.println(member);
//	}
	
	@Test
	public void testFindById() {
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		Member member = memberService.findById(1L).get();
		
		for(Phone p: member.getPhones()) {
			System.out.println(p.getNumber());
		}
	}

}
