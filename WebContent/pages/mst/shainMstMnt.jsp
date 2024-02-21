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
<%@page import="form.mst.ShainMstMntForm"%>
<%@page import="java.util.List"%>
<%@page import="form.mst.ShainMstMntBean"%>
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>

<bean:size id="shainMstMntBeanListSize" name="shainMstMntForm" property="shainMstMntBeanList"/>
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
        var deleteShainId = document.forms[0].elements.deleteShainId;
        var isCheck = false;

        if (deleteShainId.length > 1) {
            isCheck = document.forms[0].elements.deleteShainId[index].checked;
        } else {
            isCheck = deleteShainId.checked;
        }

        document.forms[0].elements.namedItem('shainMstMntBeanList['+ index +'].deleteFlg').value = isCheck;
    }

    /**
     * �V�K�o�^��ʂ�
     */
    function shainMstMntRegistInit() {
        document.forms[0].action = "/kikin/shainMstMntRegistInit.do";
        document.forms[0].submit();
    }

    /**
     * �X�V�������s��
     */
    function shainMstMntUpdate() {
        // �ꗗ�̃T�C�Y
        var listSize = <%= shainMstMntBeanListSize %>;

        // �p�X���[�h�G���[���b�Z�[�W
        var passwordErrorMsg = '';
        // �Ј����J�i�G���[���b�Z�[�W
        var shainmeiKanaErrorMsg = '';
        var errorMsg = '';

        with(document.forms[0].elements) {
            for (var i = 0; i < listSize; i++) {
                // �p�X���[�h���擾����B
                var password = namedItem('shainMstMntBeanList['+ i +'].password').value;
                // �Ј����J�i���擾����B
                var shainNameKana = namedItem('shainMstMntBeanList['+ i +'].shainNameKana').value;

                // �w�i�F���N���A����
                namedItem('shainMstMntBeanList['+ i +'].password').style.backgroundColor = 'white';
                namedItem('shainMstMntBeanList['+ i +'].shainNameKana').style.backgroundColor = 'white';

                // �p�X���[�h�`�F�b�N
                if (!passwordErrorMsg) {
                    if (!checkRequired(password)) {
                        var strArr = ['�p�X���[�h'];
                        passwordErrorMsg = getMessage('E-MSG-000001', strArr);
                        namedItem('shainMstMntBeanList['+ i +'].password').style.backgroundColor = 'red';
                    }
                }
                // �Ј����J�i�`�F�b�N
                if (!shainmeiKanaErrorMsg) {
                    if (!checkHankakuKana(shainNameKana)) {
                        var strArr = ['�Ј����J�i'];
                        shainmeiKanaErrorMsg = getMessage('E-MSG-000003', strArr);
                        namedItem('shainMstMntBeanList['+ i +'].shainNameKana').style.backgroundColor = 'red';
                    }
                }

                if (passwordErrorMsg && shainmeiKanaErrorMsg) {
                    // �p�X���[�h �A�Ј����J�i�����ɃG���[�̏ꍇ
                    break;
                }
            }
        }
        // �G���[���b�Z�[�W
        errorMsg = passwordErrorMsg + shainmeiKanaErrorMsg;

        if (errorMsg) {
            alert(errorMsg);
            // �G���[
            return false;
        }

        document.forms[0].submit();
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
              <input value="�߂�" type="button" class="smlButton"  onclick="doSubmit('/kikin/shainMstMntBack.do')" />
            </td>
            <td id="headCenter">
              �Ј��}�X�^�����e�i���X
            </td>
            <td id="headRight">
              <input value="���O�A�E�g" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody">
        <html:form action="/shainMstMntUpdate">
          <div style="overflow:hidden; margin-left:100px">
            <table class="tblHeader" border="1"   cellpadding="0" cellspacing="0">
              <tr>
                <td width="200px" align="center">
                  �Ј��h�c
                </td>
                <td width="200px" align="center">
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
                <td width="100px" align="center">
                  �폜
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto; height:440px; width:1030px; margin-left:100px ">
            <table class="tblBody" border="1"  cellpadding="0" cellspacing="0" >
              <logic:iterate indexId="idx" id="shainMstMntBeanList" name="shainMstMntForm"  property="shainMstMntBeanList">
                <bean:define id="shainId" name= "shainMstMntBeanList" property="shainId" type="java.lang.String"/>
                <bean:define id="selectKengenId" name= "shainMstMntBeanList" property="kengenId" type="java.lang.String"/>
                <tr>
                  <td width="200px"  align="center">
                    <bean:write property="shainId" name="shainMstMntBeanList"/>
                    <html:hidden property="shainId" name="shainMstMntBeanList" indexed="true"/>
                  </td>
                  <td width="200px"  align="center">
                    <html:password property="password" name="shainMstMntBeanList"  size="10" maxlength="6" indexed="true" />
                  </td>
                  <td width="200px"  align="center">
                    <html:text property="shainName" name="shainMstMntBeanList" size="20" maxlength="10" indexed="true" />
                  </td>
                  <td width="200px"  align="center">
                    <html:text property="shainNameKana" name="shainMstMntBeanList"  size="20" maxlength="10" indexed="true" />
                  </td>
                  <td width="100px"  align="center">
                    <html:select property="kengenId" name="shainMstMntBeanList" value="<%= selectKengenId %>" indexed="true">
                      <html:optionsCollection name="shainMstMntForm"
                                              property="kengenCmbMap"
                                              value="key"
                                              label="value"/>
                    </html:select>
                  </td>
                  <td width="100px"  align="center">
                    <html:checkbox property="deleteShainId" name="shainMstMntBeanList" value="<%= shainId %>" onchange='<%="checkDeleteFlg(" + idx + ")" %>' ></html:checkbox>
                    <html:hidden property="deleteFlg" name="shainMstMntBeanList" value="false" indexed="true"/>
                  </td>
                </tr>
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