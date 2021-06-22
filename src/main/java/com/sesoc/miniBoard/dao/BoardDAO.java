package com.sesoc.miniBoard.dao;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.sesoc.miniBoard.vo.Board;

@Repository
public class BoardDAO {
	private final int countPerPage = 10;
	private final int pagePerGroup = 5;
	@Autowired
	private SqlSession session;

	public PageNavigator getNavi(String boardID, int currentPage, String searchItem, String searchKeyword) {
		HashMap<String, String> search = new HashMap<>();
		search.put("boardID", boardID);
		search.put("searchItem", searchItem);
		search.put("searchKeyword", searchKeyword);
		int boardCount = 0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			boardCount = mapper.boardCount(search);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, boardCount);

		return navi;
	}

	public ArrayList<Board> getBoardList(String boardID, PageNavigator navi, String searchItem, String searchKeyword) {
		ArrayList<Board> list = null;
		HashMap<String, String> search = new HashMap<>();
		search.put("boardID", boardID);
		search.put("searchItem", searchItem);
		search.put("searchKeyword", searchKeyword);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			list = mapper.getBoardList(search, rb);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean newRead(int boardNum) {
		int result = 0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			result = mapper.newRead(boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result > 0;
	}

	public Board readBoard(int boardNum) {
		Board board = null;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			board = mapper.readBoard(boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return board;
	}

	public Board readBoardRecently(String userID) {
		Board board = null;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			board = mapper.readBoardRecently(userID);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return board;
	}

	public void download(Board board, HttpServletResponse response) {
		try {
			File file = new File("C:/test/" + board.getSavedFileName());
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(board.getOriginalFileName(), "UTF-8"));
			response.setContentLength((int) file.length());
			FileCopyUtils.copy(new FileInputStream(file), response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean like(int boardNum, int button) {
		int result = 0;
		HashMap<String, Integer> like = new HashMap<>();
		like.put("boardNum", boardNum);
		like.put("button", button);
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			result = mapper.like(like);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result > 0;
	}

	public boolean writeBoard(Board board, MultipartFile uploadFile, HttpSession session) {
		int result = 0;
		board.setUserID(session.getAttribute("userID").toString());
		try {
			if (!uploadFile.isEmpty()) {
				board.setOriginalFileName(uploadFile.getOriginalFilename());
				String savedFilename = UUID.randomUUID().toString();
				board.setSavedFileName(savedFilename);
				uploadFile.transferTo(new File("C:/test/" + savedFilename));
			}
			BoardMapper mapper = this.session.getMapper(BoardMapper.class);
			result = mapper.writeBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result > 0;
	}

	public boolean updateBoard(Board board, MultipartFile uploadFile, HttpSession session) {
		int result = 0;
		board.setUserID(session.getAttribute("userID").toString());
		try {
			BoardMapper mapper = this.session.getMapper(BoardMapper.class);
			Board oldBoard = mapper.readBoard(board.getBoardNum());
			if (!uploadFile.isEmpty()) {
				board.setOriginalFileName(uploadFile.getOriginalFilename());
				String savedFilename = UUID.randomUUID().toString();
				board.setSavedFileName(savedFilename);
				uploadFile.transferTo(new File("C:/test/" + savedFilename));
				if (oldBoard.getSavedFileName() != null)
					new File("C:/test/" + oldBoard.getSavedFileName()).delete();
			}
			result = mapper.updateBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result > 0;
	}

	public boolean deleteBoard(Board board, HttpSession session) {
		board.setUserID(session.getAttribute("userID").toString());
		try {
			BoardMapper mapper = this.session.getMapper(BoardMapper.class);
			if (mapper.deleteBoard(board) < 1)
				return false;
			else if (board.getSavedFileName() != null)
				new File("C:/test/" + board.getSavedFileName()).delete();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return true;
	}
}