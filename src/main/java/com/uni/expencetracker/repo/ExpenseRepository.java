package com.uni.expencetracker.repo;

import com.uni.expencetracker.models.Expense;
import com.uni.expencetracker.models.Income;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface ExpenseRepository extends JpaRepository<Expense, Long> {
    List<Expense> findByUserId(int userId);
    @Query("SELECT DATE_FORMAT(e.date, '%Y-%m') AS month, SUM(e.amount) AS total " +
            "FROM Expense e WHERE e.user.id = :userId GROUP BY month ORDER BY month")
    List<Object[]> findMonthlyExpenseSummary(@Param("userId") int userId);

    @Query("SELECT e.category, SUM(e.amount) AS total " +
            "FROM Expense e WHERE e.user.id = :userId GROUP BY e.category ORDER BY total DESC")
    List<Object[]> findCategoryWiseExpenseSummary(@Param("userId") int userId);

    @Query("SELECT COALESCE(SUM(e.amount), 0) FROM Expense e WHERE e.user.id = ?1 AND YEAR(e.date) = YEAR(CURRENT_DATE) AND MONTH(e.date) = MONTH(CURRENT_DATE)")
    Double getTotalExpenseForCurrentMonth(int userId);

    @Query("SELECT SUM(e.amount) FROM Expense e WHERE e.user.id = :userId")
    Double getTotalExpense(@Param("userId") int userId);

    @Query("SELECT i FROM Expense i WHERE i.user.id = :userId AND i.date BETWEEN :startDate AND :endDate")
    List<Expense> findByUserIdAndDateBetween(@Param("userId") int userId, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
}