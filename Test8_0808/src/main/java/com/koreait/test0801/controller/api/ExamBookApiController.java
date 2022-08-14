package com.koreait.test0801.controller.api;



import com.koreait.test0801.controller.CrudController;
import com.koreait.test0801.model.entity.ExamBook;
import com.koreait.test0801.model.network.Header;
import com.koreait.test0801.model.network.request.ExamBookRequest;
import com.koreait.test0801.model.network.response.ExamBookResponse;
import com.koreait.test0801.service.ExamBookApiLogicService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/exambook")
@RequiredArgsConstructor
public class ExamBookApiController extends CrudController<ExamBookRequest, ExamBookResponse, ExamBook> {

    private final ExamBookApiLogicService examBookApiLogicService;

    @Override
    @PostMapping("")
    public Header<ExamBookResponse> create(@RequestBody Header<ExamBookRequest> request) {
        return examBookApiLogicService.create(request);
    }

    @Override
    @GetMapping("{idx}")
    public Header<ExamBookResponse> read(@PathVariable (name = "idx") Long idx) {
        return examBookApiLogicService.read(idx);
    }

    @Override
    @PutMapping("")
    public Header<ExamBookResponse> update(@RequestBody Header<ExamBookRequest> request) {
        return examBookApiLogicService.update(request);
    }

    @Override
    @DeleteMapping("{idx}")
    public Header<ExamBookResponse> delete(@PathVariable Long idx) {
        return examBookApiLogicService.delete(idx);
    }

    @GetMapping("")
    public Header<List<ExamBookResponse>> findAll(@PageableDefault(sort = {"bkUid"}, direction = Sort.Direction.DESC) Pageable pageable){
        return examBookApiLogicService.search(pageable);
    }


}
