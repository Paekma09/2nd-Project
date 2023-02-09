package com.fin.kimo.model.biz;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fin.kimo.model.dto.Member;

public interface UserRepository extends JpaRepository<Member, String>{
	Optional<Member> findBymemberId(String memberId);
	
}
