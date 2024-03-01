/**
 * ファイル名：ShukkinKibouNyuuryokuPageAction.java
 *
 * 変更履歴
 * 1.0  2010/09/04 Kazuya.Naraki
 */
package action.shk;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import constant.CommonConstant;
import form.shk.ShukkinKibouNyuuryokuBean;
import form.shk.ShukkinKibouNyuuryokuForm;

public class ShukkinKibouNyuuryokuPageAction extends ShukkinKibouAbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		log.info(new Throwable().getStackTrace()[0].getMethodName());

        // フォワードキー
        String forward = CommonConstant.SUCCESS;

        // フォーム
        ShukkinKibouNyuuryokuForm shukkinKibouNyuuryokuForm = (ShukkinKibouNyuuryokuForm) form;

        // 登録フラグ初期化
        List<ShukkinKibouNyuuryokuBean> shukkinKibouBeanList = shukkinKibouNyuuryokuForm.getShukkinKibouNyuuryokuBeanList();
        for (ShukkinKibouNyuuryokuBean shukkinKibouBean : shukkinKibouBeanList) {
        	shukkinKibouBean.setRegistFlg(false);
        }

		return mapping.findForward(forward);
	}
}