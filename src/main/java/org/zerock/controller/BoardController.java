package org.zerock.controller;

import org.apache.ibatis.javassist.expr.NewArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	@Autowired
	private final BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list" + cri);
		//여기서 전체 데이터를 대상으로 검색하기 떄문에 페이지 로드에 오래걸리걸로 예상된다..
		model.addAttribute("list",service.getList(cri));
		
		log.info(service.getList(cri));
		///model.addAttribute("pageMaker",new PageDTO(cri,123));
		
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker" , new PageDTO(cri, total));
		
		log.info(new PageDTO(cri,total));
		
	}
	@GetMapping("/register")
	public String register() {
		
		return "/board/register";
	}
	@PostMapping("/register")
	public String register(BoardVO boardVO , RedirectAttributes rttr) {
		log.info(boardVO);
		
		service.register(boardVO);
		
		rttr.addFlashAttribute("result", boardVO.getBno());
		
		return "redirect:/board/list";
		
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno,@ModelAttribute("cri") Criteria cri , Model model) {
		
		log.info("/get ,/modify 까지 왔음");
		
		model.addAttribute("board",service.get(bno));
		
		log.info("/get ,modify 성공"+service.get(bno));
	}
	
	@PostMapping("/modify") //RedirectAttributes리다이렉트후에도 데이터를 유지랑수 있도록하는인터페이스다
	public String modify(BoardVO boardVO ,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify 당 !! ~~" + boardVO);
		
		if(service.modify(boardVO)) {
			rttr.addFlashAttribute("result" , "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list" + cri.getListLink() ;
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno ,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
	
		log.info("remove당 !!!!! " + bno);
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list" + cri.getListLink();
	}
	
	
}
