package com.luckcloud.h5.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class WriteUtil {

	
	public static void  outObject(HttpServletResponse  response,Object obj) {
		try {
			response.setContentType("application/json; charset=utf-8");  
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(obj.toString());

			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
