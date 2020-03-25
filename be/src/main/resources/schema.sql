
drop table if exists user;
create table user
(
    id bigint(20) not null AUTO_INCREMENT,
    userId varchar(32) not null,
    name varchar(32) not null,
    password varchar(32) not null,
    sex varchar(32) not null,
    email varchar(128) not null,
    phoneNumber varchar(128) not null,
    interest varchar(128) not null,
    dateOfBirth varchar(128) not null,
    primary key(id)
);
