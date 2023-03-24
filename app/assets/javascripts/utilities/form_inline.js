window.addEventListener('load', () => {
    const $controls = $('.form-inline-link')
    $controls.on('click', formInlineLinkHandler)

    const errors = document.querySelector('.resource-errors')

    if (errors && $controls.length) {
        const resourceId = errors.dataset.resourceId
        const errorField = document.querySelector('.field_with_errors')
        errorField.classList.remove('field_with_errors')
        errorField.classList.add('d-inline', 'w-auto')
        formInlineHandler(resourceId)
    }
})

function formInlineLinkHandler(e) {
    e.preventDefault()
    const testId = this.dataset.testId
    formInlineHandler(testId)
}

function formInlineHandler(testId) {
    const link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
    const $testTitle = $(`.test-title[data-test-id="${testId}"]`)
    const $formInline = $(`.form-inline[data-test-id="${testId}"]`)

    $formInline.toggle()
    $testTitle.toggle()

    if ($formInline.is(':visible')) {
        link.textContent = 'Cancel'
    } else {
        link.textContent = 'Edit'
    }
}
