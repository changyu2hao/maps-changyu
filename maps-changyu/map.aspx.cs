using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;


public partial class main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }

    }


    protected void choosebutton_Click(object sender, EventArgs e)
    {
        mymap.Visible = false;
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string connetionString = null;
        MySqlConnection cnn;
        connetionString = "server=localhost;database=mymaps;uid=root;pwd=hemuyang0421";
        cnn = new MySqlConnection(connetionString);
        string Query = "insert into mymaps.mapdata(Players,Date_To_Play,Time_To_Play,Phone,Sports_Type,Lat,lng) values('" + this.txplayers.Text + "','" + this.txtdate.Text + "','" + this.lbltime.Text + "','" + this.txphone.Text + "','" + this.txSports.Text + "','" + this.Hiddenlat.Value + "','" + this.Hiddenlng.Value + "');";
        MySqlCommand InsertCommand = new MySqlCommand(Query, cnn);
        MySqlDataReader MyReader;       
        cnn.Open();
        MyReader = InsertCommand.ExecuteReader();        
        cnn.Close();
        //insert data to the database
        string selectsql = "select Lat from mymaps.mapdata";
        MySqlCommand cmd = new MySqlCommand(selectsql, cnn);
        cnn.Open();
        List<String> outColumnlat = new List<String>();
        MySqlDataReader Selectreader = cmd.ExecuteReader();
        for (int i = 0; i < Selectreader.FieldCount; i++)
        {
            if (Selectreader.HasRows)
                while (Selectreader.Read())
                {
                    outColumnlat.Add(Selectreader[i].ToString());
                }
        }
        foreach(string i in outColumnlat)
        {
            //lblcountPlayers.Value= outColumn
            lblLat.Value = string.Join(" ", outColumnlat);
        }
        cnn.Close();
        string selectsqllng = "select lng from mymaps.mapdata";
        MySqlCommand cmdlng = new MySqlCommand(selectsqllng, cnn);
        cnn.Open();
        List<String> outColumnlng = new List<String>();
        MySqlDataReader Selectreaderlng = cmdlng.ExecuteReader();
        for (int i = 0; i < Selectreaderlng.FieldCount; i++)
        {
            if(Selectreaderlng.HasRows)
                while (Selectreaderlng.Read())
                {
                    outColumnlng.Add(Selectreaderlng[i].ToString());
                }
        }
        foreach (string i in outColumnlng)
        {
            //lblcountPlayers.Value= outColumn
            lbllng.Value = string.Join(" ", outColumnlng);
        }
        cnn.Close();



        //{
        //    lblcountPlayers.Value = (string)Selectreader["Players"].ToString();
        //    lblcountDate.Value = (string)Selectreader["Date_To_Play"].ToString();
        //    lblcountTime.Value = (string)Selectreader["Time_To_Play"].ToString();
        //    lblcountPhone.Value = (string)Selectreader["Phone"].ToString();
        //    lblcountType.Value = (string)Selectreader["Sports_Type"].ToString();
        //}
        //select data from database


        //MySqlDataReader SelectReader = cmd.ExecuteReader();
        //Hiddendisplay.Value = SelectReader.ToString();
        //DataTable dt = new DataTable();


    }

    protected void btnclose_Click(object sender, EventArgs e)
    {
        
    }
}