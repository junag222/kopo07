package kr.co.uclick.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.uclick.entity.Phone;
import kr.co.uclick.repository.PhoneRepository;

@Service
@Transactional
public class PhoneService {

	@Autowired
	private PhoneRepository phoneRepository;

	public void delete(Phone phone) {
		phoneRepository.delete(phone);
	}
	@Cacheable(value = "area")
	@Transactional(readOnly = true)
	public List<Phone> findAll() {
		return phoneRepository.findAll();
	}
	@Cacheable(value = "area")
	@Transactional(readOnly = true)
	public List<Phone> findPhoneByNumberContaining(String number) {

		//sampleRepository.findAll(QSample.sample.name.eq(name));
//		phoneRepository.doSample(number);

	return phoneRepository.findPhoneByNumberContaining(number);
	}
	@CacheEvict(value = "area", allEntries = true)
	public void save(Phone phone) {
		phoneRepository.save(phone);
	}
	@Cacheable(value = "area")
	public Optional<Phone> findById(Long id) {
	phoneRepository.findById(id);
		return phoneRepository.findById(id);
	}
	@Cacheable(value = "area")
	public void deleteById(long id) {
		phoneRepository.deleteById(id);
		
		
	}

	
	
}
