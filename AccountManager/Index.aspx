<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Src="../Shared/ExamineControl.ascx" TagName="ExamineControl" TagPrefix="uc1" %>
<%@ Register Src="../Shared/ExamineConditionControl.ascx" TagName="ExamineConditionControl" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <div id="tabs">
        <ul>
            <li><a href="#tabs1">手动封停</a></li>
            <li><a href="#tabs2">离职封停</a></li>
            <li><a href="#tabs3">历史记录</a></li>
        </ul>
        <div id="tabs1">
            <p style="color: Orange; text-align: center;">
                处理日期:
                <%=DateTime.Now.ToShortDateString() %><br />
                请仔细核对和选择以下信息, 提交后无法修改!
            </p>
            <fieldset>
                <legend>详细信息</legend>
                <ul class="verticality">
                    <li>所属办事处<br />
                        <select name="area" id="area">
                            <% TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
                               if (account.POPEDOMID <= 2)
                               {
                                   List<TGProject.Models.TGSAREASHOW> areaList = (List<TGProject.Models.TGSAREASHOW>)ViewData["area"];
                                   foreach (TGProject.Models.TGSAREASHOW area in areaList)
                                   {%>
                            <option value="<%=area.AREAID%>">
                                <%= area.AREANAME%></option>
                            <%}
                               }
                               else
                               {%>
                            <option value="<%=account.AREAID%>">默认</option>
                            <%}%>
                        </select>
                    </li>
                    <li>姓名<br />
                        <%=Html.DropDownList("username", new SelectList(new List<SelectListItem>() { new SelectListItem() { Text = "请选择", Value = "0" } }, "Value", "Text"))%>
                    </li>
                    <li>账号: <span id="account"></span></li>
                    <li>职位: <span id="place"></span></li>
                    <li>备注:
                        <br />
                        <%=Html.TextArea("remark") %></li>
                </ul>
            </fieldset>
        </div>
        <div id="tabs2" style="text-align: center">
            <%Html.RenderPartial("DataGridControl"); %>
        </div>
        <div id="tabs3" style="text-align: center">
            <div>
                <% Html.RenderPartial("ExamineConditionControl"); %>
            </div>
            <div>
                <%Html.RenderPartial("DataGridControl"); %>
            </div>
        </div>
    </div>

    <script type="text/javascript" language="javascript">
        $("#tabs").tabs();
    </script>

    </form>
</asp:Content>
