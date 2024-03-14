/**
 * ファイル名：ShainMstMntRegistAction.java
 *
 * 変更履歴
 * 1.0  2010/09/04 Kazuya.Naraki
 */
package action.kei;


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
import business.dto.kei.KeihiDto;
import business.logic.kei.KeihiLogic;
import constant.CommonConstant;
import constant.RequestSessionNameConstant;
import form.kei.KeihiRegistForm;

/**
 * 説明：社員マスタメンテナンス登録アクションクラス
 * @author naraki
 *
 */
public class KeihiRegistAction extends Action{

    // ログ出力クラス
    private Log log = LogFactory.getLog(this.getClass());

    /**
     * 社員マスタメンテナンス登録アクションクラス
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
        String forward = CommonConstant.SUCCESS;

        // セッション
        HttpSession session = req.getSession();

        // ログインユーザ情報をセッションより取得
        LoginUserDto loginUserDto = (LoginUserDto) session.getAttribute(RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO);

        // フォーム
        KeihiRegistForm KeihiRegistForm = (KeihiRegistForm) form;
        
        String date = req.getParameter("date");
        date = date.replaceAll("-", "");
        
        KeihiRegistForm.setKengenId(date);

        // リクエスト内容をDtoに変換する
        KeihiDto mshainDto = this.formToDto(KeihiRegistForm);

        // ロジック生成
        KeihiLogic KeihiLogic = new KeihiLogic();
        




        // 登録
        KeihiLogic.registMshain(mshainDto, loginUserDto);

        return mapping.findForward(forward);
    }

    /**
     * リクエスト情報をDtoのリストにセットする。
     * @param KeihiRegistForm 社員マスタ登録フォーム
     * @return 社員マスタDtoリスト
     * @author naraki
     */
    private KeihiDto formToDto(KeihiRegistForm KeihiRegistForm) {
        KeihiDto keihiDto = new KeihiDto();
        
       
        
        String password = KeihiRegistForm.getPassword();
        String shainName = KeihiRegistForm.getShainName();
        String shainNameKana = KeihiRegistForm.getShainNameKana();
        String kengenId = KeihiRegistForm.getKengenId();

        // Dtoに値をセットする
        keihiDto.setPassword(password);
        keihiDto.setShainName(shainName);
        keihiDto.setShainNameKana(shainNameKana);
        keihiDto.setKengenId(kengenId);

        return keihiDto;
    }

}
