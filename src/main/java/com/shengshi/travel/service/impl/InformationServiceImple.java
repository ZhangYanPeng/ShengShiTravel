package com.shengshi.travel.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.swing.text.InternationalFormatter;

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
	public PageResults<Information> list(int type,int order, int pageNo) {
		// TODO Auto-generated method stub
		Information information = new Information(-1);
		information.setType(type);
		return this.search(information,order,pageNo);
	}

	@Override
	@Transactional
	public PageResults<Information> search(Information information, int order, int pageNo) {
		// TODO Auto-generated method stub
		String hql = "from Information information where information.type=? and start_time>=? ";
		String countHql = "select count(*) from Information information where information.type=? and start_time>=? ";
		hql += " and information.startpos like ? and information.destination like ?";
		countHql += " and information.startpos like ? and information.destination like ?";
		if(order==Constants.order_by_publish_time_asc){
			hql += " order by information.publish_time asc";
		}
		else if(order==Constants.order_by_publish_time_asc){
			hql += " order by information.publish_time desc";
		}
		else if(order==Constants.order_by_start_time_asc){
			hql += " order by information.start_time asc";
		}
		else{
			hql += " order by information.start_time desc";
		}
		Object[] values = new Object[]{information.getType(),System.currentTimeMillis(),"%%","%%"};
		if(information.getId()!=-1){
			if( information.getStartpos()!=null && !information.getStartpos().equals("")){
				values[2] = "%"+information.getStartpos()+"%";
			}
			if( information.getDestination()!=null && !information.getDestination().equals("")){
				values[3] = "%"+information.getDestination()+"%";
			}
		}
		return informationDAO.findPageByFetchedHql(hql, countHql, pageNo, Constants.pageSize, values);
	}

	@Override
	@Transactional
	public Information read(long information_id) {
		// TODO Auto-generated method stub
		Information information = informationDAO.get(information_id);
		information.setRead_times(information.getRead_times()+1);
		informationDAO.update(information);
		return information;
	}

	@Override
	@Transactional
	public String delete(Long information_id) {
		// TODO Auto-generated method stub
		Information information = informationDAO.get(information_id);
		informationDAO.delete(information);
		return "1";
	}

}
