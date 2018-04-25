<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];

        %>
<%=account.AREANAME + "办事处线下推广业绩明细"%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   

<div id="divIframe" title="业绩明细">

    <div id="ChargeCondition">
    <fieldset>
     <%
            TGProject.Models.Account account = (TGProject.Models.Account)Session["Account"];
            TGProject.Models.TGSOutAchiveAreaCondition condtion = (TGProject.Models.TGSOutAchiveAreaCondition)ViewData["condition"];
            int selectIdx = 0;
            int areaID = 0;
            decimal sortkinds = 0;
            string strDate = string.Empty;
            string gameidx = "0";
            string strDefines = "0,";
            if (condtion != null)
            {
                areaID = condtion.AreaID;
                selectIdx = condtion.selectIndex;
                sortkinds = condtion.ORDERKIND;
                gameidx = condtion.gameidx;
                strDefines = condtion.DefineID;
            }
            else
            {
                areaID = condtion.AreaID;
                selectIdx = 0;
                strDefines = "0,";
            }
        %>
        <span id="areaid"><%=areaID%></span>
        <span id="selectID"><%=selectIdx%></span>
        <span id="sortkinds"><%=sortkinds %></span>
        <span id="gameidx"><%=gameidx%></span>
        <span id="definesstr"><%=strDefines%></span>
     <legend><% =account.AREANAME + "办事处线下推广业绩明细"%></legend>
        <div style="text-align: left">
             <ul class="verticality">
   <li style="color:Black;">所查询时间:
        <span id="startt"><%=condtion.BeginTime.ToShortDateString()%></span>至<span id="endt"><%=condtion.EndTime.ToShortDateString()%></span>
    </li>
            <li style=" vertical-align:bottom">类别:
             <select  style="width:226px;" name="GAME" id="GAME">

                    <option  value="0">所有游戏</option>
                        
                    <%
                        List<TGProject.Models.TGSGAMESHOW> GamesList = (List<TGProject.Models.TGSGAMESHOW>)ViewData["Games"];
                        foreach (TGProject.Models.TGSGAMESHOW gameinfo in GamesList)
                        {
                    %>
                    <option  value="<%=gameinfo.GAMECODE%>">
                        <%=gameinfo.GAMENAME%></option>
                    <%
                        }
                     %>
                </select>
            <span id="test" style="color:Black;"><select name="class" id="Gclass"">
             <%
                    List<TGProject.Models.WModels.TGSDEFINESHOW> DefineList = (List<TGProject.Models.WModels.TGSDEFINESHOW>)ViewData["Define"];
                    foreach (TGProject.Models.WModels.TGSDEFINESHOW define in DefineList)
                      {
                %>
                <option  value="<%=define.DEFINEID%>">
                    <%=define.DTITLE%>
                <%
                    }
                 %>
                </select></span>
                 <button style="margin-left:57px;" class="ui-state-default ui-corner-all"  id="btnSearch"  >查询</button>
                    <br />
            </li>

           </ul>

        </div>
    </fieldset>
    </div>
    <div id="tabs">
    
    <ul>
        <li><a href="#tabs-1">按业绩排列</a></li>
        <li><a href="#tabs-1">按人员排列</a></li>
        
    </ul>
    
     <div id="tabs-1" style="text-align: center">
     

        <table cellpadding="0" cellspacing="0" border="0" 
                
             style="vertical-align:top; width:101%;border:2px solid #000000; margin-left: 0px; border-collapse: collapse;">
         <tr style="background-color:#FFFFFF; font-weight:bold">
            
           <td colspan="5" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           人员信息</td>
           <td colspan="3" style="border: 1px solid #000000;height: 21px;text-align:center;  vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           直接推广</td>
           <td colspan="2" style="border: 1px solid #000000;height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           间接推广</td>
           <td rowspan="2" style="border: 1px solid #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           激活数</td>
           <td rowspan="2" style="border: 1px solid #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           线下推广业绩</td>
           <td rowspan="2" style="border: 1px solid #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           比例</td>
           <td rowspan="2" style="border: 1px solid #000000; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           奖金</td>
           <td rowspan="2" style="border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           办事处排名</td>
           <td rowspan="2" style="border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           大区排名</td>
           <td rowspan="2" style="border: 1px solid #000000;text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           总排名</td>
           </tr>
           
           
           <tr style="background-color:#FFFFFF; font-weight:bold">
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            大区</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            办事处</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            职务</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            姓名</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            帐号</td>
            
             <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            领取数</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费用户数</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费金额</td>
            
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费用户数</td>
            <td style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费金额</td>                    
            </tr>
        <%   
            int i = 0;
            List<TGProject.Models.TGSOutAchiveAreaDetail> AreaDetail = (List<TGProject.Models.TGSOutAchiveAreaDetail>)ViewData["AREADETAIL"];
            if (AreaDetail!=null && AreaDetail.Count > 0)
            {
                foreach (TGProject.Models.TGSOutAchiveAreaDetail rows in AreaDetail)
                {
                    i = i + 1;
                    if (AreaDetail.Count - i != 0)
                    {
        %>
                    <tr>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZONENAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.AREANAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.POPEDOMNAME%>
                        </td>
                            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                             <a href="<%=rows.POPEDOMID%>,<%=rows.UKEY%>"><%=rows.USERNAME %></a>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.UACCOUNT%>
                        </td>
                            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJGETNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSSUM%>
                        </td>
                            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSSUM%></td>
                         <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ACTIVENUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXOUTACHIVE%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXRATIO%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.BONUS%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXBSORDER%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXZONEORDER%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXALLORDER%>
                        </td>

                          </tr>
                            <%}else{
                                int prepage = 1;
                                int nextpage = rows.total;
                                if (rows.page > 1)
                                prepage = rows.page - 1;
                                else prepage = 1;
                                if (rows.page <rows.total)
                                nextpage = rows.page + 1;
                            %>      
                                                <tr>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZONENAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.AREANAME%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.POPEDOMNAME  %>
                        </td>
                            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <a href="<%=rows.POPEDOMID%>,<%=rows.UKEY%>"><%=rows.USERNAME %></a>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.UACCOUNT%>
                        </td>
                            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJGETNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ZJCONSSUM%>
                        </td>
                            <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSNUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.IDCONSSUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.ACTIVENUM%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXOUTACHIVE%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXRATIO%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.BONUS%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXBSORDER%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXZONEORDER%>
                        </td>
                        <td  style="border: 1px solid #000000;height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
                            <%=rows.XXALLORDER%>
                        </td>

                          </tr>          
                    <tr>
                    <td colspan="25" style="height: 20px">
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=1%>)">
                            首页</button>
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=prepage%>)">
                            上一页</button>
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=nextpage%>)">
                            下一页</button>
                        <button class="ui-state-default ui-corner-all" type="button" onclick="loadData(<%=rows.total%>)">
                            末页</button>
                        当前<%=rows.page%>页／共<%=rows.total%>页
                    </td>
                    </tr>
                <% }
                            } %>
                                           
     </table>                 
      <%} %>   
     <table width="100%"></table>
     <center style="margin-top:6px">
         <p style="font-weight: bold">点击人员姓名查看个人详细 </p>
         <button class="ui-state-default ui-corner-all" type="submit" onclick="ReturnPrevious()">返回</button>
     </center>
     
        </div>
    </div>
 </div>
      <%
          if (AreaDetail == null)
        {
            Response.Write("<script>alert('参数错误！')</script>"); 
        }
        
    %>
 <script type="text/javascript">
     var idx = $("#selectID").html();
     var idx = $("#selectID").html();
     var actionstring;
     var gameidx = $("#gameidx").html();
     $('#tabs').tabs();
     $('#Gclass').tabs({ selected: 0 });

     
     $("#Gclass").attr("value", idx)
     if (($('#sortkinds').html() == 1)) {
         $('#tabs').tabs('option', 'selected', 0);
     }
     else {
         $('#tabs').tabs('option', 'selected', 1);
     }
     

      //////////////////////////////////
     $(document).ready(function() {
         $("#GAME").attr("value", gameidx)

         $("#Gclass").empty();

         if ($("#gamidx").html() == "0" || $("#gamidx").html() == 0) {
             $("<option></option>").val(0).text("所有活动").appendTo($("#Gclass"));
         }
         else {
             loadDefine($("#GAME").val());
         }
         $("#GAME").bind('change', function() {
             loadDefine($("#GAME").val());
             if ($("#GAME").val() == 0) {
             }
             else {
             }
         });

         $('#areaid').hide();
         $('#selectID').hide();
         $('#sortkinds').hide();
         $("#gameidx").hide();
         $("#definesstr").hide();
         
         $("#btnSearch").bind('click', function() {
             loadData(1);
         });
         //$("#Gclass").change(function() { loadData(1) });
         $('#tabs').bind('tabsselect', function(event, ui) { loadData2(ui.index) });

         //////////////////////////////////////
         $('td > a').bind('click', function() {
             var begintime = $("#startt").html();

             var endtime = $("#endt").html();

             var href = $(this).attr('href');
             var username = $(this).text();
             var hrefindex = href.split(",");
             var ukey = hrefindex[1];
             var popid = hrefindex[0];
             var content = $($(this).parents().parents()).html();

             if (popid == "7") {
                 var sP643 = BASE64.encode(ukey + ";" + "0,;" + begintime + ";" + endtime + ";" + ""+";" + 0);
                 href = "http://" + location.host + "/ScoreQuery.aspx/LoadTGPerformanceInfo/" + sP643;
                 //alert(href);
                 $(this).attr('href', href);
             }
             else if (popid == "6") {
             var sP644 = BASE64.encode(ukey + ";" + "0,;" + begintime + ";" + endtime + ";" +""+ ";" + 0);
                 href = "http://" + location.host + "/ScoreQuery.aspx/LoadNetbarManagerPerformanceInfo/" + sP644;
                 $(this).attr('href', href);
             }
         });
     });
      //////////////////////////////////

      function loadData(index) {
          actionString = "";
          for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
              var chkName = "mst" + k;
              if ($("#" + chkName).attr("checked") == true) {
                  actionString = actionString + $("#" + chkName).val() + ";";
              }
          }

          if (actionString == undefined || actionString == "undefined" || actionString == "") {
              alert("请选择要查询的活动！");
              return;
          }
          var game = $("#GAME").val();
          var selectindex = $("#Gclass").val();
          //var define = $("#Gclass option:selected").val()
          var beginTime = $("#startt").html();
          var endTime = $("#endt").html();
          var tabsIndex = $("#tabs").tabs().tabs("option", "selected");

          var tabsIndex = $("#tabs").tabs().tabs("option", "selected") + 1;
          parm = actionString + "," + beginTime + "," + endTime + ',' + selectindex + "," + tabsIndex + "," + $("#areaid").html() + "," + index+","+game ;
          var sP641 = BASE64.encode(parm);
          var str = "http://" + location.host + "/ScoreOffice.aspx/OfficeOfflineDetailInfo2/" + sP641;
          location.replace(str);
      }


      function loadData2(index) {
          actionString = "";
          for (k = 0; k <= $('#mdiv').find('INPUT').length; k++) {
              var chkName = "mst" + k;
              if ($("#" + chkName).attr("checked") == true) {
                  actionString = actionString + $("#" + chkName).val() + ";";
              }
          }

          if (actionString == undefined || actionString == "undefined" || actionString == "") {
              alert("请选择要查询的活动！");
              return;
          }
          var game1 = $("#GAME").val();
          var selectindex = $("#Gclass").val();
          //var define = $("#Gclass option:selected").val()
          var beginTime = $("#startt").html();
          var endTime = $("#endt").html();

          var tabsIndex = index + 1;
          parm = actionString + "," + beginTime + "," + endTime + ',' + selectindex + "," + tabsIndex + "," + $("#areaid").html() + "," + 1 + "," + game1;
          var sP642 = BASE64.encode(parm);
          var str = "http://" + location.host + "/ScoreOffice.aspx/OfficeOfflineDetailInfo2/" + sP642;
          location.replace(str);
      }
      function ReturnPrevious() {
          history.go(-1);
      }

      var BASE64 = {
          /**
          * 此变量为编码的key，每个字符的下标相对应于它所代表的编码。
          */
          enKey: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/',
          /**
          * 此变量为解码的key，是一个数组，BASE64的字符的ASCII值做下标，所对应的就是该字符所代表的编码值。
          */
          deKey: new Array(
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
        -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,
        52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
        -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
        15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
        -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
        41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1
    ),
          /**
          * 编码
          */
          encode: function(src) {
              //用一个数组来存放编码后的字符，效率比用字符串相加高很多。
              var str = new Array();
              var ch1, ch2, ch3;
              var pos = 0;
              //每三个字符进行编码。
              while (pos + 3 <= src.length) {
                  ch1 = src.charCodeAt(pos++);
                  ch2 = src.charCodeAt(pos++);
                  ch3 = src.charCodeAt(pos++);
                  str.push(this.enKey.charAt(ch1 >> 2), this.enKey.charAt(((ch1 << 4) + (ch2 >> 4)) & 0x3f));
                  str.push(this.enKey.charAt(((ch2 << 2) + (ch3 >> 6)) & 0x3f), this.enKey.charAt(ch3 & 0x3f));
              }
              //给剩下的字符进行编码。
              if (pos < src.length) {
                  ch1 = src.charCodeAt(pos++);
                  str.push(this.enKey.charAt(ch1 >> 2));
                  if (pos < src.length) {
                      ch2 = src.charCodeAt(pos);
                      str.push(this.enKey.charAt(((ch1 << 4) + (ch2 >> 4)) & 0x3f));
                      str.push(this.enKey.charAt(ch2 << 2 & 0x3f), '=');
                  } else {
                      str.push(this.enKey.charAt(ch1 << 4 & 0x3f), '==');
                  }
              }
              //组合各编码后的字符，连成一个字符串。
              return str.join('');
          },
          /**
          * 解码。
          */
          decode: function(src) {
              //用一个数组来存放解码后的字符。
              var str = new Array();
              var ch1, ch2, ch3, ch4;
              var pos = 0;
              //过滤非法字符，并去掉'='。
              src = src.replace(/[^A-Za-z0-9\+\/]/g, '');
              //decode the source string in partition of per four characters.
              while (pos + 4 <= src.length) {
                  ch1 = this.deKey[src.charCodeAt(pos++)];
                  ch2 = this.deKey[src.charCodeAt(pos++)];
                  ch3 = this.deKey[src.charCodeAt(pos++)];
                  ch4 = this.deKey[src.charCodeAt(pos++)];
                  str.push(String.fromCharCode(
                (ch1 << 2 & 0xff) + (ch2 >> 4), (ch2 << 4 & 0xff) + (ch3 >> 2), (ch3 << 6 & 0xff) + ch4));
              }
              //给剩下的字符进行解码。
              if (pos + 1 < src.length) {
                  ch1 = this.deKey[src.charCodeAt(pos++)];
                  ch2 = this.deKey[src.charCodeAt(pos++)];
                  if (pos < src.length) {
                      ch3 = this.deKey[src.charCodeAt(pos)];
                      str.push(String.fromCharCode((ch1 << 2 & 0xff) + (ch2 >> 4), (ch2 << 4 & 0xff) + (ch3 >> 2)));
                  } else {
                      str.push(String.fromCharCode((ch1 << 2 & 0xff) + (ch2 >> 4)));
                  }
              }
              //组合各解码后的字符，连成一个字符串。
              return str.join('');
          }
      };

      function loadDefine() {
          //定义全局URL以便返回能够找到controls
          $('#test').html('<span id="test" style="color:Black;"><select    style="  width:226px;" name="Gclass" id="Gclass" onchange="return;return class_onclick()"   multiple="multiple"></select></span>');
          $.ajax(
             {
                 url: "http://" + location.host + "/ScoreOffice.aspx/loadDefine/" + encodeURIComponent($("#GAME").val()),
                 type: "POST",
                 dataType: "json",
                 success: loadSuccessed
             });
      }

      function loadSuccessed(result) {
          $("#Gclass").empty();
          var definestr = $("#definesstr").html();
          var definesArray = definestr.split(',');

          if (result.rows.length > 0) {
              $.each(result.rows, function(i, item) {
                  var hasFlg = 0;
                  var routelong = definesArray.length;
                  for (idef = 0; idef < routelong; idef++) {
                      if (definesArray[idef] == item.cell[0]) {
                          hasFlg = 1;
                          break;
                      }
                      else {
                          hasFlg = 0
                      }
                  }
                  if (hasFlg == 1) {
                      $("<option selected='selected'></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
                  }
                  else {
                      $("<option ></option>").val(item.cell[0]).text(item.cell[1]).appendTo($("#Gclass"));
                  }
              });
              $("#Gclass").multiSelect({ selectAll: true, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '% 个活动已被选择' });
          }
          else if ($("#Gclass").val() == 0 || $("#GAME").val() == "0") {
              $("<option selected='selected'></option>").val(0).text("所有活动").appendTo($("#Gclass"));
              $("#Gclass").multiSelect({ selectAll: false, selectAllText: "全选", noneSelected: '请选择活动', oneOrMoreSelected: '所有活动已被选择' });
          }
          else {
              $("#Gclass").multiSelect({ selectAll: false, selectAllText: "全选", noneSelected: '没有该游戏活动', oneOrMoreSelected: '% 个活动已被选择' });
          }

      }
     
   
    </script>
</asp:Content>

