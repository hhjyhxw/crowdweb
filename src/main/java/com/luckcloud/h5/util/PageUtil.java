package com.luckcloud.h5.util;

public class PageUtil {
	private int currPage = 1; // 当前页
	private int totalPage;    // 总页数
	private int prePage;      // 上一页
	private int nextPage;     // 下一页
	private int totalNum;     // 总记录数
	private int pageSize=15;  // 每页记录数
	private int startRow;     // 查询开始记录数
	private int endRow;       // 查询结束记录数

	 public PageUtil() {
	
	 }

	public void setPageUtil(int totalNun, int currPage, int pageSize) {
		this.totalNum = totalNun;
		this.currPage = currPage;
		this.pageSize = pageSize;
		setTotalPage(this.totalNum, this.pageSize);
		setCurrPage(this.currPage, this.totalPage);
		setPrePage(this.currPage, this.totalPage);
		setNextPage(this.currPage, this.totalPage);
		setStartRow(this.currPage, this.pageSize);
		setEndRow(this.currPage , this.pageSize);

	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int ge) {
		this.currPage = ge;
	}
	public void setCurrPage(String currPage) {
		try{
			if(currPage!=null&&currPage.matches("[0-9]*"))
			this.currPage=Integer.valueOf(currPage);
		}catch(Exception e){
			e.printStackTrace();
		}		
	}

	public void setCurrPage(int currPage, int totalPage) {
		this.currPage = currPage > totalPage ? totalPage : currPage < 0 ? 1
				: currPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public void setTotalPage(int totalNum, int pageSize) {
		this.totalPage = totalNum % pageSize == 0 ? totalNum / pageSize
				: totalNum / pageSize + 1;
	}

	public int getPrePage() {
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public void setPrePage(int currPage, int totalPage) {
		if(currPage>1){
			this.prePage =currPage - 1;
		}else{
			this.prePage =1;
		}
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public void setNextPage(int currPage, int totalPage) {
		this.nextPage = currPage >= totalPage ? totalPage
				: currPage <= 0 ? totalPage > 1 ? 2 : 1 : currPage + 1;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageSize(String pageSize) {
		try{
			if(pageSize!=null&&pageSize.matches("[0-9]*")){
				int pagesize=Integer.valueOf(pageSize);
				if(pagesize>0){
					this.pageSize=pagesize;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}	
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public void setStartRow(int currPage, int pageSize) {
		this.startRow = (currPage - 1) * pageSize;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public void setEndRow(int currPage, int pageSize) {
		this.endRow = currPage * pageSize >= this.totalNum ? this.totalNum
				: currPage * pageSize;
	}

}
