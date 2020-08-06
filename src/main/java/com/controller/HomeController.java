package com.controller;


import com.model.Employee;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {


    static List<Object> listOfEmployee ;
    static {
        listOfEmployee = new ArrayList<>();
        listOfEmployee.add( new Employee("Haider","Associate Software Engineer"));
        listOfEmployee.add( new Employee("Siam","Associate Software Engineer"));
    }

    @RequestMapping("/")
    public String getHomePage(Model model){
        model.addAttribute("employeeList",listOfEmployee);
        model.addAttribute("newEmployee", new Employee());
        return "home";
    }

    @RequestMapping("/addNewEmployee")
    public String addNewEmployee(@ModelAttribute("newEmployee") Employee newEmployee){
        listOfEmployee.add(newEmployee);
        return "redirect:/";
    }

    @RequestMapping("/deleteEmployee/{employeeIndex}")
    public String deleteEmployee(@PathVariable("employeeIndex") int employeeIndex){
        listOfEmployee.remove(employeeIndex);
        return "redirect:/";
    }


}
