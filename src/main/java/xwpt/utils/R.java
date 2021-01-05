package xwpt.utils;

import java.io.Serializable;
import java.util.HashMap;

public class R extends HashMap<String, Object> implements Serializable {
    public R() {
        put("code", 200);
        put("msg", "操作成功");
    }

    public static R ok(String msg) {
        R r = new R();
        r.put("msg", msg);
        return r;
    }

    public static R ok() {
        R r = new R();
        r.put("msg", "操作成功");
        return r;
    }

    public static R error() {
        R r = new R();
        r.put("code","500");
        r.put("msg", "操作失败");
        return r;
    }

    public static R error(String error) {
        R r = new R();
        r.put("code","200");
        r.put("msg", error);
        return r;
    }
    @Override
    public R put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
