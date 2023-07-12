package com.team2.mapper;

import java.util.List;
import com.team2.component.ChooTestDTO;

public interface ChooMapper {
	public ChooTestDTO hospitalselect(String name);
	
	public int nameCheck(String name);
}