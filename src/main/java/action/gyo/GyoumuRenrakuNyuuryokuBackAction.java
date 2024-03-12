/**
 * ファイル名：GyoumuRenrakuNyuuryokuBackAction.java
 */
package action.gyo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import constant.CommonConstant;
/**
 * 追加機能
 * 説明：業務連絡入力戻るAction
 */
public class GyoumuRenrakuNyuuryokuBackAction extends Action {
	 // ログ出力クラス
    private Log log = LogFactory.getLog(this.getClass());

    /**
     * 戻る処理のアクション
     *
     * @param mapping アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @return アクションフォワード
     * @author naraki
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest req, HttpServletResponse res) throws Exception {
        log.info(new Throwable().getStackTrace()[0].getMethodName());
        // フォワードキー
        String forward = "";

        forward = CommonConstant.SUCCESS;

        return mapping.findForward(forward);
    }
}
