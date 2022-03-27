using qgzx.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_admin_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["maccount"] != null)
            {
                bindData();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    [WebMethod]
    public static bool Delmanager(string ID)
    {
        if (qgzx.BLL.ManagerBusiness.Delmanager(ID))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    [WebMethod]
    public static bool DelAllmanager(string idlist)
    {
        bool b=false;
        string[] sArray = idlist.Split(',');
        foreach (string id in sArray)
        {
            if (qgzx.BLL.ManagerBusiness.Delmanager(id))
            {
                b=true;
            }
            else
            {
                b=false;
            }
        }
        return b;
    }
    void bindData()
    {
        List<Manager> list;
        ////设置数量为DataTable的行数
        //AspNetPager1.RecordCount = qgzx.BLL.ManagerBusiness.GetAllManagerCount();
        ////分页数据源对象
        //PagedDataSource pds = new PagedDataSource();
        ////分页设置为true
        //pds.AllowPaging = true;
        ////设置每一页的大小 （ASPNetPager1.PageSize在控件属性里面设置）
        //pds.PageSize = this.AspNetPager1.PageSize;
        ////当前页面索引是  aspnetpager控件页面索引-1，因为后者的CurrentPageIndex是1开始
        //pds.CurrentPageIndex = this.AspNetPager1.CurrentPageIndex - 1;
        //int pageindex;
        //int pagesize = pds.PageSize;
        ////设置PageDataSource的数据源（DataView）
        //if (Request.QueryString["Page"] == null)
        //{
        //    pageindex = 0;
        //}
        //else
        //{
        //    pageindex = pagesize * (Convert.ToInt32(Request.QueryString["Page"]) - 1);
        //}
        list = qgzx.BLL.ManagerBusiness.GetAllManager();
        admin_list.DataSource = list;
        admin_list.DataBind();
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        bindData();
    }
}