/**
 * ファイル名：GyoumuRenrakuDto.java
 */
package business.dto.gyo;

/**
 * 追加機能
 * 説明：業務連絡Dto
 */

public class GyoumuRenrakuDto {
	
	/** 社員ID */
	private String shainId;
	/** 社員名 */
	private String shainName;
	/** 年月 */
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
     * @return yearMonth
     */
	public String getYearMonth() {
		return yearMonth;
	}
	/**
     * @param yearMonth をセットする
     */
	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}
	/**
     * @return title
     */
	public String getTitle() {
		return title;
	}
	/**
     * @param title をセットする
     */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
     * @return memo
     */
	public String getMemo() {
		return memo;
	}
	/**
     * @param memo をセットする
     */
	public void setMemo(String memo) {
		this.memo = memo;
	}
}
