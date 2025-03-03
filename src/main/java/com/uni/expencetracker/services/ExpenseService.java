package com.uni.expencetracker.services;

import com.uni.expencetracker.models.Expense;
import com.uni.expencetracker.models.Income;
import com.uni.expencetracker.repo.ExpenseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ExpenseService {
    @Autowired
    private ExpenseRepository expenseRepository;

    public List<Expense> getExpensesByUserId(int userId) {
        return expenseRepository.findByUserId(userId);
    }

    public Expense saveExpense(Expense expense) {
        return expenseRepository.save(expense);
    }

    //advanced
    public List<Object[]> getMonthlyExpenseSummary(int userId) {
        return expenseRepository.findMonthlyExpenseSummary(userId);
    }

    public List<Object[]> getCategoryWiseExpenseSummary(int userId) {
        return expenseRepository.findCategoryWiseExpenseSummary(userId);
    }

    public double getCurrentMonthExpense(int userId) {
        return expenseRepository.getTotalExpenseForCurrentMonth(userId);
    }

    public double getTotalExpense(int userId) {
        Double expense = expenseRepository.getTotalExpense(userId);
        return (expense != null) ? expense : 0.0;
    }

    public void deleteExpenseById(Long expenseId) {
        expenseRepository.deleteById(expenseId);
    }

    public List<Expense> getExpenseByDateRange(int userId, Date startDate, Date endDate) {
        return expenseRepository.findByUserIdAndDateBetween(userId, startDate, endDate);
    }

}