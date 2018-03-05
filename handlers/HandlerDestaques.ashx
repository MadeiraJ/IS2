<%@ WebHandler Language="C#" Class="HandlerDestaques" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public class HandlerDestaques : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "json";
        var x = context.Request;
        String tipo = context.Request["type"].ToString();
        switch (tipo)
        {
            case "1":
                getDestaques(context);
                break;
            case "2":
                getArtigoEmDestaque(context);
                break;
            case "3":
                getVideosDestaque(context);
                break;         
        }
     } //ProcessRequest

     /////////////////////////DESTAQUES/////////////////////////
    public void getDestaques(HttpContext context) {
        String json = "";
        var listaDeDestaques = new List<String>();
        var serializer = new JavaScriptSerializer();
        var numeroArtigosRecebidos = Convert.ToInt32(context.Request.Form["numeroArtigosRecebidos"].ToString());
        var numeroDeArtigosPedidos = Convert.ToInt32(context.Request.Form["numeroDeArtigosPedidos"].ToString());

        //fazer a query de forma air buscar um certo numero de artigos (excepto o primeiro) + sabias que + videos de todos os temas ordenados pela data (de forma decrescente)

        //Valores a serem apagados
        try
        {
            for (int i = numeroArtigosRecebidos; i < numeroArtigosRecebidos + numeroDeArtigosPedidos; i++) {
                if (i < 20)
                {
                     listaDeDestaques.Add(
                        serializer.Serialize(
                            new { tema = "ALIMENTACAO", tipo = "ARTIGO", imagem = "imagens/alimentacao_1.png", titulo = "Titulo Artigo Alimentação", texto = "Isto é texto Alimentação", url = "1" }
                    ));
                }                                
                else
                {
                    listaDeDestaques.Add(
                        serializer.Serialize(null));
                }

            }
            json = serializer.Serialize(listaDeDestaques);

            context.Response.ContentType = "plain/text";
            context.Response.Write(json);
        }
        catch (Exception ex)
        {

        }
    } //getDestaques

    /////////////////////////ARTIGO EM DESTAQUE/////////////////////////
    public void getArtigoEmDestaque(HttpContext context)
    {
        String json;
        var serializer = new JavaScriptSerializer();

        //fazer a query de forma a ir buscar o artigo mais recente entre todos os temas
        
        //Valores a serem apagados
        json = serializer.Serialize(
            new {
                tema = "ALIMENTACAO",
                imagem = "imagens/alimentacao_1.png",
                titulo = "Por favor funcemina",
                texto = "Se isto funcionar eu mando-me de 2 janelas",
                url = "1"
            });


        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getArtigoEmDestaque

    /////////////////////////VIDEOS/////////////////////////
    public void getVideosDestaque(HttpContext context)
    {
        String json = "";
        var listaDeVideos = new List<String>();
        var serializer = new JavaScriptSerializer();
        var numeroVideosRecebidos = Convert.ToInt32(context.Request.Form["numeroVideosRecebidos"].ToString());
        var numeroDeVideosPedidos = Convert.ToInt32(context.Request.Form["numeroDeVideosPedidos"].ToString());

        //Fazer aqui a query à respetiva tabela, de forma a conseguir ter um certo número de videos de todos os temas
        
        //Valores a serem apagados
        try
        {
            for (int i = numeroVideosRecebidos; i < numeroVideosRecebidos + numeroDeVideosPedidos; i++) {
                if (i < 10)
                {
                    listaDeVideos.Add(
                        serializer.Serialize(
                            new { tema = "ALIMENTACAO", link = @"https://www.youtube.com/watch?v=3M_5oYU-IsU&list=PLJQeCC1As9Poqoy_3R13mI1ReVD-P-bqt", titulo = "Man never hot", texto = "The thing goes skraaaaa" }
                    ));
                }                                
                else
                {
                    listaDeVideos.Add(
                        serializer.Serialize(null));
                }
            }
            json = serializer.Serialize(listaDeVideos);

            context.Response.ContentType = "plain/text";
            context.Response.Write(json);
        }
        catch (Exception ex)
        {

        }
        /*for(int i = 0; i < numeroDeVideosPedidos; i++)
            listaDeVideos.Add(
                serializer.Serialize(
                    new { tema = "ALIMENTACAO", link = @"https://www.youtube.com/watch?v=3M_5oYU-IsU&list=PLJQeCC1As9Poqoy_3R13mI1ReVD-P-bqt", titulo = "Man never hot", texto = "The thing goes skraaaaa" }
            ));

        json = serializer.Serialize(listaDeVideos);


        context.Response.ContentType = "plain/text";
        context.Response.Write(json);*/
    } //getVideosDestaque
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}