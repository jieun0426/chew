package com.mbc.chew.main;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface MainService {
	
	ArrayList<MainDTO> ranking3();

	ArrayList<MainDTO> show3nostars_area(String string);
	
	//ArrayList<MainDTO> show3nostars_category(String string);
	
	ArrayList<MainDTO> show3latest(String string);

	public Double avgStar(int storecode);
	
}
