
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sample.dto.Snack;
import sample.utils.DBUtils;

/**
 *
 * @author TRI
 */
public class SnackDAO {

    public static ArrayList<Snack> getSnacks(String keyword, String searchby) {
        ArrayList<Snack> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && searchby != null) {
                String sql = "select SID, SName, price, imgPath, description, status, Snacks.CateID as 'CateID', CateName\n"
                        + "from Snacks join Categories on Snacks.CateID=Categories.CateID\n";
                if (searchby.contains("byname")) {
                    sql = sql + "where Snacks.SName like ?";
                } else {
                    sql = sql + "where CateName like ?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("SID");
                        String name = rs.getString("SName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String des = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateID = rs.getInt("CateID");
                        String cateName = rs.getString("CateName");
                        Snack snack = new Snack(id, name, price, imgPath, des, status, cateID, cateName);
                        list.add(snack);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Snack getSnack(int sid) {
        Snack s = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select SID, SName, price, imgPath, description, status, Snacks.CateID as CateID, CateName\n"
                        + "from Snacks, Categories\n"
                        + "where Snacks.CateID=Categories.CateID  and SID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, sid);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    sid = rs.getInt("SID");
                    String sname = rs.getString("SName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String des = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateID = rs.getInt("CateID");
                    String cateName = rs.getString("CateName");
                    s = new Snack(sid, sname, price, imgPath, des, status, cateID, cateName);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return s;
    }

    public static ArrayList<Snack> getAllSnacks() {
        ArrayList<Snack> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select SID, SName, price, imgPath, description, status, Snacks.CateID as 'CateID', CateName\n"
                        + "from Snacks join Categories on Snacks.CateID=Categories.CateID\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("SID");
                        String name = rs.getString("SName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String des = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateID = rs.getInt("CateID");
                        String cateName = rs.getString("CateName");
                        Snack snack = new Snack(id, name, price, imgPath, des, status, cateID, cateName);
                        list.add(snack);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateSnack(int snackid, String name, String img, int price, int cate, String description, int status) {
        boolean kq = false;
        Snack snack = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE dbo.Snacks\n"
                        + "SET SName = ?, price = ?, imgPath = ?, description = ?, status = ?, CateID = ?\n"
                        + "WHERE SID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, price);
                pst.setString(3, img);
                pst.setString(4, description);
                pst.setInt(5, status);
                pst.setInt(6, cate);
                pst.setInt(7, snackid);
                int rs = pst.executeUpdate();
                kq = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return kq;
    }

    public static boolean insertSnack(String name, int price, String imgpath, String description, int status, int cateid) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO dbo.Snacks\n"
                        + "values (?,?,?,?,?,?)\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, price);
                pst.setString(3, imgpath);
                pst.setString(4, description);
                pst.setInt(5, status);
                pst.setInt(6, cateid);

                pst.executeUpdate();
                cn.close();
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
