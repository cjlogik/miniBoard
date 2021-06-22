package com.sesoc.miniBoard.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.miniBoard.vo.Reply;

@Repository
public class ReplyDAO {
	@Autowired
	private SqlSession session;

	public ArrayList<Reply> getReplyList(int boardNum) {
		ArrayList<Reply> replyList = null;
		try {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			replyList = mapper.getReplyList(boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return replyList;
	}

	public boolean writeReply(Reply reply, HttpSession session) {
		reply.setUserID(session.getAttribute("userID").toString());
		int result = 0;
		try {
			ReplyMapper mapper = this.session.getMapper(ReplyMapper.class);
			result = mapper.writeReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result > 0;
	}

	public boolean updateReply(Reply reply, HttpSession session) {
		reply.setUserID(session.getAttribute("userID").toString());
		int result = 0;
		try {
			ReplyMapper mapper = this.session.getMapper(ReplyMapper.class);
			result = mapper.updateReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result > 0;
	}

	public boolean deleteReply(Reply reply, HttpSession session) {
		reply.setUserID(session.getAttribute("userID").toString());
		int result = 0;
		try {
			ReplyMapper mapper = this.session.getMapper(ReplyMapper.class);
			result = mapper.deleteReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result > 0;
	}
}