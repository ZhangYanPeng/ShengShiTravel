package com.shengshi.travel.service;

import java.util.List;

import com.shengshi.travel.entity.Information;
import com.shengshi.travel.support.PageResults;

public interface InformationService{
	
	
	public Information get(long id);
	public int edit(Information information);
	public PageResults<Information> list(int type, int order, int pageNo);
	public PageResults<Information> search(Information information, int type, int pageNo);
	public Information read(long information_id);
}