package com.example.shoppingmall_project.model.vo.mypagevo;

public class Paging {
    private int reqPage;
    private int offset, perCount = 10;
    private int totalBoard, totalPage;
    private int perPage = 10;
    private int section;
    private int begin, end;
    private boolean prev, next;

    public Paging(int reqPage, int totalBoard)
    {
        this.reqPage = reqPage;
        this.totalBoard = totalBoard;

        offset = (reqPage - 1) * perCount;//1페이지 요청했으면 0~10까지 나오니까

        totalPage = totalBoard / perPage;
        totalPage += (totalBoard % perPage == 0) ? 0 : 1;

        section = (reqPage - 1) / perPage;
        begin = section * perPage + 1;
        end = (section + 1) * perPage;

        end = (end > totalPage) ? totalPage : end;

        prev = section != 0;
        next = end != totalPage;
    }

    public int getReqPage() {
        return reqPage;
    }
    public void setReqPage(int reqPage) {
        this.reqPage = reqPage;
    }
    public int getOffset() {
        return offset;
    }
    public void setOffset(int offset) {
        this.offset = offset;
    }
    public int getPerCount() {
        return perCount;
    }
    public void setPerCount(int perCount) {
        this.perCount = perCount;
    }
    public int getTotalBoard() {
        return totalBoard;
    }
    public void setTotalBoard(int totalBoard) {
        this.totalBoard = totalBoard;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getPerPage() {
        return perPage;
    }
    public void setPerPage(int perPage) {
        this.perPage = perPage;
    }
    public int getSection() {
        return section;
    }
    public void setSection(int section) {
        this.section = section;
    }
    public int getBegin() {
        return begin;
    }
    public void setBegin(int begin) {
        this.begin = begin;
    }
    public int getEnd() {
        return end;
    }
    public void setEnd(int end) {
        this.end = end;
    }

    public boolean getPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean getNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }

}