package dao;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dto.WifiData;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WifiService {

    public List<WifiData> selectData(double my_lat, double my_lnt) {

        List<WifiData> wifiData = new ArrayList<>();

        String url = "C:\\Users\\rkdgu\\IdeaProjects\\WebProject\\identifier.sqlite";

        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:sqlite:" + url);
            String sql = "SELECT *, round(6371 * acos(cos(radians(?)) " +
                    "* cos(radians(lat)) * cos(radians(lnt) - radians(?)) " +
                    "+ sin(radians(?)) * sin(radians(lat))), 4) as dist " +
                    "from test order by dist limit 20;";

            pstmt = conn.prepareStatement(sql);
            pstmt.setDouble(1, my_lat);
            pstmt.setDouble(2, my_lnt);
            pstmt.setDouble(3, my_lat);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String mgr_no = rs.getString("MgrNo");
                String wrdofc = rs.getString("Wrdofc");
                String main_nm = rs.getString("MainNm");
                String adres1 = rs.getString("Addres1");
                String adres2 = rs.getString("Addres2");
                String instl_floor = rs.getString("InstlFloor");
                String instl_ty = rs.getString("InstlTy");
                String instl_mby = rs.getString("InstlMby");
                String svc_se = rs.getString("SvcSe");
                String cmcwr = rs.getString("Cmcwr");
                String cnstc_year = rs.getString("CnstcYear");
                String inout_door = rs.getString("InoutDoor");
                String remars3 = rs.getString("Remars3");
                double lat = rs.getDouble("lat");
                double lnt = rs.getDouble("lnt");
                String work_dttm = rs.getString("workDttm");
                double dist = rs.getDouble("dist");

                WifiData data = new WifiData();

                data.setDistance(dist);
                data.setXSwifiMgrNo(mgr_no);
                data.setXSwifiWrdofc(wrdofc);
                data.setXSwifiMainNm(main_nm);
                data.setXSwifiAddres1(adres1);
                data.setXSwifiAddres2(adres2);
                data.setXSwifiInstlFloor(instl_floor);
                data.setXSwifiInstlTy(instl_ty);
                data.setXSwifiInstlMby(instl_mby);
                data.setXSwifiSvcSe(svc_se);
                data.setXSwifiCmcwr(cmcwr);
                data.setXSwifiCnstcYear(cnstc_year);
                data.setXSwifiInoutDoor(inout_door);
                data.setXSwifiRemars3(remars3);
                data.setLat(lat);
                data.setLnt(lnt);
                data.setWorkDttm(work_dttm);

                wifiData.add(data);
            }


        } catch (SQLException e) {
        e.printStackTrace();
        } finally {
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null && !pstmt.isClosed()) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return wifiData;
        }
    }

    public void insertData(JsonArray jsonArray) {
        String url = "C:\\Users\\rkdgu\\IdeaProjects\\WebProject\\identifier.sqlite";

        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:sqlite:" + url);
            Statement statement = conn.createStatement();
            statement.execute("PRAGMA cache_size=10000000");
            statement.execute("PRAGMA synchronous=0");
            statement.execute("PRAGMA journal_model=OFF");
            statement.execute("PRAGMA locking_mode = EXCLUSIVE");
            statement.execute("PRAGMA temp_store = MEMORY");

            String sql = " insert into test (MgrNo, Wrdofc, MainNm, Addres1, Addres2, InstlFloor, InstlTy, "
                    + " InstlMby, SvcSe, Cmcwr, CnstcYear, InoutDoor, Remars3, lat, lnt, workDttm) "
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

            pstmt = conn.prepareStatement(sql);
            for (int i = 0; i < jsonArray.size(); i++) {
                JsonObject data = jsonArray.get(i).getAsJsonObject();
                pstmt.setString(1, data.get("X_SWIFI_MGR_NO").getAsString());
                pstmt.setString(2, data.get("X_SWIFI_WRDOFC").getAsString());
                pstmt.setString(3, data.get("X_SWIFI_MAIN_NM").getAsString());
                pstmt.setString(4, data.get("X_SWIFI_ADRES1").getAsString());
                pstmt.setString(5, data.get("X_SWIFI_ADRES2").getAsString());
                pstmt.setString(6, data.get("X_SWIFI_INSTL_FLOOR").getAsString());
                pstmt.setString(7, data.get("X_SWIFI_INSTL_TY").getAsString());
                pstmt.setString(8, data.get("X_SWIFI_INSTL_MBY").getAsString());
                pstmt.setString(9, data.get("X_SWIFI_SVC_SE").getAsString());
                pstmt.setString(10, data.get("X_SWIFI_CNSTC_YEAR").getAsString());
                pstmt.setString(11, data.get("X_SWIFI_CMCWR").getAsString());
                pstmt.setString(12, data.get("X_SWIFI_INOUT_DOOR").getAsString());
                pstmt.setString(13, data.get("X_SWIFI_REMARS3").getAsString());
                pstmt.setDouble(14, data.get("LNT").getAsDouble());
                pstmt.setDouble(15, data.get("LAT").getAsDouble());
                pstmt.setString(16, data.get("WORK_DTTM").getAsString());

                pstmt.addBatch();
                if (i % 1000 == 0) {
                    pstmt.executeBatch();
                }
            }
            pstmt.executeBatch();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null && !pstmt.isClosed()) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public List<WifiData> selectDetail (String management) {
        List<WifiData> wifiDetail = new ArrayList<>();

        String url = "C:\\Users\\rkdgu\\IdeaProjects\\WebProject\\identifier.sqlite";

        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:sqlite:" + url);
            String sql = "select * from test where MgrNo='"
                    + management
                    + "'";

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String mgr_no = rs.getString("MgrNo");
                String wrdofc = rs.getString("Wrdofc");
                String main_nm = rs.getString("MainNm");
                String adres1 = rs.getString("Addres1");
                String adres2 = rs.getString("Addres2");
                String instl_floor = rs.getString("InstlFloor");
                String instl_ty = rs.getString("InstlTy");
                String instl_mby = rs.getString("InstlMby");
                String svc_se = rs.getString("SvcSe");
                String cmcwr = rs.getString("Cmcwr");
                String cnstc_year = rs.getString("CnstcYear");
                String inout_door = rs.getString("InoutDoor");
                String remars3 = rs.getString("Remars3");
                double lat = rs.getDouble("lat");
                double lnt = rs.getDouble("lnt");
                String work_dttm = rs.getString("workDttm");

                WifiData data = new WifiData();

                data.setXSwifiMgrNo(mgr_no);
                data.setXSwifiWrdofc(wrdofc);
                data.setXSwifiMainNm(main_nm);
                data.setXSwifiAddres1(adres1);
                data.setXSwifiAddres2(adres2);
                data.setXSwifiInstlFloor(instl_floor);
                data.setXSwifiInstlTy(instl_ty);
                data.setXSwifiInstlMby(instl_mby);
                data.setXSwifiSvcSe(svc_se);
                data.setXSwifiCmcwr(cmcwr);
                data.setXSwifiCnstcYear(cnstc_year);
                data.setXSwifiInoutDoor(inout_door);
                data.setXSwifiRemars3(remars3);
                data.setLat(lat);
                data.setLnt(lnt);
                data.setWorkDttm(work_dttm);

                wifiDetail.add(data);
            }



        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null && !pstmt.isClosed()) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return wifiDetail;
        }
    }
}
