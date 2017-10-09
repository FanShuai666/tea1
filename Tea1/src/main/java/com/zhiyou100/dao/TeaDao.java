package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.Tea;
import com.zhiyou100.vo.PageVO;

public interface TeaDao {
	
	Tea getTea(int id);

	int saveTea(Tea tea);
	
	int listCount();
	
	int getCountByGrade(int grade);
	
	List<Tea> listTea(PageVO pageVO);
}
