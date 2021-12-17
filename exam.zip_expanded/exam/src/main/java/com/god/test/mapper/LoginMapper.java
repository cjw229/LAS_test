package com.god.test.mapper;

import java.util.List;

import com.god.test.vo.LoginVo;
import org.apache.ibatis.annotations.Mapper; 
import org.springframework.stereotype.Repository; 

@Repository 
@Mapper 
public interface LoginMapper {
	LoginVo login(LoginVo loginvo); 
}