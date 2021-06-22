package com.sesoc.miniBoard.vo;

import lombok.Data;

@Data
public class Member {
	private String userID;
	private String password;
	private int authority;
	private String eMail;
}