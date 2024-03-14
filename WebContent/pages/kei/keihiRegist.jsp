<!-- keihiRegist.jsp -->
<%
/**
 * �t�@�C�����FkeihiRegist.jsp
 *
 * �ύX����
 * 1.0  2010/09/13 Kazuya.Naraki
 */
%>
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <script type="text/javascript" src="/kikin/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/message.js"></script>
    <script type="text/javascript" language="Javascript1.1">
    <!--

    /**
     * �`�F�b�N�{�b�N�X���`�F�b�N���ꂽ�� true�A����Ă��Ȃ���� false
     * param index �Ώۍs�ԍ�
     */
    function checkDeleteFlg(index) {
      var isCheck = document.forms[0].elements.deleteShainId[index].checked;

      document.forms[0].elements.deleteFlg[index].value = isCheck;
    }

    /**
     * �V�K�o�^��ʂ�
     */
    function keihiRegist() {



        // �T�u�~�b�g
        doSubmit('/kikin/keihiRegist.do');
    }

    -->
    </script>
    <title>�Ј��}�X�^�����e�i���X���</title>

    <link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              <input value="�߂�" type="button" class="smlButton"  onclick="doSubmit('/kikin/keihiRegistBack.do')" />
            </td>
            <td id="headCenter">
              �o��Z�i�V�K�o�^�j
            </td>
            <td id="headRight">
              <input value="���O�A�E�g" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody">
        <html:form action="/keihiRegist" >
           <%-- "margin-left:300px" �� "margin-left:auto; margin-right: auto"�ɏC���B(���׍s��)
           	    ���׍s�̍��ڕ��̒�����width��1�����B
          		2024/02/28 ����
           --%>
          <div style="width: 650px;text-align: left; margin-left:auto; margin-right: auto;">
            <table class="tblHeader" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td width="100px" align="center">
                  ���p��
                </td>
                <td width="150px" align="center">
                  ���p�Ώ�
                </td>
                <td width="200px" align="center">
                  ���p�ړI
                </td>
                <td width="200px" align="center">
                  ���p���z
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto; height: 440px; width: 650px; margin-left:auto; margin-right: auto; ">
            <table class="tblBody" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td style="display: none;">
                  <input type="text" name="shainId" value="<%= String.valueOf(request.getAttribute("shainId")) %>" />
                </td>
                <td width="101px" align="center">
                  <input type="date" name="date" >
                </td>
                <td width="151px"  align="center">
                  <html:text property="password"  value="" size="10" />
                </td>
                <td width="199px"  align="center">
                  <html:text property="shainName" value="" size="20" />
                </td>
                <td width="199px"  align="center">
                  <html:text property="shainNameKana" value="" size="20" />
                </td>
              </tr>
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
              <input value="�o�^" type="button" class="smlButton"  onclick="keihiRegist()" />
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>