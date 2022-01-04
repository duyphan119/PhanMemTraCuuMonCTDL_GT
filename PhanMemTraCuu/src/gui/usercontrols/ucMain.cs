using Microsoft.Office.Interop.Word;
using PhanMemTraCuu.src.DAO;
using PhanMemTraCuu.src.models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Windows.Forms;

//Dùng package Microsoft.Office.Interop.Word

namespace PhanMemTraCuu.src.gui.usercontrols
{
    public partial class ucMain : UserControl
    {
        private DAO_Chapter dao_c = new DAO_Chapter();
        private DAO_Lesson dao_l = new DAO_Lesson();
        private DAO_ContentType dao_ct = new DAO_ContentType();
        private DAO_Content dao_con = new DAO_Content();
        private DAO_LabelKnowlegde dao_lk = new DAO_LabelKnowlegde();
        private List<Chapter> chapters = new List<Chapter>();
        private List<ContentType1> contentType1s = new List<ContentType1>();
        private List<Content> contents = new List<Content>();
        private List<string> fileResults = new List<string>();
        private TreeNode nodeClicked = new TreeNode();
        private List<System.Windows.Forms.CheckBox> checkBoxes = new List<System.Windows.Forms.CheckBox>();
        public ucMain()
        {
            InitializeComponent();
            Dock = DockStyle.Fill;
            chapters = dao_c.getAll();
            contentType1s = dao_ct.getAll();
            contents = dao_con.getAll();
            renderContentType();
            chbLesson.Checked = true;
        }

        public void renderContentType()
        {
            checkBoxes.Clear();
            contentType1s.ForEach(contentType1 =>
            {
                System.Windows.Forms.CheckBox checkBox = new System.Windows.Forms.CheckBox();
                checkBox.Name = contentType1.id;
                checkBox.Text = contentType1.name;
                checkBox.AutoSize = true;
                checkBox.CheckedChanged += new EventHandler(checkMenu);
                checkBoxes.Add(checkBox);
                fpnlMenu.Controls.Add(checkBox);
            });
        }

        private void checkMenu(object sender, EventArgs e)
        {
            System.Windows.Forms.CheckBox checkBox = sender as System.Windows.Forms.CheckBox;
            if(checkBox.Checked == true)
            {
                TreeNode root = new TreeNode();
                root.Name = $"Node{checkBox.Name}";
                root.Text = checkBox.Text;
                treeView.Nodes.Add(root);
                initContentType(root, checkBox.Name);
            }
            else
            {
                TreeNode[] tn = treeView.Nodes.Find($"Node{checkBox.Name}", true);
                if (tn.Length > 0) 
                {
                    treeView.Nodes.Remove(tn[0]);
                }
            }
        }

        
       

        public void showFileStartEnd(string pathFile, int start, int end)
        {
            try
            {
                rtxtContent.ReadOnly = false;
                object readOnly = true;
                object visible = true;
                object save = false;
                object fileName = pathFile;
                object missing = Type.Missing;
                object newTemplate = false;
                object docType = 0;
                _Document oDoc = null;
                _Application oWord = new Microsoft.Office.Interop.Word.Application() { Visible = false };
                oDoc = oWord.Documents.Open(
                        ref fileName, ref missing, ref readOnly, ref missing,
                        ref missing, ref missing, ref missing, ref missing,
                        ref missing, ref missing, ref missing, ref visible,
                        ref missing, ref missing, ref missing, ref missing);
                oDoc.FormattingShowParagraph = true;
                oDoc.ActiveWindow.Selection.WholeStory();
                int i = 0;
                int paraStart = 0;
                int paraEnd = 0;
                int countTables = 0;
                //Tìm vị trí trong file word
                foreach (Microsoft.Office.Interop.Word.Paragraph p in oDoc.ActiveWindow.Selection.Paragraphs)
                {
                    if (end == -1)
                    {
                        if (i < start)
                        {
                            paraEnd = paraStart += p.Range.Text.Length;
                            countTables += p.Range.Tables.Count;
                        }
                        else
                        {
                            paraEnd += p.Range.Text.Length;
                            countTables += p.Range.Tables.Count;
                        }
                    }
                    else
                    {
                        if (i < start)
                        {
                            paraEnd = paraStart += p.Range.Text.Length;
                            countTables += p.Range.Tables.Count;
                        }
                        if (i <= end && i >= start)
                        {
                            paraEnd += p.Range.Text.Length;
                            countTables += p.Range.Tables.Count;
                        }
                    }
                    i++;
                }
                oDoc.ActiveWindow.Selection.Start = paraStart - countTables;//Bắt đầu copy
                oDoc.ActiveWindow.Selection.End = paraEnd - countTables;

                oDoc.ActiveWindow.Selection.Copy();
                IDataObject data = Clipboard.GetDataObject();
                Console.WriteLine(data.GetData(DataFormats.Text).ToString());
                rtxtContent.Rtf = data.GetData(DataFormats.Rtf).ToString();
                oWord.Quit(ref missing, ref missing, ref missing);
                rtxtContent.ReadOnly = true;
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        public void showFile(string pathFile)
        {
            rtxtContent.ReadOnly = false;
            object readOnly = true;
            object visible = true;
            object save = false;
            object fileName = pathFile;
            object missing = Type.Missing;
            object newTemplate = false;
            object docType = 0;
            _Document oDoc = null;
            _Application oWord = new Microsoft.Office.Interop.Word.Application() { Visible = false };
            oDoc = oWord.Documents.Open(
                    ref fileName, ref missing, ref readOnly, ref missing,
                    ref missing, ref missing, ref missing, ref missing,
                    ref missing, ref missing, ref missing, ref visible,
                    ref missing, ref missing, ref missing, ref missing);

            oDoc.FormattingShowParagraph = true;
            //copy hết nội dung file word
            oDoc.ActiveWindow.Selection.WholeStory();
            oDoc.ActiveWindow.Selection.Copy();
            IDataObject data = Clipboard.GetDataObject();
            //Lấy nội dung đã copy hiển thị lên richtextbox
            rtxtContent.Rtf = data.GetData(DataFormats.Rtf).ToString();
            oWord.Quit(ref missing, ref missing, ref missing);
            rtxtContent.ReadOnly = true;
        }
        private void rtxtContent_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = true;
            if (char.IsControl(e.KeyChar)) e.Handled = true;
        }

        private void ucMain_Load(object sender, EventArgs e)
        {
            
        }
        //bắt đầu
        public int KMPSearch(string pat, string txt)
        {
            int M = pat.Length;
            int N = txt.Length;
            int result = 0;

            // create lps[] that will hold the longest
            // prefix suffix values for pattern
            int[] lps = new int[M];
            int j = 0; // index for pat[]

            // Preprocess the pattern (calculate lps[]
            // array)
            computeLPSArray(pat, M, lps);

            int i = 0; // index for txt[]
            while (i < N)
            {
                if (pat[j] == txt[i])
                {
                    j++;
                    i++;
                }
                if (j == M)
                {
                    result++;
                    j = lps[j - 1];
                }

                // mismatch after j matches
                else if (i < N && pat[j] != txt[i])
                {
                    // Do not match lps[0..lps[j-1]] characters,
                    // they will match anyway
                    if (j != 0)
                        j = lps[j - 1];
                    else
                        i = i + 1;
                }
            }
            return result;
        }

        public void computeLPSArray(string pat, int M, int[] lps)
        {
            // length of the previous longest prefix suffix
            int len = 0;
            int i = 1;
            lps[0] = 0; // lps[0] is always 0

            // the loop calculates lps[i] for i = 1 to M-1
            while (i < M)
            {
                if (pat[i] == pat[len])
                {
                    len++;
                    lps[i] = len;
                    i++;
                }
                else // (pat[i] != pat[len])
                {
                    // This is tricky. Consider the example.
                    // AAACAAAA and i = 7. The idea is similar
                    // to search step.
                    if (len != 0)
                    {
                        len = lps[len - 1];

                        // Also, note that we do not increment
                        // i here
                    }
                    else // if (len == 0)
                    {
                        lps[i] = len;
                        i++;
                    }
                }
            }
        }
        //kết thúc
        
        private void chbLesson_CheckedChanged(object sender, EventArgs e)
        {
            if (chbLesson.Checked == true)
            {
                TreeNode root = new TreeNode();
                root.Name = "NoiDungBaiHoc";
                root.Text = "Nội dung bài học";
                treeView.Nodes.Add(root);

                initLesson(root);
            }
            else
            {
                TreeNode[] tn = treeView.Nodes.Find("NoiDungBaiHoc", true);
                if (tn.Length > 0)
                {
                    treeView.Nodes.Remove(tn[0]);
                }
            }
        }

        public void initLesson(TreeNode root)
        {
            chapters.ForEach(chapter =>
            {
                TreeNode node = new TreeNode();
                node.Name = $"{chapter.id}";
                node.Text = $"Chương {chapter.id}: {chapter.name}";
                List<Lesson> lessons = dao_l.getByChapter(chapter.id);
                lessons.Sort((l1, l2) =>
                {
                    if (Convert.ToInt32(l1.id.Split('.')[1]) > Convert.ToInt32(l2.id.Split('.')[1]))
                    {
                        return 1;
                    }
                    if (Convert.ToInt32(l1.id.Split('.')[1]) < Convert.ToInt32(l2.id.Split('.')[1]))
                    {
                        return -1;
                    }
                    return 0;
                });
                lessons.ForEach(lesson =>
                {
                    TreeNode child = new TreeNode();
                    child.Name = $"{lesson.id}";
                    child.Text = $"{lesson.id.Split('.')[0]}.{lesson.id.Split('.')[1]}: {lesson.name}";
                    node.Nodes.Add(child);
                });
                root.Nodes.Add(node);
            });
        }
        public void initContentType(TreeNode root, string typeId)
        {
            if(txtKeyword.Text == "")
            {
                contents.FindAll(content => content.type.id == typeId).ForEach(content =>
                {
                    TreeNode node = new TreeNode();
                    node.Name = $"{content.id}";
                    node.Text = $"{content.name.Split('.')[0]}";

                    root.Nodes.Add(node);
                });
            }
            else
            {
                contents.FindAll(content => content.type.id == typeId && KMPSearch(txtKeyword.Text.ToLower(), content.name.ToLower()) > 0).ForEach(content =>
                {

                    TreeNode node = new TreeNode();
                    node.Name = $"{content.id}";
                    node.Text = $"{content.name.Split('.')[0]}";

                    root.Nodes.Add(node);
                });
            }
        }
        private void treeView_AfterSelect(object sender, TreeViewEventArgs e)
        {
            TreeNode node = treeView.SelectedNode;
            if (node != null)
            {
                Lesson lesson = dao_l.getById(node.Name);
                TreeNode parent = node.Parent;
                if (lesson != null)
                {
                    showFile(Path.GetFullPath(lesson.path));
                }
                else
                {
                    string contentId = node.Name;
                    Content content = dao_con.getById(contentId);
                    if (content != null)
                    {
                        showFileStartEnd(Path.GetFullPath(content.lesson.path), content.start, content.end);

                        //kiểm tra kiến thức liên quan
                        treeViewRelate.Nodes.Clear();
                        
                        dao_lk.getAll(content.id).ForEach(label =>
                        {
                            dao_con.getByLabelKnowlegde(label.id).ForEach(ct =>
                            {
                                if (ct.id != content.id)
                                {
                                    
                                    TreeNode relateNode = new TreeNode();
                                    relateNode.Name = $"relate{ct.id}";
                                    relateNode.Text = ct.name.Split('.')[0];

                                    if (!treeViewRelate.Nodes.Contains(relateNode))
                                    {
                                        treeViewRelate.Nodes.Add(relateNode);
                                    }
                                }
                            });
                        });
                    }
                }
            }
        }

        private void treeViewRelate_AfterSelect(object sender, TreeViewEventArgs e)
        {
            //Click vào nội dung liên quan
            TreeNode node = treeViewRelate.SelectedNode;
            if (node != null)
            {
                string contentId = node.Name.Substring(6);
                Content content = dao_con.getById(contentId);
                if (content != null)
                {
                    showFileStartEnd(Path.GetFullPath(content.lesson.path), content.start, content.end);
                }
            }
        }

        private void treeView_BeforeSelect(object sender, TreeViewCancelEventArgs e)
        {
            treeView.Update();
        }

        private void treeView_Leave(object sender, EventArgs e)
        {

        }
        private void treeView_Click(object sender, EventArgs e)
        {
            
        }

        private void treeView_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            
        }

        private void txtKeyword_KeyPress(object sender, KeyPressEventArgs e)
        {
            if(e.KeyChar == (char)13)
            {
                if(chbLesson.Checked == false)
                {
                    chbLesson.Checked = true;
                }
                chbLesson.Checked = true;
                checkBoxes.ForEach(ch =>
                {
                    if (ch.Checked == false)
                    {
                        ch.Checked = true;
                    }
                });
                List<Chapter> chapterFound = new List<Chapter>();
                string keyword = txtKeyword.Text;
                treeView.Nodes.Clear();
                TreeNode root = new TreeNode();
                root.Name = "NoiDungBaiHoc";
                root.Text = "Nội dung bài học";
                treeView.Nodes.Add(root);
                if (txtKeyword.Text == "")
                {
                    chapters.ForEach(chapter =>
                    {
                        TreeNode node = new TreeNode();
                        node.Name = $"{chapter.id}";
                        node.Text = $"Chương {chapter.id}: {chapter.name}";
                        List<Lesson> lessons = dao_l.getByChapter(chapter.id);

                        lessons.Sort((l1, l2) =>
                        {
                            if (Convert.ToInt32(l1.id.Split('.')[1]) > Convert.ToInt32(l2.id.Split('.')[1]))
                            {
                                return 1;
                            }
                            if (Convert.ToInt32(l1.id.Split('.')[1]) < Convert.ToInt32(l2.id.Split('.')[1]))
                            {
                                return -1;
                            }
                            return 0;
                        });
                        lessons.ForEach(lesson =>
                        {
                            TreeNode child = new TreeNode();
                            child.Name = $"{lesson.id}";
                            child.Text = $"{lesson.id.Split('.')[0]}.{lesson.id.Split('.')[1]}: {lesson.name}";
                            node.Nodes.Add(child);
                        });
                        root.Nodes.Add(node);
                    });
                }
                else
                {
                    
                    chapters.ForEach(chapter =>
                    {
                        TreeNode node = new TreeNode();
                        node.Name = $"{chapter.id}";
                        node.Text = $"Chương {chapter.id}: {chapter.name}";
                        List<Lesson> lessons = dao_l.getByChapter(chapter.id).FindAll(lesson => KMPSearch(txtKeyword.Text.ToLower(), lesson.content.ToLower()) > 0);

                        lessons.Sort((l1, l2) =>
                        {
                            if (Convert.ToInt32(l1.id.Split('.')[1]) > Convert.ToInt32(l2.id.Split('.')[1]))
                            {
                                return 1;
                            }
                            if (Convert.ToInt32(l1.id.Split('.')[1]) < Convert.ToInt32(l2.id.Split('.')[1]))
                            {
                                return -1;
                            }
                            return 0;
                        });
                        lessons.ForEach(lesson =>
                        {
                            TreeNode child = new TreeNode();
                            child.Name = $"{lesson.id}";
                            child.Text = $"{lesson.id.Split('.')[0]}.{lesson.id.Split('.')[1]}: {lesson.name}";
                            node.Nodes.Add(child);
                        });
                        if (node.Nodes.Count != 0)
                        {
                            root.Nodes.Add(node);
                        }
                    });
                    if (root.Nodes.Count == 0)
                    {
                        root.Text = "Nội dung bài học";
                    }
                }
                dao_ct.getAll().ForEach(con =>
                {
                    TreeNode _root = new TreeNode();
                    _root.Name = $"Node{con.id}";
                    _root.Text = con.name;
                    treeView.Nodes.Add(_root);
                    initContentType(_root, con.id);
                });
                //Thêm file word vào folder
                //OpenFileDialog openFileDialog = new OpenFileDialog();

                //openFileDialog.InitialDirectory = @"../../";
                //if (openFileDialog.ShowDialog() == DialogResult.OK)
                //{
                //    string sourceFile = openFileDialog.FileName;
                //    string fileName = Path.GetFileName(sourceFile);
                //    string folderPath = Path.GetDirectoryName(sourceFile);
                //    string targetPath = @"../../NoiDungBaiHoc/Chuong3";
                //MessageBox.Show(folderPath);

                //string destFile = Path.Combine(targetPath, fileName);

                //Directory.CreateDirectory(targetPath);

                //File.Copy(sourceFile, destFile, true);

                //}
                //FolderBrowserDialog folderBrowserDialog = new FolderBrowserDialog();
                //if (folderBrowserDialog.ShowDialog() == DialogResult.OK)
                //{
                //    MessageBox.Show(folderBrowserDialog.SelectedPath);
                //}
            }
        }
    }
}
