package kr.co.hit.security;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.co.hit.dto.MemberAuth;
import kr.co.hit.dto.MemberDto;

public class User implements UserDetails{

	public User() {
		super();
	}

	private static final long serialVersionUID = 1L;

	private int member_no, grade;
	private String member_id, naver_id, nickname, password, email, contact, git_link, baekjoon, authority, image_url;
	private String enabled;
	private Date join_date;
	
	
	
	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public String getNaver_id() {
		return naver_id;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public void setNaver_id(String naver_id) {
		this.naver_id = naver_id;
	}

	private boolean isEnabled;
	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	public void setAccountNonExpired(boolean isAccountNonExpired) {
		this.isAccountNonExpired = isAccountNonExpired;
	}

	public void setAccountNonLocked(boolean isAccountNonLocked) {
		this.isAccountNonLocked = isAccountNonLocked;
	}

	public void setCredentialsNonExpired(boolean isCredentialsNonExpired) {
		this.isCredentialsNonExpired = isCredentialsNonExpired;
	}

	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	private boolean isAccountNonExpired;
	private boolean isAccountNonLocked;
	private boolean isCredentialsNonExpired;
	private List<MemberAuth> authList;

	private Collection<? extends GrantedAuthority> authorities;

	
	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getGit_link() {
		return git_link;
	}

	public void setGit_link(String git_link) {
		this.git_link = git_link;
	}

	public String getBaekjoon() {
		return baekjoon;
	}

	public void setBaekjoon(String baekjoon) {
		this.baekjoon = baekjoon;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public List<MemberAuth> getAuthList() {
		return authList;
	}

	public void setAuthList(List<MemberAuth> authList) {
		this.authList = authList;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return isAccountNonExpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return isAccountNonLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return isCredentialsNonExpired;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return isEnabled;
	}
	
	public User(MemberDto dto, Collection<GrantedAuthority> auth) {
		member_no = dto.getMember_no();
		member_id = dto.getMember_id();
		nickname = dto.getNickname();
		password = dto.getPassword();
		email = dto.getEmail();
		contact = dto.getContact();
		grade = dto.getGrade();
		git_link = dto.getGit_link();
		baekjoon = dto.getBaekjoon();
		authority = dto.getAuthority();
		authList = dto.getAuthList();
		naver_id = dto.getNaver_id();
		image_url = dto.getImage_url();
		
		
		isEnabled = true;
		isAccountNonExpired = true;
		isAccountNonLocked = true;
		isCredentialsNonExpired = true;
		
		authorities = auth;
	}

	@Override
	public String toString() {
		return "User [member_no=" + member_no + ", grade=" + grade + ", member_id=" + member_id + ", naver_id="
				+ naver_id + ", nickname=" + nickname + ", password=" + password + ", email=" + email + ", contact="
				+ contact + ", git_link=" + git_link + ", baekjoon=" + baekjoon + ", authority=" + authority
				+ ", image_url=" + image_url + ", enabled=" + enabled + ", join_date=" + join_date + ", isEnabled="
				+ isEnabled + ", isAccountNonExpired=" + isAccountNonExpired + ", isAccountNonLocked="
				+ isAccountNonLocked + ", isCredentialsNonExpired=" + isCredentialsNonExpired + ", authList=" + authList
				+ ", authorities=" + authorities + "]";
	}
	


	
}
