//<!-- JavaScript Document BGN -->


/*============================================================================*/

var showInfo;                                           //ȫ�ֱ���, ������ʾ����, ������
var turnPage = new turnPageClass();                     //ȫ�ֱ���, ��ѯ�����ҳ, ������
var turnPageCustmoerGrid = new turnPageClass();    //ȫ�ֱ���, ��ѡ�ϱ����Ĳ�ѯ�����ҳ
var turnPageHCustmoerGrid = new turnPageClass();
var turnPageLCustmoerGrid = new turnPageClass();
/*============================================================================*/

/**
 * �ύ�����, ���������ݷ��غ�ִ�еĲ���
 */
function afterSubmit(DealFlag, MsgContent)
{
    try { showInfo.close(); } catch (ex) {}
    DealFlag = DealFlag.toLowerCase();
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=";
    switch (DealFlag)
    {
        case "fail":
            MsgPageURL = MsgPageURL + "F&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=250px");
            break;
        case "succ":
        case "success":
            MsgPageURL = MsgPageURL + "S&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=350px");
            break;
        default:
            MsgPageURL = MsgPageURL + "C&content=" + MsgContent;
            showInfo = showModalDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
            break;
    }


}

/*============================================================================*/

/**
 * ��ѯ��ѡ�ϱ�������Ϣ
 */
function queryCustmoerGrid(temp)
{
		var ob = {};
		if('fee'==temp)
		{
		    ob.busicode = 'prefee';
		    ob.businame = '�ͻ���ҵ';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('isreport'==temp)
		{
		    ob.busicode = 'rpttype';
		    ob.businame = '�ͻ���ҵ';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('busi'==temp)
		{
		    ob.busicode = 'businesstype';
		    ob.businame = '�ͻ���ҵ';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('risk'==temp)
		{
		    ob.busicode = 'risk';
		    ob.businame = 'ҵ������';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LMRisk';
		    ob.code     = 'RiskCode';
		    ob.cname    = 'RiskName';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('managecom'==temp)
		{
		    ob.busicode = 'managecom';
		    ob.businame = 'Ͷ������';
		    ob.weight   = '0.07';
		    ob.table    = 'htlis.LDCom';
		    ob.code     = 'ComCode';
		    ob.cname    = 'Name';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('paymode'==temp)
		{
		    ob.busicode = 'paymode';
		    ob.businame = '�ɷѷ�ʽ';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'payintv';
		}
    var QuerySQL = "select ParameterType, "
                 +        "ParemeterName, "
                 +        "ParameterCode, "
                 +        "ParameterSName, "
                 +        "HazardScore, "
                 +        "(select CodeName from LDCode where CodeType='hazard' and Code=HazardScore), "          
                 +        "HazardWeight "
                 +    "from HazardInfo a "
                 +    "where 1 = 1 "
                 +     "and ParameterType = '"+ob.busicode+"' and HazardScore=0";

    
    try
    {
        turnPageCustmoerGrid.queryModal(QuerySQL, CustmoerGrid,0,1);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
}
function queryHCustmoerGrid(temp)
{

		var ob = {};
		if('fee'==temp)
		{
		    ob.busicode = 'prefee';
		    ob.businame = '�ͻ���ҵ';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('isreport'==temp)
		{
		    ob.busicode = 'rpttype';
		    ob.businame = '�ͻ���ҵ';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('busi'==temp)
		{
		    ob.busicode = 'businesstype';
		    ob.businame = '�ͻ���ҵ';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('risk'==temp)
		{
		    ob.busicode = 'risk';
		    ob.businame = 'ҵ������';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LMRisk';
		    ob.code     = 'RiskCode';
		    ob.cname    = 'RiskName';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('managecom'==temp)
		{
		    ob.busicode = 'managecom';
		    ob.businame = 'Ͷ������';
		    ob.weight   = '0.07';
		    ob.table    = 'htlis.LDCom';
		    ob.code     = 'ComCode';
		    ob.cname    = 'Name';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('paymode'==temp)
		{
		    ob.busicode = 'paymode';
		    ob.businame = '�ɷѷ�ʽ';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'payintv';
		}
    var QuerySQL = "select ParameterType, "
                 +        "ParemeterName, "
                 +        "ParameterCode, "
                 +        "ParameterSName, "
                 +        "HazardScore, "
                 +        "(select CodeName from LDCode where CodeType='hazard' and Code=HazardScore), "          
                 +        "HazardWeight "
                 +    "from HazardInfo a "
                 +    "where 1 = 1 "
                 +     "and ParameterType = '"+ob.busicode+"' and HazardScore=2";

    
    try
    {
        turnPageHCustmoerGrid.queryModal(QuerySQL, HCustmoerGrid,0,1);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
}
function queryLCustmoerGrid(temp)
{

		var ob = {};
		if('fee'==temp)
		{
		    ob.busicode = 'prefee';
		    ob.businame = '�ͻ���ҵ';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('isreport'==temp)
		{
		    ob.busicode = 'rpttype';
		    ob.businame = '�ͻ���ҵ';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('busi'==temp)
		{
		    ob.busicode = 'businesstype';
		    ob.businame = '�ͻ���ҵ';
		    ob.weight   = '0.12';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'businesstype';
		}
		if('risk'==temp)
		{
		    ob.busicode = 'risk';
		    ob.businame = 'ҵ������';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LMRisk';
		    ob.code     = 'RiskCode';
		    ob.cname    = 'RiskName';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('managecom'==temp)
		{
		    ob.busicode = 'managecom';
		    ob.businame = 'Ͷ������';
		    ob.weight   = '0.07';
		    ob.table    = 'htlis.LDCom';
		    ob.code     = 'ComCode';
		    ob.cname    = 'Name';
		    ob.whereCol = "'1'";
		    ob.where    = '1';
		}
		if('paymode'==temp)
		{
		    ob.busicode = 'paymode';
		    ob.businame = '�ɷѷ�ʽ';
		    ob.weight   = '0.17';
		    ob.table    = 'htlis.LDCode';
		    ob.code     = 'Code';
		    ob.cname    = 'CodeName';
		    ob.whereCol = 'CodeType';
		    ob.where    = 'payintv';
		}
    var QuerySQL = "select ParameterType, "
                 +        "ParemeterName, "
                 +        "ParameterCode, "
                 +        "ParameterSName, "
                 +        "HazardScore, "
                 +        "(select CodeName from LDCode where CodeType='hazard' and Code=HazardScore), "          
                 +        "HazardWeight "
                 +    "from HazardInfo a "
                 +    "where 1 = 1 "
                 +     "and ParameterType = '"+ob.busicode+"' and HazardScore=1";

    
    try
    {
        turnPageLCustmoerGrid.queryModal(QuerySQL, LCustmoerGrid,0,1);
    }
    catch (ex)
    {
        alert("���棺��ѯ��ѡ�ϱ�������Ϣ�����쳣�� ");
    }
}
function syncdata()
{
    var MsgContent = "����ͬ�����ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
    showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");
		fm.action = "LXCustomerEvaluateParameterSave.jsp?oper=sync";
		fm.submit();
}
function updatedata(temp)
{
		
    var MsgContent = "���ڲ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
    showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");

		fm.action = "LXCustomerEvaluateParameterSave.jsp?oper="+temp;

		fm.submit();
}
function calData()
{

    var MsgContent = "���ڲ������ݣ������Ժ��Ҳ�Ҫ�޸���Ļ�ϵ�ֵ����������ҳ��";
    var MsgPageURL = "../common/jsp/MessagePage.jsp?picture=C&content=" + MsgContent;
    showInfo = showModelessDialog(MsgPageURL, window, "status=0; help=0; close=0; dialogWidth=550px; dialogHeight=300px");

		fm.action = "LXCustomerEvaluateParameterSave.jsp?oper=cal";

		fm.submit();
}