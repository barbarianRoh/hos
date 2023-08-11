package com.team2.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.team2.component.KimDTO;

@Mapper
public interface KimMapper {
	 int updateSymptomCount(KimDTO dto);
		public int kSignup(@Param("kId")String kId, @Param("kNick")String kNick, @Param("kGender")String kGender, @Param("kAge")String kAge);
		public int kSignin(@Param("kId")String kId);
}