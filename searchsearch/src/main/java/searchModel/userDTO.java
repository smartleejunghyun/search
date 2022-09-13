package searchModel;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@RequiredArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class userDTO {
	
	public userDTO(String userId, String userPw){
		this.userId = userId;
		this.userPw = userPw;
	}


    // 회원 아이디 
	@NonNull
    private String userId;

    // 회원 비밀번호 
	@NonNull
    private String userPw;

    // 회원 이름 
	@NonNull
    private String userName;

    // 회원 가입일자 
    private Date userJoindate;

    // 회원 유형 회원:'U', 관리자:'A'
    private String userType;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getUserJoindate() {
        return userJoindate;
    }

    public void setUserJoindate(Date userJoindate) {
        this.userJoindate = userJoindate;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    // TUser 모델 복사

}