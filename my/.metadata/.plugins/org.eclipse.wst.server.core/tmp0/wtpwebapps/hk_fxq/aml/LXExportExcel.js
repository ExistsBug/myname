//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //全局变量, 弹出提示窗口, 必须有
var turnPage = new turnPageClass();                     //全局变量, 查询结果翻页, 必须有
var turnPageWaitForBeFileGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页
var turnPageTasksGrid = new turnPageClass();    //全局变量, 可选上报报文查询结果翻页

/*============================================================================*/
//导出Excel
function GoToExcel(num)
{
   var StartDate = fm.all('StartDate').value;
   var EndDate = fm.all('EndDate').value;
   if(StartDate != "" && StartDate != null && EndDate != "" && EndDate != null) {
       if(StartDate > EndDate) {
          alert("您好，起始日期不能大于结束日期！");
          return;
       }
   }
   if(StartDate == "" || StartDate == null ){
	   alert("您好，起始日期必填！");
	   return;
   }
   if(EndDate == "" || EndDate == null ){
	   alert("您好，结束日期必填！");
	   return;
   }else{
	   var startDate=StartDate;
	   var endDate=EndDate;
	   if(startDate.length>0&&endDate.length>0){   
		    var arrStartDate = startDate.split("-");   
			var arrEndDate = endDate.split("-");
			var allStartDate = new Date(arrStartDate[0],arrStartDate[1],arrStartDate[2]);   
		    var allEndDate = new Date(arrEndDate[0],arrEndDate[1],arrEndDate[2]);
			var l=(allEndDate.getTime()-allStartDate.getTime())/(3600*1000*24);
			var QuerySQL1="select sysvarvalue from ldsysvar where sysvar='timeNCSFlag'";
			var arrSelected  = new Array();
		    arrSelected = easyExecSql(QuerySQL1);
		    var d=arrSelected[0][0];
			if(l>=d){
				alert("目前只能生成92天(三个月)以内的报表,如果要生成更长一段时间的报表请联系IT部门！");
				return; 
			}
		}
   }
   var rowNum = WaitForBeFileGrid.mulLineCount;
	if(rowNum>0) {
	    fm.action = "./CreateExportExcelSave.jsp?flag="+num;
	    fm.submit();
	}else {
		fm.action = "./CreateExportExcelSave.jsp?flag="+num;
		fm.submit();
	}
}