package com.luckcloud.h5.util;


/**
     在执行分页查询时候，需要本类，在  DaoMapper 接口定义中需要本类， 用法如下：
   
   1、DaoMapper 接口中的使用请参考 GenericIBatisMapper 类的说明
   2、查询， 基本代码如下：
    
        Pagination<Data> page=new Pagination<Data>();
		pagination.setPageSize(10);
		pagination.setPaginationFlag(true);
		pagination.setPageNo(1);
		List<Data> l=dao.queryPage(page, new Data());
		System.out.println("本页行数="+l.size()+",总行数:"+page.getTotal());
		
 */

import java.io.Serializable;
import java.util.List;

public class Pagination<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    public static final int DEFAULT_PAGE_SIZE = 15;
    private int total;
    private int totalPage;
    private int pageNo;
    private int pageSize = 15;
    private boolean paginationFlag = false;
    private List<T> resultList;

    public int getTotal() {
        return this.total;
    }

    public void setTotal(int total) {
        this.total = total;
        this.totalPage = (int)Math.ceil((double)this.total / (double)this.pageSize);
    }

    public int getPageNo() {
        return this.pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public boolean isPaginationFlag() {
        return this.paginationFlag;
    }

    public void setPaginationFlag(boolean paginationFlag) {
        this.paginationFlag = paginationFlag;
    }

    public List<T> getResultList() {
        return this.resultList;
    }

    public void setResultList(List<T> resultList) {
        this.resultList = resultList;
    }

    public int getTotalPage() {
        return this.totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public String toString() {
        return "Pagination [total=" + this.total + ", totalPage=" + this.totalPage + ", pageNo=" + this.pageNo + ", pageSize=" + this.pageSize + ", paginationFlag=" + this.paginationFlag + ", resultList=" + this.resultList + "]";
    }
    
    public Page getPage(){
    	Page pg=new Page();
    	pg.setPageCount(this.getTotalPage());
    	pg.setPageNo(this.getPageNo());
    	pg.setPageSize(this.getPageSize());
    	pg.setStartIndex((this.getPageNo()-1)*this.getPageSize());
    	pg.setTotalCount(this.getTotal());
    	return pg;
    }
}
