package org.zerock.Mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private Long[] bnoArr = { 218L,217L,216L,215L,214L};
	
	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void testCreate() {
		
		IntStream.range(1, 10).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글 테스트" + i);
			vo.setReplyer("replyer"+i);
			
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testRead() {
		
		Long targetRno = 5L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
		
	}
	
	@Test
	public void testDelete() {
		
		Long targetRno = 1L;
		
		mapper.delete(targetRno);
		
	}
	
	@Test
	public void testUpdate() {
		
		Long targetRno = 9L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("Update Reply ");

		int count = mapper.update(vo);
		
		log.info("------------------------------UPDATE COUNNT:"+count);
	}
	
    @Test
    public void testMapper() {
            log.info("Mapper: " + mapper.toString());

    }
    
    @Test
    public void testList() {
    	Criteria cri = new Criteria();
    	List<ReplyVO> repliesList = mapper.getListWithPaging(cri, bnoArr[0]);
    	
    	repliesList.forEach(reply -> log.info(reply));
    }
	
}
