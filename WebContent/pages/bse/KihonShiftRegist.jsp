<%
/**
 * �t�@�C�����FkihonShtRegist.jsp
 *
 * �ύX����
 * 1.0  2010/10/05 Satoshi.Sugi
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
<%
  // �ꗗ�̃T�C�Y���擾����
  ShainMstMntForm shainMstMntFormSession = (ShainMstMntForm) session.getAttribute("shainMstMntForm");
  List<ShainMstMntBean> shainMstMntBeanLista = shainMstMntFormSession.getShainMstMntBeanList();

  int shainMstMntBeanListSize = 0;

  if (CheckUtils.isEmpty(shainMstMntBeanLista)) {
      shainMstMntBeanListSize = 0;
  } else {
      shainMstMntBeanListSize = shainMstMntBeanLista.size();
  }

%>
<html>
  <head>
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
                // �p�X���[�h�`�F�b�N
                if (!passwordErrorMsg) {
                    // �p�X���[�h���擾����B
                    var password = namedItem('shainMstMntBeanList['+ i +'].password').value;
                    if (!checkRequired(password)) {
                        var strArr = ['�p�X���[�h'];
                        passwordErrorMsg = getMessage('E-MSG-000001', strArr);
                    }
                }
                // �Ј����J�i�`�F�b�N
                if (!shainmeiKanaErrorMsg) {
                    // �p�X���[�h���擾����B
                    var shainNameKana = namedItem('shainMstMntBeanList['+ i +'].shainNameKana').value;
                    if (!checkHankakuKana(shainNameKana)) {
                        var strArr = ['�Ј����J�i'];
                        shainmeiKanaErrorMsg = getMessage('E-MSG-000003', strArr);
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
    <div id="header">
      <div style="display: inline;">
        �Ј��}�X�^�����e�i���X
      </div>

      <div class="backBtn">
        <input value="�߂�" type="button" class="smlButton"  onclick="doSubmit('/kikin/menu.do')" />
      </div>

      <div class="logoutBtn">
        <input value="���O�A�E�g" type="button" class="smlButton"  onclick="logout()" />
      </div>

    </div>
    <html:form action="">
      <div id="gymBody">
        <div style="overflow:hidden; width:100%; height:100%;text-align:center;">
          <div style="width: 630px;text-align: left;">
            <table class="tblHeader" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td width="100px" align="center">
                  �V�t�g��
                </td>
                <td width="100px" align="center">
                  �V���{��
                </td>
                <td width="130px" align="center">
                  ����
                </td>
                <td width="130px" align="center">
                  �x�e
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto; height: 81%; width: 630px;text-align: left; ">
            <table class="tblBody" border="1" cellpadding="0" cellspacing="0">
              <logic:iterate indexId="idx" id="shainMstMntBeanList" name="shainMstMntForm"  property="shainMstMntBeanList">
              <bean:define id="shainId" name= "shainMstMntBeanList" property="shainId" type="java.lang.String"/>
              <bean:define id="selectKengenId" name= "shainMstMntBeanList" property="kengenId" type="java.lang.String"/>
                <tr>
                  <td width="100px"  align="center">
                    <bean:write property="shainId" name="shainMstMntBeanList"/>
                    <html:hidden property="shainId" name="shainMstMntBeanList" indexed="true"/>
                  </td>
                  <td width="100px"  align="center">
                    <html:password property="password" name="shainMstMntBeanList"  size="10" maxlength="6" indexed="true" />
                  </td>
                  <td width="130px"  align="center">
                    <html:text property="shainName" name="shainMstMntBeanList" size="20" maxlength="10" indexed="true" />
                  </td>
                  <td width="130px"  align="center">
                    <html:text property="shainNameKana" name="shainMstMntBeanList"  size="20" maxlength="10" indexed="true" />
                  </td>
                </tr>
              </logic:iterate>
            </table>
          </div>
        </div>
      </div>
    </html:form>
    <div id="footer">
      <div style="position: absolute; top: 10px; right: 120px">
        <input value="�V�K�o�^" type="button" class="smlButton"  onclick="shainMstMntRegistInit()" />
      </div>
      <div style="position: absolute; top: 10px; right: 10px">
        <input value="�X�V" type="button" class="smlButton"  onclick="shainMstMntUpdate()" />
      </div>
    </div>
  </body>
</html>