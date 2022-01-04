using PhanMemTraCuu.src.models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PhanMemTraCuu.src.DAO
{
    public class DAO_LabelKnowlegde
    {
        private SqlConnection cnn;
        private SqlCommand scm;
        private SqlDataReader reader;
        public DAO_LabelKnowlegde()
        {
            ConnectDatabase ConnectDB = new ConnectDatabase();
            cnn = ConnectDB.Connect();
        }

        public List<LabelKnowlegde> getAll(string contentId)
        {
            List<LabelKnowlegde> result = new List<LabelKnowlegde>();
            try
            {
                cnn.Open();
                string query = $"select n.manhan, n.tennhan from noidungbai_nhan nn, nhan n where nn.manhan = n.manhan and mand = '{contentId}'";
                scm = new SqlCommand(query, cnn);
                reader = scm.ExecuteReader();
                while (reader.Read())
                {
                    LabelKnowlegde labelKnowlegde = new LabelKnowlegde();
                    labelKnowlegde.id = reader.GetString(0);
                    labelKnowlegde.name = reader.GetString(1);
                    result.Add(labelKnowlegde);
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
    }
}
