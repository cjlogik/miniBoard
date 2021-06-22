package com.sesoc.miniBoard;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.miniBoard.dao.ReplyDAO;
import com.sesoc.miniBoard.vo.Reply;

@Controller
public class ReplyController {
	@Autowired
	private ReplyDAO dao;

	@ResponseBody
	@RequestMapping(value = "reply/writeReply", method = RequestMethod.POST)
	public HashMap<String, Object> writeReply(Reply reply, HttpSession session) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("result", dao.writeReply(reply, session));
		result.put("replyList", dao.getReplyList(reply.getBoardNum()));
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "reply/updateReply", method = RequestMethod.POST)
	public HashMap<String, Object> updateReply (Reply reply, HttpSession session) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("result", dao.updateReply(reply, session));
		result.put("replyList", dao.getReplyList(reply.getBoardNum()));
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "reply/deleteReply", method = RequestMethod.GET)
	public HashMap<String, Object> deleteReply (Reply reply, HttpSession session) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("result", dao.deleteReply(reply, session));
		result.put("replyList", dao.getReplyList(reply.getBoardNum()));
		return result;
	}
}