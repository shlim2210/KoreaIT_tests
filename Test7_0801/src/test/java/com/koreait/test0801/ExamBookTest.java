package com.koreait.test0801;


import com.koreait.test0801.model.entity.ExamBook;
import com.koreait.test0801.repository.ExamBookRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class ExamBookTest extends Test0801ApplicationTests{

    @Autowired
    private ExamBookRepository examBookRepository;

    @Test
    public void create() {
        ExamBook examBook = new ExamBook();
        examBook.setBkTitle("자바초급");
        examBook.setBkSummary("자바초급자를 위한 도서입니다");
        examBook.setBkPrice(10000);
        examBook.setBkViewcnt(0);
        System.out.println("================= create() test =================");
        System.out.println(examBook.getBkTitle()+"이 정상적으로 등록되었습니다");
        System.out.println("=================================================");
        ExamBook newExamBook = examBookRepository.save(examBook);
    }

    @Test
    public void read() {
        Optional<ExamBook> examBook = examBookRepository.findByBkUid(25L);
        examBook.ifPresent(
                selectExamBook -> {
                    selectExamBook.setBkViewcnt(selectExamBook.getBkViewcnt()+1);
                    examBookRepository.save(selectExamBook);
                    System.out.println("================= read() test =================");
                    System.out.println("id : " + selectExamBook.getBkUid());
                    System.out.println("제목 : " + selectExamBook.getBkTitle());
                    System.out.println("상세정보 : " + selectExamBook.getBkSummary());
                    System.out.println("가격 : " + selectExamBook.getBkPrice());
                    System.out.println("조회수 : " + selectExamBook.getBkViewcnt());
                    System.out.println("등록일자 : " + selectExamBook.getBkRegdate());
                    System.out.println("===============================================");
                }
        );
    }

    @Test
    public void update() {
        Optional<ExamBook> examBook = examBookRepository.findByBkUid(26L);
        examBook.ifPresent(
                selectExamBook -> {
                    System.out.println("================= update() test =================");
                    selectExamBook.setBkTitle("기타 초급");
                    selectExamBook.setBkSummary("기타 초급자를 위한 도서입니다");
                    selectExamBook.setBkPrice(20000);
                    examBookRepository.save(selectExamBook);
                    System.out.println(selectExamBook.getBkUid()+"번 책이 정상적으로 수정되었습니다");
                    System.out.println("==================================================");
                }
        );
    }

    @Test
    public void delete() {
        Optional<ExamBook> examBook = examBookRepository.findByBkUid(25L);
        System.out.println("================= delete() test =================");
        examBook.ifPresent(
                selectExamBook -> {
                    examBookRepository.delete(selectExamBook);
                }
        );
        System.out.println("삭제되었습니다.");
        System.out.println("==================================================");

    }

    @Test
    public void search(){
        List<ExamBook> examBookList = examBookRepository.findAll();

        examBookList.forEach(
                examBook ->
                        System.out.println(
                                "=================================="
                                +"\nid : " + examBook.getBkUid()
                                + "\n제목 : " + examBook.getBkTitle()
                                + "\n상세정보 : " + examBook.getBkSummary()
                                +"\n가격 : " + examBook.getBkPrice()
                                +"\n조회수 : " + examBook.getBkViewcnt()
                                +"\n등록일자 : " + examBook.getBkRegdate()
                        )
        );
    }

}
