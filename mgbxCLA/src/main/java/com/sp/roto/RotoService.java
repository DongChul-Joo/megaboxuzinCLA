package com.sp.roto;

import java.util.List;
import java.util.Map;

public interface RotoService {	
	public List<Roto> listRoto(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Roto readRoto(int num);
	public void insertRoto(Roto dto) throws Exception;
	
	public List<Roto> listEventPic(Map<String, Object> map);
	public int picCount(Map<String, Object> map);
}
