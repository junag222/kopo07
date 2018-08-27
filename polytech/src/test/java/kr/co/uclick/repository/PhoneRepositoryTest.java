package kr.co.uclick.repository;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Optional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.co.uclick.configuration.SpringConfiguration;
import kr.co.uclick.entity.Phone;
import kr.co.uclick.repository.PhoneRepository;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class PhoneRepositoryTest {

	@Autowired
	PhoneRepository phoneRepository;
	
	@Test
	public void test() {
//		Sample sample = new Sample();
//		sample.setName("park");
//		sample.setNumber(10);
//		sampleService.save(sample);
//		for(int i=1; i<=10; i++) {
//			Member member = new Member();
//			member.setName("내용"+i);
//			memberRepository.save(member);
//		}
//		Optional<Phone> m = phoneRepository.findById(1L);
//		Phone phone = m.get();
//		
//		assertEquals(1,phone.getId().longValue());
//		
		
//			System.out.println("Delete Entity");
//			phoneRepository.deleteById(1L);
		
		List<Phone> mm = phoneRepository.findPhoneByNumberContaining("010");
		for(Phone m: mm) {
			System.out.println(mm.get(0));
		}		
	}

}
