$(document).ready(function () {           
        var Id = 1;

        $.ajax({
            url: "/api/handler/utilizador.ashx?type=1",
            type: "POST",
            data: {id: Id},
            dataType: "json",
            success: function (result) {
                $("#nome").text(result[0].nome);
                $("#idade").text(result[0].idade);
            }
        });
    })