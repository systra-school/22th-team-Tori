<!-- gyoumuRenraku.jsp -->
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.gyo.GyoumuRenrakuNyuuryokuKakuninBean"%>
<%@page import="java.util.List"%>
<%@page import="form.gyo.GyoumuRenrakuNyuuryokuKakuninForm"%>
<%
/**
 * �t�@�C�����FgyoumuRenraku.jsp
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
    <script type="text/javascript" language="Javascript1.1"></script>
    <script>
    function gyoumuRenrakuNyuuryokuRegist() {
    	//�^�C�g���󔒃��b�Z�[�W
    	var titleErr = '';
    	//�^�C�g���G���[���b�Z�[�W
    	var titleErrMsg = '';
    	//���e�G���[���b�Z�[�W
    	var memoErrMsg = '';
    	//�G���[���b�Z�[�W
    	var errorMsg = '';
    	
    	//�^�C�g�����擾�����������擾
    	var title = document.forms[0].elements['title'].value;
    	var titleLen = title.length;
    	//���e���擾�����������擾
    	var memo = document.forms[0].elements['memo'].value;
    	var memoLen = memo.length;
    	//�w�i�F�̃N���A
    	document.forms[0].elements['title'].style.backgroundColor = 'white';
    	document.forms[0].elements['memo'].style.backgroundColor = 'white';
    	
    	if (titleLen === 0) {
    		var strArr = ['�^�C�g��'];
    		titleErr = getMessage('E-MSG-000001', strArr);
    		document.forms[0].elements['title'].style.backgroundColor = 'red';
    	}
    	if (titleLen > 20) {
    		titleErrMsg = getMessageCodeOnly('E-MSG-000006');
    		document.forms[0].elements['title'].style.backgroundColor = 'red';
    	}
    	if (memoLen > 200) {
    		memoErrMsg = getMessageCodeOnly('E-MSG-000007');
    		document.forms[0].elements['memo'].style.backgroundColor = 'red';
    	}
    	
    	errorMsg = titleErr + titleErrMsg + memoErrMsg;
		
		if (errorMsg) {
			alert(errorMsg);
			// �G���[
            return false;
		}
		
		document.forms[0].submit();
    }
    </script>

    <title>�Ɩ��A�����͉��</title>

    <link href="/kikin/pages/css/gyoumu.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              <input value="�߂�" type="button" class="smlButton"  onclick="doSubmit('/kikin/gyoumuRenrakuNyuuryokuBack.do')" />
            </td>
            <td id="headCenter">
              �Ɩ��A������
            </td>
            <td id="headRight">
              <input value="���O�A�E�g" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody">
        <html:form action="/gyoumuRenrakuNyuuryokuRegist">
          <div style="width: 630px; margin-left:300px;">
            <table class="tblHeader" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td width="180px" align="center">
                  �^�C�g��(20����)
                </td>
                <td width="180px"  align="center">
                  <html:text property="title" size="43" />
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto; height: 400px; width: 630px; margin-left:300px;">
            <table class="tblBody" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td width="180px" align="center">
                  ���e(200����)
                </td>
                <td width="180px"  align="center">
                  <html:textarea property="memo" rows="10" cols="50" />
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
                <input value="�o�^" type="button" class="smlButton"  onclick="gyoumuRenrakuNyuuryokuRegist()" />
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>