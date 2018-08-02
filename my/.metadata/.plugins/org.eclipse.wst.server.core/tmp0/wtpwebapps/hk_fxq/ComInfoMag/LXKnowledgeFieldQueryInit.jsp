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
    alert("在LXKnowledgeFieldInitInput.jsp-->InitInpBox函数中发生异常:初始化界面错误!");
  }      
}


//恐怖分子信息
function initLXKnowledgeGrid()
{
    var iArray = new Array();
    try
    {
        iArray[0]=new Array();
        iArray[0][0]="序号";
        iArray[0][1]="30px";
        iArray[0][2]=30;
        iArray[0][3]=0;
 
        iArray[1]=new Array();    
        iArray[1][0]="编码";
        iArray[1][1]="60px";
        iArray[1][2]=100;
        iArray[1][3]=3;
        
        iArray[2]=new Array();    
        iArray[2][0]="管理机构";
        iArray[2][1]="150px";
        iArray[2][2]=150;
        iArray[2][3]=0;

        iArray[3]=new Array();    
        iArray[3][0]="发布类型";
        iArray[3][1]="60px";
        iArray[3][2]=150;
        iArray[3][3]=0;

        iArray[4]=new Array();    
        iArray[4][0]="标题关键字";
        iArray[4][1]="300px";
        iArray[4][2]=150;
        iArray[4][3]=0;
        
        iArray[5]=new Array();    
        iArray[5][0]="数据状态";
        iArray[5][1]="60px";
        iArray[5][2]=150;
        iArray[5][3]=0;
        
        iArray[6]=new Array();    
        iArray[6][0]="发布日期";
        iArray[6][1]="60px";
        iArray[6][2]=150;
        iArray[6][3]=0;

        iArray[7]=new Array();    
        iArray[7][0]="附件下载";
        iArray[7][1]="60px";
        iArray[7][2]=150;
        iArray[7][3]=0;
        iArray[7][7]="downloadFile";
        iArray[7][14]="双击下载";

        iArray[8]=new Array();    
        iArray[8][0]="编码";
        iArray[8][1]="0px";
        iArray[8][2]=150;
        iArray[8][3]=0;

        // LXPolicRulpubGrid
        LXKnowledgeGrid = new MulLineEnter( "fm" , "LXKnowledgeGrid" );
        //这些属性必须在loadMulLine前
        LXKnowledgeGrid.mulLineCount = 0;
        LXKnowledgeGrid.displayTitle = 1;
        LXKnowledgeGrid.locked = 0;
        LXKnowledgeGrid.hiddenPlus = 1;
        LXKnowledgeGrid.hiddenSubtraction = 1;
        LXKnowledgeGrid.canChk = 0;
        LXKnowledgeGrid.canSel = 1;

       // LXKnowledgeGrid.selBoxEventFuncName ="queryLXKnowledgeGrid";   //点击RadioBox时响应的JS函数
        LXKnowledgeGrid.loadMulLine(iArray);  
    }
    catch(ex)
    {
      alert(ex);
    }
}


function easyQuery2()
{     
    
	    var QuerySQL = "select a.IDX,(select name from ldcom where comcode=a.managecom),(case a.Pubtype when '04' then '知识园地' end), a.Keyword," +
	    		" (case a.State when 'R01'then '待上报' when 'R03' then '审核通过' when 'R04' then '审核不通过' when 'R05' then '已发布'end),Pubdate from LXKnowledgeField a "
        +    " where 1 = 1 and a.PubType='04' and a.State='R05' and managecom like '" + comcode + "%' and a.KeyWord like '%"+ fm.all('Keyword').value +"%'"
      //  +   "order by a.IDX desc";
       try
     {
	    turnPageInfoF.pageDivName = "divTurnPageLXKnowledgeGrid";
	    turnPageInfoF.queryModal(QuerySQL, LXKnowledgeGrid, 0, 1);
        }
     catch (ex)
     {
         alert("警告：查询可选上报报文信息出现异常！ ");
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
    alert("在LXKnowledgeFieldInitInput.jsp-->InitForm函数中发生异常:初始化界面错误!");
  }
}

</script>
