/*Stored Procedure'a optional parametre ekleme c#'daki gibi parametreyi belirlediğimiz yerde  varsayılan değer vererek yapıyoruz.
Ağagıdaki Procedure
1. Execute spSearchEmployees -- Parametresiz kullanıldığı için tüm satırları döner. Çünkü Where Null değerler için true dönüyor.
2. Execute spSearchEmployees @Gender = 'Male' -- Sadece male satırları alır.
3. Execute spSearchEmployees @Gender = 'Male', @Age = 29 -- 
*/
Create Proc spSearchEmployees
@Name nvarchar(50) = NULL, --> varsayılan parametreyi verdik.
@Email nvarchar(50) = NULL,
@Age int = NULL,
@Gender nvarchar(50) = NULL
as
Begin
 Select * from tblEmployee where
								(Name = @Name OR @Name IS NULL) AND  --> Kullanıcı parametresiz kullanırsa, tüm değerler Null gelir ve null değerler için Where true dnüyor.
								(Email = @Email OR @Email IS NULL) AND
								(Age = @Age OR @Age IS NULL) AND
								(Gender = @Gender OR @Gender IS NULL) 
End


CREATE TABLE tblEmployee
(
 Id int IDENTITY PRIMARY KEY,
 Name nvarchar(50),
 Email nvarchar(50),
 Age int,
 Gender nvarchar(50),
 HireDate date,
)

Insert into tblEmployee values
('Sara Nan','Sara.Nan@test.com',35,'Female','1999-04-04')
Insert into tblEmployee values
('James Histo','James.Histo@test.com',33,'Male','2008-07-13')
Insert into tblEmployee values
('Mary Jane','Mary.Jane@test.com',28,'Female','2005-11-11')
Insert into tblEmployee values
('Paul Sensit','Paul.Sensit@test.com',29,'Male','2007-10-23')


--Bu Procedureyi bir arama sayfasında kullanailiriz.
WebForm1.aspx:
<table style="font-family:Arial; border:1px solid black">
    <tr>
        <td colspan="4" style="border-bottom: 1px solid black">
            <b>Search Employees</b>
        </td>
    </tr>
    <tr>
        <td> <b>Name</b> </td> <td> <asp:TextBox ID="txtName" runat="server"></asp:TextBox> </td>
        <td> <b>Email</b> </td> <td> <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox> </td>
    </tr>
    <tr>
        <td> <b> Age</b> </td> 
		<td> <asp:TextBox ID="txtAge" runat="server"></asp:TextBox> </td>
        <td> <b>Gender </b> </td>
        <td>
            <asp:DropDownList ID="ddlGender" runat="server">
                <asp:ListItem Text="Any Gender" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr> 
		<td colspan="4"> <asp:Button ID="btnSerach" runat="server" Text="Search" onclick="btnSerach_Click" /> </td>
    </tr>
    <tr>
		<td colspan="4"> <asp:GridView ID="gvEmployees" runat="server"> </asp:GridView> </td> 
	</tr>
</table>

--WebForm1.aspx.cs:
public partial class WebForm1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) { if (!IsPostBack) { GetData(); } }
    protected void btnSerach_Click(object sender, EventArgs e) { GetData(); }

    private void GetData()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spSearchEmployees", con);
            cmd.CommandType = CommandType.StoredProcedure;

            AttachParameter(cmd, "@Name", txtName);
            AttachParameter(cmd, "@Email", txtEmail);
            AttachParameter(cmd, "@Age", txtAge);
            AttachParameter(cmd, "@Gender", ddlGender);

            con.Open();
            gvEmployees.DataSource = cmd.ExecuteReader();
            gvEmployees.DataBind();
        }
    }

    private void AttachParameter(SqlCommand command, string parameterName, Control control)
    {
        if (control is TextBox && ((TextBox)control).Text != string.Empty)
        {
            SqlParameter parameter = new SqlParameter(parameterName, ((TextBox)control).Text);
            command.Parameters.Add(parameter);
        }
        else if (control is DropDownList && ((DropDownList)control).SelectedValue != "-1")
        {
            SqlParameter parameter = new SqlParameter parameterName, ((DropDownList)control).SelectedValue);
            command.Parameters.Add(parameter);
        }
    }
}