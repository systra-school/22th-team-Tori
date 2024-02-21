<!-- menu.jsp -->
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
    <html:javascript formName="loginForm" />
    <script type="text/javascript" src="/kikin/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/message.js"></script>

    <title>���j���[���</title>
    <link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              �@
            </td>
            <td id="headCenter">
            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="kengenId"
                         value="<%=CommonConstant.Kengen.KANRISYA.getId() %>">
                ���j���[(�Ǘ���)
            </logic:equal>

            <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                         property="kengenId"
                         value="<%=CommonConstant.Kengen.IPPAN.getId() %>">
                ���j���[(���)
            </logic:equal>
            </td>
            <td id="headRight">
              <input value="���O�A�E�g" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody">
        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="kengenId"
                     value="<%=CommonConstant.Kengen.KANRISYA.getId() %>">
          <div class="menuBlock">
            <html:form action="/tsukibetsuShiftKakuninInit">
              <input type="submit" value="���ʃV�t�g�m�F" class="bigButton" />
            </html:form>
            <html:form action="/hibetsuShiftInit">
              <input type="submit" value="���ʃV�t�g�m�F" class="bigButton" />
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/kinmuJissekiKakuninInit">
              <input type="submit" value="�Ζ����ъm�F" class="bigButton" />
            </html:form>
            <html:form action="/kinmuJissekiNyuryokuKakuninInit">
              <input type="submit" value="�Ζ����ѓ���" class="bigButton" />
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/shukkinKibouKakuninInit">
              <input type="submit" value="�o�Ί�]���m�F" class="bigButton" />
            </html:form>
            <html:form action="/tsukibetsuShiftNyuuryokuInit">
              <input type="submit" value="���ʃV�t�g����" class="bigButton" />
            </html:form>
          </div>


          <div class="menuBlock">
            <html:form action="/shainMstMnt">
              <input type="submit" value="�Ј��}�X�^�����e�i���X" class="bigButton" />
            </html:form>
            <html:form action="/shiftMstMnt">
              <input type="submit" value="�V�t�g�}�X�^�����e�i���X" class="bigButton" />
            </html:form>
            <html:form action="/kihonShiftInit">
              <input type="submit" value="��{�V�t�g�o�^" class="bigButton" />
            </html:form>
          </div>

        </logic:equal>

        <logic:equal name="<%=RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO %>"
                     property="kengenId"
                     value="<%=CommonConstant.Kengen.IPPAN.getId() %>">
          <div class="menuBlock">
            <html:form action="/tsukibetsuShiftKakuninInit">
              <input type="submit" value="���ʃV�t�g�m�F" class="bigButton" />
            </html:form>
            <html:form action="/hibetsuShiftInit">
              <input type="submit" value="���ʃV�t�g�m�F" class="bigButton" />
            </html:form>
          </div>
          <div class="menuBlock">
            <html:form action="/kinmuJissekiNyuryokuKakuninInit">
              <input type="submit" value="�Ζ����ѓ���" class="bigButton" />
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/login">
              <input type="submit" value="��]�o�Γ�����" class="bigButton" />
            </html:form>
          </div>

          <div class="menuBlock">
            <html:form action="/kihonShiftKakuninInit">
              <input type="submit" value="��{�V�t�g�m�F" class="bigButton" />
            </html:form>
          </div>

        </logic:equal>
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