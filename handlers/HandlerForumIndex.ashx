<%@ WebHandler Language="C#" Class="GenericHandler1" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;
using System.Data.SqlClient;

public class GenericHandler1 : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "json";
        var x = context.Request;
        getListaTopicos(context);
    } //ProcessRequest


    /////////////////////////LISTA DE TOPICOS/////////////////////////
    public void getListaTopicos(HttpContext context)
    {
        String json = "";
        var listaDeTopicos = new List<String>();
        var serializer = new JavaScriptSerializer();
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-N8IQH97\\SQLEXPRESS;Initial Catalog=yourPEL;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        Connected(conn);

        //Valores a serem apagados
        //leghnt das linhas da BD
        for (int i = 0; i < 10 ; i++)
        {
            /*listaDeTopicos.Add(
                serializer.Serialize(
                    new { tema = [i], numeroRespostas = "2", pergunta = "Faz mal comer muitos ovos diariamente?", data = "12 de Janeiro às 12:45", estado = "Ativo", id = "2" }
            ));
            */
        }

        json = serializer.Serialize(listaDeTopicos);
        context.Response.ContentType = "plain/text";
        context.Response.Write(json);
    } //getListaTopicos


    public void Connected(SqlConnection conn)
    {
        /*conn.Open();
        //fazer a query de todos os topicos de ordenados pela data (de forma decrescente
        SqlCommand cmd = new SqlCommand(
            "SELECT * FROM RESPOSTA ORDER BY DATA_HORA DESC "
            , conn);
        cmd.ExecuteNonQuery();
        conn.Close();*/

        String json = "";
        var listaDeTopicos = new List<String>();
        var serializer = new JavaScriptSerializer();
        //Ficas-te aqui, usar LINQ
        /*using (App_code.YourPELEntities db = new Models.YourPELEntities())
        {
            var query = select new {
                titulo = evento.titulo,
                conteudo = evento.conteudo,
            }).ToList();
            json = serializer.Serialize(query);*/
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}