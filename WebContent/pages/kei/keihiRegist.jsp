<!-- keihiRegist.jsp -->
<%
/**
 * ファイル名：keihiRegist.jsp
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
    <script type="text/javascript" language="Javascript1.1">
    <!--

    /**
     * チェックボックスがチェックされたら true、されていなければ false
     * param index 対象行番号
     */
    function checkDeleteFlg(index) {
      var isCheck = document.forms[0].elements.deleteShainId[index].checked;

      document.forms[0].elements.deleteFlg[index].value = isCheck;
    }

    /**
     * 新規登録画面へ
     */
    function keihiRegist() {



        // サブミット
        doSubmit('/kikin/keihiRegist.do');
    }

    -->
    </script>
    <title>社員マスタメンテナンス画面</title>

    <link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              <input value="戻る" type="button" class="smlButton"  onclick="doSubmit('/kikin/keihiRegistBack.do')" />
            </td>
            <td id="headCenter">
              経費精算（新規登録）
            </td>
            <td id="headRight">
              <input value="ログアウト" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody">
        <html:form action="/keihiRegist" >
           <%-- "margin-left:300px" → "margin-left:auto; margin-right: auto"に修正。(明細行も)
           	    明細行の項目幅の調整でwidthを1調整。
          		2024/02/28 中川
           --%>
          <div style="width: 650px;text-align: left; margin-left:auto; margin-right: auto;">
            <table class="tblHeader" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td width="100px" align="center">
                  利用日
                </td>
                <td width="150px" align="center">
                  利用対象
                </td>
                <td width="200px" align="center">
                  利用目的
                </td>
                <td width="200px" align="center">
                  利用金額
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto; height: 440px; width: 650px; margin-left:auto; margin-right: auto; ">
            <table class="tblBody" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td style="display: none;">
                  <input type="text" name="shainId" value="<%= String.valueOf(request.getAttribute("shainId")) %>" />
                </td>
                <td width="101px" align="center">
                  <input type="date" name="date" >
                </td>
                <td width="151px"  align="center">
                  <html:text property="password"  value="" size="10" />
                </td>
                <td width="199px"  align="center">
                  <html:text property="shainName" value="" size="20" />
                </td>
                <td width="199px"  align="center">
                  <html:text property="shainNameKana" value="" size="20" />
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
              　
            </td>
            <td id="footCenter">
              　
            </td>
            <td id="footRight">
              <input value="登録" type="button" class="smlButton"  onclick="keihiRegist()" />
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>