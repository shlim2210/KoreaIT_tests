package com.koreait.db;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ReplyDAO {
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public ReplyDAO() {
		sqlsession = ssf.openSession(true);
	}
	
	
	public ArrayList<ReplyDTO> reList(ReplyDTO replyDTO) {
		ArrayList<ReplyDTO> reList = new ArrayList<>();
		HashMap<String, String> replyMap = new HashMap<>();

		int i = 0;
		while(true) {
			replyMap.put("re_boardidx", String.valueOf(replyDTO.getRe_boardidx()));
			replyMap.put("i", String.valueOf(i));
			replyMap = sqlsession.selectOne("Reply.reList", replyMap);
			if(replyMap != null) {
				ReplyDTO reply = new ReplyDTO();
				reply.setRe_idx(Integer.parseInt(String.valueOf(replyMap.get("re_idx"))));
				reply.setRe_userid(replyMap.get("re_userid"));
				reply.setRe_name(replyMap.get("re_name"));
				reply.setRe_content(replyMap.get("re_content"));
				reply.setRe_regdate(String.valueOf(replyMap.get("re_regdate")));
				reList.add(reply);
				i++;
			}else {
				break;
			}
		}
		return reList;
	}

	public int reWrite(ReplyDTO replyDTO) {
		HashMap<String, String> replyMap = new HashMap<>();
		replyMap.put("re_userid", replyDTO.getRe_userid());
		replyMap.put("re_name", replyDTO.getRe_name());
		replyMap.put("re_content", replyDTO.getRe_content());
		replyMap.put("re_boardidx", String.valueOf(replyDTO.getRe_boardidx()));
		
		return sqlsession.insert("Reply.write", replyMap);
	}
	
	public int reDelete(ReplyDTO replyDTO) {
		HashMap<String, String> boardMap = new HashMap<>();
		boardMap.put("re_idx", String.valueOf(replyDTO.getRe_idx()));
		
		return sqlsession.delete("Reply.reDelete", boardMap);
	}
	
	
}
