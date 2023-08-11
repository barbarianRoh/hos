package com.team2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.component.KimDTO;
import com.team2.mapper.KimMapper;

@Service
public class SympotyServiceImpl implements SympotyService{
	
	@Autowired
	private KimMapper mapper;

    @Override
    public void updateSymptomCount(KimDTO dto) {
        String symptomName = dto.getSymptom_name(); // 객체인 dto에서 호출
        mapper.updateSymptomCount(dto); // 매퍼에서 올바른 메서드 호출
    }

	@Override
	public int kSignup(String kId, String kNick, String kGender, String kAge) {
		return mapper.kSignup(kId, kNick, kGender, kAge);
	}
	
	@Override
	public int kSignin(String kId) {
		return mapper.kSignin(kId);
	}
	


}
