/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Follow;
import model.FollowTable;
/**
 *
 * @author imdadareeph
 */
public class FollowServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        FollowTable ftable = new FollowTable();
        Follow f = new Follow();
        try {
            HttpSession session = (HttpSession) request.getSession();
            Integer sessId =  (Integer)session.getAttribute("SessionId");
            int followerId = sessId.intValue();
            f.setFollowerId(followerId);
            int profileid=0;
            if(request.getParameter("fUserId")!=null){
                profileid = Integer.parseInt(request.getParameter("fUserId"));

                f.setUserId(profileid);
                ftable.insertFollow(f);
            }
            else if(request.getParameter("ufUserId")!=null){
                profileid = Integer.parseInt(request.getParameter("ufUserId"));

                f.setUserId(profileid);
                ftable.deleteFollow(f);
            } 
            if(ftable.getError() == null){
                RequestDispatcher rd = request.getRequestDispatcher("home?profileid="+profileid);
                rd.forward(request, response);
            }else{
                out.println("Follow failure");
            }
           /* boolean follow = ftable.isFollow(profileid,sessId.intValue());
            if(follow == false){
                out.println("<a href=\"javascript:followUser('false','"+profileid+"')\">Follow</a>");
            }else{
                out.println("<a href=\"javascript:followUser('true','"+profileid+"')\">UnFollow</a>");
            }*/

        } catch(Exception e){
            out.println(e.getMessage());
            out.println(ftable.getError());
        }finally {
            out.close();
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
