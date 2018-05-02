-- New Auth system sql dump


CREATE TABLE logininfo
(
  id bigserial NOT NULL,
  "providerID" character varying NOT NULL,
  "providerKey" character varying NOT NULL,
  CONSTRAINT logininfo_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE logininfo
  OWNER TO postgres;


  CREATE TABLE oauth1info
  (
    id bigserial NOT NULL,
    token character varying NOT NULL,
    secret character varying NOT NULL,
    "loginInfoId" bigint NOT NULL,
    CONSTRAINT oauth1info_pkey PRIMARY KEY (id)
  )
  WITH (
    OIDS=FALSE
  );
  ALTER TABLE oauth1info
    OWNER TO postgres;

    CREATE TABLE oauth2info
    (
      id bigserial NOT NULL,
      accesstoken character varying NOT NULL,
      tokentype character varying,
      expiresin integer,
      refreshtoken character varying,
      logininfoid bigint NOT NULL,
      CONSTRAINT oauth2info_pkey PRIMARY KEY (id)
    )
    WITH (
      OIDS=FALSE
    );
    ALTER TABLE oauth2info
      OWNER TO postgres;

      CREATE TABLE openidattributes
      (
        id character varying NOT NULL,
        key character varying NOT NULL,
        value character varying NOT NULL
      )
      WITH (
        OIDS=FALSE
      );
      ALTER TABLE openidattributes
        OWNER TO postgres;

        CREATE TABLE openidinfo
        (
          id character varying NOT NULL,
          logininfoid bigint NOT NULL,
          CONSTRAINT openidinfo_pkey PRIMARY KEY (id)
        )
        WITH (
          OIDS=FALSE
        );
        ALTER TABLE openidinfo
          OWNER TO postgres;

          CREATE TABLE passwordinfo
          (
            hasher character varying NOT NULL,
            password character varying NOT NULL,
            salt character varying,
            "loginInfoId" bigint NOT NULL
          )
          WITH (
            OIDS=FALSE
          );
          ALTER TABLE passwordinfo
            OWNER TO postgres;

            CREATE TABLE "user"
            (
              "userID" character varying NOT NULL,
              "firstName" character varying,
              "lastName" character varying,
              "fullName" character varying,
              email character varying,
              "avatarURL" character varying,
              CONSTRAINT user_pkey PRIMARY KEY ("userID")
            )
            WITH (
              OIDS=FALSE
            );
            ALTER TABLE "user"
              OWNER TO postgres;

              CREATE TABLE userlogininfo
              (
                "userID" character varying NOT NULL,
                "loginInfoId" bigint NOT NULL
              )
              WITH (
                OIDS=FALSE
              );
              ALTER TABLE userlogininfo
                OWNER TO postgres;


CREATE SEQUENCE logininfo_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 4
  CACHE 1;
ALTER TABLE logininfo_id_seq
  OWNER TO postgres;

CREATE SEQUENCE oauth1info_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE oauth1info_id_seq
  OWNER TO postgres;

CREATE SEQUENCE oauth2info_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE oauth2info_id_seq
  OWNER TO postgres;
