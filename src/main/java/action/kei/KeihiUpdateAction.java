/**
 * ファイル名：ShainMstMntUpdateAction.java
 *
 * 変更履歴
 * 1.0  2010/09/04 Kazuya.Naraki
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
 * 説明：社員マスタメンテナンス更新系アクションクラス
 * @author naraki
 *
 */
public class KeihiUpdateAction extends Action{

    // ログ出力クラス
    private Log log = LogFactory.getLog(this.getClass());

    /**
     * 社員マスタメンテナンス更新系アクションクラス
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
        KeihiForm KeihiForm = (KeihiForm) form;

        // リクエスト内容をDtoに変換する
        List<KeihiDto> keihiDtoList = this.formToDto(KeihiForm);

        // ロジック生成
        KeihiLogic KeihiLogic = new KeihiLogic();

        // 権限セレクトボックスの取得
        ComboListUtilLogic comboListUtils = new ComboListUtilLogic();
        Map<String, String> comboMap = comboListUtils.getCombo(BunruiId.KENGEN.getBunruiId(), Mbunrui.HYOUJI1.getName(), false);

        // 取得したセレクトボックスのマップをフォームへセットする。
        KeihiForm.setKengenCmbMap(comboMap);

        // 更新・削除処理
        KeihiLogic.sinseiMshain(keihiDtoList, loginUserDto);

        // 社員情報を再検索する
        keihiDtoList = KeihiLogic.getShainData(loginUserDto);

        if (CheckUtils.isEmpty(keihiDtoList)) {
            // データなし
            forward = CommonConstant.NODATA;
        } else {
            // フォームへ一覧をセットする
        }

        return mapping.findForward(forward);
    }

    /**
     * リクエスト情報をDtoのリストにセットする。
     * @param KeihiForm 社員マスタフォーム
     * @return 社員マスタDtoリスト
     * @author naraki
     */
    private List<KeihiDto> formToDto(KeihiForm KeihiForm) {
        List<KeihiDto> msinDtoList = new ArrayList<KeihiDto>();
        List<KeihiBean> KeihiBeanList = KeihiForm.getKeihiBeanList();

        // 画面一覧のサイズ分処理を繰り返す
        for (KeihiBean KeihiBean : KeihiBeanList) {
            KeihiDto KeihiDto = new KeihiDto();

            // Dtoに値をセットする
            KeihiDto.setShainId(KeihiBean.getShainId());
            KeihiDto.setPassword(KeihiBean.getPassword());
            KeihiDto.setShainName(KeihiBean.getShainName());
            KeihiDto.setShainNameKana(KeihiBean.getShainNameKana());
            KeihiDto.setKengenId(KeihiBean.getKengenId());
            KeihiDto.setDeleteFlg(KeihiBean.getDeleteFlg());

            msinDtoList.add(KeihiDto);
        }

        return msinDtoList;
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
