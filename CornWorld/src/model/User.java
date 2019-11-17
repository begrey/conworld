package model;

/**
 * ����� ������ ���� �ʿ��� ������ Ŭ����. USERINFO ���̺�� ������
 */
public class User {
	private String userId;		// ����� id
	private String name; 		// ����� �̸� 
	private String nickname; 	// ���  
	private String phone; 		// ��ȭ��ȣ 
	private String kakaoId;		// īī�� id
	private String password;	// ��й�ȣ 

	public User() { }		// �⺻ ������
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getKakaoId() {
		return kakaoId;
	}
	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public User(String userId, String password, String name, String nickname, String phone, String kakaoId) {
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.kakaoId = kakaoId;
	}
	
	public void update(User updateUser) {
        this.password = updateUser.password;
        this.name = updateUser.name;
        this.nickname = updateUser.nickname;
        this.phone = updateUser.phone;
        this.kakaoId = updateUser.kakaoId;
    }

	/* ��й�ȣ �˻� */
	public boolean matchPassword(String password) {
		if (password == null) {
			return false;
		}
		return this.password.equals(password);
	}
	
	public boolean isSameUser(String userid) {
        return this.userId.equals(userid);
    }

	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", phone="
				+ phone + ", kakaoId=" + kakaoId +"]";
	}	
}