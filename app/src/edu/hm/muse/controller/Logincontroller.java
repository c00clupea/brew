/*
 * **
 *  *                                        __          ____                                     __
 *  *     /'\_/`\                 __        /\ \        /\  _`\                                __/\ \__
 *  *    /\      \  __  __   ___ /\_\    ___\ \ \___    \ \,\L\_\     __    ___  __  __  _ __ /\_\ \ ,_\  __  __
 *  *    \ \ \__\ \/\ \/\ \/' _ `\/\ \  /'___\ \  _ `\   \/_\__ \   /'__`\ /'___\\ \/\ \/\`'__\/\ \ \ \/ /\ \/\ \
 *  *     \ \ \_/\ \ \ \_\ \\ \/\ \ \ \/\ \__/\ \ \ \ \    /\ \L\ \/\  __//\ \__/ \ \_\ \ \ \/ \ \ \ \ \_\ \ \_\ \
 *  *      \ \_\\ \_\ \____/ \_\ \_\ \_\ \____\\ \_\ \_\   \ `\____\ \____\ \____\ \____/\ \_\  \ \_\ \__\\/`____ \
 *  *       \/_/ \/_/\/___/ \/_/\/_/\/_/\/____/ \/_/\/_/    \/_____/\/____/\/____/\/___/  \/_/   \/_/\/__/ `/___/> \
 *  *                                                                                                         /\___/
 *  *                                                                                                         \/__/
 *  *
 *  *     ____                                               __          ____
 *  *    /\  _`\                                            /\ \        /\  _`\
 *  *    \ \ \L\ \     __    ____    __     __     _ __  ___\ \ \___    \ \ \L\_\  _ __  ___   __  __  _____
 *  *     \ \ ,  /   /'__`\ /',__\ /'__`\ /'__`\  /\`'__\'___\ \  _ `\   \ \ \L_L /\`'__\ __`\/\ \/\ \/\ '__`\
 *  *      \ \ \\ \ /\  __//\__, `\\  __//\ \L\.\_\ \ \/\ \__/\ \ \ \ \   \ \ \/, \ \ \/\ \L\ \ \ \_\ \ \ \L\ \
 *  *       \ \_\ \_\ \____\/\____/ \____\ \__/.\_\\ \_\ \____\\ \_\ \_\   \ \____/\ \_\ \____/\ \____/\ \ ,__/
 *  *        \/_/\/ /\/____/\/___/ \/____/\/__/\/_/ \/_/\/____/ \/_/\/_/    \/___/  \/_/\/___/  \/___/  \ \ \/
 *  *                                                                                                    \ \_\
 *  *    This file is part of BREW.
 *  *
 *  *    BREW is free software: you can redistribute it and/or modify
 *  *    it under the terms of the GNU General Public License as published by
 *  *    the Free Software Foundation, either version 3 of the License, or
 *  *    (at your option) any later version.
 *  *
 *  *    BREW is distributed in the hope that it will be useful,
 *  *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  *    GNU General Public License for more details.
 *  *
 *  *    You should have received a copy of the GNU General Public License
 *  *    along with BREW.  If not, see <http://www.gnu.org/licenses/>.                                                                                                  \/_/
 *
 */

package edu.hm.muse.controller;

import edu.hm.muse.exception.SuperFatalAndReallyAnnoyingException;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.sql.Types;

@Controller
public class Logincontroller {

    private JdbcTemplate jdbcTemplate;

    @Resource(name = "dataSource")
    public void setDataSource(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @RequestMapping(value = "/login.secu", method = RequestMethod.GET)
    public ModelAndView showLoginScreen() {
        ModelAndView mv = new ModelAndView("login");
        mv.addObject("msg", "Enter name and password");
        return mv;
    }

    @RequestMapping(value = "/adminlogin.secu", method = RequestMethod.GET)
    public ModelAndView showAdminLoginScreen(HttpSession session) {
        ModelAndView mv = new ModelAndView("adminlogin");
        mv.addObject("msg", "Enter password");

        SecureRandom random = new SecureRandom();

        int token = random.nextInt();

        mv.addObject("csrftoken",token);
        session.setAttribute("csrftoken",token);

        return mv;
    }


    @RequestMapping(value = "/login.secu", method = RequestMethod.POST)
    public ModelAndView doSomeLogin(@RequestParam(value = "mname", required = false) String mname, @RequestParam(value = "mpwd", required = false) String mpwd, HttpSession session) {
        if (null == mname || null == mpwd || mname.isEmpty() || mpwd.isEmpty()) {
            throw new SuperFatalAndReallyAnnoyingException("I can not process, because the requestparam mname or mpwd is empty or null or something like this");
        }

        //This is the sql statement
        String sql = String.format("select count(*) from M_USER where muname = '%s' and mpwd = '%s'", mname, mpwd);

        int res = 0;
        try {
            //Here is the sql magic
            //TODO:Possibly this is unsecure, but I am only a low paid code scripter...perhaps there is a option to bring prepared
            //statements into this sql-query.
            //But I found a possible solution here http://static.springsource.org/spring/docs/3.0.x/reference/html/jdbc.html#jdbc-JdbcTemplate-idioms
            //I think the easiest way is to build the sql statements with ? instead of concatenation
            res = jdbcTemplate.queryForInt(sql);
        } catch (DataAccessException e) {
            throw new SuperFatalAndReallyAnnoyingException(String.format("Sorry but %sis a bad grammar or has following problem %s", sql, e.getMessage()));
        }

        //If there are any results, than the username and password is correct
        if (res > 0) {
            session.setAttribute("user", mname);
            session.setAttribute("login", true);
            return new ModelAndView("redirect:intern.secu");
        }
        //Ohhhhh not correct try again
        ModelAndView mv = returnToLogin(session);
        return mv;
    }

    @RequestMapping(value = "/adminlogin.secu", method = RequestMethod.POST)
    public ModelAndView doAdminLogin(@RequestParam(value = "mpwd", required = false) String mpwd,@RequestParam(value = "csrftoken",required = false) String csrfParam,HttpServletResponse response, HttpSession session) {
        if (null == mpwd || mpwd.isEmpty()) {
            throw new SuperFatalAndReallyAnnoyingException("I can not process, because the requestparam mpwd is empty or null or something like this");
        }

        String sql = "select count (*) from M_ADMIN where mpwd = ?";

        try {
            String digest = calculateSHA256(new ByteArrayInputStream(mpwd.getBytes("UTF8")));

            int res = 0;

            res = jdbcTemplate.queryForInt(sql,new Object[]{digest},new int[]{Types.VARCHAR});

            Integer csrfTokenSess = (Integer) session.getAttribute("csrftoken");
            if (res != 0 && csrfParam != null && !csrfParam.isEmpty() && csrfTokenSess != null) {
                Integer csrfParamToken = Integer.parseInt(csrfParam);
                if (csrfParamToken.intValue() == csrfTokenSess.intValue()) {
                    SecureRandom random = new SecureRandom();
                    int token = random.nextInt();
                    session.setAttribute("user", "admin");
                    session.setAttribute("login", true);
                    session.setAttribute("admintoken",token);
                    response.addCookie(new Cookie("admintoken",String.valueOf(token)));
                    session.removeAttribute("csrftoken");
                    return new ModelAndView("redirect:adminintern.secu");
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        catch (ClassCastException ccastEx){
           ccastEx.printStackTrace();
        }
        catch (NumberFormatException nfoEx){
            nfoEx.printStackTrace();
        }
        catch (DataAccessException e) {
            throw new SuperFatalAndReallyAnnoyingException(String.format("Sorry but %sis a bad grammar or has following problem %s", sql, e.getMessage()));
        }
        ModelAndView mv = returnToAdminLogin(session);
        return mv;
    }

    private ModelAndView returnToAdminLogin(HttpSession session) {
        //Ohhhhh not correct try again
        ModelAndView mv = new ModelAndView("redirect:adminlogin.secu");
        mv.addObject("msg", "Sorry try again");
        session.setAttribute("login", false);
        return mv;
    }

    private ModelAndView returnToLogin(HttpSession session) {
        //Ohhhhh not correct try again
        ModelAndView mv = new ModelAndView("login");
        mv.addObject("msg", "Sorry try again");
        session.setAttribute("login", false);
        return mv;
    }

    public static String calculateSHA256(InputStream is) {
        String output;
        int read;
        byte[] buffer = new byte[8192];
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            while ((read = is.read(buffer)) > 0) {
                digest.update(buffer, 0, read);
            }
            byte[] hash = digest.digest();
            BigInteger bigInt = new BigInteger(1, hash);
            output = bigInt.toString(16);
        }
        catch (Exception e) {
            e.printStackTrace( System.err );
            return "0";
        }
        return output;
    }

}
