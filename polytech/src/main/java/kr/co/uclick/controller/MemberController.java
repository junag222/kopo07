package kr.co.uclick.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.uclick.entity.Member;
import kr.co.uclick.entity.Phone;
import kr.co.uclick.service.MemberService;
import kr.co.uclick.service.PhoneService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	@Autowired
	private PhoneService phoneService;

	@RequestMapping(value = "Member_insertForm")
	public String newForm(Model model) {
		return "Member_insertForm";
	}

	@RequestMapping(value = "Member_view")
	public String Member_view(@RequestParam Map<String, String> param, Model model, HttpServletRequest request) {
		logger.info("view");
		long id = Long.parseLong(param.get("id"));
		Optional<Member> member = memberService.findById(id);
		model.addAttribute("member", member.get());
		logger.info("클릭한 아이디:" + id);
		return "Member_view";

	}

	// 검색
	@RequestMapping(value = "search")
	public String search(@RequestParam Map<String, String> param, Model model) {
		logger.info("view");
		String keyword = param.get("keyword");
		String keyfield = param.get("keyfield");
		logger.debug("keyfield : {}", keyfield);
		logger.debug("keyword : {}", keyword);
		List<Member> memberes = new ArrayList<Member>();
		List<Phone> phones = new ArrayList<Phone>();
		if (keyfield.equals("searchname")) { //이름 like 조회
			memberes = memberService.findMemberByNameContaining(keyword);
			if (memberes.size() > 0) {
				model.addAttribute("memberes", memberes);
			}
		} if(keyfield.equals("searchphone")) { //폰번호 like 조회
			phones = phoneService.findPhoneByNumberContaining(keyword);
			for (Phone phone : phones) {
				memberes.add(phone.getMember());
			}
			memberes = new ArrayList<Member>(new HashSet<Member>(memberes));
			model.addAttribute("memberes", memberes);
		}

		return "Member_searchlist";
	}
	@RequestMapping(value = "Phone_updateform")
	public String Phone_updateform(@RequestParam Map<String, String> param, Model model) {

		logger.info("view");
		long id = Long.parseLong(param.get("id"));
		long pid = Long.parseLong(param.get("pid"));
		Optional<Phone> phone = phoneService.findById(pid);
		model.addAttribute("phone", phone.get());
		logger.info("클릭한 아이디:" + pid);
		return "Phone_updateform";
	}

	// 멤버 수정폼
	@RequestMapping(value = "Member_editForm")
	public String Member_editForm(@RequestParam Map<String, String> param, Model model) {

		logger.info("view");
		long id = Long.parseLong(param.get("id"));
		Optional<Member> member = memberService.findById(id);
		model.addAttribute("member", member.get());
		logger.info("클릭한 아이디:" + id);
		return "Member_editForm";
	}
	
	// 멤버 수정 후 저장
	@RequestMapping(value = "Member_updating")
	public String updating(@RequestParam Map<String, String> param, Model model, HttpServletRequest request) {
		String old_url = request.getHeader("referer");
		long id = Long.parseLong(param.get("id"));
		logger.debug("id : {}", id);
//		long phoneid = Long.parseLong(param.get("phoneid"));
		String name = param.get("name");
//		String number = param.get("number");
		String age = param.get("age");
		Optional<Member> updateList = memberService.findById(id);
		updateList.get().setName(name);
		updateList.get().setAge(age);
//		Optional<Phone> phone = phoneService.findById(phoneid);
//		logger.info("phoneide : {}", phone);
//		phone.get().setNumber(number);
//		phone.get().setMember(updateList.get());
		memberService.save(updateList.get());
//		phoneService.save(phone.get());
		return "redirect:Member_list";
	}
	
	// 멤버 수정 후 저장
		@RequestMapping(value = "Phone_updating")
		public String Phone_updating(@RequestParam Map<String, String> param, Model model, HttpServletRequest request) {
			String old_url = request.getHeader("referer");

//			long id = Long.parseLong(param.get("id"));
//			logger.debug("id : {}", id);
			long phoneid = Long.parseLong(param.get("phoneid"));
//			String name = param.get("name");
			String number = param.get("number");
//			String age = param.get("age");
//			Optional<Member> updateList = memberService.findById(id);
//			updateList.get().setName(name);
//			updateList.get().setAge(age);
			Optional<Phone> phone = phoneService.findById(phoneid);
			logger.info("phoneide : {}", phone);
			phone.get().setNumber(number);
//			phone.get().setMember(updateList.get());
//			memberService.save(updateList.get());
			phoneService.save(phone.get());
			return "redirect:Member_list";
		}


	// 폰 번호 추가
	@RequestMapping(value = "Phone_add")
	public String Phone_add(@RequestParam Map<String, String> param, Model model, HttpServletRequest request) {
		long id = Long.parseLong(param.get("id"));
		String old_url = request.getHeader("referer");
		String number = param.get("addphone");
		Phone phone = new Phone();
		Optional<Member> updateList = memberService.findById(id);
		phone.setNumber(number);
		phone.setMember(updateList.get()); //get()을 써줘야 Optional 이 됨
		phoneService.save(phone);
		return "redirect:"+ old_url;
	}

	// 회원 저장
	@RequestMapping(value = "Member_save")
	public String Member_save(@RequestParam Map<String, String> param, Model model) {
		String age = param.get("age");
		String name = param.get("name");
		String number = param.get("number");

		Member member = new Member();
		member.setName(name);
		member.setAge(age);
		Phone phone = new Phone();
		phone.setNumber(number);
		phone.setMember(member);
		memberService.save(member);
		phoneService.save(phone);
		return "redirect:Member_list";
	}

	// 회원 삭제
	// 회원 폰번호도 삭제됨
	@RequestMapping(value = "Member_delete")
	public String Member_delete(@RequestParam Map<String, String> param, Model model) {
		Long memberid = Long.parseLong(param.get("id"));
		Optional<Member> member = memberService.findById(memberid);
		memberService.delete(member.get());
		logger.info("Delete id:" + member);
		return "redirect:Member_list";

	}

	// 폰 번호만 삭제
	@RequestMapping(value = "Phone_delete")
	public String Phone_delete(@RequestParam Map<String, String> param, Model model, HttpServletRequest request) {
//		long zid = Long.parseLong(param.get("zid"));
		
		long pid = Long.parseLong(param.get("pid"));
		String old_url = request.getHeader("referer");
		//이전 페이지 되돌아가는 방법
		System.out.println("뷰====>" + old_url);
		logger.info("Delete id:" + pid);
		phoneService.deleteById(pid);
		return "redirect:"+ old_url;

	}

	// 회원 리스트 출력
	@RequestMapping(value = "Member_list")
	public String Member_list(@RequestParam Map<String, String> param, Model model) {

//		logger.debug("sample name : {}", name);
//		logger.debug("Sample.name : {}", member.getName());

		List<Member> mm = memberService.findAll();
//		for(Member m: mm) {
//			System.out.println(m.getName());
//		}

		model.addAttribute("memberlist", mm);

		return "Member_list";
	}
	
	
	
}
