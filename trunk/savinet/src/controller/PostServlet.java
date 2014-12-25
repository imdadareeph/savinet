/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Post;
import model.PostTable;
import model.User;

/**
 *
 * @author imdadareeph
 */
public class PostServlet extends HttpServlet {

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
        PostTable ptable = new PostTable();
        HttpSession session = (HttpSession) request.getSession();
        User user = (User) session.getAttribute("SessionId");
        //Map allPosts = ptable.getPostsByUserId(userId);     
        

        try {
            String postIt = request.getMethod().toString();
            out.print("post"+ postIt);
            if (postIt.equals("POST")) {
                String title = request.getParameter("title");
                String content = request.getParameter("content");


                
                    
                    Timestamp postedDate = new java.sql.Timestamp(new java.util.Date().getTime());
                    Post post = new Post();
                    //Setting the error object for catching errors
                    Map errors = new HashMap();
                    post.setErrors(errors);
                    post.setUserId(user.getUserId());
                    post.setTitle(title);
                    post.setContent(content);
                    post.setPostedDate(postedDate);


                    if(post.getErrors().isEmpty()){
                        
                        ptable.insertPost(post);
                    }
                    else{
                        request.setAttribute("post",post); 
                    }
            } 
            Vector allPosts = ptable.getPostsByUserId(user.getUserId());
            
            request.setAttribute("allPosts", allPosts);
            RequestDispatcher rd = request.getRequestDispatcher("post.jsp");
            rd.forward(request, response);
            
        } catch (Exception e) {
            out.println("exception : "+ptable.getError()+" : "+e.getMessage());
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
