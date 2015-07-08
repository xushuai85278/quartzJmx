package com.easeye.quartz.quartzmonitor.util;

import java.net.MalformedURLException;
import java.util.Date;

import javax.management.MBeanServerConnection;
import javax.management.openmbean.CompositeDataSupport;
import javax.management.remote.JMXServiceURL;

import org.apache.commons.lang.StringUtils;

import com.easeye.quartz.quartzmonitor.conf.QuartzConfig;
import com.easeye.quartz.quartzmonitor.object.JMXInput;
import com.easeye.quartz.quartzmonitor.object.QuartzInstance;

public class JMXUtil {

	public static JMXServiceURL createQuartzInstanceConnection(QuartzConfig quartzConfig)
			throws MalformedURLException {
		StringBuffer stringBuffer = new StringBuffer().append("service:jmx:rmi:///jndi/rmi://")
				.append(quartzConfig.getHost()).append(":").append(quartzConfig.getPort())
				.append("/jmxrmi");
		JMXServiceURL jmxServiceURL = new JMXServiceURL(stringBuffer.toString());
		return jmxServiceURL;
	}

	public static boolean isSupported(String version) {
		return StringKit.isNotEmpty(version) && version.startsWith("2");
	}

	public static Object callJMXAttribute(JMXInput jmxInput) throws Exception {
		QuartzInstance quartzInstance = jmxInput.getQuartzInstanceConnection();
		MBeanServerConnection connection = quartzInstance.getMBeanServerConnection();
		return (Object) connection.getAttribute(jmxInput.getObjectName(), jmxInput.getOperation());
	}

	public static Object callJMXOperation(JMXInput jmxInput) throws Exception {
		QuartzInstance quartzInstance = jmxInput.getQuartzInstanceConnection();
		MBeanServerConnection connection = quartzInstance.getMBeanServerConnection();
		return connection.invoke(jmxInput.getObjectName(), jmxInput.getOperation(),
				jmxInput.getParameters(), jmxInput.getSignature());
	}

	public static Object convertToType(CompositeDataSupport compositeDataSupport, String key) {
		if (compositeDataSupport.getCompositeType().getType(key).getClassName()
				.equals("java.lang.String")) {
			return StringUtils.trimToEmpty((String) compositeDataSupport.get(key));
		} else if (compositeDataSupport.getCompositeType().getType(key).getClassName()
				.equals("java.lang.Boolean")) {
			return compositeDataSupport.get(key);
		} else if (compositeDataSupport.getCompositeType().getType(key).getClassName()
				.equals("java.util.Date")) {
			return (Date) compositeDataSupport.get(key);
		} else if (compositeDataSupport.getCompositeType().getType(key).getClassName()
				.equals("java.lang.Integer")) {
			return (Integer) compositeDataSupport.get(key);
		} else if (compositeDataSupport.getCompositeType().getType(key).getClassName()
				.equals("java.lang.Long")) {
			return (Long) compositeDataSupport.get(key);
		}
		return new Object();
	}
}