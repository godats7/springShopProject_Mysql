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
	public void goodsManageGet() throws Exception{
		 logger.info("상품관리 이동");
	}
	
	/* 상품 등록 이동 */
	@RequestMapping(value = "goodsEnroll", method = RequestMethod.GET)
	public void goodsEnrollGet() throws Exception{
		  logger.info("상품 등록 이동");
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
	
	@PostMapping("/imageEnroll")
	public String imageEnrollPost(ImageVO image, RedirectAttributes rttr) {

		logger.info("imageEnrollPost..........  " + image);
		
		adminService.imageEnroll(image);
		rttr.addFlashAttribute("enroll_result", image.getImageName());
				
		return "redirect:/admin/goodsManage";
	}
		
	@GetMapping("authorPop")
	public void authorPopGet() throws Exception{
		
		logger.info("authorPopGET.......");
		
	}
}
