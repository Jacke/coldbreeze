# --- !Ups

create table token (
  token varchar(255) not null primary key,
  email varchar(255) not null,
  action varchar(255) not null,
  created timestamp not null default current_timestamp
);

# --- !Downs

drop table if exists token;
