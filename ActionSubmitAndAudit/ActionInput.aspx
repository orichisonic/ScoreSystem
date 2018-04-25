<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	活动提交
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<% TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"]; %>
    <span id="power">
        <%=account.POPEDOMID %></span> 
       
        <span id="ukey">
            <%=account.UKEY %></span>
          <span id="myareaid"><%=account.AREAID%></span>
             <%
    
                 //TGProject.Models.WModels.TgsOutachiveCondition condtion =(TGProject.Models.WModels.TgsOutachiveCondition)ViewData["condition"];
            //     DateTime dteBegin;
            //     DateTime dteEnd;
            //int selectIdx = 0;
            //string strByMonth = "";
            //if (condtion != null)
            //{
            //    selectIdx = condtion.selectIndex;
            //    dteBegin = condtion.START;
            //    dteEnd = condtion.END;
            //    strByMonth = condtion.bymonth;
            //}
            //else
            //{
            //    dteBegin = Convert.ToDateTime("2009-9-1");
            //    dteEnd = Convert.ToDateTime("2010-12-1");
            //    selectIdx = 0;
            //}
        %>
        <%--  <span id="begintime"><%=dteBegin.ToShortDateString()%></span>
        <span id="endtime"><%=dteEnd.ToShortDateString()%></span>--%>

 <div id="ChargeCondition">
    <fieldset style="color:Blue">
        <legend>活动提交(总部帐号)</legend>
        <div style="text-align: center">
         <ul class="vertical" style="text-align: left">
         <li></li>
         <li style="vertical-align:bottom; text-align: left;">
             活动提交日期：<span id="ActiveInputDate" style="color:Red"></span> </li>
             <li></li>
             <li style="vertical-align:bottom; text-align: left;">同一单号的不同类型活动请分别提交。 </li>
             <li></li>
             <li style="vertical-align:bottom; text-align: left;">
             活动游戏：<select  style="width:100px;" name="GAME" id="GAME">
                   
                        
                   <%
                        List<TGProject.Models.TGSGAMESHOW> GameList = (List<TGProject.Models.TGSGAMESHOW>)ViewData["Game"];
                        foreach (TGProject.Models.TGSGAMESHOW game in GameList)
                          { 
                    %>
                    <option  value="<%=game.GAMECODE%>">
                        <%=game.GAMENAME%></option>
                    <%
                        }
                     %>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<%--活动类型：--%><select name="ActiveType" style="display:none">
             <% 
              List<TGProject.Models.TGSACTTYPEQUERY> ActiveTypeList = (List<TGProject.Models.TGSACTTYPEQUERY>)ViewData["ActiveType"];
                          foreach (TGProject.Models.TGSACTTYPEQUERY ActiveType in ActiveTypeList)
                          {
                              %>
              <option value="<%=ActiveType.TYPEID%>">
                        <%= ActiveType.TYPENAME%></option>
                    <% }  %>
                 </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;活动单号：<input style="vertical-align:bottom;width: 90px" type="text" name="ASNumber" id="ASNumber"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;活动场次：<input style="vertical-align:bottom;width: 90px" type="text" name="FieldNum" id="FieldNum"/>
             </li>
                   
            </ul>
            <ul class="vertical" style="text-align: left">
            <li></li>
            <li> 
            执行方：<select name="AreaName" id="AreaName" style="margin-left:11px;width:100px;">
             <% 
                 List<TGProject.Models.TGSAREASHOW> AreaNameList = (List<TGProject.Models.TGSAREASHOW>)ViewData["AreaName"];
                 foreach (TGProject.Models.TGSAREASHOW AreaName in AreaNameList)
                          {
                              %>
                      <option value="<%=AreaName.AREAID%>">
                        <%= AreaName.AREANAME%></option>
                    <% }  %>
                 </select>
            </li>
            <li></li>
            </ul>
            <ul class="horizontal" style="text-align: left">
             
                <li>
                <center>
                    <button style="margin-left:20px; vertical-align:bottom" class="ui-state-default ui-corner-all" type="button" onclick="tab1submitInfo()">
                        确认提交
                    </button></center></li>
            </ul>
        </div>
    </fieldset>
</div>
  <script type="text/javascript">
     $("#power").hide();
     $("#ukey").hide();
     $("#myareaid").hide();
      function tab1submitInfo() {

          if ($("#ASNumber").val() == null || $("#ASNumber").val() == "") {
              alert("你还没有输入活动单号!");
              return;
          }
          if ($("#FieldNum").val() == null || $("#FieldNum").val() == "") {
              alert("你还没有输入活动场次!");
              return;

          }
          var intExp = /^[1-9]\d*$/;
          if (!intExp.test($("#FieldNum").val())) {
              alert("请输入以数字构成的活动场次！");

              return;
          }
          var intActID = $("#ASNumber").val();
          var intGameCode = $("#GAME").val();
          var strFieldNum=$("#FieldNum").val();
          var strExecArea = $("#AreaName").val();
          var strUKEY = $("#ukey").val();
        
          $.ajax({
          url: "ActionInputStr/",
              type: "POST",
              data: {
                  ASNUMBER: intActID,
                  GAMECODE: intGameCode,
                  FIELDNUM: strFieldNum,
                  EXECAREA: strExecArea,
                  UKEY: strUKEY

              },
              dataType: "json",
              success: ActionInputSuccess
          });
      }

      function ActionInputSuccess(result) {

          d = new Date();
          var s = "";
          s = s + d.getYear() + "年";
          s += (d.getMonth() + 1) + "月";
          s += d.getDate() + "日  ";


          s += d.getHours() + "时"
          s += d.getMinutes() + "分"
          //        s+=d.getSeconds()




          $("#ActiveInputDate").html(s);
      
          if (result.isSuccess == 0) {
         
                    alert("该单号已存在！");
             }
          
          else if (result.isSuccess == 1) {
              alert("提交成功！");
           }
       else if (result.isSuccess == 2) {
              alert("没有数据！");
           }
       else if (result.isSuccess == 3) {
              alert("太多行！");
           }
       else if (result.isSuccess == 4) {
              alert("索引冲突！");
           }
       else if (result.isSuccess == 5) {
              alert("添加失败！");
           }
      }
  </script> 
</asp:Content>
