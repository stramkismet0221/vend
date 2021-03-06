package com.haiyi.utils;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.net.URLDecoder;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.haiyi.domain.base.BaseDomain;
import com.maizi.anno.FilterInfoAnno;
import com.maizi.exception.ExceptionKind;
import com.maizi.exception.KPException;
import com.maizi.utils.DateUtil;
import com.maizi.utils.StringUtil;
/**
 * 
  * @ClassName: RequestParamRegister
  * @Company: 麦子科技
  * @Description: 请求参数注册器
  * @author 技术部-谢维乐
  * @date 2016-2-17 下午2:22:28
  *
 */
public class RequestParamRegister{
 
  /**
   * 拼接排序
   * @param request
   * @param clazz
   * @return
   */
  public static String getOrderBy(HttpServletRequest request,Class<?extends BaseDomain> clazz){
	  clazz.getAnnotation(FilterInfoAnno.class);
	  String [] sorts=((FilterInfoAnno) clazz.getAnnotation(FilterInfoAnno.class)).sorts();
	  String sort=  request.getParameter("sort");
	  String order =  request.getParameter("order");
	  if(StringUtil.inArray(sorts,sort)){
		  return sort + " "+ order;
	  }
	  return null;
  };
 
	
  public static <T> T register(HttpServletRequest request,Class<T> clazz,String[] filterFields) throws KPException{
	  return parseEnumeration(request,clazz,filterFields);
  }
  
  
  public static Map<String,Object> registerToMap(HttpServletRequest request,Class<?extends BaseDomain> clazz,String[] filterFields) throws KPException{
	  return parseEnumerationToMap(request,clazz,filterFields);
  }
  
  private static Map<String,Object> parseEnumerationToMap(HttpServletRequest request,Class<?extends BaseDomain> clazz,String[] filterFields) throws KPException{
	  Map<String,Object> result = new HashMap<String,Object>();
	  Field field;
	  try {
		  if(StringUtil.isEmpty(filterFields)){
		  	  return Collections.emptyMap();
		  }
		  for(String filterField:filterFields){
		     String value = request.getParameter(filterField);
		     if(!StringUtil.isEmpty(value)){
		       if("status".equals(filterField)){
		    	   field = clazz.getField(filterField);
		       }else if("createDate".equals(filterField)){
		    	   field = clazz.getField(filterField);
		       }else{
		    	   field = clazz.getDeclaredField(filterField);
		       }
		       result.put(field.getName(), getObjValue(field.getType(),value));
		     }
		  }
		  return result;
	}catch (NoSuchFieldException e) {
		// TODO
		throw new KPException(ExceptionKind.PARAM_E);
	} catch (SecurityException e) {
		// TODO 
		throw new KPException(ExceptionKind.PARAM_E);
	} catch (IllegalArgumentException e) {
		// TODO 
		throw new KPException(ExceptionKind.PARAM_E);
	} catch (UnsupportedEncodingException e) {
		//TODO 
		throw new KPException(ExceptionKind.PARAM_E);
	} catch (KPException e) {
		throw e;
	}
  }

  private static <T> T parseEnumeration(HttpServletRequest request,Class<T> clazz,String[] filterFields) throws KPException{
	  Field field;
	  try {
		  T result = clazz.newInstance();
		 
		  if(StringUtil.isEmpty(filterFields)){
		  	return result;
		  }
		  for(String filterField:filterFields){
		     String value = request.getParameter(filterField);
		     if(!StringUtil.isEmpty(value)){
		    
	    	   if("status".equals(filterField)){
		    	   field = clazz.getField(filterField);
		       }else if("createDate".equals(filterField)){
		    	   field = clazz.getField(filterField);
		       }else{
		    	   field = clazz.getDeclaredField(filterField);
		       }
		    	
		  	   //设置value
		  	   field.setAccessible(true);
		  	   Class<?> typeClass =  field.getType();
		  	   field.set(result, getObjValue(typeClass,value));
		     }
		  }
		  return result;
	} catch (InstantiationException e) {
		// TODO 
		throw new KPException(ExceptionKind.PARAM_E);
	} catch (IllegalAccessException e) {
		// TODO 
		throw new KPException(ExceptionKind.PARAM_E);
	} catch (NoSuchFieldException e) {
		// TODO
		throw new KPException(ExceptionKind.PARAM_E);
	} catch (SecurityException e) {
		// TODO 
		throw new KPException(ExceptionKind.PARAM_E);
	} catch (IllegalArgumentException e) {
		// TODO 
		throw new KPException(ExceptionKind.PARAM_E);
	} catch (UnsupportedEncodingException e) {
		//TODO 
		throw new KPException(ExceptionKind.PARAM_E);
	} catch (KPException e) {
		throw e;
	}
  }
  
  
  /**
 * @throws UnsupportedEncodingException 
   * 
   * @Title: getObjValue 
   * @Description:               将指定的字符串转为对应类型的指 [注意:只能是对象类型]
   * @param @param valueType     原本值的类型  
   * @param @param value         需要转换的值
   * @param @return
   * @param @throws KPException     
   * @return Object     
   * @throws
   */
  private static Object getObjValue(Class<?> valueType,String value) throws KPException, UnsupportedEncodingException{
	  value = URLDecoder.decode(value, "utf-8");
      if (valueType.equals(String.class)){
      	  return CommonUtil.decodeSecond(String.valueOf(value));
      }else if (valueType.equals(Integer.class)){
          return Integer.valueOf(value);
      }else if (valueType.equals(Long.class)){
          return Long.valueOf(value);
      }else if (valueType.equals(Float.class)){
          return Float.valueOf(value);
      }else if (valueType.equals(Boolean.class)){
          return Boolean.valueOf(value);
      }else if (valueType.equals(Date.class)){
          return DateUtil.strToDate(value,"yyyy-MM-dd");
      }else if (valueType.equals(Byte.class) || valueType.equals(byte.class)){
          return Byte.valueOf(value);
      }else if (valueType.equals(Double.class)){
          return Double.valueOf(value);
      }
	  return new KPException(ExceptionKind.PARAM_E);
  }
}
