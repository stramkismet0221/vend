package com.haiyi.service;

import com.haiyi.domain.Product;
import com.haiyi.domain.vo.ProductVo;
import com.haiyi.query.ProductQuery;
import com.haiyi.service.base.BaseService;

import java.util.List;

public interface ProductService extends BaseService<Product, ProductQuery> {

	boolean onLine(Integer productId, Integer agentId);

	boolean offLine(Integer productId, Integer agentId);
	
	ProductVo findDetailById(Integer productId);

	 List<Product> findEmergencyProduct(Integer paramInteger);
}