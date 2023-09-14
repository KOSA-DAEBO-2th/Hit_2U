package kr.co.hit.security;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.hit.dao.MemberDao;
import kr.co.hit.dto.MemberAuth;
import kr.co.hit.dto.MemberDto;
import kr.co.hit.security.User;

@Service
public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	MemberDao dao;
	
	public CustomUserDetailService() {}

	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		MemberDto dto = dao.getMember(member_id);
		
		if(dto==null) throw new UsernameNotFoundException("Invalid User");
			
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		for (MemberAuth auth : dto.getAuthList()) {
			grantedAuthorities.add(new SimpleGrantedAuthority(auth.getAuth()));
		}
		User user = new User(dto, grantedAuthorities);

		return user;
	}

}