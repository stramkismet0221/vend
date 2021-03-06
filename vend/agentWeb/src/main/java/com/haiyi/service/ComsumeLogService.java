package com.haiyi.service;

import java.util.List;
import java.util.Map;

import com.haiyi.domain.ComsumeLog;
import com.haiyi.domain.vo.OrderMonthStasticVO;
import com.haiyi.query.ComsumeLogQuery;
import com.haiyi.service.base.BaseService;
public interface ComsumeLogService extends BaseService<ComsumeLog,ComsumeLogQuery> {

	List<OrderMonthStasticVO> queryMonthStatistic(String date);
	
	List<Map<String,Object>> payTypeChart(Map<String,Object> param);
	
	List<Map<String,Object>> findDaySummaryInfo( String currentDay);
}