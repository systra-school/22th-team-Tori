/**
 * ファイル名：GyoumuRenrakuNyuuryokuKakuninBean.java
 */
package form.gyo;
/**
 * 追加機能
 * 説明：業務連絡入力確認
 */
public class GyoumuRenrakuNyuuryokuKakuninBean {
	
	/** 社員ID */
	private String shainId;
	/** 社員名 */
	private String shainName;
	/** 年月日 */
	private String yearMonth;
	/** タイトル */
	private String title;
	/** 内容 */
	private String memo;
	
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
     * @return getShainName
     */
	public String getShainName() {
		return shainName;
	}
	/**
     * @param getShainName をセットする
     */
	public void setShainName(String shainName) {
		this.shainName = shainName;
	}
	/**
     * @return getYearMonth
     */
	public String getYearMonth() {
		return yearMonth;
	}
	/**
     * @param getYearMonth をセットする
     */
	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}
	/**
     * @return getTitle
     */
	public String getTitle() {
		return title;
	}
	/**
     * @param getTitle をセットする
     */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
     * @return getMemo
     */
	public String getMemo() {
		return memo;
	}
	/**
     * @param getMemo をセットする
     */
	public void setMemo(String memo) {
		this.memo = memo;
	}
}
