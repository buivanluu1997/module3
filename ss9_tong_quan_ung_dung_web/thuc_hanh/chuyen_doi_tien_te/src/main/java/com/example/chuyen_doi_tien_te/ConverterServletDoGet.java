package com.example.chuyen_doi_tien_te;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ConverterServletDoGet", value = "/doget")
public class ConverterServletDoGet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float rate = Float.parseFloat(req.getParameter("rate"));
        float usd = Float.parseFloat(req.getParameter("usd"));
        float vnd = rate * usd;

        PrintWriter write = resp.getWriter();
        write.println("<html>");
        write.println("<h1> Rate: " + rate + "</h1>");
        write.println("<h1> USD: " + usd + "</h1>");
        write.println("<h1> VND: " + vnd + "</h1>");
    }
}
