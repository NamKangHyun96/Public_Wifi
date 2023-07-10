function detailInfo (mgr) {
    const mgr_No = mgr.id
    location.href = "http://localhost:8080/WebProject_war_exploded/wifidetail.jsp?mgr_No=" + mgr_No;
}