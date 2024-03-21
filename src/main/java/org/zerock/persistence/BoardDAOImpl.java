package org.zerock.persistence;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	private final SqlSessionTemplate sql;
	
	private static String namespace = "org.zerock.mapper.BoardMapper";
	@Override
	public void create(BoardVO vo) throws Exception {
		System.out.println("Create boardVO = " + vo);
		sql.insert( namespace +".create",vo);
		
	}

	@Override
	public BoardVO read(long bno) throws Exception {
		System.out.println("Read boardVO = " + bno);
		return sql.selectOne(namespace + ".read" , bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		System.out.println("update boardVO = " + vo);
		sql.update(namespace + ".update" , vo);
	}

	@Override
	public void delete(Long bno) throws Exception {
		sql.delete(namespace+".delete", bno);
		
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".listAll");
	}

}
