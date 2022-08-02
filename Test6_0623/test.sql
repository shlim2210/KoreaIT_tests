use aidev;
show variables like 'c%';
##게시판
#회원
create table tb_member (
	mem_idx int auto_increment primary key,
    mem_userid varchar(20) unique not null,
    mem_userpw varchar(20) not null,
    mem_name varchar(20) not null,
    mem_hp varchar(20) not null,
    mem_email varchar(50) not null,
    mem_hobby varchar(100),
    mem_ssn1 char(6) not null,
    mem_ssn2 char(7) not null,
    mem_zipcode char(5),
    mem_address1 varchar(100),
    mem_address2 varchar(100),
    mem_address3 varchar(100),
	mem_regdate datetime default now()
);

select * from tb_member;

select mem_idx, mem_name from tb_member where mem_userid='apple';


#게시글
create table tb_board(
	b_idx int auto_increment primary key, 
    b_userid varchar(20) not null,
    b_name varchar(20) not null,
    b_title varchar(100) not null,
    b_content text not null,
    b_hit int default 0,
    b_regdate datetime default now()
);

drop table tb_board;
select * from tb_board;

select count(b_idx) as total from tb_board;

select b_idx from tb_board order by b_idx desc;

#댓글
create table tb_reply(
	re_idx int auto_increment primary key,
	re_userid varchar(20) not null,
	re_name varchar(20) not null,
	re_content varchar(2000) not null,
	re_regdate datetime default now(),
	re_boardidx int not null
);
drop table tb_reply;
select * from tb_reply;