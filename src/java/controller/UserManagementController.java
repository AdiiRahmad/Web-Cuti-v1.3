/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CutiDAO;
import dao.UserManagementDAO;
import entities.Usermanagement;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Siti Khusnul Azifah
 */
@WebServlet(name = "UserManagementController", urlPatterns = {"/userManagementController"})
public class UserManagementController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * Fungsi untuk mengontrol login user, dimana user dibagi ke dalam 3 level (admin, pimpinan, dan karyawan)
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Username = request.getParameter("txtUsername");
        String Pass = request.getParameter("txtPassword");
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        String category = "username";
        UserManagementDAO managementDAO = new UserManagementDAO();
        
        List<Object> datas = (List<Object>) managementDAO.search(category, Username);
        
        try (PrintWriter out = response.getWriter()) {
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
//            response.setHeader("Pragma", "no-cache");
//            response.setHeader("Expires", "0");
            if(session.getAttribute("username")==null)
            {
                dispatcher = request.getRequestDispatcher("login.jsp");
//                response.sendRedirect("V_Login.jsp");
                dispatcher.forward(request, response);
            }
            
            String send = "", pesan = "", hasil = "";
            String aksesadmin = "admin";
            String aksespimpinan = "pimpinan";
            String akseskaryawan = "karyawan";
            boolean login = managementDAO.login(category, Username, Pass);

            if (Username.equals("") || Pass.equals("")) {
                pesan = "Username dan Password Harus Terisi";
                hasil = "Gagal";
                send = "login.jsp";
            } else if (managementDAO.search(category, Username).isEmpty() || !managementDAO.login(category, Username, Pass)) {
                pesan = "Username atau Password Salah";
                hasil = "Gagal";
                send = "login.jsp";
            } else if (managementDAO.login(category, Username, Pass)) {
                for (Object data : datas) {
                    Usermanagement u = (Usermanagement) data;
                    if (u.getUsername().equals(Username)) {
                        if (u.getAkses().equals("admin")) {
                            RequestDispatcher dis = request.getRequestDispatcher("indexadmin.html");
                            Usermanagement um = new Usermanagement();
                            um.setUsername(Username);
                            session.setAttribute("username", um);
                            dis.forward(request, response);
                            pesan = "berhasil login" + Username;
//                            hasil = "Berhasil";
//                            send = "index.html";
                        } else if (u.getAkses().equals("pimpinan")) {
                            RequestDispatcher dis = request.getRequestDispatcher("indexpimpinan.html");
                            Usermanagement um = new Usermanagement();
                            um.setUsername(Username);
                            session.setAttribute("username", um);
                            dis.forward(request, response);
                            pesan = "berhasil login" + Username;
//                            hasil = "Berhasil";
//                            send = "cuti.jsp";
                        } else if (u.getAkses().equals("karyawan")) {
                            RequestDispatcher dis = request.getRequestDispatcher("indexkaryawan.html");
                            Usermanagement um = new Usermanagement();
                            um.setUsername(Username);
                            session.setAttribute("username", um);
                            dis.forward(request, response);
                            pesan = "berhasil login" + Username;
//                            hasil = "Berhasil";
//                            send = "detailcuti.jsp";
                        }
                    } 
                }

            }
            session.setAttribute("login", Username);
            session.setAttribute("pesan", pesan);
            dispatcher = request.getRequestDispatcher(send);
            dispatcher.include(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
