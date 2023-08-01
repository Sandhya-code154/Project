using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace MedoNew
{
    public class DB
    {

        public SqlConnection con=null;
        public SqlCommand Cmd=null;
        int result = 0;
        //Get Get ConnectionString
        public string GetConString()

        {
            return ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        }

        //Insert,Update,Delete
        public int ExecuteQuery(string Query)
        {
            con = new SqlConnection(GetConString());
            try
            {
                if (con.State== ConnectionState.Closed)
                {
                    con.Open();
                }

                Cmd = new SqlCommand(Query,con);
                result=Cmd.ExecuteNonQuery();

            }
            catch
            {
                return -1;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }       
            return result;
        }

        //Get Data from DB

        public DataSet GetDataSet(string query)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter dr = new SqlDataAdapter();
            con = new SqlConnection(GetConString());
            try
            {
                Cmd = new SqlCommand(query,con);
                dr = new SqlDataAdapter(Cmd);
                dr.Fill(ds);
                return ds;
            }
            catch(Exception ex)
            {
                throw ex;
            }

            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }


    }

}