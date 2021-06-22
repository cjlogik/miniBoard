package com.sesoc.miniBoard.vo;

import lombok.Data;

@Data
public class Board {
	private int boardNum;
	private String userID;
	private String boardID;
	private String title;
	private String content;
	private String inputDate;
	private String originalFileName;
	private String savedFileName;
	private int hits;
	private int likes;
	private int dislikes;
}