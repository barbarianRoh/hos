package com.team2.service;

import com.team2.component.KimDTO;

public interface SympotyService {
	public void updateSymptomCount(KimDTO dto);
	public int kSignup(String kId, String kNick, String kGender, String kAge);
	public int kSignin(String kId);
}
