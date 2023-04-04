window.addEventListener('load', ()=>{
const testPassage = document.getElementById('test-results')?.dataset.testPassage
    if (testPassage){
        sessionStorage.removeItem(`timerStartTime${testPassage}`)
        sessionStorage.removeItem(`timerEndTime${testPassage}`)
    }
})
