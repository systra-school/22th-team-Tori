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
    <script>
    function gyoumuRenrakuNyuuryokuRegist() {
    	//タイトル空白メッセージ
    	var titleErr = '';
    	//タイトルエラーメッセージ
    	var titleErrMsg = '';
    	//内容エラーメッセージ
    	var memoErrMsg = '';
    	//エラーメッセージ
    	var errorMsg = '';
    	
    	//タイトルを取得し文字数を取得
    	var title = document.forms[0].elements['title'].value;
    	var titleLen = title.length;
    	//内容を取得し文字数を取得
    	var memo = document.forms[0].elements['memo'].value;
    	var memoLen = memo.length;
    	//背景色のクリア
    	document.forms[0].elements['title'].style.backgroundColor = 'white';
    	document.forms[0].elements['memo'].style.backgroundColor = 'white';
    	
    	if (titleLen === 0) {
    		var strArr = ['タイトル'];
    		titleErr = getMessage('E-MSG-000001', strArr);
    		document.forms[0].elements['title'].style.backgroundColor = 'red';
    	}
    	if (titleLen > 20) {
    		titleErrMsg = getMessageCodeOnly('E-MSG-000006');
    		document.forms[0].elements['title'].style.backgroundColor = 'red';
    	}
    	if (memoLen > 200) {
    		memoErrMsg = getMessageCodeOnly('E-MSG-000007');
    		document.forms[0].elements['memo'].style.backgroundColor = 'red';
    	}
    	
    	errorMsg = titleErr + titleErrMsg + memoErrMsg;
		
		if (errorMsg) {
			alert(errorMsg);
			// エラー
            return false;
		}
		
		document.forms[0].submit();
    }
    </script>

    <title>業務連絡入力画面</title>

    <link href="/kikin/pages/css/gyoumu.css" rel="stylesheet" type="text/css" />
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
              業務連絡入力
            </td>
            <td id="headRight">
              <input value="ログアウト" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody">
        <html:form action="/gyoumuRenrakuNyuuryokuRegist">
          <div style="width: 630px; margin-left:300px;">
            <table class="tblHeader" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td width="180px" align="center">
                  タイトル(20文字)
                </td>
                <td width="180px"  align="center">
                  <html:text property="title" size="43" />
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto; height: 400px; width: 630px; margin-left:300px;">
            <table class="tblBody" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td width="180px" align="center">
                  内容(200文字)
                </td>
                <td width="180px"  align="center">
                  <html:textarea property="memo" rows="10" cols="50" />
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
                <input value="登録" type="button" class="smlButton"  onclick="gyoumuRenrakuNyuuryokuRegist()" />
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>