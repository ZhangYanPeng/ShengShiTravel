package com.shengshi.travel.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shengshi.travel.constants.Constants;
import com.shengshi.travel.dao.impl.InformationDAOImpl;
import com.shengshi.travel.entity.Information;
import com.shengshi.travel.service.InformationService;
import com.shengshi.travel.support.PageResults;

@Service
public class InformationServiceImple implements InformationService {

	@Autowired
	InformationDAOImpl informationDAO;
	
	

	@Override
	@Transactional
	public Information get(long id) {
		// TODO Auto-generated method stub
		return informationDAO.get(id);
	}

	@Override
	@Transactional
	public int edit(Information information) {
		// TODO Auto-generated method stub
		informationDAO.update(information); 
		return 0;
	}

	@Override
	@Transactional
	public PageResults<Information> list(int type, int pageNo) {
		// TODO Auto-generated method stub
		return this.search(new Information(-1),type,pageNo);
	}

	@Override
	@Transactional
	public PageResults<Information> search(Information information, int type, int pageNo) {
		// TODO Auto-generated method stub
		String hql = "from Information information";
		String countHql = "select count(*) from Information information";
		List<Information> informations = new ArrayList<Information>();
		if(information.getId()==-1){
			hql += " where information.type=?";
			if(type==Constants.order_by_publish_time){
				hql += "order by information.publish_time desc";
			}
			else{
				hql += "order by information.publish_time asc";
			}
			countHql += " where information.type=?";
			Object[] values = {type};
			return informationDAO.findPageByFetchedHql(hql, countHql, pageNo, Constants.pageSize, values);
		}
		else{
			hql += " where information.type=? and information.startpos=? and information.destination=?";
			if(type==Constants.order_by_publish_time){
				hql += "order by information.publish_time desc";
			}
			else{
				hql += "order by information.publish_time asc";
			}
			countHql += " where information.type=?";
			Object[] values = {type,information.getStartpos(),information.getDestination()};
			return informationDAO.findPageByFetchedHql(hql, countHql, pageNo, Constants.pageSize, values);
		}
	
	}

}
