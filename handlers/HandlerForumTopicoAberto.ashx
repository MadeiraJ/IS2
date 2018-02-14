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
                getDescricao(context);
                break;
                    case "3":
                getTitulo(context);
                break;
        }
    } //ProcessRequest
            

        /////////////////////////TITULO/////////////////////////
    public void getTitulo(HttpContext context)
    {
        String json;
        var serializer = new JavaScriptSerializer();

        //fazer a query de forma a ir buscar o artigo mais recente entre todos os temas

        //Valores a serem apagados
        json = serializer.Serialize(
            new {
                texto = "TITULOOOOOOOOOOOOOOOO"
            });

        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getRespostas
    
    /////////////////////////DESCRICAO/////////////////////////
    public void getDescricao(HttpContext context)
    {
        String json;
        var serializer = new JavaScriptSerializer();

        //fazer a query de forma a ir buscar o artigo mais recente entre todos os temas

        //Valores a serem apagados
        json = serializer.Serialize(
            new {
                texto = "TEXTOOOOOOOOOOOODESCRICAAAAAAAAAAAAAAAAAO",
                data = "DATAAAAAAADESCRICAAAOOOAOAOAOAOAO"
            });

        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getRespostas



    /////////////////////////RESPOSTAS/////////////////////////
    public void getRespostas(HttpContext context)
    {
        String json;
        var serializer = new JavaScriptSerializer();

        //fazer a query de forma a ir buscar o artigo mais recente entre todos os temas

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



    public bool IsReusable {
        get {
            return false;
        }
    }

}