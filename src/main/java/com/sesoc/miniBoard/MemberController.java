package com.sesoc.miniBoard;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.miniBoard.dao.MemberDAO;
import com.sesoc.miniBoard.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO dao;

	@RequestMapping(value = "member/signupForm", method = RequestMethod.GET)
	public String signupForm() {
		return "member/signupForm";
	}

	@ResponseBody
	@RequestMapping(value="member/check", method=RequestMethod.GET)
	public boolean check(String userID){
		return dao.check(userID);
	}

	@RequestMapping(value = "member/checkForm", method = RequestMethod.GET)
	public String checkForm() {
		return "member/checkForm";
	}

	@RequestMapping(value = "member/signup", method = RequestMethod.POST)
	public String signup(Member member, Model model, HttpSession session) {
		if (dao.signup(member));
			session.setAttribute("userID", member.getUserID());
		return "member/signupResult";
	}

	@ResponseBody
	@RequestMapping(value = "member/login", method = RequestMethod.POST)
	public boolean login(Member member, HttpSession session) {
		return dao.login(member, session);
	}

	@ResponseBody
	@RequestMapping(value = "member/logout", method = RequestMethod.GET)
	public void logout(HttpSession session) {
		dao.logout(session);
	}
}