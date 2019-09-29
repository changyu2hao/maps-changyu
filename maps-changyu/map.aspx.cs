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
            string connetionString = null;
            MySqlConnection cnn;
            connetionString = "server=35.203.11.34;database=mymaps;uid=root;pwd=hemuyang0421";
            cnn = new MySqlConnection(connetionString);
            //use the mysql database

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
            foreach (string i in outColumnlat)
            {
                lblLat.Value = string.Join(" ", outColumnlat);
            }
            cnn.Close();
            //get the latitude from database

            string selectsqllng = "select lng from mymaps.mapdata";
            MySqlCommand cmdlng = new MySqlCommand(selectsqllng, cnn);
            cnn.Open();
            List<String> outColumnlng = new List<String>();
            MySqlDataReader Selectreaderlng = cmdlng.ExecuteReader();
            for (int i = 0; i < Selectreaderlng.FieldCount; i++)
            {
                if (Selectreaderlng.HasRows)
                    while (Selectreaderlng.Read())
                    {
                        outColumnlng.Add(Selectreaderlng[i].ToString());
                    }
            }
            foreach (string i in outColumnlng)
            {
                lbllng.Value = string.Join(" ", outColumnlng);
            }
            cnn.Close();
            //get longtitute from mysql database


            string SelectsqlPlayers = "select Players from mymaps.mapdata";
            MySqlCommand cmdPlayers = new MySqlCommand(SelectsqlPlayers, cnn);
            cnn.Open();
            List<String> outColumnPlayers = new List<String>();
            MySqlDataReader SelectreaderPlayers = cmdPlayers.ExecuteReader();
            for (int i = 0; i < SelectreaderPlayers.FieldCount; i++)
            {
                if (SelectreaderPlayers.HasRows)
                    while (SelectreaderPlayers.Read())
                    {
                        outColumnPlayers.Add(SelectreaderPlayers[i].ToString());
                    }
            }
            foreach (string i in outColumnPlayers)
            {
                inpPlayers.Value = string.Join(" ", outColumnPlayers);
            }
            cnn.Close();
            //get Players number from database


            string SelectsqDate = "select Date_To_Play from mymaps.mapdata";
            MySqlCommand cmddate = new MySqlCommand(SelectsqDate, cnn);
            cnn.Open();
            List<String> outColumnDate = new List<String>();
            MySqlDataReader SelectreaderDate = cmddate.ExecuteReader();
            for (int i = 0; i < SelectreaderDate.FieldCount; i++)
            {
                if (SelectreaderDate.HasRows)
                    while (SelectreaderDate.Read())
                    {
                        outColumnDate.Add(SelectreaderDate[i].ToString());
                    }
            }
            foreach (string i in outColumnDate)
            {
                inpDate.Value = string.Join(" ", outColumnDate);
            }
            cnn.Close();
            //get date from database


            string SelectsqTime = "select Time_To_Play from mymaps.mapdata";
            MySqlCommand cmdtime = new MySqlCommand(SelectsqTime, cnn);
            cnn.Open();
            List<String> outColumnTime = new List<String>();
            MySqlDataReader SelectreaderTime = cmdtime.ExecuteReader();
            for (int i = 0; i < SelectreaderTime.FieldCount; i++)
            {
                if (SelectreaderTime.HasRows)
                    while (SelectreaderTime.Read())
                    {
                        outColumnTime.Add(SelectreaderTime[i].ToString());
                    }
            }
            foreach (string i in outColumnTime)
            {
                inpTime.Value = string.Join(" ", outColumnTime);
            }
            cnn.Close();
            //get time from database


            string SelectsqPhone = "select Phone from mymaps.mapdata";
            MySqlCommand cmdphone = new MySqlCommand(SelectsqPhone, cnn);
            cnn.Open();
            List<String> outColumnPhone = new List<String>();
            MySqlDataReader SelectreaderPhone = cmdphone.ExecuteReader();
            for (int i = 0; i < SelectreaderPhone.FieldCount; i++)
            {
                if (SelectreaderPhone.HasRows)
                    while (SelectreaderPhone.Read())
                    {
                        outColumnPhone.Add(SelectreaderPhone[i].ToString());
                    }
            }
            foreach (string i in outColumnPhone)
            {
                inpphone.Value = string.Join(" ", outColumnPhone);
            }
            cnn.Close();
            //get get phonenumber from database


            string SelectsqType = "select Sports_Type from mymaps.mapdata";
            MySqlCommand cmdtype = new MySqlCommand(SelectsqType, cnn);
            cnn.Open();
            List<String> outColumnType = new List<String>();
            MySqlDataReader SelectreaderType = cmdtype.ExecuteReader();
            for (int i = 0; i < SelectreaderType.FieldCount; i++)
            {
                if (SelectreaderType.HasRows)
                    while (SelectreaderType.Read())
                    {
                        outColumnType.Add(SelectreaderType[i].ToString());
                    }
            }
            foreach (string i in outColumnType)
            {
                inptype.Value = string.Join(" ", outColumnType);
            }
            cnn.Close();
            //get sports_type from database
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
        connetionString = "server=35.203.11.34;database=mymaps;uid=root;pwd=hemuyang0421";
        cnn = new MySqlConnection(connetionString);
        DateTime dt = DateTime.Parse(this.txtime.Text);
        string format = "HH:mm";
        string Query = "insert into mymaps.mapdata(Players,Date_To_Play,Time_To_Play,Phone,Sports_Type,Lat,lng) values('" + this.txplayers.Text + "','" + this.txtdate.Text + "','" + dt.ToString(format) + "','" + this.txphone.Text + "','" + this.txSports.Text + "','" + this.Hiddenlat.Value + "','" + this.Hiddenlng.Value + "');";
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
            lblLat.Value = string.Join(" ", outColumnlat);
        }
        cnn.Close();
        //get the latitude from database


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
            lbllng.Value = string.Join(" ", outColumnlng);
        }
        cnn.Close();
        //get longtitute from mysql database


        string SelectsqlPlayers = "select Players from mymaps.mapdata";
        MySqlCommand cmdPlayers = new MySqlCommand(SelectsqlPlayers, cnn);
        cnn.Open();
        List<String> outColumnPlayers = new List<String>();
        MySqlDataReader SelectreaderPlayers = cmdPlayers.ExecuteReader();
        for (int i = 0; i < SelectreaderPlayers.FieldCount; i++)
        {
            if (SelectreaderPlayers.HasRows)
                while (SelectreaderPlayers.Read())
                {
                    outColumnPlayers.Add(SelectreaderPlayers[i].ToString());
                }
        }
        foreach (string i in outColumnPlayers)
        {
            inpPlayers.Value = string.Join(" ", outColumnPlayers);
        }
        cnn.Close();
        //get Players number from database


        string SelectsqDate = "select Date_To_Play from mymaps.mapdata";
        MySqlCommand cmddate = new MySqlCommand(SelectsqDate, cnn);
        cnn.Open();
        List<String> outColumnDate = new List<String>();
        MySqlDataReader SelectreaderDate = cmddate.ExecuteReader();
        for(int i = 0; i < SelectreaderDate.FieldCount; i++)
        {
            if (SelectreaderDate.HasRows)
                while (SelectreaderDate.Read())
                {
                    outColumnDate.Add(SelectreaderDate[i].ToString());
                }
        }
        foreach (string i in outColumnDate)
        {
            inpDate.Value = string.Join(" ", outColumnDate);
        }
        cnn.Close();
        //get date from database



        string SelectsqTime = "select Time_To_Play from mymaps.mapdata";
        MySqlCommand cmdtime = new MySqlCommand(SelectsqTime, cnn);
        cnn.Open();
        List<String> outColumnTime = new List<String>();
        MySqlDataReader SelectreaderTime = cmdtime.ExecuteReader();
        for (int i = 0; i < SelectreaderTime.FieldCount; i++)
        {
            if (SelectreaderTime.HasRows)
                while (SelectreaderTime.Read())
                {
                    outColumnTime.Add(SelectreaderTime[i].ToString());
                }
        }
        foreach (string i in outColumnTime)
        {
            inpTime.Value = string.Join(" ", outColumnTime);
        }
        cnn.Close();
        //get time from database


        string SelectsqPhone = "select Phone from mymaps.mapdata";
        MySqlCommand cmdphone = new MySqlCommand(SelectsqPhone, cnn);
        cnn.Open();
        List<String> outColumnPhone = new List<String>();
        MySqlDataReader SelectreaderPhone = cmdphone.ExecuteReader();
        for (int i = 0; i < SelectreaderPhone.FieldCount; i++)
        {
            if (SelectreaderPhone.HasRows)
                while (SelectreaderPhone.Read())
                {
                    outColumnPhone.Add(SelectreaderPhone[i].ToString());
                }
        }
        foreach (string i in outColumnPhone)
        {
            inpphone.Value = string.Join(" ", outColumnPhone);
        }
        cnn.Close();
        //get phone number from database


        string SelectsqType = "select Sports_Type from mymaps.mapdata";
        MySqlCommand cmdtype = new MySqlCommand(SelectsqType, cnn);
        cnn.Open();
        List<String> outColumnType = new List<String>();
        MySqlDataReader SelectreaderType = cmdtype.ExecuteReader();
        for (int i = 0; i < SelectreaderType.FieldCount; i++)
        {
            if (SelectreaderType.HasRows)
                while (SelectreaderType.Read())
                {
                    outColumnType.Add(SelectreaderType[i].ToString());
                }
        }
        foreach (string i in outColumnType)
        {
            //lblcountPlayers.Value= outColumn
            inptype.Value = string.Join(" ", outColumnType);
        }
        cnn.Close();
        //get sports_type from database
    }

    protected void btnclose_Click(object sender, EventArgs e)
    {
        
    }
}