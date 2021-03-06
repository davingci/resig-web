/**
 *@author huangdongxu
 *@Date Nov 12, 2017
*/

package org.davingci.resig.web.util;



public class ResponseUtil {

	private static final long serialVersionUID = 1L;

	private int  code;
	private Object data;
	private String message;
	
	public ResponseUtil() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResponseUtil(int code, Object data, String message) {
		super();
		this.code = code;
		this.data = data;
		this.message = message;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	public ResponseUtil code(int code) {
		this.code = code;
		return this;
	}
	
	public ResponseUtil data(Object data) {
		this.data = data;
		return this;
	}
	
	public ResponseUtil message(String message) {
		this.message = message;
		return this;
	}
}
