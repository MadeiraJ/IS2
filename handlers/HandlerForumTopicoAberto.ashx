<%@ WebHandler Language="C#" Class="HandlerForumTopicoAberto" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public class HandlerForumTopicoAberto : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "json";
        var x = context.Request;
        String tipo = context.Request["type"].ToString();
        switch (tipo)
        {
            case "1":
                getRespostas(context);
                break;
            case "2":
                getPergunta(context);
                break;
            case "3":
                getNextPerguntaId(context);
                break;
        } //switch
    } //ProcessRequest
            

    /////////////////////////PERGUNTA/////////////////////////
    public void getPergunta(HttpContext context)
    {
        String json;
        var serializer = new JavaScriptSerializer();
        var id = Convert.ToInt32(context.Request["id"].ToString());

        //fazer a query de forma a ir buscar um artigo, de acordo com o id recebido

        //Valores a serem apagados
        json = serializer.Serialize(
            new {
                pergunta = "Será que 2 + 2 é 4?",
                texto = "Eu acho que sim, mas verifiquem aí",
                data = "15/08/2018"
            });

        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getPergunta
    

    /////////////////////////RESPOSTAS/////////////////////////
    public void getRespostas(HttpContext context)
    {
        String json;
        var serializer = new JavaScriptSerializer();
        var id = Convert.ToInt32(context.Request["id"].ToString());

        //fazer a query de forma a ir buscar todas as respostas à pergunta com o id recebido

        //Valores a serem apagados
        json = serializer.Serialize(
            new {
                data = "DATAAAAAAA",
                texto = "TEXTOOOOOOOOOOOO",
                quemRespondeu = "MACOAAAASSSS"
            });

        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getRespostas

    /////////////////////////NEXT PERGUNTA/////////////////////////
    public void getNextPerguntaId(HttpContext context)
    {
        String json;
        var serializer = new JavaScriptSerializer();
        var id = Convert.ToInt32(context.Request["id"].ToString());

        //fazer a query de forma a ir buscar o id da próxima pergunta

        //Valores a serem apagados
        json = "1";
        
        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getRespostas



    public bool IsReusable {
        get {
            return false;
        }
    }

}