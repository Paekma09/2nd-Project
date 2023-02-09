package com.fin.kimo.model.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.fin.kimo.model.dto.Member;
import com.fin.kimo.model.dto.UserRole;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserSecurityService implements UserDetailsService{
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		Optional<Member> _member = this.userRepository.findBymemberId(memberId);
		
		if (_member.isEmpty()) {
			throw new UsernameNotFoundException("사용자 ID를 찾을 수 없습니다.");
		}
		Member member = _member.get();
		List<GrantedAuthority> authority = new ArrayList<>();
		if ("admin".equals(memberId)) {
			authority.add(new SimpleGrantedAuthority(UserRole.ADMIN.getValue()));
		} else {
			authority.add(new SimpleGrantedAuthority(UserRole.USER.getValue()));
		}
		return new User(member.getMemberId(), member.getMemberPassword(), authority);
	}

}
