<!-- shainMstMnt.jsp -->
<%
/**
 * ファイル名：shainMstMnt.jsp
 *
 * 変更履歴
 * 1.0  2010/09/13 Kazuya.Naraki
 */
%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@page import="business.logic.utils.CheckUtils"%>
<%@page import="form.kei.KeihiForm"%>
<%@page import="java.util.List"%>
<%@page import="form.mst.ShainMstMntBean"%>
<%@page contentType="text/html; charset=Shift_JIS" pageEncoding="Shift_JIS"%>
<%@ page import="constant.RequestSessionNameConstant"%>
<%@ page import="constant.CommonConstant"%>

<bean:size id="keihiBeanListSize" name="keihiForm" property="keihiBeanList"/>
<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
    <script type="text/javascript" src="/kikin/pages/js/common.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/checkCommon.js"></script>
    <script type="text/javascript" src="/kikin/pages/js/message.js"></script>
    

    
    <script type="text/javascript" language="Javascript1.1">
    
    /**
     * チェックボックスがチェックされたら true、されていなければ false
     * param index 対象行番号
     */
    function checkDeleteFlg(index) {
        var deleteShainId = document.forms[0].elements.deleteShainId;
        var isCheck = false;

        if (deleteShainId.length > 1) {
            isCheck = document.forms[0].elements.deleteShainId[index].checked;
        } else {
            isCheck = deleteShainId.checked;
        }

        document.forms[0].elements.namedItem('keihiBeanList['+ index +'].deleteFlg').value = isCheck;
    }

    /**
     * 新規登録画面へ
     */
    function shainMstMntRegistInit() {
        document.forms[0].action = "/kikin/keihiRegistInit.do";
        document.forms[0].submit();	
    }

    /**
     * 更新処理を行う
     */
    function shainMstMntUpdate() {
        // 一覧のサイズ


        document.forms[0].submit();
    }

 
    </script>

    <title>経費精算申請画面</title>

    <link href="/kikin/pages/css/common.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="wrapper">
      <div id="header">
        <table>
          <tr>
            <td id="headLeft">
              <input value="戻る" type="button" class="smlButton"  onclick="doSubmit('/kikin/shainMstMntBack.do')" />
            </td>
            <td id="headCenter">
              経費精算申請
            </td>
            <td id="headRight">
              <input value="ログアウト" type="button" class="smlButton"  onclick="logout()" />
            </td>
          </tr>
        </table>
      </div>
      <div id="gymBody">
        <html:form action="/keihiUpdate">
        
        <!--障害表012　2024/02/29　古川　修正-->
          <div style="overflow-x: auto;overflow-y: hidden; width: 1088px;margin-left:100px">
            <table class="tblHeader" border="1"   cellpadding="0" cellspacing="0">
              <tr>
                <td width="200px" align="center">
                  社員ＩＤ
                </td>
                <td width="100px" align="center">
                  利用日
                </td>
                <td width="200px" align="center">
                  利用対象
                </td>
                <td width="200px" align="center">
                  利用目的
                </td>
                <td width="200px" align="center">
                  利用金額
                </td>
                <td width="100px" align="center">
                  申請
                </td>
              </tr>
            </table>
          </div>
          <div style="overflow: auto; height:440px; width:1030px; margin-left:100px ">
            <table class="tblBody" border="1"  cellpadding="0" cellspacing="0" >
              <logic:iterate indexId="idx" id="keihiBeanList" name="keihiForm"  property="keihiBeanList">
                <bean:define id="shainId" name= "keihiBeanList" property="shainId" type="java.lang.String"/>
                <bean:define id="selectKengenId" name= "keihiBeanList" property="kengenId" type="java.lang.String"/>
                <logic:equal name="keihiBeanList" property="shainId" value='<%= String.valueOf(request.getAttribute("sId")) %>'>
                <tr>
                  <td width="200px"  align="center">
                    <bean:write property="shainId" name="keihiBeanList"/>
                    <html:hidden property="shainId" name="keihiBeanList" indexed="true"/>
                  </td>
                  <td width="100px"  align="center">
                    <html:text property="kengenId" name="keihiBeanList" size="10" maxlength="10" indexed="true" />
                  </td>
                  <td width="200px"  align="center">
                    <html:text property="password" name="keihiBeanList"  size="10" maxlength="6" indexed="true" />
                  </td>
                  <td width="200px"  align="center">
                    <html:text property="shainName" name="keihiBeanList" size="20" maxlength="10" indexed="true" />
                  </td>
                  <td width="200px"  align="center">
                    <html:text property="shainNameKana" name="keihiBeanList"  size="20" maxlength="10" indexed="true" />
                  </td>
                  <td width="100px"  align="center">
                    <html:checkbox property="deleteShainId" name="keihiBeanList" value="<%= shainId %>" onchange='<%="checkDeleteFlg(" + idx + ")" %>' ></html:checkbox>
                    <html:hidden property="deleteFlg" name="keihiBeanList" value="false" indexed="true"/>
                  </td>
                </tr>
                </logic:equal>
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
              <input value="新規登録" type="button" class="smlButton"  onclick="shainMstMntRegistInit()" />
              <input value="更新" type="button" class="smlButton"  onclick="shainMstMntUpdate()" />
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>