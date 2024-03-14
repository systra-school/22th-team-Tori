/**
 * ファイル名：ShainMstMntForm.java
 *
 * 変更履歴
 * 1.0  2010/08/23 Kazuya.Naraki
 */
package form.kei;


import java.util.List;
import java.util.Map;

import org.apache.struts.action.ActionForm;

/**
 * 説明：社員マスタメンテナンスフォームクラス
 * @author naraki
 *
 */
public class KeihiForm extends ActionForm {

    /** 社員一覧 */
    private List<KeihiBean> keihiBeanList;
    /** 権限コンボ */
    private Map<String, String> kengenCmbMap;

    /**
     * @return kengenCmbMap
     */
    public Map<String, String> getKengenCmbMap() {
        return kengenCmbMap;
    }

    /**
     * @param kengenCmbMap をセットする
     */
    public void setKengenCmbMap(Map<String, String> kengenCmbMap) {
        this.kengenCmbMap = kengenCmbMap;
    }

    /**
     * @return KeihiBeanList
     */
    public List<KeihiBean> getKeihiBeanList() {
        return keihiBeanList;
    }

    /**
     * @param KeihiBeanList をセットする
     */
    public void setKeihiBeanList(List<KeihiBean> KeihiBeanList) {
        this.keihiBeanList = KeihiBeanList;
    }


}
