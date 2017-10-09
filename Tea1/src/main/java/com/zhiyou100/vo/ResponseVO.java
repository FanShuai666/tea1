package com.zhiyou100.vo;

public class ResponseVO<T>{

	private Integer errorCode;

	private String message;

	private T data;

	public ResponseVO() {
		super();
	}

	public ResponseVO(Integer errorCode, String message, T data) {
		super();
		this.errorCode = errorCode;
		this.message = message;
		this.data = data;
	}

	public Integer getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(Integer errorCode) {
		this.errorCode = errorCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "ResponseVO [errorCode=" + errorCode + ", message=" + message + ", data=" + data + "]";
	}

}
