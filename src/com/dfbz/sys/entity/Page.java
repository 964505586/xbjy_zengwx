package com.dfbz.sys.entity;

/**
 * @ClassName: Page
 * @Description:
 * @author: zwx
 * @Date: 2019/12/3 0:13
 * @version: V1.0
 */
public class Page {

    private Integer pageSize = 3; // 单页显示数量
    private Integer count; // 总记录数
    private Integer pageCount; // 总页数
    private Integer pageCurrent; // 当前页码

    public Page() {
    }

    public Page(Integer count, Integer pageCurrent) {
        this.count = count;
        this.pageCurrent = pageCurrent;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getPageCount() {
        return this.count % this.pageSize == 0 ? this.count / this.pageSize : this.count / this.pageSize + 1;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public Integer getPageCurrent() {
        return pageCurrent;
    }

    public void setPageCurrent(Integer pageCurrent) {
        this.pageCurrent = pageCurrent;
    }
}
