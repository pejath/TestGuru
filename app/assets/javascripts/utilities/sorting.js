window.addEventListener('load', () => {
    const control = document.querySelector('.sort-by-title')

    if (control) {
        control.addEventListener('click', sortRowsByTitle)
    }
})

function sortRowsByTitle() {
    const table = document.querySelector('table')

    //Nodelist
    const rows = table.querySelectorAll('tr')
    const arrowUp = this.querySelector('.octicon-arrow-up')
    const arrowDown = this.querySelector('.octicon-arrow-down')
    const sortedRows = Array.from(rows).slice(1)

    if (arrowUp.classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        arrowDown.classList.add('hide')
        arrowUp.classList.remove('hide')
    } else {
        sortedRows.sort(compareRowsDesc)
        arrowUp.classList.add('hide')
        arrowDown.classList.remove('hide')
    }

    const sortedTable = document.createElement('table')
    sortedTable.classList.add('table-hover', 'table', 'centered-data-table')

    const sortedtHead = sortedTable.createTHead()
    sortedtHead.classList.add('table-dark')
    sortedtHead.appendChild(rows[0])

    const sortedtBody = sortedTable.createTBody()
    sortedtBody.append(...sortedRows)

    sortedTable.appendChild(sortedtBody)

    table.replaceWith(sortedTable)
}

function compareRowsAsc(row1, row2) {
    const title1 = row1.querySelector('td').textContent
    const title2 = row2.querySelector('td').textContent
    return title1.localeCompare(title2)
}

function compareRowsDesc(row1, row2) {
    const title1 = row1.querySelector('td').textContent
    const title2 = row2.querySelector('td').textContent
    return title2.localeCompare(title1)
}
