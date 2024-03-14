/**
 * ファイル名：ShainMstMntLogic.java
 *
 * 変更履歴
 * 1.0  2010/08/24 Kazuya.Naraki
 */
package business.logic.kei;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import business.db.dao.kei.KeihiDao;
import business.dto.LoginUserDto;
import business.dto.kei.KeihiDto;

/**
 * 説明：社員マスタメンテナンス処理のロジック
 * @author naraki
 *
 */
public class KeihiLogic {

    /**
     * 社員マスタの更新系の処理を行う
     * @param KeihiDtoList 更新対象社員マスタDtoリスト
     *
     * @param loginUserDto ログインユーザーDto
     * @author naraki
     */
    public void updateMshain(List<KeihiDto> KeihiDtoList, LoginUserDto loginUserDto) throws Exception{

        // 社員マスタDao
        KeihiDao KeihiDao = new KeihiDao();
        // コネクション
        Connection connection = KeihiDao.getConnection();

        // トランザクション処理
        connection.setAutoCommit(false);

        try {
            for (int i = 0; i < KeihiDtoList.size(); i++) {

                KeihiDto KeihiDto = KeihiDtoList.get(i);
                boolean deleteFlg = KeihiDto.getDeleteFlg();

                if (deleteFlg) {
                    // 削除
                    KeihiDao.deleteShainMst(KeihiDto.getShainId(),KeihiDto.getPassword(),KeihiDto.getShainName(),
                    		KeihiDto.getShainNameKana(),KeihiDto.getKengenId());
                } else {
                    // 更新
                    KeihiDao.updateShainMst(KeihiDto, loginUserDto);
                }

            }
        } catch (Exception e) {
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

    /**
     * 社員マスタの登録処理を行う
     * @param mshainDtoList 更新対象社員マスタDtoリスト
     *
     * @param loginUserDto ログインユーザーDto
     * @author naraki
     */
    public void registMshain(KeihiDto KeihiDto, LoginUserDto loginUserDto) throws Exception{

        // 社員マスタDao
        KeihiDao KeihiDao = new KeihiDao();



        KeihiDto.setShainId(loginUserDto.getShainId());

        // 登録
        KeihiDao.registShainMst(KeihiDto, loginUserDto);

    }

    /**
     * 社員マスタ情報を取得する。
     * @return 社員マスタリスト
     * @author naraki
     */
    public List<KeihiDto> getShainData(LoginUserDto loginUserDto) throws SQLException{

        // 社員マスタDao
        KeihiDao KeihiDao = new KeihiDao();

        // 社員情報を取得する。
        List<KeihiDto> mShainList = KeihiDao.getShainAllList();



        return mShainList;
    }
    
    public List<KeihiDto> getShainData2(LoginUserDto loginUserDto) throws SQLException{

        // 社員マスタDao
        KeihiDao KeihiDao = new KeihiDao();

        // 社員情報を取得する。
        List<KeihiDto> mShainList = KeihiDao.getShainAllList2();



        return mShainList;
    }
    public void sinseiMshain(List<KeihiDto> KeihiDtoList, LoginUserDto loginUserDto) throws Exception{

        // 社員マスタDao
        KeihiDao KeihiDao = new KeihiDao();
        // コネクション
        Connection connection = KeihiDao.getConnection();

        // トランザクション処理
        connection.setAutoCommit(false);

        try {
            for (int i = 0; i < KeihiDtoList.size(); i++) {

                KeihiDto KeihiDto = KeihiDtoList.get(i);
                boolean deleteFlg = KeihiDto.getDeleteFlg();

                if (deleteFlg) {
                    
                	KeihiDao.registShainMst(KeihiDto, loginUserDto);// 申請後削除
                	
                    KeihiDao.deleteShainMst2(KeihiDto.getShainId(),KeihiDto.getPassword(),KeihiDto.getShainName(),
                    		KeihiDto.getShainNameKana(),KeihiDto.getKengenId());
                	

                } else {
                    // 更新
                   
                }

            }
        } catch (Exception e) {
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
