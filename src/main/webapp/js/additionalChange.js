function getAddValue() {
    let name = document.getElementById('bookNm').value;
    let order = document.getElementById('bookOd').value;
    location.href = "http://localhost:8080/WebProject_war_exploded/add-finish.jsp?name=" + name + "&order=" + order;
}

function getEditValue() {
    let id = document.getElementById('grId').value;
    let name = document.getElementById('bookNm').value;
    let order = document.getElementById('bookOd').value;
    location.href = "http://localhost:8080/WebProject_war_exploded/edit-finish.jsp?id=" + id + "&name=" + name + "&order=" + order;
}

function getDeleteValue() {
    let id = document.getElementById('bookId').value;
    let name = document.getElementById('bookNm').value;
    let order = document.getElementById('bookOd').value;
    location.href = "http://localhost:8080/WebProject_war_exploded/delete-finish.jsp?id=" + id + "&name=" + name + "&order=" + order;
}