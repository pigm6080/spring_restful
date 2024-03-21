package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;
import org.zerock.persistence.BoardDAO;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {
		
		log.info("register입니다 !!!...."+board);
		
		mapper.insert(board);
		
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		log.info("get..입니당 !!" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("remove..입니당 !!" + board);
		return mapper.update(board);
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove입니당 !!" + bno);
		return mapper.delete(bno);
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList-----입니당 !!!");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count ---");
		return mapper.getTotalCount(cri);
	}

	

}
