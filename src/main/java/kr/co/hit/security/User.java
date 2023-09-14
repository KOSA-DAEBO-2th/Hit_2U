package kr.co.hit.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.co.hit.dto.MemberAuth;
import kr.co.hit.dto.MemberDto;

public class User implements UserDetails{

	private static final long serialVersionUID = 1L;

	private int member_no, login_method;
	private String member_id, nickname, password, email, contact, grade, git_link, baekjoon, authority;

	private String enabled;
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

	public int getLogin_method() {
		return login_method;
	}

	public void setLogin_method(int login_method) {
		this.login_method = login_method;
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}
	
	public User(MemberDto dto, Collection<GrantedAuthority> auth) {
		member_no = dto.getMember_no();
		login_method = dto.getLogin_method();
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
		
		isEnabled = true;
		isAccountNonExpired = true;
		isAccountNonLocked = true;
		isCredentialsNonExpired = true;
		
		authorities = auth;
	}

	@Override
	public String toString() {
		return "User [member_no=" + member_no + ", login_method=" + login_method + ", member_id=" + member_id
				+ ", nickname=" + nickname + ", password=" + password + ", email=" + email + ", contact=" + contact
				+ ", grade=" + grade + ", git_link=" + git_link + ", baekjoon=" + baekjoon + ", authority=" + authority
				+ ", enabled=" + enabled + ", isEnabled=" + isEnabled + ", isAccountNonExpired=" + isAccountNonExpired
				+ ", isAccountNonLocked=" + isAccountNonLocked + ", isCredentialsNonExpired=" + isCredentialsNonExpired
				+ ", authList=" + authList + ", authorities=" + authorities + "]";
	}

	
}
