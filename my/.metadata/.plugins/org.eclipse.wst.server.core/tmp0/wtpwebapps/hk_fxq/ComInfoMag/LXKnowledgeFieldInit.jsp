<%@page contentType="text/html;charset=GBK" %>
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>

  
<script language="JavaScript">
function initInpBox()
{ 
  try
  {     
    fm.reset();
    fm.all('updatebutton').disabled=true;             
    fm.all('ManageCom').value = <%= tGI.ManageCom %>;
     showOneCodeName("stati","ManageCom","ManageComName");
    fm.all('KeyWord').value = '';
    fm.all('FileName').value = '';
    fm.all('Idx').value = '';  
    fm.all('hideOperate').value = '';
    fm.all('KDate').value='';
    fm.all('EDate').value='';
    
  }
  catch(ex)
  {
    alert("��LXKnowledgeFieldInitInput.jsp-->InitInpBox�����з����쳣:��ʼ���������!");
  }      
}


//�ֲ�������Ϣ
function initLXKnowledgeGrid()
{
    var iArray = new Array();
    try
    {
        iArray[0]=new Array();
        iArray[0][0]="���";
        iArray[0][1]="30px";
        iArray[0][2]=30;
        iArray[0][3]=0;

        
        iArray[1]=new Array();    
        iArray[1][0]="����";
        iArray[1][1]="60px";
        iArray[1][2]=100;
        iArray[1][3]=3;
        
        iArray[2]=new Array();    
        iArray[2][0]="��������";
        iArray[2][1]="150px";
        iArray[2][2]=150;
        iArray[2][3]=0;

        iArray[3]=new Array();    
        iArray[3][0]="��������";
        iArray[3][1]="60px";
        iArray[3][2]=150;
        iArray[3][3]=0;



        iArray[4]=new Array();    
        iArray[4][0]="����";
        iArray[4][1]="300px";
        iArray[4][2]=150;
        iArray[4][3]=0;
        
        iArray[5]=new Array();    
        iArray[5][0]="����״̬";
        iArray[5][1]="60px";
        iArray[5][2]=150;
        iArray[5][3]=0;

        iArray[6]=new Array();    
        iArray[6][0]="��������";
        iArray[6][1]="60px";
        iArray[6][2]=150;
        iArray[6][3]=0;
        iArray[6][7]="downloadFile";
        iArray[6][14]="˫������";
        
        iArray[7]=new Array();    
        iArray[7][0]="����ؼ���";
        iArray[7][1]="0px";
        iArray[7][2]=150;
        iArray[7][3]=3;

        iArray[8]=new Array();    
        iArray[8][0]="����";
        iArray[8][1]="0px";
        iArray[8][2]=150;
        iArray[8][3]=3;

        // LXPolicRulpubGrid
        LXKnowledgeGrid = new MulLineEnter( "fm" , "LXKnowledgeGrid" );
        //��Щ���Ա�����loadMulLineǰ
        LXKnowledgeGrid.mulLineCount = 0;
        LXKnowledgeGrid.displayTitle = 1;
        LXKnowledgeGrid.locked = 0;
        LXKnowledgeGrid.hiddenPlus = 1;
        LXKnowledgeGrid.hiddenSubtraction = 1;
        LXKnowledgeGrid.canChk = 0;
        LXKnowledgeGrid.canSel = 1;

        LXKnowledgeGrid.selBoxEventFuncName ="queryLXKnowledgeGrid";   //���RadioBoxʱ��Ӧ��JS����
        LXKnowledgeGrid.loadMulLine(iArray);  
    }
    catch(ex)
    {
      alert(ex);
    }
}

// ��������Ϣ�б�
function initWaitForReasonGrid()
{
    var iArray = new Array();
    try
    {
        iArray[0]=new Array();
        iArray[0][0]="���";
        iArray[0][1]="30px";
        iArray[0][2]=30;
        iArray[0][3]=0;
                                                
        
        iArray[1]=new Array();    
        iArray[1][0]="������";
        iArray[1][1]="100px";
        iArray[1][2]=100;
        iArray[1][3]=0;
        
        iArray[2]=new Array();    
        iArray[2][0]="��˻���";
        iArray[2][1]="80px";
        iArray[2][2]=150;
        iArray[2][3]=0;

        iArray[3]=new Array();    
        iArray[3][0]="�����";
        iArray[3][1]="60px";
        iArray[3][2]=150;
        iArray[3][3]=0;



        iArray[4]=new Array();    
        iArray[4][0]="�������";
        iArray[4][1]="60px";
        iArray[4][2]=150;
        iArray[4][3]=0;
        
        iArray[5]=new Array();    
        iArray[5][0]="���ʱ��";
        iArray[5][1]="60px";
        iArray[5][2]=150;
        iArray[5][3]=0;

        // LXPolicRulpubGrid
        WaitForReasonGrid = new MulLineEnter( "fm" , "WaitForReasonGrid" );
        //��Щ���Ա�����loadMulLineǰ
        WaitForReasonGrid.mulLineCount = 0;
        WaitForReasonGrid.displayTitle = 1;
        WaitForReasonGrid.locked = 0;
        WaitForReasonGrid.hiddenPlus = 1;
        WaitForReasonGrid.hiddenSubtraction = 1;
        WaitForReasonGrid.canChk = 0;
        WaitForReasonGrid.canSel = 1;
        WaitForReasonGrid.loadMulLine(iArray);  
    }
    catch(ex)
    {
      alert(ex);
    }
}

function initForm()
{
  try
  {
    initInpBox();
    initLXKnowledgeGrid();
    initWaitForReasonGrid();
    //easyQuery();
  }
  catch(re)
  {
    alert("��LXKnowledgeFieldInitInput.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

</script>