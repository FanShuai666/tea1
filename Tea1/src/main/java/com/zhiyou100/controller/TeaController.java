package com.zhiyou100.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zhiyou100.model.Tea;
import com.zhiyou100.service.TeaService;
import com.zhiyou100.vo.PageVO;
import com.zhiyou100.vo.QueryVO;
import com.zhiyou100.vo.ResponseVO;
import com.zhiyou100.vo.SimilarityVO;
@RestController
public class TeaController {

	@Autowired
	private TeaService service;

	@RequestMapping(path = "/addTea", method = RequestMethod.POST)
	public ResponseVO<SimilarityVO> addTea(@RequestBody Tea tea){
		SimilarityVO similarityVO = service.saveTea(tea);
		if (similarityVO.getResult() == 1) {
			return new ResponseVO<SimilarityVO>(1, "添加成功", similarityVO);
		}else {
			return new ResponseVO<SimilarityVO>(-1, "添加失败", null);
		}
	}

	@RequestMapping(path = "/statisticsTea", method = RequestMethod.GET)
	public ResponseVO<Integer[]> statisticsTea(){
		return new ResponseVO<Integer[]>(1, "统计成功", service.statisticsTea());
	}

	@RequestMapping(path = "/sortTea", method = RequestMethod.POST)
	public ResponseVO<QueryVO> sortTea(@RequestBody PageVO pageVO){

		return new ResponseVO<QueryVO>(1, "查询成功", service.listTea(pageVO));
	}

	@RequestMapping(path = "/getTea/{id}", method = RequestMethod.GET)
	public ResponseVO<Tea> getTea(@PathVariable("id") int id){
		return new ResponseVO<Tea>(1, "查询成功", service.getTea(id));
	}
}
