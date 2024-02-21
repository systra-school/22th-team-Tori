<!-- kihonShiftMstMnt.jsp -->
<%@page import="constant.CommonConstant.DayOfWeek"%>
<%
/**
* �t�@�C�����FkihonShiftMstMnt.jsp
*
* �ύX����
* 1.0  2010/11/13 �V�K�쐬 �����F���Y
*/
%>
<%@ page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<% String color = ""; %>
<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <script type="text/javascript" src="/kikin/pages/js/common.js">
    </script>
    <script type="text/javascript" src="/kikin/pages/js/checkCommon.js">
    </script>
    <script type="text/javascript" src="/kikin/pages/js/message.js">
    </script>
    <script type="text/javascript" language="Javascript1.1">
    /**
     * �o�^��
     */
    function regist() {
        // �T�u�~�b�g
        doSubmit('/kikin/kihonShiftRegist.do');
    }
    </script>

    <title>
    ��{�V�t�g�o�^
    </title>
    <link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              <input value="�߂�" type="button" class="smlButton"  onclick="doSubmit('/kikin/kihonShiftBack.do')" />
            </td>
            <td id="headCenter">
              ��{�V�t�g�o�^
            </td>
            <td id="headRight">
              <input value="���O�A�E�g" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody">
        <html:form action="/kihonShiftRegist" >
          <%-- �}�� --%>
          <div id="hanrei" style="width:476px; margin-left:80px; float:left">
            <div>
              <table class="tblHeader" border="1" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="100px" align="center">
                    �V�t�g��
                  </td>
                  <td width="150px" align="center">
                    �V���{��
                  </td>
                  <td width="150px" align="center">
                    ����
                  </td>
                  <td width="50px" align="center">
                    �x�e
                  </td>
                </tr>
              </table>
            </div>
            <div style="height:450px;overflow:auto">
              <table class="tblBody" border="1" cellpadding="0" cellspacing="0">
                <logic:iterate id="kihonShiftHanreiBeanList" name="kihonShiftMstMntForm"  property="kihonShiftHanreiBeanList" indexId="idx">
                  <tr>
                    <td width="100px" align="center">
                      <bean:write property="shiftName" name="kihonShiftHanreiBeanList"/>
                    </td>
                    <td width="150px" align="center">
                      <bean:write property="symbol" name="kihonShiftHanreiBeanList"/>
                    </td>
                    <td width="150px" align="center">
                      <bean:write property="timeZone" name="kihonShiftHanreiBeanList" filter="false"/>
                    </td>
                    <td width="50px" align="center">
                      <bean:write property="kyukei" name="kihonShiftHanreiBeanList"/>
                    </td>
                  </tr>
                </logic:iterate>
              </table>
            </div>
          </div>
          <div id="data" style="width:614px; margin-left:20px; float:left">
            <div>
              <table class="tblHeader" border="1" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="230px" align="center">
                    �Ј���
                  </td>
                  <td width="50px" align="center">
                    ��
                  </td>
                  <td width="50px" align="center">
                    ��
                  </td>
                  <td width="50px" align="center">
                    ��
                  </td>
                  <td width="50px" align="center">
                    ��
                  </td>
                  <td width="50px" align="center">
                    ��
                  </td>
                  <td width="50px" align="center">
                    �y
                  </td>
                  <td width="50px" align="center">
                    ��
                  </td>
                </tr>
              </table>
            </div>
            <div style="height:450px;overflow:auto">
              <table class="tblBody" border="1" cellpadding="0" cellspacing="0">
                <logic:iterate id="kihonShiftMstMntBeanList" name="kihonShiftMstMntForm" property="kihonShiftMstMntBeanList" indexId="idx">
                  <tr>
                    <html:hidden name="kihonShiftMstMntBeanList" property="shainId" />
                    <td width="230px" align="center">
                      <bean:write property="shainName" name="kihonShiftMstMntBeanList"/>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnMonday" name="kihonShiftMstMntBeanList" indexed="true">
                      <html:optionsCollection name="kihonShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnTuesday" name="kihonShiftMstMntBeanList" indexed="true">
                      <html:optionsCollection name="kihonShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnWednesday" name="kihonShiftMstMntBeanList" indexed="true">
                      <html:optionsCollection name="kihonShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnThursday" name="kihonShiftMstMntBeanList" indexed="true">
                      <html:optionsCollection name="kihonShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnFriday" name="kihonShiftMstMntBeanList" indexed="true">
                      <html:optionsCollection name="kihonShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnSaturday" name="kihonShiftMstMntBeanList" indexed="true">
                      <html:optionsCollection name="kihonShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                    <td width="50px" align="center">
                      <html:select property="shiftIdOnSunday" name="kihonShiftMstMntBeanList" indexed="true">
                      <html:optionsCollection name="kihonShiftMstMntForm" property="shiftCmbMap" value="key" label="value"/>
                      </html:select>
                    </td>
                  </tr>
                </logic:iterate>
              </table>
            </div>
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
              <input value="�o�^"  type="button" class="smlButton"  onclick="regist()" />
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>
