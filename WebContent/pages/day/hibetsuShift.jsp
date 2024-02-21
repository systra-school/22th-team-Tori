<!-- hibetsuShift.jsp -->
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.common.DateBean"%>
<%@page import="java.util.List"%>
<%@page import="form.shk.ShukkinKibouKakuninForm"%>
<%
/**
 * �t�@�C�����FhibetsuShift.jsp
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
<bean:size id="hibetsuShiftBeanListSize" name="hibetsuShiftForm"  property="hibetsuShiftBeanList"/>
<%
    int bodyRightDivWidth = 0;
    int bodyRightDivHeight = 0;
    int bodyLeftDivHeight = 0;
    // �{�f�B�e�[�u���� td �̕�
    int tdWidth = 150;
    // �{�f�B�e�[�u���� tr �̏c
    int trHeight = 50;
    // �c�X�N���[���o�[�̕�
    int scrollBarSize = 20;
    if (hibetsuShiftBeanListSize < 6) {
        bodyRightDivWidth = hibetsuShiftBeanListSize * tdWidth + scrollBarSize;
        bodyRightDivHeight = 402;
        bodyLeftDivHeight = 402;
    } else {
        bodyRightDivWidth = 918;
        bodyRightDivHeight = 418;
        bodyLeftDivHeight = 402;
    }


%>

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
     * ����
     */
    function submitSearch() {
        doSubmit('/kikin/shukkinKibouKakuninShow.do');
    }

    /**
     * �X�N���[���𓯊�������
     */
    function onScroll() {
        headRightTbl.scrollLeft = bodyRightTbl.scrollLeft;
        bodyLeftTbl.scrollTop = bodyRightTbl.scrollTop;
    }
    -->
    </script>
    <title>���ʃV�t�g�m�F���</title>

    <link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              <input value="�߂�" type="button" class="smlButton"  onclick="doSubmit('/kikin/hibetsuShiftBack.do')" />
            </td>
            <td id="headCenter">
              ���ʃV�t�g�m�F���
            </td>
            <td id="headRight">
              <input value="���O�A�E�g" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody" style="overflow: hidden;">
        <div style="margin-left:80px;">
          <html:form>
            <div style="height: 20px">
              �\���N���F
              <html:link href="/kikin/hibetsuShiftPage.do?paging=back">�O��</html:link>
              <bean:write name="hibetsuShiftForm" property="yearMonthDayDisp"/>
              <html:link href="/kikin/hibetsuShiftPage.do?paging=next">����</html:link>
            </div>
            <table border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="154px" >
                  <div id="headLeftTbl" style="overflow-x: hidden;overflow-y: hidden;width: 154px;">
                    <table border="1" cellpadding="0" cellspacing="0" class="tblHeader">
                      <tr>
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        ����
                        </td>
                      </tr>
                    </table>
                  </div>
                </td>
                <td width="100%" valign="top">
                  <div id="headRightTbl" style="overflow-y: scroll;overflow-x: hidden;width: <%=bodyRightDivWidth%>px; ">
                    <table border="1" cellpadding="0" cellspacing="0" class="tblHeader">
                      <tr>
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                            <bean:write name="hibetsuShiftBean" property="shainName"/><br>
                          </td>
                        </logic:iterate>
                      </tr>
                    </table>
                  </div>
                </td>
              </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0">
              <tr height="100%">
                <td valign="top">
                  <div id="bodyLeftTbl" style="overflow-x: auto;overflow-y: hidden;width: 154px;height:<%=bodyLeftDivHeight %>px; ">
                    <table border="1" cellpadding="0" cellspacing="0" class="tblBody">
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �O�O�F�O�O&#xFF5E;�O�P�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �O�P�F�O�O&#xFF5E;�O�Q�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �O�Q�F�O�O&#xFF5E;�O�R�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �O�R�F�O�O&#xFF5E;�O<%=tdWidth %>�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �O�S�F�O�O&#xFF5E;�O�T�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �O�T�F�O�O&#xFF5E;�O�U�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �O�U�F�O�O&#xFF5E;�O�V�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �O�V�F�O�O&#xFF5E;�O�W�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �O�W�F�O�O&#xFF5E;�O�X�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �O�X�F�O�O&#xFF5E;�P�O�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �P�O�F�O�O&#xFF5E;�P�P�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �P�P�F�O�O&#xFF5E;�P�Q�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �P�Q�F�O�O&#xFF5E;�P�R�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �P�R�F�O�O&#xFF5E;�P�S�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �P�S�F�O�O&#xFF5E;�P�T�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �P�T�F�O�O&#xFF5E;�P�U�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �P�U�F�O�O&#xFF5E;�P�V�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �P�V�F�O�O&#xFF5E;�P�W�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �P�W�F�O�O&#xFF5E;�P�X�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �P�X�F�O�O&#xFF5E;�Q�O�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �Q�O�F�O�O&#xFF5E;�Q�P�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �Q�P�F�O�O&#xFF5E;�Q�Q�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �Q�Q�F�O�O&#xFF5E;�Q�R�F�O�O
                        </td>
                      </tr>
                      <tr height="<%=trHeight %>px">
                        <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                        �Q�R�F�O�O&#xFF5E;�Q�S�F�O�O
                        </td>
                      </tr>
                    </table>
                  </div>
                </td>
                <td width="100%" valign="top">
                  <div id="bodyRightTbl"  style="overflow-x: auto;overflow-y: auto;width: <%=bodyRightDivWidth %>px;height:<%=bodyRightDivHeight %>px;" onScroll="onScroll();">
                    <table border="1" cellpadding="0" cellspacing="0" class="tblBody">
                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime00">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime00" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime00" >

                                <bean:write name="hibetsuShiftBean" property="strTime00"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime00">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime00">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime00" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime00" >
                                <bean:write name="hibetsuShiftBean" property="strTime00"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime01">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime01" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime01" >

                                <bean:write name="hibetsuShiftBean" property="strTime01"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime01">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime01">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime01" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime01" >
                                <bean:write name="hibetsuShiftBean" property="strTime01"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime02">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime02" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime02" >

                                <bean:write name="hibetsuShiftBean" property="strTime02"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime02">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime02">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime02" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime02" >
                                <bean:write name="hibetsuShiftBean" property="strTime02"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime03">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime03" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime03" >

                                <bean:write name="hibetsuShiftBean" property="strTime03"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime03">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime03">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime03" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime03" >
                                <bean:write name="hibetsuShiftBean" property="strTime03"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime04">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime04" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime04" >

                                <bean:write name="hibetsuShiftBean" property="strTime04"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime04">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime04">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime04" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime04" >
                                <bean:write name="hibetsuShiftBean" property="strTime04"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime05">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime05" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime05" >

                                <bean:write name="hibetsuShiftBean" property="strTime05"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime05">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime05">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime05" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime05" >
                                <bean:write name="hibetsuShiftBean" property="strTime05"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime06">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime06" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime06" >

                                <bean:write name="hibetsuShiftBean" property="strTime06"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime06">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime06">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime06" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime06" >
                                <bean:write name="hibetsuShiftBean" property="strTime06"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime07">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime07" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime07" >

                                <bean:write name="hibetsuShiftBean" property="strTime07"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime07">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime07">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime07" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime07" >
                                <bean:write name="hibetsuShiftBean" property="strTime07"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime08">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime08" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime08" >

                                <bean:write name="hibetsuShiftBean" property="strTime08"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime08">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime08">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime08" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime08" >
                                <bean:write name="hibetsuShiftBean" property="strTime08"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime09">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime09" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime09" >

                                <bean:write name="hibetsuShiftBean" property="strTime09"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime09">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime09">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime09" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime09" >
                                <bean:write name="hibetsuShiftBean" property="strTime09"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime10">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime10" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime10" >

                                <bean:write name="hibetsuShiftBean" property="strTime10"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime10">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime10">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime10" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime10" >
                                <bean:write name="hibetsuShiftBean" property="strTime10"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime11">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime11" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime11" >

                                <bean:write name="hibetsuShiftBean" property="strTime11"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime11">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime11">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime11" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime11" >
                                <bean:write name="hibetsuShiftBean" property="strTime11"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime12">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime12" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime12" >

                                <bean:write name="hibetsuShiftBean" property="strTime12"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime12">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime12">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime12" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime12" >
                                <bean:write name="hibetsuShiftBean" property="strTime12"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime13">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime13" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime13" >

                                <bean:write name="hibetsuShiftBean" property="strTime13"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime13">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime13">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime13" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime13" >
                                <bean:write name="hibetsuShiftBean" property="strTime13"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime14">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime14" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime14" >

                                <bean:write name="hibetsuShiftBean" property="strTime14"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime14">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime14">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime14" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime14" >
                                <bean:write name="hibetsuShiftBean" property="strTime14"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime15">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime15" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime15" >

                                <bean:write name="hibetsuShiftBean" property="strTime15"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime15">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime15">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime15" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime15" >
                                <bean:write name="hibetsuShiftBean" property="strTime15"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime16">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime16" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime16" >

                                <bean:write name="hibetsuShiftBean" property="strTime16"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime16">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime16">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime16" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime16" >
                                <bean:write name="hibetsuShiftBean" property="strTime16"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime17">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime17" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime17" >

                                <bean:write name="hibetsuShiftBean" property="strTime17"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime17">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime17">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime17" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime17" >
                                <bean:write name="hibetsuShiftBean" property="strTime17"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime18">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime18" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime18" >

                                <bean:write name="hibetsuShiftBean" property="strTime18"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime18">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime18">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime18" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime18" >
                                <bean:write name="hibetsuShiftBean" property="strTime18"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime19">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime19" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime19" >

                                <bean:write name="hibetsuShiftBean" property="strTime19"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime19">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime19">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime19" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime19" >
                                <bean:write name="hibetsuShiftBean" property="strTime19"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime20">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime20" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime20" >

                                <bean:write name="hibetsuShiftBean" property="strTime20"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime20">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime20">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime20" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime20" >
                                <bean:write name="hibetsuShiftBean" property="strTime20"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime21">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime21" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime21" >

                                <bean:write name="hibetsuShiftBean" property="strTime21"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime21">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime21">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime21" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime21" >
                                <bean:write name="hibetsuShiftBean" property="strTime21"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime22">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime22" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime22" >

                                <bean:write name="hibetsuShiftBean" property="strTime22"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime22">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime22">
                          <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime22" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime22" >
                                <bean:write name="hibetsuShiftBean" property="strTime22"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>

                      <tr height="<%=trHeight %>px">
                        <logic:iterate id="hibetsuShiftBean" name="hibetsuShiftForm" property="hibetsuShiftBeanList">
                          <logic:equal value="true" name="hibetsuShiftBean" property="boolTime23">
                          <% // �o�Η\��̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center" bgcolor="LightPink">
                              <logic:empty name="hibetsuShiftBean" property="strTime23" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime23" >

                                <bean:write name="hibetsuShiftBean" property="strTime23"/>�F

                                <logic:equal value="�o��" name="hibetsuShiftBean" property="strTime23">
                                  <bean:write name="hibetsuShiftBean" property="startTime"/>
                                  &#xFF5E;
                                  <bean:write name="hibetsuShiftBean" property="endTime"/>
                                  <br><bean:write name="hibetsuShiftBean" property="breakTime"/>
                                </logic:equal>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                          <logic:equal value="false" name="hibetsuShiftBean" property="boolTime23">
                            <% // �o�Η\��O�̎��ԑ� %>
                            <td width="<%=tdWidth %>px" nowrap="nowrap" align="center">
                              <logic:empty name="hibetsuShiftBean" property="strTime23" >
                                <br>
                              </logic:empty>
                              <logic:notEmpty name="hibetsuShiftBean" property="strTime23" >
                                <bean:write name="hibetsuShiftBean" property="strTime23"/>
                              </logic:notEmpty>
                            </td>
                          </logic:equal>
                        </logic:iterate>
                      </tr>
                    </table>
                  </div>
                </td>
              </tr>
            </table>
          </html:form>
        </div>
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
              �@
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>