-- Table: launch_middlewares

-- DROP TABLE launch_middlewares;

CREATE TABLE launch_middlewares
(
  id bigserial NOT NULL,
  session_id integer NOT NULL,
  ident character varying NOT NULL,
  iface_ident character varying NOT NULL,
  reaction_id integer NOT NULL,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT launch_middlewares_pkey PRIMARY KEY (id),
  CONSTRAINT middleware_reaction_fk FOREIGN KEY (reaction_id)
      REFERENCES session_reactions (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT middleware_reaction_session_fk FOREIGN KEY (session_id)
      REFERENCES bpsessions (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE launch_middlewares
  OWNER TO postgres;


-- Table: launch_strategies

-- DROP TABLE launch_strategies;

CREATE TABLE launch_strategies
(
  id bigserial NOT NULL,
  session_id integer NOT NULL,
  ident character varying NOT NULL,
  middleware_id bigint NOT NULL,
  is_null_strategy boolean NOT NULL,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT launch_strategies_pkey PRIMARY KEY (id),
  CONSTRAINT launch_strategy_middleware_fk FOREIGN KEY (middleware_id)
      REFERENCES launch_middlewares (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT middleware_reaction_session_fk FOREIGN KEY (session_id)
      REFERENCES bpsessions (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE launch_strategies
  OWNER TO postgres;



-- Table: launch_strategy_bases

-- DROP TABLE launch_strategy_bases;

CREATE TABLE launch_strategy_bases
(
  id bigserial NOT NULL,
  strategy_id bigint NOT NULL,
  key character varying NOT NULL,
  base_type character varying NOT NULL,
  value_type character varying NOT NULL,
  value_content character varying NOT NULL,
  validation_scheme character varying,
  validation_pattern character varying,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT launch_strategy_bases_pkey PRIMARY KEY (id),
  CONSTRAINT launch_strategy_bases_unit_strategy_fk FOREIGN KEY (strategy_id)
      REFERENCES launch_strategies (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE launch_strategy_bases
  OWNER TO postgres;


-- Table: launch_strategy_inputs

-- DROP TABLE launch_strategy_inputs;

CREATE TABLE launch_strategy_inputs
(
  id bigserial NOT NULL,
  strategy_id bigint NOT NULL,
  op character varying NOT NULL,
  title character varying NOT NULL,
  "desc" character varying,
  ident character varying NOT NULL,
  target_type character varying NOT NULL,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT launch_strategy_inputs_pkey PRIMARY KEY (id),
  CONSTRAINT launch_strategy_inputs_unit_strategy_fk FOREIGN KEY (strategy_id)
      REFERENCES launch_strategies (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE launch_strategy_inputs
  OWNER TO postgres;


-- Table: launch_strategy_outputs

-- DROP TABLE launch_strategy_outputs;

CREATE TABLE launch_strategy_outputs
(
  id bigserial NOT NULL,
  strategy_id bigint NOT NULL,
  op character varying NOT NULL,
  title character varying NOT NULL,
  "desc" character varying,
  ident character varying NOT NULL,
  target_type character varying NOT NULL,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  CONSTRAINT launch_strategy_outputs_pkey PRIMARY KEY (id),
  CONSTRAINT launch_strategy_outputs_unit_strategy_fk FOREIGN KEY (strategy_id)
      REFERENCES launch_strategies (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE launch_strategy_outputs
  OWNER TO postgres;
