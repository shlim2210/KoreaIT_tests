package com.koreait.db;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class BoardDAO {
	
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public BoardDAO() {
		sqlsession = ssf.openSession(true);
	}
	
	public int write(BoardDTO boardDTO) {
		HashMap<String, String> boardMap = new HashMap<>();
		boardMap.put("b_userid", boardDTO.getB_userid());
		boardMap.put("b_name", boardDTO.getB_name());
		boardMap.put("b_title", boardDTO.getB_title());
		boardMap.put("b_content", boardDTO.getB_content());
		System.out.println(boardDTO.getB_title());
		return sqlsession.insert("Board.write", boardMap);
	}
	
	public ArrayList<BoardDTO> boardList(int start, int pagePerCount){
		ArrayList<BoardDTO> boardList = new ArrayList();
		HashMap<String, String> boardMap = new HashMap<>();
		
		for (int i = start; i < start+pagePerCount; i++) {
			boardMap.put("start", String.valueOf(i));
			boardMap = sqlsession.selectOne("Board.list", boardMap);

			if(boardMap != null) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setB_idx(Integer.parseInt(String.valueOf(boardMap.get("b_idx"))));
				boardDTO.setB_userid(boardMap.get("b_userid"));
				boardDTO.setB_name(boardMap.get("b_name"));
				boardDTO.setB_title(boardMap.get("b_title"));
				boardDTO.setB_content(boardMap.get("b_content"));
				boardDTO.setB_hit(Integer.parseInt(String.valueOf(boardMap.get("b_hit"))));	
				boardDTO.setB_regdate(String.valueOf(boardMap.get("b_regdate")).substring(0, 10));
				boardList.add(boardDTO);
				
			}else {
				break;
			}
		}
		return boardList;
	}
	

	public int totalCount() {
		HashMap<String, String> boardMap = new HashMap<>();
		int totalCount = 0;
		boardMap = sqlsession.selectOne("Board.count", boardMap);
		
		if(boardMap != null) {
			totalCount = Integer.parseInt(String.valueOf(boardMap.get("total")));
		}
		return totalCount;
	}
	
	public int updateHit(BoardDTO boardDTO) {
		HashMap<String, Integer> boardMap = new HashMap<>();
		boardMap.put("b_idx", boardDTO.getB_idx());

		return sqlsession.update("Board.updateHit", boardMap);
	}
	
	public BoardDTO view(BoardDTO boardDTO) {
		HashMap<String, String> boardMap = new HashMap<>();
		boardMap.put("b_idx", String.valueOf(boardDTO.getB_idx()));
		boardMap = sqlsession.selectOne("Board.view", boardMap);
		
		if(boardMap != null) {
			boardDTO.setB_userid(boardMap.get("b_userid"));
			boardDTO.setB_name(boardMap.get("b_name"));
			boardDTO.setB_title(boardMap.get("b_title"));
			boardDTO.setB_content(boardMap.get("b_content"));
			boardDTO.setB_hit(Integer.parseInt(String.valueOf(boardMap.get("b_hit"))));	
			boardDTO.setB_regdate(String.valueOf(boardMap.get("b_regdate")));
		}
		return boardDTO;
	}
	
	public int edit(BoardDTO boardDTO) {
		HashMap<String, String> boardMap = new HashMap<>();
		boardMap.put("b_idx", String.valueOf(boardDTO.getB_idx()));
		boardMap.put("b_title", boardDTO.getB_title());
		boardMap.put("b_content", boardDTO.getB_content());
		
		return sqlsession.update("Board.edit", boardMap);
	}
	
	public int delete(BoardDTO boardDTO, ReplyDTO replyDTO) {
		HashMap<String, String> boardMap = new HashMap<>();
		boardMap.put("re_boardidx", String.valueOf(replyDTO.getRe_boardidx()));
		sqlsession.delete("Reply.delete", boardMap);
		boardMap.put("b_idx", String.valueOf(boardDTO.getB_idx()));
		
		return sqlsession.delete("Board.delete", boardMap);
	}

	
}
