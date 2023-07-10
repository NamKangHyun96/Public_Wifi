package dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter

public class BookMarkList {
    private int bookListId;
    private String bookListNm;
    private String wifiNm;
    private Date bookListRg;
}
