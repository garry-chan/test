// join/INIT.js
$.webshims.polyfill('forms forms-ext');
function PasswordMatchCheck()
{
    var confirm = document.getElementById('confirm');
    if (confirm.value==document.getElementById('pass').value)
        confirm.setCustomValidity('');
    else
      confirm.setCustomValidity('passwords do not match');
}

