<!-- shainMstMnt.jsp -->
<%
/**
 * �t�@�C�����FshainMstMnt.jsp
 *
 * �ύX����
 * 1.0  2010/09/13 Kazuya.Naraki
 */
%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.kei.KeihiForm"%>
<%@page import="java.util.List"%>
<%@page import="form.mst.ShainMstMntBean"%>
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>

<bean:size id="keihiBeanListSize" name="keihiForm" property="keihiBeanList"/>
<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <script type="text/javascript" src="/kikin/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/message.js"></script>
    

    
    <script type="text/javascript" language="Javascript1.1">
    
    /**
     * �`�F�b�N�{�b�N�X���`�F�b�N���ꂽ�� true�A����Ă��Ȃ���� false
     * param index �Ώۍs�ԍ�
     */
    function checkDeleteFlg(index) {
        var deleteShainId = document.forms[0].elements.deleteShainId;
        var isCheck = false;

        if (deleteShainId.length > 1) {
            isCheck = document.forms[0].elements.deleteShainId[index].checked;
        } else {
            isCheck = deleteShainId.checked;
        }

        document.forms[0].elements.namedItem('keihiBeanList['+ index +'].deleteFlg').value = isCheck;
    }

    /**
     * �V�K�o�^��ʂ�
     */
    function shainMstMntRegistInit() {
        document.forms[0].action = "/kikin/keihiRegistInit.do";
        document.forms[0].submit();	
    }

    /**
     * �X�V�������s��
     */
    function shainMstMntUpdate() {
        // �ꗗ�̃T�C�Y


        document.forms[0].submit();
    }

 
    </script>

    <title>�o��Z�\�����</title>

    <link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              <input value="�߂�" type="button" class="smlButton"  onclick="doSubmit('/kikin/shainMstMntBack.do')" />
            </td>
            <td id="headCenter">
              �o��Z�\��
            </td>
            <td id="headRight">
              <input value="���O�A�E�g" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody">
        <html:form action="/keihiUpdate">
        
        <!--��Q�\012�@2024/02/29�@�Ð�@�C��-->
          <div style="overflow-x: auto;overflow-y: hidden; width: 1088px;margin-left:100px">
            <table class="tblHeader" border="1"   cellpadding="0" cellspacing="0">
              <tr>
                <td width="200px" align="center">
                  �Ј��h�c
                </td>
                <td width="100px" align="center">
                  ���p��
                </td>
                <td width="200px" align="center">
                  ���p�Ώ�
                </td>
                <td width="200px" align="center">
                  ���p�ړI
                </td>
                <td width="200px" align="center">
                  ���p���z
                </td>
                <td width="100px" align="center">
                  �\��
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto; height:440px; width:1030px; margin-left:100px ">
            <table class="tblBody" border="1"  cellpadding="0" cellspacing="0" >
              <logic:iterate indexId="idx" id="keihiBeanList" name="keihiForm"  property="keihiBeanList">
                <bean:define id="shainId" name= "keihiBeanList" property="shainId" type="java.lang.String"/>
                <bean:define id="selectKengenId" name= "keihiBeanList" property="kengenId" type="java.lang.String"/>
                <logic:equal name="keihiBeanList" property="shainId" value='<%= String.valueOf(request.getAttribute("sId")) %>'>
                <tr>
                  <td width="200px"  align="center">
                    <bean:write property="shainId" name="keihiBeanList"/>
                    <html:hidden property="shainId" name="keihiBeanList" indexed="true"/>
                  </td>
                  <td width="100px"  align="center">
                    <html:text property="kengenId" name="keihiBeanList" size="10" maxlength="10" indexed="true" />
                  </td>
                  <td width="200px"  align="center">
                    <html:text property="password" name="keihiBeanList"  size="10" maxlength="6" indexed="true" />
                  </td>
                  <td width="200px"  align="center">
                    <html:text property="shainName" name="keihiBeanList" size="20" maxlength="10" indexed="true" />
                  </td>
                  <td width="200px"  align="center">
                    <html:text property="shainNameKana" name="keihiBeanList"  size="20" maxlength="10" indexed="true" />
                  </td>
                  <td width="100px"  align="center">
                    <html:checkbox property="deleteShainId" name="keihiBeanList" value="<%= shainId %>" onchange='<%="checkDeleteFlg(" + idx + ")" %>' ></html:checkbox>
                    <html:hidden property="deleteFlg" name="keihiBeanList" value="false" indexed="true"/>
                  </td>
                </tr>
                </logic:equal>
              </logic:iterate>
            </table>
          </div>
        </html:form>
      </div>
      <div id="footer">
        <table>
          <tr>
            <td id="footLeft">
              �@
            </td>
            <td id="footCenter">
              �@
            </td>
            <td id="footRight">
              <input value="�V�K�o�^" type="button" class="smlButton"  onclick="shainMstMntRegistInit()" />
              <input value="�X�V" type="button" class="smlButton"  onclick="shainMstMntUpdate()" />
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>