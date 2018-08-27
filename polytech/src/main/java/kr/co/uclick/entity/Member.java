package kr.co.uclick.entity;


import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.TableGenerator;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Member {

	@Id
	@TableGenerator(name = "member")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "member")
	private Long id;

	@Column(length = 20) //20bytes 설정
	private String name;
	
	@OneToMany(mappedBy="member", fetch=FetchType.EAGER) //Member테이블에서 폰의 member와 OneToMany로 참조하고있음 fetch는 참조하는 거와 맞물려서 조회됨
	private List<Phone> phones;
	
	@CreationTimestamp
	private Date regdate;
	
	private String age;

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Phone> getPhones() {
		return phones;
	}

	public void setPhones(List<Phone> phones) {
		this.phones = phones;
	}
}
	

