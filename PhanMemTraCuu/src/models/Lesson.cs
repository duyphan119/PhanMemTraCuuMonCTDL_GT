using System.Collections.Generic;

namespace PhanMemTraCuu.src.models
{
    public class Lesson
    {
        public string id;
        public string name;
        public string path;
        public string content;
        public Chapter chapter;

        public Lesson()
        {
            
        }

        public Lesson(string id, string name, string path, Chapter chapter)
        {
            this.id = id;
            this.name = name;
            this.path = path;
            this.chapter = chapter;
        }
    }
}
