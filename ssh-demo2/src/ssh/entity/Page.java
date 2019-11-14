package ssh.entity;

import java.util.List;

public class Page<E> {
	//呈現分頁後應有的清單
	private List<E> list;
	//數據總數
	private int totalRecord;
	//目前頁面的No
	private int pageNo;
	//每一頁要呈現多少數據
	private int pageSize;
	
	/**
	 * 	應有的總頁面數
	 * */
	public int getTotalPage() {
		int total = (totalRecord + pageSize - 1 )/pageSize;
		return total;
	}
	
	/**
	 * 	當前的 offset,之後要放入Hibernate setFirstResult 內
	 * */
	public int countOffset(int currentPage,int pageSize) {
		int offset = pageSize*(currentPage-1);
		return offset;
	}
	
	/**
	 * 	首頁
	 * */
	public int getTopPageNo() {
		return 1;
	}
	
	/**
	 * 	末頁
	 * */
	public int getLastPageNo() {
		return getTotalPage();
	}
	/**
	 * 	上一頁
	 * 
	 * */
	public int getPreviousPageNo() {
		if(pageNo<=1) {
			return 1;
		}
		return pageNo-1;
	}
	
	/**
	 * 	 下一頁
	 * */
	public int getNextPageNo() {
		if(pageNo>=getLastPageNo()) {
			return getLastPageNo();
		}
		return pageNo+1;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
