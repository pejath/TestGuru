window.addEventListener('load', () => {
    const timerTime = document.querySelector('.test-passage-question')?.dataset.testTimer
    const testPassage = document.querySelector('.test-passage-question')?.dataset.testPassage
    const getStartTime = sessionStorage.getItem(`timerStartTime${testPassage || ''}`);
    const getEndTime = sessionStorage.getItem(`timerEndTime${testPassage || ''}`);

    if (getStartTime && getEndTime) {

        timer(testPassage)

    } else if (timerTime) {
        const startTime = Date.now();
        const endTime = startTime + (timerTime * 60 * 1000);
        sessionStorage.setItem(`timerStartTime${testPassage}`, startTime);
        sessionStorage.setItem(`timerEndTime${testPassage}`, endTime);
        timer(testPassage)
    }
})

function timer(testPassage) {
    const startTime = sessionStorage.getItem(`timerStartTime${testPassage}`);
    const endTime = sessionStorage.getItem(`timerEndTime${testPassage}`);

    if (endTime && startTime) {

        let remainingTime = endTime - Date.now();

        const timerEl = document.getElementById('timer');
        timerEl.innerHTML = formatTime(remainingTime);

        const timerId = setInterval(function () {
            remainingTime = endTime - Date.now();
            if (remainingTime <= 0) {
                clearInterval(timerId);
                sessionStorage.removeItem(`timerStartTime${testPassage}`)
                sessionStorage.removeItem(`timerEndTime${testPassage}`)

                const form = document.querySelector('.test-passage-question');
                form.innerHTML += ('<input type="hidden" name="times_up" value="true"/>')
                form.submit()
            } else {
                timerEl.innerHTML = formatTime(remainingTime);
            }
        }, 1000);
    }
}

function formatTime(time) {
    const hours = Math.floor(time / (60 * 60 * 1000));
    const minutes = Math.floor((time % (60 * 60 * 1000)) / (60 * 1000));
    const seconds = Math.floor((time % (60 * 1000)) / 1000);
    if (hours > 0) {
        return ("0" + hours).slice(-2) + ":" + ("0" + minutes).slice(-2) + ":" + ("0" + seconds).slice(-2);
    } else {
        return ("0" + minutes).slice(-2) + ":" + ("0" + seconds).slice(-2);
    }
}
