<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="divIframe" title="详细信息">
    <fieldset>
        <legend>个人详细信息</legend>
        <div>
            <div style="float: left;">
                <ul class="verticality">
                    <li>姓名: <span id="username"></span></li>
                    <li>状态: <span id="status"></span></li>
                    <li>编制: <span id="bzname"></span></li>
                    <li>薪资: <span id="wagenum"></span>￥</li>
                    <li id="postwage">岗位薪资:<span id="poswage"></span>￥</li>
                    <li>办事处: <span id="areaname"></span></li>
                    <li>职位名称: <span id="placename"></span></li>
                    <li>申请时间: <span id="applytime"></span></li>
                    <li>入职时间: <span id="entertime"></span></li>
                    <li>离职时间: <span id="dimissiontime"></span></li>
                    <li>奖金: <span id="punishnum"></span>￥&nbsp;&nbsp;&nbsp;&nbsp;罚金: <span id="rewardnum"></span>￥</li>
                    <li>考勤扣款: <span id="checkdeduct"></span>￥</li>
                    <li>合计: <span id="sumwage"></span>￥</li>
                    <li><span  id="docFile"></span></li>
                    <li><span  id="imgFile"></span></li>
                    <li><span  id="rarFile"></span></li>
                </ul>
            </div>
            <div style="float: left;"><span id="img"></span></div>
        </div>
    </fieldset>
</div>
