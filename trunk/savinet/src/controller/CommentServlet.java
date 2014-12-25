/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Comment;
import model.CommentTable;
import model.FollowTable;
import model.Post;
import model.PostTable;

/**
 *
 * @author imdadareeph
 */
public class CommentServlet extends HttpServlet {

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

            String comment = request.getParameter("comm");
            String pidStr = request.getParameter("postId");
            int pid = Integer.parseInt(pidStr);

            //Retrieving user id from session
            HttpSession session = (HttpSession) request.getSession();
            int userId = (Integer) session.getAttribute("SessionId");
            //int userId = Integer.parseInt(userIdStr);
            //Ends here

            PostTable ptable = new PostTable();
            Post post = ptable.getPostById(pid);
            request.setAttribute("post", post);
            CommentTable ctable = new CommentTable();
            FollowTable ftable = new FollowTable();
            if (comment != null && !comment.equals("") && (ftable.isFollow(post.getUserId(),userId) || post.getUserId() == userId)) {

               
                Timestamp commDate = new java.sql.Timestamp(new java.util.Date().getTime());
                Comment c = new Comment();
                c.setPostId(pid);
                c.setUserId(userId);
                c.setContent(comment);
                c.setCommDate(commDate);
                ctable.insertComment(c);

            }
            Vector comments = ctable.getCommentsByPostId(pid);
            request.setAttribute("comments", comments);
            RequestDispatcher rd = request.getRequestDispatcher("seepost.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            out.println("error " + e.getMessage());
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
