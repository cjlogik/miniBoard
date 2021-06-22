package com.sesoc.miniBoard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.sesoc.miniBoard.vo.Board;

public interface BoardMapper {

	int boardCount(HashMap<String, String> search);

	ArrayList<Board> getBoardList(HashMap<String, String> search, RowBounds rb);

	Board readBoard(int boardNum);

	int like(HashMap<String, Integer> like);

	int newRead(int boardNum);

	int writeBoard(Board board);

	Board readBoardRecently(String userID);

	int updateBoard(Board board);

	int deleteBoard(Board board);
}