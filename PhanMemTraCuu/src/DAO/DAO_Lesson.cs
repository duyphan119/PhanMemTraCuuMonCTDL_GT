using System.Collections.Generic;
using System.Data.SqlClient;
using PhanMemTraCuu.src.models;

namespace PhanMemTraCuu.src.DAO
{
    public class DAO_Lesson
    {
        private SqlConnection cnn;
        private SqlCommand scm;
        private SqlDataReader reader;

        public DAO_Lesson()
        {
            ConnectDatabase ConnectDB = new ConnectDatabase();
            cnn = ConnectDB.Connect();
        }
        public List<Lesson> getAll()
        {
            List<Lesson> lessons = new List<Lesson>();
            DAO_Chapter dao_c = new DAO_Chapter();
            string query = $"select * from baihoc";
            cnn.Open();
            scm = new SqlCommand(query, cnn);
            reader = scm.ExecuteReader();
            while (reader.Read())
            {
                string id_lesson = reader.GetString(0);
                string name = reader.GetString(1);
                string path = @reader.GetString(2);
                string content = reader.GetString(4);
                Chapter chapter = dao_c.getById(reader.GetInt32(3));
                Lesson lesson = new Lesson();
                lesson.id = id_lesson;
                lesson.name = name;
                lesson.path = path;
                lesson.chapter = chapter;
                lesson.content = content;
                lessons.Add(lesson);
            }
            cnn.Close();
            return lessons;
        }
        public List<Lesson> getByChapter(int id_chapter)
        {
            List<Lesson> lessons = new List<Lesson>();
            DAO_Chapter dao_c = new DAO_Chapter();
            string query = $"select * from baihoc where chuongso = {id_chapter}";
            cnn.Open();
            scm = new SqlCommand(query, cnn);
            reader = scm.ExecuteReader();
            while (reader.Read())
            {
                string id_lesson = reader.GetString(0);
                string name = reader.GetString(1);
                string path = @reader.GetString(2);
                string content = reader.GetString(4);
                Chapter chapter = dao_c.getById(reader.GetInt32(3));
                Lesson lesson = new Lesson();
                lesson.id = id_lesson;
                lesson.name = name;
                lesson.path = path;
                lesson.chapter = chapter;
                lesson.content = content;
                lessons.Add(lesson);
            }
            cnn.Close();
            return lessons;
        }
        public Lesson getById(string lessonId)
        {
            DAO_Chapter dao_c = new DAO_Chapter();
            string query = $"select * from baihoc where baiso = '{lessonId}'";
            cnn.Open();
            scm = new SqlCommand(query, cnn);
            reader = scm.ExecuteReader();
            while (reader.Read())
            {
                string id_lesson = reader.GetString(0);
                string name = reader.GetString(1);
                string path = @reader.GetString(2);
                string content = reader.GetString(4);
                Chapter chapter = dao_c.getById(reader.GetInt32(3));
                Lesson lesson = new Lesson();
                lesson.id = id_lesson;
                lesson.name = name;
                lesson.path = path;
                lesson.chapter = chapter;
                lesson.content = content;
                cnn.Close();
                return lesson;
            }
            cnn.Close();
            return null;
        }
    }
}
