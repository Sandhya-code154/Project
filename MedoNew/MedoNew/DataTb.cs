using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Management;

namespace MedoNew
{
    public class DataTb
    {


        DataTable dt = new DataTable();
        public DataTable CreateDataTable()
        {



            DataColumn d1 = new DataColumn("ProdId", typeof(int));
            DataColumn d2 = new DataColumn("ProdImg", typeof(string));
            DataColumn d3 = new DataColumn("ProdName", typeof(string));
            DataColumn d4 = new DataColumn("ProdQuan", typeof(int));
            DataColumn d5 = new DataColumn("ProdPrice", typeof(string));
            DataColumn d6 = new DataColumn("ChemistId", typeof(int));

            dt.Columns.Add(d1);
            dt.Columns.Add(d2);
            dt.Columns.Add(d3);
            dt.Columns.Add(d4);
            dt.Columns.Add(d5);
            dt.Columns.Add(d6);

            return dt;

        }

        public void AddRecord(int ProdId, string ProdImg, string ProdName, int ProdQuan, string ProdPrice,int ChemistId, DataTable dt)
        {
            dt.Rows.Add(new object[] { ProdId, ProdImg, ProdName, ProdQuan, ProdPrice,ChemistId });
        }
    }
}