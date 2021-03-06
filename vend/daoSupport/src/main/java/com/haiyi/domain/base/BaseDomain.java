package com.haiyi.domain.base;
import java.io.Serializable;
/**
 * 
  * @ClassName: BaseDomain
  * @Company: 麦子科技
  * @Description: 基础模型类
  * @author 技术部-谢维乐
  * @date 2016年4月2日 下午5:20:13
  *
 */
public abstract class BaseDomain implements Serializable {
	
	private static final long serialVersionUID = -600415752154494413L;

	public Integer id;         //数据库主键
    
    public Byte status;      //状态
    
    private String remark;     //备注信息

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}




}