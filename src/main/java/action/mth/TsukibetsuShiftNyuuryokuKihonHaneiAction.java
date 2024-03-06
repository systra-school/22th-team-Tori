/**
 * ファイル名：KihonShiftMstMntKakuninInitAction.java
 *
 * 変更履歴
 * 1.0  2010/11/02 Kazuya.nishioka
 */
package action.mth;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
import business.dto.bse.KihonShiftDto;
import business.logic.bse.KihonShiftLogic;
import business.logic.utils.ComboListUtilLogic;
import business.logic.utils.CommonUtils;
import constant.CommonConstant;
import constant.RequestSessionNameConstant;
import exception.CommonException;
import form.common.DateBean;
import form.mth.TsukibetsuShiftNyuuryokuBean;
import form.mth.TsukibetsuShiftNyuuryokuForm;

/**
 * 説明：基本シフト確認初期処理
 * @author nishioka
 *
 */
public class TsukibetsuShiftNyuuryokuKihonHaneiAction extends Action {

    // ログ出力クラス
    private Log log = LogFactory.getLog(this.getClass());

    /**
     * 基本シフト確認のアクション
     *
     * @param mapping アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @return アクションフォワード
     * @author nishioka
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest req, HttpServletResponse res) throws Exception {
        log.info(new Throwable().getStackTrace()[0].getMethodName());

        // セッション
        HttpSession session = req.getSession();

        // フォワードキー
        String forward = "";

        // ログインユーザ情報をセッションより取得
        LoginUserDto loginUserDto = (LoginUserDto) session.getAttribute(RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO);

        // フォーム
        TsukibetsuShiftNyuuryokuForm tsukibetsuShiftForm = (TsukibetsuShiftNyuuryokuForm) form;

        
        String yearMonth = CommonUtils.getFisicalDay(CommonConstant.yearMonthNoSl);
        List<DateBean> dateBeanList = CommonUtils.getDateBeanList(yearMonth);//現在日付yearMonthをもとに該当月一日毎の曜日などを取得している

        
        
        // セレクトボックス（シフトマスタ）の取得
        ComboListUtilLogic comboListUtils = new ComboListUtilLogic();
        Map<String, String> shiftCmbMap = comboListUtils.getComboShift(true);//シフトIDに対するシンボルを紐づけして取得している
        Map<String, String> yearMonthCmbMap = comboListUtils.getComboYearMonth(CommonUtils.getFisicalDay(CommonConstant.yearMonthNoSl), 3, ComboListUtilLogic.KBN_YEARMONTH_NEXT, false);


        // 基本シフトマスタロジック
        KihonShiftLogic kihonShiftLogic = new KihonShiftLogic();
        // 設定済み基本シフトデータの取得
        Map<String, KihonShiftDto> kihonShiftDataMap = kihonShiftLogic.getKihonShiftData();//社員ID毎にKihonShiftDtoが設定されている。

        List<TsukibetsuShiftNyuuryokuBean> monthlyShiftInfoList = new ArrayList<TsukibetsuShiftNyuuryokuBean>();
        
        monthlyShiftInfoList = getMonthlyDate(dateBeanList, kihonShiftDataMap);
        
        tsukibetsuShiftForm.setShiftCmbMap(shiftCmbMap);
        tsukibetsuShiftForm.setYearMonthCmbMap(yearMonthCmbMap);
        tsukibetsuShiftForm.setTsukibetsuShiftNyuuryokuBeanList(monthlyShiftInfoList);
        tsukibetsuShiftForm.setDateBeanList(dateBeanList);
        tsukibetsuShiftForm.setYearMonth(yearMonth);
        // ページング用
        tsukibetsuShiftForm.setOffset(0);
        tsukibetsuShiftForm.setCntPage(1);
        tsukibetsuShiftForm.setMaxPage(CommonUtils.getMaxPage(kihonShiftDataMap.size(), 16));



        forward = CommonConstant.SUCCESS;

        return mapping.findForward(forward);
    }
    
    private List<TsukibetsuShiftNyuuryokuBean> getMonthlyDate(List<DateBean> dateBeanList ,  Map<String, KihonShiftDto> kihonShiftDataMap) throws CommonException, SQLException, NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
    	
    	
    	String firstDayOfWeek = dateBeanList.get(0).getYoubi();
    	
    	Map<String, String[]> employeeShifts = new HashMap<>();

    	// 基本シフトデータを社員名をキーに配列へ
    	for (String shainId : kihonShiftDataMap.keySet()) {
    	    KihonShiftDto kihonShiftDto = kihonShiftDataMap.get(shainId);
    	    String shainName = kihonShiftDto.getShainName();
    	    String[] shifts = {
    	        kihonShiftDto.getShiftIdOnSaturday(),
    	        kihonShiftDto.getShiftIdOnSunday(),
    	        kihonShiftDto.getShiftIdOnMonday(),
    	        kihonShiftDto.getShiftIdOnTuesday(),
    	        kihonShiftDto.getShiftIdOnWednesday(),
    	        kihonShiftDto.getShiftIdOnThursday(),
    	        kihonShiftDto.getShiftIdOnFriday()
    	    };
    	    employeeShifts.put(shainName, shifts);
    	}
    	
    	List<TsukibetsuShiftNyuuryokuBean> monthlyShiftInfoList = new ArrayList<>();

        
        for (String shainId : kihonShiftDataMap.keySet()) {
            KihonShiftDto kihonShiftDto = kihonShiftDataMap.get(shainId);
            String shainName = kihonShiftDto.getShainName();

            TsukibetsuShiftNyuuryokuBean monthlyShiftInfo = new TsukibetsuShiftNyuuryokuBean();
            monthlyShiftInfo.setShainId(shainId);
            monthlyShiftInfo.setShainName(shainName);

            String[] shifts = employeeShifts.get(shainName);
            
            int firstDayOfWeekNum = yobitoNum(firstDayOfWeek);

            // シフトIDをセット
            for (int i = 0; i < dateBeanList.size(); i++) {
                int index = (i + firstDayOfWeekNum - 1) % 7;
                String shiftId = shifts[index];
                String methodName = "setShiftId" + String.format("%02d", i + 1);
                java.lang.reflect.Method setShiftIdMethod = monthlyShiftInfo.getClass().getMethod(methodName, String.class);                
                setShiftIdMethod.invoke(monthlyShiftInfo, shiftId);
            }

            // 登録フラグを設定
            monthlyShiftInfo.setRegistFlg(false);

            monthlyShiftInfoList.add(monthlyShiftInfo); // 月別シフト情報をリストに追加
        }

        return monthlyShiftInfoList;


    	
    }
    
 // 曜日の文字列を数値に変換する
    private int yobitoNum(String weekday) {
        switch (weekday) {
            case "月":
                return 3;
            case "火":
                return 4;
            case "水":
                return 5;
            case "木":
                return 6;
            case "金":
                return 7;
            case "土":
                return 1;
            case "日":
                return 2;
            default:
                return -1; 
        }	
    }

}
