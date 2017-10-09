package com.zhiyou100.service;

import com.zhiyou100.model.Tea;
import com.zhiyou100.vo.PageVO;
import com.zhiyou100.vo.QueryVO;
import com.zhiyou100.vo.SimilarityVO;

public interface TeaService {

	QueryVO listTea(PageVO pageVO);
	
	SimilarityVO saveTea(Tea tea);
	
	Integer[] statisticsTea();
	
	Tea getTea(int id);
	
}
