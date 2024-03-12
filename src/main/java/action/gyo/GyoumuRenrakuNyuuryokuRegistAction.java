/**
 * ファイル名：GyoumuRenrakuNyuuryokuRegistAction.java
 */
package action.gyo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.dto.LoginUserDto;
import business.dto.gyo.GyoumuRenrakuDto;
import business.logic.gyo.GyoumuRenrakuLogic;
import business.logic.utils.CommonUtils;
import constant.CommonConstant;
import constant.RequestSessionNameConstant;
import form.gyo.GyoumuRenrakuNyuuryokuKakuninForm;

/**
 * 追加機能
 * 説明：業務連絡入力アクションクラス
 */
public class GyoumuRenrakuNyuuryokuRegistAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest req, HttpServletResponse res) throws Exception {

        // フォワードキー
        String forward = CommonConstant.SUCCESS;
        // セッション
        HttpSession session = req.getSession();
        // ログインユーザ情報をセッションより取得
        LoginUserDto loginUserDto = (LoginUserDto) session.getAttribute(RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO);
        //フォーム
        GyoumuRenrakuNyuuryokuKakuninForm gyoumuRenrakuForm = (GyoumuRenrakuNyuuryokuKakuninForm) form;
        //今日の年月日を取得
        String yearMonth = CommonUtils.getFisicalDay(CommonConstant.yearMonthDayNoSl);
        gyoumuRenrakuForm.setYearMonth(yearMonth);
        //リクエスト内容をDtoに変換
        GyoumuRenrakuDto gyoumuRenrakuDto = formToDto(gyoumuRenrakuForm);
        //ロジック生成
        GyoumuRenrakuLogic gyoumuRenrakuLogic = new GyoumuRenrakuLogic();
        //登録
        gyoumuRenrakuLogic.registGyoumuRenraku(gyoumuRenrakuDto, loginUserDto);
        
        return mapping.findForward(forward);
	}
	 /**
     * リクエスト情報をDtoのリストにセットする。
     * @param GyoumuRenrakuNyuuryokuKakuninForm 業務連絡登録フォーム
     * @return シフトマスタDtoリスト
     * @author naraki
     */
	private GyoumuRenrakuDto formToDto(GyoumuRenrakuNyuuryokuKakuninForm gyoumuRenrakuForm) {
		
		GyoumuRenrakuDto gyoumuRenrakuDto = new GyoumuRenrakuDto();
		
		String shainId = gyoumuRenrakuForm.getShainId();
		String shainName = gyoumuRenrakuForm.getShainName();
		String yearMonth = gyoumuRenrakuForm.getYearMonth();
		String title = gyoumuRenrakuForm.getTitle();
		String memo = gyoumuRenrakuForm.getMemo();
		
		gyoumuRenrakuDto.setShainId(shainId);
		gyoumuRenrakuDto.setShainName(shainName);
		gyoumuRenrakuDto.setYearMonth(yearMonth);
		gyoumuRenrakuDto.setTitle(title);
		gyoumuRenrakuDto.setMemo(memo);
		
		return gyoumuRenrakuDto;
	}
}
