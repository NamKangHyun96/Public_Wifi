function deleteData (data) {
    const delData = data.id;
    location.href = "http://localhost:8080/WebProject_war_exploded/historydelete.jsp?delData=" + delData;
}