<%@ page contentType="text/html;charset=GBK" language="java" errorPage=""%>
<table>
    <tr>
        <td class=common>
        <IMG  src= "../common/images/butExpand.gif" style= "cursor:hand;" OnClick= "showPage(this,divCustom);">
        </td>
        <td class= titleImg>
            ���׻�����Ϣ
        </td>
    </tr>
</table>
<Div id= "divCustom" style= "display: '' ">
    <table class=common border=0>
        <TR class=common>
            <TD class="title" /> ���ױ��</TD>
            <TD class="input"/>
                <input name="DealNo1" id="DealNo1" class="readOnly" readOnly  verify = "���ױ��|notnull"/>
            </TD>
            <TD class="title" /> �ͻ���</TD>
            <TD class="input"/>
                <input name="CSNM" id="CSNM" class="common" verify = "�ͻ���|notnull&len<=32" elementtype=nacessary/>
            </TD>
        </TR>
        <TR class=common>
            <TD class="title" /> �ͻ�����/����</TD>
            <TD class="input"/>
                 <input name="CTNM" id="CTNM" class="common" verify = " �ͻ�����/����|notnull&len<=64" elementtype=nacessary/>
            </TD>
            <TD class="title" /> �ͻ�����</TD>
            <TD class="input"/>
                <Input name="CTNT" id="CTNT" class="codeno" verify = " �ͻ�����|notnull" value="CHN"
                        ondblclick="showCodeList('ccountry',[this,CTNTName],[0,1],null,null,null,null,null,null,1);"
                        onkeyup="showCodeListKey('ccountry',[this,CTNTName],[0,1],null,null,null,null,null,null,1);"
                        /><Input class=codename name=CTNTName readOnly elementtype=nacessary value="">
            </TD>
        </TR>
        <TR class=common>
            <TD class="title" /> �ͻ�֤������</TD>
            <TD class="input"/>
                <Input name="CITP" id="CITP" class="codeno"  verify = " �ͻ�֤������|notnull&Code:amlidtype"
                        ondblclick="showCodeList('amlidtype',[this,CITPName],[0,1]);"
                        onkeyup="showCodeListKey('amlidtype',[this,CITPName],[0,1]);"
                        /><Input class=codename name=CITPName readOnly elementtype=nacessary>
            </TD>
            <TD class="title" /> �ͻ�֤������</TD>
            <TD class="input"/>
                <Input name="CTID" id="CTID" class="common" verify = " �ͻ�֤������|notnull&len<=20" elementtype=nacessary/>
            </TD>
        </TR>
        <TR class=common>
            <TD class="title" /> ���׷�������</TD>
            <TD class="input"/>
                    <input type="text" class="coolDatePicker" name="HTDT" maxlength="10"  dateFormat="short" verify="���׷�������|Date&notnull" elementtype=nacessary>
                </TD>
            <TD class="title" /> ����״̬</TD>
            <TD class="input"/>
                <Input name="DataState" id="DataState" class="readOnly" readOnly  />
            </TD>
        </TR>
        <TR class=common>
            <TD class="title" /> ������������</TD>
            <TD class="input"/>
                <input type="text" class="coolDatePicker" name="DealDate" maxlength="10" dateFormat="short" verify="������������|Date&notnull" elementtype=nacessary>

            </TD>
            <TD class="title" /> ��������ʱ��</TD>
            <TD class="input"/>
                <input name="DealTime" id="DealTime" class="common" verify = " ��������ʱ��|notnull" elementtype=nacessary/>
            </TD>
        </TR>
        <TR class=common>
            <TD class="title" /> ����Ա</TD>
            <TD class="input"/>
                 <Input name="Operator" id="Operator" class="readOnly" readOnly />
            </TD>
            <TD class="title" /> </TD>
            <TD class="input"/>
            </TD>
        </TR>
    </table>
</Div>