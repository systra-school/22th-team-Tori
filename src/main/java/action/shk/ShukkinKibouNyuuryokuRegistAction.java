/**
 * ファイル名：TsukibetsuShiftNyuuryokuRegistAction.java
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
import business.dto.shk.ShukkinKibouNyuuryokuDto;
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

/**
 * 説明：出勤希望入力登録アクションクラス
 * @author naraki
 */
public class ShukkinKibouNyuuryokuRegistAction extends ShukkinKibouAbstractAction {
	/**
     * 説明：出勤希望入力登録アクションクラス
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
        ShukkinKibouNyuuryokuForm shukkinKibouNyuuryokuForm = (ShukkinKibouNyuuryokuForm) form;

        // 画面のリスト情報
        List<ShukkinKibouNyuuryokuBean> shukkinKibouNyuuryokuBeanList = shukkinKibouNyuuryokuForm.getShukkinKibouNyuuryokuBeanList();

        // 対象年月
        String yearMonth = CommonUtils.getFisicalDay(CommonConstant.yearMonthNoSl);

        // ロジック生成
        ShukkinKibouLogic shukkinKibouLogic = new ShukkinKibouLogic();
        
        String shainId = loginUserDto.getShainId();
        req.setAttribute("shainId", shainId);

        // 対象年月の月情報を取得する。
        List<DateBean> dateBeanList = CommonUtils.getDateBeanList(yearMonth);

        // フォームデータをDtoに変換する
        List<List<ShukkinKibouNyuuryokuDto>> kibouDtoListList = this.formToDto(shukkinKibouNyuuryokuBeanList, dateBeanList);

        // 登録・更新処理
        shukkinKibouLogic.registKibouShift(kibouDtoListList, loginUserDto);

        // シフトIDを取得する
        List<List<ShukkinKibouKakuninDto>> kakuninDtoListList = shukkinKibouLogic.getShukkinKibouKakuninDtoList(yearMonth);

        // セレクトボックスの取得
        ComboListUtilLogic comboListUtils = new ComboListUtilLogic();
        Map<String, String> shiftCmbMap = comboListUtils.getComboShift(true);
        Map<String, String> yearMonthCmbMap = comboListUtils.getComboYearMonth(CommonUtils.getFisicalDay(CommonConstant.yearMonthNoSl), 3, ComboListUtilLogic.KBN_YEARMONTH_NEXT, false);

        if (CheckUtils.isEmpty(kakuninDtoListList)) {
            // データなし
        	ShukkinKibouNyuuryokuBean shukkinKibouNyuuryokuBean = new ShukkinKibouNyuuryokuBean();
            shukkinKibouNyuuryokuBean.setShainId(loginUserDto.getShainId());
            shukkinKibouNyuuryokuBean.setShainName(loginUserDto.getShainName());
            shukkinKibouNyuuryokuBean.setRegistFlg(false);

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
            shukkinKibouNyuuryokuBean.setRegistFlg(true);

            shukkinKibouNyuuryokuBeanList.add(shukkinKibouNyuuryokuBean);

        }

        return shukkinKibouNyuuryokuBeanList;
    }

    /**
     * DtoからBeanへ変換する
     * @param tsukibetsuShiftBeanList
     * @return DtoList
     * @author naraki
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     * @throws IllegalArgumentException
     */
    private List<List<ShukkinKibouNyuuryokuDto>> formToDto(List<ShukkinKibouNyuuryokuBean> shukkinKibouNyuuryokuBeanList
                                                      , List<DateBean> dateBeanList) throws IllegalArgumentException,
                                                                        IllegalAccessException,
                                                                        InvocationTargetException {
        // 戻り値
        List<List<ShukkinKibouNyuuryokuDto>> kibouDtoListList = new ArrayList<List<ShukkinKibouNyuuryokuDto>>();

        for (ShukkinKibouNyuuryokuBean shukkinKibouNyuuryokuBean : shukkinKibouNyuuryokuBeanList) {

            List<ShukkinKibouNyuuryokuDto> shukkinKibouNyuuryokuDtoList = new ArrayList<ShukkinKibouNyuuryokuDto>();

            // 登録フラグ
            boolean registFlg = shukkinKibouNyuuryokuBean.getRegistFlg();

            if (!registFlg) {
                continue;
            }

            // メソッドの取得
            Method[] methods = shukkinKibouNyuuryokuBean.getClass().getMethods();

            // ソートを行う
            Comparator<Method> asc = new MethodComparator();
            Arrays.sort(methods, asc); // 配列をソート

            int listSize = dateBeanList.size();

            int index = 0;

            for (int i = 0; i < methods.length; i++) {
                // "getShiftIdXX" のメソッドを動的に実行する
                if (methods[i].getName().startsWith("getShiftId") && index < listSize) {
                    String yearMonthDay = "";

                    // 対象年月取得
                    yearMonthDay = dateBeanList.get(index).getYearMonthDay();

                    ShukkinKibouNyuuryokuDto shukkinKibouNyuuryokuDto = new ShukkinKibouNyuuryokuDto();
                    String kibouShiftId = (String) methods[i].invoke(shukkinKibouNyuuryokuBean);

                    if (CommonConstant.BLANK_ID.equals(kibouShiftId)) {
                        // 空白が選択されている場合
                    	kibouShiftId = null;
                    }

                    shukkinKibouNyuuryokuDto.setKibouShiftId(kibouShiftId);
                    shukkinKibouNyuuryokuDto.setShainId(shukkinKibouNyuuryokuBean.getShainId());
                    shukkinKibouNyuuryokuDto.setYearMonthDay(yearMonthDay);
                    shukkinKibouNyuuryokuDtoList.add(shukkinKibouNyuuryokuDto);

                    index++;
                }
            }

            kibouDtoListList.add(shukkinKibouNyuuryokuDtoList);

        }

        return kibouDtoListList;
    }
}
