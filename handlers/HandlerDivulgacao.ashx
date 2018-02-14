<%@ WebHandler Language="C#" Class="HandlerDivulgacao" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public class HandlerDivulgacao : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "json";
        var x = context.Request;
        String tipo = context.Request["type"].ToString();
        switch (tipo)
        {
            case "1":
                getNoticias(context);
                break;
            case "2":
                getEventos(context);
                break;
        }
    } //ProcessRequest


    /////////////////////////NOTICIAS/////////////////////////
    public void getNoticias(HttpContext context)
    {
        String json;
        var serializer = new JavaScriptSerializer();

        //fazer a query de forma a ir buscar o artigo mais recente entre todos os temas

        //Valores a serem apagados
        json = serializer.Serialize(
            new {
                imagem = "imagens/alimentacao_3.jpg",
                data = "12 Janeiro 2017",
                titulo = "Va laaaaaaaa",
                texto = "PLEEEEEEEASE",
                url = "artigo_exemplo.html"
        });
              
        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getNoticias

/////////////////////////EVENTOS/////////////////////////
 public void getEventos(HttpContext context)
    {
        String json;
        var serializer = new JavaScriptSerializer();

        //fazer a query de forma a ir buscar o artigo mais recente entre todos os temas

        //Valores a serem apagados
        json = serializer.Serialize(
            new {
                   proximo = "PROXIMO O CRLH",
                   data = "METE A DATA NO CU",
                   horas = "EPAH FODA-SE",
                   local = "É LOCAL É",
                   titulo = "VAI TE FODER FDP",
                   descricao = "LEVEI O MEU O CAO A PASSEAAAAAAAR",
                   imagem = "imagens/evento1.png"
               });

        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getEventos

public bool IsReusable {
    get {
        return false;
    }
}

}