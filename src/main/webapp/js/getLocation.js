let lat = 0;
let lnt = 0;
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            lat = position.coords.latitude;
            lnt = position.coords.longitude;

            if (lat) {
                const latElement = document.getElementById('lat');
                latElement.setAttribute("value", lat);
                console.log(lat);
            }
            if (lnt) {
                const lntElement = document.getElementById('lnt');
                lntElement.setAttribute("value", lnt);
                console.log(lnt);
            }
            // document.getElementById('lat').value = lat;
            // document.getElementById('lnt').value = lnt;
        });
    } else {
        alert("error")
    }
}

