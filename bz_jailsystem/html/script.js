window.addEventListener('message', function(event) {
    let data = event.data;

    if (data.type === "updateTimer") {
        document.getElementById("jail-timer-container").style.display = "block";
        document.getElementById("jail-timer").innerText = data.time;
    }

    if (data.type === "hideTimer") {
        document.getElementById("jail-timer-container").style.display = "none";
    }
});
