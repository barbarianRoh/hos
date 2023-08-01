package com.team2.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.team2.component.KimDTO;

@Mapper
public interface KimMapper {
	 int updateSymptomCount(KimDTO dto);
}