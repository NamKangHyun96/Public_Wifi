package dao;

import dto.HistoryData;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class HistoryService {
    public void insertHistory(HistoryData historyData) {
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

            String sql = "insert into test_history(His_lat, His_lnt, His_date) "
                    + "values (?, ?, datetime());";

            pstmt = conn.prepareStatement(sql);
            pstmt.setDouble(1, historyData.getMyLat());
            pstmt.setDouble(2, historyData.getMyLnt());
            pstmt.addBatch();

            pstmt.executeBatch();

        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
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

    public List<HistoryData> selectHistory() {
        List<HistoryData> historyList = new ArrayList<>();
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

            String sql = "select * from test_history;";
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                int historyId = rs.getInt("Id");
                double my_lat = rs.getDouble("His_lat");
                double my_lnt = rs.getDouble("His_lnt");
                Date date = rs.getDate("His_date");

                HistoryData historyData = new HistoryData();
                historyData.setId(historyId);
                historyData.setMyLat(my_lat);
                historyData.setMyLnt(my_lnt);
                historyData.setCheckDate(date);

                historyList.add(historyData);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
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
        return historyList;
    }

    public void deleteHistory(int id) {
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

            String sql = "delete from test_history where id = ?;";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,id);
            pstmt.executeUpdate();

        }  catch (SQLException e) {
            e.printStackTrace();
        }  finally {
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
}
