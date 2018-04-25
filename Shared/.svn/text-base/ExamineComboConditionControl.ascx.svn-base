<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="examCondition">
    <fieldset>
        <legend>查询条件</legend>
        <div style="text-align: center">
            <ul class="horizontal">
                <li id="condition" style="display:none;>
                        <input type="radio" id="radioAll" name="allselect" style="display:none;"/>全部
                        <input type="radio" id="radioArea" name="allselect"  checked="checked"  style="display:none;"/>特定办事处
                </li>
                <%TGProject.Models.Account account = Session["Account"] != null ? (TGProject.Models.Account)Session["Account"] : null;%>
                <li>
                    <span id="userpopdem"><%=account.POPEDOMID%></span>
                </li>
                <li id="zoneHide1">大区
                    <select name="zone" id="zone">
                    <option value="-1" id="qd" unselectable="on">渠道数据</option>
                    <%
                        if (account.POPEDOMID == 1 || account.POPEDOMID == 2 || account.POPEDOMID == 3 || account.POPEDOMID == 8 || account.POPEDOMID ==99)
                      {
                          List<TGProject.Models.TGSZONESHOW> zoneList = (List<TGProject.Models.TGSZONESHOW>)ViewData["Zone"];
                          foreach (TGProject.Models.TGSZONESHOW zone in zoneList)
                          {
                    %>
                    <option value="<%=zone.AREAID%>">
                        <%= zone.AREANAME%>
                        </option>
                    <% } } else { %>
                    <option value="<%=account.AREAID%>"><%= account.AREANAME%></option>
                    <%} %>
                </select></li>
                <li id="areaHide1">办事处
                    <select id="area">
                        <%if (account.POPEDOMID == 5 || account.POPEDOMID == 6 || account.POPEDOMID == 7)
                          { %>
                        <option value="<%=account.AREAID %>"><%= account.AREANAME%></option>
                        <% }%>
                    </select>
                </li>
                <li>开始日期
                    <input type="text" name="beginTime" id="beginTime" style="width: 80px" onfocus="setday(this)" value="2009-9-1" /></li>
                <li>结束日期
                    <input type="text" name="endTime" id="endTime" style="width: 80px" onfocus="setday(this)" value="2020-1-1"  /></li>
                <li id="userAccount" style="display:none;">
                    <select name="SearchType" id="Select2">
                    <option value="0">用户帐号</option>
                    <option value="1">网吧名称</option>
                    </select>
                    <input type="text" name="uaccount" id="uaccount" style="width: 70px"/></li>
                <li>
                    <button class="ui-state-default ui-corner-all" type="submit" onclick="loadData()">查询</button></li>
            </ul>
        </div>
    </fieldset>
</div>
<script type="text/javascript">
    $('#userpopdem').hide();
   
   
    var POPEDOMID = $('#userpopdem').html();
    if (POPEDOMID == 5 || POPEDOMID == 6 || POPEDOMID == 7) {
        $('#zoneHide1').hide();
    }
    if (POPEDOMID != 7) {
        $("#Select2").empty();
        $("#Select2").html('');
        // alert("t");
        $("<option value='0'>搜索全部</option>").appendTo("#Select2")//添加下拉框的option
        $("<option value='1'>按网吧名称搜索</option>").appendTo("#Select2")//添加下拉框的option
        $("<option value='3'>按网吧编号搜索</option>").appendTo("#Select2")//添加下拉框的option
        $("<option value='4'>按推广员姓名搜索</option>").appendTo("#Select2")//添加下拉框的option
        $("<option value='5'>按推广员帐号搜索</option>").appendTo("#Select2")//添加下拉框的option
    }
    if (POPEDOMID == 7) {
        $("#Select2").empty();
        $("#Select2").html('');
        // alert("t");
        $("<option value='0'>搜索全部</option>").appendTo("#Select2")//添加下拉框的option
        $("<option value='1'>按网吧名称搜索</option>").appendTo("#Select2")//添加下拉框的option
    }
    //////////////////
    $('#zone').val('2');
    function initialize() {
        if ($('#ZidFromMaster').html() != "" || $('#AidFromMaster').html() != "") {

        }
        else {
            $('#area').val('16');
        }
    }
    setTimeout('initialize()', 800);
    ///////////////////////
</script>