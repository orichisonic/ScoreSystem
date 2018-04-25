<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="examCondition">
    <fieldset>
        <legend>查询条件</legend>
        <div style="text-align: center" >
            <ul class="horizontal">
                <li id="condition" style="display:none;">
                        <input type="radio" id="radioAll" name="allselect" style="display:none;"/>全部
                        <input type="radio" id="radioArea" name="allselect"  checked="checked"  style="display:none;"/>特定办事处
                </li>
                <%TGProject.Models.Account account = Session["Account"] != null ? (TGProject.Models.Account)Session["Account"] : null;%>
                <li>
                    <span id="userpopdem"><%=account.POPEDOMID%></span>
                </li>
                <li id="zoneHide1">大区
                    <select name="zone" id="zone">
                
                    <%if (account.POPEDOMID == 1 || account.POPEDOMID == 2 || account.POPEDOMID == 3 || account.POPEDOMID == 8)
                      {
                            List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                            foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                            {
                    %>
                    <option value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%></option>
                    <%      } 
                      } 
                      else 
                      { %>
                    <option value="<%=account.AREAID%>"><%= account.AREANAME%></option>
                    <%} %>
                    
                    <%if (account.POPEDOMID == 2 || account.POPEDOMID == 3)
                      {%>
                       <option value="-1">总部</option>
                    <%} %>
                </select></li>
                <li id="areaHide1">办事处
                    <select id="area">
                        <%if (account.POPEDOMID == 5)
                          { %>
                        <option value="<%=account.AREAID %>"><%= account.AREANAME%></option>
                        <%}
                          else if (account.POPEDOMID == 8)
                          {
                              %>
                              <option value="0">督察</option>
                              <%
                          }
                           %>
                        
                    </select>
                </li>
                <li>开始日期
                    <input type="text" name="beginTime" id="beginTime" style="width: 90px" onfocus="setday(this)" value="2009-9-1" /></li>
                <li>结束日期
                    <input type="text" name="endTime" id="endTime" style="width: 90px" onfocus="setday(this)" value="2020-1-1"  /></li>
                <li id="userAccount" style="display:none;">用户账号
                    <input type="text" name="uaccount" id="uaccount" style="width: 90px"/></li>
                     <li id="userAccountnew" style="display:none">
                     <select name="SearchType" id="Select2">
                    <option value="0">搜索全部</option>
                    <option value="1">按姓名搜索</option>
                     <option value="2">按序号搜索</option>
                    </select>
                    <input type="text" id="uaccountnew" id="Text1" style="width: 90px"/></li>
                <li>
               
                    <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">查询</button></li>
            </ul>
        </div>
    </fieldset>
</div>
<script type="text/javascript">
    //////////////////
    $('#zone').val('2');
    function initialize() {
       // $('#zone').val('2');
        if ($('#ZidFromMaster').html() != "" || $('#AidFromMaster').html() != "") {

        }
        else {
            $('#area').val('16');
        }
       // alert($('#area').val());
    }
    setTimeout('initialize()', 800);
///////////////////////
    $('#userpopdem').hide();
    var POPEDOMID = $('#userpopdem').html();
    if (POPEDOMID == 5 || POPEDOMID == 6 || POPEDOMID == 7 || POPEDOMID == 9 || POPEDOMID == 10) {
        $('#zoneHide1').hide();
    }
</script>