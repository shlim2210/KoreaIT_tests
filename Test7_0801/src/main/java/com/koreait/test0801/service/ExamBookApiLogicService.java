package com.koreait.test0801.service;

import com.koreait.test0801.model.entity.ExamBook;
import com.koreait.test0801.model.network.Header;
import com.koreait.test0801.model.network.Pagination;
import com.koreait.test0801.model.network.request.ExamBookRequest;
import com.koreait.test0801.model.network.response.ExamBookResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ExamBookApiLogicService extends BaseService<ExamBookRequest, ExamBookResponse, ExamBook> {


    private ExamBookResponse response(ExamBook examBook){
        ExamBookResponse examBookResponse = ExamBookResponse.builder()
                .bkUid(examBook.getBkUid())
                .bkTitle(examBook.getBkTitle())
                .bkSummary(examBook.getBkSummary())
                .bkPrice(examBook.getBkPrice())
                .bkViewcnt(examBook.getBkViewcnt())
                .bkRegdate(examBook.getBkRegdate())
                .build();
        return examBookResponse;
    }

    @Override
    public Header<ExamBookResponse> create(Header<ExamBookRequest> request) {
        ExamBookRequest examBookRequest = request.getData();
        if(examBookRequest.getBkTitle()!=null && examBookRequest.getBkPrice()!=null) {

            ExamBook examBook = ExamBook.builder()
                    .bkTitle(examBookRequest.getBkTitle())
                    .bkSummary(examBookRequest.getBkSummary())
                    .bkPrice(examBookRequest.getBkPrice())
                    .bkViewcnt(0)
                    .bkRegdate(LocalDateTime.now())
                    .build();

            return Optional.of(examBook).map(newExamBook -> baseRepository.save(newExamBook))
                    .map(newExamBook -> response(newExamBook)).map(Header::OK).orElseGet(() -> Header.ERROR("데이터 오류"));
        }else{
            return Header.ERROR("데이터를 추가할 수 없습니다");
        }
    }

    @Override
    public Header<ExamBookResponse> read(Long idx) {
        Optional<ExamBook> examBook = baseRepository.findById(idx);
        return examBook.map(
                newExamBook -> {
                            newExamBook.setBkViewcnt(newExamBook.getBkViewcnt()+1);
                            return newExamBook;
                        }).map(newExamBook -> baseRepository.save(newExamBook))
                .map(newExamBook -> response(newExamBook))
                .map(Header::OK).orElseGet(() -> Header.ERROR("데이터 없음"));
    }

    @Override
    public Header<ExamBookResponse> update(Header<ExamBookRequest> request) {
        ExamBookRequest examBookRequest = request.getData();
        if (examBookRequest.getBkTitle() != null && examBookRequest.getBkPrice() != null) {

            Optional<ExamBook> examBook = baseRepository.findById(examBookRequest.getBkUid());

            return examBook.map(
                            newExamBook -> {
                                newExamBook.setBkTitle(examBookRequest.getBkTitle());
                                newExamBook.setBkSummary(examBookRequest.getBkSummary());
                                newExamBook.setBkPrice(examBookRequest.getBkPrice());
                                return newExamBook;
                            }).map(newExamBook -> baseRepository.save(newExamBook))
                    .map(newExamBook -> response(newExamBook))
                    .map(Header::OK).orElseGet(() -> Header.ERROR("데이터 없음"));
        }else{
            return Header.ERROR("데이터를 수정할 수 없습니다");
        }
    }

    @Override
    public Header delete(Long idx) {
        Optional<ExamBook> examBook = baseRepository.findById(idx);
        return examBook.map(newExamBook -> {
            baseRepository.delete(newExamBook);
            return Header.OK();
        }).orElseGet(() -> Header.ERROR("데이터 없음"));
    }

    public Header<List<ExamBookResponse>> search(Pageable pageable){
        Page<ExamBook> examBooks = baseRepository.findAll(pageable);
        List<ExamBookResponse> examBookResponseList = examBooks.stream().map(
                examBook -> response(examBook)).collect(Collectors.toList());

        Pagination pagination = Pagination.builder()
                .totalPages(examBooks.getTotalPages())
                .totalElements(examBooks.getTotalElements())
                .currentPage(examBooks.getNumber())
                .currentElements(examBooks.getNumberOfElements())
                .build();
        return Header.OK(examBookResponseList, pagination);
    }


}
