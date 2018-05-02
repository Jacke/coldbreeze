CREATE TABLE account (
    id         integer NOT NULL PRIMARY KEY,
    email      varchar NOT NULL UNIQUE,
    password   varchar NOT NULL,
    name       varchar NOT NULL,
    permission varchar NOT NULL
);

/*
CREATE TABLE user (
  id bigint(20) not null primary key,
  email varchar NOT NULL,
  name varchar NOT NULL,
  password varchar NOT NULL,
  token varchar NOT NULL,
  token_created timestamp
);

CREATE TABLE token (
  token varchar NOT NULL PRIMARY KEY,
  email varchar NOT NULL,
  action varchar NOT NULL,
  created timestamp NOT NULL default current_timestamp
);*/