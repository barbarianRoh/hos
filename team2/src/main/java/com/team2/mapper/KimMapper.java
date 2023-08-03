package com.team2.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface KimMapper {
	void updateSymptomCount(String symptomName);
}