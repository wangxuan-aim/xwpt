package xwpt.entity;

import java.io.Serializable;

public class Task implements Serializable {
    private String uid;
    private String demand;//需求
    private String critetime;//开始时间
    private String endtime;//结束时间
    private String creatDate;
    private String sno;//学号
    private String demandtype;//需求类型
    private String types;//任务状态 1未接取，2，已接取未完成，3，以接取已完成
    private String remuneration;//报酬
    private String describes;

    public String getCreatDate() {
        return creatDate;
    }

    public void setCreatDate(String creatDate) {
        this.creatDate = creatDate;
    }
    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getRemuneration() {
        return remuneration;
    }

    public void setRemuneration(String remuneration) {
        this.remuneration = remuneration;
    }

    public String getDemand() {
        return demand;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }

    public String getCritetime() {
        return critetime;
    }

    public void setCritetime(String critetime) {
        this.critetime = critetime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getDemandtype() {
        return demandtype;
    }

    public void setDemandtype(String demandtype) {
        this.demandtype = demandtype;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
    }
}
