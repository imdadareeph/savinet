/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FollowTable;
import model.User;
import model.UserTable;

/**
 *
 * @author imdadareeph
 */
public class HomeServlet extends HttpServlet {

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
        try {
            HttpSession session = (HttpSession) request.getSession();
            Integer sessId = (Integer) session.getAttribute("SessionId");
            if (sessId != null) {
                int profileid = sessId.intValue();
                if (request.getParameter("profileid") != null) {

                    try {
                        profileid = Integer.parseInt(request.getParameter("profileid"));
                    } catch (NumberFormatException nfe) {
                        profileid = sessId.intValue();
                    }
                }
                
                FollowTable ftable = new FollowTable();
                boolean follow = ftable.isFollow(profileid,sessId.intValue());
                Vector followers = ftable.getFollowersByUserId(profileid);
                Vector followees = ftable.getUsersByFollowerId(profileid);
                UserTable utable = new UserTable();
                User user = utable.getUserById(profileid);
                request.setAttribute("user", user);
                request.setAttribute("follow",follow);
                if(!followers.isEmpty())
                request.setAttribute("followers", followers);
                if(!followees.isEmpty())
                request.setAttribute("followees", followees);
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            out.println(e.getMessage());
        } finally {
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
