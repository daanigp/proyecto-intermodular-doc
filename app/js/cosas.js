$(function () {

    // Muestra un mensaje de error en el elemento con el id dado
    function showTxtErr(id, msg) {
        $('#' + id).text(msg).fadeIn(150);
    }
    // Oculta y limpia el mensaje de error del elemento con el id dado
    function clearTxtErr(id) {
        $('#' + id).text('').hide();
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/;
    const passRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;


    function validarDatosRegistro() {
        let valido = true;
        const nick = $('#nick-register').val().trim();
        const name = $('#name-register').val().trim();
        const ape1 = $('#ape1-register').val().trim();
        const ape2 = $('#ape2-register').val().trim();
        const pais = $('#pais-register').val().trim();
        const email = $('#email-register').val().trim();
        const pass = $('#pass-register').val().trim();
        const passConf = $('#pass-conf-register').val().trim();

        if(nick.length < 2) {
            showTxtErr('nick-txt-err', 'El nick tiene que tener al menos 2 caracteres.');
            valido = false;
        } else {
            clearTxtErr('nick-txt-err');
        }

        if (!emailRegex.test(email)) {
            showError('email-txt-err', 'Introduce un email válido.');
            valid = false;
        } else {
            clearError('email-txt-err');
        }

        if(nick.length < 2) {
            showTxtErr('nick-txt-err', 'El nick tiene que tener al menos 2 caracteres.');
            valido = false;
        } else {
            clearTxtErr('nick-txt-err');
        }

        if(nick.length < 2) {
            showTxtErr('nick-txt-err', 'El nick tiene que tener al menos 2 caracteres.');
            valido = false;
        } else {
            clearTxtErr('nick-txt-err');
        }

        if(nick.length < 2) {
            showTxtErr('nick-txt-err', 'El nick tiene que tener al menos 2 caracteres.');
            valido = false;
        } else {
            clearTxtErr('nick-txt-err');
        }

        if(nick.length < 2) {
            showTxtErr('nick-txt-err', 'El nick tiene que tener al menos 2 caracteres.');
            valido = false;
        } else {
            clearTxtErr('nick-txt-err');
        }
    } 
});