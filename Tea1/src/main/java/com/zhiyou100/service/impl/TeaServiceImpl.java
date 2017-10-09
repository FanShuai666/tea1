package com.zhiyou100.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.TeaDao;
import com.zhiyou100.model.Tea;
import com.zhiyou100.service.TeaService;
import com.zhiyou100.vo.PageVO;
import com.zhiyou100.vo.QueryVO;
import com.zhiyou100.vo.SimilarityVO;
@Service
public class TeaServiceImpl implements TeaService{

	@Autowired
	private TeaDao dao;

	public QueryVO listTea(PageVO pageVO) {

		int pageIndex = pageVO.getPageIndex();

		int n = dao.listCount();

		int m = pageVO.getPageSize();

		int pageCount = (n+m-1)/m;

		List<Tea> teas = dao.listTea(pageVO);

		return new QueryVO(pageIndex, pageCount, teas);
	}

	public SimilarityVO saveTea(Tea tea) {

		List<Float[]> standard = new ArrayList<Float[]>();

		String[] strings = {"特一级","特二级","特三级","一级","二级","三级","四级"};

		Float[] t0 = {1f,0.9f,0.9f,0.9f,1f,1f,0.9f};
		Float[] t1 = {0.9f,0.8f,0.9f,0.9f,0.9f,0.9f,0.8f};
		Float[] t2 = {0.8f,0.7f,0.9f,0.8f,0.8f,0.7f,0.7f};
		Float[] t3 = {0.6f,0.5f,0.7f,0.6f,0.7f,0.7f,0.6f};
		Float[] t4 = {0.5f,0.4f,0.5f,0.5f,0.6f,0.6f,0.4f};
		Float[] t5 = {0.4f,0.3f,0.5f,0.4f,0.5f,0.5f,0.4f};
		Float[] t6 = {0.3f,0.2f,0.5f,0.2f,0.3f,0.3f,0.2f};
		standard.add(0, t0);
		standard.add(1, t1);
		standard.add(2, t2);
		standard.add(3, t3);
		standard.add(4, t4);
		standard.add(5, t5);
		standard.add(6, t6);

		float[] similar = new float[7];
		for (int i = 0; i < standard.size(); i ++) {
			Float[] standar = standard.get(i);
			float x1 = tea.getShape();
			float y1 = standar[0];
			float x2 = tea.getColour();
			float y2 = standar[1];
			float x3 = tea.getNeatness();
			float y3 = standar[2];
			float x4 = tea.getMatching();
			float y4 = standar[3];
			float x5 = tea.getFragrance();
			float y5 = standar[4];
			float x6 = tea.getTaste();
			float y6 = standar[5];
			float x7 = tea.getLeaf();
			float y7 = standar[6];
			float a1 = x1 < y1 ? x1 : y1;
			float a2 = x2 < y2 ? x2 : y2;
			float a3 = x3 < y3 ? x3 : y3;
			float a4 = x4 < y4 ? x4 : y4;
			float a5 = x5 < y5 ? x5 : y5;
			float a6 = x6 < y6 ? x6 : y6;
			float a7 = x7 < y7 ? x7 : y7;
			similar[i] = 2.0f*(a1+a2+a3+a4+a5+a6+a7)/(x1+y1+x2+y2+x3+y3+x4+y4+x5+y5+x6+y6+x7+y7);
		}

		float max = similar[0];
		int index = 0;
		for (int i = 0; i < similar.length; i++) {
			max = max > similar[i] ? max : similar[i];
			index = max > similar[i] ? index : i;
		}

		tea.setGrade(index);

		return new SimilarityVO(dao.saveTea(tea), similar, strings[index]);
	}

	public Integer[] statisticsTea() {

		Integer[] numbers = new Integer[7];
		for (int i = 0; i < numbers.length; i ++) {
			numbers[i] = dao.getCountByGrade(i);
		}
		return numbers;
	}

	public Tea getTea(int id) {
		return dao.getTea(id);
	}
}
