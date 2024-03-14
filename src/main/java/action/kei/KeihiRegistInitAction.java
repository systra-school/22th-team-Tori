/**
 * ファイル名：ShainMstMntRegistInitAction.java
 *
 * 変更履歴
 * 1.0  2010/09/04 Kazuya.Naraki
 */
package action.kei;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.dto.LoginUserDto;
import constant.CommonConstant;
import constant.RequestSessionNameConstant;

/**
 * 説明：社員マスタメンテナンス登録初期表示アクションクラス
 * @author naraki
 *
 */
public class KeihiRegistInitAction extends Action{

    // ログ出力クラス
    private Log log = LogFactory.getLog(this.getClass());
    

    /**
     * 社員マスタメンテナンス登録初期表示アクションクラス
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
        
        HttpSession session = req.getSession();

        LoginUserDto loginUserDto = (LoginUserDto) session.getAttribute(RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO);
        String shainId = loginUserDto.getShainId();
        req.setAttribute("shainId", shainId);
        
        List<String> dayList = new ArrayList<>();

        for (int day = 1; day <= 31; day++) {
            dayList.add(String.format("%04d%02d%02d", 2024, 3, day)); // 2024年3月の日付を追加
        }
        req.setAttribute("dayList", dayList);

        // フォワードキー
        String forward = CommonConstant.SUCCESS;

        return mapping.findForward(forward);
    }


}
