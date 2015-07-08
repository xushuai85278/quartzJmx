package com.easeye.quartz.quartzmonitor.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.quartz.CronExpression;

import com.easeye.quartz.quartzmonitor.conf.AuthenticationConfig;
import com.easeye.quartz.quartzmonitor.conf.QuartzConfig;
import com.easeye.quartz.quartzmonitor.core.QuartzInstanceContainer;
import com.easeye.quartz.quartzmonitor.object.QuartzInstance;
import com.easeye.quartz.quartzmonitor.object.Result;
import com.easeye.quartz.quartzmonitor.util.JsonUtil;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class InitAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	Map<String, QuartzConfig> configMap;
	private String uuid;
	private String expression;
	private List<Date> dateList = new ArrayList<Date>();

	@Override
	public String execute() throws Exception {
		configMap = QuartzInstanceContainer.getConfigMap();

		Map<String, QuartzInstance> quartzInstanceMap = QuartzInstanceContainer.getQuartzInstanceMap();
		if (quartzInstanceMap == null || quartzInstanceMap.size() == 0) {
			return super.execute();
		}
		
		Set<String> keySet = quartzInstanceMap.keySet();
		String key = null;
		for (Iterator<String> it = keySet.iterator(); it.hasNext();) {
			key = it.next();
			break;
		}
		
		HttpServletRequest request = ServletActionContext.getRequest();  // 得到request对象
		HttpSession session = request.getSession();  // 通过request得到session对象
		session.setAttribute("configName", QuartzInstanceContainer.getQuartzConfig(key).getName());
		session.setAttribute("configId", key);
		
		return super.execute();
	}

	public String config() throws Exception {

		QuartzConfig config = QuartzInstanceContainer.getQuartzConfig(uuid);

		HttpServletRequest request = ServletActionContext.getRequest();  // 得到request对象
		HttpSession session = request.getSession();  // 通过request得到session对象
		session.setAttribute("configName", config.getName());
		session.setAttribute("configId", uuid);

		Result result = new Result();
		result.setMessage("设置成功");
		result.setCallbackType("");
		JsonUtil.toJson(new Gson().toJson(result));
		return null;
	}

	public String check() throws Exception {

		CronExpression cronExpression = new CronExpression(expression);

		Date date = new Date();

		for (int i = 0; i < 15; i++) {
			date = cronExpression.getNextValidTimeAfter(date);
			dateList.add(date);
		}
		return "success";
	}

	public String login() {
		HttpServletRequest request = ServletActionContext.getRequest();  // 得到request对象
		Map<String, String[]> paramMap = request.getParameterMap();
		String username = paramMap.get("username")[0].trim();
		String password = paramMap.get("password")[0].trim();
		
//		if (username.equals(AuthenticationConfig.getUsername()) && password.equals(AuthenticationConfig.getPassword())) {
//			HttpSession session = request.getSession(); // 通过request得到session对象.
//			session.setAttribute("user", username);
//			System.out.println("InitAction: " + session);
//			return "success";
//		} else {
//			return "error";
//		}
		
		return "success";
	}
	
	public String logout() {
		HttpServletRequest request = ServletActionContext.getRequest();  // 得到request对象
		HttpSession session = request.getSession();  // 通过request得到session对象.
		session.removeAttribute("user");
		return "success";
	}
	
	public Map<String, QuartzConfig> getConfigMap() {
		return configMap;
	}

	public void setConfigMap(Map<String, QuartzConfig> configMap) {
		this.configMap = configMap;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getExpression() {
		return expression;
	}

	public void setExpression(String expression) {
		this.expression = expression;
	}

	public List<Date> getDateList() {
		return dateList;
	}

	public void setDateList(List<Date> dateList) {
		this.dateList = dateList;
	}
}