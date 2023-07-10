package dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter

public class HistoryData {
    private int id;             // id
    private double myLat;       // Y좌표
    private double myLnt;       // X좌표
    private Date checkDate;   // 조회일자
}
