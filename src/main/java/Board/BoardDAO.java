package Board;

import common.DBConnPool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends DBConnPool {

    public BoardDAO()  {
        super();
    }

    //게시글 전체 출력 -> 목록
    public List<BoardDTO> selectAll(){

        Statement stmt = null;
        ResultSet rs = null;
        List<BoardDTO> res = new ArrayList<BoardDTO>();

        String sql = " SELECT * FROM c##dndud.BOARD ";

        //sql 쿼리 실행


        //sql 쿼리 실행
        try {
            stmt = con.createStatement();

            //쿼리 실행 결과 rs에 저장
            rs = stmt.executeQuery(sql);

            //rs dto에 순서대로 저장
            while(rs.next()) {
                BoardDTO dto = new BoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5));

                res.add(dto);
            }
        }catch (SQLException e){
            System.out.println("게시글불러오기 오류");
            e.printStackTrace();
        }
        return res;
    }

    // 게시글 선택 출력 (게시글 하나보는거)
    public BoardDTO selectOne(int bd_no){

        BoardDTO res = null;

        String sql = " SELECT * FROM c##dndud.BOARD WHERE BD_NO=? ";
        //sql 쿼리실행
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1,bd_no);

            //쿼리 실행 결과 rs에 저장
            rs = psmt.executeQuery();

            //rs(선택한 번호의 데이터값) -> res에 하나씩저장
            while(rs.next()) {
                res = new BoardDTO();
                res.setBd_no(rs.getInt(1));
                res.setBd_name(rs.getString(2));
                res.setBd_title(rs.getString(3));
                res.setBd_content(rs.getString(4));
                res.setBd_date(rs.getDate(5));

            }

        }catch (SQLException e) {
            e.printStackTrace();
            System.out.println("selectOne 문제발생");
        }
        return res;
    }


    //글 추가
    public int insert(BoardDTO dto) {

        try {
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","c##dndud","1234");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        PreparedStatement pstm = null;
        int res = 0;

        String sql = " INSERT INTO c##dndud.BOARD VALUES(BD_SEQ.NEXTVAL, ?, ?, ?, SYSDATE) ";

        //sql 쿼리 실행
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, dto.getBd_name());
            pstm.setString(2, dto.getBd_title());
            pstm.setString(3, dto.getBd_content());

            res = pstm.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                pstm.close();
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return res;
    }

    public int Update(BoardDTO dto) {
        int res = 0;

        String sql = "UPDATE c##dndud.board SET BD_TITLE=?, BC_CONTENT=? WHERE BD_NO=? ";

        //sql문 실행
        try{
            psmt = con.prepareStatement(sql);
            psmt.setString(1, dto.getBd_title());
            psmt.setString(2, dto.getBd_content());
            psmt.setInt(3, dto.getBd_no());

            res = psmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    public int multiDelete(String[] bd_no){
        int res = 0;
        int [] cnt = null;
        String sql = " DELETE FROM c##dndud.board WHERE BD_NO=? ";

        try{
            psmt = con.prepareStatement(sql);

            for(int i=0; i< bd_no.length; i++) {
                psmt.setString(1,bd_no[1]);

                //쿼리문 psmt에 모두 쌓아 한번에 처리
                psmt.addBatch();
            }
            cnt = psmt.executeBatch();

            //쿼리 성공 : -2
            for(int i=0; i<cnt.length; i++){
                if(cnt[i]==-2){
                    res++;
                }
            }
        //모아둔 쿼리 실행 끝나면 커밋
            if(bd_no.length==res){
                con.commit();
            }else {
                con.rollback();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return res;
    }
}
