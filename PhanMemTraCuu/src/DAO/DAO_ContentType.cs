using PhanMemTraCuu.src.models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PhanMemTraCuu.src.DAO
{
    public class DAO_ContentType
    {
        private SqlConnection cnn;
        private SqlCommand scm;
        private SqlDataReader reader;

        public DAO_ContentType()
        {
            ConnectDatabase ConnectDB = new ConnectDatabase();
            cnn = ConnectDB.Connect();
        }

        public List<ContentType1> getAll()
        {
            List<ContentType1> contentType1s = new List<ContentType1>();
            string query = "select * from loainoidung";
            cnn.Open();
            scm = new SqlCommand(query, cnn);
            reader = scm.ExecuteReader();
            while (reader.Read())
            {
                ContentType1 contentType1 = new ContentType1();
                contentType1.id = reader.GetString(0);
                contentType1.name = reader.GetString(1);
                contentType1s.Add(contentType1);
            }
            cnn.Close();
            return contentType1s;
        }

        public ContentType1 getById(string id)
        {
            string query = $"select * from loainoidung where maloai = '{id}'";
            cnn.Open();
            scm = new SqlCommand(query, cnn);
            reader = scm.ExecuteReader();
            while (reader.Read())
            {
                ContentType1 contentType1 = new ContentType1();
                contentType1.id = reader.GetString(0);
                contentType1.name = reader.GetString(1);
                cnn.Close();
                return contentType1;
            }
            cnn.Close();
            return null;
        }
    }
}
