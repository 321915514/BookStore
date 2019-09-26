package com.bookstore.user.web.servlet;

import java.awt.image.BufferedImage;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ImageUtil;

public class Vcode extends HttpServlet {
		
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html;charset=utf-8");
			request.setCharacterEncoding("utf-8");
			ImageUtil imageUtil=new ImageUtil();
			BufferedImage image= imageUtil.getImage();
			request.getSession().setAttribute("vcode", imageUtil.getText());
			try {
				ImageUtil.output(image, response.getOutputStream());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(imageUtil.getText());
		}
}
