package dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;


@Getter
@Setter

public class BookMarkGroup {
    private int bookMarkId; // id
    private String bookMarkNm; // 북마크 이름
    private int bookMarkOd; // 순서
    private Date bookMarkRg; // 등록일자
    private Date bookMarkERg; // 수정일자;

}
