package com.oracle.OMG.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.OMG.dto.Member;
import com.oracle.OMG.dto.Paging;
import com.oracle.OMG.service.shService.ShMemberService;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Data
@Slf4j
public class ShController {
	
	private final ShMemberService ms;
	
	@RequestMapping(value = "/")
	public String main() {
		return "main";
	}

	@RequestMapping(value = "memberR")
	public String memberRegistration() {
		return "sh/memberRegistration";
	}
	
	@RequestMapping(value = "memberU")
	public String memberUpdate(@RequestParam("mem_id") int mem_id, Model model) {
		System.out.println("shController memberUpdate() Start");
		
		return "sh/memberUpdate";
	}
	
	//사원 목록
	@RequestMapping(value = "memberL")
	public String memberList(String currentPage, Model model) {
		System.out.println("shController memberList() Start");
		Member member = new Member();
		//사원 총 인원수
		int memberTotal = ms.memberTotal();
		
		//리스트 페이지 세팅
		Paging page = new Paging(memberTotal, currentPage);
		int start = page.getStart();
		int end   = page.getEnd();
		member.setStart(start);
		member.setEnd(end);
		
		//사원 리스트 조회용
		List<Member> memberList = ms.memberList(member);
		
		model.addAttribute("memberTotal", memberTotal);
		model.addAttribute("memberList", memberList);
		model.addAttribute("page",page);
		return "sh/memberList";
	}
	
	//사원 목록 검색창
	@RequestMapping(value = "memberRequirement", method = RequestMethod.GET)
	public String searchMemberRequirement(@RequestParam("keyword") String keyword, String currentPage, Model model) {
		System.out.println("shController searchMemberRequirement() Start");
		Member member = new Member();
		member.setKeyword(keyword);
		//사원 총 인원수
		int searchMemberTotal = ms.searchMemberTotal(member);
		System.out.println("searchMemberTotal->"+searchMemberTotal);
		
		//리스트 페이지 세팅
		Paging page = new Paging(searchMemberTotal, currentPage);
		int start = page.getStart();
		int end   = page.getEnd();
		member.setStart(start);
		member.setEnd(end);
		
		List<Member> memberList = ms.memberSearchList(member);
		model.addAttribute("memberList",memberList);
		model.addAttribute("page",page);
		model.addAttribute("memberTotal", searchMemberTotal);
		System.out.println("memberList->"+memberList);

		return "/sh/memberList";
	}
	
	
	@RequestMapping(value = "example")
	public String example() {
		return "example";
	}
	
	@RequestMapping(value = "pwdCheck")
	public String pwdCheck(@RequestParam("userPwd") String userPwd, Model model) {
		//결과값 들어갈 변수
		String result = "";
		
		//특정 문구 제한
		if(userPwd.contains("1004")||userPwd.contains("8282")||userPwd.contains("abc123")) {
			System.out.println("위험 - 특정 문구 포함 불가");
			result = "2";
		} else if(userPwd.matches("^[a-zA-Z]*$")||userPwd.matches("^[0-9]*$")){
			System.out.println("보통 - 영문자, 숫자만 있을 경우");
			result = "3";
		} else {
			System.out.println("안전 - 영문자, 숫자, 특수문자 중 2개 이상 조합");
			result = "4";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "createMember", method = RequestMethod.POST)
	public int createMember(   @RequestParam("right") 	 int right,
							   @RequestParam("hiredate") String hiredate,
							   @RequestParam("name") 	 String name,
							   @RequestParam("birthday") String birthday,
							   @RequestParam("sex") 	 String sex,
							   @RequestParam("email") 	 String email,
							   @RequestParam("phone") 	 String phone,
							   @RequestParam("dept") 	 int dept,
							   @RequestParam("posi") 	 int posi,
							   @RequestParam("duty") 	 int duty,
							   @RequestParam("mailcode") int mailcode,
							   @RequestParam("address")  String address,
							   @RequestParam("password") String password,
							   @RequestParam("img") 	 MultipartFile img,
							   HttpServletRequest 		 request,
							   Model 					 model) throws IOException {
		System.out.println("shController createMember() Start");
		int result = 0;
		
		Member member = new Member();
		member.setMem_right(right);
		//Date를 String으로 바꾸기
		member.setMem_hiredate(hiredate);
		member.setMem_name(name);
		member.setMem_bd(birthday);
		member.setMem_sex(sex);
		member.setMem_email(email);
		member.setMem_phone(phone);
		member.setMem_dept_md(dept);
		member.setMem_posi_md(posi);
		member.setMem_duty_md(duty);
		member.setMem_mailcode(mailcode);
		member.setMem_address(address);
		member.setMem_pw(password);
		
			//multipartFile 경로 설정
			String path 		  = request.getSession().getServletContext().getRealPath("upload");
			
			//경로 내 파일 생성
			String root = path +"\\sh";
			File file = new File(root);
			if(!file.exists()) file.mkdir();	//만약 파일이 존재하지 않으면 생성한다.
			
			//업로드할 폴더 설정
			String originFileName = img.getOriginalFilename();
			String ext 			  = originFileName.substring(originFileName.lastIndexOf("."));
			String ranFileName 	  = UUID.randomUUID().toString() + ext;
			
			File changeFile 	  = new File(root + "\\" + ranFileName);
			
			try {
				img.transferTo(changeFile);
				System.out.println("파일 업로드 성공");
				member.setMem_img(ranFileName);
			} catch (Exception e) {
				System.out.println("shController createMember Exception ->" + e.getMessage());
			}
			
			result = ms.createMember(member);
	
		
		return result;
 	}
}
