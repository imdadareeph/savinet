/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import model.UserTable;

/**
 *
 * @author imdadareeph
 */
public class AjaxSearchServlet extends HttpServlet {

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

            if (request.getParameter("searchStr") != null && !request.getParameter("searchStr").equals("")) {
                String str = request.getParameter("searchStr");
                UserTable utable = new UserTable();
                Vector users = utable.searchUserByName(str);
                int size = users.size();
                
                int column = 5;
                int row = (size / column)+1;
                if (size <= column) {
                    row = 1;
                    column = size;
                }

                Iterator it = users.iterator();
                out.println("<table>");
                for (int i = 0; i < row; i++) {

                    out.println("<tr>");
                    
                        int j=0;
                        while (it.hasNext()) {

                            User u = (User) it.next();
                            out.println("<td>");
                            out.println("<center><a href='home?profileid=" + u.getUserId() + "'>" +
                                    "<img src='myphoto?uid=" + u.getUserId() + "' width='50' height='80'/>" +
                                    "</a><br>"+u.getUserName()+"</center>");
                            out.println("</td>");
                            j++;
                            if(j==column) {out.println("</tr><tr>");j=0;}

                        }
                        out.println("</tr>");
                    
                    
                }
                out.println("</table>");
            }



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
