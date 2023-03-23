window.addEventListener('load', ()=>{
    const question = document.querySelector('.test-passage-question')
    const bar = document.querySelector('.my-bar')

    if(question) {
        const percent = 100 / question.dataset.lastQuestion
        bar.style.width = `${percent * question.dataset.currentQuestion}%`
    }
})
