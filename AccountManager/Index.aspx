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
            <li><a href="#tabs1">�ֶ���ͣ</a></li>
            <li><a href="#tabs2">��ְ��ͣ</a></li>
            <li><a href="#tabs3">��ʷ��¼</a></li>
        </ul>
        <div id="tabs1">
            <p style="color: Orange; text-align: center;">
                ��������:
                <%=DateTime.Now.ToShortDateString() %><br />
                ����ϸ�˶Ժ�ѡ��������Ϣ, �ύ���޷��޸�!
            </p>
            <fieldset>
                <legend>��ϸ��Ϣ</legend>
                <ul class="verticality">
                    <li>�������´�<br />
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
                            <option value="<%=account.AREAID%>">Ĭ��</option>
                            <%}%>
                        </select>
                    </li>
                    <li>����<br />
                        <%=Html.DropDownList("username", new SelectList(new List<SelectListItem>() { new SelectListItem() { Text = "��ѡ��", Value = "0" } }, "Value", "Text"))%>
                    </li>
                    <li>�˺�: <span id="account"></span></li>
                    <li>ְλ: <span id="place"></span></li>
                    <li>��ע:
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
