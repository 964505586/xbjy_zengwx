package com.dfbz.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ClassName: DateUtil
 * @Description:
 * @author: zwx
 * @Date: 2019/12/2 22:14
 * @version: V1.0
 */
public class DateUtil {

    public static String getDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(new Date());
    }
}
