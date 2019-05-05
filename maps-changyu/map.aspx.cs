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
        string selectsql = "select Players from mymaps.mapdata where Phone='" + this.txphone.Text + "'";
        MySqlCommand cmd = new MySqlCommand(selectsql, cnn);
        cnn.Open();
        MySqlDataReader SelectReader = cmd.ExecuteReader();
        Hiddendisplay.Value = SelectReader.ToString();
        //DataTable dt = new DataTable();
        cnn.Close();

    }

    protected void btnclose_Click(object sender, EventArgs e)
    {
        
    }
}