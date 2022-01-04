
namespace PhanMemTraCuu.src.gui.usercontrols
{
    partial class ucMain
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtKeyword = new System.Windows.Forms.TextBox();
            this.treeView = new System.Windows.Forms.TreeView();
            this.rtxtContent = new System.Windows.Forms.RichTextBox();
            this.chbLesson = new System.Windows.Forms.CheckBox();
            this.fpnlMenu = new System.Windows.Forms.FlowLayoutPanel();
            this.treeViewRelate = new System.Windows.Forms.TreeView();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.fpnlMenu.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtKeyword
            // 
            this.txtKeyword.Location = new System.Drawing.Point(87, 10);
            this.txtKeyword.Name = "txtKeyword";
            this.txtKeyword.Size = new System.Drawing.Size(179, 25);
            this.txtKeyword.TabIndex = 11;
            this.txtKeyword.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtKeyword_KeyPress);
            // 
            // treeView
            // 
            this.treeView.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.treeView.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.treeView.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.treeView.Location = new System.Drawing.Point(16, 85);
            this.treeView.Name = "treeView";
            this.treeView.ShowNodeToolTips = true;
            this.treeView.Size = new System.Drawing.Size(250, 634);
            this.treeView.TabIndex = 10;
            this.treeView.BeforeSelect += new System.Windows.Forms.TreeViewCancelEventHandler(this.treeView_BeforeSelect);
            this.treeView.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeView_AfterSelect);
            this.treeView.NodeMouseClick += new System.Windows.Forms.TreeNodeMouseClickEventHandler(this.treeView_NodeMouseClick);
            this.treeView.Click += new System.EventHandler(this.treeView_Click);
            this.treeView.Leave += new System.EventHandler(this.treeView_Leave);
            // 
            // rtxtContent
            // 
            this.rtxtContent.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.rtxtContent.BackColor = System.Drawing.Color.White;
            this.rtxtContent.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.rtxtContent.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rtxtContent.Location = new System.Drawing.Point(275, 85);
            this.rtxtContent.Name = "rtxtContent";
            this.rtxtContent.Size = new System.Drawing.Size(775, 634);
            this.rtxtContent.TabIndex = 9;
            this.rtxtContent.Text = "";
            this.rtxtContent.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.rtxtContent_KeyPress);
            // 
            // chbLesson
            // 
            this.chbLesson.AutoSize = true;
            this.chbLesson.Location = new System.Drawing.Point(3, 3);
            this.chbLesson.Name = "chbLesson";
            this.chbLesson.Size = new System.Drawing.Size(138, 21);
            this.chbLesson.TabIndex = 13;
            this.chbLesson.Text = "Nội dung bài học";
            this.chbLesson.UseVisualStyleBackColor = true;
            this.chbLesson.CheckedChanged += new System.EventHandler(this.chbLesson_CheckedChanged);
            // 
            // fpnlMenu
            // 
            this.fpnlMenu.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.fpnlMenu.Controls.Add(this.chbLesson);
            this.fpnlMenu.Location = new System.Drawing.Point(418, 9);
            this.fpnlMenu.Name = "fpnlMenu";
            this.fpnlMenu.Size = new System.Drawing.Size(917, 30);
            this.fpnlMenu.TabIndex = 17;
            // 
            // treeViewRelate
            // 
            this.treeViewRelate.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.treeViewRelate.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.treeViewRelate.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.treeViewRelate.Location = new System.Drawing.Point(1057, 85);
            this.treeViewRelate.Name = "treeViewRelate";
            this.treeViewRelate.ShowNodeToolTips = true;
            this.treeViewRelate.ShowPlusMinus = false;
            this.treeViewRelate.ShowRootLines = false;
            this.treeViewRelate.Size = new System.Drawing.Size(266, 634);
            this.treeViewRelate.TabIndex = 18;
            this.treeViewRelate.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeViewRelate_AfterSelect);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.txtKeyword);
            this.panel1.Controls.Add(this.fpnlMenu);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1338, 46);
            this.panel1.TabIndex = 19;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(13, 13);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(68, 17);
            this.label4.TabIndex = 18;
            this.label4.Text = "Tìm kiếm";
            // 
            // label1
            // 
            this.label1.Font = new System.Drawing.Font("Arial", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(16, 49);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(250, 33);
            this.label1.TabIndex = 19;
            this.label1.Text = "MỤC LỤC";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label2.Font = new System.Drawing.Font("Arial", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(275, 49);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(775, 33);
            this.label2.TabIndex = 21;
            this.label2.Text = "NỘI DUNG";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label3.Font = new System.Drawing.Font("Arial", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(1052, 49);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(271, 33);
            this.label3.TabIndex = 22;
            this.label3.Text = "LIÊN QUAN";
            this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // ucMain
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.Controls.Add(this.treeViewRelate);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.treeView);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.rtxtContent);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.panel1);
            this.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "ucMain";
            this.Size = new System.Drawing.Size(1338, 734);
            this.Load += new System.EventHandler(this.ucMain_Load);
            this.fpnlMenu.ResumeLayout(false);
            this.fpnlMenu.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.TextBox txtKeyword;
        private System.Windows.Forms.TreeView treeView;
        private System.Windows.Forms.RichTextBox rtxtContent;
        private System.Windows.Forms.CheckBox chbLesson;
        private System.Windows.Forms.FlowLayoutPanel fpnlMenu;
        private System.Windows.Forms.TreeView treeViewRelate;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
    }
}
