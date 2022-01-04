using System.Collections.Generic;
using System.Data.SqlClient;
using PhanMemTraCuu.src.models;

namespace PhanMemTraCuu.src.DAO
{
    public class DAO_Chapter
    {
        private SqlConnection cnn;
        private SqlCommand scm;
        private SqlDataReader reader;

        public DAO_Chapter()
        {
            ConnectDatabase ConnectDB = new ConnectDatabase();
            cnn = ConnectDB.Connect();
        }

        public List<Chapter> getAll()
        {
            List<Chapter> chapters = new List<Chapter>();
            string query = $"select * from chuong";
            cnn.Open();
            scm = new SqlCommand(query, cnn);
            reader = scm.ExecuteReader();
            while (reader.Read())
            {
                int id = reader.GetInt32(0);
                string name = reader.GetString(1);
                Chapter chapter = new Chapter(id, name);
                chapters.Add(chapter);
            }
            cnn.Close();
            return chapters;
        }

        public Chapter getById(int id)
        {
            string query = $"select * from chuong where chuongso = {id}";
            cnn.Open();
            scm = new SqlCommand(query, cnn);
            reader = scm.ExecuteReader();
            if (reader.Read())
            {
                int _id = reader.GetInt32(0);
                string name = reader.GetString(1);
                Chapter chapter = new Chapter(_id, name);
                cnn.Close();
                return chapter;
            }
            cnn.Close();
            return null;
        }
    }
}

