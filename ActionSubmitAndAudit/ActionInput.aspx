<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	��ύ
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
        <legend>��ύ(�ܲ��ʺ�)</legend>
        <div style="text-align: center">
         <ul class="vertical" style="text-align: left">
         <li></li>
         <li style="vertical-align:bottom; text-align: left;">
             ��ύ���ڣ�<span id="ActiveInputDate" style="color:Red"></span> </li>
             <li></li>
             <li style="vertical-align:bottom; text-align: left;">ͬһ���ŵĲ�ͬ���ͻ��ֱ��ύ�� </li>
             <li></li>
             <li style="vertical-align:bottom; text-align: left;">
             ���Ϸ��<select  style="width:100px;" name="GAME" id="GAME">
                   
                        
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
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<%--����ͣ�--%><select name="ActiveType" style="display:none">
             <% 
              List<TGProject.Models.TGSACTTYPEQUERY> ActiveTypeList = (List<TGProject.Models.TGSACTTYPEQUERY>)ViewData["ActiveType"];
                          foreach (TGProject.Models.TGSACTTYPEQUERY ActiveType in ActiveTypeList)
                          {
                              %>
              <option value="<%=ActiveType.TYPEID%>">
                        <%= ActiveType.TYPENAME%></option>
                    <% }  %>
                 </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;����ţ�<input style="vertical-align:bottom;width: 90px" type="text" name="ASNumber" id="ASNumber"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;����Σ�<input style="vertical-align:bottom;width: 90px" type="text" name="FieldNum" id="FieldNum"/>
             </li>
                   
            </ul>
            <ul class="vertical" style="text-align: left">
            <li></li>
            <li> 
            ִ�з���<select name="AreaName" id="AreaName" style="margin-left:11px;width:100px;">
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
                        ȷ���ύ
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
              alert("�㻹û����������!");
              return;
          }
          if ($("#FieldNum").val() == null || $("#FieldNum").val() == "") {
              alert("�㻹û����������!");
              return;

          }
          var intExp = /^[1-9]\d*$/;
          if (!intExp.test($("#FieldNum").val())) {
              alert("�����������ֹ��ɵĻ���Σ�");

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
          s = s + d.getYear() + "��";
          s += (d.getMonth() + 1) + "��";
          s += d.getDate() + "��  ";


          s += d.getHours() + "ʱ"
          s += d.getMinutes() + "��"
          //        s+=d.getSeconds()




          $("#ActiveInputDate").html(s);
      
          if (result.isSuccess == 0) {
         
                    alert("�õ����Ѵ��ڣ�");
             }
          
          else if (result.isSuccess == 1) {
              alert("�ύ�ɹ���");
           }
       else if (result.isSuccess == 2) {
              alert("û�����ݣ�");
           }
       else if (result.isSuccess == 3) {
              alert("̫���У�");
           }
       else if (result.isSuccess == 4) {
              alert("������ͻ��");
           }
       else if (result.isSuccess == 5) {
              alert("���ʧ�ܣ�");
           }
      }
  </script> 
</asp:Content>
