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
import model.UserTable;

/**
 *
 * @author imdadareeph
 */
public class LoginServlet extends HttpServlet {
   
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
            if(request.getMethod().toString().equals("POST")){


           String username = request.getParameter("uname");
           String passwd   = request.getParameter("pwd");
           //out.println("u"+username +"p"+passwd);
           UserTable utable = new UserTable();
           boolean login = utable.loginMe(username, passwd);
           
           if(login){
               HttpSession session = request.getSession();
               session.setAttribute("SessionId", utable.getSessionId());
               RequestDispatcher rd = request.getRequestDispatcher("home");
               rd.forward(request, response);
               //response.sendRedirect("home.jsp");
               //out.print("Login Success !");
           }
           else{
               request.setAttribute("loginError","Login failed");
               RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
               rd.forward(request, response);
               //out.print("Login failed !"+ utable.getError());
           }
            }
            else{
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
               rd.forward(request, response);
            }
        }
        catch(Exception e){
            out.println(e.getMessage());
        }
        finally {
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
