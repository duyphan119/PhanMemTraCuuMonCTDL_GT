using System.Data.SqlClient;

namespace PhanMemTraCuu.src.DAO
{
    public class ConnectDatabase
    {
        public SqlConnection Connect()
        {
            return new SqlConnection(
                @"Data Source=DESKTOP-NIULDEP\SQLEXPRESS;Initial Catalog=PhanMemTraCuuMonCTDL_GT1;User ID=sa;Password=password"
            );
        }
    }
}
