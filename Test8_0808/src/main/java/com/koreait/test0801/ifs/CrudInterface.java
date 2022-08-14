package com.koreait.test0801.ifs;

import com.koreait.test0801.model.network.Header;

public interface CrudInterface<Req, Res> {
    Header<Res> create(Header<Req> request);
    Header<Res> read(Long idx);
    Header<Res> update(Header<Req> request);
    Header<Res> delete(Long idx);
}
