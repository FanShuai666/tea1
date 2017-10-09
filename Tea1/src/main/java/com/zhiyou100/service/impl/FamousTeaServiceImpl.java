package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.FamousTeaDao;
import com.zhiyou100.model.FamousTea;
import com.zhiyou100.service.FamousTeaService;
@Service
public class FamousTeaServiceImpl implements FamousTeaService{
	
	@Autowired
	private FamousTeaDao dao;

	public List<FamousTea> listFamousTea() {
		return dao.listFamousTea();
	}

	public int updateFamousTea(int id) {
		return dao.updateFamousTea(id);
	}

	public List<FamousTea> topEight() {
		return dao.topEight();
	}

}
