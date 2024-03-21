package org.zerock.mapper;

import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long rno);
	
	public int delete(Long targetRno);
	
	public int update(ReplyVO reply);
}
