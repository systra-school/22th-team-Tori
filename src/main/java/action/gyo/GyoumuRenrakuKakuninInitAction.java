/**
 * ファイル名：GyoumuRenrakuKakuninInitAction.java
 */
package action.gyo;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

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
import business.logic.utils.CheckUtils;
import constant.CommonConstant;
import constant.RequestSessionNameConstant;
import form.gyo.GyoumuRenrakuNyuuryokuKakuninBean;
import form.gyo.GyoumuRenrakuNyuuryokuKakuninForm;
/**
 * 追加機能
 * 説明：業務連絡初期表示アクションクラス
 */
public class GyoumuRenrakuKakuninInitAction extends Action {

    /**
     * 業務連絡初期表示アクションクラス
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

        // セッション
        HttpSession session = req.getSession();
        // ログインユーザ情報をセッションより取得
        LoginUserDto loginUserDto = (LoginUserDto) session.getAttribute(RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO);
        //フォーム
        GyoumuRenrakuNyuuryokuKakuninForm gyoumuRenrakuForm = (GyoumuRenrakuNyuuryokuKakuninForm) form;
        // フォワードキー
        String forward = CommonConstant.SUCCESS;
        //ロジック生成
        GyoumuRenrakuLogic gyoumuRenrakuLogic = new GyoumuRenrakuLogic();
        //業務連絡を取得
        List<GyoumuRenrakuDto> gyoumuRenrakuDtoList = gyoumuRenrakuLogic.getGyoumuRenrakuDtoList();
        List<GyoumuRenrakuNyuuryokuKakuninBean> gyoumuRenrakuBeanList = new ArrayList<GyoumuRenrakuNyuuryokuKakuninBean>();
        
        if (CheckUtils.isEmpty(gyoumuRenrakuDtoList)) {
            forward = CommonConstant.NODATA;
        } else {
        	gyoumuRenrakuBeanList = dtoToBean(gyoumuRenrakuDtoList);
        }
        
        gyoumuRenrakuForm.setGyoumuRenrakuNyuuryokuKakuninList(gyoumuRenrakuBeanList);
        
        return mapping.findForward(forward);
    }
    	
    /**
     * DtoからFormへ変換する
     * @param
     * @return
     * @author naraki
     */
    private List<GyoumuRenrakuNyuuryokuKakuninBean> dtoToBean(List<GyoumuRenrakuDto> gyoumuRenrakuDtoList)
    																throws IllegalArgumentException,
    																IllegalAccessException,
    																InvocationTargetException {
    	
    	List<GyoumuRenrakuNyuuryokuKakuninBean> gyoumuRenrakuBeanList = new ArrayList<GyoumuRenrakuNyuuryokuKakuninBean>();
    	
    	for(GyoumuRenrakuDto dto : gyoumuRenrakuDtoList) {
    		GyoumuRenrakuNyuuryokuKakuninBean gyoumuRenrakuBean = new GyoumuRenrakuNyuuryokuKakuninBean();
    		gyoumuRenrakuBean.setShainId(dto.getShainId());
    		gyoumuRenrakuBean.setShainName(dto.getShainName());
    		gyoumuRenrakuBean.setYearMonth(dto.getYearMonth());
    		gyoumuRenrakuBean.setTitle(dto.getTitle());
    		gyoumuRenrakuBean.setMemo(dto.getMemo());
    		gyoumuRenrakuBeanList.add(gyoumuRenrakuBean);
    	}
    	
    	return gyoumuRenrakuBeanList;
    }
    
}
