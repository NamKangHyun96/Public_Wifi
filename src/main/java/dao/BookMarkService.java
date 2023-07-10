package dao;

import dto.BookMarkGroup;
import dto.BookMarkList;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BookMarkService {
    public int createBookGroup(String name, int order) {
        String url = "C:\\Users\\rkdgu\\IdeaProjects\\WebProject\\identifier.sqlite";
        int result = 0;

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

            String sql = "insert into bookmark_group(groupNm, groupId_order, RGDate) "
                    + "values (?, ?, datetime());";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setInt(2, order);
            result = pstmt.executeUpdate();

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
        return result;
    }

    public List<BookMarkGroup> selectBookGroup() {
        List<BookMarkGroup> groupList = new ArrayList<>();
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

            String sql = "select * from bookmark_group;";
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                int groupId = rs.getInt("groupId");
                String groupName = rs.getString("groupNm");
                int groupOrder = rs.getInt("groupId_order");
                Date RDate = rs.getDate("RGDate");
                Date REDate = rs.getDate("RGDEDate");

                BookMarkGroup groupData = new BookMarkGroup();
                groupData.setBookMarkId(groupId);
                groupData.setBookMarkNm(groupName);
                groupData.setBookMarkOd(groupOrder);
                groupData.setBookMarkRg(RDate);
                groupData.setBookMarkERg(REDate);

                groupList.add(groupData);
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
        return groupList;
    }

    public int deleteBookGroup(int id) {
        String url = "C:\\Users\\rkdgu\\IdeaProjects\\WebProject\\identifier.sqlite";
        int result = 0;

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

            String sql = "PRAGMA foreign_keys = on;";
            pstmt = conn.prepareStatement(sql);

            sql = "delete from bookmark_group where groupId = ?;";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,id);
            result = pstmt.executeUpdate();

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
        return result;
    }

    public int updateBookGroup(int id, int order, String name) {
        String url = "C:\\Users\\rkdgu\\IdeaProjects\\WebProject\\identifier.sqlite";
        int result = 0;

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

            String sql = "PRAGMA foreign_keys = on;";
            pstmt = conn.prepareStatement(sql);

            sql = " update bookmark_group set groupId_order = ?, groupNm = ?, RGDEDate = datetime() " +
                    " where groupId = ?;";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,order);
            pstmt.setString(2,name);
            pstmt.setInt(3,id);

            result = pstmt.executeUpdate();

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
        return result;
    }

    public int createBookList(int id, String wifi) {
        String url = "C:\\Users\\rkdgu\\IdeaProjects\\WebProject\\identifier.sqlite";
        int result = 0;

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

            String sql = " insert into bookmark_list(wifiName, registeredDate, groupJoinId) "
                    + " values (?, datetime(), ?);";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, wifi);
            pstmt.setInt(2, id);
            result = pstmt.executeUpdate();

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
        return result;
    }

    public List<BookMarkList> selectBookList() {
        List<BookMarkList> bookList = new ArrayList<>();
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

            String sql = " select bookmark_list.bookmarkId, bookmark_group.groupNm, " +
                    " bookmark_list.wifiName, bookmark_list.registeredDate " +
                    " from bookmark_list inner join bookmark_group on " +
                    " bookmark_list.groupJoinId = bookmark_group.groupId_order;";
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                int ListId = rs.getInt("bookmarkId");
                System.out.print(ListId + " ");
                String ListNm = rs.getString("groupNm");
                System.out.print(ListNm + " ");
                String wifiName = rs.getString("wifiName");
                System.out.print(wifiName + " ");
                Date listRG = rs.getDate("registeredDate");
                System.out.print(listRG + " ");
                System.out.println();

                BookMarkList listData = new BookMarkList();
                listData.setBookListId(ListId);
                listData.setBookListNm(ListNm);
                listData.setWifiNm(wifiName);
                listData.setBookListRg(listRG);


                bookList.add(listData);
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
        return bookList;
    }

    public int deleteBookList(int id) {
        String url = "C:\\Users\\rkdgu\\IdeaProjects\\WebProject\\identifier.sqlite";
        int result = 0;

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

            String sql = "delete from bookmark_list where bookmarkId = ?;";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,id);
            result = pstmt.executeUpdate();

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
        return result;
    }
}
