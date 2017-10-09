package com.zhiyou100.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.zhiyou100.model.FamousTea;
import com.zhiyou100.service.FamousTeaService;
import com.zhiyou100.vo.ResponseVO;

@RestController
public class FamousTeaController {

	@Autowired
	private FamousTeaService service;

	@RequestMapping(path = "/listFamousTea", method = RequestMethod.GET)
	public ResponseVO<List<FamousTea>> listFamousTea(){
		return new ResponseVO<List<FamousTea>>(1, "查询成功", service.listFamousTea());
	}

	@RequestMapping(path = "/topEightFamousTea", method = RequestMethod.GET)
	public ResponseVO<List<FamousTea>> topEightFamousTea(){
		return new ResponseVO<List<FamousTea>>(1, "查询成功", service.topEight());
	}

	@RequestMapping(path = "/updateFamousTea/{id}", method = RequestMethod.GET)
	public ResponseVO<Integer> updateFamousTea(@PathVariable("id") int id){
		if (service.updateFamousTea(id) == 1) {
			return new ResponseVO<Integer>(1, "投票成功", null);
		}else {
			return new ResponseVO<Integer>(-1, "投票失败", null);
		}

	}
}
