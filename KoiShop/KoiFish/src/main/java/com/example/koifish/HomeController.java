package com.example.koifish;


import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Collection;
import java.util.List;

@Controller
public class HomeController {
    //@Controller: Đánh dấu lớp này là một controller trong Spring MVC. Lớp này chịu trách nhiệm xử lý các yêu cầu HTTP và trả về các view.//
    @GetMapping("/") //Xử lý yêu cầu GET đến đường dẫn gốc (/)//
    public String home(Model model, HttpSession session) { //Được sử dụng để gửi dữ liệu từ controller đến view.// //Quản lý thông tin phiên (session) của người dùng.//
        session.setAttribute("islogin", false);

        String username = SecurityContextHolder.getContext().getAuthentication().getName(); //lấy thông tin người dùng//
        Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities(); //Lấy danh sách các quyền (roles) của người dùng.//

        System.out.println("Authenticated username: " + username);
        authorities.forEach(auth -> System.out.println("Authority: " + auth.getAuthority()));
//In tên người dùng và quyền của họ ra console.//
        if (authorities.stream().anyMatch(authority -> "ROLE_ADMIN".equals(authority.getAuthority()))) {
            model.addAttribute("email", username);
            return "redirect:/admin/home";
            //Nếu người dùng có quyền ROLE_ADMIN ----Điều hướng đến /admin/home.//
        } else if (authorities.stream().anyMatch(authority -> "ROLE_CLIENT".equals(authority.getAuthority()))) {
            model.addAttribute("email", username);
            return "redirect:/client/home";
            //Nếu người dùng có quyền ROLE_CLIENT---Điều hướng đến /client/home.//
        } else {
            return "guest/index";
            //Nếu không có quyền, trả về trang guest/index.//
        }
    }


    @GetMapping("/home")
    public String homePage(Model model, HttpSession session) {
        session.setAttribute("islogin", false);
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        if (authorities.stream().anyMatch(authority -> "ROLE_ADMIN".equals(authority.getAuthority()))) {
            model.addAttribute("email", SecurityContextHolder.getContext().getAuthentication().getName());
            return "redirect:/admin/home";
        } else if (authorities.stream().anyMatch(authority -> "ROLE_CLIENT".equals(authority.getAuthority()))) {
            model.addAttribute("email", username);
            return "redirect:/client/home";
        } else {
            return "guest/index";
        }
    }

    @GetMapping("/index") //Tương tự như home() và homePage(), nhưng xử lý yêu cầu GET đến đường dẫn /index.//
    public String index(Model model, HttpSession session) {
        session.setAttribute("islogin", false);

        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        if (authorities.stream().anyMatch(authority -> "ROLE_ADMIN".equals(authority.getAuthority()))) {
            model.addAttribute("email", SecurityContextHolder.getContext().getAuthentication().getName());
            return "redirect:/admin/home";
        } else if (authorities.stream().anyMatch(authority -> "ROLE_CLIENT".equals(authority.getAuthority()))) {
            model.addAttribute("email", username);
            return "redirect:/client/home";
        } else {
            return "guest/index";
        }
    }
}
