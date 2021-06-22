package com.sesoc.miniBoard.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.miniBoard.vo.Member;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession session;

	public boolean check(String userID) {
		int result = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result = mapper.check(userID);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result > 0;
	}

	public boolean signup(Member member) {
		int result = 0;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result = mapper.signup(member);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result > 0;
	}

	public boolean login(Member member, HttpSession session) {
		String inputedID = member.getUserID();
		String userID = inputedID.substring(0, 1).toUpperCase() + inputedID.substring(1).toLowerCase();
		member.setUserID(userID);
		try {
			MemberMapper mapper = this.session.getMapper(MemberMapper.class);
			if (mapper.login(member) > 0) {
				session.setAttribute("userID", userID);
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public void logout(HttpSession session) {
		session.invalidate();
	}
}