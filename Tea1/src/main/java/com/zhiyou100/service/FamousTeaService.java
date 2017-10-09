package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.FamousTea;

public interface FamousTeaService {

List<FamousTea> listFamousTea();
	
	int updateFamousTea(int id);
	
	List<FamousTea> topEight();
}
