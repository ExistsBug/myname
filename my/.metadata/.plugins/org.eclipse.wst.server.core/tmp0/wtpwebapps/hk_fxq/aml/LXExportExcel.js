//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageWaitForBeFileGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var turnPageTasksGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ

/*============================================================================*/
//����Excel
function GoToExcel(num)
{
   var StartDate = fm.all('StartDate').value;
   var EndDate = fm.all('EndDate').value;
   if(StartDate != "" && StartDate != null && EndDate != "" && EndDate != null) {
       if(StartDate > EndDate) {
          alert("���ã���ʼ���ڲ��ܴ��ڽ������ڣ�");
          return;
       }
   }
   if(StartDate == "" || StartDate == null ){
	   alert("���ã���ʼ���ڱ��");
	   return;
   }
   if(EndDate == "" || EndDate == null ){
	   alert("���ã��������ڱ��");
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
				alert("Ŀǰֻ������92��(������)���ڵı���,���Ҫ���ɸ���һ��ʱ��ı�������ϵIT���ţ�");
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