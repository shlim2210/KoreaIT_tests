# 데이터베이스 확인
show databases;

# 데이터베이스 선택
# use 데이터베이스명
use aidev;

create table tb_post(
	p_idx int auto_increment primary key, 
    p_userid varchar(20) not null,
    p_name varchar(20) not null,
    p_title varchar(100) not null,
    p_content text not null,
    p_userpw varchar(20) null,
    p_hit int default 0,
    p_regdate datetime default now()
);

#게시글
drop table tb_post;
select * from tb_post;

create table tb_replyPost(
	re_idx int auto_increment primary key,
	re_name varchar(20) not null,
	re_content varchar(200) not null,
	re_regdate datetime default now(),
	re_postidx int not null
);
drop table tb_replyPost;
select * from tb_replyPost;