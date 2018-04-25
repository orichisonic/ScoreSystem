<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="divIframe" title="详细信息">
    <fieldset>
        <legend>基本信息</legend>
        <div style="text-align:center">
        <table style="font-size: 15px;">
            <tr>
                <td>
                    姓名:<span id="username"></span>
                </td>
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                    性别:<span id="sex"></span>
                </td>
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                    学历:<span id="eduname"></span>
                </td>
            </tr>
            <tr>
                <td>
                    地址:<span id="address"></span>
                </td>
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                    手机:<span id="mobile"></span>
                </td>
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                    编制:<span id="bzname"></span>
                </td>
            </tr>
            <tr>
                <td>
                    职位:<span id="placename"></span> 
                    <label id="hideplace">调整后职位:<span id="newplacename"></span></label>
                </td>
                
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                    薪资:<span id="wagenum"></span>
                </td>
                
                <td>
                    &nbsp;&nbsp;
                </td>
              
                <td>
                    申请人:<span id="applicant"></span>
                </td>
            </tr>
            <tr>
                <td>
                    申请描述:<span id="applydesc"></span>
                </td>
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                    申请名称:<span id="applyname"></span>
                </td>
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                    申请时间:<span id="applytime"></span>
                </td>
            </tr>
            <tr>
                <td>
                    开户银行:<span id="banktype"></span>
                </td>
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                    银行账号:<span id="bankaccounts"></span>
                </td>
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                    身份证号:<span id="idcard"></span>
                </td>
            </tr>
            
            <tr>
                <td>
                    办事处:<span id="areaname"></span>
                </td>
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                    离职时间:<span id="dimetime"></span>
                </td>
                <td>
                    &nbsp;&nbsp;
                </td>
                <td>
                调整后薪资:<span id="newwage"></span><span> 岗位工资:</span><span  id="poswage"></span>
                </td>
 
            </tr>
        </table>
        </div>
    </fieldset>
   <br />
    <fieldset>
        <legend>审批信息</legend>
        <div>
            <div style="float: left">
                <ul class="verticality">
                    <li>第一次审批:<span id="firstexaminator"></span></li>
                    <li>第一次审批时间:<span id="firstexamtime"></span></li>
                    <li>第一次审批结果:<span id="firstexamresult"></span></li>
                    <li>第一次审批描述:<span id="firstexamdesc"></span></li>
                    <li>第二次审批:<span id="secondexaminator"></span></li>
                    <li>第二次审批时间:<span id="secondexamtime"></span></li>
                    <li>第二次审批结果:<span id="secondexamresult"></span></li>
                    <li>第二次审批描述:<span id="secondexamdesc"></span></li>
                    <li><span id="doc"></span></li>
                    <li><span id="img"></span></li>
                    <li><span id="rar"></span></li>
                </ul>
            </div>
            <div style="float: left">备注: <br /><%=Html.TextArea("desc", new {@class="textarea" })%></div>
        </div>
    </fieldset>
    <br />
    <div  style="text-align: center">
        
         <button class="ui-state-default ui-corner-left"  type="button" onclick="javascript: $('#divIframe').dialog('close')">关闭</button>
        <span id="dailogBtn">
            <button class="ui-state-default ui-corner-left"  type="button" onclick="passFun()">审批通过</button>
            <button class="ui-state-default ui-corner-left"  type="button" onclick="failFun()">审批未通过</button>
        </span>
    </div>
</div>
