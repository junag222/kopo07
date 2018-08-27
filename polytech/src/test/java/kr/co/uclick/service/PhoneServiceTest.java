package kr.co.uclick.service;

import java.util.List;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import kr.co.uclick.configuration.SpringConfiguration;
import kr.co.uclick.entity.Phone;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = SpringConfiguration.class)
public class PhoneServiceTest {

	@Autowired
	PhoneService phoneservice;
	
	@Test
	public void testFindAll() {
		
		for(int i=2; i<=10; i++) {
			Phone phone = new Phone();
			phone.setNumber("010-2275-443"+i);
			phoneservice.save(phone);
		}
		List<Phone> mm = phoneservice.findAll();
		
		for(Phone m: mm) {
			System.out.println(m.getNumber());
		}
		
	}
	

}
