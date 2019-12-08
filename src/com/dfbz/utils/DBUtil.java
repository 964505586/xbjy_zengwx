package com.dfbz.utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;

public class DBUtil {

    private static DataSource dataSource;

    static {
        Properties properties = new Properties();
        try {
            properties.load(DBUtil.class.getResourceAsStream("/com/db.properties"));
            try {
                dataSource = DruidDataSourceFactory.createDataSource(properties);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static DataSource getDataSource() {
        return dataSource;
    }
}
