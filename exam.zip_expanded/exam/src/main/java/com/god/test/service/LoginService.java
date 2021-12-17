package com.god.test.service; 

import com.god.test.vo.LoginVo;
import com.god.test.mapper.LoginMapper;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service; 
import java.util.List; 

@Service
public class LoginService {
	
	@Autowired 
	public LoginMapper mapper; 
	
	public LoginVo login(LoginVo loginvo) {
		System.out.println("로그인 서비스 진행");
		 return mapper.login(loginvo);
	} 
}