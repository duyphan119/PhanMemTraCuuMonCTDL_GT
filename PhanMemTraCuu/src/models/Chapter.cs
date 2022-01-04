using System.Collections.Generic;

namespace PhanMemTraCuu.src.models
{
    public class Chapter
    {
        public int id;
        public string name;

        public Chapter()
        {
        }

        public Chapter(int id, string name)
        {
            this.id = id;
            this.name = name;
        }
    }
}
