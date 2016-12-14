using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;

//Linh làm phi ket noi
namespace Quản_Lý_Cửa_Hàng_Tiện_Lợi
{
    public partial class Thông_tin_hàng_hóa : Form
    {
        string cnstr;
        SqlConnection cn;
        DataSet ds;
        public Thông_tin_hàng_hóa()
        {
            InitializeComponent();
        }

        private void Thông_tin_hàng_hóa_Load(object sender, EventArgs e)
        {
            cnstr = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;
            cn = new SqlConnection(cnstr);

            dgvHangHoa.DataSource = GetProductDatabase().Tables[0];
        }
        public DataSet GetProductDatabase()
        {
            //cn.Open();
            try
            {
                string sql = "SELECT * FROM HangHoa";
        SqlDataAdapter da = new SqlDataAdapter(sql, cn);
        //DataSet
        ds = new DataSet();
        da.Fill(ds);
                return ds;

            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
                return null;

            }

            finally
            {
                cn.Close();
            }
        }


        private void txtMaNcc_TextChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void btAdd_Click(object sender, EventArgs e)
        {
            cn.Open();
            string ins = "INSERT INTO HangHoa(MaHH, TenHH, Donvitinh, Dongia,MaLoaiHH) VALUES ('" + txtMaHH.Text + "','" + txtTenHH.Text + "','" + txtDonvitinh.Text + "','" + txtDongia.Text + "','" + txtMaLoaiHH.Text + "')";
            SqlDataAdapter da = new SqlDataAdapter(); //=>Update
            SqlCommand cmd = new SqlCommand(ins,cn);
            cmd.ExecuteNonQuery();
            MessageBox.Show("Thêm Thanh Cong");
            cn.Close();
            dgvHangHoa.DataSource = GetProductDatabase().Tables[0];
        }

        private void rdMaPN_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void btSua_Click(object sender, EventArgs e)
        {
            ////////// UPDATE

            cn.Open();
            string update = "update HangHoa set TenHH= @TenHH,Donvitinh=@Donvitinh,Dongia=@Dongia,MaLoaiHH=@MaLoaiHH where MaHH=@MaHH";
            SqlDataAdapter da = new SqlDataAdapter(); //=>Update
            SqlCommand cmd = new SqlCommand(update,cn);
            cmd.Parameters.Add("@MaHH", SqlDbType.NVarChar, 10, "MaHH");
            cmd.Parameters.Add("@TenHH", SqlDbType.NVarChar, 50, "TenHH");
            cmd.Parameters.Add("@Donvitinh", SqlDbType.NVarChar, 8, "Donvitinh");
            cmd.Parameters.Add("@Dongia", SqlDbType.Int,0, "Dongia");
            cmd.Parameters.Add("@MaLoaiHH", SqlDbType.Int, 0, "MaLoaiHH");
            da.UpdateCommand = cmd;
            da.Update(ds);
            MessageBox.Show("S?a Thanh Cong");
            cn.Close();
           
        }

        private void btRemove_Click(object sender, EventArgs e)
        {
            ////////// DELETE

            cn.Open();
            string Delete = "delete from HangHoa where MaHH=@MaHH";
            SqlDataAdapter da = new SqlDataAdapter(); //=>Update
            SqlCommand cmd = new SqlCommand(Delete, cn);
            cmd.Parameters.Add("@MaHH", SqlDbType.NVarChar, 10, "MaHH");
            
           
            DataSet ds = new DataSet();
            da.Fill(ds);
            dgvHangHoa.DataSource = ds.Tables[0];
            MessageBox.Show("Xóa Thanh Cong");
            
            cn.Close();
            

        }
        // nut tim bi loi nha
        private void btTim_Click(object sender, EventArgs e)
        {

            cn.Open();
            string find = "SELECT * FROM HangHoa WHERE ";
            if (rdMaHH.Checked == true)
            {

                find += "MaHH = " + txtSearch.Text;
            }
            else
                if (rdTênHH.Checked == true)
            {
                find += "TenHH LIKE '%" + txtSearch.Text + "%'";
            }
            else if (rdMaLoaiHH.Checked == true)
            {
                find += "MaLoaiHH =" + txtSearch.Text;
            }

            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection = cn;
            //cmd.CommandText = find;
            //cmd.ExecuteNonQuery();
            //MessageBox.Show("Tìm Thanh Cong");

            //hien thi data tim kiem
            SqlDataAdapter da = new SqlDataAdapter(find, cn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dgvHangHoa.DataSource = ds.Tables[0];// GetProductDatabase().Tables[0];



            //dgvHangHoa.DataSource = GetProductDatabase();
            cn.Close();
        }
    }
}
