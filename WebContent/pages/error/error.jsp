<!-- error.jsp -->
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS" isErrorPage="true"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import="business.logic.utils.CommonUtils" %>
<html>
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
<script type="text/javascript" src="/kikin/pages/js/common.js"></script>
<title>�G���[</title>
<link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="errorHeader">
    <table>
      <tr>
          <td id="headLeft">
          <td id="headCenter">
            �G���[���
          </td>
          <td id="headRight">
            <input value="���O�A�E�g" type="button" class="smlButton"  onclick="logout()" />
          </td>
      </tr>
    </table>
</div>
<div id="errorGymBody">
  <html:form>
    <div align="center">
    <%
      out.println("��O����JSP�v���O����");
      // �������� exception ��\������B
      out.println("<BR><BR>" + CommonUtils.HTMLEscape(exception.toString()) + "<BR><BR>");

      // �g���[�X��\������B
      for (StackTraceElement element : exception.getStackTrace()) {
          out.println(element + "<BR>");
      }
    %>
    </div>
  </html:form>
</div>
<div id="errorFooter"></div>
</body>

</html>