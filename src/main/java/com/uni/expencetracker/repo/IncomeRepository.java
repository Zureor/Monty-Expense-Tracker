package com.uni.expencetracker.repo;

import com.uni.expencetracker.models.Income;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface IncomeRepository extends JpaRepository<Income, Long> {
    List<Income> findByUserId(int userId);

    //advanced
    @Query("SELECT DATE_FORMAT(i.date, '%Y-%m') AS month, SUM(i.amount) AS total " +
            "FROM Income i WHERE i.user.id = :userId GROUP BY month ORDER BY month")
    List<Object[]> findMonthlyIncomeSummary(@Param("userId") int userId);

    @Query("SELECT SUM(i.amount) FROM Income i WHERE i.user.id = :userId AND YEAR(i.date) = YEAR(CURRENT_DATE) AND MONTH(i.date) = MONTH(CURRENT_DATE)")
    Double getTotalIncomeForCurrentMonth(@Param("userId") int userId);

    @Query("SELECT SUM(i.amount) FROM Income i WHERE i.user.id = :userId")
    Double getTotalIncome(@Param("userId") int userId);

    @Query("SELECT i FROM Income i WHERE i.user.id = :userId AND FUNCTION('MONTH', i.date) = :month AND FUNCTION('YEAR', i.date) = :year")
    List<Income> findByUserIdAndMonthAndYear(@Param("userId") int userId, @Param("month") int month, @Param("year") int year);

    @Query("SELECT i FROM Income i WHERE i.user.id = :userId AND i.date BETWEEN :startDate AND :endDate")
    List<Income> findByUserIdAndDateBetween(@Param("userId") int userId, @Param("startDate") Date startDate, @Param("endDate") Date endDate);

}

