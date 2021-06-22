package com.sesoc.miniBoard.dao;

import java.util.ArrayList;

import com.sesoc.miniBoard.vo.Reply;

public interface ReplyMapper {

	ArrayList<Reply> getReplyList(int boardNum);

	int writeReply(Reply reply);

	int updateReply(Reply reply);

	int deleteReply(Reply reply);
}