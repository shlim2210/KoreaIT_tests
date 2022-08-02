package com.koreait.board;

import com.koreait.db.BoardDAO;
import com.koreait.db.BoardDTO;
import com.koreait.db.ReplyDAO;
import com.koreait.db.ReplyDTO;

public class Data {
	BoardDAO boardDAO = null;
	ReplyDAO replyDAO = null;
	
	public Data() {
		boardDAO = new BoardDAO();
		replyDAO = new ReplyDAO();
	}
	
	public int prepare(String userid, String name, String title, String content) {
		BoardDTO boardDTO = new BoardDTO();
		
		boardDTO.setB_userid(userid);
		boardDTO.setB_name(name);
		boardDTO.setB_title(title);
		boardDTO.setB_content(content);
		
		int isSuccess = boardDAO.write(boardDTO);
		return isSuccess;
	}

	public int repl(String re_userid, String re_name, String re_content, int re_boardidx) {
		ReplyDTO replyDTO = new ReplyDTO();
		
		replyDTO.setRe_userid(re_userid);
		replyDTO.setRe_name(re_name);
		replyDTO.setRe_content(re_content);
		replyDTO.setRe_boardidx(re_boardidx);
		
		int isSuccess = replyDAO.reWrite(replyDTO);
		return isSuccess;
	}
	
	
}
