/**
 * ��������: LXPubFun.js
 * ������: ��ϴǮͨ�ü����� 
 * �������ڣ�2009-03-31
 */

/*****************************************************************************************
 * ���ܣ����ڸ�ʽת������
 * ������ֻ��������YYYYMMDD��YYYY-MM-DD��ʽ�����ڣ���YYYYMMDD���ڿ��Զ�ת��ΪYYYY-MM-DD��ʽ��
 *       �Է������ַ�����У��
 * ���أ�YYYY-MM-DD��ʽ������
 * ����: 
******************************************************************************************/
function CheckDate(Filed)
{
	var tDate = Filed.value;
	var Year  = "";
	var Month = "";
	var Day   = "";
	//�������ڰ�λ��YYYYMMDD��ʽ
	if(tDate.length == 8)
	{
		if(tDate.indexOf('-') == -1)
		{		
			Year  = tDate.substring(0,4);
			Month = tDate.substring(4,6);
			Day   = tDate.substring(6,8);	
			tDate = Year+"-"+Month+"-"+Day;
		}
	    else
		{
			alert("������������������������룡");
			return Filed.value = "";
		}
	}
	//��������10λ��YYYY-MM-DD��ʽ
	else if(tDate.length == 10)
	{
		if((tDate.substring(4,5) != '-')||(tDate.substring(7,8) != '-'))
		{
			alert("������������������������룡");
			return Filed.value = "";
		}		
		Year  = tDate.substring(0,4);
		Month = tDate.substring(5,7);
		Day   = tDate.substring(8,10);	
		tDate = Year+"-"+Month+"-"+Day;	
	}
	//�������ڼȲ���YYYYMMDD��ʽ��Ҳ����YYYY-MM-DD��ʽ
	else
	{
	    if(tDate == null||tDate == "")//����Ϊ�գ����ؿ�ֵ��������
	    {
	    	return Filed.value = "";
	    }
	    else//���벻Ϊ�գ���ʾ����
	    {
	  	    alert("������������������������룡");
	  	    return Filed.value = "";        	
	    }	
	}
    //У�����������Ƿ�Ϊ��������
	if((!isInteger(Year))||(!isInteger(Month))||(!isInteger(Day))||(Year == "0000")||(Month == "00")||(Day == "00"))
	{
	    alert("��������������������������룡");
	    return Filed.value = "";
	}	    
    //���·���������һ����ȷУ�� 
	if(Month>12){alert("������������һ��ֻ��12���£����������룡");return Filed.value = "";}
	if(Month=="01"&&Day>31){alert("������������һ��ֻ��31�գ����������룡");return Filed.value = ""; }
    if(Month=="02"&&Day>29){alert("�����������󣬶������ֻ��29�գ����������룡");return Filed.value = "";}
    if(Month=="02"&&Day==29)//����Ҫ�ж��Ƿ�Ϊ����
    {
    	if((Year%100==0)&&(Year%400!=0))//�������ж�
    	{
    		alert("�����������󣬷��������ֻ��28�գ����������룡");return Filed.value = "";
    	}
    	if((Year%100!=0)&&(Year%4!=0))//�������ж�
    	{
    		alert("�����������󣬷��������ֻ��28�գ����������룡");return Filed.value = "";
    	}
    } 
	if(Month=="03"&&Day>31){alert("����������������ֻ��31�գ����������룡");return Filed.value = "";}
	if(Month=="04"&&Day>30){alert("����������������ֻ��30�գ����������룡");return Filed.value = "";}
	if(Month=="05"&&Day>31){alert("����������������ֻ��31�գ����������룡");return Filed.value = "";}
	if(Month=="06"&&Day>30){alert("����������������ֻ��30�գ����������룡");return Filed.value = "";}
	if(Month=="07"&&Day>31){alert("����������������ֻ��31�գ����������룡");return Filed.value = "";}
	if(Month=="08"&&Day>31){alert("�����������󣬰���ֻ��31�գ����������룡");return Filed.value = "";}
	if(Month=="09"&&Day>30){alert("�����������󣬾���ֻ��30�գ����������룡");return Filed.value = "";}
	if(Month=="10"&&Day>31){alert("������������ʮ��ֻ��31�գ����������룡");return Filed.value = "";}
	if(Month=="11"&&Day>30){alert("������������ʮһ��ֻ��30�գ����������룡");return Filed.value = "";}
	if(Month=="12"&&Day>31){alert("������������ʮ����ֻ��31�գ����������룡");return Filed.value = "";}
	
	Filed.value = tDate;//У��ͨ���󣬷���ֵ
}

/*********************************************************************************************
 * ���ܣ����ʱ��У��,Ҫ���ʱ������6λ����
 * ��������Ҫ��¼�롰�������ʱࡱʱʹ��
 * �������ʱ�tPostCode
 * ���أ�true/false
 * ������niuzj,2006-01-12
**********************************************************************************************/
function checkPostCode(tPostCode)
{
	  var ttPostCode = tPostCode.value;
	  if(ttPostCode == null || ttPostCode == "")
	  {
		   return true;
	  }
    else
    {
  	   if(ttPostCode.length == 6 && isInteger(ttPostCode))
  	   {
  	   	  return true;
  	   }
  	   else
  	   {
  	   	  alert("������ʱ�����,����������!");
  	   	  return false;
  	   }
    }
}

/*********************************************************************************************
 * ���ܣ���ֹͬһ�û�ͬʱ���������ڲ���ͬһ���ⰸ���ܲ����Ĵ���
 * �����������������ύ�Ĳ���ǰ���顣����˵������ֻ���������js�ļ�����Ӽ��飬Ҳ����©���ģ�
         ���ⰸ״̬�ı�֮ǰ�û��ѽ���֧���ܵ�ҳ��򿪣���������һ�����洰�ڲ����ı��ⰸ״̬��
         �ٻص���ǰ�Ѵ򿪵ķ�֧�����в���������ʧЧ��Ҫ��������⣬���ڷ�֧�����js��Ҳ���жϡ�
 * ������tClmNo�ⰸ�ţ�����Ϊ�ְ��ţ���tClmState1,tClmState2�ⰸ״̬������ֻʹ��һ������
 * ���أ�true/false
 * ������
**********************************************************************************************/
function KillTwoWindows(tClmNo,tClmState1,tClmState2)
{
    var tSQLF = " select clmstate from llregister where rgtno = '"+tClmNo+"'";
    var tClmState = easyExecSql(tSQLF);  
    if(tClmState==null)//�ⰸ������������֮ǰ������ȷ��δ�� 
    {   
			  var tSQLS   = " select rgtobj from llreport where rptno='"+tClmNo+"' ";
			  var tRgtObj = easyExecSql(tSQLS);          
			  if(tRgtObj=='1')//����
			  {
			  	  var tSQLT1 = " select activityid from lwmission where activityid='0000005005' "
			  	             + " and missionprop1='"+tClmNo+"' ";
            var tActD1 = easyExecSql(tSQLT1);
            if(tActD1==null)//��Ϊ�ѱ���ȷ�ϣ�����״̬ͬ����
            {
            	  tClmState="20";
            }
            else//���������ڣ�û�б���ȷ��
            {
              	tClmState="10";
            } 			  	             
			  }
			  if(tRgtObj=='2')//����
			  {
			  	  var tSQLT2 = " select activityid from lwmission where activityid='0000005205' and exists "
			  	             + " (select 'X' from llreport where missionprop1=trim(rgtobjno) and rptno='"+tClmNo+"') ";
            var tActD2 = easyExecSql(tSQLT2); 	
            if(tActD2==null)
            {
            	  tClmState="20";
            }
            else
            {
              	tClmState="10";
            }            		  	
			  }
    } 
	  if(tClmState1!=tClmState&&tClmState2!=tClmState)
	  {
	    	 alert("�ⰸ״̬�ѷ����仯�������µ�½�������");
	    	 return false;
	  }    
    return true;      
}


/*********************************************************************************************
 * ���ܣ����ɽ����ύǰ�����֤����
 * �������˷���������Common.js�е�function checkIdCard(idCard)
 * ������tDealNo���׺�
 * ���أ�true/false
 * ������
**********************************************************************************************/
function CheckCardNoIS(tDealNo)
{
	  var tSQL;
	  var tCardNo;
	  //lxistrademain
    tSQL = " select ctid,ctnm from lxistrademain where dealno='"+tDealNo+"' and citp='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	if(!checkIdCard(tCardNo[0][0]))
    	{
    		alert("����"+tDealNo+"�У��ͻ� "+tCardNo[0][1]+" ���֤�Ŵ���");
    		return false;
    	}
    } 
    //lxistradedetail
    tSQL = " select tbid,tbnm from lxistradedetail where dealno='"+tDealNo+"' and tbit='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	for(var j=0;j<tCardNo.length;j++)
    	{
	    	if(!checkIdCard(tCardNo[j][0]))
	    	{
	    		alert("����"+tDealNo+"��ϸ�У������� "+tCardNo[j][1]+" ���֤�Ŵ���");
	    		return false;
	    	}
    	}
    } 
    //lxistradeinsured
    tSQL = " select isid,istn,csnm from lxistradeinsured where dealno='"+tDealNo+"' and iitp='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	for(var j=0;j<tCardNo.length;j++)
    	{
	    	if(!checkIdCard(tCardNo[j][0]))
	    	{
	    		alert("����"+tDealNo+"����ͬ "+tCardNo[j][2]+" �У����ձ��"+tCardNo[j][1]+"���֤�Ŵ���");
	    		return false;
	    	}
    	}
    } 
    //lxistradebnf
    tSQL = " select bnid,bnnm,csnm from lxistradebnf where dealno='"+tDealNo+"' and bitp='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	for(var j=0;j<tCardNo.length;j++)
    	{
	    	if(!checkIdCard(tCardNo[j][0]))
	    	{
	    		alert("����"+tDealNo+"����ͬ "+tCardNo[j][2]+" �У�������"+tCardNo[j][1]+"���֤�Ŵ���");
	    		return false;
	    	}
    	}
    } 
    return true;
}

/*********************************************************************************************
 * ���ܣ������ύǰ�����֤����
 * �������˷���������Common.js�е�function checkIdCard(idCard)
 * ������tDealNo���׺�
 * ���أ�true/false
 * ������
**********************************************************************************************/
function CheckCardNoIH(tDealNo)
{
	  var tSQL;
	  var tCardNo;
	  //lxihtrademain
    tSQL = " select ctid,ctnm from lxihtrademain where dealno='"+tDealNo+"' and citp='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	if(!checkIdCard(tCardNo[0][0]))
    	{
    		alert("����"+tDealNo+"�У��ͻ� "+tCardNo[0][1]+" ���֤�Ŵ���");
    		return false;
    	}
    } 
    //lxihtradedetail
    tSQL = " select tbid,tbnm from lxihtradedetail where dealno='"+tDealNo+"' and tbit='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	for(var j=0;j<tCardNo.length;j++)
    	{
	    	if(!checkIdCard(tCardNo[j][0]))
	    	{
	    		alert("����"+tDealNo+"��ϸ�У������� "+tCardNo[j][1]+" ���֤�Ŵ���");
	    		return false;
	    	}
    	}
    } 
    tSQL = " select tcid,tcnm from lxihtradedetail where dealno='"+tDealNo+"' and tcit='11' ";
    tCardNo = easyExecSql(tSQL);  
    if(tCardNo!=null)
    {
    	for(var j=0;j<tCardNo.length;j++)
    	{
	    	if(!checkIdCard(tCardNo[j][0]))
	    	{
	    		alert("����"+tDealNo+"��ϸ�У����׶��� "+tCardNo[j][1]+" ���֤�Ŵ���");
	    		return false;
	    	}
    	}
    } 
    
    return true;
}

function CheckIHPersonInfo(tDealNo)
{
	  //�������ͻ���Ϣ����
	  var tSQL1 = "select CTNM,CITP,CTID from LXIHTradeMain where dealno='"+tDealNo+"'";
	  var tResult1 = easyExecSql(tSQL1);
	  if(tResult1!=null)
	  {
		 var tCTNM1 = tResult1[0][0];
		 var tCITP1 = tResult1[0][1];
		 var tCTID1 = tResult1[0][2];
		 if(!CheckNotReplace(tCTNM1,tCITP1,tCTID1))
		 {
			 return false;
		 }
	  }
	  
	  //�������ͻ���Ϣ����
	  var tSQL2 = "select TBNM,TBIT,TBID,TBNT,TCNM,TCIT,TCID from LXIHTradeDetail where dealno='"+tDealNo+"'";
	  var tResult2 = easyExecSql(tSQL2);
	  if(tResult2!=null)
	  {
		 var tTBNM1 = tResult2[0][0];
		 var tTBIT1 = tResult2[0][1];
		 var tTBID1 = tResult2[0][2];
		 var tTBNT1 = tResult2[0][3];
		 var tTCNM1 = tResult2[0][4];
		 var tTCIT1 = tResult2[0][5];
		 var tTCID1 = tResult2[0][6];
		 
		 if((tTBNM1=="@N"&&tTBIT1=="@N"&&tTBID1=="@N"&&tTBNT1=="@N")||(tTBNM1!="@N"&&tTBIT1!="@N"&&tTBID1!="@N"&&tTBNT1!="@N"))
		 {
			 //ʲôҲ���ᷢ��
		 }
		 else
		 {
			 alert("���������֤��/֤���ļ�����/����,��������д������ţ�������������һ���������ţ������������д�������");
			 return false;
		 }
		 if((tTBNM1=="@E"&&tTBIT1=="@E"&&tTBID1=="@E"&&tTBNT1=="@E")||(tTBNM1!="@E"&&tTBIT1!="@E"&&tTBID1!="@E"&&tTBNT1!="@E"))
		 {
			 //ʲôҲ���ᷢ��
		 }
		 else
		 {
			 alert("���������֤��/֤���ļ�����/����,��������д������ţ�������������һ���������ţ������������д�������");
			 return false;
		 }
		 if((tTBNM1=="@I"&&tTBIT1=="@I"&&tTBID1=="@I"&&tTBNT1=="@I")||(tTBNM1!="@I"&&tTBIT1!="@I"&&tTBID1!="@I"&&tTBNT1!="@I"))
		 {
			 //ʲôҲ���ᷢ��
		 }
		 else
		 {
			 alert("���������֤��/֤���ļ�����/����,��������д������ţ�������������һ���������ţ������������д�������");
			 return false;
		 }
		 
		 if(!CheckNotReplace(tTCNM1,tTCIT1,tTCID1))
		 {
			 return false;
		 }
	  }
	  
	  //�ʺ�У��
	  //����д��������⣬�˺ű�����ڻ����6λ��
	  var tSQL3 = "select CTAC,TCAC from LXIHTradeDetail where dealno='"+tDealNo+"'";
	  var tResult3 = easyExecSql(tSQL3);
		  var tCTAC = tResult3[0][0];
		  var tTCAC = tResult3[0][1];
		  if(tCTAC!="@N"&&tCTAC!="@E"&&tCTAC!="@I")
		  {
			  if(tCTAC.length<6)
			  {
			    	alert("����"+tDealNo+"�У�����д��������⣬�˺�(����ת���ʽ��˺�)������ڻ����6λ��");
			    	return false;
			  }
		  }
		  
		  if(tTCAC!="@N"&&tTCAC!="@E"&&tTCAC!="@I")
		  {
			  if(tTCAC.length<6)
			  {
			    	alert("����"+tDealNo+"�У�����д��������⣬���ֽ����˺�(����ת���ʽ��˺�)������ڻ����6λ��");
			    	return false;
			  }
		  }
		   
	  return true;
}

function CheckISPersonInfo(tDealNo)
{
	  var tSQL1;
	  tSQL1 = "select CTTP from LXISTradeMain where dealno='"+tDealNo+"'";
	  //var tQuery1 = easyQueryVer3(tSQL1,0,1,0);
	  var tResult1 = easyExecSql(tSQL1);
	  if(tResult1!=null)
	  {
	    var tCTTP = tResult1[0][0];
	    if(tCTTP!=null)
	    {
		    //����ͻ�����CTTPΪ��Ȼ�ˣ���Թ�Ԫ�ر����Ϊ@N��
		    if(tCTTP=="07")
		    {
		  	  var tSQL2 = "select HDNM, HITP, HDID, HDVC, HDRT, HEIF from LXISTradeCusPartner where dealno='"+tDealNo+"'";
		  	  //var tQuery2 = easyQueryVer3(tSQL2,0,1,0);
		  	  var tResult2 = easyExecSql(tSQL2);
		  	  if(tResult2!=null)
		  	  {
		  	    for(var i=0;i<tResult2.length;i++)
		  	    {
		  		   var tHDNM = tResult2[i][0];
		  		   var tHITP = tResult2[i][1];
		  		   var tHDID = tResult2[i][2];
		  		   var tHDVC = tResult2[i][3];
		  		   var tHDRT = tResult2[i][4];
		  		   var tHEIF = tResult2[i][5];
		  		   if(!(tHDNM=="@N"&&tHITP=="@N"&&tHDID=="@N"&&tHDVC=="@N"&&tHDRT=="@N"&&tHEIF=="@N"))
		  		   {
		  	    		alert("����"+tDealNo+"�У��ͻ�����Ϊ��Ȼ�ˣ���Թ�Ԫ�ر����Ϊ@N��");
		  	    		return false;
		  		   }
		  	    }
		  	  }
		    }
		    //����ͻ�����CTTPΪ���ˣ��������Ԫ�ز�����д�������
		    //����ͻ�����CTTPΪ���幤�̻���������֯�������Ԫ�ز�����д�������
		    if(tCTTP=="01"||tCTTP=="02"||tCTTP=="03"||tCTTP=="04"||tCTTP=="05"||tCTTP=="06")
		    {
		  	  var tSQL3 = "select CRNM,CRIT,CRID from LXISTradeMain where dealno='"+tDealNo+"'";
		  	  var tResult3 = easyExecSql(tSQL3);
		  	  if(tResult3!=null)
		  	  {
		  		 var tCRNM = tResult3[0][0];
		  		 var tCRIT = tResult3[0][1];
		  		 var tCRID = tResult3[0][2];
		  		 if(tCRNM=="@N"||tCRNM=="@E"||tCRNM=="@I")
		  		 {
		  	    	alert("����"+tDealNo+"�У����������Ԫ��(����)������д�������");
		  	    	return false;
		  		 }
		  		 if(tCRIT=="@N"||tCRIT=="@E"||tCRIT=="@I")
		  		 {
		  	    	alert("����"+tDealNo+"�У����������Ԫ��(���֤����)������д�������");
		  	    	return false;
		  		 }
		  		 if(tCRID=="@N"||tCRID=="@E"||tCRID=="@I")
		  		 {
		  	    	alert("����"+tDealNo+"�У����������Ԫ��(���֤������)������д�������");
		  	    	return false;
		  		 }
		  		}
		    }
	    }
	  }
	  //����д��������⣬�˺ű�����ڻ����6λ��
	  var tSQL4 = "select TCAN from LXISTradeDetail where dealno='"+tDealNo+"'";
	  var tResult4 = easyExecSql(tSQL4);
	  if(tResult4!=null)
	  {
	    for(var k=0;k<tResult4.length;k++)
	    {
		    var tTCAN = tResult4[k][0];
		    if(tTCAN!="@N"&&tTCAN!="@E"&&tTCAN!="@I")
		    {
		  	  if(tTCAN.length<6)
		  	  {
		  	    	alert("����"+tDealNo+"�У�����д��������⣬�˺�(����ת���ʽ��˺�)������ڻ����6λ��");
		  	    	return false;
		  	  }
		    }
	    }
	  }
	  
	  //�����׷�����Ϊ�й���½����ʱ��ǰ3 λ��дCHN��Z01��Z02 ��Z03��
	  //���Һ�6 λ���մ�½������������������д�����ؼ����ȵĴ���
	  //��������������ĩβ��λ����Ϊ00,�㶫��ݸ�к���ɽ�г��⣩��
	  var tSQL5 = "select TRCD from LXISTradeMain where dealno='"+tDealNo+"' and ((TRCD like 'CHN%') or (TRCD like 'Z01%') or (TRCD like 'Z02%') or (TRCD like 'Z03%'))";
	  var tResult5 = easyExecSql(tSQL5);
	  if(tResult5!=null)
	  {
		  var tTRCD = tResult5[0][0];
		  if(tTRCD!="CHN441900"&&tTRCD!="CHN442000")
		  {
			  var tSQL6 = "select 1 from dual where '"+tTRCD+"' like '%00'";
			  var rResult6 = easyExecSql(tSQL6);
			  if(rResult6!=null)
			  {
				  alert("������������ĩβ��λ����Ϊ00,�㶫��ݸ�к���ɽ�г���");
				  return false;
			  }
		  }
	  }
	  
	  //test.�����˵��ģ����������ݵļ���
	  var tSQL6 = "select CRNM,CRIT,CRID from LXISTradeMain where dealno='"+tDealNo+"'";
	  var tResult6 = easyExecSql(tSQL6);
	  if(tResult6!=null)
	  {
		 var tCRNM1 = tResult6[0][0];
		 var tCRIT1 = tResult6[0][1];
		 var tCRID1 = tResult6[0][2];
		 if(!CheckNotReplace(tCRNM1,tCRIT1,tCRID1))
		 {
			 return false;
		 }
	  }	 
	  
	  //test.�ͻ����ģ����������ݵļ���
	  var tSQL7 = "select CTNM,CITP,CTID from LXISTradeMain where dealno='"+tDealNo+"'";
	  var tResult7 = easyExecSql(tSQL7);
	  if(tResult7!=null)
	  {
		 var tCTNM1 = tResult7[0][0];
		 var tCITP1 = tResult7[0][1];
		 var tCTID1 = tResult7[0][2];
		 if(!CheckNotReplace(tCTNM1,tCITP1,tCTID1))
		 {
			 return false;
		 }
	  }	 
	  
	  //test.�ɶ���Ϣ���ģ����������ݵļ���
	  var tSQL8 = "select HDNM,HITP,HDID from LXISTradeCusPartner where dealno='"+tDealNo+"'";
	  var tResult8 = easyExecSql(tSQL8);
	  if(tResult8!=null)
		{
	    for(var i=0;i<tResult8.length;i++)
	    {
			 var tHDNM1 = tResult8[i][0];
			 var tHITP1 = tResult8[i][1];
			 var tHDID1 = tResult8[i][2];
			 if(!CheckNotReplace(tHDNM1,tHITP1,tHDID1))
			 {
				 return false;
			 }
		  }	 
	  }
	  
	  //test.�����˵��ģ����������ݵļ���
	  var tSQL9 = "select TBNM,TBIT,TBID from LXISTradeDetail where dealno='"+tDealNo+"'";
	  var tResult9 = easyExecSql(tSQL9);
	  if(tResult9!=null)
		{
	    for(var i=0;i<tResult9.length;i++)
	    {
			 var tTBNM1 = tResult9[i][0];
			 var tTBIT1 = tResult9[i][1];
			 var tTBID1 = tResult9[i][2];
			 if(!CheckNotReplace(tTBNM1,tTBIT1,tTBID1))
			 {
				 return false;
			 }
		  }	 
	  }
	  
	  //test.�������˵��ģ����������ݵļ���
	  var tSQL10 = "select ISTN,IITP,ISID from LXISTradeInsured where dealno='"+tDealNo+"'";
	  var tResult10 = easyExecSql(tSQL10);
	  if(tResult10!=null)
		{
	    for(var i=0;i<tResult10.length;i++)
	    {
			 var tISTN1 = tResult10[i][0];
			 var tIITP1 = tResult10[i][1];
			 var tISID1 = tResult10[i][2];
			 if(!CheckNotReplace(tISTN1,tIITP1,tISID1))
			 {
				 return false;
			 }
		  }	 
	  }
	  
	  //test.�����˵��ģ����������ݵļ���
	  var tSQL11 = "select BNNM,BITP,BNID from LXISTradeBnf where dealno='"+tDealNo+"'";
	  var tResult11 = easyExecSql(tSQL11);
	  if(tResult11!=null)
		{
	    for(var i=0;i<tResult11.length;i++)
	    {
			 var tBNNM1 = tResult11[0][0];
			 var tBITP1 = tResult11[0][1];
			 var tBNID1 = tResult11[0][2];
			 if(!CheckNotReplace(tBNNM1,tBITP1,tBNID1))
			 {
				 return false;
			 }
		  }	 
	  }
	  
	  return true;
}


//��дһ������������У�����������֤��/֤���ļ����ͣ����֤��/֤���ļ��������д������ţ�
//������������һ���������ţ������������д�������
//���ֿ��ɽ���¼��ʱ��û�е���������ĳ���
  function CheckNotReplace(a,b,c)
  {
		 if((a=="@N"&&b=="@N"&&c=="@N")||(a!="@N"&&b!="@N"&&c!="@N"))
		 {
			 //ʲôҲ���ᷢ��
			 return true;
		 }
		 else
		 {
			 alert("���������֤��/֤���ļ�����/�������д������ţ�������������һ���������ţ������������д�������");
			 return false;
		 }
		 if((a=="@E"&&b=="@E"&&c=="@E")||(a!="@E"&&b!="@E"&&c!="@E"))
		 {
			 //ʲôҲ���ᷢ��
			 return true;
		 }
		 else
		 {
			 alert("���������֤��/֤���ļ�����/�������д������ţ�������������һ���������ţ������������д�������");
			 return false;
		 }
		 if((a=="@I"&&b=="@I"&&c=="@I")||(a!="@I"&&b!="@I"&&c!="@I"))
		 {
			 //ʲôҲ���ᷢ��
			 return true;
		 }
		 else
		 {
			 alert("���������֤��/֤���ļ����ͣ����֤��/֤���ļ��������д������ţ�������������һ���������ţ������������д�������");
			 return false;
		 }
  }