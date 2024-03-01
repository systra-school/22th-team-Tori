/**
 * ファイル名：ShukkinKibouNyuuryokuSearchAction.java
 *
 * 変更履歴
 * 1.0  2010/09/04 Kazuya.Naraki
 */
package action.shk;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.dto.LoginUserDto;
import business.dto.shk.ShukkinKibouKakuninDto;
import business.logic.comparator.MethodComparator;
import business.logic.shk.ShukkinKibouLogic;
import business.logic.utils.CheckUtils;
import business.logic.utils.ComboListUtilLogic;
import business.logic.utils.CommonUtils;
import constant.CommonConstant;
import constant.RequestSessionNameConstant;
import form.common.DateBean;
import form.shk.ShukkinKibouNyuuryokuBean;
import form.shk.ShukkinKibouNyuuryokuForm;

public class ShukkinKibouNyuuryokuSearchAction extends ShukkinKibouAbstractAction {
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
        ShukkinKibouNyuuryokuForm shukkinKibouNyuuryokuForm = (ShukkinKibouNyuuryokuForm) form;

        // 対象年月
        String yearMonth = shukkinKibouNyuuryokuForm.getYearMonth();

        // ロジック生成
        ShukkinKibouLogic shukkinKibouLogic = new ShukkinKibouLogic();
        
        String shainId = loginUserDto.getShainId();
        req.setAttribute("shainId", shainId);

        // 対象年月の月情報を取得する。
        List<DateBean> dateBeanList = CommonUtils.getDateBeanList(yearMonth);
        
        // セレクトボックスの取得
        ComboListUtilLogic comboListUtils = new ComboListUtilLogic();
        Map<String, String> shiftCmbMap = comboListUtils.getComboShift(true);
        Map<String, String> yearMonthCmbMap = comboListUtils.getComboYearMonth(CommonUtils.getFisicalDay(CommonConstant.yearMonthNoSl), 3, ComboListUtilLogic.KBN_YEARMONTH_NEXT, false);

        // シフトIDを取得する
        List<List<ShukkinKibouKakuninDto>> kakuninDtoListList = shukkinKibouLogic.getShukkinKibouKakuninDtoList(yearMonth);
        List<ShukkinKibouNyuuryokuBean> shukkinKibouNyuuryokuBeanList = new ArrayList<ShukkinKibouNyuuryokuBean>();

        if (CheckUtils.isEmpty(kakuninDtoListList)) {
            // データなし
            ShukkinKibouNyuuryokuBean shukkinKibouNyuuryokuBean = new ShukkinKibouNyuuryokuBean();
            shukkinKibouNyuuryokuBean.setShainId(loginUserDto.getShainId());
            shukkinKibouNyuuryokuBean.setShainName(loginUserDto.getShainName());
            shukkinKibouNyuuryokuBean.setRegistFlg(true);

            shukkinKibouNyuuryokuBeanList.add(shukkinKibouNyuuryokuBean);
        } else {
            // データあり
            shukkinKibouNyuuryokuBeanList = dtoToBean(kakuninDtoListList, loginUserDto);
        }

        // フォームにデータをセットする
        shukkinKibouNyuuryokuForm.setShiftCmbMap(shiftCmbMap);
        shukkinKibouNyuuryokuForm.setYearMonthCmbMap(yearMonthCmbMap);
        shukkinKibouNyuuryokuForm.setShukkinKibouNyuuryokuBeanList(shukkinKibouNyuuryokuBeanList);
        shukkinKibouNyuuryokuForm.setDateBeanList(dateBeanList);
        shukkinKibouNyuuryokuForm.setYearMonth(yearMonth);

        return mapping.findForward(forward);
    }

    /**
     * DtoからBeanへ変換する
     * @param shukkinKibouNyuuryokuDtoMap
     * @param loginUserDto
     * @return 一覧に表示するリスト
     * @author naraki
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     * @throws IllegalArgumentException
     */
    private List<ShukkinKibouNyuuryokuBean> dtoToBean(List<List<ShukkinKibouKakuninDto>> kakuninDtoListList
                                                      , LoginUserDto loginUserDto)
                                                                        throws IllegalArgumentException,
                                                                        IllegalAccessException,
                                                                        InvocationTargetException {
    	    	
        List<ShukkinKibouNyuuryokuBean> shukkinKibouNyuuryokuBeanList = new ArrayList<ShukkinKibouNyuuryokuBean>();

        for (List<ShukkinKibouKakuninDto> kakuninDtoList : kakuninDtoListList) {

            // 実行するオブジェクトの生成
            ShukkinKibouNyuuryokuBean shukkinKibouNyuuryokuBean = new ShukkinKibouNyuuryokuBean();

            // メソッドの取得
            Method[] methods = shukkinKibouNyuuryokuBean.getClass().getMethods();

            // メソッドのソートを行う
            Comparator<Method> asc = new MethodComparator();
            Arrays.sort(methods, asc); // 配列をソート

            int index = 0;
            int listSize = kakuninDtoList.size();

            String shainId = "";
            String shainName = "";

            for (int i = 0; i < methods.length; i++) {
                // "setShiftIdXX" のメソッドを動的に実行する
                if (methods[i].getName().startsWith("setShiftId") && listSize > index) {
                    ShukkinKibouKakuninDto shukkinKibouKakuninDto = kakuninDtoList.get(index);
                    // メソッド実行
                    methods[i].invoke(shukkinKibouNyuuryokuBean, shukkinKibouKakuninDto.getKibouShiftId());
                    
                    shainId = shukkinKibouKakuninDto.getShainId();
                    shainName = shukkinKibouKakuninDto.getShainName();

                    index ++;
                }
            }

            shukkinKibouNyuuryokuBean.setShainId(shainId);
            shukkinKibouNyuuryokuBean.setShainName(shainName);
            shukkinKibouNyuuryokuBean.setRegistFlg(false);

            shukkinKibouNyuuryokuBeanList.add(shukkinKibouNyuuryokuBean);

        }

        return shukkinKibouNyuuryokuBeanList;
    }
}