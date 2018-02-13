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

        //fazer a query de forma a a ir buscar todos os artigos (excepto o primeiro) + todos os sabias que + todos os videos de todos os temas ordenados pela data (de forma decrescente)
    
        //Valores a serem apagados
        listaDeDestaques.Add(
            serializer.Serialize(
                new { tema = "ALIMENTACAO", tipo = "ARTIGO", imagem = "imagens/alimentacao_1.png", titulo = "Titulo Artigo Alimentação", texto = "Isto é texto Alimentação", artigo = 1 }
        ));

        listaDeDestaques.Add(
            serializer.Serialize(
                new { tema = "SEXUALIDADE", tipo = "ARTIGO", imagem = "imagens/alimentacao_1.png", titulo = "Titulo Artigo Sexualidade", texto = "Isto é texto Sexualidade", artigo = 1 }
        ));

        listaDeDestaques.Add(
            serializer.Serialize(
                new { tema = "SEXUALIDADE", tipo = "VIDEO", link = @"https://www.youtube.com/watch?v=3M_5oYU-IsU&list=PLJQeCC1As9Poqoy_3R13mI1ReVD-P-bqt", titulo = "Man never hot", texto = "The thing goes skraaaaa" }
        ));

        listaDeDestaques.Add(
            serializer.Serialize(
                new { tema = "SEXUALIDADE", tipo = "SABIAS-QUE", texto = "Texto sabias que sexualidade" }
        ));

        listaDeDestaques.Add(
            serializer.Serialize(
                new { tema = "CONSUMOS", tipo = "ARTIGO", imagem = "imagens/alimentacao_1.png", titulo = "Titulo Artigo Consumos Nocivos", texto = "Isto é texto Sexualidade", artigo = 1 }
        ));

        listaDeDestaques.Add(
            serializer.Serialize(
                new { tema = "ALIMENTACAO", tipo = "VIDEO", link = @"https://www.youtube.com/watch?v=3M_5oYU-IsU&list=PLJQeCC1As9Poqoy_3R13mI1ReVD-P-bqt", titulo = "Man never hot", texto = "The thing goes skraaaaa" }
        ));

        listaDeDestaques.Add(
            serializer.Serialize(
                new { tema = "ALIMENTACAO", tipo = "SABIAS-QUE", texto = "Texto sabias que alimentação" }
        ));

        listaDeDestaques.Add(
            serializer.Serialize(
                new { tema = "CONSUMOS", tipo = "VIDEO", link = @"https://www.youtube.com/watch?v=3M_5oYU-IsU&list=PLJQeCC1As9Poqoy_3R13mI1ReVD-P-bqt", titulo = "Man never hot", texto = "The thing goes skraaaaa" }
        ));

        listaDeDestaques.Add(
            serializer.Serialize(
                new { tema = "CONSUMOS", tipo = "SABIAS-QUE", texto = "Texto sabias que consumos" }
        ));

        json = serializer.Serialize(listaDeDestaques);


        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
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
                url = "artigo_exemplo.html"
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

        //Fazer aqui a query à respetiva tabela, de forma a conseguir ter os videos de todos os temas ordenados como os anteriores
        
        //Valores a serem apagados
        listaDeVideos.Add(
            serializer.Serialize(
                new { tema = "ALIMENTACAO", link = @"https://www.youtube.com/watch?v=3M_5oYU-IsU&list=PLJQeCC1As9Poqoy_3R13mI1ReVD-P-bqt", titulo = "Man never hot", texto = "The thing goes skraaaaa" }
        ));

        listaDeVideos.Add(
            serializer.Serialize(
                new { tema = "SEXUALIDADE", link = @"https://www.youtube.com/watch?v=0dVa81ecacE&list=PLrDezo9S25Je5OnmKCXCy_GPYUDQtj3dS", titulo = "Sociedade do mal", texto = "MAL" }
        ));

        listaDeVideos.Add(
            serializer.Serialize(
                new { tema = "CONSUMOS", link = @"https://www.youtube.com/watch?v=0dVa81ecacE&list=PLrDezo9S25Je5OnmKCXCy_GPYUDQtj3dS", titulo = "Sociedade do mal", texto = "MAL" }
        ));
        json = serializer.Serialize(listaDeVideos);


        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getVideosDestaque
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}