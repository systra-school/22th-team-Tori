<!-- shainMstMntRegist.jsp -->
<%
/**
 * �t�@�C�����FshainMstMntRegist.jsp
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
    function shainMstMntRegist() {

        with (document.forms[0]) {
            // �p�X���[�h
            var passwordVar = password.value;
            // �Ј����J�i
            var shainNameKanaVar = shainNameKana.value;
            // �G���[���b�Z�[�W
            var errorMsg = '';

            // �w�i�F���N���A����
            password.style.backgroundColor = 'white';
            shainNameKana.style.backgroundColor = 'white';

            // �p�X���[�h
            if (!checkRequired(passwordVar)) {
                // �G���[�L��
                var strArr = ['�p�X���[�h'];
                errorMsg += getMessage('E-MSG-000001', strArr);
                password.style.backgroundColor = 'red';
            }
            // �Ј����J�i
            if (!checkHankakuKana(shainNameKanaVar)) {
                // �G���[�L��
                var strArr = ['�Ј����J�i'];
                errorMsg += getMessage('E-MSG-000003', strArr);
                shainNameKana.style.backgroundColor = 'red';
            }

            if (errorMsg) {
                alert(errorMsg);
                // �G���[
                return false;
            }
        }

        // �T�u�~�b�g
        doSubmit('/kikin/shainMstMntRegist.do');
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
              <input value="�߂�" type="button" class="smlButton"  onclick="doSubmit('/kikin/shainMstMntRegistBack.do')" />
            </td>
            <td id="headCenter">
              �Ј��}�X�^�����e�i���X��ʁi�V�K�o�^�j
            </td>
            <td id="headRight">
              <input value="���O�A�E�g" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody">
        <html:form action="/shainMstMntRegist" >
          <div style="width: 650px;text-align: left; margin-left:300px;">
            <table class="tblHeader" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td width="150px" align="center">
                  �p�X���[�h
                </td>
                <td width="200px" align="center">
                  �Ј���
                </td>
                <td width="200px" align="center">
                  �Ј����J�i
                </td>
                <td width="100px" align="center">
                  ����
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto; height: 440px; width: 650px; margin-left:300px; ">
            <table class="tblBody" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td width="150px"  align="center">
                  <html:text property="password"  value="" size="10" />
                </td>
                <td width="200px"  align="center">
                  <html:text property="shainName" value="" size="20" />
                </td>
                <td width="200px"  align="center">
                  <html:text property="shainNameKana" value="" size="20" />
                </td>
                <td width="100px" align="center">
                  <html:select property="kengenId" value="01">
                    <html:optionsCollection name="shainMstMntForm"
                                            property="kengenCmbMap"
                                            value="key"
                                            label="value"/>
                  </html:select>
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
              <input value="�o�^" type="button" class="smlButton"  onclick="shainMstMntRegist()" />
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>