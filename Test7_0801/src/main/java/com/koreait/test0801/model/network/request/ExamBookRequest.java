package com.koreait.test0801.model.network.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ExamBookRequest {
    private Long bkUid;
    private String bkTitle;
    private String bkSummary;
    private Integer bkPrice;
    private Integer bkViewcnt;
    private LocalDateTime bkRegdate;
}
