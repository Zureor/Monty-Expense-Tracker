package com.uni.expencetracker.services;



import com.uni.expencetracker.models.Income;
import com.uni.expencetracker.repo.IncomeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class IncomeService {
    @Autowired
    private IncomeRepository incomeRepository;

    public List<Income> getIncomesByUserId(int userId) {
        return incomeRepository.findByUserId(userId);
    }

    public Income saveIncome(Income income) {
        return incomeRepository.save(income);
    }


    //advanced report
    public List<Object[]> getMonthlyIncomeSummary(int userId) {
        return incomeRepository.findMonthlyIncomeSummary(userId);
    }

    public double getCurrentMonthIncome(int userId) {
        Double income = incomeRepository.getTotalIncomeForCurrentMonth(userId);
        return (income != null) ? income : 0.0; // Default to 0.0 if null
    }

    public double getTotalIncome(int userId) {
        Double income = incomeRepository.getTotalIncome(userId);
        return (income != null) ? income : 0.0;
    }

    public void deleteIncomeById(Long incomeId) {
        incomeRepository.deleteById(incomeId);
    }


    public List<Income> getIncomeByDateRange(int userId, Date startDate, Date endDate) {
        return incomeRepository.findByUserIdAndDateBetween(userId, startDate, endDate);
    }
}