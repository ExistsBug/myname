<%@page contentType="text/html;charset=GBK" %>
<%
//�������ƣ�
//�����ܣ�
//�������ڣ�
//������  ��
//���¼�¼��
%>
<!--�û�У����-->
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>
<script language="JavaScript">

//���ղ���
function initParam()
{

}

//��null���ַ���תΪ��
function nullToEmpty(string)
{
	if ((string == "null") || (string == "undefined"))
	{
		string = "";
	}
	return string;
}

// �����ĳ�ʼ��
function initInpBox()
{ 

  try
  {                                   
  }
  catch(ex)
  {
    alert("��DetailInit.jsp-->InitInpBox�����з����쳣:��ʼ���������!1");
  }      
}

// ������ĳ�ʼ��
function initSelBox()
{  
  try                 
  {
//    setOption("sex","0=��&1=Ů&2=����");        
  }
  catch(ex)
  {
    alert("��DetailInit.jsp-->InitSelBox�����з����쳣:��ʼ���������!2");
  }
}                                        

function initForm()
{
  try
  {
    initParam();
    //alert("1");
    initInpBox();
    //alert("2");
    initSelBox();
    //alert("3");  
    initPackageGrid();
    //alert("4");
    initSelfPackageGrid();
    //alert("5");
    //querySelfGrid();
    //alert("6");
//	initSelfPolGrid();
//	easyQueryClickSelf();
	
  }
  catch(re)
  {
    alert("DetailInit.jsp-->InitForm�����з����쳣:��ʼ���������!3");
  }
}

//���ҳ��
function emptyForm() 
{
	//emptyFormElements();     //���ҳ�������������COMMON.JS��ʵ��
   
	initSubInsuredGrid();
	initBnfGrid();
	initImpartGrid();
	initSpecGrid();
	initDutyGrid();
	
	//SubInsuredGrid.clearData();
	//BnfGrid.clearData();
	//ImpartGrid.clearData();
	//SpecGrid.clearData();
	//DutyGrid.clearData();
	spanDutyGrid.innerHTML="";
}

// ������Ϣ�б��ĳ�ʼ��
function initPackageGrid()
{                               
    var iArray = new Array();
    
    try
    {
    iArray[0]=new Array();
    iArray[0][0]="���";               //����������Ϊ˳��ţ����������壬���Ҳ���ʾ��
    iArray[0][1]="30px";                //�п�
    iArray[0][2]=10;                  //�����ֵ
    iArray[0][3]=0;                    //�Ƿ���������,1��ʾ������0��ʾ������

    iArray[1]=new Array();
    iArray[1][0]="��ִ�ļ����";             //����
    iArray[1][1]="150px";                //�п�
    iArray[1][2]=100;                  //�����ֵ
    iArray[1][3]=0;                    //�Ƿ���������,1��ʾ������0��ʾ������

    iArray[2]=new Array();
    iArray[2][0]="��ִ�ļ�����";             //����
    iArray[2][1]="80px";                //�п�
    iArray[2][2]=100;                  //�����ֵ
    iArray[2][3]=2;                    //�Ƿ���������,1��ʾ������0��ʾ������
    iArray[2][4]="backfiletype";

    iArray[3]=new Array();
    iArray[3][0]="��Ӧ�ϱ����ݰ����";             //����
    iArray[3][1]="150px";                //�п�
    iArray[3][2]=200;                  //�����ֵ
    iArray[3][3]=3;                    //�Ƿ���������,1��ʾ������0��ʾ������

    iArray[4]=new Array();
    iArray[4][0]="��Ӧ�ϱ����ݰ�����";             //����
    iArray[4][1]="260px";                //�п�
    iArray[4][2]=500;                  //�����ֵ
    iArray[4][3]=0;                    //�Ƿ���������,1��ʾ������0��ʾ������

    iArray[5]=new Array();
    iArray[5][0]="��ִ�ļ�����";             //����
    iArray[5][1]="300px";                //�п�
    iArray[5][2]=200;                  //�����ֵ
    iArray[5][3]=3; 


    iArray[6]=new Array();
    iArray[6][0]="��ִ�ļ�·��";             //����
    iArray[6][1]="150px";                //�п�
    iArray[6][2]=200;                  //�����ֵ
    iArray[6][3]=0;                    //�Ƿ���������,1��ʾ������0��ʾ������

    iArray[7]=new Array();
    iArray[7][0]="����״̬";             //����
    iArray[7][1]="60px";                //�п�
    iArray[7][2]=200;                  //�����ֵ
    iArray[7][3]=2;                    //�Ƿ���������,1��ʾ������0��ʾ������
    iArray[7][4]="backdealstate";

    
    
    
    iArray[8]=new Array();
    iArray[8][0]="����ʱ��";             //����
    iArray[8][1]="100px";                //�п�
    iArray[8][2]=200;                  //�����ֵ
    iArray[8][3]=3;                    //�Ƿ���������,1��ʾ������0��ʾ������

    iArray[9]=new Array();
    iArray[9][0]="��������";             //����
    iArray[9][1]="80px";                //�п�
    iArray[9][2]=200;                  //�����ֵ
    iArray[9][3]=0;                    //�Ƿ���������,1��ʾ������0��ʾ������            
    
    iArray[10]=new Array();
    iArray[10][0]="����Ա";             //����AccidentReason
    iArray[10][1]="50px";                //�п�
    iArray[10][2]=200;                  //�����ֵ
    iArray[10][3]=3;                    //�Ƿ���������,1��ʾ������0��ʾ������
    
    iArray[11]=new Array();
    iArray[11][0]="����Ա";             //����AccidentReason
    iArray[11][1]="100px";                //�п�
    iArray[11][2]=200;                  //�����ֵ
    iArray[11][3]=3;                    //�Ƿ���������,1��ʾ������0��ʾ������
    
    PackageGrid = new MulLineEnter( "fm" , "PackageGrid" ); 
    //��Щ���Ա�����loadMulLineǰ
    PackageGrid.mulLineCount = 0;   
    PackageGrid.displayTitle = 1;
    PackageGrid.locked = 0;
//    PackageGrid.canChk = 1;
    PackageGrid.canSel =1; // 1 ��ʾ ��0 ���أ�ȱʡֵ��
    PackageGrid.selBoxEventFuncName ="PackageGridClick"; //��Ӧ�ĺ���������������
//        PackageGrid.selBoxEventFuncParm =""; //����Ĳ���,����ʡ�Ը���     
    PackageGrid.hiddenPlus=1;
    PackageGrid.hiddenSubtraction=1;
    PackageGrid.loadMulLine(iArray); 
    }
    catch(ex)
    {
        alert(ex);
    }
}

// ������Ϣ�б��ĳ�ʼ��
function initSelfPackageGrid()
{                               
    var iArray = new Array();
    
    try
    {
    iArray[0]=new Array();
    iArray[0][0]="���";               //����������Ϊ˳��ţ����������壬���Ҳ���ʾ��
    iArray[0][1]="30px";                //�п�
    iArray[0][2]=10;                  //�����ֵ
    iArray[0][3]=0;                    //�Ƿ���������,1��ʾ������0��ʾ������

    iArray[1]=new Array();
    iArray[1][0]="��ִ�ļ����";             //����
    iArray[1][1]="150px";                //�п�
    iArray[1][2]=100;                  //�����ֵ
    iArray[1][3]=0;                    //�Ƿ���������,1��ʾ������0��ʾ������

    iArray[2]=new Array();
    iArray[2][0]="��ִ���ݱ��";             //����
    iArray[2][1]="100px";                //�п�
    iArray[2][2]=100;                  //�����ֵ
    iArray[2][3]=3;                    //�Ƿ���������,1��ʾ������0��ʾ������

    iArray[3]=new Array();
    iArray[3][0]="��ִ��������";             //����
    iArray[3][1]="80px";                //�п�
    iArray[3][2]=200;                  //�����ֵ
    iArray[3][3]=2;                    //�Ƿ���������,1��ʾ������0��ʾ������
    iArray[3][4]="backfiletype";

    iArray[4]=new Array();
    iArray[4][0]="�����ļ���";             //����
    iArray[4][1]="100px";                //�п�
    iArray[4][2]=500;                  //�����ֵ
    iArray[4][3]=3;                    //�Ƿ���������,1��ʾ������0��ʾ������

    iArray[5]=new Array();
    iArray[5][0]="�����ļ�����";             //����
    iArray[5][1]="300px";                //�п�
    iArray[5][2]=200;                  //�����ֵ
    iArray[5][3]=0; 


    iArray[6]=new Array();
    iArray[6][0]="����λ";             //����
    iArray[6][1]="130px";                //�п�
    iArray[6][2]=200;                  //�����ֵ
    iArray[6][3]=0;                    //�Ƿ���������,1��ʾ������0��ʾ������

    iArray[7]=new Array();
    iArray[7][0]="����ԭ��";             //����
    iArray[7][1]="120px";                //�п�
    iArray[7][2]=200;                  //�����ֵ
    iArray[7][3]=0;                    //�Ƿ���������,1��ʾ������0��ʾ������
    
  
    
    SelfPackageGrid = new MulLineEnter( "fm" , "SelfPackageGrid" ); 
    //��Щ���Ա�����loadMulLineǰ
    SelfPackageGrid.mulLineCount = 0;   
    SelfPackageGrid.displayTitle = 1;
    SelfPackageGrid.locked = 0;
//    SelfPackageGrid.canChk = 1;
    SelfPackageGrid.canSel =1; // 1 ��ʾ ��0 ���أ�ȱʡֵ��
    SelfPackageGrid.selBoxEventFuncName ="SelfPackageGridClick"; //��Ӧ�ĺ���������������
//        SelfPackageGrid.selBoxEventFuncParm =""; //����Ĳ���,����ʡ�Ը���    
    SelfPackageGrid.hiddenPlus=1;
    SelfPackageGrid.hiddenSubtraction=1;
    SelfPackageGrid.loadMulLine(iArray);  

    }
    catch(ex)
    {
        alert(ex);
    }
}
</script>