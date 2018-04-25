<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
审批
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">未审批(1)</a></li>
            <li><a href="#tabs-2">大区审批(2)</a></li>
            <li><a href="#tabs-3">总部审批(3)</a></li>
            <li><a href="#tabs-4">通过(4)</a></li>
            <li><a href="#tabs-5">未通过(5)</a></li>
        </ul>
        <div id="tabs-1">
            <fieldset>
                <legend>未审批</legend>
                
            </fieldset>
            <p style="text-align: center"><button id="tab1-button" class="fg-button ui-state-default ui-corner-left" type="button" onclick="tab1-submitInfo()">提交</button></p>
        </div>
        <div id="tabs-2">
            <fieldset>
                <legend>大区审批</legend>
             </fieldset>
                <p style="text-align: center"><button id="tab2-button" class="fg-button ui-state-default ui-corner-left" type="button" onclick="tab2-submitInfo()">提交</button></p>
        </div>
        <div id="tabs-3">
            <fieldset>
                <legend>总部审批</legend>
            </fieldset>
            <p style="text-align: center"><button id="tab3-button" class="fg-button ui-state-default ui-corner-left" type="button" onclick="tab3-submitInfo()">提交</button></p>
        </div>
        <div id="tabs-4">
            <fieldset>
                <legend>通过</legend>
            </fieldset>
            <p style="text-align: center"><button id="tab4-button" class="fg-button ui-state-default ui-corner-left" type="button" onclick="tab4-submitInfo()">提交</button>
            </p>
        </div>
        <div id="tabs-5">
            <fieldset>
                <legend>未通过</legend>
            </fieldset>
            <p style="text-align: center"><button id="Button1" class="fg-button ui-state-default ui-corner-left" type="button" onclick="tab4-submitInfo()">提交</button>
            </p>
        </div>
    </div>

    <script type="text/javascript">
        $('#tabs').tabs();
    </script>

</asp:Content>
