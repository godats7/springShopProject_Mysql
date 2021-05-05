package com.lwj.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lwj.model.AuthorVO;
import com.lwj.model.Criteria;
import com.lwj.model.ImageVO;
import com.lwj.model.PageDTO;
import com.lwj.service.AdminService;
import com.lwj.service.AuthorService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AuthorService authorService;
	
	@Autowired
	private AdminService adminService;
		
	
	
	/* 메인페이지 이동 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void adminMainGet() throws Exception{
		
		logger.info("메인 페이지 이동");
	}

	/* 상품 관리 이동 */
	@RequestMapping(value = "goodsManage", method = RequestMethod.GET)
	public void goodsManageGet(Criteria criteria, Model model) throws Exception{
		 logger.info("상품관리 이동");
		 
		 /* 상품 리스트 데이터 */
			List list = adminService.goodsGetList(criteria);
			
			if(!list.isEmpty()) {
				model.addAttribute("list", list);
			} else {
				model.addAttribute("listCheck", "empty");
				return;
			}
			
			/* 페이지 인터페이스 데이터 */
			model.addAttribute("pageMaker", new PageDTO(criteria, adminService.goodsGetTotal(criteria)));
	}
	
	/* 상품 등록 이동 */
	@RequestMapping(value = "goodsEnroll", method = RequestMethod.GET)
	public void goodsEnrollGet(Model model) throws Exception{
		  logger.info("상품 등록 이동");
		  
		  ObjectMapper objm = new ObjectMapper();
		/* 카테고리 리스트 데이터 반환 */
		  List list = adminService.catList();
		  
		  String catList =objm.writeValueAsString(list);
		  
		  model.addAttribute("catList",catList);
		  
		  logger.info("변경 전.........." + list);
          logger.info("변경 후.........." + catList);
	}
	
	/* 작가 관리 이동*/
	@RequestMapping(value = "authorManage", method = RequestMethod.GET)
	public void authorManageGet(Criteria criteria, Model model) throws Exception{
		logger.info("작가관리 이동");
		logger.info("작가 관리 페이지 접속.........." + criteria);
        
        /* 작가 목록 출력 데이터 */
        List list = authorService.authorGetList(criteria);
        
//        model.addAttribute("list", list);
        
        if(!list.isEmpty()) {
			model.addAttribute("list",list);	// 작가 존재 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 작가 존재하지 않을 경우
		}
        
		/* 페이지 이동 인터페이스 데이터 */
        int total = authorService.authorGetTotal(criteria);        
        PageDTO pageMaker = new PageDTO(criteria, total);
        
        model.addAttribute("pageMaker", pageMaker);      
//        model.addAttribute("pageMaker", new PageDTO(criteria, authorService.authorGetTotal(criteria)));
	}
	
	/* 작가 등록 이동 */
	@RequestMapping(value = "authorEnroll", method = RequestMethod.GET)
	public void authorEnrollGet() throws Exception{
		logger.info("작가 등록 이동 ");
	}
	
	@RequestMapping(value = "authorEnroll.do", method = RequestMethod.POST)
	public String authorEnrollPost(AuthorVO author, RedirectAttributes rttr) throws Exception{
		
		logger.info("authorEnroll in : " + author);
		authorService.authorEnroll(author);      // 작가 등록 쿼리 수행
		rttr.addFlashAttribute("enroll_result : ", author.getAuthorName());
        
        return "redirect:/admin/authorManage";
		
	}

	/* 작가상세페이지 */
	@GetMapping({"/authorDetail", "/authorModify"})
	public void authorDetailGet(int authorId, Criteria criteria, Model model) throws Exception{
		
		logger.info("authorDetail......." + authorId);
		
		/* 작가 관리 페이지 정보 */
		model.addAttribute("criteria", criteria);
		
		/* 선택 작가 정보 */
		model.addAttribute("authorInfo", authorService.authorGetDetail(authorId));
		
	}
	
	/* 작가 수정 */
	@PostMapping("/authorModify")
	public String authorModifyPost(AuthorVO author, RedirectAttributes rttr) throws Exception{
		
		logger.info("authorModifyPOST......." + author);
		
		int result = authorService.authorModify(author);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/authorManage";
		
	}
	
	/* 상품(이미지 등록) */
	@PostMapping("/imageEnroll")
	public String imageEnrollPost(ImageVO image, RedirectAttributes rttr) {

		logger.info("imageEnrollPost..........  " + image);
		
		adminService.imageEnroll(image);
		rttr.addFlashAttribute("enroll_result", image.getImageName());
				
		return "redirect:/admin/goodsManage";
	}

	/* 작가검색윈도우팝업 */
	@GetMapping("authorPop")
	public void authorPopGet(Criteria criteria, Model model) throws Exception{
		
		logger.info("authorPopGET.......");
		
		criteria.setAmount(5);
		
		/* 게시물 출력 데이터 */
		List list = authorService.authorGetList(criteria);
		
		if(!list.isEmpty()) {
			model.addAttribute("list",list);	// 작가 존재 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 작가 존재하지 않을 경우
		}
		
		
		/* 페이지 이동 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(criteria, authorService.authorGetTotal(criteria)));
		
	}
	
	/* 상품 조회 페이지 */
	@GetMapping({"/goodsDetail", "/goodsModify"})
	public void goodsGetInfoGET(int imageId, Criteria criteria, Model model) throws JsonProcessingException {
		
		logger.info("goodsGetInfo()........." + imageId);
		ObjectMapper mapper = new ObjectMapper();
		
		/* 카테고리 리스트 데이터 */
		model.addAttribute("catList", mapper.writeValueAsString(adminService.catList()));
		
		/* 목록 페이지 조건 정보 */
		model.addAttribute("criteria", criteria);
		
		/* 조회 페이지 정보 */
		model.addAttribute("goodsInfo", adminService.goodsGetDetail(imageId));
		
	}
	
	/* 상품 정보 수정 */
	@PostMapping("/goodsModify")
	public String goodsModifyPOST(ImageVO image, RedirectAttributes rttr) {
		
		logger.info("goodsModifyPOST.........." + image);
		
		int result = adminService.goodsModify(image);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/goodsManage";		
		
	}
	
	
	
	
}
