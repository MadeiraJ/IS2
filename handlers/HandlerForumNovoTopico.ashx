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
        String tipo = context.Request["type"].ToString();
        switch (tipo)
        {
            case "1":
                setNovoTopicos(context);
                break;
        }
    } //ProcessRequest


    /////////////////////////NOVO DE TOPICOS/////////////////////////
    public void setNovoTopicos(HttpContext context)
    {
        //String json = "";
        var listaDeTopicosPorTema = new List<String>();
        var serializer = new JavaScriptSerializer();
        var format = "yyyy-MM-dd";
        var strDate = DateTime.Now.ToString(format);


        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-N8IQH97\\SQLEXPRESS;Initial Catalog=yourPEL;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        String pergunta = context.Request.Form["pergunta"].ToString();
        String tema = context.Request.Form["tema"].ToString();
        String descricao = context.Request.Form["descricao"].ToString();



        conn.Open();
        SqlCommand cmd = new SqlCommand(
               "INSERT INTO POST VALUES ('" +
                pergunta + "','" +
                descricao + "','" +
                strDate + "','" +
                tema + "','" +
                "true','" +
                "false')"
            , conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        ConnectedInsert(conn);


        //fazer adicionar topico na base de dados


    } //setNovoTopicos
    public void ConnectedInsert(SqlConnection conn)
    {
        //fazer adicionar topico na base de dados

    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}