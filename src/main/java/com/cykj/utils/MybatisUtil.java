package com.cykj.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.io.IOException;
import java.io.Reader;

public class MybatisUtil {
    //Mybatis配置文件路径
    private static final String CONFIG_PATH="mybatis-config.xml";
    //SqlSessionFactory工厂对象
    private SqlSessionFactory sessionFactory=null;
    private SqlSession session=null;
    private static MybatisUtil instance=null;

    private MybatisUtil(){
      Reader reader=null;
        try {
            reader= Resources.getResourceAsReader(CONFIG_PATH);
            sessionFactory=new SqlSessionFactoryBuilder().build(reader);
            session=sessionFactory.openSession(false);
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            if(null!=reader){
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    //获取MybatisUtil单例
    public static synchronized MybatisUtil getInstance(){
        if(null==instance){
            synchronized (MybatisUtil.class){   //必须是同一对象才能保证同一把锁
                instance=new MybatisUtil();
            }
        }
        return instance;
    }
    public synchronized SqlSession getSqlSession(){
        session=sessionFactory.openSession();
        return session;
    }
}
