<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	NetbarManager
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <form id="form1">
     <div id="tabs">
        <ul>
            <li><a href="#tabs-1">***网吧主管，推广帐号：******</a></li>
           
       </ul>
     
  <div id="tabs-1">
    
    <fieldset>
        <legend>查询条件</legend>
        <div style="text-align: left">
            <ul class="verticality">
             <li><input name="rd1" type="radio" value="-1" checked="checked"/>按日期查询（数据为24小时刷新）开始日期    <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)" value="2009-9-1"/>
             结束日期 <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="2010-12-1"/></li>
           </ul>

            <ul class="verticality">
             <li ><input name="rd1" type="radio" value="0"/>按月份查询（每月25日起可查询当月数据） 
                 <input type="text" name="endTime" id="Text1" style="width: 90px" onfocus="setday(this)" value="2009-9-1"/><br /></li>
                    </ul>
             <ul class="verticality">
                <li>类别：<%=Html.DropDownList("tab3-setSalary", new SelectList(new List<SelectListItem>() 
                        { 
                           new SelectListItem() { Text = "总业绩", Value = "0" }
                        }, "Value", "Text"))%>    <button class="ui-state-default ui-corner-all" type="submit" onclick="loadNetBarReview()">
                        查询
                      </button></li>
           </ul>
           <%   
                        //List<TGProject.Models.WModels.TGSNETBARBYSTATUS> barList = (List<TGProject.Models.WModels.TGSNETBARBYSTATUS>)ViewData["NetBar"];
                        //   if (barList.Count >0)
                        //   {
                               %><br />
&nbsp;  <table cellpadding="0" cellspacing="0" border="0" 
                style="vertical-align:top; width:101%; border:1px none Black;">
  <tr style="background-color:#E6E8FA"  >
            
           <td colspan="5" 
            style="height: 21px;text-align:center; vertical-align:middle; color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           人员信息</td>
           <td colspan="6" 
            style="height: 21px;text-align:center;  vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           直接推广</td>
           <td colspan="2" 
            style="height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           间接推广</td>
         
           <td colspan="3" 
            style="height: 21px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;   border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           其他推广</td>
            <td rowspan="2" 
               style="width: 54px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           业绩</td>
            <td rowspan="2" 
            
               style="width: 30px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           比例</td>
            <td rowspan="2" 
            
               style="width: 36px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           人均业绩</td>
           <td rowspan="2" 
            style="width: 30px;text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
           推广成本</td>
           </tr>
           <tr style="background-color: #E6E8FA">
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            大区</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            办事处</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            职务</td>
             <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            姓名</td>
             <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            帐号</td>
             <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            绑定用户数</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费用户数</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费金额</td>
                  <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费转换率</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            有效用户数</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            有效转换率</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费用户数</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费金额</td>
                         <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            绑定用户数</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px; width:40px;  border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费用户数</td>
            <td style="height: 21px; text-align:center; vertical-align:middle;color: #000000; font-size: 14px;  width: 40px; border-style:ridge;border-width: 1px;text-align: center;font-size:small;">
            消费金额</td>
                        
                   
            </tr>
               
                                        
            </table>                 
                                  <%-- <%} %>--%>
        
        </div>
    </fieldset>
    
</div>
 <%Html.RenderPartial("TGDetailInfo"); %>
</div>
 <script type="text/javascript">
     $('#tabs').tabs();

     $(document).ready(function() {
     
     
      //推广员推广业绩明细页面jqGrid装载
     mygrid = $("#list").jqGrid({
         width: 790,
         height: 450,
         url: 'RecordReview/',
         datatype: 'json',
         mtype: 'POST',
         pager: jQuery('#pager'),
         rowNum: 40,
         rowList: [20, 40, 60, 80],
         sortname: 'Id',
         sortorder: "desc",
         viewrecords: true,
         imgpath: '/scripts/themes/steel/images',
         caption: '已锁定：',
         recordtext: '条记录',
         loadtext: '加载数据请稍候....',
         colNames: ['大区', '办事处', '职务', '姓名', '消费用户', '消费时间', '消费金额', '消费游戏'，'消费类型'],
         colModel: [{ name: 'netbarid', index: 'NETBARID', width: 160, align: 'center' },
                       { name: 'barname', index: 'BARNAME', width: 160, align: 'center' },
                       { name: 'province', index: 'PROVINCE', width: 160, align: 'center' },
                       { name: 'city', index: 'CITY', width: 160, align: 'center' },
                       { name: 'county', index: 'COUNTY', width: 160, align: 'center' },
                       { name: 'uaccount', index: 'UACCOUNT', width: 160, align: 'center' },
                       { name: 'username', index: 'USERNAME', width: 160, align: 'center' },
                       { name: 'assigntime', index: 'ASSIGNTIME', width: 160, align: 'center'},
                        { name: 'assigntime', index: 'ASSIGNTIME', width: 160, align: 'center'}],

         onSelectRow: function(rowid) {
             DisplayDetails(rowid);
         }
     });
     
     });

    
     
     
       function loadData(index) {
        if (index == undefined) {
            tabsIndex = $("#tabs").tabs().tabs("option", "selected");
        } else {
            tabsIndex = index;
        }

        var areaID;
        var netbarName;

        if (tabsIndex == 0) {
            if (power == 8 || power == 5||power==6)
            {areaID = AREAID2;}
            else if (power == 2)
            { areaID = $("#area").val(); }
       
        netbarName = $("#netName").val();
        if (netbarName != "") {
            var demo = /^[\u0391-\uFFE5\w]+$/;
            if (!demo.test(netbarName)) {

                alert("网吧名称只能包括中文字、英文字母、数字和下划线!");
                return;


            }
        }
            mygrid.appendPostData({ TypeID: tabsIndex - 1, AreaID: areaID == 0 ? 1 : areaID, Barname: netbarName });
            mygrid.trigger('reloadGrid');
        }
        else if (tabsIndex == 1) {
        if ( power == 5 || power == 6)
        {areaID = AREAID2; }
        else if (power == 2 || power == 8)
        { areaID = $("#area").val(); }
         
        netbarName = $("#netName2").val();

        if (netbarName != "") {
            var demo = /^[\u0391-\uFFE5\w]+$/;
            if (!demo.test(netbarName)) {

                alert("网吧名称只能包括中文字、英文字母、数字和下划线!");
                return;


            }
        }
        mygrid2.appendPostData({ TypeID: tabsIndex - 1, AreaID: areaID == 0 ? 1 : areaID, Barname: netbarName });
        mygrid2.trigger('reloadGrid');
        }
    
    }

   </script>
    </form>
        </div>

        </div>


</asp:Content>
