package util;


import java.util.Map;

import mybatis.model.User;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthorityInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		// 取得请求相关的ActionContext实例
		ActionContext ctx = invocation.getInvocationContext();
		Map session = ctx.getSession();
		// 取出名为user的Session属�?
		User user = (User) session.get("currentUser");
		// 如果没有登陆，都返回重新登陆
		if (user != null) {
			return invocation.invoke();
		}
		// 没有登陆，将服务器提示设置成�?��HttpServletRequest属�?
		ctx.put("tip", "您还没有登录");
		// 直接返回login的�?辑视�?此处和配置文件对�?
		return Action.LOGIN;

	}
}