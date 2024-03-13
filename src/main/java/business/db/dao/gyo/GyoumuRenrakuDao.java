/**
 * ファイル名：GyoumuRenrakuDao.java
 */
package business.db.dao.gyo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import business.db.dao.AbstractDao;
import business.dto.LoginUserDto;
import business.dto.gyo.GyoumuRenrakuDto;
import constant.DbConstant.G_Gyoumu_Renraku;

/**
 * 追加機能
 * 説明：業務連絡Dao
 */

public class GyoumuRenrakuDao extends AbstractDao {

	// ログ出力クラス
    private Log log = LogFactory.getLog(this.getClass());
    
    /**
     * 入力された業務連絡をDBに追記する
     */
    public void insertGyoumuRenraku (GyoumuRenrakuDto gyoumuRenrakuDto, LoginUserDto loginUserDto) throws SQLException{
    	
    	try {
    		
    		StringBuilder strSql = new StringBuilder();
    		strSql.append("INSERT INTO ");
    		strSql.append("G_GYOUMU_RENRAKU (");
    		strSql.append("SHAIN_ID, ");
    		strSql.append("SHAIN_NAME, ");
    		strSql.append("YEAR_MONTH_DAY, ");
    		strSql.append("TITLE, ");
    		strSql.append("MEMO, ");
    		strSql.append("CREATE_DT) VALUES (");
    		strSql.append("?, ");
    		strSql.append("?, ");
    		strSql.append("?, ");
    		strSql.append("?, ");
    		strSql.append("?, ");
    		strSql.append("current_timestamp())");
    		
            PreparedStatement ps = connection.prepareStatement(strSql.toString());

    		ps.setString(1, loginUserDto.getShainId());
    		ps.setString(2, loginUserDto.getShainName());
    		ps.setString(3, gyoumuRenrakuDto.getYearMonth());
    		ps.setString(4, gyoumuRenrakuDto.getTitle());
    		ps.setString(5, gyoumuRenrakuDto.getMemo());
    		
    		// ログ出力
            log.info(ps);
            // SQLを実行する
            ps.executeUpdate();
    		
    	} catch (SQLException e) {
    		// 例外発生
            throw e;
    	}
    }
    
    /**
     * 業務連絡DBのデータをListに格納する
     */
    public List<GyoumuRenrakuDto> getGyoumuRenrakuDtoList () throws SQLException {
    	
    	List<GyoumuRenrakuDto> gyoumuRenrakuDtoList = new ArrayList<GyoumuRenrakuDto>();
    	
    	try {
    		// コネクション接続
            this.connect();
            StringBuilder strSql = new StringBuilder();
            
            strSql.append("SELECT ");
            strSql.append("SHAIN_ID, ");
    		strSql.append("SHAIN_NAME, ");
    		strSql.append("YEAR_MONTH_DAY, ");
    		strSql.append("TITLE, ");
    		strSql.append("MEMO ");
    		strSql.append("FROM ");
    		strSql.append("G_GYOUMU_RENRAKU ");
    		strSql.append("ORDER BY CREATE_DT DESC");
    		
            PreparedStatement ps = connection.prepareStatement(strSql.toString());
            // ログ出力
            log.info(ps);
            // SQLを実行する
            ResultSet rs = ps.executeQuery();

            //取得結果セット
            while (rs.next()) {
            	
            	GyoumuRenrakuDto dto = new GyoumuRenrakuDto();
            	
            	dto.setShainId(rs.getString(G_Gyoumu_Renraku.SHAIN_ID.getName()));
            	dto.setShainName(rs.getString(G_Gyoumu_Renraku.SHAIN_NAME.getName()));
            	dto.setYearMonth(rs.getString(G_Gyoumu_Renraku.YEAR_MONTH_DAY.getName()));
            	dto.setTitle(rs.getString(G_Gyoumu_Renraku.TITLE.getName()));
            	dto.setMemo(rs.getString(G_Gyoumu_Renraku.MEMO.getName()));
            	
            	gyoumuRenrakuDtoList.add(dto);
            }
    		
    	} catch (SQLException e) {
    		// 例外発生
            throw e;
        } finally {
            // コネクション切断
            disConnect();
        }
    	
    	return gyoumuRenrakuDtoList;
    }
}
