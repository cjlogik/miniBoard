package com.sesoc.miniBoard.vo;

import lombok.Data;

@Data
public class Reply {
	private int replyNum;
	private int boardNum;
	private String userID;
	private String replyText;
	private String inputDate;
}