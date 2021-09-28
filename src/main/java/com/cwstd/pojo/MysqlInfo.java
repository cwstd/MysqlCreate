package com.cwstd.pojo;

import java.util.Objects;

public class MysqlInfo {
    private String host;
    private String port;
    private String user;
    private String password;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public MysqlInfo() {
    }

    public MysqlInfo(String host, String port, String user, String password) {
        this.host = host;
        this.port = port;
        this.user = user;
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MysqlInfo mysqlInfo = (MysqlInfo) o;
        return Objects.equals(host, mysqlInfo.host) && Objects.equals(port, mysqlInfo.port) && Objects.equals(user, mysqlInfo.user) && Objects.equals(password, mysqlInfo.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(host, port, user, password);
    }

    @Override
    public String toString() {
        return "MysqlInfo{" +
                "host='" + host + '\'' +
                ", port='" + port + '\'' +
                ", user='" + user + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
