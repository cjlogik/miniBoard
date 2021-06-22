package com.sesoc.miniBoard.dao;

import com.sesoc.miniBoard.vo.Member;

public interface MemberMapper {

	int check(String userID);

	int signup(Member member);

	int login(Member member);
}