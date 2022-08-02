
create table exam_book (
    bk_uid number(7) primary key,
    bk_title VARCHAR2(20) not null,
    bk_summary VARCHAR2(2000),
    bk_price number(7) default 0,
    bk_viewcnt number(7) default 0,
    bk_regdate date default sysdate,
    constraint pk_price check(bk_price>=0),
    constraint pk_viewcnt check(bk_viewcnt>=0)
);

create sequence exam_book_seq
    increment by 1
    start with 1;
drop table exam_book;
drop sequence exam_book_seq;
select * from exam_book;
