package com.koreait.test0801.repository;


import com.koreait.test0801.model.entity.ExamBook;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ExamBookRepository extends JpaRepository<ExamBook, Long> {
    Optional<ExamBook> findByBkUid(Long bkUid);
}
