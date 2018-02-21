$(document).ready(function () {
    var existemCookies = vaiBuscarCookie(); //se existir retorna o id, caso contrário retorna false
    if(existemCookies) {
        $.ajax({
            url: `/handlers/HandlerArtigos.ashx`,
            type: "POST",
            tipo: {fghj: "visita", id: existemCookies, dispositivo: "smartphone"},
            dataType: "json"
        }) //ajax
    } else {
        criarCookie();
    }
}); //document


function checkDevice(x, y) {
    if(x < 425 && y < 813 || x < 813 && y < 425 )
        return "smartphone"
    if(x < 768 && y )
}