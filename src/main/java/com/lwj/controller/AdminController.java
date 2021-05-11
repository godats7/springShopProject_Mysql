package com.lwj.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
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
	public void goodsGetInfoGet(int imageId, Criteria criteria, Model model) throws JsonProcessingException {
		
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
	public String goodsModifyPost(ImageVO image, RedirectAttributes rttr) {
		
		logger.info("goodsModifyPOST.........." + image);
		
		int result = adminService.goodsModify(image);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/goodsManage";		
		
	}
	
	/* 상품정보 삭제 */	
	@PostMapping("/goodsDelete")
	public String goodsDeletePost(int imageId, RedirectAttributes rttr) {
		logger.info("goodsDeletePost......");
		int result = adminService.goodsDelete(imageId);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/goodsManage";
	}
	
	/* 작가 정보 삭제 */
	@PostMapping("/authorDelete")
	public String authorDeletePost(int authorId, RedirectAttributes rttr) {
		
		logger.info("authorDeletePost..........");
		
		int result = 0;
		
		try {
			
			result = authorService.authorDelete(authorId);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/admin/authorManage";
			
		}
		
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/authorManage";
		
	}
	
	/* 첨부 파일 업로드 */
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxActionPost(MultipartFile[] uploadFile) {
		
		logger.info("uploadAjaxActionPost..........");
		String uploadFolder = "C:\\upload";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		/* 날짜 및 폴더 경로 */
		Date date = new Date();		
		String str = sdf.format(date);		
		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
//		logger.info("파일 이름 : " + uploadFile.getOriginalFilename());
//		logger.info("파일 타입 : " + uploadFile.getContentType());
//		logger.info("파일 크기 : " + uploadFile.getSize());

		// 향상된 for
				for(MultipartFile multipartFile : uploadFile) {
					logger.info("-----------------------------------------------");
					logger.info("파일 이름 : " + multipartFile.getOriginalFilename());
					logger.info("파일 타입 : " + multipartFile.getContentType());
					logger.info("파일 크기 : " + multipartFile.getSize());			
				}
				
//				//기본 for
//				for(int i = 0; i < uploadFile.length; i++) {
//					logger.info("-----------------------------------------------");
//					logger.info("파일 이름 : " + uploadFile[i].getOriginalFilename());
//					logger.info("파일 타입 : " + uploadFile[i].getContentType());
//					logger.info("파일 크기 : " + uploadFile[i].getSize());			
//				}
	}
	
	
	
	
}
