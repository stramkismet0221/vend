package com.haiyi.domain;
import java.util.Date;

import com.haiyi.domain.base.BaseDomain;
import com.maizi.anno.ClassInfoAnno;
import com.maizi.anno.FilterInfoAnno;
/**
  * 
  * @ClassName: CountingLog
  * @Company: 麦子科技
  * @Description: CountingLog实体
  * @author 技术部-谢维乐
  * @date 2016年5月1日 下午1:38:35
  *
 */
@ClassInfoAnno(msg="出货日志",resourceId="id",dbId = "id")
@FilterInfoAnno(fields = {""},sorts={""})
public class CountingLog extends BaseDomain {
    //名称
    private String name;                                      
     //商品编号
    private Integer productNum;                                    
     //商品Id
    private Integer productId;                                    
     //数量
    private Integer count;                                    
     //设备Id
    private Integer devId;                                    
     //设备编号
    private Integer devNum;                                    
    //计数时间]                               
    private Date createTime;
    
    //代理Id
    private Integer agentId;        
    
    public Byte type;      //类型   1:进货  2:出货
    
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getDevId() {
		return devId;
	}
	public void setDevId(Integer devId) {
		this.devId = devId;
	}
	public Integer getDevNum() {
		return devNum;
	}
	public void setDevNum(Integer devNum) {
		this.devNum = devNum;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getAgentId() {
		return agentId;
	}
	public void setAgentId(Integer agentId) {
		this.agentId = agentId;
	}
	public Byte getType() {
		return type;
	}
	public void setType(Byte type) {
		this.type = type;
	}   
}