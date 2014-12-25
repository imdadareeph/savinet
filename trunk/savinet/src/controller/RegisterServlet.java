/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import model.UserTable;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author imdadareeph
 */
public class RegisterServlet extends HttpServlet {

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


        String[] countries = {"American", "Andorra", "Anguilla", "Bahrain", "Bermuda", "Canada",
            "Denmark", "Iceland", "India", "Mozambique", "Paraguay", "Syria"};
        String[] hobbies = {"Painting", "Listening Music", "Gardening", "Reading"};

        String[] games = {"Cricket", "Football", "Hockey", "Others"};

        String[] months = {"January", "February", "March", "August", "September", "October", "November",
            "December"};

        String[] educs = {"Bsc", "Bcom", "MCA", "BTech", "BE"};

        request.setAttribute("countries", countries);
        request.setAttribute("hobbies", hobbies);
        request.setAttribute("months", months);
        request.setAttribute("games", games);
        request.setAttribute("educs", educs);
        try {


            /* File uploading code */
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            
            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                out.println("multipart : " + isMultipart);

                //Created user object
                User user = new User();

                //Created user table object for insertion
                UserTable utable = new UserTable();

                //Setting the error object for catching errors
                Map errors = new HashMap();
                user.setErrors(errors);

                String dateStr = "", monthStr = "", yearStr = "",cpwd="";
                List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {

                    e.printStackTrace();
                }
                Iterator itr = items.iterator();
                while (itr.hasNext()) {


                    FileItem item = (FileItem) itr.next();

                    
                    if (item.isFormField()) {
                        String name = item.getFieldName();

                        if (name.equals("cpwd")) {
                            cpwd = item.getString();
                        }else if (name.equals("uname")) {
                            user.setUserName(item.getString());
                        } else if (name.equals("fname")) {
                            user.setFirstName(item.getString());
                        } else if (name.equals("ename")) {
                            user.setEmail(item.getString());
                        } else if (name.equals("add")) {
                            user.setAddress(item.getString());
                        } else if (name.equals("country")) {
                            user.setCountry(item.getString());
                        } else if (name.equals("date")) {
                            dateStr = item.getString();

                        } else if (name.equals("month")) {
                            monthStr = item.getString();
                        } else if (name.equals("year")) {
                            yearStr = item.getString();
                        } else if (name.equals("game")) {
                            user.setGame(item.getString());
                        } else if (name.equals("edu")) {
                            user.setEducation(item.getString());
                        } else if (name.equals("gender")) {
                            user.setGender(item.getString());
                        } else if (name.equals("phone")) {
                            user.setPhone(item.getString());
                        } else if (name.equals("pword")) {
                            user.setPassword(item.getString());
                        } else if (name.equals("hobby")) {
                            user.setHobby(item.getString());
                        }
                    } else if (item.getFieldName().equals("image")) {

                        user.setImage(item);
                    } 
                    
                }
                //Catching the error of password missmatch
                    if (!user.getPassword().equals(cpwd)) {
                    	System.out.println("password : "+user.getPassword()+"\nConfirm password : "+cpwd+"\n");
                        user.getErrors().put("pwdError", "Password miss match !");

                    }

                //Date of birth
                Date dob;
                try {
                    int date = Integer.parseInt(dateStr);
                    int month = Integer.parseInt(monthStr);
                    int year = Integer.parseInt(yearStr);

                    Calendar cal = Calendar.getInstance();
                    cal.set(year, month, date);
                    dob = new Date(cal.getTimeInMillis());

                } catch (NumberFormatException nfe) {
                    dob = null;
                }
                user.setDob(dob);
                String actCode = generateCode();
                user.setActCode(actCode);
                //Checking whether user exist or not
                utable.amIExists(user);
                if (user.getErrors().isEmpty()) {

                    utable.insertMe(user);
                    out.println("Registered table errors : " + utable.getError());


                    if (utable.getError() == null) {
                        RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
                        rd.forward(request, response);
                    }
                /*out.println("errors on user form");
                HashMap errs = (HashMap)user.getErrors();*/
                //out.println(utable.getError());
                } else {
                    request.setAttribute("user", user);
                    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                    rd.forward(request, response);
                }
            } else {

                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                rd.forward(request, response);
            }
        /*out.println("Registered table errors : " + utable.getError());
        out.println("Registered user errors : " + user.getErrors());*/
        } catch (Exception e) {
            out.println("Error " + e.getMessage());

        // RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
        // rd.forward(request, response);
        } finally {
            out.close();
        }

    }

    public String generateCode() {
        final int CODE_LENGTH = 6;
        StringBuffer sb = new StringBuffer();
        for (int x = 0; x < CODE_LENGTH; x++) {
            if (x == 1 || x == 3 || x == 5) {
                sb.append((char) ((int) (Math.random() * 26) + 97));
            } else {
                sb.append((int) (Math.random() * 10));
            }
        }
        return sb.toString();
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
