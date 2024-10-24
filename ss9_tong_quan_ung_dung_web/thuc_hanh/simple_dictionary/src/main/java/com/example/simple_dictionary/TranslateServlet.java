package com.example.simple_dictionary;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TranslateServlet", value = "/translate")
public class TranslateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String> map = new HashMap<String, String>();
        map.put("hello", "xin chào");
        map.put("how", "thế nào");
        map.put("book", "quyển vở");
        map.put("black", "màu đen");
        map.put("while", "màu trắng");

        String search = req.getParameter("txtSearch");
        String result = map.get(search);
        String view = "";

        if (result != null) {
            view = "Từ " + search + " dịch là: "  + result;
        } else {
            view = "Không tìm thấy từ muốn dịch";
        }
        req.setAttribute("view", view);
        req.getRequestDispatcher("/result.jsp").forward(req, resp);
    }
}
