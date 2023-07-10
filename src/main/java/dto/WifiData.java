package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class WifiData {
    private double distance;			// 거리
    private String xSwifiMgrNo; 		// 관리번호
    private String xSwifiWrdofc; 		// 자치구
    private String xSwifiMainNm;		// 와이파이명
    private String xSwifiAddres1;		// 도로명주소
    private String xSwifiAddres2;		// 상세주소
    private String xSwifiInstlFloor;	// 설치위치(층)
    private String xSwifiInstlTy;		// 설치유형
    private String xSwifiInstlMby;		// 설치기관
    private String xSwifiSvcSe;			// 서비스구분
    private String xSwifiCmcwr;			// 망종류
    private String xSwifiCnstcYear;		// 설치년도
    private String xSwifiInoutDoor;		// 실내외구분
    private String xSwifiRemars3;		// wifi접속환경
    private double lat;					// Y좌표(위도) latitude
    private double lnt;					// X좌표(경도) longitude
    private String workDttm;			// 작업일자
}
