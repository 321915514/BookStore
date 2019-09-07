package com.bookstore.user.web.servlet;

import java.io.IOException;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.cart.domain.Cart;
import com.bookstore.user.domain.User;
import com.bookstore.user.service.UserService;

import mail.Mail;
import mail.MailUtils;
import servlet.BaseServlet;
import utils.CommonUtils;

public class UserServlet extends BaseServlet {
	private UserService userService=new UserService();
	
	public String active(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String code=request.getParameter("code");
		try {
			userService.active(code);
			request.setAttribute("msg", "激活成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg", e.getMessage());
			
		}
		return "f:/user/msg.jsp";
	}
	public String quit(HttpServletRequest request ,HttpServletResponse response) throws IOException {
		request.getSession().invalidate();
		response.getWriter().print("退出成功");
		return"r:/index.jsp";
	}
	public String regist(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		User form=CommonUtils.toBean(request.getParameterMap(), User.class);
		form.setU_id(CommonUtils.UUID());
		form.setCode(CommonUtils.UUID()+CommonUtils.UUID());
		//输入校验
		Map<String, String> errors=new HashMap<String, String>();
		String username=form.getUsername();
		if (username==null && username.trim().isEmpty()) {
			errors.put("username", "用户名不能为空");		
		}else if (username.length()<3||username.length()>10) {
			errors.put("username", "用户名长度必须在3-10之间");
		}
		String password=form.getPassword();
		if (password==null && password.trim().isEmpty()) {
			errors.put("password", "密码不能为空");		
		}else if (password.length()<3||password.length()>10) {
			errors.put("password", "密码长度必须在3-10之间");
		}
		String repassword=request.getParameter("repassword");
		if (repassword==null && repassword.trim().isEmpty()) {
			errors.put("repassword", "密码不能为空");		
		}else if (repassword.length()!=password.length()||!repassword.trim().equals(password.trim())) {
			errors.put("repassword", "密码不一致");
		}
		String email=form.getEmail();
		if (email==null && email.trim().isEmpty()) {
			errors.put("email", "Email不能为空");		
		}else if (!email.matches("\\w+@\\w+\\.\\w+")) {
			errors.put("email", "Email格式错误");
		}
		if (errors != null&&errors.size()>0) {
			request.setAttribute("errors", errors);
			request.setAttribute("form", form);
			request.setAttribute("repassword", repassword);
			return "f:/user/regist.jsp";
		}
		try {
			userService.regist(form);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
			return "f:/user/regist.jsp";
		}
		Properties properties=new Properties();
		try {
			properties.load(this.getClass().getClassLoader().getResourceAsStream("email.properties"));
			String host=properties.getProperty("host");
			String user=properties.getProperty("username");
			String pw=properties.getProperty("password");
			String content=properties.getProperty("content");
			content=MessageFormat.format(content, form.getCode());
			Session session=MailUtils.createSession(host, user, pw);
			session.setDebug(true);
			Mail mail=new Mail(properties.getProperty("from"), form.getEmail(), properties.getProperty("subject"), content);
			MailUtils.send(session, mail);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("msg", "注册成功,请到邮箱激活");
		return "f:/user/msg.jsp";
		
	}
	public String login(HttpServletRequest request,HttpServletResponse response) throws IOException {
		User form=CommonUtils.toBean(request.getParameterMap(), User.class);
		Map<String, String> errors=new HashMap<String, String>();
		String username=form.getUsername();
		if (username==null && username.trim().isEmpty()) {
			errors.put("username", "用户名不能为空");		
		}else if (username.length()<3||username.length()>10) {
			errors.put("username", "用户名长度必须在3-10之间");
		}
		String password=form.getPassword();
		if (password==null && password.trim().isEmpty()) {
			errors.put("password", "密码不能为空");		
		}else if (password.length()<3||password.length()>10) {
			errors.put("password", "密码长度必须在3-10之间");
		}
		if (errors != null&&errors.size()>0) {
			request.setAttribute("errors", errors);
			request.setAttribute("form", form);
			return "f:/user/login.jsp";
		}
		try {
			User user=userService.login(form);
			
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("cart", new Cart());
			return "r:/index.jsp";
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
			return "f:/user/login.jsp";
		}
		
		
	}

}
