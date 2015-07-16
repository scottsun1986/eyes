/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package action;

import java.util.Map;

import mybatis.dao.UserMapper;
import mybatis.model.User;

import org.apache.struts2.ServletActionContext;

import util.MD5Util;
import util.RandomNumber;
import util.ShowMsg;

import com.opensymphony.xwork2.ActionSupport;

/**
 * MyEclipse Struts Creation date: 06-29-2010
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/login" name="loginForm" input="/form/login.jsp"
 *                scope="request" validate="true"
 */
public class LoginAction extends ActionSupport {
	private UserMapper userMapper;
	public UserMapper getUserMapper() {
		return userMapper;
	}
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getImsi() {
		return imsi;
	}
	public void setImsi(String imsi) {
		this.imsi = imsi;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	private String userId;
	private String imsi;
	private String password;
	private String authCode;
	private ShowMsg showMsg;
	
	public ShowMsg getShowMsg() {
		return showMsg;
	}
	public void setShowMsg(ShowMsg showMsg) {
		this.showMsg = showMsg;
	}
	/**
	 * PC网页登录
	 * 
	 * @return
	 */
	public String pcLogin(){
		Map session = ServletActionContext.getContext().getSession();
	
	 
		if(userId!=null&&userId.trim()!=""&&password!=null&&password.trim()!=""&&authCode!=null&&authCode.trim()!="")
		{//如果用户名密码正确
			User user=userMapper.selectByPkPwAc(userId, MD5Util.generatePassword(password), "1665");
			//User user=userMapper.selectByPkPwAc(userId, MD5Util.generatePassword(password), authCode);
			//正常使用时要把这行注释去掉
			//userMapper.updateAuthCode(userId, RandomNumber.getCharAndNumr(4));
			if(user!=null){//如果返回了对象
				session.put("currentUser", user);
			
				return "main";
			}else{
				showMsg=new ShowMsg("错误","用户名、密码、授权码不匹配",-1);
				return "index";
			}
		}else{
			showMsg=new ShowMsg("错误","用户名、密码、授权码缺一不可",-1);
			return "index";
		}
		
		
		 
	}
	
	/**
	 * 手机客户端登录
	 * @return
	 */
	public String appLogin(){
		return null;
		
	}
	
}