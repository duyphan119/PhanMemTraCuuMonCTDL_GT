using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using PhanMemTraCuu.src.models;

namespace PhanMemTraCuu.src.DAO
{
    public class DAO_Content
    {
        private SqlConnection cnn;
        private SqlCommand scm;
        private SqlDataReader reader;

        public DAO_Content()
        {
            ConnectDatabase ConnectDB = new ConnectDatabase();
            cnn = ConnectDB.Connect();
        }

        public List<Content> getAll()
        {
            List<Content> contents = new List<Content>();
            string query = "select * from noidungbaihoc";
            cnn.Open();
            scm = new SqlCommand(query, cnn);
            reader = scm.ExecuteReader();
            DAO_ContentType dao_ct = new DAO_ContentType();
            DAO_Lesson dao_l = new DAO_Lesson();
            while (reader.Read())
            {
                Content content = new Content();
                content.id = reader.GetString(0);
                content.name = reader.GetString(1);
                content.start = reader.GetInt32(2);
                content.end = reader.GetInt32(3);
                content.type = dao_ct.getById(reader.GetString(4));
                content.lesson = dao_l.getById(reader.GetString(5));
                contents.Add(content);
            }
            cnn.Close();
            return contents;
        }

        public List<Content> getByType(string typeId)
        {
            List<Content> result = new List<Content>();
            try
            {
                DAO_Lesson dao_l = new DAO_Lesson();
                cnn.Open();
                string query = $@"select * from noidungbaihoc where maloai = '{typeId}'";
                scm = new SqlCommand(query, cnn);
                reader = scm.ExecuteReader();
                DAO_ContentType dao_ct = new DAO_ContentType();
                while (reader.Read())
                {
                    Content content = new Content();
                    content.id = reader.GetString(0);
                    content.name = reader.GetString(1);
                    content.start = reader.GetInt32(2);
                    content.end = reader.GetInt32(3);
                    content.type = dao_ct.getById(reader.GetString(4));
                    content.lesson = dao_l.getById(reader.GetString(5));
                    result.Add(content);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                cnn.Close();
            }
            return result;
        }

        public List<Content> getByLabelKnowlegde(string LabelKnowlegdeId)
        {
            List<Content> result = new List<Content>();
            try
            {
                DAO_Lesson dao_l = new DAO_Lesson();
                cnn.Open(); 
                string query = $@"select nd.mand, nd.tennd, nd.batdau, nd.ketthuc, nd.maloai, nd.baiso 
                    from noidungbai_nhan nn, noidungbaihoc nd where nn.mand = nd.mand and manhan = '{LabelKnowlegdeId}'";
                scm = new SqlCommand(query, cnn);
                reader = scm.ExecuteReader();
                DAO_ContentType dao_ct = new DAO_ContentType();
                while (reader.Read())
                {
                    Content content = new Content();
                    content.id = reader.GetString(0);
                    content.name = reader.GetString(1);
                    content.start = reader.GetInt32(2);
                    content.end = reader.GetInt32(3);
                    content.type = dao_ct.getById(reader.GetString(4));
                    content.lesson = dao_l.getById(reader.GetString(5));
                    result.Add(content);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                cnn.Close();
            }
            return result;
        }

        public Content getById(string contentId)
        {
            string query = $"select * from noidungbaihoc where mand = '{contentId}'";
            DAO_Lesson dao_l = new DAO_Lesson();
            cnn.Open();
            scm = new SqlCommand(query, cnn);
            reader = scm.ExecuteReader();
            DAO_ContentType dao_ct = new DAO_ContentType();
            while (reader.Read())
            {
                Content content = new Content();
                content.id = reader.GetString(0);
                content.name = reader.GetString(1);
                content.start = reader.GetInt32(2);
                content.end = reader.GetInt32(3);
                content.type = dao_ct.getById(reader.GetString(4));
                content.lesson = dao_l.getById(reader.GetString(5));
                cnn.Close();
                return content;
            }
            cnn.Close();
            return null;
        }
    }
}
