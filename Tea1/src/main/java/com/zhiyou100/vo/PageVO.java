package com.zhiyou100.vo;

public class PageVO {

	private Integer pageIndex;

	private Integer pageSize;

	private Integer sortType;

	public Integer getPageIndex() {
		return (pageIndex-1)*pageSize;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getSortType() {
		return sortType;
	}

	public void setSortType(Integer sortType) {
		this.sortType = sortType;
	}

	@Override
	public String toString() {
		return "PageVO [pageIndex=" + pageIndex + ", pageSize=" + pageSize + ", sortType=" + sortType + "]";
	}



}
