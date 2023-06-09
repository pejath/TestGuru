window.addEventListener('load', () => {
    const rule_type = document.getElementById('rule-type');

    if (rule_type) {
        const category_option = document.getElementById('category-option');
        const category_input = document.getElementById('category-input');
        const level_option = document.getElementById('level-option');
        const level_input = document.getElementById('level-input');

        if (rule_type.value === 'category') {
            category_option.classList.remove('hide');
            category_input.disabled = false;
        } else if (rule_type.value === 'level') {
            level_option.classList.remove('hide');
            level_input.disabled = false;
        }

        rule_type.addEventListener('input', () => {
            switch (rule_type.value) {
                case 'category':
                    category_option.classList.remove('hide');
                    category_input.disabled = false;
                    level_option.classList.add('hide');
                    level_input.disabled = true;
                    break;
                case 'level':
                    level_option.classList.remove('hide');
                    level_input.disabled = false;
                    category_option.classList.add('hide');
                    category_input.disabled = true;
                    break;
                default:
                    level_option.classList.add('hide');
                    category_option.classList.add('hide');
                    level_input.disabled = true;
                    category_input.disabled = true;
                    break;
            }
        });
    }
});
