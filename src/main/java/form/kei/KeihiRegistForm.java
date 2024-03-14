/**
 * ファイル名：ShainMstMntRegistForm.java
 *
 * 変更履歴
 * 1.0  2010/08/23 Kazuya.Naraki
 */
package form.kei;

import java.util.Map;

import org.apache.struts.action.ActionForm;

/**
 * 説明：社員マスタメンテナンスフォームクラス
 * @author naraki
 *
 */
public class KeihiRegistForm extends ActionForm {

    /** 社員ＩＤ */
    private String shainId;
    /** 利用対象 */
    private String password;
    /** 利用目的 */
    private String shainName;
    /** 利用金額 */
    private String shainNameKana;
    /** 利用日 */
    private String kengenId;
    /** 権限コンボ */
    private Map<String, String> kengenCmbMap;

    /**
     * @return shainId
     */
    public String getShainId() {
        return shainId;
    }
    /**
     * @param shainId をセットする
     */
    public void setShainId(String shainId) {
        this.shainId = shainId;
    }
    /**
     * @return password
     */
    public String getPassword() {
        return password;
    }
    /**
     * @param password をセットする
     */
    public void setPassword(String password) {
        this.password = password;
    }
    /**
     * @return shainName
     */
    public String getShainName() {
        return shainName;
    }
    /**
     * @param shainName をセットする
     */
    public void setShainName(String shainName) {
        this.shainName = shainName;
    }
    /**
     * @return shainNameKana
     */
    public String getShainNameKana() {
        return shainNameKana;
    }
    /**
     * @param shainNameKana をセットする
     */
    public void setShainNameKana(String shainNameKana) {
        this.shainNameKana = shainNameKana;
    }
    /**
     * @return kengenId
     */
    public String getKengenId() {
        return kengenId;
    }
    /**
     * @param kengenId をセットする
     */
    public void setKengenId(String kengenId) {
        this.kengenId = kengenId;
    }
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

}
