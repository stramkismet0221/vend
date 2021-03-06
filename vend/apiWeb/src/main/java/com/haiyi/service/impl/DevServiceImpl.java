package com.haiyi.service.impl;

import com.github.pagehelper.PageInfo;
import com.haiyi.dao.DevMapper;
import com.haiyi.domain.Dev;
import com.haiyi.query.DevQuery;
import com.haiyi.service.DevService;
import com.haiyi.utils.StatusConstant;
import com.maizi.utils.LogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DevServiceImpl implements DevService{
	

	
	@Autowired
	DevMapper devMapper;

	@Override
	public Dev devLoginInfo(Integer agentId) {
		return devMapper.devLoginInfo(agentId,StatusConstant.AGENT_STATUS_NEW);
	}

	@Override
	public List<Dev> findBySelective(DevQuery devQuery) {
		return new PageInfo<>(devMapper.findBySelective(devQuery)).getList();
	}

	@Override
	public Dev devLoginInfoByObtain(Integer agentId) {
		return devMapper.devLoginInfoByObtain(agentId,StatusConstant.DEV_OBTAIN_OPEN);
	}

	@Override
	public int updateObtain(Integer devId, Integer obtain) {
		Dev dev = new Dev();
		dev.setId(devId);
		dev.setObtain(obtain);
		return devMapper.update(dev);
	}

	@Override
	public int updateStates(Integer devId, Integer state) {
		return devMapper.updateStates(devId,state);
	}

	@Override
	public int updateDevStates(Integer devId, Integer devStatus) {
		return devMapper.updateDevStates(devId,devStatus);
	}

	@Override
	public int updateFrothStatus(Integer devId, Integer frothStatus) {
		return devMapper.updateFrothStatus(devId,frothStatus);
	}


	/**
	 * 获取指定商品组对应设备的支付信息
	 */
	@Override
	public Map<String, Object> getPayInfo(Integer productId) {
		return devMapper.getPayInfo(productId);
	}

	
	/**
	 * 根据Id获取设备的详细信息
	 * @param devId 设备Id
	 */
	@Override
	public Dev findById(Integer devId) {
		return devMapper.findById(devId+"");
	}

	@Override
	public Dev login(String devNum,String token) {
		Dev dev =  devMapper.findByNumAndToken(devNum,token);

		if(dev==null){
			LogUtils.logError("编号为[{}]的设备,不存在",devNum);
			return null;
		}

		//判断参数是否停用
		/*if(StatusConstant.DEV_OBTAIN_CLOSE.compareTo(dev.getObtain())==0){
			LogUtils.logInfo("编号为[{}]的设备,已经停用",dev.getNum());
		}else{
			//停用获取参数开关
			updateObtain(dev.getId(), StatusConstant.DEV_OBTAIN_CLOSE);
		}*/
		return dev;
	}

	@Override
	public Dev findByNumAndToken(String num, String token) {
		return devMapper.findByNumAndToken(num,token);
	}


	@Override
	public Dev findByNum(String devNum) {
		DevQuery devQuery = new DevQuery();
		devQuery.setNum(devNum);
		List<Dev> devs = devMapper.findBySelective(devQuery);
		return devs.isEmpty()?null:devs.get(0);
	}
}