# User schema

# --- !Ups

create table user (
  id bigint not null primary key,
  email varchar(255) not null,
  name varchar(255) not null,
  password varchar(255) not null,
  token varchar(255) not null,
  token_created timestamp
);

create sequence user_seq;

# --- !Downs

drop table if exists user;
drop sequence if exists user_seq;
