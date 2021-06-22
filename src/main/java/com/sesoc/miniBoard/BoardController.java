package com.sesoc.miniBoard;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sesoc.miniBoard.dao.BoardDAO;
import com.sesoc.miniBoard.dao.PageNavigator;
import com.sesoc.miniBoard.dao.ReplyDAO;
import com.sesoc.miniBoard.vo.Board;

@Controller
public class BoardController {
	@Autowired
	private BoardDAO dao;
	@Autowired
	private ReplyDAO replyDao;

	@RequestMapping(value = "board/getBoardList", method = RequestMethod.GET)
	public String getBoardList(
			Model model, String boardID,
			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(name = "searchItem", defaultValue = "userID") String searchItem,
			@RequestParam(name = "searchKeyword", defaultValue = "") String searchKeyword
		) {
		PageNavigator navi = dao.getNavi(boardID, currentPage, searchItem, searchKeyword);
		model.addAttribute("navi", navi);
		model.addAttribute("boardList", dao.getBoardList(boardID, navi, searchItem, searchKeyword));
		model.addAttribute("boardID", boardID);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchKeyword", searchKeyword);

		return "board/" + boardID;
	}

	@RequestMapping(value = "board/newRead", method = RequestMethod.GET)
	public String newRead(int boardNum) {
		dao.newRead(boardNum);

		return "redirect:/board/readBoard?boardNum=" + boardNum;
	}

	@RequestMapping(value = "board/readBoard", method = RequestMethod.GET)
	public String readBoard(int boardNum, Model model) {
		model.addAttribute("board", dao.readBoard(boardNum));
		model.addAttribute("replyList", replyDao.getReplyList(boardNum));

		return "board/readBoard";
	}

	@ResponseBody
	@RequestMapping(value = "board/like", method = RequestMethod.POST)
	public HashMap<String, Object> like(int boardNum, int button) {
		HashMap<String, Object> result = new HashMap<>();
		if (dao.like(boardNum, button)) {
			Board board = dao.readBoard(boardNum);
			result.put("result", true);
			result.put("likes", board.getLikes());
			result.put("dislikes", board.getDislikes());
		}

		return result;
	}

	@RequestMapping(value = "board/writeBoardForm", method = RequestMethod.GET)
	public String writeBoardForm(String boardID, Model model) {
		model.addAttribute("boardID", boardID);
		return "board/writeBoard";
	}

	@RequestMapping(value = "board/writeBoard", method = RequestMethod.POST)
	public String writeBoard(Board board, MultipartFile uploadFile, HttpSession session) {
		dao.writeBoard(board, uploadFile, session);
		return "redirect:/board/getBoardList?boardID=" + board.getBoardID();
	}

	@RequestMapping(value = "board/download", method = RequestMethod.GET)
	public void download(Board board, HttpServletResponse response) {
		dao.download(board, response);
	}

	@RequestMapping(value = "board/updateBoardForm", method = RequestMethod.GET)
	public String updateBoardForm(int boardNum, Model model) {
		model.addAttribute("board", dao.readBoard(boardNum));
		return "board/updateBoard";
	}

	@RequestMapping(value = "board/updateBoard", method = RequestMethod.POST)
	public String updateBoard(Board board, MultipartFile uploadFile, HttpSession session) {
		dao.updateBoard(board, uploadFile, session);
		return "redirect:/board/readBoard?boardNum=" + board.getBoardNum();
	}

	@RequestMapping(value = "board/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(Board board, HttpSession session) {
		board = dao.readBoard(board.getBoardNum());
		dao.deleteBoard(board, session);
		return "redirect:/board/getBoardList?boardID=" + board.getBoardID();
	}
}