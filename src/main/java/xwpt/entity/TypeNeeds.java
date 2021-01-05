package xwpt.entity;

import java.io.Serializable;

public class TypeNeeds implements Serializable {
    private String uid;
    private String type;
    private String name;
    private String subkey;
    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubkey() {
        return subkey;
    }

    public void setSubkey(String subkey) {
        this.subkey = subkey;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
