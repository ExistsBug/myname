<%@page contentType="text/html;charset=GBK" %>
<SCRIPT src="../common/javascript/Common.js"></SCRIPT>

  
<script language="JavaScript">

var turnPageInfoF = new turnPageClass();
function initInpBox()
{ 
  try
  {     
      fm.reset();
     // fm.all('ManageCom').value = <%= tGI.ManageCom %>;
      //showOneCodeName("station","ManageCom","ManageComName");
      fm.all('KeyWord').value = '';
      fm.all('Idx').value = '';  
      fm.all('hideOperate').value = '';
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
        iArray[2][0]="�������";
        iArray[2][1]="150px";
        iArray[2][2]=150;
        iArray[2][3]=0;

        iArray[3]=new Array();    
        iArray[3][0]="��������";
        iArray[3][1]="60px";
        iArray[3][2]=150;
        iArray[3][3]=0;

        iArray[4]=new Array();    
        iArray[4][0]="����ؼ���";
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

        iArray[7]=new Array();    
        iArray[7][0]="��������";
        iArray[7][1]="60px";
        iArray[7][2]=150;
        iArray[7][3]=0;
        iArray[7][7]="downloadFile";
        iArray[7][14]="˫������";

        iArray[8]=new Array();    
        iArray[8][0]="����";
        iArray[8][1]="0px";
        iArray[8][2]=150;
        iArray[8][3]=0;

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

       // LXKnowledgeGrid.selBoxEventFuncName ="queryLXKnowledgeGrid";   //���RadioBoxʱ��Ӧ��JS����
        LXKnowledgeGrid.loadMulLine(iArray);  
    }
    catch(ex)
    {
      alert(ex);
    }
}


function easyQuery2()
{     
    
	    var QuerySQL = "select a.IDX,(select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '֪ʶ԰��' end), a.Keyword," +
	    		" (case a.State when 'R01'then '���ϱ�' when 'R03' then '���ͨ��' when 'R04' then '��˲�ͨ��' when 'R05' then '�ѷ���'end),Pubdate from LXKnowledgeField a "
        +    " where 1 = 1 and a.PubType='04' and a.State='R05' and managecom like '" + comcode + "%' and a.KeyWord like '%"+ fm.all('Keyword').value +"%'"
      //  +   "order by a.IDX desc";
       try
     {
	    turnPageInfoF.pageDivName = "divTurnPageLXKnowledgeGrid";
	    turnPageInfoF.queryModal(QuerySQL, LXKnowledgeGrid, 0, 1);
        }
     catch (ex)
     {
         alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
      }
}



function initForm()
{
  try
  {
    initInpBox();
    initLXKnowledgeGrid();
    easyQuery2();
  	//initWaitForReasonGrid();
    //easyQuery();
  }
  catch(re)
  {
    alert("��LXKnowledgeFieldInitInput.jsp-->InitForm�����з����쳣:��ʼ���������!");
  }
}

</script>
