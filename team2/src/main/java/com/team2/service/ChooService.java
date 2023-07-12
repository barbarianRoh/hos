package com.team2.service;

import java.util.List;
import com.team2.component.ChooTestDTO;

public interface ChooService {
	public ChooTestDTO hospitalselect(String name);
	
	public int nameCheck(String name);
}
