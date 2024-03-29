/**
 * ファイル名：ShainMstMntInitAction.java
 *
 * 変更履歴
 * 1.0  2010/08/23 Kazuya.Naraki
 */
package action.kei;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

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
import business.logic.utils.CheckUtils;
import business.logic.utils.ComboListUtilLogic;
import constant.CommonConstant;
import constant.CommonConstant.BunruiId;
import constant.DbConstant.Mbunrui;
import constant.RequestSessionNameConstant;
import form.kei.KeihiBean;
import form.kei.KeihiForm;


/**
 * 説明：社員マスタメンテナンス初期表示アクションクラス
 * @author naraki
 *
 */
public class KeihiKanriAction extends Action {

    // ログ出力クラス
    private Log log = LogFactory.getLog(this.getClass());

    /**
     * 社員マスタメンテナンス初期表示アクションクラス
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

        // セッション
        HttpSession session = req.getSession();

        // ログインユーザ情報をセッションより取得
        LoginUserDto loginUserDto = (LoginUserDto) session.getAttribute(RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO);
        String shainId = loginUserDto.getShainId();
        req.setAttribute("sId", shainId);
        
        // フォーム
        KeihiForm KeihiForm = (KeihiForm) form;

        // フォワードキー
        String forward = CommonConstant.SUCCESS;

        // ロジック生成
        KeihiLogic KeihiLogic = new KeihiLogic();

        // 権限セレクトボックスの取得
        ComboListUtilLogic comboListUtils = new ComboListUtilLogic();
        Map<String, String> comboMap = comboListUtils.getCombo(BunruiId.KENGEN.getBunruiId(), Mbunrui.HYOUJI1.getName(), false);

        // 取得したセレクトボックスのマップをフォームへセットする。
        KeihiForm.setKengenCmbMap(comboMap);

        // 社員情報を取得する
        Collection<KeihiDto> mshainList = KeihiLogic.getShainData2(loginUserDto);

        if (CheckUtils.isEmpty(mshainList)) {
            forward = CommonConstant.NODATA;
        }

        // フォームへ一覧をセットする
        KeihiForm.setKeihiBeanList(dtoToForm(mshainList));

        // 戻り先を保存
        req.setAttribute(RequestSessionNameConstant.REQUEST_BACK_PAGE, "");

        return mapping.findForward(forward);
    }


    /**
     * DtoからFormへ変換する
     * @param
     * @return
     * @author naraki
     */
    private List<KeihiBean> dtoToForm(Collection<KeihiDto> colection) {
        List<KeihiBean> KeihiBeanList = new ArrayList<KeihiBean>();

        for (KeihiDto dto : colection) {
            KeihiBean shain = new KeihiBean();
            shain.setShainId(dto.getShainId());
            shain.setShainName(dto.getShainName());
            shain.setShainNameKana(dto.getShainNameKana());
            shain.setPassword(dto.getPassword());
            shain.setKengenId(dto.getKengenId());
            KeihiBeanList.add(shain);

        }
        return KeihiBeanList;
    }
}
