<%@ WebHandler Language="C#" Class="GenericHandler1" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public class GenericHandler1 : IHttpHandler {

    public void ProcessRequest(HttpContext context) {
        context.Response.ContentType = "json";
        var x = context.Request;
        String tipo = context.Request["type"].ToString();
        switch (tipo)
        {
            case "1":
                setNovoTopicos(context);
                break;                 
        }
    } //ProcessRequest


    /////////////////////////NOVO DE TOPICOS/////////////////////////
    public void setNovoTopicos(HttpContext context){
        //String json = "";
        var listaDeTopicosPorTema = new List<String>();
        var serializer = new JavaScriptSerializer();

        String pergunta = context.Request.Form["pergunta"].ToString();
        String tema = context.Request.Form["tema"].ToString();
        String descricao = context.Request.Form["descricao"].ToString();
        //fazer adicionar topico na base de dados
        //Valores a serem apagados 
             
    } //setNovoTopicos

    public bool IsReusable {
        get {
            return false;
        }
    }
}