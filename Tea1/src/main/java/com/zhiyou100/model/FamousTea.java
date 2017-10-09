package com.zhiyou100.model;

public class FamousTea {

	private Integer id;

	private String name;

	private Integer poll;

	private String imageUrl;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPoll() {
		return poll;
	}

	public void setPoll(Integer poll) {
		this.poll = poll;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImage_url(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		return "FamousTea [id=" + id + ", name=" + name + ", poll=" + poll + ", imageUrl=" + imageUrl + "]";
	}


}
