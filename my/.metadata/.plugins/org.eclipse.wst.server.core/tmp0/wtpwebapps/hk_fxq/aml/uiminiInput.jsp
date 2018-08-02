<%@page pageEncoding="GBK" contentType="text/html;charset=UTF-8" %>
<%@include file="../common/jsp/UsrCheck.jsp"%>
<%@include file="../common/jsp/ManageComLimit.jsp"%>
<head>
  <script src="../common/easyQueryVer3/EasyQueryCache.js" charset="GBK"></script>
  <script src="../common/easyQueryVer3/EasyQueryVer3.js" charset="GBK"></script>
  <script src="../common/javascript/jquery.js" charset="GBK"></script>
  <script src="../common/javascript/VerifyInput.js" charset="GBK"></script>
  <script src="../common/javascript/Common.js" charset="GBK"></script>
  <script src="../common/cvar/CCodeOperate.js" charset="GBK"></script>
  <script src="../common/Calendar/Calendar.js" charset="GBK"></script>
  <script src="../common/javascript/MulLine.js" charset="GBK"></script>
  <link href="../common/css/Project.css" rel=stylesheet type=text/css>
  <link href="../common/css/mulLine.css" rel=stylesheet type=text/css>  
  <script src="./uiminiInput.js" charset="GBK"></script>
  <%@include file="./uiminiInit.jsp"%>
</head>
<body  onload="initForms();initElementtype();">
    <form action="./uiminiSave.jsp" method=post name=fm target="fraSubmit">
        <!-- <table>
            <tr class=common>
                <td class=common><img  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,div0);"></td>
                <td class=titleImg>基本信息</td>
            </tr>
        </table> -->
        <div id='div0' style='width:100%'>
            <table class=common name='table1' colNum='2'>
                <tr>
                    <td class=title>Agent Code</td>
                    <td class=input><input name='AgentCode' class='common'  /></td>
                    <td class=title>Finance Package</td>
                    <td class=input><input class='codeno' name='Name' verify='Finance Package|code:' ondblclick="return showCodeList('',[this,],[0,1],null,null,null,null,null,1);" onkeyup="return showCodeListKey('',[this,],[0,1],null,null,null,null,null,1)"/><input class=codename name=''  readonly/></td>
                </tr>
                <tr>
                    <td class=title>Agent Contract Effective Date</td>
                    <td class=input><input class='coolDatePicker' name='Sex'  /></td>
                    <td class=title>Finance Start Month</td>
                    <td class=input><input class='coolDatePicker' name='IDNo'  /></td>
                </tr>
            </table>
        </div>
        <div id='div1' style='width:100%'>
            <div style="float:left;padding-right:10px;">
                <input class="cssButton" buttonname='queryagent' value="Search" type="button" onclick="return queryAgent();"/>
            </div>
        </div>
        <br/>
       <!--  <table>
            <tr class=common>
                <td class=common><img  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,div2);"></td>
                <td class=titleImg>ONE</td>
            </tr>
        </table> -->
        <div id='div2' style='width:100%'>
            <div id="divUiminiGird">
                <table class= common>
                    <tr class= common>
                        <td text-align: left colSpan=1>
                            <span id="spanUiminiGird" ></span>
                        </td>
                    </tr>
                </table>
                <input value="First Page" type=button onclick="turnPageUiminiGird.firstPage();" class="cssButton"/>
                <input value="Previous Page" type=button onclick="turnPageUiminiGird.previousPage();" class="cssButton"/>
                <input value="Next Page" type=button onclick="turnPageUiminiGird.nextPage();" class="cssButton"/>
                <input value="Last Page" type=button onclick="turnPageUiminiGird.lastPage();" class="cssButton"/>
            </div>
        </div>
        <br/>
        <!-- 
        <table>
            <tr class=common>
                <td class=common><img  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,div3);"></td>
                <td class=titleImg>TWO</td>
            </tr>
        </table>
         -->
        <div id='div3' style='width:100%'>
            <div id="divUiminiDetailGird">
                <table class= common>
                    <tr class= common>
                        <td text-align: left colSpan=1>
                            <span id="spanUiminiDetailGird" ></span>
                        </td>
                    </tr>
                </table>
                <input value="First Page" type=button onclick="turnPageUiminiDetailGird.firstPage();" class="cssButton"/>
                <input value="Previous Page" type=button onclick="turnPageUiminiDetailGird.previousPage();" class="cssButton"/>
                <input value="Next Page" type=button onclick="turnPageUiminiDetailGird.nextPage();" class="cssButton"/>
                <input value="Last Page" type=button onclick="turnPageUiminiDetailGird.lastPage();" class="cssButton"/>
            </div>
        </div>
        <br/>
        <div id='div4' style='width:100%'>
            <div style="float:left;padding-right:10px;">
                <input class="cssButton" buttonname='' value="Generate Summary Report" type="button" onclick="return queryAgent();"/>
                <input class="cssButton" buttonname='queryagent' value="Generate Detailed Report" type="button" onclick="return queryAgent();"/>
            </div>
        </div>
        <input type="hidden" name="hideOperate" />
        <input type="hidden" name="tSQL" />
    </form>
    <span id="spanCode"  style="display: none; position:absolute; slategray"></span>
</body>
</html>