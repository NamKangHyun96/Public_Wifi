function getSelect() {
    var select = document.getElementById('listNm');
    var option = select.options[select.selectedIndex];

    document.getElementById('value').value = option.value;
    document.getElementById('text').value = option.text;

    document.getElementById('bookmarkNm').value = option.value;
    document.getElementById('bookmarkNm').text = option.text;

}

function addList() {
    getSelect();
    let name = document.getElementById('bookmarkNm').value;
    let wifi = document.getElementById('wifiNm').value;


    location.href = "http://localhost:8080/WebProject_war_exploded/addlist-finish.jsp?name=" + name + "&wifi=" + wifi;
}