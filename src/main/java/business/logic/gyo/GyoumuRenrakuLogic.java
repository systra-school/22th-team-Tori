/**
 * ファイル名：GyoumuRenrakuLogic.java
 */
package business.logic.gyo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import business.db.dao.gyo.GyoumuRenrakuDao;
import business.dto.LoginUserDto;
import business.dto.gyo.GyoumuRenrakuDto;

/**
 * 追加機能
 * 説明：業務連絡Logic
 */
public class GyoumuRenrakuLogic {
	
	/**
	 * 業務連絡のリストを取得
	 * @return 業務連絡DtoList
	 * @throws SQLException
	 */
	public List<GyoumuRenrakuDto> getGyoumuRenrakuDtoList() throws SQLException {
		//Dao
		GyoumuRenrakuDao dao = new GyoumuRenrakuDao();
		//情報の取得
		List<GyoumuRenrakuDto> gyoumuRenrakuDtoList = dao.getGyoumuRenrakuDtoList();
		
		return gyoumuRenrakuDtoList;
	}
	
	/**
	 * 業務連絡の新規登録
	 */
	public void registGyoumuRenraku(GyoumuRenrakuDto gyoumuRenrakuDto, LoginUserDto loginUserDto) throws SQLException {
		//Dao
		GyoumuRenrakuDao dao = new GyoumuRenrakuDao();
		 // コネクション
        Connection connection = dao.getConnection();
        // トランザクション処理
        connection.setAutoCommit(false);
        
        try {
        	//登録
        	dao.insertGyoumuRenraku(gyoumuRenrakuDto, loginUserDto);
        	
        } catch (SQLException e) {
            // ロールバック処理
            connection.rollback();
            // 切断
            connection.close();

            throw e;
        }

        // コミット
        connection.commit();
        // 切断
        connection.close();

	}
}
