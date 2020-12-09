package com.cykj.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

@WebServlet(name = "BaseServlet")
public class BaseServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
           String methodName=req.getParameter("methodName");//得到请求的方法名
           Class clazz=this.getClass();
            try {
               if (methodName != null && !methodName.trim().equals("")) {
                   //返回一个Method对象，它反应此Class对象所表示的类和接口的指定公共成员方法
                   Method method = clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
                   //对带有指定参数的指定对象调用由此Mehod对象表示的底层方法
                   String path = (String) method.invoke(this, req, resp);
                   if (path != null && !path.trim().equals("")) {
                       req.getRequestDispatcher(path).forward(req, resp);
                   }
                     }
                   } catch (NoSuchMethodException e) {
                       e.printStackTrace();
                   } catch (IllegalAccessException e) {
                       e.printStackTrace();
                   } catch (InvocationTargetException e) {
                       e.printStackTrace();
                   }
    }
}
