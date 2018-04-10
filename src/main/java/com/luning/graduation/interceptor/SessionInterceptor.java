package com.luning.graduation.interceptor;

import com.luning.graduation.util.SessionKeyConst;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author admin
 * session拦截器
 */
public class SessionInterceptor implements HandlerInterceptor {
    /**
     *在进入Handle方法之前执行的方法
     * @return true:执行下一个拦截器，直到所有拦截器都执行完，再执行被拦截的Controller
     *          false:从当前拦截器往回执行所有拦截器的afterCompletion方法，再退出拦截器链
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        if (httpServletRequest.getSession().getAttribute(SessionKeyConst.USER_INFO) != null){
            return true;
        }
        httpServletRequest.getRequestDispatcher("/login/sessionTimeout").forward(httpServletRequest,httpServletResponse);
        return false;
    }

    /**
     *在进入Handle方法之后返回ModelAndView之前执行
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    /**
     *在Handle方法执行完执行
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
