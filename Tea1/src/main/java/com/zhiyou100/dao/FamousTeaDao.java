package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.FamousTea;

public interface FamousTeaDao {

	List<FamousTea> listFamousTea();
	
	int updateFamousTea(int id);
	
	List<FamousTea> topEight();
}
