package com.koreait.db;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MemberDAO {

	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public MemberDAO() {
		sqlsession = ssf.openSession(true);
		System.out.println("마이바티스 설정 성공!");
	}
	
	public int join(MemberDTO member) {
		HashMap<String, String> memberMap = new HashMap<>();
		memberMap.put("mem_userid", member.getUserid());
		memberMap.put("mem_userpw", member.getUserpw());
		memberMap.put("mem_name", member.getName());
		memberMap.put("mem_hp", member.getHp());
		memberMap.put("mem_email", member.getEmail());
		String hobbystr = "";
		for(String hobby: member.getHobby()) {
			hobbystr = hobbystr + hobby + " ";
		}
		memberMap.put("mem_hobby", hobbystr);
		memberMap.put("mem_ssn1", member.getSsn1());
		memberMap.put("mem_ssn2", member.getSsn2());
		memberMap.put("mem_zipcode", member.getZipcode());
		memberMap.put("mem_address1", member.getAddress1());
		memberMap.put("mem_address2", member.getAddress2());
		memberMap.put("mem_address3", member.getAddress3());
	
		return sqlsession.insert("Member.join", memberMap);
	}
	
	
	public MemberDTO login(MemberDTO member) {
		HashMap<String, String> memberMap = new HashMap<>();
		memberMap.put("mem_userid", member.getUserid());
		memberMap.put("mem_userpw", member.getUserpw());
		memberMap = sqlsession.selectOne("Member.login", memberMap);
		
		if(memberMap != null) {
			member.setName(memberMap.get("mem_name"));
			return member;
		}
		return null;
	}
	
	public MemberDTO info(MemberDTO member) {
		HashMap<String, String> memberMap = new HashMap<>();
		memberMap.put("mem_userid", member.getUserid());
		memberMap = sqlsession.selectOne("Member.info", memberMap);
		
		if(memberMap != null) {
			member.setIdx(Integer.parseInt(String.valueOf(memberMap.get("mem_idx"))));
			member.setName(memberMap.get("mem_name"));
			member.setHp(memberMap.get("mem_hp"));
			member.setEmail(memberMap.get("mem_email"));
			member.setHobby(memberMap.get("mem_hobby").split(" "));
			member.setSsn1(memberMap.get("mem_ssn1"));
			member.setSsn2(memberMap.get("mem_ssn2"));
			member.setZipcode(memberMap.get("mem_zipcode"));
			member.setAddress1(memberMap.get("mem_address1"));
			member.setAddress2(memberMap.get("mem_address2"));
			member.setAddress3(memberMap.get("mem_address3"));
			return member;
		}
		return null;
	}
	
	public boolean pwCheck(MemberDTO member) {
		HashMap<String, String> memberMap = new HashMap<>();
		memberMap.put("mem_userid", member.getUserid());
		memberMap.put("mem_userpw", member.getUserpw());
		
		memberMap = sqlsession.selectOne("Member.pwCheck", memberMap);
		if(memberMap != null) {
			return true;
		}
		return false;
	}
	
	public int edit(MemberDTO member) {
		HashMap<String, String> memberMap = new HashMap<>();
		memberMap.put("mem_userid", member.getUserid());
		memberMap.put("mem_name", member.getName());
		memberMap.put("mem_hp", member.getHp());
		memberMap.put("mem_email", member.getEmail());
		String hobbystr = "";
		for(String hobby: member.getHobby()) {
			hobbystr = hobbystr + hobby + " ";
		}
		memberMap.put("mem_hobby", hobbystr);
		memberMap.put("mem_zipcode", member.getZipcode());
		memberMap.put("mem_address1", member.getAddress1());
		memberMap.put("mem_address2", member.getAddress2());
		memberMap.put("mem_address3", member.getAddress3());
		
		return sqlsession.update("Member.edit", memberMap);
	}
	
	public boolean idCheck(MemberDTO member) {
		HashMap<String, String> memberMap = new HashMap<>();
		memberMap.put("mem_userid", member.getUserid());
		memberMap = sqlsession.selectOne("Member.idCheck", memberMap);
		if(memberMap !=null) {
			return true;
		}
		return false;
	}

}
