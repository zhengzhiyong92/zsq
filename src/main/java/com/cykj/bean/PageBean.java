package com.cykj.bean;

import java.util.List;

public class PageBean<T> {
    private int curPage;
    private int prePage;
    private int nextPage;
    private int totalPages;
    private int totalReCords;
    private int pageSize;
    private List<T> list;

    public PageBean(){

    }

    public PageBean(int curPage, int totalReCords, int pageSize){
        this.curPage=curPage;
        this.totalReCords=totalReCords;
        this.pageSize=pageSize;
        totalPages=totalReCords%pageSize==0?totalReCords/pageSize:totalReCords/pageSize+1;
    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getPrePage() {
        return curPage==1?curPage:curPage-1;
    }


    public int getNextPage() {
        return curPage==totalPages?totalPages:curPage+1;
    }


    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getTotalReCords() {
        return totalReCords;
    }

    public void setTotalReCords(int totalReCords) {
        this.totalReCords = totalReCords;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
