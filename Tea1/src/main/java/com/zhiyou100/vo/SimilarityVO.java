package com.zhiyou100.vo;

import java.util.Arrays;

public class SimilarityVO {


	@Override
	public String toString() {
		return "SimilarityVO [result=" + result + ", similar=" + Arrays.toString(similar) + ", level=" + level + "]";
	}

	private int result;

	private float[] similar;

	private String level;


	public SimilarityVO() {
		super();
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public SimilarityVO(int result, float[] similar, String level) {
		super();
		this.result = result;
		this.similar = similar;
		this.level = level;
	}

	public float[] getSimilar() {
		return similar;
	}

	public void setSimilar(float[] similar) {
		this.similar = similar;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

}
