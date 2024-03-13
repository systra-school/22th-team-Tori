<!-- gyoumuRenraku.jsp -->
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.gyo.GyoumuRenrakuNyuuryokuKakuninBean"%>
<%@page import="java.util.List"%>
<%@page import="form.gyo.GyoumuRenrakuNyuuryokuKakuninForm"%>
<%
/**
 * ファイル名：gyoumuRenraku.jsp
 *
 * 変更履歴
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

    <title>業務連絡確認画面</title>

    <link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              <input value="戻る" type="button" class="smlButton"  onclick="doSubmit('/kikin/gyoumuRenrakuNyuuryokuBack.do')" />
            </td>
            <td id="headCenter">
              業務連絡
            </td>
            <td id="headRight">
              <input value="ログアウト" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody">
         <html:form action="/gyoumuRenrakuKakuninInit">
        	<div style="overflow-x: auto;overflow-y: hidden; width: 1088px;margin-left:100px">
        		<table class="tblHeader" border="1"   cellpadding="0" cellspacing="0">
        		<tr>
                  <td width="110px" align="left">
                  投稿者
                  </td>
                  <td width="110px" align="left">
                  投稿日
                  </td>
                  <td width="200px" align="left">
                  タイトル
                  </td>
                  <td width="600px" align="left">
                  内容
                  </td>
                </tr>
        		</table>
        	</div>
        	<div style="overflow: auto; height:440px; width:1030px; margin-left:100px ">
        		<table class="tblBody" border="1" style="font-size: 14px;" >
        		<logic:iterate indexId="idx" id="gyoumuRenrakuBeanList" name="gyoumuRenrakuNyuuryokuKakuninForm"  property="gyoumuRenrakuNyuuryokuKakuninList">
        		<tr>
                  <td width="105px"  align="left">
                    <bean:write property="shainName" name="gyoumuRenrakuBeanList" />
                  </td>
                  <td width="105px"  align="left">
                    <bean:write property="yearMonth" name="gyoumuRenrakuBeanList" />
                  </td>
                  <td width="200px"  align="left">
                    <bean:write property="title" name="gyoumuRenrakuBeanList" />
                  </td>
                  <td width="600px"  align="left">
                    <bean:write property="memo" name="gyoumuRenrakuBeanList" />
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