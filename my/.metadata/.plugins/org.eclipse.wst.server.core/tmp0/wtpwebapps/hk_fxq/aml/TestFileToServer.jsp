<!-- 
filename:TestFileToServer
��ɻ�ִ�ļ��ı���
 -->
<html> 
<head > 
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
  <SCRIPT src="../common/javascript/Common.js" ></SCRIPT>
  <SCRIPT src="../common/javascript/MulLine.js"></SCRIPT>
 
  <SCRIPT src="../common/cvar/CCodeOperate.js"></SCRIPT>
  <SCRIPT src="../common/easyQueryVer3/EasyQueryVer3.js"></SCRIPT>
  <SCRIPT src="../common/javascript/VerifyInput.js"></SCRIPT>
  
  <LINK href="../common/css/mulLine.css" rel=stylesheet type=text/css>
  <LINK href="../common/css/Project.css" rel=stylesheet type=text/css>
  
  
  <SCRIPT src="TestFileToServer.js"></SCRIPT> 
  <%@include file="TestFileToServerInit.jsp"%>
  <title>�����ļ�</title>
</head>

<body onload="initForm();" >
  <form action="./TestFileToServerSave.jsp" ENCTYPE="multipart/form-data" method=post name=fm target="fraTitle" >
    <hr> 
     <table class= common border=0 width=100%>
      <tr>
  	   <td class= titleImg align= center> ��ѡ��Ҫ���ص��ļ���</td> 
      <TD>
        <Input  TYPE=file name=FileName> 
      </TD>           
    </TR>
  	</table>
    
    <INPUT VALUE="�����ļ�" TYPE=button onclick="submitForm();"> 
    <hr> 
    <br>
    <table>
    	<tr>
        	<td class=common>
			    <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,TestInfo);">
    		</td>
    		<td class= titleImg>
    			 ��ִ�ļ�������Ϣ
    		</td>
    	</tr>
    </table> 
    <!-- ��ʾ��Ӧ�Ļ�ִ�ļ�������Ϣ -->
    <div id="TestInfo" style= "display: '' ">
      <table  class= common>
         <tr  class= common>
      	  	<td text-align: left colSpan=1>
  				<span id="spanLXReceiptFileGrid" >
  				</span> 
  		   </td>
  		</tr>
      </table>  
    </div> 
    <Div id= "divPage" align=center style= "display: 'none' ">
	    <INPUT CLASS=cssButton VALUE="��  ҳ" TYPE=button onclick="turnPage.firstPage();"> 
	    <INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPage.previousPage();"> 					
	    <INPUT CLASS=cssButton VALUE="��һҳ" TYPE=button onclick="turnPage.nextPage();"> 
	    <INPUT CLASS=cssButton VALUE="β  ҳ" TYPE=button onclick="turnPage.lastPage();">
    </Div>
        										
  </form>
</body>
</html>
