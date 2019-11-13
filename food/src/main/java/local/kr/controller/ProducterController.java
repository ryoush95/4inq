package local.kr.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import local.kr.domain.ProducterVO;
import local.kr.service.ProducterService;

@Controller
@RequestMapping("/producter/*")
public class ProducterController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

	@Inject
	ProducterService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getproducterList(Model model) throws Exception {
		logger.info("get producter list");

		List<ProducterVO> list = service.producterList();

		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int pnum, Model model) throws Exception {
		logger.info("get view");

		ProducterVO view = service.producterView(pnum);
		
		model.addAttribute("view", view);

//		List<ReviewListVO> review = service.reviewList(pdNum);
//		model.addAttribute("review", review);
	}
}
