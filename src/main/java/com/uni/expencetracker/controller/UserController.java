package com.uni.expencetracker.controller;

import com.uni.expencetracker.models.Expense;
import com.uni.expencetracker.models.Income;
import com.uni.expencetracker.models.User;
import com.uni.expencetracker.services.ExpenseService;
import com.uni.expencetracker.services.IncomeService;
import com.uni.expencetracker.services.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private IncomeService incomeService;

    @Autowired
    private ExpenseService expenseService;

    // Login Signup Controller

    @GetMapping("/signup")
    public String signupForm() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(@RequestParam String name,
                         @RequestParam String username,
                         @RequestParam String email,
                         @RequestParam String password,
                         Model model) {
        if (userService.isUsernameTaken(username)) {
            model.addAttribute("message", "Username already exists");
            return "signup";
        }

        User user = new User();
        user.setName(name);
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);

        userService.saveUser(user);
        model.addAttribute("message", "Signup successful! Please login.");
        return "index";
    }

    @GetMapping("/login")
    public String home(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        User user = userService.findByUsername(username);

        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("user", user); // Add user to session
            return "redirect:/dashboard"; // Redirect to dashboard
        }

        model.addAttribute("message", "Invalid credentials");
        return "index";
    }



    // Dashboard n Report Controller

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }

        // Fetch current month's income and expense
        double currentMonthIncome = incomeService.getCurrentMonthIncome(user.getId());
        double currentMonthExpense = expenseService.getCurrentMonthExpense(user.getId());

        // Fetch total income and total expense
        double totalIncome = incomeService.getTotalIncome(user.getId());
        double totalExpense = expenseService.getTotalExpense(user.getId());

        // Calculate available balance
        double availableBalance = totalIncome - totalExpense;

        model.addAttribute("user", user);
        model.addAttribute("currentMonthIncome", currentMonthIncome);
        model.addAttribute("currentMonthExpense", currentMonthExpense);
        model.addAttribute("totalIncome", totalIncome);
        model.addAttribute("totalExpense", totalExpense);
        model.addAttribute("availableBalance", availableBalance);

        return "dashboard";
    }

    @GetMapping("/report")
    public String showAdvancedReport(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }

        // Fetch reports
        List<Object[]> monthlyIncome = incomeService.getMonthlyIncomeSummary(user.getId());
        List<Object[]> monthlyExpenses = expenseService.getMonthlyExpenseSummary(user.getId());
        List<Object[]> categoryExpenses = expenseService.getCategoryWiseExpenseSummary(user.getId());

        model.addAttribute("monthlyIncome", monthlyIncome);
        model.addAttribute("monthlyExpenses", monthlyExpenses);
        model.addAttribute("categoryExpenses", categoryExpenses);

        return "advanced_report";
    }

    // Income Controller

    @GetMapping("/income")
    public String showIncomePage(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }

        List<Income> incomes = incomeService.getIncomesByUserId(user.getId());
        model.addAttribute("incomes", incomes);
        return "income";
    }

    @PostMapping("/income")
    public String addIncome(@ModelAttribute Income income, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }

        income.setUser(user);
        income.setDate(new Date());
        incomeService.saveIncome(income);

        return "redirect:/income";
    }

    @PostMapping("/income/delete")
    public String deleteIncome(@RequestParam Long incomeId) {
        incomeService.deleteIncomeById(incomeId);
        return "redirect:/income";
    }

    @GetMapping("/income/filter")
    public String filterIncomeByDate(
            @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
            Model model,
            HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // Redirect to login if the user is not logged in
        }

        List<Income> filteredIncomes = incomeService.getIncomeByDateRange(user.getId(), startDate, endDate);
        model.addAttribute("incomes", filteredIncomes);
        return "income";
    }

    // Expense Controller

    @GetMapping("/expense")
    public String showExpensePage(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }

        List<Expense> expenses = expenseService.getExpensesByUserId(user.getId());
        model.addAttribute("expenses", expenses);
        return "expense";
    }

    @PostMapping("/expense")
    public String addExpense(@ModelAttribute Expense expense, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        expense.setUser(user);
        expense.setDate(new Date());
        expenseService.saveExpense(expense);

        return "redirect:/expense";
    }

    @PostMapping("/expense/delete")
    public String deleteExpense(@RequestParam("expenseId") Long expenseId) {
        expenseService.deleteExpenseById(expenseId);
        return "redirect:/expense"; // Redirect to the dashboard page or any other page
    }

    @GetMapping("/expense/filter")
    public String filterExpenseByDate(
            @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
            Model model,
            HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // Redirect to login if the user is not logged in
        }

        List<Expense> filteredExpenses = expenseService.getExpenseByDateRange(user.getId(), startDate, endDate);
        model.addAttribute("expenses", filteredExpenses);
        return "expense";
    }

}