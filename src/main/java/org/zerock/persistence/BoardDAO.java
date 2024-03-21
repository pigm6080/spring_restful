package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardDAO {
	
	public void create(BoardVO vo) throws Exception;
	
	public BoardVO read(long bno) throws Exception;

	public void update(BoardVO vo) throws Exception;
	
	public void delete(Long bno) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
}
