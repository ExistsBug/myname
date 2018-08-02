function GoToReturn(){
	top.close();
}

function GoToDownLoad(oper){
	 if(tInfoStyle=="01"){
			var QuerySQL1="select Append from LXNotification where IDX='"+tIDX+"'";
		  	var arrSelected  = new Array();
		    arrSelected = easyExecSql(QuerySQL1);
		    //alert(arrSelected);
		  	var fileName = arrSelected[0][0];
		    //判断是否有附件
			 if (fileName==""||fileName==null) {
					   alert("此数据不存在附件！");
					   return false;
			 }
			 var filePath =  arrSelected[0][0];
			 var fileName =filePath.substring(filePath.lastIndexOf("/"));
		  	location.href= "../aml/Information" + fileName;
	}
	 else if(tInfoStyle=="02"){
	  var checkFlag=0 ;
	  var QuerySQL1="select UploadAddress,EXTEND1 from RulesAndRegulations where IndexNo='"+tIDX+"'";
	  var arrSelected  = new Array();
	    arrSelected = easyExecSql(QuerySQL1);
    //判断是否查询成功
		if (!arrSelected[0][0]) {
     		alert("此数据不存在附件！");
     		return false;
		 }
 		var filename=arrSelected[0][0];
     	filename=filename.substring(filename.lastIndexOf('/')+1);
     	location.href= "../aml/Information/"+ filename;
	}
	else if(tInfoStyle=="03"){
		 var checkFlag=0 ;
		 var QuerySQL1="select BAK3 from LXPolicRulmage where IDX='"+tIDX+"'";
		 var arrSelected  = new Array();
		    arrSelected = easyExecSql(QuerySQL1);
	    //判断是否查询成功
			if (!arrSelected[0][0]) {
	     		alert("此数据不存在附件！");
	     		return false;
			 }
	 		var filename=arrSelected[0][0];
	     	filename=filename.substring(filename.lastIndexOf('/')+1);
	     	location.href= "../aml/Information/"+ filename;
	}else if(tInfoStyle=="04"){
		 var checkFlag=0 ;
		 var QuerySQL1="select filepath from LXKnowledgeField where IDX='"+tIDX+"'";
		 var arrSelected  = new Array();
		    arrSelected = easyExecSql(QuerySQL1);
	    //判断是否查询成功
			if (!arrSelected[0][0]) {
	     		alert("此数据不存在附件！");
	     		return false;
			 }
	 		var filename=arrSelected[0][0];
	     	filename=filename.substring(filename.lastIndexOf('/')+1);
	     	location.href= "../aml/Information/"+ filename;
	}
	 
 }