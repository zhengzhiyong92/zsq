package com.cykj.servlet;



import com.alibaba.fastjson.JSON;

import net.sf.json.JSONArray;
import com.cykj.bean.Admin;
import com.cykj.mapper.AdminMapper;
import com.cykj.utils.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;


@WebServlet({"/loginServlet"})//通过注解访问地址,多选一
public class LoginServlet extends BaseServlet {
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String account=request.getParameter("account");
        String pwd=request.getParameter("pwd");
        Admin admin=new Admin();
        admin.setUsername(account);
        admin.setPwd(pwd);
        SqlSession session = MybatisUtil.getInstance().getSqlSession();
        AdminMapper adminMapper=session.getMapper(AdminMapper.class);
        List<Admin> admins=adminMapper.findAll(admin);
        session.commit();
        session.close();
        if(admins.size()>0){
            request.getSession().setAttribute("admin", admin);//对session对象属性赋值
            response.getWriter().write("success");
        }else{
            response.getWriter().write("false");
        }
    }
    public void Registration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String params=request.getParameter("params");
        System.out.println(params);
        try {
            JSONObject object = new JSONObject(params);
            String account=object.getString("account");
            String password=object.getString("password");
            String tel=object.getString("tel");
            String email=object.getString("email");
            String edu=object.getString("edu");
            String ocu=object.getString("ocu");
            String sex=object.getString("sex");
            Admin admin=new Admin();
            admin.setUsername(account);
            admin.setPwd(password);
            admin.setTel(tel);
            admin.setEmail(email);
            admin.setEdu(edu);
            admin.setOcu(ocu);
            admin.setSex(sex);
            SqlSession session = MybatisUtil.getInstance().getSqlSession();
            AdminMapper adminMapper=session.getMapper(AdminMapper.class);
            adminMapper.addUser(admin);
            session.commit();
            session.close();
            response.getWriter().write("1");
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
    public void check(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String account=request.getParameter("user");
        Admin admin=new Admin();
        admin.setUsername(account);
        SqlSession session = MybatisUtil.getInstance().getSqlSession();
        AdminMapper adminMapper=session.getMapper(AdminMapper.class);
        List<Admin> admins=adminMapper.findAll(admin);
        session.commit();
        session.close();
        if(admins.size()>0){
            response.getWriter().write("1");
        }else{
            response.getWriter().write("0");
        }
    }
    public void displayForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int page = Integer.parseInt(request.getParameter("page"));
        int limit = Integer.parseInt(request.getParameter("limit"));
        String keyword= request.getParameter("keyword");
        System.out.println(keyword);
       System.out.println(page);
        System.out.println(limit);
        Admin admin=new Admin();
        SqlSession session = MybatisUtil.getInstance().getSqlSession();
        AdminMapper adminMapper=session.getMapper(AdminMapper.class);
        int count=adminMapper.pagecount();
        int page_temp = page;
        int limit_temp = limit;
        if (count < page * limit) {
            limit = count - (page - 1) * limit;
        }
        page = (page_temp - 1) * limit_temp;
        HashMap<String,Object> map=new HashMap<String,Object>();
        map.put("start",page);
        map.put("end", limit);
        map.put("keyword",keyword);

        List<Admin> admins=adminMapper.tabledisplay(map);
        session.commit();
        session.close();

        if(admins.size()>0){
            JSONArray js = JSONArray.fromObject(admins);
            String listJson = js.toString();
            System.out.println(listJson);
            String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+listJson+"}";
            response.getWriter().write(jso);
           }
        }

}
