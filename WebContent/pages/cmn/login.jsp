<!-- login.jsp -->
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html>
<head>

<!--  デザインいじり 2024/3/8 古川-->
	<link rel = "stylesheet" href = "css/common.css">

 <meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="/kikin/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/message.js"></script>
	<html:javascript formName="loginForm" />
	<title>ログイン画面Login</title>
	<link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="src1"></div>



 <%
  if(session.getAttribute("error") != null){
  %>
  <script type="text/javascript">
  	var msg = getMessageCodeOnly('E-MSG-000002');
    alert(msg);
  </script>
  <%
  session.setAttribute("error", null);}%>
        <div id="wrapper">
        <div id="header">
            <table>
              <tr>
                  <td id="headLeft">
                    　
                  </td>
                  <td id="headCenter">
                    ログイン
                  </td>
                  <td id="headRight">
                    　
                  </td>
              </tr>
            </table>
        </div>


		<div id="gymBody">
		  <div align="center">
		    <div>ID・パスワードを入力してください。	</div>
		    <html:form action="/login" onsubmit="return validateLoginForm(this)">
		      <html:text property="shainId" size="16" />
		      <br/>
		      <html:password property="password" size="16" redisplay="false" />
		      <br/>
		      <br/>
		      <html:submit property="submit" value="送信" />
		      <html:reset value="リセット" />
		    </html:form>
		  </div>
		</div>
	    <div id="footer">
	        <table>
	          <tr>
	              <td id="footLeft">
	                　
	              </td>
	              <td id="footCenter">
	                　
	              </td>
	              <td id="footRight">
	                　
	              </td>
	          </tr>
	        </table>
	    </div>

		</div>
		</body>
</html>