package PtBoard;

import common.DBConnPool;

public class BoardDAO extends DBConnPool {
    public BoardDAO() {
        super();
    }

    public BoardDTO selectRandomPage(String board_id){
        BoardDTO dto = new BoardDTO();
        String query = "SELECT * FROM (SELECT * FROM SCOTT.BOARD order by DBMS_RANDOM.RANDOM) WHERE rownum < 2;";

        try{
            psmt = con.prepareStatement(query);
            rs = psmt.executeQuery();

            if(rs.next()) {
                //데이터 추출 및 저장
                dto.setBoard_id(rs.getString("board_id"));
                dto.setTitle(rs.getString("title"));
                dto.setContents(rs.getString("contents"));
                dto.setPost_date(rs.getDate("post_date"));
            }

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("selectRandomPage 에러발생");
        }
        return dto;

    }

}
