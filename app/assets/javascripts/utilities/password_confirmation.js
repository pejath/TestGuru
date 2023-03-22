window.addEventListener('load', () => {
    const passwordConfirmation = document.getElementById('user_password_confirmation');
    const password = document.getElementById('user_password');

    password.addEventListener('input', () => {
        if (!password.value) {
            resetClasses(passwordConfirmation);
        }
    });

    passwordConfirmation.addEventListener('input', () => {
        if (password.value) {
            checkState(password.value, passwordConfirmation);
        }
    });
});

function resetClasses(element) {
    element.classList.remove('password-confirm-error');
    element.classList.remove('password-confirm-success');
}

function checkState(passwordValue, confirmation) {
    if (passwordValue !== confirmation.value) {
        if (!confirmation.classList.contains('password-confirm-error')) {
            resetClasses(confirmation);
            confirmation.classList.add('password-confirm-error');
        }
    } else {
        resetClasses(confirmation);
        confirmation.classList.add('password-confirm-success');
    }
}
