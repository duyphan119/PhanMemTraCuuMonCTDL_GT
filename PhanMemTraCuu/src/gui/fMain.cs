using PhanMemTraCuu.src.gui.usercontrols;
using System;
using System.Drawing;
using System.Windows.Forms;

namespace PhanMemTraCuu
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }


        private void Form1_Load(object sender, EventArgs e)
        {
            pnlView.Controls.Add(new ucMain());
        }

        private void createToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pnlView.Controls.Clear();
            pnlView.Controls.Add(new ucLesson());

        }
    }
}
