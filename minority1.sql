PGDMP             	            u         	   minority1    9.4.8    9.4.8 6   v           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            w           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            x           1262    16385 	   minority1    DATABASE     {   CREATE DATABASE minority1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE minority1;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            y           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            z           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    11865    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            {           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    17693    account_group    TABLE     �   CREATE TABLE account_group (
    id integer NOT NULL,
    account_id character varying(254),
    group_id integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    employee_id bigint NOT NULL
);
 !   DROP TABLE public.account_group;
       public         postgres    false    7            �            1259    17696    account_group_id_seq    SEQUENCE     v   CREATE SEQUENCE account_group_id_seq
    START WITH 9
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.account_group_id_seq;
       public       postgres    false    7    173            |           0    0    account_group_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE account_group_id_seq OWNED BY account_group.id;
            public       postgres    false    174            �            1259    17698    account_infos    TABLE     �  CREATE TABLE account_infos (
    id integer NOT NULL,
    uid character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    early_access boolean DEFAULT false NOT NULL,
    pro_features boolean DEFAULT false NOT NULL,
    workbench_id bigint,
    lang character varying(255),
    nickname character varying(255),
    country character varying(255),
    phone character varying(255)
);
 !   DROP TABLE public.account_infos;
       public         postgres    false    7            �            1259    17706    account_infos_id_seq    SEQUENCE     w   CREATE SEQUENCE account_infos_id_seq
    START WITH 16
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.account_infos_id_seq;
       public       postgres    false    7    175            }           0    0    account_infos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE account_infos_id_seq OWNED BY account_infos.id;
            public       postgres    false    176            �            1259    17708    account_loggers    TABLE     �   CREATE TABLE account_loggers (
    id integer NOT NULL,
    ip character varying(254) NOT NULL,
    user_agent character varying(254) NOT NULL,
    email character varying(254),
    date timestamp(6) with time zone NOT NULL
);
 #   DROP TABLE public.account_loggers;
       public         postgres    false    7            �            1259    17714    account_loggers_id_seq    SEQUENCE     z   CREATE SEQUENCE account_loggers_id_seq
    START WITH 796
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.account_loggers_id_seq;
       public       postgres    false    7    177            ~           0    0    account_loggers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE account_loggers_id_seq OWNED BY account_loggers.id;
            public       postgres    false    178            �            1259    17716    account_plan_history_id_seq    SEQUENCE     }   CREATE SEQUENCE account_plan_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.account_plan_history_id_seq;
       public       postgres    false    7            �            1259    17718    account_plan_history    TABLE     �   CREATE TABLE account_plan_history (
    id integer DEFAULT nextval('account_plan_history_id_seq'::regclass) NOT NULL,
    account_plan_id integer NOT NULL,
    limit_diff integer NOT NULL,
    plan_diff integer NOT NULL,
    bill_id integer NOT NULL
);
 (   DROP TABLE public.account_plan_history;
       public         postgres    false    179    7            �            1259    17722    account_plans    TABLE       CREATE TABLE account_plans (
    id integer NOT NULL,
    business_id integer NOT NULL,
    master_acc character varying(254) NOT NULL,
    plan_id integer NOT NULL,
    expired_at timestamp(6) with time zone NOT NULL,
    active boolean NOT NULL,
    "limit" integer NOT NULL
);
 !   DROP TABLE public.account_plans;
       public         postgres    false    7            �            1259    17725    account_plans_id_seq    SEQUENCE     w   CREATE SEQUENCE account_plans_id_seq
    START WITH 27
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.account_plans_id_seq;
       public       postgres    false    7    181                       0    0    account_plans_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE account_plans_id_seq OWNED BY account_plans.id;
            public       postgres    false    182            �            1259    17727    accounts    TABLE     �  CREATE TABLE accounts (
    "providerId" character varying(254) NOT NULL,
    "userId" character varying(254) NOT NULL,
    "firstName" character varying(254),
    "lastName" character varying(254),
    "fullName" character varying(254),
    email character varying(254),
    "avatarUrl" character varying(254),
    "authMethod" character varying(254) NOT NULL,
    token character varying(254),
    secret character varying(254),
    "accessToken" character varying(254),
    "tokenType" character varying(254),
    "expiresIn" integer,
    "refreshToken" character varying(254),
    hasher character varying(254) NOT NULL,
    password character varying(254) NOT NULL,
    salt character varying(254),
    lang character varying(254) NOT NULL,
    country character varying(254),
    phone character varying(254),
    nickname character varying(254),
    created_at timestamp(6) with time zone
);
    DROP TABLE public.accounts;
       public         postgres    false    7            �            1259    17733    billing_infos    TABLE     {  CREATE TABLE billing_infos (
    id integer NOT NULL,
    business_id integer NOT NULL,
    firstname character varying(254) NOT NULL,
    lastname character varying(254) NOT NULL,
    address character varying(254) NOT NULL,
    zipcode character varying(254) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);
 !   DROP TABLE public.billing_infos;
       public         postgres    false    7            �            1259    17739    billing_infos_id_seq    SEQUENCE     v   CREATE SEQUENCE billing_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.billing_infos_id_seq;
       public       postgres    false    184    7            �           0    0    billing_infos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE billing_infos_id_seq OWNED BY billing_infos.id;
            public       postgres    false    185            �            1259    17741    bills    TABLE     Q  CREATE TABLE bills (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    master_acc character varying(254) NOT NULL,
    assigned timestamp(6) with time zone NOT NULL,
    approved boolean NOT NULL,
    expired timestamp(6) with time zone NOT NULL,
    sum numeric(21,2) NOT NULL,
    workbench_id bigint NOT NULL
);
    DROP TABLE public.bills;
       public         postgres    false    7            �            1259    17747    bills_id_seq    SEQUENCE     n   CREATE SEQUENCE bills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.bills_id_seq;
       public       postgres    false    186    7            �           0    0    bills_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE bills_id_seq OWNED BY bills.id;
            public       postgres    false    187            �            1259    17749 	   bploggers    TABLE     �  CREATE TABLE bploggers (
    id integer NOT NULL,
    process_id integer NOT NULL,
    proc_element_id integer,
    space_element_id integer,
    "order" integer NOT NULL,
    space_id integer,
    station_id integer NOT NULL,
    invoked boolean NOT NULL,
    expanded boolean NOT NULL,
    container boolean NOT NULL,
    date timestamp(6) with time zone NOT NULL,
    step integer NOT NULL
);
    DROP TABLE public.bploggers;
       public         postgres    false    7            �            1259    17752    bploggers_id_seq    SEQUENCE     u   CREATE SEQUENCE bploggers_id_seq
    START WITH 1139
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.bploggers_id_seq;
       public       postgres    false    188    7            �           0    0    bploggers_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE bploggers_id_seq OWNED BY bploggers.id;
            public       postgres    false    189            �            1259    17754 
   bprocesses    TABLE     {  CREATE TABLE bprocesses (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    service_id integer NOT NULL,
    business_id integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    version bigint DEFAULT 1 NOT NULL,
    state_machine_type character varying(40) DEFAULT 'base'::character varying NOT NULL
);
    DROP TABLE public.bprocesses;
       public         postgres    false    7            �            1259    17759    bprocesses_id_seq    SEQUENCE     t   CREATE SEQUENCE bprocesses_id_seq
    START WITH 71
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.bprocesses_id_seq;
       public       postgres    false    7    190            �           0    0    bprocesses_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE bprocesses_id_seq OWNED BY bprocesses.id;
            public       postgres    false    191            �            1259    17761 
   bpsessions    TABLE     �   CREATE TABLE bpsessions (
    id integer NOT NULL,
    process_id integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    active_listed boolean DEFAULT false NOT NULL
);
    DROP TABLE public.bpsessions;
       public         postgres    false    7            �            1259    17765    bpsessions_id_seq    SEQUENCE     u   CREATE SEQUENCE bpsessions_id_seq
    START WITH 152
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.bpsessions_id_seq;
       public       postgres    false    7    192            �           0    0    bpsessions_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE bpsessions_id_seq OWNED BY bpsessions.id;
            public       postgres    false    193            �            1259    17767    bpspaces    TABLE     �  CREATE TABLE bpspaces (
    id integer NOT NULL,
    process_id integer NOT NULL,
    index integer NOT NULL,
    container boolean DEFAULT false NOT NULL,
    subbrick boolean DEFAULT false NOT NULL,
    brick_front_id integer,
    brick_nested_id integer,
    nesting_level integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);
    DROP TABLE public.bpspaces;
       public         postgres    false    7            �            1259    17772    bpspaces_id_seq    SEQUENCE     r   CREATE SEQUENCE bpspaces_id_seq
    START WITH 87
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.bpspaces_id_seq;
       public       postgres    false    194    7            �           0    0    bpspaces_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE bpspaces_id_seq OWNED BY bpspaces.id;
            public       postgres    false    195            �            1259    17774    bpstaterefs    TABLE     D  CREATE TABLE bpstaterefs (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    switch_type character varying(254) NOT NULL,
    priority integer DEFAULT 2 NOT NULL,
    state_id integer NOT NULL,
    session_state integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);
    DROP TABLE public.bpstaterefs;
       public         postgres    false    7            �            1259    17778    bpstaterefs_id_seq    SEQUENCE     t   CREATE SEQUENCE bpstaterefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.bpstaterefs_id_seq;
       public       postgres    false    196    7            �           0    0    bpstaterefs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE bpstaterefs_id_seq OWNED BY bpstaterefs.id;
            public       postgres    false    197            �            1259    17780    bpstates    TABLE       CREATE TABLE bpstates (
    id integer NOT NULL,
    process_id integer NOT NULL,
    title character varying(254) NOT NULL,
    neutral character varying(254) NOT NULL,
    is_process_state boolean DEFAULT false NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    lang character varying(254) DEFAULT 'en'::character varying NOT NULL,
    space_id integer,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    middle character varying(254) DEFAULT ''::character varying,
    middleable boolean DEFAULT false,
    oposite character varying(254) DEFAULT ''::character varying NOT NULL,
    opositable boolean DEFAULT false NOT NULL
);
    DROP TABLE public.bpstates;
       public         postgres    false    7            �            1259    17794    bpstates_id_seq    SEQUENCE     s   CREATE SEQUENCE bpstates_id_seq
    START WITH 346
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.bpstates_id_seq;
       public       postgres    false    198    7            �           0    0    bpstates_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE bpstates_id_seq OWNED BY bpstates.id;
            public       postgres    false    199            �            1259    17796    bpstation_loggers    TABLE     T  CREATE TABLE bpstation_loggers (
    id integer NOT NULL,
    station_id integer NOT NULL,
    process_id integer NOT NULL,
    sygnal character varying(254) NOT NULL,
    date timestamp(6) with time zone NOT NULL,
    state boolean NOT NULL,
    step integer NOT NULL,
    space integer NOT NULL,
    container_step integer[] NOT NULL,
    expand_step integer[] NOT NULL,
    spaces_ids integer[] NOT NULL,
    started boolean NOT NULL,
    finished boolean NOT NULL,
    inspace boolean NOT NULL,
    incontainer boolean NOT NULL,
    inexpands boolean NOT NULL,
    paused boolean NOT NULL
);
 %   DROP TABLE public.bpstation_loggers;
       public         postgres    false    7            �            1259    17802    bpstation_loggers_id_seq    SEQUENCE     }   CREATE SEQUENCE bpstation_loggers_id_seq
    START WITH 3150
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.bpstation_loggers_id_seq;
       public       postgres    false    200    7            �           0    0    bpstation_loggers_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE bpstation_loggers_id_seq OWNED BY bpstation_loggers.id;
            public       postgres    false    201            �            1259    17804 
   bpstations    TABLE     �  CREATE TABLE bpstations (
    id integer NOT NULL,
    process_id integer NOT NULL,
    state boolean NOT NULL,
    step integer NOT NULL,
    space integer NOT NULL,
    container_step integer[] NOT NULL,
    expand_step integer[] NOT NULL,
    spaces_ids integer[] NOT NULL,
    started boolean NOT NULL,
    finished boolean NOT NULL,
    inspace boolean NOT NULL,
    incontainer boolean NOT NULL,
    inexpands boolean NOT NULL,
    paused boolean NOT NULL,
    note character varying(254),
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    canceled boolean DEFAULT false NOT NULL,
    session_id integer NOT NULL,
    front boolean
);
    DROP TABLE public.bpstations;
       public         postgres    false    7            �            1259    17811    bpstations_id_seq    SEQUENCE     u   CREATE SEQUENCE bpstations_id_seq
    START WITH 274
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.bpstations_id_seq;
       public       postgres    false    202    7            �           0    0    bpstations_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE bpstations_id_seq OWNED BY bpstations.id;
            public       postgres    false    203            �            1259    17813    bpswitchers    TABLE     �  CREATE TABLE bpswitchers (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    switch_type character varying(254) NOT NULL,
    priority integer DEFAULT 2 NOT NULL,
    state_id integer NOT NULL,
    session_state integer,
    fn character varying(254) NOT NULL,
    target character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    override_group integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.bpswitchers;
       public         postgres    false    7            �            1259    17821    bpswitchers_id_seq    SEQUENCE     v   CREATE SEQUENCE bpswitchers_id_seq
    START WITH 190
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.bpswitchers_id_seq;
       public       postgres    false    7    204            �           0    0    bpswitchers_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE bpswitchers_id_seq OWNED BY bpswitchers.id;
            public       postgres    false    205            �            1259    17823    business_services    TABLE     �   CREATE TABLE business_services (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    business_id integer NOT NULL,
    master_acc character varying(254) NOT NULL
);
 %   DROP TABLE public.business_services;
       public         postgres    false    7            �            1259    17829    business_services_id_seq    SEQUENCE     {   CREATE SEQUENCE business_services_id_seq
    START WITH 46
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.business_services_id_seq;
       public       postgres    false    206    7            �           0    0    business_services_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE business_services_id_seq OWNED BY business_services.id;
            public       postgres    false    207            �            1259    17831 
   businesses    TABLE     �  CREATE TABLE businesses (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    phone character varying(254),
    website character varying(254),
    country character varying(254) NOT NULL,
    city character varying(254) NOT NULL,
    address character varying(254),
    walkthrough boolean NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    nickname character varying(254),
    org boolean DEFAULT false
);
    DROP TABLE public.businesses;
       public         postgres    false    7            �            1259    17838    businesses_id_seq    SEQUENCE     t   CREATE SEQUENCE businesses_id_seq
    START WITH 28
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.businesses_id_seq;
       public       postgres    false    7    208            �           0    0    businesses_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE businesses_id_seq OWNED BY businesses.id;
            public       postgres    false    209            �            1259    17840    cached_removed_resources    TABLE     n  CREATE TABLE cached_removed_resources (
    id integer NOT NULL,
    scope character varying NOT NULL,
    scope_type character varying NOT NULL,
    action character varying NOT NULL,
    what character varying NOT NULL,
    what_id character varying NOT NULL,
    date timestamp(6) without time zone NOT NULL,
    "updatedAttributes" character varying NOT NULL
);
 ,   DROP TABLE public.cached_removed_resources;
       public         postgres    false    7            �            1259    17846    cached_removed_resources_id_seq    SEQUENCE     �   CREATE SEQUENCE cached_removed_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.cached_removed_resources_id_seq;
       public       postgres    false    7    210            �           0    0    cached_removed_resources_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE cached_removed_resources_id_seq OWNED BY cached_removed_resources.id;
            public       postgres    false    211            �            1259    17848    client_observers    TABLE     d   CREATE TABLE client_observers (
    id integer NOT NULL,
    uid character varying(254) NOT NULL
);
 $   DROP TABLE public.client_observers;
       public         postgres    false    7            �            1259    17851    client_observers_id_seq    SEQUENCE     y   CREATE SEQUENCE client_observers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.client_observers_id_seq;
       public       postgres    false    7    212            �           0    0    client_observers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE client_observers_id_seq OWNED BY client_observers.id;
            public       postgres    false    213            �            1259    17853    elem_topologs    TABLE     '  CREATE TABLE elem_topologs (
    id integer NOT NULL,
    process_id integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    hash character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    space_id integer
);
 !   DROP TABLE public.elem_topologs;
       public         postgres    false    7            �            1259    17856    elem_topologs_id_seq    SEQUENCE     x   CREATE SEQUENCE elem_topologs_id_seq
    START WITH 134
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.elem_topologs_id_seq;
       public       postgres    false    7    214            �           0    0    elem_topologs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE elem_topologs_id_seq OWNED BY elem_topologs.id;
            public       postgres    false    215            �            1259    17858    element_resources    TABLE     9  CREATE TABLE element_resources (
    id integer NOT NULL,
    element_id integer NOT NULL,
    process_id integer NOT NULL,
    resource_id integer NOT NULL,
    entities character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 %   DROP TABLE public.element_resources;
       public         postgres    false    7            �            1259    17865    element_resources_id_seq    SEQUENCE     z   CREATE SEQUENCE element_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.element_resources_id_seq;
       public       postgres    false    216    7            �           0    0    element_resources_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE element_resources_id_seq OWNED BY element_resources.id;
            public       postgres    false    217            �            1259    17867 	   employees    TABLE     �   CREATE TABLE employees (
    id bigint NOT NULL,
    uid character varying(254) NOT NULL,
    master_acc character varying(254) NOT NULL,
    "position" character varying(254),
    manager boolean NOT NULL,
    workbench_id bigint DEFAULT 0 NOT NULL
);
    DROP TABLE public.employees;
       public         postgres    false    7            �            1259    17874    employees_businesses    TABLE     j   CREATE TABLE employees_businesses (
    employee_id integer NOT NULL,
    business_id integer NOT NULL
);
 (   DROP TABLE public.employees_businesses;
       public         postgres    false    7            �            1259    17877    employees_id_seq    SEQUENCE     s   CREATE SEQUENCE employees_id_seq
    START WITH 37
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public       postgres    false    218    7            �           0    0    employees_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE employees_id_seq OWNED BY employees.id;
            public       postgres    false    220            �            1259    17879    groups    TABLE     �   CREATE TABLE groups (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    business_id integer NOT NULL
);
    DROP TABLE public.groups;
       public         postgres    false    7            �            1259    17882    groups_id_seq    SEQUENCE     p   CREATE SEQUENCE groups_id_seq
    START WITH 24
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public       postgres    false    7    221            �           0    0    groups_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE groups_id_seq OWNED BY groups.id;
            public       postgres    false    222            �            1259    17884    input_id_seq    SEQUENCE     p   CREATE SEQUENCE input_id_seq
    START WITH 264
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.input_id_seq;
       public       postgres    false    7            �            1259    17886    input_loggers    TABLE     �  CREATE TABLE input_loggers (
    id integer NOT NULL,
    uid character varying(254),
    action character varying(254) NOT NULL,
    arguments text[] NOT NULL,
    reaction_id integer NOT NULL,
    input integer DEFAULT nextval('input_id_seq'::regclass) NOT NULL,
    date timestamp(6) with time zone NOT NULL,
    session_id integer NOT NULL,
    input_id integer DEFAULT nextval('input_id_seq'::regclass)
);
 !   DROP TABLE public.input_loggers;
       public         postgres    false    223    223    7            �            1259    17894    input_loggers_id_seq    SEQUENCE     x   CREATE SEQUENCE input_loggers_id_seq
    START WITH 144
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.input_loggers_id_seq;
       public       postgres    false    224    7            �           0    0    input_loggers_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE input_loggers_id_seq OWNED BY input_loggers.id;
            public       postgres    false    225            �            1259    17896    launch_counters    TABLE     �   CREATE TABLE launch_counters (
    id bigint NOT NULL,
    process_id integer NOT NULL,
    count bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 #   DROP TABLE public.launch_counters;
       public         postgres    false    7            �            1259    17899    launch_counters_id_seq    SEQUENCE     x   CREATE SEQUENCE launch_counters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.launch_counters_id_seq;
       public       postgres    false    226    7            �           0    0    launch_counters_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE launch_counters_id_seq OWNED BY launch_counters.id;
            public       postgres    false    227            �            1259    17901    launch_shares    TABLE     �   CREATE TABLE launch_shares (
    id bigint NOT NULL,
    title integer NOT NULL,
    price integer NOT NULL,
    description character varying NOT NULL
);
 !   DROP TABLE public.launch_shares;
       public         postgres    false    7            �            1259    17907    launch_shares_id_seq    SEQUENCE     v   CREATE SEQUENCE launch_shares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.launch_shares_id_seq;
       public       postgres    false    7    228            �           0    0    launch_shares_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE launch_shares_id_seq OWNED BY launch_shares.id;
            public       postgres    false    229            �            1259    17909    launch_warps    TABLE     �   CREATE TABLE launch_warps (
    id integer NOT NULL,
    launch_id integer NOT NULL,
    launch_element_id integer,
    board_id character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
     DROP TABLE public.launch_warps;
       public         postgres    false    7            �            1259    17915    launch_warps_id_seq    SEQUENCE     u   CREATE SEQUENCE launch_warps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.launch_warps_id_seq;
       public       postgres    false    7    230            �           0    0    launch_warps_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE launch_warps_id_seq OWNED BY launch_warps.id;
            public       postgres    false    231            �            1259    17917 	   logininfo    TABLE     �   CREATE TABLE logininfo (
    id bigint NOT NULL,
    "providerID" character varying NOT NULL,
    "providerKey" character varying NOT NULL
);
    DROP TABLE public.logininfo;
       public         postgres    false    7            �            1259    17923    logininfo_id_seq    SEQUENCE     r   CREATE SEQUENCE logininfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.logininfo_id_seq;
       public       postgres    false    7    232            �           0    0    logininfo_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE logininfo_id_seq OWNED BY logininfo.id;
            public       postgres    false    233            �            1259    17925 
   oauth1info    TABLE     �   CREATE TABLE oauth1info (
    id bigint NOT NULL,
    token character varying NOT NULL,
    secret character varying NOT NULL,
    "loginInfoId" bigint NOT NULL
);
    DROP TABLE public.oauth1info;
       public         postgres    false    7            �            1259    17931    oauth1info_id_seq    SEQUENCE     s   CREATE SEQUENCE oauth1info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.oauth1info_id_seq;
       public       postgres    false    7    234            �           0    0    oauth1info_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE oauth1info_id_seq OWNED BY oauth1info.id;
            public       postgres    false    235            �            1259    17933 
   oauth2info    TABLE     �   CREATE TABLE oauth2info (
    id bigint NOT NULL,
    accesstoken character varying NOT NULL,
    tokentype character varying,
    expiresin integer,
    refreshtoken character varying,
    logininfoid bigint NOT NULL
);
    DROP TABLE public.oauth2info;
       public         postgres    false    7            �            1259    17939    oauth2info_id_seq    SEQUENCE     s   CREATE SEQUENCE oauth2info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.oauth2info_id_seq;
       public       postgres    false    7    236            �           0    0    oauth2info_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE oauth2info_id_seq OWNED BY oauth2info.id;
            public       postgres    false    237            �            1259    17941 	   observers    TABLE     �   CREATE TABLE observers (
    id integer NOT NULL,
    station_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    hash_code character varying(254),
    "fullName" character varying(254) NOT NULL,
    created_at timestamp(6) with time zone
);
    DROP TABLE public.observers;
       public         postgres    false    7            �            1259    17947    observers_id_seq    SEQUENCE     r   CREATE SEQUENCE observers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.observers_id_seq;
       public       postgres    false    7    238            �           0    0    observers_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE observers_id_seq OWNED BY observers.id;
            public       postgres    false    239            �            1259    17949    openidattributes    TABLE     �   CREATE TABLE openidattributes (
    id character varying NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);
 $   DROP TABLE public.openidattributes;
       public         postgres    false    7            �            1259    17955 
   openidinfo    TABLE     `   CREATE TABLE openidinfo (
    id character varying NOT NULL,
    logininfoid bigint NOT NULL
);
    DROP TABLE public.openidinfo;
       public         postgres    false    7            �            1259    17961    passwordinfo    TABLE     �   CREATE TABLE passwordinfo (
    hasher character varying NOT NULL,
    password character varying NOT NULL,
    salt character varying,
    "loginInfoId" bigint NOT NULL
);
     DROP TABLE public.passwordinfo;
       public         postgres    false    7            �            1259    17967    plans    TABLE     !  CREATE TABLE plans (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    price numeric(21,2) NOT NULL,
    description character varying,
    slot_included integer DEFAULT 5 NOT NULL,
    "order" integer DEFAULT 1 NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);
    DROP TABLE public.plans;
       public         postgres    false    7            �            1259    17976    plans_id_seq    SEQUENCE     n   CREATE SEQUENCE plans_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.plans_id_seq;
       public       postgres    false    7    243            �           0    0    plans_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE plans_id_seq OWNED BY plans.id;
            public       postgres    false    244            �            1259    17978    proc_element_reflections    TABLE     �  CREATE TABLE proc_element_reflections (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    title character varying(254) NOT NULL,
    "desc" character varying(254) NOT NULL,
    b_type character varying(254) NOT NULL,
    type_title character varying(254) NOT NULL,
    ref_space_id integer,
    "order" integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);
 ,   DROP TABLE public.proc_element_reflections;
       public         postgres    false    7            �            1259    17984    proc_element_reflections_id_seq    SEQUENCE     �   CREATE SEQUENCE proc_element_reflections_id_seq
    START WITH 25
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.proc_element_reflections_id_seq;
       public       postgres    false    7    245            �           0    0    proc_element_reflections_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE proc_element_reflections_id_seq OWNED BY proc_element_reflections.id;
            public       postgres    false    246            �            1259    17986    proc_elements    TABLE     �  CREATE TABLE proc_elements (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    "desc" character varying(254) NOT NULL,
    business_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    b_type character varying(254) NOT NULL,
    type_title character varying(254) NOT NULL,
    space_id integer,
    "order" integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);
 !   DROP TABLE public.proc_elements;
       public         postgres    false    7            �            1259    17992    proc_elements_id_seq    SEQUENCE     x   CREATE SEQUENCE proc_elements_id_seq
    START WITH 248
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.proc_elements_id_seq;
       public       postgres    false    7    247            �           0    0    proc_elements_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE proc_elements_id_seq OWNED BY proc_elements.id;
            public       postgres    false    248            �            1259    17994    process_histories    TABLE       CREATE TABLE process_histories (
    id integer NOT NULL,
    master_acc character varying NOT NULL,
    action character varying NOT NULL,
    process_id integer,
    what character varying,
    what_id integer,
    date timestamp(6) with time zone NOT NULL
);
 %   DROP TABLE public.process_histories;
       public         postgres    false    7            �            1259    18000    process_histories_id_seq    SEQUENCE     {   CREATE SEQUENCE process_histories_id_seq
    START WITH 14
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.process_histories_id_seq;
       public       postgres    false    7    249            �           0    0    process_histories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE process_histories_id_seq OWNED BY process_histories.id;
            public       postgres    false    250            �            1259    18002    process_permissions    TABLE       CREATE TABLE process_permissions (
    id integer NOT NULL,
    uid character varying(254),
    group_id integer,
    bprocess integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    reaction_id integer,
    role character varying(254) NOT NULL
);
 '   DROP TABLE public.process_permissions;
       public         postgres    false    7            �            1259    18008    process_permissions_id_seq    SEQUENCE     }   CREATE SEQUENCE process_permissions_id_seq
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.process_permissions_id_seq;
       public       postgres    false    7    251            �           0    0    process_permissions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE process_permissions_id_seq OWNED BY process_permissions.id;
            public       postgres    false    252            �            1259    18010    reaction_refs    TABLE     C  CREATE TABLE reaction_refs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    autostart boolean NOT NULL,
    element_id integer NOT NULL,
    state_ref_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    title character varying(254) NOT NULL
);
 !   DROP TABLE public.reaction_refs;
       public         postgres    false    7            �            1259    18013    reaction_refs_id_seq    SEQUENCE     v   CREATE SEQUENCE reaction_refs_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.reaction_refs_id_seq;
       public       postgres    false    253    7            �           0    0    reaction_refs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE reaction_refs_id_seq OWNED BY reaction_refs.id;
            public       postgres    false    254            �            1259    18015    reaction_state_out_refs    TABLE     ?  CREATE TABLE reaction_state_out_refs (
    id integer NOT NULL,
    reaction_id integer NOT NULL,
    state_ref integer NOT NULL,
    "on" boolean NOT NULL,
    on_rate integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    input boolean DEFAULT false NOT NULL
);
 +   DROP TABLE public.reaction_state_out_refs;
       public         postgres    false    7                        1259    18019    reaction_state_out_refs_id_seq    SEQUENCE     �   CREATE SEQUENCE reaction_state_out_refs_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.reaction_state_out_refs_id_seq;
       public       postgres    false    255    7            �           0    0    reaction_state_out_refs_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE reaction_state_out_refs_id_seq OWNED BY reaction_state_out_refs.id;
            public       postgres    false    256                       1259    18021    reaction_state_outs    TABLE     :  CREATE TABLE reaction_state_outs (
    id integer NOT NULL,
    reaction_id integer NOT NULL,
    state_id integer NOT NULL,
    "on" boolean NOT NULL,
    on_rate integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    input boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.reaction_state_outs;
       public         postgres    false    7                       1259    18025    reaction_state_outs_id_seq    SEQUENCE     }   CREATE SEQUENCE reaction_state_outs_id_seq
    START WITH 32
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.reaction_state_outs_id_seq;
       public       postgres    false    257    7            �           0    0    reaction_state_outs_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE reaction_state_outs_id_seq OWNED BY reaction_state_outs.id;
            public       postgres    false    258                       1259    18027 	   reactions    TABLE     =  CREATE TABLE reactions (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    autostart boolean NOT NULL,
    element_id integer NOT NULL,
    state_ref_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    title character varying(254) NOT NULL
);
    DROP TABLE public.reactions;
       public         postgres    false    7                       1259    18030    reactions_id_seq    SEQUENCE     s   CREATE SEQUENCE reactions_id_seq
    START WITH 41
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.reactions_id_seq;
       public       postgres    false    259    7            �           0    0    reactions_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE reactions_id_seq OWNED BY reactions.id;
            public       postgres    false    260                       1259    18032    reflected_elem_topologs    TABLE     4  CREATE TABLE reflected_elem_topologs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    hash character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    space_id integer
);
 +   DROP TABLE public.reflected_elem_topologs;
       public         postgres    false    7                       1259    18035    reflected_elem_topologs_id_seq    SEQUENCE     �   CREATE SEQUENCE reflected_elem_topologs_id_seq
    START WITH 22
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.reflected_elem_topologs_id_seq;
       public       postgres    false    261    7            �           0    0    reflected_elem_topologs_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE reflected_elem_topologs_id_seq OWNED BY reflected_elem_topologs.id;
            public       postgres    false    262                       1259    18037    refs    TABLE     |  CREATE TABLE refs (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    host character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    "desc" character varying(254),
    category character varying(254) DEFAULT 'Common'::character varying NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);
    DROP TABLE public.refs;
       public         postgres    false    7                       1259    18045    refs_id_seq    SEQUENCE     n   CREATE SEQUENCE refs_id_seq
    START WITH 27
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.refs_id_seq;
       public       postgres    false    7    263            �           0    0    refs_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE refs_id_seq OWNED BY refs.id;
            public       postgres    false    264            	           1259    18047 	   resources    TABLE     �   CREATE TABLE resources (
    id integer NOT NULL,
    title character varying NOT NULL,
    business_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.resources;
       public         postgres    false    7            
           1259    18053    resources_id_seq    SEQUENCE     r   CREATE SEQUENCE resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.resources_id_seq;
       public       postgres    false    7    265            �           0    0    resources_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE resources_id_seq OWNED BY resources.id;
            public       postgres    false    266                       1259    18055    session_elem_topologs    TABLE     E  CREATE TABLE session_elem_topologs (
    id integer NOT NULL,
    process_id integer NOT NULL,
    session_id integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    hash character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    space_id integer
);
 )   DROP TABLE public.session_elem_topologs;
       public         postgres    false    7                       1259    18061    session_elem_topologs_id_seq    SEQUENCE     ~   CREATE SEQUENCE session_elem_topologs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.session_elem_topologs_id_seq;
       public       postgres    false    7    267            �           0    0    session_elem_topologs_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE session_elem_topologs_id_seq OWNED BY session_elem_topologs.id;
            public       postgres    false    268                       1259    18063    session_element_resources    TABLE     j  CREATE TABLE session_element_resources (
    id integer NOT NULL,
    session_element_id integer NOT NULL,
    process_id integer NOT NULL,
    session_id integer NOT NULL,
    resource_id integer NOT NULL,
    entities character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 -   DROP TABLE public.session_element_resources;
       public         postgres    false    7                       1259    18070     session_element_resources_id_seq    SEQUENCE     �   CREATE SEQUENCE session_element_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.session_element_resources_id_seq;
       public       postgres    false    7    269            �           0    0     session_element_resources_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE session_element_resources_id_seq OWNED BY session_element_resources.id;
            public       postgres    false    270                       1259    18072    session_initial_states    TABLE     /  CREATE TABLE session_initial_states (
    id integer NOT NULL,
    process_id integer NOT NULL,
    session_id integer NOT NULL,
    title character varying NOT NULL,
    neutral character varying NOT NULL,
    is_process_state boolean DEFAULT false NOT NULL,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    ses_front_elem_id integer,
    ses_space_elem_id integer,
    ses_space_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    lang character varying DEFAULT 'en'::character varying NOT NULL,
    middle character varying DEFAULT ''::character varying NOT NULL,
    middleable boolean DEFAULT false NOT NULL,
    oposite character varying DEFAULT ''::character varying NOT NULL,
    opositable boolean DEFAULT false NOT NULL
);
 *   DROP TABLE public.session_initial_states;
       public         postgres    false    7                       1259    18086    session_initial_states_id_seq    SEQUENCE        CREATE SEQUENCE session_initial_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.session_initial_states_id_seq;
       public       postgres    false    7    271            �           0    0    session_initial_states_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE session_initial_states_id_seq OWNED BY session_initial_states.id;
            public       postgres    false    272                       1259    18088    session_proc_elements    TABLE     �  CREATE TABLE session_proc_elements (
    id integer NOT NULL,
    title character varying NOT NULL,
    "desc" character varying NOT NULL,
    business_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    session_id integer NOT NULL,
    b_type character varying NOT NULL,
    type_title character varying NOT NULL,
    space_id integer,
    "order" integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 )   DROP TABLE public.session_proc_elements;
       public         postgres    false    7                       1259    18094    session_proc_elements_id_seq    SEQUENCE     ~   CREATE SEQUENCE session_proc_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.session_proc_elements_id_seq;
       public       postgres    false    273    7            �           0    0    session_proc_elements_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE session_proc_elements_id_seq OWNED BY session_proc_elements.id;
            public       postgres    false    274                       1259    18096    session_reaction_state_outs    TABLE     D  CREATE TABLE session_reaction_state_outs (
    id integer NOT NULL,
    session_state_id integer NOT NULL,
    reaction_id integer NOT NULL,
    "on" boolean NOT NULL,
    on_rate integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    input boolean DEFAULT false NOT NULL
);
 /   DROP TABLE public.session_reaction_state_outs;
       public         postgres    false    7                       1259    18100 "   session_reaction_state_outs_id_seq    SEQUENCE     �   CREATE SEQUENCE session_reaction_state_outs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.session_reaction_state_outs_id_seq;
       public       postgres    false    7    275            �           0    0 "   session_reaction_state_outs_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE session_reaction_state_outs_id_seq OWNED BY session_reaction_state_outs.id;
            public       postgres    false    276                       1259    18102    session_reactions    TABLE     R  CREATE TABLE session_reactions (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    session_id integer NOT NULL,
    autostart boolean NOT NULL,
    element_id integer NOT NULL,
    state_ref_id integer,
    title character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 %   DROP TABLE public.session_reactions;
       public         postgres    false    7                       1259    18108    session_reactions_id_seq    SEQUENCE     z   CREATE SEQUENCE session_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.session_reactions_id_seq;
       public       postgres    false    7    277            �           0    0    session_reactions_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE session_reactions_id_seq OWNED BY session_reactions.id;
            public       postgres    false    278                       1259    18110    session_space_elements    TABLE       CREATE TABLE session_space_elements (
    id integer NOT NULL,
    title character varying NOT NULL,
    "desc" character varying NOT NULL,
    business_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    session_id integer NOT NULL,
    b_type character varying NOT NULL,
    type_title character varying NOT NULL,
    own_space_id integer,
    owned_space_id integer NOT NULL,
    space_role character varying,
    "order" integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 *   DROP TABLE public.session_space_elements;
       public         postgres    false    7                       1259    18116    session_space_elements_id_seq    SEQUENCE        CREATE SEQUENCE session_space_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.session_space_elements_id_seq;
       public       postgres    false    7    279            �           0    0    session_space_elements_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE session_space_elements_id_seq OWNED BY session_space_elements.id;
            public       postgres    false    280                       1259    18118    session_spaces    TABLE     �  CREATE TABLE session_spaces (
    id integer NOT NULL,
    process_id integer NOT NULL,
    session_id integer NOT NULL,
    index integer NOT NULL,
    container boolean DEFAULT false NOT NULL,
    subbrick boolean DEFAULT false NOT NULL,
    brick_front_id integer,
    brick_nested_id integer,
    nesting_level integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 "   DROP TABLE public.session_spaces;
       public         postgres    false    7                       1259    18123    session_spaces_id_seq    SEQUENCE     w   CREATE SEQUENCE session_spaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.session_spaces_id_seq;
       public       postgres    false    7    281            �           0    0    session_spaces_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE session_spaces_id_seq OWNED BY session_spaces.id;
            public       postgres    false    282                       1259    18125    session_state_logs    TABLE     [  CREATE TABLE session_state_logs (
    id integer NOT NULL,
    session_id integer NOT NULL,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    reason character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    state_id integer NOT NULL
);
 &   DROP TABLE public.session_state_logs;
       public         postgres    false    7                       1259    18130    session_state_logs_id_seq    SEQUENCE     }   CREATE SEQUENCE session_state_logs_id_seq
    START WITH 816
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.session_state_logs_id_seq;
       public       postgres    false    7    283            �           0    0    session_state_logs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE session_state_logs_id_seq OWNED BY session_state_logs.id;
            public       postgres    false    284                       1259    18132    session_switchers    TABLE     �  CREATE TABLE session_switchers (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    session_id integer NOT NULL,
    switch_type character varying NOT NULL,
    priority integer DEFAULT 2 NOT NULL,
    session_state_ref_id integer NOT NULL,
    session_state_id integer,
    fn character varying NOT NULL,
    target character varying NOT NULL,
    override_group integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 %   DROP TABLE public.session_switchers;
       public         postgres    false    7                       1259    18140    session_switchers_id_seq    SEQUENCE     z   CREATE SEQUENCE session_switchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.session_switchers_id_seq;
       public       postgres    false    285    7            �           0    0    session_switchers_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE session_switchers_id_seq OWNED BY session_switchers.id;
            public       postgres    false    286                       1259    18142    sessionstates    TABLE     �  CREATE TABLE sessionstates (
    id integer NOT NULL,
    process_id integer NOT NULL,
    session_id integer NOT NULL,
    title character varying(254) NOT NULL,
    neutral character varying(254) NOT NULL,
    is_process_state boolean DEFAULT false NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    lang character varying(254) DEFAULT 'en'::character varying NOT NULL,
    space_id integer,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    origin_state_id integer,
    middle character varying(253) DEFAULT ''::character varying NOT NULL,
    middleable boolean DEFAULT false NOT NULL,
    oposite character varying(254) DEFAULT ''::character varying NOT NULL,
    opositable boolean DEFAULT false NOT NULL,
    session_front_elem_id integer,
    session_space_id integer,
    session_space_elem_id integer
);
 !   DROP TABLE public.sessionstates;
       public         postgres    false    7                        1259    18156    sessionstates_id_seq    SEQUENCE     y   CREATE SEQUENCE sessionstates_id_seq
    START WITH 1332
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sessionstates_id_seq;
       public       postgres    false    287    7            �           0    0    sessionstates_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE sessionstates_id_seq OWNED BY sessionstates.id;
            public       postgres    false    288            !           1259    18158    space_element_reflections    TABLE     �  CREATE TABLE space_element_reflections (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    title character varying(254) NOT NULL,
    "desc" character varying(254) NOT NULL,
    b_type character varying(254) NOT NULL,
    type_title character varying(254) NOT NULL,
    ref_space_id integer,
    ref_space_owned_id integer NOT NULL,
    space_role character varying(254),
    "order" integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);
 -   DROP TABLE public.space_element_reflections;
       public         postgres    false    7            "           1259    18164     space_element_reflections_id_seq    SEQUENCE     �   CREATE SEQUENCE space_element_reflections_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.space_element_reflections_id_seq;
       public       postgres    false    289    7            �           0    0     space_element_reflections_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE space_element_reflections_id_seq OWNED BY space_element_reflections.id;
            public       postgres    false    290            #           1259    18166    space_elements    TABLE       CREATE TABLE space_elements (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    "desc" character varying(254) NOT NULL,
    business_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    b_type character varying(254) NOT NULL,
    type_title character varying(254) NOT NULL,
    own_space_id integer,
    owned_space_id integer NOT NULL,
    space_role character varying(254),
    "order" integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);
 "   DROP TABLE public.space_elements;
       public         postgres    false    7            $           1259    18172    space_elements_id_seq    SEQUENCE     x   CREATE SEQUENCE space_elements_id_seq
    START WITH 56
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.space_elements_id_seq;
       public       postgres    false    7    291            �           0    0    space_elements_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE space_elements_id_seq OWNED BY space_elements.id;
            public       postgres    false    292            %           1259    18174 
   space_refs    TABLE     d  CREATE TABLE space_refs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    index integer NOT NULL,
    container boolean NOT NULL,
    subbrick boolean NOT NULL,
    brick_front integer,
    brick_nested integer,
    "nestingLevel" integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);
    DROP TABLE public.space_refs;
       public         postgres    false    7            &           1259    18177    space_refs_id_seq    SEQUENCE     s   CREATE SEQUENCE space_refs_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.space_refs_id_seq;
       public       postgres    false    7    293            �           0    0    space_refs_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE space_refs_id_seq OWNED BY space_refs.id;
            public       postgres    false    294            '           1259    18179 
   state_refs    TABLE       CREATE TABLE state_refs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    title character varying(254) NOT NULL,
    neutral character varying(254) NOT NULL,
    process_state boolean DEFAULT false NOT NULL,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    ref_front_elem_id integer,
    ref_space_elem_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    lang character varying(254) DEFAULT 'en'::character varying NOT NULL,
    ref_space_id integer,
    middle character varying(254) DEFAULT ''::character varying,
    middleable boolean DEFAULT false,
    oposite character varying(254) DEFAULT ''::character varying NOT NULL,
    opositable boolean DEFAULT false NOT NULL
);
    DROP TABLE public.state_refs;
       public         postgres    false    7            (           1259    18193    state_refs_id_seq    SEQUENCE     t   CREATE SEQUENCE state_refs_id_seq
    START WITH 26
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.state_refs_id_seq;
       public       postgres    false    7    295            �           0    0    state_refs_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE state_refs_id_seq OWNED BY state_refs.id;
            public       postgres    false    296            )           1259    18195    switcher_refs    TABLE     �  CREATE TABLE switcher_refs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    switch_type character varying(254) NOT NULL,
    priority integer DEFAULT 2 NOT NULL,
    state_ref_id integer NOT NULL,
    fn character varying(254) NOT NULL,
    target character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    override_group integer DEFAULT 0 NOT NULL
);
 !   DROP TABLE public.switcher_refs;
       public         postgres    false    7            *           1259    18203    switcher_refs_id_seq    SEQUENCE     w   CREATE SEQUENCE switcher_refs_id_seq
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.switcher_refs_id_seq;
       public       postgres    false    297    7            �           0    0    switcher_refs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE switcher_refs_id_seq OWNED BY switcher_refs.id;
            public       postgres    false    298            +           1259    18205    tokens    TABLE       CREATE TABLE tokens (
    uuid character varying(254) NOT NULL,
    email character varying(254) NOT NULL,
    "creationTime" timestamp(6) without time zone NOT NULL,
    "expirationTime" timestamp(6) without time zone NOT NULL,
    "isSignUp" boolean NOT NULL
);
    DROP TABLE public.tokens;
       public         postgres    false    7            ,           1259    18211    user    TABLE     �   CREATE TABLE "user" (
    "userID" character varying NOT NULL,
    "firstName" character varying,
    "lastName" character varying,
    "fullName" character varying,
    email character varying,
    "avatarURL" character varying
);
    DROP TABLE public."user";
       public         postgres    false    7            -           1259    18217    userlogininfo    TABLE     k   CREATE TABLE userlogininfo (
    "userID" character varying NOT NULL,
    "loginInfoId" bigint NOT NULL
);
 !   DROP TABLE public.userlogininfo;
       public         postgres    false    7            	           2604    18223    id    DEFAULT     f   ALTER TABLE ONLY account_group ALTER COLUMN id SET DEFAULT nextval('account_group_id_seq'::regclass);
 ?   ALTER TABLE public.account_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    174    173            	           2604    18224    id    DEFAULT     f   ALTER TABLE ONLY account_infos ALTER COLUMN id SET DEFAULT nextval('account_infos_id_seq'::regclass);
 ?   ALTER TABLE public.account_infos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    176    175            	           2604    18225    id    DEFAULT     j   ALTER TABLE ONLY account_loggers ALTER COLUMN id SET DEFAULT nextval('account_loggers_id_seq'::regclass);
 A   ALTER TABLE public.account_loggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    178    177            	           2604    18226    id    DEFAULT     f   ALTER TABLE ONLY account_plans ALTER COLUMN id SET DEFAULT nextval('account_plans_id_seq'::regclass);
 ?   ALTER TABLE public.account_plans ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    182    181            	           2604    18227    id    DEFAULT     f   ALTER TABLE ONLY billing_infos ALTER COLUMN id SET DEFAULT nextval('billing_infos_id_seq'::regclass);
 ?   ALTER TABLE public.billing_infos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    184            	           2604    18228    id    DEFAULT     V   ALTER TABLE ONLY bills ALTER COLUMN id SET DEFAULT nextval('bills_id_seq'::regclass);
 7   ALTER TABLE public.bills ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    186            	           2604    18229    id    DEFAULT     ^   ALTER TABLE ONLY bploggers ALTER COLUMN id SET DEFAULT nextval('bploggers_id_seq'::regclass);
 ;   ALTER TABLE public.bploggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    188            	           2604    18230    id    DEFAULT     `   ALTER TABLE ONLY bprocesses ALTER COLUMN id SET DEFAULT nextval('bprocesses_id_seq'::regclass);
 <   ALTER TABLE public.bprocesses ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190            !	           2604    18231    id    DEFAULT     `   ALTER TABLE ONLY bpsessions ALTER COLUMN id SET DEFAULT nextval('bpsessions_id_seq'::regclass);
 <   ALTER TABLE public.bpsessions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    192            $	           2604    18232    id    DEFAULT     \   ALTER TABLE ONLY bpspaces ALTER COLUMN id SET DEFAULT nextval('bpspaces_id_seq'::regclass);
 :   ALTER TABLE public.bpspaces ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    194            &	           2604    18233    id    DEFAULT     b   ALTER TABLE ONLY bpstaterefs ALTER COLUMN id SET DEFAULT nextval('bpstaterefs_id_seq'::regclass);
 =   ALTER TABLE public.bpstaterefs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            /	           2604    18234    id    DEFAULT     \   ALTER TABLE ONLY bpstates ALTER COLUMN id SET DEFAULT nextval('bpstates_id_seq'::regclass);
 :   ALTER TABLE public.bpstates ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            0	           2604    18235    id    DEFAULT     n   ALTER TABLE ONLY bpstation_loggers ALTER COLUMN id SET DEFAULT nextval('bpstation_loggers_id_seq'::regclass);
 C   ALTER TABLE public.bpstation_loggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            2	           2604    18236    id    DEFAULT     `   ALTER TABLE ONLY bpstations ALTER COLUMN id SET DEFAULT nextval('bpstations_id_seq'::regclass);
 <   ALTER TABLE public.bpstations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202            5	           2604    18237    id    DEFAULT     b   ALTER TABLE ONLY bpswitchers ALTER COLUMN id SET DEFAULT nextval('bpswitchers_id_seq'::regclass);
 =   ALTER TABLE public.bpswitchers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            6	           2604    18238    id    DEFAULT     n   ALTER TABLE ONLY business_services ALTER COLUMN id SET DEFAULT nextval('business_services_id_seq'::regclass);
 C   ALTER TABLE public.business_services ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            8	           2604    18239    id    DEFAULT     `   ALTER TABLE ONLY businesses ALTER COLUMN id SET DEFAULT nextval('businesses_id_seq'::regclass);
 <   ALTER TABLE public.businesses ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            9	           2604    18240    id    DEFAULT     |   ALTER TABLE ONLY cached_removed_resources ALTER COLUMN id SET DEFAULT nextval('cached_removed_resources_id_seq'::regclass);
 J   ALTER TABLE public.cached_removed_resources ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            :	           2604    18241    id    DEFAULT     l   ALTER TABLE ONLY client_observers ALTER COLUMN id SET DEFAULT nextval('client_observers_id_seq'::regclass);
 B   ALTER TABLE public.client_observers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212            ;	           2604    18242    id    DEFAULT     f   ALTER TABLE ONLY elem_topologs ALTER COLUMN id SET DEFAULT nextval('elem_topologs_id_seq'::regclass);
 ?   ALTER TABLE public.elem_topologs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            =	           2604    18243    id    DEFAULT     n   ALTER TABLE ONLY element_resources ALTER COLUMN id SET DEFAULT nextval('element_resources_id_seq'::regclass);
 C   ALTER TABLE public.element_resources ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            ?	           2604    18244    id    DEFAULT     ^   ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    220    218            @	           2604    18245    id    DEFAULT     X   ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    222    221            C	           2604    18246    id    DEFAULT     f   ALTER TABLE ONLY input_loggers ALTER COLUMN id SET DEFAULT nextval('input_loggers_id_seq'::regclass);
 ?   ALTER TABLE public.input_loggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    225    224            D	           2604    18247    id    DEFAULT     j   ALTER TABLE ONLY launch_counters ALTER COLUMN id SET DEFAULT nextval('launch_counters_id_seq'::regclass);
 A   ALTER TABLE public.launch_counters ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    227    226            E	           2604    18248    id    DEFAULT     f   ALTER TABLE ONLY launch_shares ALTER COLUMN id SET DEFAULT nextval('launch_shares_id_seq'::regclass);
 ?   ALTER TABLE public.launch_shares ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    229    228            F	           2604    18249    id    DEFAULT     d   ALTER TABLE ONLY launch_warps ALTER COLUMN id SET DEFAULT nextval('launch_warps_id_seq'::regclass);
 >   ALTER TABLE public.launch_warps ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    231    230            G	           2604    18250    id    DEFAULT     ^   ALTER TABLE ONLY logininfo ALTER COLUMN id SET DEFAULT nextval('logininfo_id_seq'::regclass);
 ;   ALTER TABLE public.logininfo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    233    232            H	           2604    18251    id    DEFAULT     `   ALTER TABLE ONLY oauth1info ALTER COLUMN id SET DEFAULT nextval('oauth1info_id_seq'::regclass);
 <   ALTER TABLE public.oauth1info ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    235    234            I	           2604    18252    id    DEFAULT     `   ALTER TABLE ONLY oauth2info ALTER COLUMN id SET DEFAULT nextval('oauth2info_id_seq'::regclass);
 <   ALTER TABLE public.oauth2info ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    237    236            J	           2604    18253    id    DEFAULT     ^   ALTER TABLE ONLY observers ALTER COLUMN id SET DEFAULT nextval('observers_id_seq'::regclass);
 ;   ALTER TABLE public.observers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    239    238            N	           2604    18254    id    DEFAULT     V   ALTER TABLE ONLY plans ALTER COLUMN id SET DEFAULT nextval('plans_id_seq'::regclass);
 7   ALTER TABLE public.plans ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    244    243            O	           2604    18255    id    DEFAULT     |   ALTER TABLE ONLY proc_element_reflections ALTER COLUMN id SET DEFAULT nextval('proc_element_reflections_id_seq'::regclass);
 J   ALTER TABLE public.proc_element_reflections ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    246    245            P	           2604    18256    id    DEFAULT     f   ALTER TABLE ONLY proc_elements ALTER COLUMN id SET DEFAULT nextval('proc_elements_id_seq'::regclass);
 ?   ALTER TABLE public.proc_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    248    247            Q	           2604    18257    id    DEFAULT     n   ALTER TABLE ONLY process_histories ALTER COLUMN id SET DEFAULT nextval('process_histories_id_seq'::regclass);
 C   ALTER TABLE public.process_histories ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    250    249            R	           2604    18258    id    DEFAULT     r   ALTER TABLE ONLY process_permissions ALTER COLUMN id SET DEFAULT nextval('process_permissions_id_seq'::regclass);
 E   ALTER TABLE public.process_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    252    251            S	           2604    18259    id    DEFAULT     f   ALTER TABLE ONLY reaction_refs ALTER COLUMN id SET DEFAULT nextval('reaction_refs_id_seq'::regclass);
 ?   ALTER TABLE public.reaction_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    254    253            U	           2604    18260    id    DEFAULT     z   ALTER TABLE ONLY reaction_state_out_refs ALTER COLUMN id SET DEFAULT nextval('reaction_state_out_refs_id_seq'::regclass);
 I   ALTER TABLE public.reaction_state_out_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    256    255            W	           2604    18261    id    DEFAULT     r   ALTER TABLE ONLY reaction_state_outs ALTER COLUMN id SET DEFAULT nextval('reaction_state_outs_id_seq'::regclass);
 E   ALTER TABLE public.reaction_state_outs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    258    257            X	           2604    18262    id    DEFAULT     ^   ALTER TABLE ONLY reactions ALTER COLUMN id SET DEFAULT nextval('reactions_id_seq'::regclass);
 ;   ALTER TABLE public.reactions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    260    259            Y	           2604    18263    id    DEFAULT     z   ALTER TABLE ONLY reflected_elem_topologs ALTER COLUMN id SET DEFAULT nextval('reflected_elem_topologs_id_seq'::regclass);
 I   ALTER TABLE public.reflected_elem_topologs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    262    261            \	           2604    18264    id    DEFAULT     T   ALTER TABLE ONLY refs ALTER COLUMN id SET DEFAULT nextval('refs_id_seq'::regclass);
 6   ALTER TABLE public.refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    264    263            ]	           2604    18265    id    DEFAULT     ^   ALTER TABLE ONLY resources ALTER COLUMN id SET DEFAULT nextval('resources_id_seq'::regclass);
 ;   ALTER TABLE public.resources ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    266    265            ^	           2604    18266    id    DEFAULT     v   ALTER TABLE ONLY session_elem_topologs ALTER COLUMN id SET DEFAULT nextval('session_elem_topologs_id_seq'::regclass);
 G   ALTER TABLE public.session_elem_topologs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    268    267            `	           2604    18267    id    DEFAULT     ~   ALTER TABLE ONLY session_element_resources ALTER COLUMN id SET DEFAULT nextval('session_element_resources_id_seq'::regclass);
 K   ALTER TABLE public.session_element_resources ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    270    269            i	           2604    18268    id    DEFAULT     x   ALTER TABLE ONLY session_initial_states ALTER COLUMN id SET DEFAULT nextval('session_initial_states_id_seq'::regclass);
 H   ALTER TABLE public.session_initial_states ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    272    271            j	           2604    18269    id    DEFAULT     v   ALTER TABLE ONLY session_proc_elements ALTER COLUMN id SET DEFAULT nextval('session_proc_elements_id_seq'::regclass);
 G   ALTER TABLE public.session_proc_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    274    273            l	           2604    18270    id    DEFAULT     �   ALTER TABLE ONLY session_reaction_state_outs ALTER COLUMN id SET DEFAULT nextval('session_reaction_state_outs_id_seq'::regclass);
 M   ALTER TABLE public.session_reaction_state_outs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    276    275            m	           2604    18271    id    DEFAULT     n   ALTER TABLE ONLY session_reactions ALTER COLUMN id SET DEFAULT nextval('session_reactions_id_seq'::regclass);
 C   ALTER TABLE public.session_reactions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    278    277            n	           2604    18272    id    DEFAULT     x   ALTER TABLE ONLY session_space_elements ALTER COLUMN id SET DEFAULT nextval('session_space_elements_id_seq'::regclass);
 H   ALTER TABLE public.session_space_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    280    279            q	           2604    18273    id    DEFAULT     h   ALTER TABLE ONLY session_spaces ALTER COLUMN id SET DEFAULT nextval('session_spaces_id_seq'::regclass);
 @   ALTER TABLE public.session_spaces ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    282    281            t	           2604    18274    id    DEFAULT     p   ALTER TABLE ONLY session_state_logs ALTER COLUMN id SET DEFAULT nextval('session_state_logs_id_seq'::regclass);
 D   ALTER TABLE public.session_state_logs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    284    283            w	           2604    18275    id    DEFAULT     n   ALTER TABLE ONLY session_switchers ALTER COLUMN id SET DEFAULT nextval('session_switchers_id_seq'::regclass);
 C   ALTER TABLE public.session_switchers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    286    285            �	           2604    18276    id    DEFAULT     f   ALTER TABLE ONLY sessionstates ALTER COLUMN id SET DEFAULT nextval('sessionstates_id_seq'::regclass);
 ?   ALTER TABLE public.sessionstates ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    288    287            �	           2604    18277    id    DEFAULT     ~   ALTER TABLE ONLY space_element_reflections ALTER COLUMN id SET DEFAULT nextval('space_element_reflections_id_seq'::regclass);
 K   ALTER TABLE public.space_element_reflections ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    290    289            �	           2604    18278    id    DEFAULT     h   ALTER TABLE ONLY space_elements ALTER COLUMN id SET DEFAULT nextval('space_elements_id_seq'::regclass);
 @   ALTER TABLE public.space_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    292    291            �	           2604    18279    id    DEFAULT     `   ALTER TABLE ONLY space_refs ALTER COLUMN id SET DEFAULT nextval('space_refs_id_seq'::regclass);
 <   ALTER TABLE public.space_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    294    293            �	           2604    18280    id    DEFAULT     `   ALTER TABLE ONLY state_refs ALTER COLUMN id SET DEFAULT nextval('state_refs_id_seq'::regclass);
 <   ALTER TABLE public.state_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    296    295            �	           2604    18281    id    DEFAULT     f   ALTER TABLE ONLY switcher_refs ALTER COLUMN id SET DEFAULT nextval('switcher_refs_id_seq'::regclass);
 ?   ALTER TABLE public.switcher_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    298    297            �
          0    17693    account_group 
   TABLE DATA               _   COPY account_group (id, account_id, group_id, created_at, updated_at, employee_id) FROM stdin;
    public       postgres    false    173   ��      �           0    0    account_group_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('account_group_id_seq', 9, true);
            public       postgres    false    174            �
          0    17698    account_infos 
   TABLE DATA                  COPY account_infos (id, uid, created_at, early_access, pro_features, workbench_id, lang, nickname, country, phone) FROM stdin;
    public       postgres    false    175   =�      �           0    0    account_infos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('account_infos_id_seq', 32, true);
            public       postgres    false    176            �
          0    17708    account_loggers 
   TABLE DATA               C   COPY account_loggers (id, ip, user_agent, email, date) FROM stdin;
    public       postgres    false    177   q�      �           0    0    account_loggers_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('account_loggers_id_seq', 1008, true);
            public       postgres    false    178            �
          0    17718    account_plan_history 
   TABLE DATA               \   COPY account_plan_history (id, account_plan_id, limit_diff, plan_diff, bill_id) FROM stdin;
    public       postgres    false    180   �      �           0    0    account_plan_history_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('account_plan_history_id_seq', 1, false);
            public       postgres    false    179            �
          0    17722    account_plans 
   TABLE DATA               c   COPY account_plans (id, business_id, master_acc, plan_id, expired_at, active, "limit") FROM stdin;
    public       postgres    false    181   �      �           0    0    account_plans_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('account_plans_id_seq', 56, true);
            public       postgres    false    182            �
          0    17727    accounts 
   TABLE DATA                 COPY accounts ("providerId", "userId", "firstName", "lastName", "fullName", email, "avatarUrl", "authMethod", token, secret, "accessToken", "tokenType", "expiresIn", "refreshToken", hasher, password, salt, lang, country, phone, nickname, created_at) FROM stdin;
    public       postgres    false    183   L      �
          0    17733    billing_infos 
   TABLE DATA               p   COPY billing_infos (id, business_id, firstname, lastname, address, zipcode, created_at, updated_at) FROM stdin;
    public       postgres    false    184   &      �           0    0    billing_infos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('billing_infos_id_seq', 1, false);
            public       postgres    false    185                       0    17741    bills 
   TABLE DATA               _   COPY bills (id, title, master_acc, assigned, approved, expired, sum, workbench_id) FROM stdin;
    public       postgres    false    186   ,&      �           0    0    bills_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('bills_id_seq', 1, true);
            public       postgres    false    187                      0    17749 	   bploggers 
   TABLE DATA               �   COPY bploggers (id, process_id, proc_element_id, space_element_id, "order", space_id, station_id, invoked, expanded, container, date, step) FROM stdin;
    public       postgres    false    188   I&      �           0    0    bploggers_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bploggers_id_seq', 1482, true);
            public       postgres    false    189                      0    17754 
   bprocesses 
   TABLE DATA               v   COPY bprocesses (id, title, service_id, business_id, created_at, updated_at, version, state_machine_type) FROM stdin;
    public       postgres    false    190   -      �           0    0    bprocesses_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('bprocesses_id_seq', 92, true);
            public       postgres    false    191                      0    17761 
   bpsessions 
   TABLE DATA               T   COPY bpsessions (id, process_id, created_at, updated_at, active_listed) FROM stdin;
    public       postgres    false    192   L.      �           0    0    bpsessions_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bpsessions_id_seq', 204, true);
            public       postgres    false    193                      0    17767    bpspaces 
   TABLE DATA               �   COPY bpspaces (id, process_id, index, container, subbrick, brick_front_id, brick_nested_id, nesting_level, created_at, updated_at) FROM stdin;
    public       postgres    false    194   �/      �           0    0    bpspaces_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('bpspaces_id_seq', 91, true);
            public       postgres    false    195            
          0    17774    bpstaterefs 
   TABLE DATA               w   COPY bpstaterefs (id, bprocess_id, switch_type, priority, state_id, session_state, created_at, updated_at) FROM stdin;
    public       postgres    false    196   �0      �           0    0    bpstaterefs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bpstaterefs_id_seq', 1, false);
            public       postgres    false    197                      0    17780    bpstates 
   TABLE DATA               �   COPY bpstates (id, process_id, title, neutral, is_process_state, front_elem_id, space_elem_id, created_at, updated_at, lang, space_id, "on", on_rate, middle, middleable, oposite, opositable) FROM stdin;
    public       postgres    false    198   �0      �           0    0    bpstates_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('bpstates_id_seq', 476, true);
            public       postgres    false    199                      0    17796    bpstation_loggers 
   TABLE DATA               �   COPY bpstation_loggers (id, station_id, process_id, sygnal, date, state, step, space, container_step, expand_step, spaces_ids, started, finished, inspace, incontainer, inexpands, paused) FROM stdin;
    public       postgres    false    200   F7      �           0    0    bpstation_loggers_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('bpstation_loggers_id_seq', 4689, true);
            public       postgres    false    201                      0    17804 
   bpstations 
   TABLE DATA               �   COPY bpstations (id, process_id, state, step, space, container_step, expand_step, spaces_ids, started, finished, inspace, incontainer, inexpands, paused, note, created_at, updated_at, canceled, session_id, front) FROM stdin;
    public       postgres    false    202   �      �           0    0    bpstations_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bpstations_id_seq', 326, true);
            public       postgres    false    203                      0    17813    bpswitchers 
   TABLE DATA               �   COPY bpswitchers (id, bprocess_id, switch_type, priority, state_id, session_state, fn, target, created_at, updated_at, override_group) FROM stdin;
    public       postgres    false    204   ��      �           0    0    bpswitchers_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('bpswitchers_id_seq', 257, true);
            public       postgres    false    205                      0    17823    business_services 
   TABLE DATA               H   COPY business_services (id, title, business_id, master_acc) FROM stdin;
    public       postgres    false    206    �      �           0    0    business_services_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('business_services_id_seq', 57, true);
            public       postgres    false    207                      0    17831 
   businesses 
   TABLE DATA               �   COPY businesses (id, title, phone, website, country, city, address, walkthrough, created_at, updated_at, nickname, org) FROM stdin;
    public       postgres    false    208   ��      �           0    0    businesses_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('businesses_id_seq', 34, true);
            public       postgres    false    209                      0    17840    cached_removed_resources 
   TABLE DATA               t   COPY cached_removed_resources (id, scope, scope_type, action, what, what_id, date, "updatedAttributes") FROM stdin;
    public       postgres    false    210   �      �           0    0    cached_removed_resources_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('cached_removed_resources_id_seq', 45, true);
            public       postgres    false    211                      0    17848    client_observers 
   TABLE DATA               ,   COPY client_observers (id, uid) FROM stdin;
    public       postgres    false    212   }�      �           0    0    client_observers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('client_observers_id_seq', 1, false);
            public       postgres    false    213                      0    17853    elem_topologs 
   TABLE DATA               v   COPY elem_topologs (id, process_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
    public       postgres    false    214   ��      �           0    0    elem_topologs_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('elem_topologs_id_seq', 171, true);
            public       postgres    false    215                      0    17858    element_resources 
   TABLE DATA               o   COPY element_resources (id, element_id, process_id, resource_id, entities, created_at, updated_at) FROM stdin;
    public       postgres    false    216   /�      �           0    0    element_resources_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('element_resources_id_seq', 1, false);
            public       postgres    false    217                       0    17867 	   employees 
   TABLE DATA               T   COPY employees (id, uid, master_acc, "position", manager, workbench_id) FROM stdin;
    public       postgres    false    218   L�      !          0    17874    employees_businesses 
   TABLE DATA               A   COPY employees_businesses (employee_id, business_id) FROM stdin;
    public       postgres    false    219   ��      �           0    0    employees_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('employees_id_seq', 44, true);
            public       postgres    false    220            #          0    17879    groups 
   TABLE DATA               I   COPY groups (id, title, created_at, updated_at, business_id) FROM stdin;
    public       postgres    false    221   ��      �           0    0    groups_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('groups_id_seq', 30, true);
            public       postgres    false    222            �           0    0    input_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('input_id_seq', 432, true);
            public       postgres    false    223            &          0    17886    input_loggers 
   TABLE DATA               l   COPY input_loggers (id, uid, action, arguments, reaction_id, input, date, session_id, input_id) FROM stdin;
    public       postgres    false    224   ��      �           0    0    input_loggers_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('input_loggers_id_seq', 228, true);
            public       postgres    false    225            (          0    17896    launch_counters 
   TABLE DATA               Q   COPY launch_counters (id, process_id, count, created_at, updated_at) FROM stdin;
    public       postgres    false    226   p�      �           0    0    launch_counters_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('launch_counters_id_seq', 1, false);
            public       postgres    false    227            *          0    17901    launch_shares 
   TABLE DATA               ?   COPY launch_shares (id, title, price, description) FROM stdin;
    public       postgres    false    228   ��      �           0    0    launch_shares_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('launch_shares_id_seq', 2, true);
            public       postgres    false    229            ,          0    17909    launch_warps 
   TABLE DATA               c   COPY launch_warps (id, launch_id, launch_element_id, board_id, created_at, updated_at) FROM stdin;
    public       postgres    false    230   ��      �           0    0    launch_warps_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('launch_warps_id_seq', 1, false);
            public       postgres    false    231            .          0    17917 	   logininfo 
   TABLE DATA               =   COPY logininfo (id, "providerID", "providerKey") FROM stdin;
    public       postgres    false    232   ��      �           0    0    logininfo_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('logininfo_id_seq', 52, true);
            public       postgres    false    233            0          0    17925 
   oauth1info 
   TABLE DATA               ?   COPY oauth1info (id, token, secret, "loginInfoId") FROM stdin;
    public       postgres    false    234   C�      �           0    0    oauth1info_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('oauth1info_id_seq', 1, false);
            public       postgres    false    235            2          0    17933 
   oauth2info 
   TABLE DATA               _   COPY oauth2info (id, accesstoken, tokentype, expiresin, refreshtoken, logininfoid) FROM stdin;
    public       postgres    false    236   `�      �           0    0    oauth2info_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('oauth2info_id_seq', 1, false);
            public       postgres    false    237            4          0    17941 	   observers 
   TABLE DATA               \   COPY observers (id, station_id, bprocess_id, hash_code, "fullName", created_at) FROM stdin;
    public       postgres    false    238   }�      �           0    0    observers_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('observers_id_seq', 1, false);
            public       postgres    false    239            6          0    17949    openidattributes 
   TABLE DATA               3   COPY openidattributes (id, key, value) FROM stdin;
    public       postgres    false    240   ��      7          0    17955 
   openidinfo 
   TABLE DATA               .   COPY openidinfo (id, logininfoid) FROM stdin;
    public       postgres    false    241   ��      8          0    17961    passwordinfo 
   TABLE DATA               F   COPY passwordinfo (hasher, password, salt, "loginInfoId") FROM stdin;
    public       postgres    false    242   ��      9          0    17967    plans 
   TABLE DATA               W   COPY plans (id, title, price, description, slot_included, "order", hidden) FROM stdin;
    public       postgres    false    243   t�      �           0    0    plans_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('plans_id_seq', 3, true);
            public       postgres    false    244            ;          0    17978    proc_element_reflections 
   TABLE DATA               �   COPY proc_element_reflections (id, reflection_id, title, "desc", b_type, type_title, ref_space_id, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    245   �      �           0    0    proc_element_reflections_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('proc_element_reflections_id_seq', 25, true);
            public       postgres    false    246            =          0    17986    proc_elements 
   TABLE DATA               �   COPY proc_elements (id, title, "desc", business_id, bprocess_id, b_type, type_title, space_id, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    247   ?�      �           0    0    proc_elements_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('proc_elements_id_seq', 282, true);
            public       postgres    false    248            ?          0    17994    process_histories 
   TABLE DATA               ]   COPY process_histories (id, master_acc, action, process_id, what, what_id, date) FROM stdin;
    public       postgres    false    249   ��      �           0    0    process_histories_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('process_histories_id_seq', 251, true);
            public       postgres    false    250            A          0    18002    process_permissions 
   TABLE DATA               t   COPY process_permissions (id, uid, group_id, bprocess, front_elem_id, space_elem_id, reaction_id, role) FROM stdin;
    public       postgres    false    251   ��      �           0    0    process_permissions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('process_permissions_id_seq', 36, true);
            public       postgres    false    252            C          0    18010    reaction_refs 
   TABLE DATA               w   COPY reaction_refs (id, reflection_id, autostart, element_id, state_ref_id, created_at, updated_at, title) FROM stdin;
    public       postgres    false    253   b�      �           0    0    reaction_refs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('reaction_refs_id_seq', 4, true);
            public       postgres    false    254            E          0    18015    reaction_state_out_refs 
   TABLE DATA               t   COPY reaction_state_out_refs (id, reaction_id, state_ref, "on", on_rate, created_at, updated_at, input) FROM stdin;
    public       postgres    false    255   ��      �           0    0    reaction_state_out_refs_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('reaction_state_out_refs_id_seq', 4, true);
            public       postgres    false    256            G          0    18021    reaction_state_outs 
   TABLE DATA               o   COPY reaction_state_outs (id, reaction_id, state_id, "on", on_rate, created_at, updated_at, input) FROM stdin;
    public       postgres    false    257   ��      �           0    0    reaction_state_outs_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('reaction_state_outs_id_seq', 58, true);
            public       postgres    false    258            I          0    18027 	   reactions 
   TABLE DATA               q   COPY reactions (id, bprocess_id, autostart, element_id, state_ref_id, created_at, updated_at, title) FROM stdin;
    public       postgres    false    259   ��      �           0    0    reactions_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('reactions_id_seq', 67, true);
            public       postgres    false    260            K          0    18032    reflected_elem_topologs 
   TABLE DATA               �   COPY reflected_elem_topologs (id, reflection_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
    public       postgres    false    261   ��      �           0    0    reflected_elem_topologs_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('reflected_elem_topologs_id_seq', 22, true);
            public       postgres    false    262            M          0    18037    refs 
   TABLE DATA               Z   COPY refs (id, title, host, created_at, updated_at, "desc", category, hidden) FROM stdin;
    public       postgres    false    263   %�      �           0    0    refs_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('refs_id_seq', 27, true);
            public       postgres    false    264            O          0    18047 	   resources 
   TABLE DATA               L   COPY resources (id, title, business_id, created_at, updated_at) FROM stdin;
    public       postgres    false    265   u�      �           0    0    resources_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('resources_id_seq', 14, true);
            public       postgres    false    266            Q          0    18055    session_elem_topologs 
   TABLE DATA               �   COPY session_elem_topologs (id, process_id, session_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
    public       postgres    false    267   ��      �           0    0    session_elem_topologs_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('session_elem_topologs_id_seq', 242, true);
            public       postgres    false    268            S          0    18063    session_element_resources 
   TABLE DATA               �   COPY session_element_resources (id, session_element_id, process_id, session_id, resource_id, entities, created_at, updated_at) FROM stdin;
    public       postgres    false    269   ��      �           0    0     session_element_resources_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('session_element_resources_id_seq', 1, false);
            public       postgres    false    270            U          0    18072    session_initial_states 
   TABLE DATA               �   COPY session_initial_states (id, process_id, session_id, title, neutral, is_process_state, "on", on_rate, ses_front_elem_id, ses_space_elem_id, ses_space_id, created_at, updated_at, lang, middle, middleable, oposite, opositable) FROM stdin;
    public       postgres    false    271   ��      �           0    0    session_initial_states_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('session_initial_states_id_seq', 621, true);
            public       postgres    false    272            W          0    18088    session_proc_elements 
   TABLE DATA               �   COPY session_proc_elements (id, title, "desc", business_id, bprocess_id, session_id, b_type, type_title, space_id, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    273   N�      �           0    0    session_proc_elements_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('session_proc_elements_id_seq', 249, true);
            public       postgres    false    274            Y          0    18096    session_reaction_state_outs 
   TABLE DATA                  COPY session_reaction_state_outs (id, session_state_id, reaction_id, "on", on_rate, created_at, updated_at, input) FROM stdin;
    public       postgres    false    275   J       �           0    0 "   session_reaction_state_outs_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('session_reaction_state_outs_id_seq', 189, true);
            public       postgres    false    276            [          0    18102    session_reactions 
   TABLE DATA               �   COPY session_reactions (id, bprocess_id, session_id, autostart, element_id, state_ref_id, title, created_at, updated_at) FROM stdin;
    public       postgres    false    277   7      �           0    0    session_reactions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('session_reactions_id_seq', 189, true);
            public       postgres    false    278            ]          0    18110    session_space_elements 
   TABLE DATA               �   COPY session_space_elements (id, title, "desc", business_id, bprocess_id, session_id, b_type, type_title, own_space_id, owned_space_id, space_role, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    279         �           0    0    session_space_elements_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('session_space_elements_id_seq', 20, true);
            public       postgres    false    280            _          0    18118    session_spaces 
   TABLE DATA               �   COPY session_spaces (id, process_id, session_id, index, container, subbrick, brick_front_id, brick_nested_id, nesting_level, created_at, updated_at) FROM stdin;
    public       postgres    false    281   �      �           0    0    session_spaces_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('session_spaces_id_seq', 27, true);
            public       postgres    false    282            a          0    18125    session_state_logs 
   TABLE DATA               n   COPY session_state_logs (id, session_id, "on", on_rate, reason, created_at, updated_at, state_id) FROM stdin;
    public       postgres    false    283   �      �           0    0    session_state_logs_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('session_state_logs_id_seq', 1454, true);
            public       postgres    false    284            c          0    18132    session_switchers 
   TABLE DATA               �   COPY session_switchers (id, bprocess_id, session_id, switch_type, priority, session_state_ref_id, session_state_id, fn, target, override_group, created_at, updated_at) FROM stdin;
    public       postgres    false    285   �      �           0    0    session_switchers_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('session_switchers_id_seq', 469, true);
            public       postgres    false    286            e          0    18142    sessionstates 
   TABLE DATA               -  COPY sessionstates (id, process_id, session_id, title, neutral, is_process_state, front_elem_id, space_elem_id, created_at, updated_at, lang, space_id, "on", on_rate, origin_state_id, middle, middleable, oposite, opositable, session_front_elem_id, session_space_id, session_space_elem_id) FROM stdin;
    public       postgres    false    287   �      �           0    0    sessionstates_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('sessionstates_id_seq', 1952, true);
            public       postgres    false    288            g          0    18158    space_element_reflections 
   TABLE DATA               �   COPY space_element_reflections (id, reflection_id, title, "desc", b_type, type_title, ref_space_id, ref_space_owned_id, space_role, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    289   �"      �           0    0     space_element_reflections_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('space_element_reflections_id_seq', 3, false);
            public       postgres    false    290            i          0    18166    space_elements 
   TABLE DATA               �   COPY space_elements (id, title, "desc", business_id, bprocess_id, b_type, type_title, own_space_id, owned_space_id, space_role, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    291   �"      �           0    0    space_elements_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('space_elements_id_seq', 59, true);
            public       postgres    false    292            k          0    18174 
   space_refs 
   TABLE DATA               �   COPY space_refs (id, reflection_id, index, container, subbrick, brick_front, brick_nested, "nestingLevel", created_at, updated_at) FROM stdin;
    public       postgres    false    293   �#      �           0    0    space_refs_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('space_refs_id_seq', 3, true);
            public       postgres    false    294            m          0    18179 
   state_refs 
   TABLE DATA               �   COPY state_refs (id, reflection_id, title, neutral, process_state, "on", on_rate, ref_front_elem_id, ref_space_elem_id, created_at, updated_at, lang, ref_space_id, middle, middleable, oposite, opositable) FROM stdin;
    public       postgres    false    295   0$      �           0    0    state_refs_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('state_refs_id_seq', 26, true);
            public       postgres    false    296            o          0    18195    switcher_refs 
   TABLE DATA               �   COPY switcher_refs (id, reflection_id, switch_type, priority, state_ref_id, fn, target, created_at, updated_at, override_group) FROM stdin;
    public       postgres    false    297   -%      �           0    0    switcher_refs_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('switcher_refs_id_seq', 15, true);
            public       postgres    false    298            q          0    18205    tokens 
   TABLE DATA               T   COPY tokens (uuid, email, "creationTime", "expirationTime", "isSignUp") FROM stdin;
    public       postgres    false    299   �%      r          0    18211    user 
   TABLE DATA               \   COPY "user" ("userID", "firstName", "lastName", "fullName", email, "avatarURL") FROM stdin;
    public       postgres    false    300   y.      s          0    18217    userlogininfo 
   TABLE DATA               9   COPY userlogininfo ("userID", "loginInfoId") FROM stdin;
    public       postgres    false    301   �8      �	           2606    18283    account_group_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY account_group
    ADD CONSTRAINT account_group_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.account_group DROP CONSTRAINT account_group_pkey;
       public         postgres    false    173    173            �	           2606    18285    account_infos_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY account_infos
    ADD CONSTRAINT account_infos_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.account_infos DROP CONSTRAINT account_infos_pkey;
       public         postgres    false    175    175            �	           2606    18287    account_loggers_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY account_loggers
    ADD CONSTRAINT account_loggers_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.account_loggers DROP CONSTRAINT account_loggers_pkey;
       public         postgres    false    177    177            �	           2606    18289    account_plan_history_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY account_plan_history
    ADD CONSTRAINT account_plan_history_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_plan_history DROP CONSTRAINT account_plan_history_pkey;
       public         postgres    false    180    180            �	           2606    18291    account_plans_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.account_plans DROP CONSTRAINT account_plans_pkey;
       public         postgres    false    181    181            �	           2606    18293    accounts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY ("userId");
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public         postgres    false    183    183            �	           2606    18295    billing_infos_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY billing_infos
    ADD CONSTRAINT billing_infos_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.billing_infos DROP CONSTRAINT billing_infos_pkey;
       public         postgres    false    184    184            �	           2606    18297 
   bills_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.bills DROP CONSTRAINT bills_pkey;
       public         postgres    false    186    186            �	           2606    18299    bploggers_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY bploggers
    ADD CONSTRAINT bploggers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.bploggers DROP CONSTRAINT bploggers_pkey;
       public         postgres    false    188    188            �	           2606    18301    bprocesses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.bprocesses DROP CONSTRAINT bprocesses_pkey;
       public         postgres    false    190    190            �	           2606    18303    bpsessions_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bpsessions
    ADD CONSTRAINT bpsessions_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.bpsessions DROP CONSTRAINT bpsessions_pkey;
       public         postgres    false    192    192            �	           2606    18305    bpspaces_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY bpspaces
    ADD CONSTRAINT bpspaces_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.bpspaces DROP CONSTRAINT bpspaces_pkey;
       public         postgres    false    194    194            �	           2606    18307    bpstaterefs_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.bpstaterefs DROP CONSTRAINT bpstaterefs_pkey;
       public         postgres    false    196    196            �	           2606    18309    bpstates_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_pkey;
       public         postgres    false    198    198            �	           2606    18311    bpstation_loggers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY bpstation_loggers
    ADD CONSTRAINT bpstation_loggers_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.bpstation_loggers DROP CONSTRAINT bpstation_loggers_pkey;
       public         postgres    false    200    200            �	           2606    18313    bpstations_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bpstations
    ADD CONSTRAINT bpstations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.bpstations DROP CONSTRAINT bpstations_pkey;
       public         postgres    false    202    202            �	           2606    18315    bpswitchers_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.bpswitchers DROP CONSTRAINT bpswitchers_pkey;
       public         postgres    false    204    204            �	           2606    18317    business_services_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY business_services
    ADD CONSTRAINT business_services_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.business_services DROP CONSTRAINT business_services_pkey;
       public         postgres    false    206    206            �	           2606    18319    businesses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.businesses DROP CONSTRAINT businesses_pkey;
       public         postgres    false    208    208            �	           2606    18321    cached_removed_resources_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY cached_removed_resources
    ADD CONSTRAINT cached_removed_resources_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.cached_removed_resources DROP CONSTRAINT cached_removed_resources_pkey;
       public         postgres    false    210    210            �	           2606    18323    client_observers_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY client_observers
    ADD CONSTRAINT client_observers_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.client_observers DROP CONSTRAINT client_observers_pkey;
       public         postgres    false    212    212            �	           2606    18325    elem_topologs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_pkey;
       public         postgres    false    214    214            �	           2606    18327    element_resources_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT element_resources_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT element_resources_pkey;
       public         postgres    false    216    216            �	           2606    18329    employees_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public         postgres    false    218    218            �	           2606    18331    groups_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public         postgres    false    221    221            �	           2606    18333    input_loggers_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT input_loggers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.input_loggers DROP CONSTRAINT input_loggers_pkey;
       public         postgres    false    224    224            �	           2606    18335    launch_counters_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY launch_counters
    ADD CONSTRAINT launch_counters_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.launch_counters DROP CONSTRAINT launch_counters_pkey;
       public         postgres    false    226    226            �	           2606    18337    launch_shares_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.launch_shares DROP CONSTRAINT launch_shares_pkey;
       public         postgres    false    228    228            �	           2606    18339    launch_warps_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.launch_warps DROP CONSTRAINT launch_warps_pkey;
       public         postgres    false    230    230            �	           2606    18341    logininfo_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY logininfo
    ADD CONSTRAINT logininfo_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.logininfo DROP CONSTRAINT logininfo_pkey;
       public         postgres    false    232    232            �	           2606    18343    oauth1info_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY oauth1info
    ADD CONSTRAINT oauth1info_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.oauth1info DROP CONSTRAINT oauth1info_pkey;
       public         postgres    false    234    234            �	           2606    18345    oauth2info_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY oauth2info
    ADD CONSTRAINT oauth2info_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.oauth2info DROP CONSTRAINT oauth2info_pkey;
       public         postgres    false    236    236            �	           2606    18347    observers_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.observers DROP CONSTRAINT observers_pkey;
       public         postgres    false    238    238            �	           2606    18349    openidinfo_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY openidinfo
    ADD CONSTRAINT openidinfo_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.openidinfo DROP CONSTRAINT openidinfo_pkey;
       public         postgres    false    241    241            �	           2606    18351 
   plans_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.plans DROP CONSTRAINT plans_pkey;
       public         postgres    false    243    243            �	           2606    18353    proc_element_reflections_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY proc_element_reflections
    ADD CONSTRAINT proc_element_reflections_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.proc_element_reflections DROP CONSTRAINT proc_element_reflections_pkey;
       public         postgres    false    245    245            �	           2606    18355    proc_elements_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.proc_elements DROP CONSTRAINT proc_elements_pkey;
       public         postgres    false    247    247            �	           2606    18357    process_histories_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY process_histories
    ADD CONSTRAINT process_histories_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.process_histories DROP CONSTRAINT process_histories_pkey;
       public         postgres    false    249    249            �	           2606    18359    process_permissions_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_pkey;
       public         postgres    false    251    251            �	           2606    18361    reaction_refs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_pkey;
       public         postgres    false    253    253            �	           2606    18363    reaction_state_out_refs_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.reaction_state_out_refs DROP CONSTRAINT reaction_state_out_refs_pkey;
       public         postgres    false    255    255            �	           2606    18365    reaction_state_outs_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.reaction_state_outs DROP CONSTRAINT reaction_state_outs_pkey;
       public         postgres    false    257    257            �	           2606    18367    reactions_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_pkey;
       public         postgres    false    259    259            �	           2606    18369    reflected_elem_topologs_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_pkey;
       public         postgres    false    261    261            �	           2606    18371 	   refs_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY refs
    ADD CONSTRAINT refs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.refs DROP CONSTRAINT refs_pkey;
       public         postgres    false    263    263            �	           2606    18373    refs_title_key 
   CONSTRAINT     H   ALTER TABLE ONLY refs
    ADD CONSTRAINT refs_title_key UNIQUE (title);
 =   ALTER TABLE ONLY public.refs DROP CONSTRAINT refs_title_key;
       public         postgres    false    263    263            �	           2606    18375    resources_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_pkey;
       public         postgres    false    265    265            �	           2606    18377    session_elem_topologs_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT session_elem_topologs_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT session_elem_topologs_pkey;
       public         postgres    false    267    267            �	           2606    18379    session_element_resources_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT session_element_resources_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT session_element_resources_pkey;
       public         postgres    false    269    269            �	           2606    18381    session_initial_states_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT session_initial_states_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT session_initial_states_pkey;
       public         postgres    false    271    271            �	           2606    18383    session_proc_elements_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT session_proc_elements_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT session_proc_elements_pkey;
       public         postgres    false    273    273            �	           2606    18385     session_reaction_state_outs_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT session_reaction_state_outs_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.session_reaction_state_outs DROP CONSTRAINT session_reaction_state_outs_pkey;
       public         postgres    false    275    275            �	           2606    18387    session_reactions_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT session_reactions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT session_reactions_pkey;
       public         postgres    false    277    277            �	           2606    18389    session_space_elements_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT session_space_elements_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT session_space_elements_pkey;
       public         postgres    false    279    279            �	           2606    18391    session_spaces_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT session_spaces_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.session_spaces DROP CONSTRAINT session_spaces_pkey;
       public         postgres    false    281    281            �	           2606    18393    session_state_logs_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.session_state_logs DROP CONSTRAINT session_state_logs_pkey;
       public         postgres    false    283    283            
           2606    18395    session_switchers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT session_switchers_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT session_switchers_pkey;
       public         postgres    false    285    285            
           2606    18397    sessionstates_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT sessionstates_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT sessionstates_pkey;
       public         postgres    false    287    287            
           2606    18399    space_element_reflections_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY space_element_reflections
    ADD CONSTRAINT space_element_reflections_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.space_element_reflections DROP CONSTRAINT space_element_reflections_pkey;
       public         postgres    false    289    289            
           2606    18401    space_elements_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_pkey;
       public         postgres    false    291    291            	
           2606    18403    space_refs_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY space_refs
    ADD CONSTRAINT space_refs_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.space_refs DROP CONSTRAINT space_refs_pkey;
       public         postgres    false    293    293            
           2606    18405    state_refs_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_pkey;
       public         postgres    false    295    295            
           2606    18407    switcher_refs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.switcher_refs DROP CONSTRAINT switcher_refs_pkey;
       public         postgres    false    297    297            
           2606    18409 	   user_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("userID");
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    300    300            
           2606    18410    acc_group_employee_fk    FK CONSTRAINT     �   ALTER TABLE ONLY account_group
    ADD CONSTRAINT acc_group_employee_fk FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.account_group DROP CONSTRAINT acc_group_employee_fk;
       public       postgres    false    2495    173    218            
           2606    18415     acc_info_current_biz_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY account_infos
    ADD CONSTRAINT acc_info_current_biz_business_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.account_infos DROP CONSTRAINT acc_info_current_biz_business_fk;
       public       postgres    false    208    175    2485            
           2606    18420    acc_plan_his_fk    FK CONSTRAINT     �   ALTER TABLE ONLY account_plan_history
    ADD CONSTRAINT acc_plan_his_fk FOREIGN KEY (account_plan_id) REFERENCES account_plans(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.account_plan_history DROP CONSTRAINT acc_plan_his_fk;
       public       postgres    false    180    181    2457            
           2606    18425    account_group_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_group
    ADD CONSTRAINT account_group_account_id_fkey FOREIGN KEY (account_id) REFERENCES accounts("userId") ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.account_group DROP CONSTRAINT account_group_account_id_fkey;
       public       postgres    false    183    2459    173            
           2606    18430    account_group_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_group
    ADD CONSTRAINT account_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.account_group DROP CONSTRAINT account_group_group_id_fkey;
       public       postgres    false    221    173    2497            
           2606    18435    account_plans_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);
 V   ALTER TABLE ONLY public.account_plans DROP CONSTRAINT account_plans_business_id_fkey;
       public       postgres    false    208    2485    181            
           2606    18440    account_plans_plan_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES plans(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.account_plans DROP CONSTRAINT account_plans_plan_id_fkey;
       public       postgres    false    243    2517    181            
           2606    18445    bill_his_fk    FK CONSTRAINT     �   ALTER TABLE ONLY account_plan_history
    ADD CONSTRAINT bill_his_fk FOREIGN KEY (bill_id) REFERENCES bills(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.account_plan_history DROP CONSTRAINT bill_his_fk;
       public       postgres    false    180    2463    186            
           2606    18450    billing_infos_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY billing_infos
    ADD CONSTRAINT billing_infos_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.billing_infos DROP CONSTRAINT billing_infos_business_id_fkey;
       public       postgres    false    2485    208    184            
           2606    18455    bills_current_biz_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_current_biz_business_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.bills DROP CONSTRAINT bills_current_biz_business_fk;
       public       postgres    false    186    208    2485            
           2606    18460    bills_master_acc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_master_acc_fkey FOREIGN KEY (master_acc) REFERENCES accounts("userId") ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.bills DROP CONSTRAINT bills_master_acc_fkey;
       public       postgres    false    186    183    2459            
           2606    18465    bprocesses_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.bprocesses DROP CONSTRAINT bprocesses_business_id_fkey;
       public       postgres    false    208    190    2485            
           2606    18470    bprocesses_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_service_id_fkey FOREIGN KEY (service_id) REFERENCES business_services(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bprocesses DROP CONSTRAINT bprocesses_service_id_fkey;
       public       postgres    false    190    2483    206            
           2606    18475    bpsessions_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpsessions
    ADD CONSTRAINT bpsessions_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpsessions DROP CONSTRAINT bpsessions_process_id_fkey;
       public       postgres    false    192    190    2467             
           2606    18480    bpspaces_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpspaces
    ADD CONSTRAINT bpspaces_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.bpspaces DROP CONSTRAINT bpspaces_process_id_fkey;
       public       postgres    false    194    2467    190            !
           2606    18485    bpstaterefs_session_state_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_session_state_fkey FOREIGN KEY (session_state) REFERENCES sessionstates(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.bpstaterefs DROP CONSTRAINT bpstaterefs_session_state_fkey;
       public       postgres    false    2563    287    196            "
           2606    18490    bpstaterefs_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpstaterefs DROP CONSTRAINT bpstaterefs_state_id_fkey;
       public       postgres    false    196    198    2475            #
           2606    18495    bpstates_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_front_elem_id_fkey;
       public       postgres    false    2521    247    198            $
           2606    18500    bpstates_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_process_id_fkey;
       public       postgres    false    190    198    2467            %
           2606    18505    bpstates_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_space_elem_id_fkey;
       public       postgres    false    2567    291    198            &
           2606    18510    bpstations_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstations
    ADD CONSTRAINT bpstations_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpstations DROP CONSTRAINT bpstations_session_id_fkey;
       public       postgres    false    2469    192    202            '
           2606    18515    bpswitchers_session_state_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_session_state_fkey FOREIGN KEY (session_state) REFERENCES sessionstates(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.bpswitchers DROP CONSTRAINT bpswitchers_session_state_fkey;
       public       postgres    false    204    2563    287            (
           2606    18520    bpswitchers_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpswitchers DROP CONSTRAINT bpswitchers_state_id_fkey;
       public       postgres    false    198    204    2475            )
           2606    18525 "   business_services_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY business_services
    ADD CONSTRAINT business_services_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);
 ^   ALTER TABLE ONLY public.business_services DROP CONSTRAINT business_services_business_id_fkey;
       public       postgres    false    208    206    2485            .
           2606    18530 	   el_res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT el_res_fk FOREIGN KEY (element_id) REFERENCES elem_topologs(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT el_res_fk;
       public       postgres    false    214    216    2491            /
           2606    18535    el_res_sp_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT el_res_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT el_res_sp_bprocess_fk;
       public       postgres    false    216    2467    190            *
           2606    18540     elem_topologs_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_front_elem_id_fkey;
       public       postgres    false    247    2521    214            +
           2606    18545    elem_topologs_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_process_id_fkey;
       public       postgres    false    214    190    2467            ,
           2606    18550     elem_topologs_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_space_elem_id_fkey;
       public       postgres    false    291    2567    214            -
           2606    18555    elem_topologs_space_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_space_id_fkey FOREIGN KEY (space_id) REFERENCES bpspaces(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_space_id_fkey;
       public       postgres    false    194    214    2471            1
           2606    18560    emp_workbench_fk    FK CONSTRAINT     �   ALTER TABLE ONLY employees
    ADD CONSTRAINT emp_workbench_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.employees DROP CONSTRAINT emp_workbench_fk;
       public       postgres    false    218    208    2485            2
           2606    18565 %   employees_businesses_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY employees_businesses
    ADD CONSTRAINT employees_businesses_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.employees_businesses DROP CONSTRAINT employees_businesses_business_id_fkey;
       public       postgres    false    2485    208    219            3
           2606    18570 %   employees_businesses_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY employees_businesses
    ADD CONSTRAINT employees_businesses_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.employees_businesses DROP CONSTRAINT employees_businesses_employee_id_fkey;
       public       postgres    false    218    2495    219            4
           2606    18575    groups_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_business_id_fkey;
       public       postgres    false    221    208    2485            5
           2606    18580    input_loggers_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT input_loggers_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.input_loggers DROP CONSTRAINT input_loggers_session_id_fkey;
       public       postgres    false    192    2469    224            6
           2606    18585    launch_counters_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_counters
    ADD CONSTRAINT launch_counters_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.launch_counters DROP CONSTRAINT launch_counters_bprocess_fk;
       public       postgres    false    226    2467    190            7
           2606    18590    launch_shares_biz_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_biz_business_fk FOREIGN KEY (price) REFERENCES businesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.launch_shares DROP CONSTRAINT launch_shares_biz_business_fk;
       public       postgres    false    228    2485    208            8
           2606    18595    launch_shares_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_sp_session_fk FOREIGN KEY (title) REFERENCES bpsessions(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.launch_shares DROP CONSTRAINT launch_shares_sp_session_fk;
       public       postgres    false    2469    228    192            9
           2606    18600    launch_warps_launch_elem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_launch_elem_fk FOREIGN KEY (launch_element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.launch_warps DROP CONSTRAINT launch_warps_launch_elem_fk;
       public       postgres    false    2543    267    230            :
           2606    18605    launch_warps_launch_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_launch_fk FOREIGN KEY (launch_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.launch_warps DROP CONSTRAINT launch_warps_launch_fk;
       public       postgres    false    2469    230    192            
           2606    18610    lg_b_fk    FK CONSTRAINT     |   ALTER TABLE ONLY bploggers
    ADD CONSTRAINT lg_b_fk FOREIGN KEY (station_id) REFERENCES bpstations(id) ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.bploggers DROP CONSTRAINT lg_b_fk;
       public       postgres    false    188    202    2479            
           2606    18615    lg_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY bploggers
    ADD CONSTRAINT lg_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.bploggers DROP CONSTRAINT lg_bprocess_fk;
       public       postgres    false    190    2467    188            ;
           2606    18620    observers_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.observers DROP CONSTRAINT observers_bprocess_id_fkey;
       public       postgres    false    190    2467    238            <
           2606    18625    observers_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_station_id_fkey FOREIGN KEY (station_id) REFERENCES bpstations(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.observers DROP CONSTRAINT observers_station_id_fkey;
       public       postgres    false    202    238    2479            =
           2606    18630 +   proc_element_reflections_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY proc_element_reflections
    ADD CONSTRAINT proc_element_reflections_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 n   ALTER TABLE ONLY public.proc_element_reflections DROP CONSTRAINT proc_element_reflections_reflection_id_fkey;
       public       postgres    false    2537    245    263            >
           2606    18635    proc_elements_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.proc_elements DROP CONSTRAINT proc_elements_bprocess_id_fkey;
       public       postgres    false    2467    190    247            ?
           2606    18640    proc_elements_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.proc_elements DROP CONSTRAINT proc_elements_business_id_fkey;
       public       postgres    false    247    2485    208            @
           2606    18645 !   process_histories_master_acc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_histories
    ADD CONSTRAINT process_histories_master_acc_fkey FOREIGN KEY (master_acc) REFERENCES accounts("userId") ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.process_histories DROP CONSTRAINT process_histories_master_acc_fkey;
       public       postgres    false    183    249    2459            A
           2606    18650 !   process_permissions_bprocess_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_bprocess_fkey FOREIGN KEY (bprocess) REFERENCES bprocesses(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_bprocess_fkey;
       public       postgres    false    190    251    2467            B
           2606    18655 &   process_permissions_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_front_elem_id_fkey;
       public       postgres    false    251    2521    247            C
           2606    18660 !   process_permissions_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_group_id_fkey;
       public       postgres    false    2497    221    251            D
           2606    18665 $   process_permissions_reaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_reaction_id_fkey;
       public       postgres    false    259    2533    251            E
           2606    18670 &   process_permissions_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_space_elem_id_fkey;
       public       postgres    false    291    2567    251            h
           2606    18675    react_topo_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT react_topo_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT react_topo_s_sp_session_fk;
       public       postgres    false    192    2469    277            F
           2606    18680    reaction_refs_element_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_element_id_fkey FOREIGN KEY (element_id) REFERENCES reflected_elem_topologs(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_element_id_fkey;
       public       postgres    false    261    2535    253            G
           2606    18685     reaction_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_reflection_id_fkey;
       public       postgres    false    263    2537    253            H
           2606    18690    reaction_refs_state_ref_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES state_refs(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_state_ref_id_fkey;
       public       postgres    false    2571    253    295            I
           2606    18695 (   reaction_state_out_refs_reaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reaction_refs(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.reaction_state_out_refs DROP CONSTRAINT reaction_state_out_refs_reaction_id_fkey;
       public       postgres    false    255    253    2527            J
           2606    18700 &   reaction_state_out_refs_state_ref_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_state_ref_fkey FOREIGN KEY (state_ref) REFERENCES state_refs(id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.reaction_state_out_refs DROP CONSTRAINT reaction_state_out_refs_state_ref_fkey;
       public       postgres    false    2571    295    255            K
           2606    18705 $   reaction_state_outs_reaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.reaction_state_outs DROP CONSTRAINT reaction_state_outs_reaction_id_fkey;
       public       postgres    false    257    259    2533            L
           2606    18710 !   reaction_state_outs_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.reaction_state_outs DROP CONSTRAINT reaction_state_outs_state_id_fkey;
       public       postgres    false    2475    257    198            M
           2606    18715    reactions_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_bprocess_id_fkey;
       public       postgres    false    2467    190    259            N
           2606    18720    reactions_element_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_element_id_fkey FOREIGN KEY (element_id) REFERENCES elem_topologs(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_element_id_fkey;
       public       postgres    false    2491    214    259            O
           2606    18725    reactions_state_ref_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_state_ref_id_fkey;
       public       postgres    false    2475    198    259            P
           2606    18730 *   reflected_elem_topologs_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_front_elem_id_fkey;
       public       postgres    false    2519    245    261            Q
           2606    18735 *   reflected_elem_topologs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_reflection_id_fkey;
       public       postgres    false    2537    263    261            R
           2606    18740 *   reflected_elem_topologs_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_space_elem_id_fkey;
       public       postgres    false    261    289    2565            S
           2606    18745 %   reflected_elem_topologs_space_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_space_id_fkey FOREIGN KEY (space_id) REFERENCES space_refs(id) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_space_id_fkey;
       public       postgres    false    293    261    2569            T
           2606    18750    res_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY resources
    ADD CONSTRAINT res_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.resources DROP CONSTRAINT res_business_fk;
       public       postgres    false    208    265    2485            0
           2606    18755    res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT res_fk FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT res_fk;
       public       postgres    false    2541    265    216            c
           2606    18760    s_proc_el_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT s_proc_el_bprocess_fk;
       public       postgres    false    190    2467    273            d
           2606    18765    s_proc_el_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT s_proc_el_business_fk;
       public       postgres    false    273    2485    208            e
           2606    18770    s_proc_el_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT s_proc_el_session_fk;
       public       postgres    false    273    192    2469            Z
           2606    18775    s_res_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT s_res_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT s_res_s_sp_session_fk;
       public       postgres    false    269    192    2469            [
           2606    18780    s_res_sp_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT s_res_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT s_res_sp_bprocess_fk;
       public       postgres    false    2467    269    190            p
           2606    18785    s_sp_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT s_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.session_spaces DROP CONSTRAINT s_sp_bprocess_fk;
       public       postgres    false    281    2467    190            l
           2606    18790    s_sp_el_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_bprocess_fk;
       public       postgres    false    279    2467    190            m
           2606    18795    s_sp_el_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_business_fk;
       public       postgres    false    208    2485    279            n
           2606    18800    s_sp_el_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_session_fk;
       public       postgres    false    192    279    2469            o
           2606    18805    s_sp_el_session_space_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_session_space_fk FOREIGN KEY (owned_space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_session_space_fk;
       public       postgres    false    279    2557    281            q
           2606    18810    s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.session_spaces DROP CONSTRAINT s_sp_session_fk;
       public       postgres    false    2469    281    192            w
           2606    18815    s_st_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT s_st_bprocess_fk;
       public       postgres    false    287    2467    190            x
           2606    18820    s_st_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT s_st_session_fk;
       public       postgres    false    192    2469    287            y
           2606    18825    s_st_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_state_fk FOREIGN KEY (origin_state_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT s_st_state_fk;
       public       postgres    false    2547    271    287            \
           2606    18830    ses_el_res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT ses_el_res_fk FOREIGN KEY (session_element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT ses_el_res_fk;
       public       postgres    false    267    269    2543            ^
           2606    18835    ses_init_state_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_bprocess_fk;
       public       postgres    false    2467    190    271            _
           2606    18840    ses_init_state_procelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_procelem_fk FOREIGN KEY (ses_front_elem_id) REFERENCES session_proc_elements(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_procelem_fk;
       public       postgres    false    2549    271    273            `
           2606    18845    ses_init_state_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_session_fk;
       public       postgres    false    192    2469    271            a
           2606    18850    ses_init_state_space_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_space_fk FOREIGN KEY (ses_space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_space_fk;
       public       postgres    false    271    281    2557            b
           2606    18855    ses_init_state_spaceelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_spaceelem_fk FOREIGN KEY (ses_space_elem_id) REFERENCES session_space_elements(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_spaceelem_fk;
       public       postgres    false    271    279    2555            i
           2606    18860    ses_react_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT ses_react_bprocess_fk;
       public       postgres    false    190    277    2467            j
           2606    18865    ses_react_element_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_element_fk FOREIGN KEY (element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT ses_react_element_fk;
       public       postgres    false    2543    277    267            f
           2606    18870    ses_react_out_reaction_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT ses_react_out_reaction_fk FOREIGN KEY (reaction_id) REFERENCES session_reactions(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.session_reaction_state_outs DROP CONSTRAINT ses_react_out_reaction_fk;
       public       postgres    false    277    2553    275            g
           2606    18875    ses_react_out_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT ses_react_out_state_fk FOREIGN KEY (session_state_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.session_reaction_state_outs DROP CONSTRAINT ses_react_out_state_fk;
       public       postgres    false    2547    271    275            k
           2606    18880    ses_react_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_state_fk FOREIGN KEY (state_ref_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT ses_react_state_fk;
       public       postgres    false    2547    277    271            ]
           2606    18885 
   ses_res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT ses_res_fk FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT ses_res_fk;
       public       postgres    false    269    2541    265            r
           2606    18890 "   session_state_logs_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.session_state_logs DROP CONSTRAINT session_state_logs_session_id_fkey;
       public       postgres    false    2469    283    192            s
           2606    18895     session_state_logs_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_state_id_fkey FOREIGN KEY (state_id) REFERENCES sessionstates(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.session_state_logs DROP CONSTRAINT session_state_logs_state_id_fkey;
       public       postgres    false    2563    287    283            z
           2606    18900 ,   space_element_reflections_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_element_reflections
    ADD CONSTRAINT space_element_reflections_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 p   ALTER TABLE ONLY public.space_element_reflections DROP CONSTRAINT space_element_reflections_reflection_id_fkey;
       public       postgres    false    263    289    2537            {
           2606    18905    space_elements_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_bprocess_id_fkey;
       public       postgres    false    190    2467    291            |
           2606    18910    space_elements_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_business_id_fkey;
       public       postgres    false    208    291    2485            }
           2606    18915 "   space_elements_owned_space_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_owned_space_id_fkey FOREIGN KEY (owned_space_id) REFERENCES bpspaces(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_owned_space_id_fkey;
       public       postgres    false    194    291    2471            ~
           2606    18920    space_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_refs
    ADD CONSTRAINT space_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.space_refs DROP CONSTRAINT space_refs_reflection_id_fkey;
       public       postgres    false    263    2537    293            
           2606    18925 !   state_refs_ref_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_front_elem_id_fkey FOREIGN KEY (ref_front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_front_elem_id_fkey;
       public       postgres    false    295    2519    245            �
           2606    18930 "   state_refs_ref_front_elem_id_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_front_elem_id_fkey1 FOREIGN KEY (ref_front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_front_elem_id_fkey1;
       public       postgres    false    245    295    2519            �
           2606    18935 !   state_refs_ref_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_space_elem_id_fkey FOREIGN KEY (ref_space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_space_elem_id_fkey;
       public       postgres    false    2565    289    295            �
           2606    18940 "   state_refs_ref_space_elem_id_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_space_elem_id_fkey1 FOREIGN KEY (ref_space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_space_elem_id_fkey1;
       public       postgres    false    289    2565    295            �
           2606    18945    state_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_reflection_id_fkey;
       public       postgres    false    2537    263    295            t
           2606    18950    sw_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT sw_s_sp_session_fk;
       public       postgres    false    2469    285    192            u
           2606    18955    sw_session_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_session_state_fk FOREIGN KEY (session_state_id) REFERENCES sessionstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT sw_session_state_fk;
       public       postgres    false    2563    285    287            v
           2606    18960 
   sw_statefk    FK CONSTRAINT     �   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_statefk FOREIGN KEY (session_state_ref_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT sw_statefk;
       public       postgres    false    285    2547    271            �
           2606    18965     switcher_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.switcher_refs DROP CONSTRAINT switcher_refs_reflection_id_fkey;
       public       postgres    false    2537    297    263            �
           2606    18970    switcher_refs_state_ref_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES state_refs(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.switcher_refs DROP CONSTRAINT switcher_refs_state_ref_id_fkey;
       public       postgres    false    295    2571    297            U
           2606    18975    topo_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_bprocess_fk;
       public       postgres    false    2467    190    267            V
           2606    18980    topo_bpspace_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_bpspace_fk FOREIGN KEY (space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_bpspace_fk;
       public       postgres    false    281    267    2557            W
           2606    18985    topo_procelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_procelem_fk FOREIGN KEY (front_elem_id) REFERENCES session_proc_elements(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_procelem_fk;
       public       postgres    false    2549    267    273            X
           2606    18990    topo_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_s_sp_session_fk;
       public       postgres    false    267    192    2469            Y
           2606    18995    topo_spaceelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_spaceelem_fk FOREIGN KEY (space_elem_id) REFERENCES session_space_elements(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_spaceelem_fk;
       public       postgres    false    279    2555    267            �
   ]   x�3�,I-.��Kw����/�,�L,(�K����4204�5��52W0��25�26�3�0�60�'e�e
6Ӑ��V�FzF�&XLD�24����� M(�      �
   $  x�uUm��8��>E.��6��	�#�q���l&}�-C��MC)�{U��U�*����R�CCz����1B�TG�Dղ�9�TT�3��������1���w��&��HԁV�`��X��I�G)B��c�����9PZ3U�5,��A��~�6����\�bE��9d~�Vd����be��?�t�����J�!>ǚ=���@"WQמ������1����$�X*�r�C�?��`�P(Aa%�
-ۥQ�֝�]�q�ؠ��F���f�k�I6�g�G�-���[a]�0VpDΧ��k��הc��J�T��=�-ܦ�o�68�0cr�Ҳ ���w���/�UM4P`��+�C)����e��8�7����ϺKǂ���Տ����u�<,,�b��͓_R�p���@�Y�ME���{ d��0\����R}�,��0X�g!%	X�{���qWGB����%���JW(�v�34��h��ѻ�D��/iF�g��2��m�ߚgM�ȚT5�߳_f�\s��߮�����C���@W�|��)��EH��*Y�f�
0����m���a*�Ld��a�w�~p'|�]�׵vriç?� �K3x-���L�3)��t�G܄����a�nxxIj�R�m��S�����h}��/��#�KQd]����4�K�y�����un/��U�u�j׸��8R~ <���x�U
^n��>����E��XUl�(���s�ϮC^�$*6�0���� Φ����Kq,)L��4V`��Wj��~㷷�� ��)      �
      x�՝ْ$�q���Oї�����<��(J��8$I�dF��4l ��+|ɬ��̬��L�	2JDW�WF��G��nB6��R5n~{�����/_������/?��������6���?�s�?���W_�~��W���7/�}<������������xu�o�>���緿�����W/B5�x���p�����|{'������x��{ο�����H��X�3�'���7�����W���˻����7�D-9#jУ����_+�E�*
j5!DE*����M @��XEF��'���T���@�IѮbC6!j�	�x�pS2>L�^Ϙ0�~���_����K�L�'z­k��`�)�V��Z�uc��M4�h:��aw����i;�:�WΚ�o�J0?����W_����߭����y�F%����Wx�̅�z�'�]�S/jB�n�оNL��w�GS�@ǚ]$�]�#]:�hJ%��j����إ|���TfSk�:��w���@tL[۶Ӝu�qטgFǁ2�k�H��ȇK��]��Y���}�j�����s,�Z3ì-Bk�d��3�l��܎�fƫ53#k6����̤�o�]� �A��X��A���Hn�A��A�FRi
��L ����ffd͙�c:�a��u������dO-������?Ę53�嗧���g;��6(ԟvt<՘�zk�!x�F=0�ZsԱ���*�1G��[S�c��������\�9jl-�-I�J�gTk�:�`ɬG-a��Ȇ����g�5�9�&��$0�Qn�l-
�f�t/U Ld���I�Ӄ'������p��n1"YwpJ0g����w��%ah3C�w�ڥ�Ȼ-f������C��
A�Y�Y�eV5fɡ��S��&�3Vk�:�·���4ٚ�,_�V��0�G-�$-��5��Z�Ik�ӳF>DJ�\��M��8S��#�\
:(�mx�#�H)��>U�YH����z�s�ܒ���$���h22�b�4������x��͇& ��B�:(gW������Mm�ZqL�<]\{�zw����ə��~d�+TH��|k��@�G���R��џü�h���=�ѦT�P+�%�I�X����*2j��������)nh���yG��}���|�\������P�*]�j��n5���(N�����<E�yid���42��V�ҡf�J*Z��ѝJN�g��eD-��ud�b^�E���8�_�=�ˬ����x��g[�U]���T!M�u�c�!+��U��%���bjK��J㭭���[�(pnW��u��f���m���~[{770���W_����o��ax�F��xL ������<��WK����>���c�Q����3me�I�����I������Ԭ[Ip�°�{�����'d���,���w���6����^m�������X���9�J,d)����,��(��;g�b%��p᧍����30)ɒ�B2l��dң�k;8�%��z���q*����M�������W�TlpF�Rw"�'Q��*�O��u8.q��sZ@��}X�}���W���Tbo����wa�8(�Sx$/�̀Sc���X}�tG�Z5¶�'�QN���Ԃ��8��9�&jd���aϩ1QL��F���`+�;�&&�x��ޗhM*��Wu��S(�W\����Ǭ6&�`#_;���x��	��������QN<�&����$oo7o�^��a���tي4Y��0�	�Q���a[p�K2h28S���W����x����Ӄ&���}q�	w�f�C����/���EI�g�MA`5����`M�<h68�4�j�M��G��A���7l�6�.v�pޛ8����Q��{�[r������Wi��e��#�+�g�{6��)v�mK�ͽ뜰ݻW���fy��c�\{&i�Ksf��%�J�s�S��ۑmJǑ����̘t��,y��9nʰ"�NGV���E��3��ǖ(��z�JuY�%
��U%c��$A8�26�F��6��!����X����fK��e��f���܉(�\���b0 Wc���t��5h13��4�'��f�c�\k�;3�'�`�6�v�c��&-v��2��Yz�k�3#k2r����B�9+���[N�jfF�b���4�����0ٹ���������xyW�pJ��I��RQ���e�	|��b%��H�j>^� mY��Ŕ�[҅�������J7�eG��}W����8���7kBF�@�p�Nzs�lJ����\�6J
�9~»�8<ZЩ ������k�	=����+��Y4�V��rQD�(�{؝�ndg�]G�ڧ��-v��#���#��G��Ax()�a�m�a��tF�<KBU�ʼ�.���i�G!�ʾ\�L���$��߿Pǯ5��uv��Ye+k�@p���a8*[��+�l���AC5�������Q.�٣y#�^0�ng��F�ܕ/9�Wr��v�i!X�^�X�����=��P�ne��&�ں���zڙ&pꂜ�����%���H�iogR�j�sg�b�{5Q���v&e!H^l�΄,~�)8+�u;�r%)H�S�&��܃u�yC��)32i0���{���y�a���fhڔ��'���2�ڔe�B�ғ&cAH��������)��gSf4d��vY��٘GbʑR�UkS���I�������]��z�Ӧ���DN�N�M	R·�X��t��L*<���0)�0C�4���d��4)#i1�>8����q�'H;��#-�:%���B�Ӡ��΄(o��eX�D{!�iPF��H�]���9:�����77����Y
C�7�n_q_�	1��i����ʦe���]7'�f[ٲ\� ����ޯlYX��e�=��a�Z@���3��ve���ҕT{�Y6���ʵ

(fV��W�*�tǷw��Q�ZA�&�[VRFPg������ر�o�������n�c\
헲�a��o��>lef�M��������\e[�*^���4a+�s��H��#�[��Y3c��u(��l��2i0v ���Lk�c*��*��8��>�i8�z\���ŵ�a��~&eJÁ�=m˓a}����=E���)��:m�@��a��ƨ¦��k���$H�*mʑ�����F6��0R���QiSz�:�1*l���D8'��)G�4z�¦ Y>x�!�ˠҦI��/[?PaS��`���l�x�Ҧ��X�&�h�)|����2�զ0)~^�R�bSY�6,��уV�"�-�s�.k�)��p��J�t��!u�Ȼ����"w&J����!�����eP��m�|RhSzR�T�M��ӵ-N�~!>)�)��U���f6ŕ�:;�U�x�O�ٔGdI�	YH7�)��>B�C����M�HÑ�Oy�ΛٔI#�1.x�ꪐmfS.�p ����U��H0z��Y�L�)2�L��k��_�a4�Cv�څ�O�I�	kW�/�hO���*�4)#i�A4�aR���z��@i����h��р���]��\C�C|�%\�R�z	ԍ�kW�/��ځ4�ĝ�ڕ��kȤ����.�_�a�n|�Z�r�k�_�aG:�۬]l�����%;l�b�'i��&@�����/��lsh��׮���HM��~����4L�J��Я]m�$�weF�T�MIxWUSU!�iSF��~��嵫�/ѰY;�L*�����OѐIkR-6=�JCC��i�)BZ�{����jH�~b�arx�v��������k�/�0`j�m�Oa�b��5dRL%��赋�/�0c[.˭�����OҐH�4[���=7�֡N�ґ�T�Ia2���Y�t����g�T�Ii����l%1�Z�¤���Ƭ]l��O��=kW�?I�HEK�A��@C�<��v���$Lx���<l&���a�!�|��[���J��yϭ�����h,^�X�L�I�Hku��r�g��2:MJG�s	��aQ,z�ܜ'x�e$m�w�	��OkXi�,�	��6���LÑ4�    D�ޤ<�ZK���bNj��D��p���p�������O>x���7틞P��-bNNJ���|�L��p����O����W_|���ۗ�g� 5pn��NJ|�A<�q����������x��篿��C2�OS�I9�?�T�QS�|��G�/�ߜ�;��`��0����M�u�����珯��������D���Y��{y\L�.�Žۮ��w��LYX��F��r��Q�vu��JH�t"���&l͍���~lWGy��Lۧ+��g�kX�yM����(�аP�C>���U�k�(��:�/���0� �$��(���w�\��]�is Re�]]弆��乞7lWGy��H��K1���U�iX�M������TC&m6�;���*g4�~/�m�&��pخ��B�Ի1خ�rRÀOÌl��tuڔ������U�h����Uv�6e Ū	ΡnڊqVIzOb4 '�i�F��ɼ`�m;[.���a/g9�䵫�i�<��)h3d<c���!E�j"o5����[�z�-H�vZΌU1/g�)�7�&�6�#{|�zԌ���ÓT��9�V#�l��-��8'"�x�̛X�k��l��Iy+�LM.=���zy+t��#.~�����Z�f��'��F�$�&V�:5G�`����%��ɮ�w6B���|h�w6:3{�����I���w��8��=a��k�i�g��gﾮ?�gxl>����o�"�b�y?�zj./�O��B���?~���g.|��x^΋����� O��R�7柿����q�o����'�o��[��#.�I5�Ϳ�_��>�l�plX�.�B�^�?�1�I��ͯ�o^��3�ѣ�������Q�D������6����Ͽ��?������Un�T�l���of����ҟ�3���?��x�o���=5�z�S����I˕pR"�߯>�b�y�s�'��b ��!��t�~o>z��7?M��N/�����K����w�_O��(�zd,��ZXGKk��Q<�Hh�燯���L����0diD;� �r�\��?|� >4����}���uΟo{]��5�"n�Λ�S��I���_���~��'?�����ſ!`��ԺH�ܜgϋ(�$������oo�>����exS+#��C`��'9�7�b����ǟ����3�'�oh;=�D���[���u�Sl�7���x�>�k�5/��&�ѽ�t��kg5_�`�̊-�1����G:�P+�y�s;��b� ���P����E�����E����R�
+�/!]���Y��*(�m��;n3S���Ye��f���D�j����̅�����bRhb}9�=�z�7��țMO�okx��L@�kXLs�o[�s��#o5|pמ7�\H@���<p�e\{���2�x�מ8�PÌ/K��D-����#Ǯ�p$���k��̱�J$�x�y@w\{�ؕ���%n��iH�h0��Ȭ=H�j����}�b�d^*U����4����N�Ql:�Kŋh�PI+1�ڥ/WkȤxB���%#�M�*o��w�����l�fuq��J��._ߗǵ�`���AC0�o~b��T�'�����^�Ԍ���]9�y��/Z�Ϸݑ�V�^�^B&m.F��Z��qVfBb�Ȼ���i�c�d*24���,%��^TlhFހ9��L¶i�zz
�(��˾��]���[�Yi�R�g�,%]�ߠ��y��˵�h�+T|�BY�;kW�\�!��2a�˛J�L��Ú����
=#�Iy��d���]�h,��m�h��s���!�6U5�x"[�m�h��&��Yx5Y ��"��6�4Oғ����*:m<� śq�B�k�LT|?��15u���q�R�k��E�7��Y�gľ&񬫸q5�z"/������5�z�� ���4�ɼiLBܸ�fZ�x���q�	�,m\Qs��#�Xb7.����%J��&p}Aܸ��R=�78c�m\d3�'`cKix�5ۣ��-<c�d����VO��f{4�F7�&���X�y�,ύˉ.�Sx��ܧ#M�(S?��݋d�W,���ȋ���M��<2t?�qk�F#n��\��������a��w��ecc�oZN���Y����M
Y����mV*{֞�v��#i�)ĵ'�-אf^6W3�I�ړԮאH��鹯_\{��%�BÊ�x3�=I�)"i���.�=Im��ފ��$)FX{��uIڰ7�@��g(�g�P�=I�zˁ.%��ƺq�3�$�b��Qj���΅z"oF��q��=Vm�������¡"�=V�z���F&Ua_��^����;0�J�2�R�y!�a_<z�8M!��X�+5I��S�T�}	ؿg����i^F�d��WYEȂd��qV�c0������kU[(!Pg�����}z��jWj8����m�~`ZÂ/H�ac#��N�2�b![����-԰�%���'�O`��jWj8�f��<m�ʆ|�Q;B��I����߸��}y���^~��#��d��aU*M,8��q?�2/#�R�-��kW�DFG~v�,5X{��et<n2��+�@��"97�"�v��,�k�W;6�-2�o�E\ٴ,U�Y���3�����lY΃�.Cam��Ϝ T,�*��T�S�߾����o��������W�o�q��n��~�_�K�[���rkFTw49Q�q ��:�L��2w���X���M�{V-��G�f|	ؓ�w���X2��lQ���É
�F#~�+��9�d#��UVB���|9{���K4�Z�7o���دI��;6�ĩ`�p��a�hFv�S[ewU2�	�籿�p3J2l0��.B���������j%6�EI�D�`i`��ay�cP��6:F=Jb3�@-�8�"�UR`�8Y�I���r��&�8�Y��#ll��,I'�g�/�ǢJ�48=�7��+ t�æ)����6	:N���$�>���$ꚛ1��ǳ t�6�9� ���Q��"篠�����8��������E�N��Î�/ �X�a	�8%R��Y��f����� ������0 �18W��4p�MHj�����U���6�#�Oӂ��ތ�uhHI��I2��F#yI��Y�� K�ܴ�9���}�MI�(�/O�d*��+܄�GXsS���j��L����0o?���/��<��E�f�Eb�G�S�9����$S+�-W��qr�b{b���*)�9�7���ƶ-	nT�
�JY���V.O2(��w�bNsR��@�D}��:�"��N�W����gn�Nᓤ��M��얐hǪCxțگ�x�$u�I��
(V����N�#�ܑ�S.��Ƌ�U������s�W�>�G�	ٲJP¹@d���f��YŚ^"j��([�%��"���|ҳ9P�n�
C�(Y��02��/^m)7���8QgB�4\��a�0�P��I�]�&�9��o ����4OkWz���I���G�3�q�I?rU��sZ�Έ���!7�k�����	��l�=ay�hǳu죰�	GV��z�g֚�����|�m}��b9)F�8�h(���tN�#}3��&�1Lk[�d��v*�c�Z�>P��Y�;���%��Ex+�xT Ԫ�s���ه�ڛ�~y¢-x>s��O��Y'�9nl &9ϠN����=���k��̩19Z@/���Y%�H��^[Fķ��a,B���tV�?�_ �I���츇�R���Հ.�y�O��5�d�[@DUC�Dg��
rF�;�w����mT�
P��&6$Ω!�z�&����3M�~YY��
�#^p�fe�sA����%��E-��2��RZ���.�y��VdNZ��^�Dفt|U��Y��}�_!��⡲S���w���kirU��|���?�ᅊ�k�F��6W�N�aȆ75!
�ەn������P��],����X�n��]#��Y�]�A��#~s+*��h�|3.:d.�i��r��A	��<�1W�I    	��Ș��qʏ+����"�� ��%�"{��U�n��qU	��G��9����q���H����<a�
��B�S�,�hp��-���)���O;��D�U���E�9O!�!���/<�8���Th���{IYIԐ.Z����&��.}����Ӂ: ��e��Z@�T��s��\��?�9S_;��Z��.�y��Q�)Z-��2c��Li�w�贀.�y��κ)z-�d�\]�>�J8Št��}����p�����@(8< �5"�!����b<�Ҡsy�z�	�Y�]�Y��=~6�z.7s˜�S�u�&�bä��]��-�=��9	E�4W�i؅5�(h.p��SC:+t��E��x��gǛ���w�T�6j@gu��+�$H��?�k��,8yv+ Ԑ.���� iه	�sa�����z#�S��PԬ�Gچ�%L���T5�˄f�"v$u����v���`|G���ZOt��b�h�w���:+�H��i)+��3�U:4,��.Jwv���-����no�ZVé�ͣ����Ĭ%��@呾�uBJZ��)s�Q�?�R��\f�}�$3��P�y#�kU�x���Q|�T�`�j<�'c��b�z�h��wl'��땢^d�ǳAv4sֵ?2y������b�˃��i砄sN�>�o��QQ&rƋ�,m}����4~��OJ���)}�+gl}3�"��]�S.J�OE����3`�26媄s��#|�z���ߵ���W�׊��գ���tqJ8gE��h��W0����Vr^�2P Zq5T�:v\�tV���"v-W�M�
�/��I9I)d�re_�Y�Gx�5e���Q��4���!�r�:0g%ٱg9[�Rt��J���!��$��s���&H�w�:�O%�|�B3/%,�N��������x���,��O?6|x �+�Ƀ� ���®psz
1LΊ�ݡf�{ݕV��ϸ\0O�m&���OȥGׁeo�B��ILGׂeo�B7Ch*���vMX�&]"��V��e��w�8B�W���wX����,,1jՃ:+u�_2�g�ٻ�S2t�i"ŷ�H��l��e:#}J���"=G׮*t����c}�[�l��Y�;��2vd^�d�*c"z����ȳ��=���t䶗UYI�zx .6���#sK�l��%B3>`�?�?Fw�F�9s�j�͋��)�fVՐ�
=�{��<;�f�X�f.�7y�9�[D����=VT�\?tU�b��&+�W.��Q���3��_�3�+�[�0�4w]Vv�����<T<����Tf�i(N5Q�w���.���[�8�;��fNt�pL��BWu����1�sɷG�dfP*)� �N�B��"�S���.��ᑠ��{��}��m`�f=<7��1:�SQHZi>
�-�c�}� �c��Y鷟�}���ǯ>���g�����@.'¹�Ҭ���8��BK������a�O�rG�Ȭ�+��ng0u��pph?(q9�=��	xny�c���hZ��b�n��:w]S���:�P�9�ڥ(�2ƒ��kJ8g�e�$�|�6).S�����[,r�������N)<��'��5��j�`��o���rKΐ/���w�����>����ˇjEܖ0v���Z�~�	�s��3I4��y�\��s{,Y��~��;��:���?P���c�Ľ��i�ޠ3
3x�9'$��-6_�:��FQ8�Y�`_�Y��c.�u�Iڶ�V2��k�b��Ӈ�h��pN-ّ;�r<�(�<w��k�5{Ԅj��V5�����QI�a4l���f�-]:�b
+�Oɾ�g��k��y��:��R�U���� ���u(Q����ET��iKe��[�@�R/ w�3��0�K7m�z�*k2t�])�X�#?<p;�����N-�<ɑKߖD��-��gCuؽ��i���yi��H��4̽$�x���׀��!�ΤS��-�Ƚ��7�R4���.C׍D��;2�(��WU���j�"�a&sUDN��sjɎ���so��5"��k�دԘ�m`ԕ�Jt�u"ٛtv!w������u*�+v���
DN���Ω�<r7M�߻6$:4��=�(У�\�5"ٛtB�#9�1��+��[�]�q�����O������N:�qG^�l��̻4�]]R,c�
��X�{ޙp/��?���r��MHTp�m�Gx��dg8�W��6�G��~s��߿��/?y{��m��޿�ݫ���6���w�?y���Ż/�xՂ3�p�L������^���<a�DcR��k�-c�س�`�.͢D�K
}l���9����/_��ˏ��-�߸~�_#����$��4���O��~}w���m�K�p�Wi)&�}������O�y���z��	T de�)n�.Xp��<הf�y*~���5Р9/��+�\(r�91l��1Tl�[��{��)T�1�9�,qW�YAG�j�lwt	=�2�L"�L�^�H���s�oh�gI8����O�@j�k�R��d���t��#~��q�@�C�U�\/�kY�S�d��V�'ܜ�B\0�#����%i����=*:��q`�10�(�C�B�o<�:W��s"~깫X��wiZ�ؗ��%Ɇ�Q�re�$!G]r�n�<�������uլH�L�f�mM�S�v9�LȲIi�MO|��*����n�RJ3r"q�؋�i����2h����iئ�;�Vd����v)V�i���i*�h����$H.�(P������f��[�������a��� e�W?ИAL�10lQE	�ԫ?r����k�<�����X+\Co���)qjl���VJ�$�(�u_�:�Pk]�����8�'��^�W�R\�%g�T�*K4��$��GŁ*9������_N$2��t=��q�x��4aO��O�(��KG�ؼ*�\���a/���k����;#%���]��^�����_����o^޽>ղ��ʻ-Y��ﬔ�Z��`�yR��.ߵ��o��?2�a�W�]ZG2��Ig��T:��v��6g����	��YǮ��^��h�;{��s�&u�x�C�Z��v�9��O�Oc�|�hKmw^7�>�'�x͑>�.�싷XRl���W�ᑴ�8�oe�%X��$F�4����`��`��.�렜�u�:�{�i՚��3.Ӗ��c�� G�!����v���y�q1��Ov��J]���0x�&s�ʱc�ΜS��ܹE��1���:��Bބ����������Rw�F_���Ѝņ�*��Lg���5�K��*��w�n����x��A�JY��*X.�*�+�u:��ݿJ�&`��/�a�`@n��. {�-����b��� ;K�cq�uP��nIG涃�QH�zu��#p7vN)�(Wtdƙ+�iuQY}����m�.�ԑf �$ڂU�9+������ ��ؕΘ/�[rù!�L+}ˏ]9'�#w4 ��}}���Y8��E���<�۵Xi�\��ﺘ^R��-��^�Ҟps����`oU&Ϊ�[��Y�r"q55	�фUl���[ke\�O�ԏ�=�Ŝz�Gll`�6!����}K۟������qm�su\Z� G]T�ʕ���E<���c!����?+y�BJu} �G)�!](4��%uG�ɬ��z�nQ�]MJt����sj�������h�Ň�=>k6;v��1��4�Hɤ�#�5�ؗsB�#w4��W�p?����m��=�k�/�����&���L}�S�k4v�(��x��<Y���<��{�d$)���÷�ӕ���x���obzUj;�,���sJޑ;�$W(�p���<��e ��9)��W�ss�.�c�V����~r|t�f:�����*Y���J7����ހ�E��P��`j3�2��	+cR�H�M�IYYRڊU�9+��=�x�-G���k�����c����UPN�#usy�gK�Zp�#D*���O�i�t-8T�#2��12�X�M��SXy�I��bej�c-^���hPЍ���vx���)}n���,�T5�`dÓi��w�V�^0c+&&v��Lt��   Mץz�z���.��X���ꁴ�p{k@0�̙ן����pM.����vWʛni���{#NAMJ0����eZm�'��]\��>|�pC9��அ�����TQ��)}G�ܬ�����4�ys,���J� H�p�j��)uG��Q�I����>U���.V��:0���3gVt`?P�`����e�1��Y�c��C��vL��_g��`��\�l�MJ8�D>� �Dg�����yW���bu_�H�ڢ�sb�8r���X�p�����H/W�ԮÇfy��m�s���s�i^)o��T���4έ�+��#Fx����S��ţQ����&���s��_M�u�u�"-��Af7��JNJ8gE�	b��.!8�`�<��4N��Yc̢sV⎝������g�y�ę
"ޯ%>9��*��x�����J�
v<� 2I�aV����{%��"���D	L}wv��i����&�l�Sٓ����+�Q5(:A
Z@��Ñ>�B�~��U|8l�X�ګX$T!�b&� ��mE���X���H�O+]$\����@�vybW�����9+�_���N���]&r�:&K�Fx)��sV���qd�
m�V�v�K�HK!)w$�]ܕnV�o���%t�@�y��~׮Zʇኬ�Dڤ�s��_q�'�g5���O�6j߆ي�5;c�jD��F\���0g�7��N[�=;�ٙs�ȡ��8�%���Y'�?W.��\�<8���� �=�f�����fcw3G�U,ڌc����I`ƨtV摾E���Ʈ+dhi�s��d.� �T�y5&-��2��n���Ǹ-�����z�4$d=-��2���D9������~�Z�_��u�iH]@���:-sO�]�-�M�O�����󏼣�����u (Hz��&��^��#=� �ѱA���(ؙ;L~�9�?�'����)��U�~ n¡B��`&�K���^�"�M��%�n��ϹlgH8#���{	eG�Y1`��sׯ$G��U�bu��,γ�jױdg�%23}4I�T��B�H�(��C�Z8��ݑ�5�)h$0TJǖ����.[�@�`V�Z�OeF_��ZyqrR�J��k����� '�讳���\3�y]���y��T�Vvd�]�p��45k��I[�Tu�����%<���|�f�'ܬ�#q3ƻv$MdPpMA���D��+�\ ����Z>\�(޿}�j��s�}�~��آ�Wwo_}z����5��<LJ\�Ts\�/��i��7���o�������T��#1���|��L��ʉ]eEP�A�+{���y$�,W!�z�cs���B9��L�m�E����֢��,u��sV�>91�p��3��Ԙ:n�E��h�}Bv�����~R����6w�f��"k8*�ї�k��x���(җs"�����C�+�~��^��!x!�B^���0�f�|����c�RUW��;�i���Z�S뷣�6��&�����ݑ�|3Oe�c����횉� 7�VGb��"��4��K�\��I%�^ީ�pN-ב�jE_P��@_J���$9<�I	猾�&fѷ3g�]�y���7S�g�J6�]7�}9��������&�I_L�Lh2�c�v�D��݅Gzg"'���ϑ;JLZ��d��� �]�'��+�Z�#xh��n�Lz��+��)LNk�ִ�3����w�n�DV0��~�/���g��9�o���-�ww�dV�=˶{��{����U�e��m��I7������������g�a[�6      �
      x������ � �      �
   �  x���͎�0 ���)r�by��D� �vO=T�1		�%٧���Y�!�{�ӌg�	`L�����\g��\_��9�H�Z@`���5Ҍ�%����A�g
k���5�����i&y&5I��$����WJ=Ȓ5U�f\�3O�i�M{0�1�mMݼ�H7t
Lu&(Q\F���E��vw$� �10�II8����M��n)�Q�c�"͸&T��8�uirq�~�w������W���}n��=5�I�$|%��g��	P���4׫{F&i�x!���r}3OX��*H�y�/���vyf��ɨ�So����tN:��ObA�Zi@�����ש��yI�]����'���޹G1el�@@ޅ��u�p�������}���ĸ<��j|��PAe�j��O?���LH��FSn�ԉ�V&�7�P�)\�+/�����H 5�f(����7inKn��"� 
���y���s�Ba��0������nm��smd@,3%�ʂ#5ys+ݰ������{�}$��D�x�$&B�ݛm�s��� �X�!�;Ә}^���g�6TL*<��eqHaҝ̹���M2&ȼ���0몪$�)������f��2D��eQ+#�(L��[wƻ�_�ǥ2�	A4�I�$���7�ݽu      �
   �  x��YY��J~��
�� ȢL�Ĩh����q#&
(d�����G�=�x��.�/++ɬ5�4�Q������L<Dq���*@U����V�HZY�*�y�5���jQ&�m���1h�uF`��Ag����96�����n۬�'�0'Y��p�MӮ�@����=�@�!�v(�Ư.����	�_����^qm�h��g�6M��9�Z� �-�؞Z-���˒�9�C"�y�`=�F�	|��,?���axq���!�J����ի!�u+��`���tO���g��l�C� '�$5�Z��&�l�R��<:j}LV�c҃�B6�F<�Rq%�<Ю!����G��Z����c��	�X�i��S^�O��6���t���B��YEx{5�b���V����+ڞw�i<�%����[������8{��Yv�`v��fV����/�`�T_u]�{ît�Y�7��v(�����ΙS����G�沌�p/(����\`�(�����EX�
h}��ӡ�v4�w)1��w4R%h���k���|1�j�������Ȣ�#G)~�Y�2 �����9Q+\&�������� �@#uZ%	��R��-$	�(j ��Ǻ��0d���f�֋�0��)���g����F�l�q�,H�e����`�ب��].X��mǿ&�]�#;��M�"I!��rj��.���p�[{�ӊ�~k%Lڙ����T���0�?�E�wsxr��Nr�ly׽0�'{l���@��īK�L�;���%92��$ȸ�啠�S{�'V�:#���nuɈ�ƌin-� WJʳ���ba%O��{���3����`��<z��zPC��U�[eC�+y��j �M��t)�h*�gr�������S>�3L	�Qw����Ŭ3\<`�q�ݰ�y�φ�L� �<�����g���ۉX?��'�H��h�A���j���ٛ�^���WT���d�����D�a7m V_���=�ޝ�E���1ё����D��֫1}t�[B'/������A����V߈��ö���c§�g�G!o����q����5�������&A�>�Zž�#���h�*��bT�Va ��H�u=��A�aU�w��^69��zD�꺆��5�թv��V���1H@T��j`�mP8IA��X���K�Peڔ�it��Q8��V4ߵ�� b����%j���m�W���m5�ڤ	}w�ǦSq���G�)0�<�c��^	��J���^�CGw����`7��R	����ܖh�k���'�|�b���l�o���J���a7[���X�7tȬ�3f���Dɟ�\�[��� ����k��5~��j�ܡR1Ue.�ig>ZoF{�6��r�3i�ͧQ�M�F!�x���n1�űV�<�����w����m^�k�8��!6��[�R�V��j �?,IX<)�>�����`,��űu3��5n z����f�345���NR��	IFSٮ�*����4��S�#�������kGp��M�8<Ov�^i�tԁ���?5�x�RG� v�}�I��^R}�t�L-$��:�ڠO*�����h��Z� %���n��Md�#�}��J�: &U,�s<�����^펡W��@�VO�+G?�����s�rř΀��BW��I�͈E9��d��<>P�|�Jy��*A9<��|�|��];��q[�����۝b��l@�;+0F��ؓ�(O��6�ĺˍH�X9e�;Y�Gi��������X��TW}G�Z�z��A���Δ8R	/ ��/:��n�m�,�m����7+a�+Ef�c��5��z#Eo����3����R/��>W�E�GEE���}����U��N�6C��Ո߁������8�FDA���(oǃ����c��)=J8�hm�x��qQ�G���ّ���6HR���'g�<!��!����a�?��9Q�@���/����MuDX12h*�}�|s� �K����I���V��J��4	����ng�2���<��S��=����wR��`M&qz����3q��6�>������&��gB�Qd� �<l��lj1�:���x���&������ņRz�\*$O�T̗�aV�7���g�n��.�$��:U�"�W9Bp���/;��M*Aj$��u�@1d[��5̀��g`�5�;�,���͊#���R|gY�_$�<�`�pJmUE���<=�Rú��OH��\�gs�>P|u ���ϭ�?ǋ ����KQ��>f�os\XM�|�ۄ|#��Y8<�A���������]G����6��7��.d	�m�Y�A�$`��x���I�w��u+����L���?9���U�2È�m0����.�@��
9�����g͹��뤊u���A����C��]�G8	]��3s<G�$�U������B�965vdc�B��Y!?z���xeчXby����"E6���~���Nɜ��ϰ�?I"�X�6����Uf�N(�d-�L��n���פ�_���^υ�f��f��#C��^�W�W�Ts$z�����Z؄��E��NB|�tA
.�%��ӝò��}�c6t�h�$id��ެú�5uC�ٳv��J�� �t�T�e0�%�z�&�.Ձ��Y��\��SeE;�G��X�p{��J\�\Ťv�2���4��$�������6J�4�T�U��8�b����AM͕�����^j���DL(���ym/�]x�Ő%3�P|=��D��	Q+ɧ�bB5*5���f�j"��Ah�k�@B�[bk謖\�cfǷt�XPsm�>-[�-86�S��= A��~��x�Jc��1��S^	ڐ��!J�~ D�&;�
t�E2�vXY��0�#N4�Skm�'��b?~��/��՞      �
      x������ � �             x������ � �         �  x���Kn$7���SxtA|J�C�Y��?B�U��Q����|E��0�C�Q�������ǿ��3���:�@�WJ���HjP�D'���EHt���F�C&�Im�:$���/`�G�-����ߘN�S�`��"��P��KP_��Lr(�B���{��گ��bG/�ޡz���/�q�|�j��`��zy��G�2<�&�M�y�<S}"~�|J=E��y8�b�8c��e�����l!�߶��'ʉzօZ\��uC�5���G"Y(�S9o��D)��
�Q�	�TJ���C�N��*�z���e��=�S���h�=,�����Ѻ)������ͿXx�$S�7�B�u���d�� �E�d֕�2�qOP��	r�\֙9~��֑�A����� _��qc1�&��9ōu��1�6C�Z'Ok{=d�*�-�@#B���{2���'��id�%�^c�tR�{j��NVY�lb�*�i	����=d�
.ո��,�A%�d%"�:T � '��
�����$��P�=ߪ��,d�,��B%��Yi�V���$����6};H]����oYi��}�I뢦ok�P34��Ȳ�MCEz�R��HL��ޫ���#�l8�j\N���j���Ȃ:uPK\NvϺj����2��ׁ�u��~���<e�	�2p��!L��x7C�Z:`��{�� H����\Sߣ0P�AV�D7��KT��"k�g��6c�I���.272o��%W��P��!r��ډ6ׄ��4-��C��:���l�`�Z#f!����,��%5ϑ�Dm�Mh�s���9���hk�K���*s�:jZ	��e�U��Qae�w��(,�	�O��l��9��R�^�Q����;�����k�c�|�:wh�|�e+o��:�j
�a�PC!,�����Ά�/!T��Ҫ0!�*gKP��E�.$SX�;���D58�9�.���'k88;���9���N.��쨗�>0ݯX�7xK�zP�0���~���\ŭL�+֝�U�4�l�L�l�
QRO�B�.�����S)~&壦U���&v�����Mdcn,nGjtc����]�o`f��jٳ�^!�Q[w�I/E����}k��7��|�}ʿ�T{#��g���9�O�5_sD��Tb-k��@>�k��5�Q���禈��E?
J��D�uںV\m j�`����\�1���S�i�2�D�b؏"㉶�5���|�:��V����93M7�˹��&��'D]$�y���)|�L_��$�ym�H��C�����%)Nʛ���T'{�-�n�!{V�N�1}ۅ#Q)8�v�2IE���]lA%�	p ��B��J�IWBT	;�J@�*��3��ǫ�6�u��� ���bP��S�Qt�/
\��:�I����:�!e.p�� �ֺ���ů���R���a��(S�>�jGuK��M����[w�������@y��^:�s��^�v*ܕˬ�m[�ܵ��s��wu4��
p�mw�v*��EÓڎ�1�?X�H:t�I�u�"ݿ�lc9�)k�`M��k�Q>XS8�ܫ��-�"��>XR4r�S�c��+����h����h*��@�d�Ub>!٠�\ꙴ��P^�b����Bz�H�ǃT�'V��.߷�I���k��0��ނ��(��X-(��L���P���M�������9�����qU         -  x���MK�0���_����$��Yܫ���K]�nqٖ4E��[�]ŏE��S�0C�I�����n�&0�&�м0���q�1�B�s�	��
�p�4�R&�@)*)P�R�� K+�Abi�X$���A�� y��1D���� 60yNI����uGX���ȃR�x`K̓��X\���R?�����Ø��c_N������xkw� [�r�9���!��>���A9ʖʃ�ڥ�ZﺰO3�_X��0Εj�Um����O�.�+�*rKK���s�dܤi��+1_x�*�}c|c���7���QzXE�j�         ]  x�}�Kn�0D��)�L�+Q<ˬs�����[�Ц�Pd�&�Ҹ0�m�7�[X3��_���~�Z�N܂j��)%^��	�le	�P�nv�si�^��yú2�J���_�Tx��B �'�]J���V�'����p���c@AG���M�Nwۣ��F��5�=z�CI�.,���՟j��4p/�{�nh+z��Vȶ.|*��~�P]т�8,�|�w�\v���k7y[by���$�����{�7�П�I��WP;͹�_5�"��F��~������=k��`&��d��&���uB�0����z�.�1�e@c�3s�'�w|��r�	n������eY~"��#         �   x���K
�0���ݗI�9DN�uO��S�mJJ�M�`3 �(D�x��e��=�$�$�������]h��!,��B���<��a6��["�P`�A��m9�Rk��A���� ��rJj*#o�%�{@B��Aʍi����݉�j�镢�¿�z���l%I�5���E�Bxh�      
      x������ � �         �  x���ێ�6���O1��:P'?D� 7A�mm7A���&�m�:��`1 3����hRc-��������_~~��?�~�����*�*�E�I�d���"�1��=~�u���/Z%�_�z{�c�����S�/��yE����,�r�2�ƅ�(s�ZB{�O�\�� !Bʌ��w[a�u�Q2�򍫁�)5����ʌ3��R� ��Q�PY�UCL�W����YsT֡=�%T�q5!��Հ�&�b��(�:F-�ʈ��5.��i�>��)3��-*���ڣtB�W�)5�d-+�s
(�-�Gل�7��"�Ը���)5N��B-�=*$T�qq����:��X!e�Ձ䠡�8���uh�R	�o9��VGH�q�Պ@X
�y=�r���(�P���@l��ǂ�ϏŚP� ��y :�%�G���7�"��8t|~ք�X�J�(����Ʉ�5nY��"�̸:ք�X��K�qKh����7�b"�Ըք�X��j����*߸���R�j@a��FA��Kh��"�r����)3�
��I�yr��E�b�0º�;�Y��]��	�y؂��{�A��{YL��f�ws4}z����)w��C���U��!Z���߾�������<���Bw�m���*M��WI3�TZ����V%�lQ�����P�x�4�I��U�*�WI3�T2�'�PyR}hf�J�\jyLt(��3Bj�����7$ſ����z)o+�b�{
�˓�����;���� 6L+ 7��aZ�go�]m�5��{�p&���f�z%�0DwMt�r]�vM�qlפ"�k�n�&f��K�R6$�H{f���q��k��U��p�4jB�<q	��O�zܣ�!�r��M#y���`�FF�`c�-u��gW.�NLCw�F�P��aP���G�q��0K�������R��k�.�0+�9���2�N�@5n{pn�)m�y��	��y�	`�-' �gR%1�6<pxF�3�[X ��	1��<���8$3;� �6,�FL��ē7,���9�mXx����d�dˆ������^d�@OڏZ�7�8������-�[��G���\��f�n�O:{�*�E�I�0��=*D{
�'(�i#n�)�a'�6��*�������<�y�0N#(E��tK�b��u����Yw�\�N�JϹc��u�@9ޝ.�(, oE����&=3I?� �rb��
	zRu�q�jaYU���:Z.򶙃���3G��#3�a�d���N+'s4.~�z>����;{b2GC�r��]��8��j�[��̩�2��k�|O��դp�,l���K�sO�p�����+�����o02=5)'�/)F��sb<��'�V�<9���xZ	�z
��r�]|S���D�0[*���;���Jy�J�٤��*;�	8^e�;! O���J@�Uvy���U��w��U��w��Uvx���Uvy�S}zLg�����S}:�R��ty�S}z̒����%��W�9�\�����T#��m��'K���k��kX[���zO�z�Ѳv��M�c��.���a�-���[���;��/�N�N�F�Y��CL�`;��q�bWN�nn3;�@��G��������)s,�Rї{�Ɨ���aAD            x���ͮ�8��9�~��7�����6��y�FW�����~���%�$'��y�D�0��͌Z4#M�Wu�\��������36�n�����̗�_6>BN��1���������_����?����������{� �7ȿ��ǿ���?�������gF�.Z�h���5�@�ذ�#i���2c��. UeX 4k(� �2�A�S��S�AL`l��=�����A����B����E�~E����y����((�m�(�SW�a놛xjàu�l[qhEtVcLz��0��aJPن�")� &1���vYeJXW(� �2��W�7*�P�yK�1��R���(��Z�#c�$�m�)۠�+�m�R5����1R,a�8�ah���bc�D�mh���bQBPT�$�D�D	�DF�`�J�`%Jz-EF���D�(A/�HiHa$	��ID�)E�1�"�(��փ�̆�k?�ZL��~��/_���8�2��IIV�FY{j���JaÍ=�cЋ(E¶ ����|ʔmH����)Ue�W�P�A�%lCn�Nc�y�2�v��X)QeJ��(� &3����lCٖ+e��؆��X�m(M��l���)Ac��#c�$²��d�e�
e�T�6��hl�4˘)�"ɰ̯R$)�J)�!I���Q$٢P��"!0�"�z_�H�E{#kI�pM�zs[�Q%١(���%�&F�L�C�n#M�M���>�8�e�5�:!8��'F�O�Zg-�O�O�F�dXI��Q(��(F#R2�M[˨���ڄJɰ�j�F�dX��*V�#�
��h�+�1b��0j����
�YXG����R,��a=�X�X�J��b���b!8�b�G\T�����,�,�$c�J�<J��"��`��T�%
�b!8�d��fPI��y�$�a$,�ؠ�,� b%Y�Y`�F�fIp��f!8�f!0*͒`�DJ�F�`�$�}DJ�F��#�$K���(�Bpɂ�h&�d�-R�(�Bp�R��T��EM�f!8�f�peI*�B�(�Ra�dB�����R�gF�0B�0�d)�X�͌da8�d)���H�b႐�R`��fB�Xz�E#Y���^��p�Rp	�h$K�2�0�������B�(��+��Q,�P,��F�\ɯ�b)fp%K����Q,�}F��!���x轪Q,�����ba8�ba0łO���(�q�Q,���J��j�3�f!8�f����QiX�v��,�v�a4��:��,��4�a4�~�J�T��,��,�Y�U
gU���v�-z�2�"�U���DK�A��X�pV%Z`]�9J�F��r�s*���Q���0����D,�8ǈ⎐,nԝ�H�j�r��Bp<!Y*ܨ;��,��P��da8�d�˓�(�j1�Q,�P,VE��(�
��3��­��b�p��F�0<F�T��u�P,�>]�(���K40���v��b����F���B`K���] K��%4����.2������-U�(�Yp�,��+�8�F��c!Rzoa"�X��%�K��@)�I�b)p!H*ł5B��aK�JT�oa%Y#Yp
'�d��F�(�Bp�d���˕�0��2�+���7�\\�2�+���e%�r��p�5c�"�=�W�%^��q�z��@�"�{��+����ǁ�E0�Px�"<T+��`��Rx�"<<P+�S�b>�W,+��%�B�"�W,�\�b�8P�p^�4v,�FA�7*�k�P���0��2�Qi8��J�F���ި4,�xCi��hxB��f��)���2�V�UI�����,��,p��J��>���d!8�d��iU����x�(؏�N�X`�;J�F��b��i�(�Bp�k,ީ��xGI�Ch�)^�X,�z�(�,����*���bau�{F�0B�X([��(k`�{F�0B�X���^�X,_�#Y!Y���4������da8�d��r��ba;�F�0B�Xx9��f�� ��f!8��,|�Q�Y,����h�Ch����,X���,��,~
�G�f�^d$��_1�,�>�D�&�%Z#Z`��+��
�\�h!8�h�Un��k+<�%�rF��*�W��\��ٶ�-�<��m�L���-pƄW��vb�-�aD��*��
%Z0Ϲ�v�A����۠D�aD<%��n�W<bڭp`T�y�F%Z�$OL��8�j���b���g\(�BpՂ�ӈ�%geD���!<��a��:�}+<��3�����aɩ�~+<�EÈ�C��]PL�Z�1�������A1�Vx(�1��q�&x��`��|�o��uF�<�V0hi	���#��rB�8�}�b n��Fo �rB�8����������C���A1��`0p)!Yl���[���r�f!8�f�}٠�+<R��[��hؗ���AE̿�8�f�M�o����,��,^j�����q��a�"(�
G�Y�+���+����q���`����+<��p9�Y<�p���)�Y�Y<���b��`4p9�Z<�{p������q���X���+<�T#p9�Z�WŃb��`�p9#Zp�F1Wx0��	��-�^���+<�2�\����p��	���b.��pm�\�������qт-�����@���8�h��&�b��pPQ���0��������R�\�È8f (f�
;1��0�ST���!���,pXAP��ub.�aD�'Cp�����q�}���h�� F�rB�x�?(F�
�#Y0'B�x1**F�6zGb.�!K����b ��ȏ� \�C� ��G� \��.p9!X�OG� \�!���,���b n��.�osϿ~�`	�j���,Vߣb ��`�p9!X�$p�c���q��_��[���!��rF��KQ1Wx0։	��1x �P�¢�+<� p9#Y`�.*&�
f21��0�[�R,�0}$�rF��sdQ1 Wx0e���Q,��p�6�� \��Hx:<*�
�Wb.�a$<�p~O"p9#Y�i����+<�\��HXތ���@���8�f��T�b����N���*<W003p����\�@����ᙟ����xX3p�� ����F�Dx:&3p*Nbn��W���X�Scp#�4�1��Tcp#��\�C���u�j.�T�f!0�d�X����F���\�CH��D�\xF#R3p	!X"�G�������p��P����L�F�Fx+#2#p#l|F�\xO+Rp	!WnU�\I��C�e8�\I�-���ദHM�M��Ì�M�o��F�$8�(Q#p�,$fn�����`)?Q#p�W`�,�&�&��5���%�c�I57������p����%�F�B��	��,	6P�j n���D�e8�`I�n@RM�M����	����+�I5 7��G��&��1p;��J�`%X����̿M�djRͿM�ҝ�����tb��&������`%8Qp�x���	Vn�j n���D�Mp������ȕ&j�m��}3�6��I5�/��[C��l��~���,Q�o!W2<d�T�o3<Ֆ��oϘ�CK������~�����~�a&Q�o�W2<��T�o3l%j�-�!K��<��ی�g�����Œ�e���~��i�DM�e8�b�xC��~����~�p��7'���o�&j�-�a4l-%���h��~�p��S��xK�e8�h�����;h�~�pтw�����W�f�b3�6Æ^R��Ͱ��ѷ��,į��,�A��e8�d���j�m�Uj�m�}�Č�͸��}����D��e8�d�H�j�-����)�\)�j�m��uJ��[�Cȕ    ?��Tso��Q6�\a8�\��JV��-�f������+�j�j�m���L��e8�\)�!�Uco,!ej�-�a���:Y5������z�p�R�q���z[ใLM�e8�^)�AVM���25���j��zY5��ʙz[`*3So<&�USo��̎�+�|�������j�m��35����Qf��x�:���8�-SCo#X���z[`9*SCo<u����X�j�m���L�e8�b����z[���L�-�����V��j�m���L�e8�d��L5����A���2F��DV��7�25��0�2�j�m��<25��0�^�˪���7��b
�W*���U�n+<{��q���+X�j�mŅj�-�!�J�Gt�j�m�%j�-�!�JŕռۊKԼ[�C��h���Vx�$S�n	3��}�j�m�;+j�m�G�33��FzV����&j���V�H�̸�
�Y5��q���Vxd:3�n+��fո�
۟�w[�w[a�2���V�ͩq�WȘq�rΪy���x�m0ج�p�m���w�y0���΁b��~���n;w�9�<�Y�e~�m��h�oI�,5?��ppB�Bq�A�E0�G*��ێC�P��[��4K�`�h��y(
�xKr�f��U�����V��'�
-P���<~�m����o;�Jp�``��o;�%K�`�dU�����
O�%9�f���T����O�%9�f���H�'�vN<�s`p:B�Xx���#o���3x�-�!4��M��|����N���G��̞d�;�-��0�����)���G���"��87艁�"��Hx��R��0�����8ؼ���:��T��y�2s*c\p�ש0�,e�8�<���2�e�D�<�"Ie�e�<�)�ype	Uc�E���h�0Ʃ��<O�_P10�aLT����(�0'3�aLQ��z�2��e3�:x2�$����Kr�u�%�QI�(��,��,��T���Q���0�Nv/Y%Y�9��)�Bp�B`T���J�$�a$�QI\˔d!8�d�յ���`{�d��䴻�^g�����L�V:�in�O�ip&�]O�Q^�ә��{wE:��<�ip��1�D��9�1�t8�a�U�<ȩ�1c��<S�1�a�'�#0Ae�E�:�I�yP�լ2�
e�T�<$�1*�0�R�a�c�C��j��<��y��Ĭ&��üL��^��<��*󐦫�P�a�Y,�>U��,�2��4�a4�QiXʨ��,��,F�Y`e�ZJ�`�c4��Y�J�<J�F���FթT�V�Z�Z�����@��*��<���K�����S�v�!T�jf쯍��Uڛy������x���<��y�	����4�a\f��sD�/�qSU���f0�y�c��{.8�y��)�0'0���e�*�0/Q�aNf̃��PT�a^�̃��h�0ƪ̃���(�0�3�aLP�W�	�*<�Rc��Ux6�Ƭ0���
5�<�!4K�����,v�kb4�!4K�����,o��Y�Y*�G%�h�x���p��`4��b����p��`4���UfT�!T�[�����5㴿��m�d����+db�z�y�M�88ms�9k�=�x�M�u�}���P�SN1��e����cU��R@��Y�� �X�1'�,�w�`�,���~J����U���P�0U��}�8��#�ߗ�5䴴T	u;XZ�o�}��e�#��8��s����;��w��k' ��q�a�y��KK���/-5�ܯ�/��3У���0@N�Y�֪�31�n$K٘1��,��9#X)PFV:b�����3E"�V��u_.~�B��'Yg�S5P�ASߝ�6���7ߝI(�ۏm�#@Ve�~gEt��h�i$O1(��D+WF�ƀ�B#%�����
�u6zL,����RFrG�_�r^h�ļ,4�7�lm(|)�a܎�[u����4u݉�a	��N|s݉<R3�	#)P��m���9#і��
e$�:#1��H��iKI���Ȁ���/>0&�#�/��2޽��/~�x[f\�͘/W�L~X�cj��snV]@�S�@e�w&:�9jĺ�;���F]$s0���Xg����x_e$V�36�gB�A���R�r�� Q�f��Wpĸ��I;gh��7�(������ı�$�Em��F��S,@�hl<ά�������(#	��A��S��r��(Q���i��k��>"��8q缛�����v��w��Q�w��w/RŋT,�Ho���8V��N,��4ҿf�-�*Y�F����v�->_�3� o;Զ��³J�!=l�7N�9w�. �zOqM=w&�!Y��v��Τu��[@��ܞ��r�������֝�jan��{�+�WQu�e�sƖm \�v�ub"�Yv;q⽍�ݗ=ad
���a��}<Hb=��g�B�R@���'휁e^kh���V�ۉx�w#��8r�AM��cU��

���f��T 	�<s_l*��Z�휡e6����DK���8}���H��C��"a�����#G�S�$���}M��Ζ����[���s��:��=i�>��m$�[I������r��C�� ����=o�>�a�5N�97�. "U�e���w&8p��N���B����	#��A�0��+��
�'�6Э� �� K��adI�����y�-$OI�rj����}^��WbƑ����X���N6Bh徝��d�F,;q侃�d��F�=�p�]����=����p>`�8d��:.�"ϑ�R��"e$J�{,HB���<
e1!��kx�[��� ��l�����w��Nqྃ�X�.)4���A�0��}:�G�m�ž��(�,0�G+�Q�}B$ܗ��0��X�2'�+�}$H�ݍ�羬�򹽰�o$-�'g`��ޓ�蓳��DZ��Ny� ����V��6R�p��
a+=ѹ�����+�]X���",mQ�};�p_Y�o'�-���2��Y�O�`T�7N����Ni��Q%������ �ND�N;q�N�`�x��"adc�;(F�ǃ��}���BF㔵e��4D)�mD���]��"ɏ-e$~�F�v�`t���%���SZ�nT�?�2..[鉺e��L,���v��}O���L	~��)��#�񜊜W����]��v	/��e�'D,��!��W�T��J�1��R���8�q�h�b|x|��J+��ڵ�����;h��'1�>�c�m$�]���FFpdM@�݌yO�K��/�6��Vz�+�6v��B)�mDY�]��"�+RF��UNk�� 	�A�v�Ćz�N"�P7�`^@DuKZ�n٦=#A����i/$ ��ǒ�(4�{�4EݨK��P��b��_���}"+�P?��@��c��Q�� ���N��Y��E"�{��F��*����S���}Q8��VZ�+˞ �S��	�ܷq�IKt�>�$?V����W�a�>$�>)v�����m�G�'휡eO�#��	��عC,;q쾍����JI�/s���b��eN����\��Ziz�e
����9�n |��I'�/�eWb�_�kİ�@-��X�0���tP:�<��P��O��W������������N(vߋ��IOt�>�$?����0��u��@�o[��S�bj���4C��n�»>'�P�ز_��BoĴ'��HP�9�B#=~�:i���=� 	��]ߓ#�G>��8A���7D7��{��r�N$�Yz�~�黃�J%MQhc�r�IWԿo�> I��m�N���o��sƖ=A�V�����+1oe�����J�]5'=Qhcǁ$MQ���� $��v4��>ݚ[�D���Vo ��s�
����Wb�ߕiİ'��H8ԥ)
�������?��Hb��h�α�˶0��"�P�~l��ߜm�����b{������ͽ�`q�IO�( �_�)�ߏ�~ �K量��{v'�ЕeO�2�Jyo#�    U]Z�K�=I����1�+r���ǃ$�ߎ���}�G��ϲNZ�������@:�~q4�F�Mv'-Q?8�{"��E�ŏ%=ѵ���F����h��J������1|4�I+te��*Q:���6"���$�D��*cd��#���xP��V��9�_C��d��fhx��@8����+��s�N��aP��$�@��z����s7P���:(F�yo�G>'}щ��SĲ��9醮,�@��*ᾃ�gG[']ѥ��$�`�-a$S��n�>$�>��8';C~8�*%��0)F�@�Q�P�� BV��aVpq}�e��&��]ٸ��0(��o�;��I��.rH�~��pD�I34L�/>��P�� <\�IW4�*.OR�A+i��m�����h�\t 	�q�EN��݇p��(휡e;o��P�e#���C�tEì��$5��'8銮m���-&��������
,+���9�v^�Sz��y��w2��jD6v��j���D8�����-������$�d�����:b�5��N�c���Dø �<�������h���^ <��KK4���A��@�7f�'��a���x鉮�� �������Dp�^h?���!�6�����KG��^'�U����s�[��\������>Јؘ{w��E�[��q�ɔ��>X]6�x�;�.�㊧�������v�Ь'(�x^��U<b�O/m�0�xn��HP�x�#��)i��I�S�K��{�~|�q�ڲ�i�R�ۈ8 �/�t_���u�n��.��|�,��]"�܈p�w�����e����� �`__B���d�yy��h�t�(�*Vw��9C�6�H[4���(���C����Ԃ �����]�AxU��h��t7P~x\U��]�/��c�o�{銮,�@���-J��I�Wo��G��2����X4R@ps��̯-͊�(#�z	����������@���"��8�Y'�%�l�''��������f}��N,;q�'	4�$��9
�d@�����d���{�~����ڰ��+�tDI�u"~�Hkx���@��2�db��׽�9#ǥ��PFb�X,/K�yy��h|���z9N�ʗI��	�Yg>��3W �DYA��'=�8�p%3	��F���i���+ ���}�7k�B"�z錎-����@�����i'֩�N�H썲!��@Vcd��}v��ί��362�#�/�A9//9��[!��Y~3YN%x��0j:~���:�>��s�AS�D�p�~��e'���D�x ��Ɂ�9��-/Z��%WpF�kQ�X�V�/nǼ���y<�����A�7�|	;p�L=�?U$l��Q�A���y:�����^z��J]���K�9@D��;�_����ā��2��X�FF<v��l#�ܧ�������Q��Z_��2(r�ۈ����i��i���1���xWS+g��""CI��2F b��GƢ?�,� ��h����w&�!��1r��"��s�L�����`�`��O��}�H����jm���4���30K�;h����;q�;�$�l#e$J����
$���rs����m�,U������s����;h�3w�3;��3�/�%l�@���=5Hb��
u��%�ҫW�����Xv�����Zyo'�N[pi������ �o�	)P9l|��
$�^E3��2���vov�вD���;h��'���.���8v�F�����(F�ܷ���!���ۊ����'dʴ�:6̃/�}g�B��J�A���ja(g�Z�7�3�rK�����1-�� Zb��.!���������v� ư�?�"�^@\X
M�lO��m�³JC�;q�'���"ެ]�p9/�����Gj�Dx��G��/w�':b}b�ȃ����*�Q	�:�th��C�LZ,w1k�\�����'ʸxs^7c^H��'y�ÛYz�b�.���Wuv��w��}�$�ï� �|��ʗu��ֆ�v�ݬ3�J	)�N�D��R���������o����0��\fwXrO����f�����|��������l��F��y�ƴw��u;�-.�J�<9,+~������Y=澚�Kn<��+ q�;d&W*�tY�+O	Y�+�N�m��l!Ѫt�2��S�taaL��,m��\>]p,*]Б.�7�2�a�ߘҗ��WS��7��R)���AڲO�Ь��eҍ}�֫��ho�y��P�XI������R��SU����e�
���a�;tO
��>��U@KT�p�<�!�I���H��åE�L��OX��F�.�t4���V�K!�'2]8�.K�.W�.D�p�AV�.�H���b��t�E�X2]F��ƥ�R���nP���s�.W�:U&�)��[4���"��
ǥ	Ǣ��Z�����H�������D!��L����������
�V&Kd�Ǔ����t�X�tḊt!K
�t�%���B@针����V�Kb�'�����t�X�tḊt!K�?�.�H������t��ta�C1�����t�X�tḊt�U�ȥ%e�D}�PE�Eޘ>K
�W�K��tI?�.I�.TI#)���.�U�<�6]((�.'�"��'�B�U�reN�'S��t	�S,m��\:]N�y�0��2]�>]�+�ta^�t���t��B��҅c�Ӆ�*����πt�|�S�Q�̧��taz"5�I�2](m�5�Y�.K�.W�.D�p�AI��'>����|
ʧ��8��G�|�K˴!��gaT��,u��\>],��j�3 ]3�"�Ӆ�*҅�`����$Z�.�v#q�|ƥ�ҧ���t���H�ϧ�E��}.�?j��"]��>�ْ҅�WW���1}�A�Y@�3������:�q4�7�3�KI�������d/K[�oo�?�4�5�p}Ts�������%*x8V���u_�-�_��ÇK
?�.�H������t	E�.]�"	T��,u��\>]�wS�҅ E]�0Du�0P>]#��G�¡u�(y�t�`\�p,}�p\E��>F�\�`PR�Aԧ<Ŗ�"]�#�)}�.Z�.���ta�)q�±���q邷�Kʺt��MY�.�O��v�G�¡u钩j�҅�Q�B���Br�taJT~<]�_�.�O�@}*��֥ut=*]�@,L�Xñ���r�d�xBZ*L�0��J��M
J'�3���
GV�
כ�\��0*WH�:W�h\�;���V�J�
e������ȕ�C:�ϒ�B+����l�ta�R�p�±���4̆O��l�t!@V�.Q�.�OG���(]8�.]��\��0*]H�>]���*����Kr�t!��t!��ta^�t���t��Ǒ����t�X�t��ZN�.�����>�5�)�>]�"]��x���O���BE��ga\�p��(]�����e3��g@��>EԧU�q8��'��ta.�g���¸t�X�t�?�.TC����)��T�.�M��QC�D+Ӆ9����>�҅c�Ӆ�*���TC�����IY��g�|�x"�?��sd]�0'A2��'YT�p�#O�7δX�}Ib���LC%��G�]�ܛ�ed�����{Ӿ,S�D,o%zӾ��8Ak�Iћ�e�c�"v{���!!�G��f��7��0/.0J���=
��?�ۂ�s�}Np�r��@"z`�p��'K�<.�da�\�\i��.�d��|��1��Sp�(`0Y,m���q�d��
�-��҅"jӅ���RS�����V�˕9��J�K���ʤK�T����E����\�t� ��Ӆ�H��K�`1d�\h�.F�.4Z�.w�,z�!҅=PN��K���,�L�p>8]8�U��a5�X]��P2].�EL[}��hE�ܙ��D��9�^,N��K����b�t� ��ӥ�~8E��D]��P2]�Ƽ�>]h�"]��i�8"]xN��K�t�(�K�� a��8�.�+҅$    �҅���r�-b��ӅF+��ΜF�'�E`Lעx�.<K�.�a=�v�d�\������"]��uSХ	%��B[�tЧ�V�˝9��@�����8]�E���K���2].�y��t�@Q�.$Q�.�Y�t��1��B��rgN�'�"0*�"N��K����<��t �\"N������"@���Jf˅����Ȗ;s<���Q��p��z	$U�8�{F.[��y��l!A��~'�R����B�t��1�o��h>]ޘ��!Z�F�8n�+X�t��˅l�_���a҅)��,Q�.�N�j���7�y�*]*��B4�;��O���`���>r�҅l�_�����M}��K���Կ�1�o��hE�ܙ��!��F�pS_�R�K�2�#�.TS���HT�>OT����R���F#��U��נ�t0g�SaS�1�ߊ��*֑.���g��-�}�HzT��e�v
���}_��� X[�Ҿwf�@�|����CU��O���v�VTi�?A�L݈���/�yn�P�w'{g4+4�ϸT��;7�C��F�d<��Jk������4��埠�vb1�܈�_�	͏�UK���a�V���W�??x���D��.�M�jPT�F�:Z1_0��]�K�+���\s5ӟ�.�̏�_ܰ�q�:!zL����㶴��@#�0�ȍ�K렌!�'�7�i��+�
d�OCR$��t�t_�?\��+�?9c�xP�A �6"<LP��~!.V6�qe�JO�0w��֢��e�W<�tIӠ��Q5���!�'t���)5T鲯cG��t���i��w>`})�Ţ<�t$1`G�CL/�	Α�ei�X�,��~�����|I+PY<ΓB<�D{�.�M��G"ĕ�ǟ��U/?��@=��I�_��u�	�ԟ�ei��L�Ⴧ��ht�>ꚙ�� V�?����`ԖY��0x���U��o�㨶�C�?bd�`5��8����g&�-�v�D�%6[6"ο���d˝����͖s=	e�
�E�ҥK~45Lq�t��	^l3N���xhV͊t"��Y�.$�L�m�Y�.4Z�.w�4z2�.�
���R��5m�J� 3�.�>B�'k��b���_S�OKukQ��������.�t��|��1��Sp�(`0],]����n��B���^
�Kxଫ�d	�휨KJ&K���g]��B��rgNc����p��,]��u�V2W���u��TI�
���HTm4]�@2Ip����	Ba�Ah�$#?���g��>2s��q�̐c�uS�����l����/>5:�x4Uz�P.E��E<[u��h>Uޘ��8]0�.
�*]��LT��$��?2�!�8�.����R�Iԥ	%��B[Ĵӧ�V�˝9�G���M�`8]x�.]�#07��L���U���8]���t)�%�$͉�t!�d�$��T��ӅF+��ΜF�'�E`Du��p��,]��c.�D�Kn�����.���@�t"N��KJ�˅���O�H�;s=�H�Ӆg�ҥ>�Wd���I���ˡ+b�W���U��B�l��!���k�|��1��{����޽�����RYH6��i���=R��?���u��ppyc�����N�,,Y�+���OD��(U�;�
�6W2�O#��4tpߞ��v�Q�(�����x�
���
ӶoP.W�$F劧6-���p��ٵ������$G�+�@#�s�����_߳�Ѻ\	�{���+`T�0=��:rep�xM�����,F�#�k����|����6�7�#Ό'1$�^��He�%J�Aי�F[�ooп?�,�U�x}TĤ�Mo��yfl0����!Q�����*׊�/�T�m՟ޕp���:1b��n����k��(#3��4�)�gJ���^;�(�ǽ��+��{�.��+��$.���qOs�xP�A �6",���hO�2IC{�=�e�N��e����r��i�����l鰽�����*x�m{�������נ	=`,x��q2�p�@7t���H�2�ܑ�uiI9�Kή�����[<�FAw�E�=O�I������v��,w�$��n��¶AaM��V��۔c�b-��r��zt�>��9]8z�|�y�`�
�����w�����=�hӈ՟��u"��ۈ:BHXN���Hp���Ks�yY�=L��*�u�4��F�w�D{���A��+Q�z��!i8n�(ڀ�ug{��������,m���7;JK�N�G�0��FoxOGiia��J��67?��=7�;�Ѭ0=�m�hђO�pD�t��[��ȍ���Q�V9F�q���J�q��݊"?��8�ˤ��\��ճ�j;��b����JDRz8Q��ޣ��:١nkP{2��-�ޭ~�隦A��&ua���u]����_�V��	��ۛ�D�D#��u�Ϧ�|�'+��d*��;:+b]�a'��3)�Ft�����S�2��8����xo[��2}��<�[i6?9c�6��I��	��$����o��ʶA+��J�����-3�3r��i��u>?*b�W7[9���N��8�#B�#�I������]H���>\u4�_��<�},]`K�y�=y�f;�p���Ρy��G�k1�A������g��uкr!�j����,|"����#z�PU�,cA|t"^�k�,�,4Q�X=����XDyt��7��-)��%��9�B����9Ԗ)�b;:6�y�K�c���H��8+��Z�m�pЄ|��������щ�b�L�,;S)#1�2P��t���q�#���n�8B��j'}g?�>�|By;i9���`(� J<1݈���'{Out��CN�t�>��9]:�+�C�u0K�r���,�Q���@�ל�cS����sh��$�X����$��@�y;;�~RZ����U�OJA����0�ά��D ��w6<�����z��w�=L�y����	Љ�����U2�YZ��ݕ�x)�{�w�����f�tppIQ�`Z(XA�8'�Қ.���lV���	��*X&��(�=�~�]u?)�H��0Y!��៴Cg��OAA]Y��Bo��O=Q^��R�?;�8YƂ��D�jJ�W�$fY�%�ww�⥔�	 �M�'�wf�-)	�J6X�`0-,�f$}��ȗC�s6��TP�y�g=�٠����f�'�V��^�̡H��`^��rЙ*�SP�F���<ˡω��ȸ>z!�:ReP]R���b���\@?�HP�H��_M��_��wk�ҡ��O�u�}�9�� 8���^y�C�F�Akĸ��t#%x���.94�e��i�������/��Ġ�y��w���XY��<���:d��Xb��;��P#e$<��j�I3g$��젊b�ycP��Gƻo,��9�}B�1���;���M��$@�##W��IDD��$@�hy}hz�`����<|E�޷+�X��A�},��ĩ�ΤE �>6m�
TF�e���6�����lh#ʇ��eA��W���M�>J����u�-�@�-�{[����x�݉�Q$��zg���A�0r�>��+��9���=�],&��cy8�����i�:���Fbz�8�]֯�D�ᕷ���Īd���{�	�� �c��7���q	��?V`�d@�0��y*PZ�/ic�}��-S�
羝o	��)^��FZ�9���$@G��j/��L�H�S�%�bt%DO���Y<(� �'���{��uh�*H��&/�����Q�)@�ow韜�e�-����o߯��9x��=��u���F|�\ݡ�-�����SڼY�{�_�����a�N������Øc�wuq�p�<��k���N��b��V0��d.�?ov���'�N��f
깟���O�A��lxķC�4ڷ���kz����E*?�D�z"x]����D�tNȏb�e_�����
���"��ZaI��
���:FŅZQ���}V��������6���y��ޝ]9�"�OUe#�k��c��8��G���}��U�rވ8��}]_�    C�~a�y�-a�K$�5��Ӛ��|�/H!i`�P�ñ��hc3�Z|e��
���
�
#t&�~�����4��OZt?i��Ug6�K#xB*�Y}Nt�G�Q�`���x�t�ʽІ(�gJ��s�y��X����3�$TXP��I���N����t���[Pξ�m�:���y39�e�]�:7��|��N���"})���T#�Jz�e�}���k���7�m�e$���#��OH�����$@��ŕ������-^�\ZZ���;s�ۈ�Y�+k�m��W#	�?��}��)x�q0S߅���M� ��'gl�;��I�}� ��'p�:$a.�al"�I�����9-ʃ�.�as[�Y��"�􆟜�]N;i	?ASם�;�~�|w&����cIoYܺy�A�0��=-H�������)�5������A��O�Ų��t�����n���A��O��{7R"~��ؘ�%�*��g�} ��u3��D�12��n��;�A��u�F�s�Ct��J����	#)б���y��Γf���y����Ƿ�yk���^8�Dx~!�2^8u$	�X)#1(��������@�!�X����tA�?V�#;(!����l9q�>��X�| �EO��2!-�<�-��`���y�^l�--����Rk#����>9c�xP�A�w<1�ĉ�6�g�HxW!H[�	�nI��N�<�J���[��$�}��f�F�s7K�;h�/�ґ}�|� �"%=Y�H#o˦$�����o�J���~i�>17î�]���4�ޅH�C���$޽w%��tX��H����W�A�i���+�A��O�̰����tN� �=�v��{��V���t9�ʣ�����o����m��3�A���U��[�Z�K獘`dEc�K獴>��A����8�������
��Ή�WÝ��E�.óm��MF���B��%V�3iv,_> �r'��+�N�˄4o�G;�/��GF���'������젌�������2O��和�p/ƶ.,Ӏ�a��"B��]��v�(#	����1��\D��#W����+bV����Q�(Y�"VH�KYÒ$��Jר@n�ڨ@�6�>��JϨ@�vKL�}��߭~�mT Jۨ�Km�FZ�tXi��6*�Rۼ�)V�F��͋�0q�m^������Q���H�X~�HY��9$(��� ��P7�b�ڦ��ym���9��V�چ�چ%bms&-֭��ILX�t^	�6,�*ڨ�˪�i�n%(sX/sX"�9gR\���aA��a�X�$Y�3�9,Ȣ���σ���=�"��r	/ν��G�]@��{�5/�w&����i�C�]H�n�Vh$ʇ�7�]@� {�ַ���������[��=��X��Gj�+i�n-�� Ѓ��[�LZP*��Cw���qJ�������e*�q���:ɼ���J,//"�{�u���H8�z�ɀ��H���H��#	N�/�*N�������J��wZ'��bq��buy'�� �1r��":�HX�I�SF��3� Ɵ0�[H���<S�@�e��r��<�u����ej���ւ������՛�����#��	�:u\�o�d|� ��j��Ń���y'N|G���U~�����C�� �F3u_�{%?M�_}rƖ� ����x�߉�m$x�?I�0� ��ȡ�xб'}s�s��U��$�)���\��@ď]�y��Ӂ���y"��x�0�Y��Pa'�8#ጋ���)�舫R̋�� K��E%F�YbT�y���,�~%��è@���舫:�;i�aQ�с�:���*ĜH�U�����@Ig$A�*#�=�����~d��O)�-e���AG���'�|���W�e���6Nk1,ϥ��L�1M�g��8�5�Z�"�5Z�\׌H��NS]�a]�%�uͅ�`F���т����FA��NSa�M���1�,���,�o~�TזѠlH��D�w%-R��Ne�\��GF���32Ô~5T�F��3� f�����ӎ��;NJb�w�F���T�'-w���y�IA�� �Ã�-'-h�s���KK[He�s҂p�IK���F�źU�='-����y�iDZ�[u�s҂p�IK���F�źU�=�ލH�^+g$A,���[uZ�с��-q^�Q���4��hA�
�hIU�XRm|�le3��(9�h��k6�|��fZ�Qrp�F��� 4_����k����+��X8_��
W����bb�L�p��P۰ ^۰D�mΤ���젶aA��a�X�$Y��6,(���櫝�,җu���Yz�O��2�wpO,;q�>����F
H����C�� 9i��+r65�ɪ�I���[��`k,K��	�ۈ�坥��$N�G���)#	P:���������GO�Fei�T9��D龮�w#-TQ�#W ���+��	#%"B�#;(.cT�`��u���m���ͳ�Z��w�^���d�>A�����O���8p߉G�ei�b#�=�|s����yTb�%�ֵe,(���DY�r�;�ye$�*#a�4�B��L�X-%�"���Ř�,���Vr�2�y�Ā�w"-� E��+P��c>e�Hx6.�BI��GF.��PF�sr9[�H�`"� ��G��Is�2i�u"V�9A��I�h�Pΰ ^ΰD,g:)�h/Pΰ �3� :���B]�ʆ�ʆ%be�I�F��v�ʆe�ڰ��\m��Z���E��UC��'Z�+i��h�j��O抴͕�H�
�b�OD��JZ�tچ�چ%��͕4o����tFD��&}	��K*Z�jB��������Q�Hm� ms#�׭b��F"��N�S����F��[Ů��Dj��[��ms#-�-��6
Y�ى�0M��ls#-�-��9<ȑ2GA2�F�wZ�[���9O��< r���n-qhLZ�1hLF���	�s-n�i����\�+b�{2�V4�G#���#-�^��l��R�Z�(�X�O��"�R^�lXܐ�F���GZ�
=)��gX�p�����H+)��g[�+;��ш���H��} +��g��|4���=Ҋ�P��aq�=Z[��#-DMT�zy6x�D,n�G[��#�H
UO>8䣁J��ڍ��*���;ģ���#-HI�x�%N��F*8����Yųq��x4R�$L�ڞ|$N�OT�'�@���Q�$��룜�ڛ����Z��AӀ��N|��	�,���$@�0��>-(.��Lxx��R�	���e�}<� �Q��c�0R@Ŭ�ǃ,p�=���ߨ8d��Xb��j��*�2� %��1���="��A�(	�f���a�s^K�k�x�#ݷq��z�+i5PF����+bR���֬1r*�"֟0��}5@�� �ND�V��L�x\h5k� �}
b\��F�G{5kA� ��FA�f'�`5kAÃ��I���y��ڵ�Q�Hm� mÑ$��Z�(@i��(@y�ڤ/Wa�ڵ�Q�*�>��pߕ�Hi��6
�mD�mv|�V��6
�mD�mn�EJ���Q�Hm� ms#͋�կ��DkDP��H��y sxкX� ��O�ޗTk�B���a��*�'��2(�t�r#�'����������ϡ�d/K�;��'���I'v����|�������m���a�;�{��:ȉ�S0O�
;�����̈��p���*��'ff��;�	,7�2�If=K��+m��#.�&��*��ȓ��9M	��UQ�D�5L�%�Ҳm������x��c���36��2�'��8����P�ұ�\��a����|�)�y���m�s9�J��ɹ�u���UZ�O��wgb�5�*-�q�]�8 �]{���ˎ4m9X}��|}�5��-/-�'�-!>�U"xH��v���9K�eߞ�٩�ߞ���/()h`��D{�`��`�D7�N��0�z�;S�M�
<���'2�b��è�H��+���_I�y�P �    g|O�B	����#�#�>�B\�����7�����iJN�9��u�So���0�L�H��a㭤�9�h��t�ז��@{�%F�N¯ʚ(#	P�I���ŊY���)�c>2rE�����H�2� y��1�����)j�\��GF���3�vm�BI���HL�FedZ�����}d�xO��<W@��^��R����/r&�U�t}T�ߡ�;�L�D���X�$��?V>��N����+�����V�A8h��<�3���CXS��N8��'cJˈ<�&rN썗���l��s�f]@� �7�O��o"����lD����BZ����#)�?���Y���y4����Gͨ`�8q�L-#Aia��ļ��Һ
��BI��a��}H��y4 z�8�p��z�؝3������N�����+C��e$������4]<��2�+��1�o����	��P��SG����4ݖ{����~d��8#ץy���)#	P��!t�8}Cl��M�0i�v�8�x?��e�z8���F���$�_��h�E#Z��5I�A:�����߁:�D��Ղ���w~��˻/S�P���}r.��@���@i��w%��w��}7RD���Fp����a��}z�tt���D���&��2�K��h�	NnD�'$8K��ad2h�\E��	o�����"{Dd�Ȱ�8�A�(����5z����~�M13�� ����}gb�����;�!��'����4F��F���}���c$��@Ye�>b`E,���G$a_*ad4��f��Z�'��}��+�}��F�M,���a�#����a�P�F3�]H�i�������
�1��X�
�)��}�44P&@UedE߂�����S*�6�53is�8�ͅ?T܈Sis!��ژ�̤�Ѹ�:��U׾Q&���ϔ�V��p.�t�&��X�üqT����.S�>��3��5ͅ��f���L��ȭ%�<����"�0o�^����
X�X���j��P�\��xƩ�9��Ec��R1Q���fb��H��l ���m��i)��F$^aN!o1Cuj!o�#zx�Ǻ���Z�&/6�L�_	�pl����r�mE�}W�"Rq����W�Z�cFS��I����V�F-�)�_��_��@ᙵ>��t�4@�4J;��8�a*E���a���j���Tv��'��lo��E <I}9���Y�F��J�����Wr�}�<\���7T��	~k����F��o{_u�=y��B"l��l�*�L�P(#3��H�1������(�XO�����s����W�W�4�~j��,���;h�31���W�Ļ�.$���+Ff���tyu����+_�0����²Gp5Pe�w�玅�[�S��$�;(6Y�H<����`?�ܯ�q���r���|���9�}�,߈
Ğ�wS�����{75�/i߀pBR#��8p�A��O{;�-*;��e �I��_-�n��_bwE��ـ��I휻Yg�I�4�݉��!�{�g��Y�4�"��m��^�v?�]�n�0|��!�O���� ���ױ�۝��L;�-��L�+�A�I�\Ow_��QOY5Qy��%��W�/��b��������D=�'��Rf�'����f|'F��	�%6p����Ըk+-�0OֿQU�P5��D�c�V-�̽�%+���F�k�:��M�[�J��jԾuhr��:o���Q3L�Ϊf��2�֩�W�tn��:�<G;c4Q��7�3��3�x�~�t$�dg�i�692�@�:g��p�.�g5�N�BJH���eTpʥ��̸l+.�q���L����� YǍ?�}}�x�_1|9�R��]o�ցY��@~�B�B$��� �L��q��[g��	�x)���4\>���AO���:X(�}��m�:��+�1�J�My��;��ȹ�����w��e�����_��Wt��B6������H�oX�q�0뇫��\f�QT������
t��mO�y�<(�v�e����o��k�̚ߍ��Ư��\xĀ�ai?9g���~��u'�ìN��O�%����N:���^��#O���B�؅�||�[N�O��2������׈�`�I��I��OH�]"?�t����� 9q
��K_-�myd�Mp!.� EXdp!1�wq�ą�ʾ	�D�3��,�#�a��u}F��!�F�7I�"�F|��E�1�8x�M�a������dB?ad���\�*#�ے+b��������1~.����?��o�����Rz�ō���e�ƣ���g�?9���K�4�����"��S�$�|w�@?N�e�c#����p���P���E_�<O�+�O߁(��4��� f�ARY��R�Gdla$>�-FK�J7ad"�{^����g�:h�fT 	v� �ڏI�/or�.o_^��p[]��l���N��q�H+����NG���U#>�$���ț�� i���W�Μ���$�6�̰����4w���Ew"ؿu�߉S�		��U �$0�0q�;#q��+_�0���ts���UO��n�\׉��s��}'�{�,�2K_�Y����C���L�*ߧ>N�-~���!�	\�wO"��A�m ����-�1�s�N�
�,'�Z��'
9��b#Am���1�ՅY�6��1Qo�L@��7�v��a9ot�����N���ƨ7Icd�;�Ɍ���k���H�L�MU��:oe�_<$�-P2OPX�Z�P"� �a��# _:�X��6��">��m��؎tRf�t���mQ�/'{[)##�vg#�ָp��F|��;Gٸ�Ț�伃ʦ��4�xeӈ��r�wX�	���vP�t�te�ذ����#�A=# �)3｡�׈O��B�	)Þ��P��5�W6Xq��{�l�?p�HP�������F�xF��X�	7 ���F@�-��W6B,��V6B����P�t&�[�i��0�M|@5�'ɭ�&�~(r�߃X�@��%����˷ �����=xe#D|���l����M���X䕍^�#V6B�C�|��F@��W6BģM|�ʦ_w��^����]����=V�m:	/������9B�C?|���6��#C>A�#�}k��"G��������	I��E��8Ƙ��&���|ٶ�Ǉ�}Z�����>��f#��
1U��"~e䵪�@x�Ϥ�و����@�l$�,絨yr����LVn6"���3(�l ��絺�9x��Iu�#�h@�l����B*ky���^.��وo
�7��W�NZ˛T0��7Ob؏1��@�l�4�~�/ku�s��f#�WV�{��]��C{�B���>j��}�z�;��1���Ar�oޑ���ޙTj�,&9BbH���=���V�%���^q�BMY����l�=_g�^k4�9;Z���S�+f0�~��bY���	�S�Y�5�ɝ��<��`�Rg$����a��h�qP���j����L�/��A����:��A�x�s���i���䡷z��v�Bo��F�3/��|��`$acd��A�=h�b�-�5N����`��6P�1jɃk� �sk;ǁ[�[�@���*+��z�Y���Bo�"#��A���t�t,���,����@/z��'�lTA7���V��wĶz7"����A�f@�wUX�	l��I����At#���y�#�V�����z7b �z7R|��`Q��`�?��ލ�aU'�V�F�;C�BG ��
����F<N&���(*���ʼ(@�w9X2	���
aB�'��l"P\�	�0K��J�[VLh�Z�A�q� D*7H�uW�k�,?�[hA�ȠUo�J=-���51�k-��=��1EG��^��(a��5K�΢L���)Lg	&�Uޘ�b��Ժt�9���+&��e�J
t�}+h���+�X�}eL�7\ ir���7��1_c�ų���~�`��Wcڽ��dfؙ�^�/��|g�+    &����v/�	P�_VZ����'�PҐ�}��톀��q.���;�����8�x���4,AX�����P@�	��;Ca+H���h���$��*HO��G6B	*#=����362�������Hxl0�.�R6&��
e�>8h~�)�n��l���Tx]��y�y��K�,��:d��.�UO�O�^�5@�		��526V�45il�C�C͌�x
�&Z�+���L�Ѣ1����v^m��2FFx
8�2r}=�=ec^?ڷ�c�~rj�h�aA��WW��&�/�k���9C�6�);g���?�{3����H����V�	mC�:�F��� 9ཀ��o�;�K��a�(��/�>!O��:.��&�F|/ڬ�O�����}��o^���d/K;����6�љ�C���*��>��������!aL���x�d�rd\|�د�%Kv��f���%c�&K��2;
ʿ5��������Z�T׷Y;�O��2�
�'�@��bm���> �:nT��@�X>x��_@J$Ex�!z>څNGubռ�:n�b0��J[�%�վ�x��_@oL?[6��"��Q	�R/K�,G�+��k��I��R�����rX��O�r޹���j�0#�m
���{ެ.�2B�N�\$\!�ѳ�ŉ��i��x�YLj��Y.�L{���^4,�yפ�(��u�_7�P(���ਊ��4yo|�0�|�)PY	hr��r�q��<+
�n(v�8a\��P$��&z��M�O#;�ed*g�_�>����ō�I���}%����U<��}#aՓ*ac�G�c6�����el�������#��L+�1���� $��!Z3�+��e>�=�G��9Ķ�����{'"��܁y�9��ӗco##��g��ƛ�r?�:���L�	>?,��1��f���r�1�|��Έ�}~w߅T�6�w���WK��lxŒ#�_�d;)F:�?U���G��R)#.�T�Y�Fv���DT��*�	���~i�"��8�m��'P�ĸv�F�Ssc����~�|��J,� N>pq#�z��?pqyx\#���1�;(�L>pq#EXWMf����a;h���@�n?'���y�'��NI�Q}�瀪�xl�V�IM�F��ҫc����"��h�-�se����do�26�|&;.��+��o���J���_^�	c�#'G�fr�.�؅B�~�G�B��K�r�m��湇��i���m@�ד?��u��?^����բ+�D�Rt��[>]����jT�K�s����Kͬ$:iV�+sV�L�zY��0�}ŲT��R���Ä5/ͦW��U|�(�g���sy�8���q�"z��f�r�T��\{�o6��k�#��R�GE���kAG!u�o�>]ۉGE��}�$<4 ��%?��(�q�E�9i�X��%?���\�O)R!:	��^��c�6 �[x�>�����`�$����#P\m�?#�6��m�8�p�:#a�$�@	�}uRd�d@Ie$C̔���~�����T���g!���Ҡ�����OS�/�����L��V��_O�����A�|M��^	�8R�����IL�������ɜ���A���H�\I�|�@�l 8�'eV��D�j���
����AG���%��H�����K]�������H���=����8e�J��u�"��0�ɭ�2ۧg�Iz���\Jď�#�ů�NZ,��h�\��GF.�����������1�I��q��>z'1�J��}r��@X/HK�	Z�� Vܝ���8rߋ������d@�0��}/����:q_�C��~y�������[�Y�>-�M�7"��8�1r
�"F�Hxv.�DI��,F����Qg�S�u�l��2d�>Ѯݷ��a�le$�:#	bP9�Id5F�@�##W��FJ���FvP]&"��i{O7};L�&mͣ����1}rƖ� ����x�߉�Q��c�0���a��}<H�=���Cۙ<,�CY�O��2�젵�ĺ���I�\t��'a$���#�)@n�}>Io�e����/S
\��D�}>��o'�s�Y:���XXI+Tc$A,��kR���F
(��� I��˨�α}[�1��&.K�ɹYv1*��'h�31�;�Y�O��}�_�2�?V$��@�0��>5(/�� >��@����2TI��Di�.ݷ�` GKI���H���H��~�����A	ĨϏj`�7ǌ,cA�vK��}g�"�a��g�s�*	��L��I���y;'��$9q�r�>�L�SZڥ e�u;�g*k��H�(������H��R6»k9���!�:�I�経�9k�s�R��<�����y�b R���T̍���V1
�bD�bn�E�����s�q]���ڣX��/�F�ǔc�v,V1��<6>t�UEYw1P�����k+�H����tCc ��f%��҈�мH�g�dhw�������T��=<���uc %2v<1�؝I�x���� ���Ddi�$e<w`iXPs��yai�9�iΤ�xn�ĺ��l͙4?6��5<�|%R#VNdTI?B�u=�� �&)�������-.�����؜@pǨyll�D�ޚ��):�����؜@�k5����876w$%o�������9����876'<�����XAx��J���ܑ���6�
�6�D��d[�ۜ;���-Lm��m��8�9�d�0�9FPt�y�*$�}��7��0�����H�(��{e6P�@J�DX�j��Z'�I�aeJ$*�ȏ��@�����������J��vS5�����H,qTY�]��L�k�Y�H
v���A���3z�i���#xX]m���o=�Ayi�3�F�K����j����@}>�N}��,6������3�6�X�<�Q]�W����g�?q��K�������#U�0�e㜔]@�]�u݇�L�	��rۈ��]H���:!���<��
���[��߇�IN���{�2�87�L�����8y����ǒ��ʔHTv���3��e��%��3Ϩm�{e<�o >�X�F���"�ê�DP�Eކ�E5|���#u�%]�d�xb�{��LS+%� 5=|<�k�3G��-.s��Դ�s<�:y`�3'���+���M������w���Tt]<���{�@k vg����:%��iݙD�}��)�xw�����e�R\�#�;�u�b ��� ��>ތ±���ˣ8�7��ƹ*������F��mď�H?B� r��.�>+(��kr�~��h�.��xP&��E����jz�x���-Ya�q���Ϙ�Ut�6�U���7�4x' �S��#x�<*)�(�"/�����"�o9��]�d�xb�H�a�_)����� ��z}������H��%&�A��LȔHTP�XP��/�gO登�{hse6P'�g"F���47�=z�H���I�ܦ��,"5P����Dz,�H���+%� ��@���/Ӂe%�qg^On��+�A~���İ'�{�`�eO�I��.�6|<(��K�\��z*�2T��D���E�3"	Pvz�x�W×� �2��g����E2|<1��Hp��L�$@�&� VJd�%=7F$�&��8N��cy틧D��D$�}����]���Ĵ,K����z����^�PZ�����bZ��w"��>J�H$j��s�̠��O�<��[(�R�(�A�O |IV�� r��>t�v�p��c���:<�1�����/@���e�:9�;!)sM�?�k5У�qңt%Ṧ��(}=J_'=J��h~o�=J�Q�7У�qңt%������(}}�vb��aOH���߷+}�J_'�JRQH��J_�@���� �|��Z0�ع������~޼k��g;E��
��q��LW������	�Fɚ��7o؁b���M�#�s�ӿ����l��"���ښ ��)�6{EB�aT��֙�^@�1t��V�}W���;�� 髉����V����]�������&    M-�B�	�ם'��ę4��	�&x;;�D45�IS˾��j������-&N��a_@`-Asإ��*�@S���@~�9�:��;t�#Τ��^H`�Ub�<Ѱ���:�J����g\GX��:↙g�7����Qd��,�:�Ķ�$��,H��0A���f�H(�H���@��X�Pne�l�m�a�ב�&Mt~�މ�_e�N=T���Ŕ�OL����,	�lɲY1:�8y�j��ݜ�qrτ�Xx�}l��0y��[�ϑB-?P����ک/@�W�)P��=	_�3�G��i��v/��Hy�mİo��I�ݐ�Q��"	P�E~l)�@�f��*��$�����Y��	[�l8��[�Y�LBU��4k���3��vP5��Dn$eߦ��� �7`&N��$�q�f}fP��D_j^����dl�Y��n!�d#�;5�x�����hg�7`���3o[�Ӿ�[�2���o��}f�o����>�0��I$��^���XЀ�n�i��.H+p�y�o{7끴r�7
5`��?���T=�Ҝ�0�]"����j��� �nPCg �G��c�����~�C`�3q�Cp"m[_�t������=fⴇ���d,?�!0�`���=���0�!0�f=fЬ�`pB��u\��ȇi��{��y�I�a�Cp%j6��s"��v+�X��vI^�8m'����VP��&�!�G�����Se&Pe�g"6-|$�m��"R%g�����D����(�(~%R#&�HenM�"R��Dj��"el��"�+�����>�,ޡ�E�)�u����7n2���Q�vbǋ���g��H��/�D��@y�>�h�Qnq�x�UU��"���q�[����;?Z���$�=nyV��W��s�|�_0�������faL��dN1k��̦Es3&�fLD�ͼI�9o!in����1U7�ARfӪ��r3&��f>Hʦd�܌	D�Qu3,IX�܌	�����L|}�"�G"�V��+�+q�f���w
���XA�$�!�H%o�����������@�׾O��4�6V��������8In�s�υ7ν2�6O�q>�4V��Tw����A���o�Gs�e���
����;��� �U�^�m&��8&�)������Y�HPҦA�6�2���BNV�T��3�X{!V=y^H�&�F��@�+�
�;N$�k���D�in߃��D��|G���uCc 5u�7��<��'4��W%�4cy&|&b���AR�t��(}%R#f�HeH�b���W"5b�Df<�CgDfxD+Dg�='�
1XDj���H��~C�$����()�� ���Ȅɍ��1�(oc!&��|����4ocQ��DT��I�[I�6&�mLD��|����4ocQ�5&��Y�AR�V�6G@sx�C��� �^z��P:%9d��fhj�ojX"65G���245$��f&bSs$)	�@SÂxS���9���U��aA�ލ����|���U��aA��!���$�BÂʧ,(���ݣ��X�gM�MKĦ�HR�V����%bSs$)y�ASÂxW���9���ՠ� �u������n�$%o5hsXos�X�Am��$I`�����R*�ZJ�N>ʙ
�J��{��6"�6	�]�6�mD�m^$�Q�uk�sHg���fy���Ӎ�Dn��`��B�'��t�c ��@�B�_���q���?�WCP~�����Y,�G2�A8��m���yp>e�@~)�ۉ~�c!��x�7���q\��DR�d��o��R��Tw��$Gl���O�!�V�8��h��_WO�q>�$K��,r��.�6|<HΓ�?���_y��p�xFy��+�Ae���ĺ'�[IM���1"P�Eކ�E7=�����嵚�a1���/(�vb��c���7)+")P�p;���B�,yN�|}�2�4��9piccr��ص��AR&��,"5��J�F�H}�%/D��H��	������ܽX<�^�R]U�T�c 6=�p��s�&Pvj�1��|~_8^�P�*��RT�N}&Pd�w1i��I�Y31&ebLD��|��}�����D�;�[	��m���h��"�����Z�����U���fʎ |�L,��@��۶�L�w$%<��J��@�$�!vN$�s"VG�$@�&� �He�F�H����I��Y%2bP��$����$���"��,�ZA�ާ?��Rj��+����-�0�R���rNʮ �� ��t�3��k(�TXW�9|a��
ER���<������z��ɲBɄ��r�ʹW�����&JYu%N·�����b�(�"o�ǃ�e/���Wi�����6xB%���r�b�Ay��g&��x߉���2"P�E��g��^�[O�.'.I8��y�?�$eԕsRvy|�u��u�-s&fG�F<��B����4:Z��R�SORE}�<���v6'���~]N9�* w�&��������p�@u��G�p�0Iu%������:��9�]����4΢'��8z����uS���p�=I��Q�� '�$ͫ+G�/�K=ib]����G,x�H+�)�Q,ͫ/�����>�Z���������m���,�څK�$�����.,3~����'�[H���G[�O5��W[(�"o���@�j��w}���u����cg�=�k.I�t�\�A���5P�@�����IY��+��#�7���x
D��'���<�����=|��#����2a�'�ӕ��Z���t�r����Y�[e��PW�M�^���`CN��Nu�9. <�I����#x;(�ncp&�兩ϰ�{�)�\��)B�r$�F�VS�r$�[�R�ٖ#�T�e����l��4�gD� w�(�"�����4*���e�ت�1a�������J�\@]/�P��#��NU�a�+3X��G�ta+o������6L�Do%���=�����r�hl������)'Bde�ʼ�������,��~�j,��=,�,s�]�)wFcI�]/G��ۊPy��	b�"��m;���T"Y�{6SIz>]AUo� ��*QY���F@K���!����8�K�����B�gRэ��=`�J����_x�Ո���O֘8iU���/=J�����F~˺_s�*�5�[֭�f����nk�؋ng�Zh��?�8(�
5����ޒTu��։
���G�ˤA�����#�iޭ��nq�8��ڿ�^���C�����⟖�ɴ�u��|
*�o!')����,+(o�i�D�֠$Eԕ��#��_�**I��.�2ZA�A�Q��9u�m���I�4|V�� ����F���"�Ò*�?�������=�F_tr�WIxkE��+�V��VFj�+H�J��9�"�J�ߋ�^�TQ�H����y>ȃ��w���R<Օ��H��%&>!y���.3"����&>��s�Tm�^�pą��:'@���x��P��o#�K?��P	�8vRD]A7�S)�����0��8\y���8� p���8̕�Բ�?���D��"%�F�9@�����������#�?s��9Δ�S�o��ˇ3�q?�8��:�/�0";�/����'vo�ш�Eb�hD��O��P��	�t�p�hL���z� �C�W"\��89�;!)/B�?���|%R#V����U��"Ru�HX���Qa=.'�H$8A�4'��0J5�EJ�.�����bw&)oz���}%R#vN$܇��Q"	���$��Y`GP��׼@����Y_���y��ꥌ�|�z��Ad٫�x_ 3C�����=� �S� _ÃX_���9��!]���A��y��(�לIʐ.��� �׬D0"�X��y��y�\���A�&� FN$���
m�(���R���#�BoÂxo���9���ՠ�aA��a�����!7�mT�%��ކ%bos$)y�AoÂ�=���l�$%o5h j  sHP�m� &L�6�H��$������mA�,ݡ�aA�=�_��:o$9�3^]w�mVlO̝�6$�8�lN�yf.�����/��3i�������7<mߜI��\�8<��8<Y�3i������E����,Ι4O���ÃX����9��B���'"�C�~�,
�,�E��RI��P�Y% _��"R	����׬$��\�54�ݼ��h��Rf� ����� �F���9���'B�Âx�3���[%b�s$)�O���G�p)U"68�2�D�oHooH v7�2�$hnH�mH �6��]U!AkÂxk���!H2�&hmX�L� �2�G�^�����J������l�$ev���� ���Ddm�$e~���� �ܼ��4J��ݜI������A������3I�`�7<��7<��3I�c�7<��7/b�Ddp�$e�-��� ���D�q�$e����� ���DdsΤ�����A�{s���[��"�!�O7�y�>.:��D)R�]97�L����Й�m#ޅ�%�U�r�?��Tc_"?͛	�A�Bz$�IVWƂ">��`��$�!�l���W"5b�D³;�5J$�_�kzA�w~����������B         �  x����N#1�k�)�Q�������� �ۄb�
��\{fH��y�+��3Ǧ]"7:t�^��o������#@�Dr�T���5���֡�7��ņ(�!L�W��D����!�Ȏۃs7>��wW���y�3k� �T�T��:j��q�W8�LA�Vp���+W����A,.s���ud�ݝU�Ru������C�@�K(|�ʨ9��`Bg�>9�Ɔ�(q 0zЊV0Z�,UJ�"��")��I%�I��/�j:4 6wl�HAd)�Q�V۶(κ:�|
q��{|�r�s�����W(i�F�.X&�zf�/�[�b��J=�y��I�ލR	X�gߍ�e=��̂�b֖�!+/�����6��A����2^n�mCNK��tA�*t����+�U�*�y_��QCL!�E�m/3K�/J�������G�         H  x���An�0E��)f?h Q�(�s�n�LݸƤ��P�#f gV�r����):�
�5P�"��WX߿o��a��y��n�b���/�?R|����,�~����tJY��2�K�X.��u]W=�ܗ�duV��6g�V��ڐ��&�F+MVMP��beg�PVqV�z��-�l)([2���l�m]�m}�\~�g)z�:����~~�:�:�{���	�\���
u��c+ȱ�^�L��և�fTek�vZm�]�N�E�R��Y"���𠕄�A��'&��ƕE�A������>��k{���W[�����W�������-v���)��C���ȩ�b��b���XY�)@Q+��S�b����-uV4��u躱2!;Q����t*"uI:lDշ�lD��j9��o''�NAn'��[A�ɡ�ƚ���܅k�>�}Nc&(�<ј3��\_wV���.��
��9+ԯ��:YA~���Z���Ě'+t�$sԝ4O�yi�B�e����l�gK��bϖ��Ş-�fK<[ʖx��-�l	([�%{�[W����*���B�j�j��� ����d9o�Χ��/��         �  x�}R���0</_� �$7�W��޹�J�kp��6���׀�����3;�f-���e�gb�V$��3��^�e?�r=��sl�τr�N�!�<��nD=$�Q��'�a۴�Q��ϡ|S���[�&�=�w�Wj<�&�W�jƞy_@�BB��uU���NQ��T�SˋX���P.��>,�ZlN��MK�r*䡉"ߜ��;a,WS�RHU�=G�\>�S@M�U����%����ؑ���L1�?l�%���/��׸˲|՜�Ǒd�8^���a`�2�oҗ�^���k�-�9��>�+m�7�~�ӝ���Z��9|���B�ؑi�w��ٞ ��j���8��2��4�V�OE��j��Ս>�fyzj¼j��Z8mг]��(�����         Q  x���QK�0ǟ��"o>�]����m�@E"�^Қڰ�	�+�oo�C� �@�_���"�ʹz�I�#�� ��a0O�q1Jrظ`��U���(�BA�;�66���v�F�?��M�R*dtZd	�~��ƻ����/��a�<l��JV�0�19��r&�T,��%S�dZ�L͒�Y1=+�g��3��C1�P�<3��C1�ȹy��|�t��U�UYy�-	��U�0�,�FD�a��@��L�z��p�z�{�D��ٓ��=�2�%��rm��!�{Q����o����F���w�J�t��3/>�k34����Q�9�m�������wf	u�#��]�$�'���e         j  x���Kn�0D��)|����,���� 1���451,ɤ	iexQ�EvW���|\��ߏ�i|?Ǔy{�ү��`�� ����̜	l$gz.MX���ɛ��Kc�W�JD3HG�*RgY�:C���q�W�Υ逐!�ڊW��0��_����w1���1�D�<^���g>�a;x�!�H�EQ��'�(&�ѱ�R�p �1g@��'@�0�5(dB�[�pHl�w�mim��KG��h��I6���H+KnH��� ���� ��b< jl2yy����񬟶C�Hkb� ��[��#��P�Bl�����5���1U<�Dĭ�a,��ɷ<�>��G~N�$�D=5`jy�}D�Ye�&]�nHE�h���E�m���
R�x�!Ӭv'5U"��Y��i"vRS!r���9+���*���w$�$O�Nl�H&�LvbS'jl�7�nH����T�m�֌�nnjĴlIkI7!��F�K��4�=7R�4H�ڄ[O�	�=7�X�=�=7J$]����'Ä��k�������QbT".���81�h=�$��}�:x��B������"ku*kJ�-���@��M��BjB�⦹�[x��CEW��������b            x������ � �         �  x�}�[�� �g������lXĬ��c�Lw��ⷾ:\¡D��9��N��?/N�m��-q�Ѷ�ꪕ}���0�a��}+��0!�6�@=��ޅ�(��~���\N��:��JsI\���@���5��'�E��r$rڀ��O�E����é�� ���w��Ӗ���e���"w���ӬrP�E�-r�O��%�ڪ����M��w���v�@yC�F�L��NM�8	�s��~�:��m2\V=J\�If7}S�EF��ֳV�2A��z�zy*(V�Fȃ0��G���I��`la1w���F���/l�P�wk?3���"w`98��dCOg������Ҁ���9#gh�S�v���F�sF��vz�Ԓ���ڢ�ش���>������cȹ���-r�.�������Ӗ#�c;��"���"K�Xa��q7g�.�ǎ�f�3r�'�	��-������Y~F�iŏ��š��[
�5��e@�F�@R5�5oo)+�o�=r�C�C:�Z���o�;��y�J�-r��Sc�&�V�3r�.��Kn�y�G��H��k�n���F��r4v��:��9#wt9=vlQ�s���[�^�3�.o����E	�i�a趗vC獋:X�~.�o�;���>7���52�'�^�?���            x������ � �          '  x�}�M��0���D�$��Sr��dVYLU������0>}@=��A���~Oj�%�sfpi���l_�	/^��)a��T�jlOX��>�X7>@d�A�����=d�T��Pw�`m!NKA��V��Z�FOx���^H��g>Z��B�2��������1>@^����>�R�	�~���v��l�yG
B�W�˜��W�0���~�~���4��~ƽ3���`c�Իr�ϫ�kK�9�6�}4���߇�Bd �P��j�d��E趵�2�:"���J�8���u됄1�x�ay��uH�d�*�全�ǒ1�� S���ro�|'��	&��ݖ��y̙O�2�+q(q�ڿ�f�� sU{z>,bt4#P+̽�|}?]?�$�3K�O
%"��T�aY<L�&AIvtn>�W{�n\$R�Լjw7�>X{���[B�T̰��h�?�3���U��H@%l0������;IR������4�:��G@,���f� $�|'*VU%����~�О`2*�cV�;������
A2����/���      !   f   x���! ���UL�p���:B�����5���փ�W/�����o���$S^d���%Wnr�!Gt(�VB��V�t*�.塯��V=�`����~���      #   �  x�}�;�AE��Ut���]ߌ=LH2B#�$��{�B��#>�)�}�;<>�x������?*��S�T��������F���
�2JP~�|y{y{��^�)5Ī�]�S,�U��p+V��1#A��TM)-,w'`c񪹊�X-B ��b�>K��`{��PX�����{��5�a;3B&���Q]9��L:�BX��o�U��k\XzDHK���ͦю�����	.���CJ��6\��Ė���Hw��U�Kk��\F�sn�)�h7o�h#�x���9���=�\�]Ɋ%u���srˉ|��'t��P"��[N�Cb;��q�~��P&��[���bKu�p���)��S�װ��ն�_hILH���S�������\¿Nv�@�7�rEB�S��e@��ee��<Cn���YfdF&+K��p�h��kg��9}b"�tMni      &   �  x����nAE����U�~��!l�(��H"p�߹m+nkF�ޗ���ܪ6_N��Nq������xz�yI�?�����i��g�E�!�ՃȞJ�ܬ$s�D��Jb��g����iB��|�1��mRir�3.��8����\�8�ĦW\!�t'��-N")��ɮ?�c��V�8�Tk8�'p�ַ8ϩ���U�*�G�r�]WQ&p�H]�8��PQ1��0��vm֥�%���bQ�٘0���uw�yI�|�zwy�k߻��؞��4�)�\q���YD]�l6��=s��*"��
��	�g\���0x�O�ި�̹��r�i�DL�7���ISCLl� ��1����� ��*V����FD�3�����S��ND�3b�>990��h7���L�NDK��k�6*�nq������������������G]�ާf��`�s��L�f�P�T&���O�%� *>@1��
�i�-��*@M�KAq��'�I<��A�������q4�5��K������"���d�[�+~���P	2]V̆}�É�ˇ�5���P�bz��8��������L,k�Ɔ��2�W�@�Ll�'��0���O�C&��lp'ڿ_�u𺎉��֋7:�	�R��>&n:~gP��a�)i���>f�Ð-���F��ɕ���9�v��ᱧ>      (      x������ � �      *      x������ � �      ,      x������ � �      .   l  x�m�[s�0F����Iޔ��k��m�&ә�"��"��b��T���;,�$��)'��bU�CX9ҙ(a^�(s�\_�73(�u�"��YFY�Up���5#o�13e�G��4Fdd�E�\��o��!+T���蒅���{��_1Bb+1G1���kS�2�7Y�P�A����+��/��N�(��w�PX/1�[�@��\��b��M�0��t���)^���7-Ϲ��۝\�[x6<�2�5����J?�=�n�;|��ψ$>k���9�=�4iԠl�p���ջ&o�G>/n3P���M6(]B���n���S�\bWgX�{a�9�p���e�1��tu?��Ҕ[}�`$��r���]�p���?���zl�s��o���!��?�������(�^��6t��pf5�.�q�(�U3W�YXp\X3�k-���57�j*3��ܮU���)�b�e�n��RW�%���\s��3�i/U{�PKs�I�����yu���r��C�yȔƑm���<S\Q�I��ygܲ�������3�2j�D�V�� w��N/ǆ[.
	f^I5��Ჳl�o�.�,�'�DQ�$~      0      x������ � �      2      x������ � �      4      x������ � �      6      x������ � �      7      x������ � �      8   �  x�]�ǲ��E�]��c���!Nx/��'�@x^��w��Qb���{�>I:������_��Ů���5���^���9z�E���Ɲk<���
ճ� �p���������|��J 2SzoY��+�W��e=�p�z/N���u��.C�IE��ov9u�OFe�-���r�9.��"����3/�'�P�WN>��_��=�'�� �{O�m��}�wgx��~i�6@�de�nM��C�X߿A�	��-)z�[����B᜚u�M�?k�C,�qH�̳j��`��7����u��2 �5��6˟tT�v��x��.��HI]����EE��.'�®�q
�ک�>��ȪNaC�c�l�ծw�p���c��O o&�a ڪ��`jϭ���x�+#��'��M��2��:��bQw���Gѳ'R	7�� 5�)>����if!R$8�*�-x�������4ǗJ�yN�� �Eyަ�Y/!���6|���׌}T���UV�����m��q��P�y��LA����BC����5�O���������͛.��6�Ǩ�-�9A'SG�0Pd]#D�,N��	��w7�!?���5�r��S]�_V���,���`e���@��R�����`[�/�)'>��D��� b�r"_a;t��b)�&�?����=���;���]~G�kld�$" �laA��[�Ro;r7gKs{h1����DH�$���E�0n��9U�O��<�?RXGl#�闤�RU.�)��Cm�|m$$� !�n=L���v��z��Sm���������\��M[W�t>7����YTI�K���vYQ��Vɬo��Ow\�dgQ9l	�7�H$8H�{�v�I��p)'4HUI���������h8��!��-���:�|�Я����=8g������2|OdC�M��ZB�9d�o2R�	7����v/j�'�������*l��	��b��n���BdBkY�W�yZ>��Ѫҙ����� �s�I:u�ND��%��f/�u�xky�>��m16{�+�m�xY��97��Ŋ�}?�+�[�g��{�tk��*�υ/� �˸�~o�����s�N7��K�F>��O?�Pg�F�`TW�IW�8�J����G����]2%�w+Ud�bS���ɖ�ⓤ��Y��Wz��t� Z���_�g&U�R�� 4��'�)&�[�������*hqRv�hF�ܱ�T�o:��\�����7��q����bUi	W��O{I��ō�=��nj�B0�� C߮as�$z����6��ܗM�5x;ߐ�7,aM�֟=�=�nI�%p�:m@���T&I�^��3� �@�X�yY����/~nJ7�������V�
�<���,��{~�Wm��f�g�g�����c�a�P���'-Њh���=��L�^9������tvܰ�����m6�5�h-��9��zQ_��BZ���{r�V=���A:;�b���'��?Y���B�'��]cv�=��#֤k,5���͋�G8�߹�6� ���z�0ä���C�����������-l��G_g�C���wjPM�/f�r��8��Di��7)�������G�p�8;.GUP:�r�2��`e��5����ﯨ����G��[I>د��_�~�l"`�      9   �   x�m�;�0D��)� (�ͧH����f�G �Z;EnO�t#�ћ�q-jeIh���qOT"u4D��MK�|"#	3%�Ô3y]��"t�1���IVȿE5́F:4(��Ŧ	\1� �l������wJs4��F]�����r�}E=n      ;     x��RAn�0</��{d m��G=��%R��V162&m_���4��ƞ�wf�x���-NPXS�k`�D�]$�@88�(�bC��rN@^����� ��V�(2H�-�(s��Y��j�Krf���l������fM��lOl�l{�a�܉�ʇ�kj:�U���XY�������q;�~��m�>�SX��G�4�����{>�M����c��N�$[�t)ט���4��"}b���d~S��fr55��\���Րa��^���Ӽ����qE�'`��      =   @  x��WMo�0=3�B��[��z+��ڮCoC�A��ƨc��"������0+���C�/$E*q\@�ƀRx�M���h:�Ϗw���ǻUL#�h�U�n���r|�N6�)p�yN>�$h��b1Xi,�b��F'|�g>��	����	_���Ϣ|6�Y>��<_L����hğO�e!��S~YH�9��y~�u>嗅�O��!��Y��?�S�ᛖ�J� �kSJ��w�������"V�r��CT�V5�m^{X��tfc�Gq�5�_iF��FW<_3Z|��3K(+9ɺת��8YF"u5�k7��u�źR��*�[�Y�?���ޝ��2��XGֻ��j�����Jj���
+��)�� �Q�/6|��6B��>�D	������RLc���q�'"Y,���������$D��zs�iTG���~�"Or�-�[3���0jcH}�ӥ�q�݊N<K82��l6C�����{���w�-�9,���=ҵ���ܐV<)-���Xȧ��J�Jr���x�M���z�B/�u�_X��%�R�/��}۾���2�|�\��0T2\2~I1�ν^�hX�$A��}�~���Ч	�A�)�J��@{O�>-�9I�Z4���}9�a��s�G���<�w�,��N�k'yr���^�MU�L]��7�ϑ��8�^����{a�_R<�)*��n��{�6��G������,�����d���R�ߨN�G��}y-�Ÿa��⩙�'C�[«|n^�qp��yN��"�#B���VD,�<��ǩ�^�?��c/���n�&����\w}\�V��e04�      ?     x���Ko���ϳ�b�����1r`�\�Y��[��Q��_���&�!���b6D�Q殺ܼ�~=ܶ�������q�>���n_�����8���x:o�_�����y�؞N�/�i�n@Hs#�[)wB�k����������w�3<�Hk��j����᡽��޷������P7�����B�;,4�5Y����������+3��Iz�`'E��'�]"�����E�
�q�n�:♼|:>�OǗ��������oW�>�x��b��N�FkCx����#����R��w�4`��a���`bgd�8R�I��C���2!���||��W�zRhD��&�JQ���R;P����jP�(���.J�4�s{:[k˒�O`��eP�u#Y,��e_�ln�Qfu�Ҍh���sŕ��!�v�xag\c��/�������~��q��/��Y7�IT���;W�䘧�"���C�"#Oy�v�q�^ƻ���)���nT���F9��j+��L�|�XXT�
��M�Ѧâ{��Y"YT2����/���E���m*�\���P�H�L�}�d����f�o6�Ʊ����\ˆ&
�*���d�"���\϶!_UV�����wg�FX^�~w�n4e�lݦ���V��"j�zw�T��h��;ke�I�2���J+r�&l�����z��e�FB<�"��I
����z-��ӵ��v�r�RV�>R�O4�����-��up�|�-.��,��u��ܧ	m�|��:�aR�S��b*��Ѳ�z�6�i��`V'v�Z��4ec�-�]��:x([���}9n��p�Lو4��E�y�#f�t~[\��BE�0��0��ω)�L�o�6��k��y�~ʡ������f��	tU���ũ06�J�zAY�*x�wbeʪV�yʒ$g���^}�?�C��QE+c�U�a����:T�)���M�u�qT�⚁-{�N	2�����"���f߄-{�2Nc���-�Eg0ՏRg�ZQ�It�^\Y)�8�pq��a�@F���[։ރ�ܧK��d��ј�א˒�撉�1-P��K��_��%�&k�n٩\.C��4��*}	ў6>9C��\5�ʇ�N��h���
��U$�3v�#����5������+<�rbm��W�%�8�vr���{�9�"?n��;����fr�:,*8c|n��b����n|Ac�s��2v�q�(q��[��1r��Ql�b�����>]b1��8���~i�xy���d}�v���/��>1V�戣�Fs����|�P��r��hϤ��^����c�[�ް���|�H��)�����B�ٲۼ�Q�|9�r�:�T�Ң�h���v��V��ap�2V�z�'�ӝP_�s��_�1�����.Gf��y��4b%qF�{
�>c�ӶO�<�y�軄n����Vt�V2vQ�zƴ���RDQ��J�5��U�φ���=��6�����G���^�1����>d�j��@A����i���r5������I�1M1�	������4�K��]�5�F�&��Qɍ-q��Q��D�	uu�m���,����̴��a���>�+(�o1�Ğ���޸�ī�K�B�1��`R\?XгdL�ȞrU\=Z�(M(��q"�0+��(��� �*"�Ӳ�Wc.PXk��U�d���kb/��!�g.�^m��WT�0Y�z�5�y�c�/�����|><��χ#�/쑇\Gc�H�.�G/1�����9X��Q���qxl���# %�
�.�7���?�����m�-
S(��|��f�U\�
�J��"���R��o�,*N�v�����v5�S�9����N��:�PF[�c�4iI��A�T2�Y��7��5S�<0��Wh&r\:=XW򀌾I��`C��������1�����d��A9�_���ط��lTE0�6��Z�sh�$&�݉I^#h������<�7 J���KȺ�ζ�>Ӻ�՟q�ԡ�J�T��c�&�4�qF��jօD�w����.m�Pi��*�D�O=7F� ����^��3�:?�J@{�7��t&F�Y�.b,-�2�"���Z��V�oU��]���R��Na*�2����1ts���F���*"�&�b�5w�S�e�hF�Ŭc��F����r��_di���N��U�s(KA�7l��2Ph��*�V�s(MV]Ym6������?�L�`ᰢ�b���c7�׈��"SW�zU�1B�e���q�5S�����4磌��y�F,�*�Ρ@R�J͋4��V������ʬ�wFi��G5�Y)�2q̞eԬ2�@�E���6�+��TeΡ�d�(��3/ּ)�!�ϸu��!.�f���K��GX��wX��B� ��k�4�����yqJ�������%p�OVt���fZ�b
GE��T�[���{���.��b���8��!6��6�B��Q$��䩻w�Rq"J���ܗ]�'�6�uB�@���րoB
��:o!!���F���|+���<5.�0�\`-.�jx�EJ����C/�d�n���K<,�V�tu��9���
)�vkF�ާ-��{��}W�n�����qU	UU��G�l�K��R�;��>��rK��"?��t�^@�\���#�r�{�lQ�#�U�ܓ\nw�%�=K�#�Bܺ��y=�j*����M�˲��|� ��9�D�'�η�ǜ=r씃�.�dEEUo��h���\�[G��r�l|j%����9T�	S��6/w�ߌ��˂��O��S��uI��hs"�a��G�A#ʍiV�v���8b��"��I��Xb�C_�=ϓB|����[�P.���0�fȆN��a>5�4����� N������P?:�s<��R�*�_T��+�=i:v���Ǟ�o|r1��h�Iӑ���΍���~&*�
1��?�ݟ����n��M��t�r����ݿۗ���"��XN&���0��$a����!O�x�ǧ���@T�"������7D�R+���� ��S$��ǧ����n�`*�ȴ�yM��z|j����;�b\���V��N'�'��97��8(�:6Y����x�z�L��^��ʱ\Z闗6�]�B��f+@\ѻC��F ZU�9t���<�<А�0<��tϯP�m��7r�[�B�}�����O݀�O�y!��\��]�պ�������:l��S,������u�jc0j����ޥ�V��H�4ƶ��ۭ�,kl2mw19���.Y6�=�
؆,L88��Vw�H��!���K���{��3��M�.Z#>��G郱�̧+-5s)���h������O.��7�˗�X*>!���2�T�+)�|����ϟt�oW���P���xn�vbf�[�L�,��6�xb>g�{�#T�l��w��3)��LZa���<�:��.�g&�p2�А�.E}�`����ml�#���<�Z��}ԏ���*��Ϩx^���'�x^�)�ɖy�E�<��S*�x���Q,�/��<�1��x�]�Q�#�(~�5>|���7�      A   �   x���M
1���a�&����`6������;iQjQ��R^x_�נ�x��0]�c��[��~Y��<BwCr���B�C�E+#�Ԃ�;RM\�q��	��e�����v����9�w~�s�dpi�朶�y/Sr�]�z��36�X����5J�'�,�L      C   @   x�3�42�L�42���4204�50�52W04�22�2��3��60�#㜟��Y��������� {��      E   6   x�3�4�42�,�440�4204�50�52W04�22�2�г4���/������ �U      G   �   x�����0D����<K�L����i���@>���ލ��F����ǰ���u����K��Y'���>��r1�q�''UN"��s#�+S�b3IE5TN"��U?*�H�O4����L��~�LQ��~�QT�S�L��g�&W*g�9%r�P������r=E5?a;9�g����=x�Y��F3�%{��ߕ-��@FN���:���Z=      I   �   x���1�0���=;*r�I��s��E(�0Q�2�9�'��s��"�S�Dۃ��ͬ��K�Ux�z+������>���:��$-4h�C�-��MB3��C[��� �
��eD�f*�Ӕ���؛Zh��X��5�hb!f�U��P��!�fe�wA,�k�����!��CC�o84��<ph�����!��C+�BC܂6��<��[(�[�n�4}�V��      K   N   x�3�4�?N#.#�����3�(2D3�4�4CSg�	E32�42�42F�h���	����9H9�h� _�>      M   @  x���AO�0������T������]�ĥ�R��]F�=.m��4�z������Ҽ ��l-c�J9Ho۶t�1���{N�Gv�VEF���KT�ܜ96���D:���R���0����]��0�q��a�L����@��JXԊ� I�pl3l{�R�6�Эm�`�@� -��Kx��6�ܜ�*H���rD�����V�h�("Ǵ^k$r�mG�^�%?(�<�~mN���1���_�I�d��[�@�	��y��a��Ǽ:IZ!z3P!j�������+r=�m�x���wA�3��0F�O>��bSE�	�r�      O   G   x�34��.�)�MJ���4��".C���lNC#N#C3]]S++c=#Kcm<R\1z\\\ �p�      Q   �  x���Av� �{���'	�������A�e�����`�C�Mh��m��� ����'޹�����J����Va�Z7���w�;��eg
���Bs"n%�G�)��XoD�q���䖺E[)��UV�C�!�w̡f2�-u+���b���y�^J�b�б8�A�c�����"��II	]�J��fE�b	Y�kY�[b{�Xo\�R��YɷbXŵ�ԭjV�-}Y��ZVRK�+��ɼY���;ic��������-5)�z��}Qс���ӱ=<��ߦ Rg�Ԥ4$���#绽����D��v({ԩ ~��JM�!EGB�D̎�RjROR�g���Iz+5�>%eā�v�d��B�CJ�!�;���Q�k2�-5	��MB��.y]mL~�It�re�tR)�(t,)����ByKސ��~�h�^JMJCGJ��X�4K/�&姤�#�謲+Y�I2�T�1i�]�JM*�1�#i Ev^�KI%�Y+���ꖲIʐ�U��MR�3���l*0�t-�
)_˦BC�k�T��]e)�
?��M�B8�4�T��S�O	��S�������K�x}�;(�T��c-Q;}X�v᠈��O�z؅�"2����AK4�=��?(ba�����"�dև�ك">�^Ǆnd-�1>ھ[sh-rk�!͡�ɭ=���B������R,��|Xt̛�sk�a͇�hnH]��B6���:���H�֝�:�����֝�	��sִ�tBZ˔7�n=���A���J��j��cr�R �,oZ� 4�ۃV.�������8,t���K`��=h�R �Y���YO��D%:Zt��>�b�CʯXs�[٬�[�\�J��طt����P�R1)�k;�?*+u���}�'����$�XE-�8�f��3�m0�zi�	�R��3�M0,�:�O[��{ҋ3/f}���3_��Щgg����OO�|�>���g��.ם�߬����������jK      S      x������ � �      U   l  x��\ێ7}�~��"E�����m�]��M��/�y<�H�� A�Xat���#^f&��˴C�v/�/�^>}��������o���}�0�C��� ~x:Sȿ�����_��/��秐�����_>}�j
9�;�
����?/D�?Z��mx�Z4'���|�D�g�ppt��wBw�|$���ҏL����~f���sA�V�沊��ĸӖW�K��@�X��q��)���cq0�6���fX)�Fo�+�.�� ��QYPlE�m�������A�]h6/��]���kQ�6X�j^w�uq�,E2۸f� _��-E!���>h���79hT�-���-���H��+f7���C�Hf�W�?�Z��T�Y��;f�$�k�����REg�.�$yk��0o�P+��
��f3��O�u�sw,������O@�����|m1�QL:Kuq�,�E�ޭY��ׂ���SY��;b)NY3 �U٥ƽcQ������ԐF�}����nqQڥ����0�	c���H��6�r���8꣎�Qq"Scq)�bj.-%�䌙z�>�S��`	*��"X��Ը�*I�Լ�*�"�qϲ���:��(I�^�%��Ƭ+���U�������?�,��[+&�.]3p��0L2m����:�<Y{�oC�}�ǝ�+T�H��V��Da�Dp�J�w�SW�/�$��+{����i��\i��i����E|�P������G�qA��`ܣ.�'���އ��9%�����#7<g�`�v|�v�L�t�K�qn��_v���H�[/:F�G^������/h��;6tJ����"e���c)�B^[j�H�F��Z��C.����"��}���[�ͦ�q/ p�<a��J�݀�Er>��xO4��{���cN7���R+��V�+�irq��Q��I?Z�ؑ��v���O)ݚx��gI�_�Ҍ��5�S"劤�=�V���Fv�n���v�P���#'�g����A;��'ۑ*�v����O�1���j��C�+f��0��T䧰���b�����ڟ7�>���4�T�ۚ8��L}رX*"W��&�Sq5�l"����)Tq5���\���C W����ո߃U\��=�6?1���&��6dm2� ^����nD�A5�c�?TiPv�(k�zr4�?���/�!V��%��gtW��n����gj\��rh�	}��W�C���G���xJ��*��s��@fk��F�:��9mt^fk��FG:��o9������j�>�[�J'��)U�<��N�RƩm�J�?n�`W�p+�^f<�\ԇ��#Źy�~e�e��p�U4���[�!K��K���d�?�xI��&���0��L��&��! ��o<��\�_���EN�'�s���[�Mi2�D#�f_��KQ��
�փ9�8o1���+��|���٪y�q4Q�M�X4E���P�bұ5jS�2[��Ţck>���D�Ÿ��*�}�1�(�5.�)y[�2���R֓!J:��Q�U�z6DI�R��!J�JYO�(�T�~<D���]�ٱ��2��[��)c�p�L�/h6�ɸMA�*f?���4��ekܦ��EH��y���W"�l�s��H��}�:��ek���ck����Z�ul�s�"�:�\��TJ�c+�o��:0��rը�ydlnwǰ��(F��ԃ*-�Î9P��s��Ё�9���Q}�.wA�l��O9Q".`�R�a��*�N]�*�jI�A�G�]�����+�������ٌ&�oف���h�������;S�:���?�2[�� ���������&�:���4A��Z?�Y����I �X?D�:����EY����O�S�>�[Y��z~�:��㎰�x|zz�&�Q      W   �  x��ZMo�6=3����"E}poA���"��
F���Pr��P��3�	�v�~�f�=��i���KHV*&��ݵ}�/���n�#����[d��I\$�e�Y��T�?����+ɪZLOY�B2����b�c�O�Ќͳ��ҿ�~�R�Og�h�랛ʲ둃�a�/��w֮���j�g���}�[7�5��
�r�DωlO����Ol� �Ƙ=m;�3Id��������Gۍ����>���w�LR"�b2~c���No����v���hͣ�0}���f¡�("���x0�n_g�@��#�6��?Z7�`N��ZC42";�MW=���t�S1m������;~��w?�[���lF�4�+4�Y����9��}5���l�-�h�κ���H� �"Q�h�'�5��˾����v�0ָꁷ�wf��� ����Ȕ422�XW��R�C�9����jWeZ�'�4��P����mZ?��GJ�ʴ�Y����TG��5jWɻ�8F�:O��V�1Z�*�$��c<������ijWꨎ{��u\e�:"C��*g[��m�M�GuYv��������)Y��wLY���W�sNcU���������p��<����ey_�"
�g_8-���tJ/@N�_ȡ�� ��^���Y�c��X.��8�������ҹ �޹B,�C����Rm��q�\�9��s�r�
D���-G.�<;�9yvn9rXǽsZƔ�P���iTɁQ�J��%90*Tɡ�h��E�:�K�y�X|���HS%�.�$��,9��J���Њk�9��搰^:]����oR�ٺ���(��2�X�|�f¦)	����6�K��&�U���|�t�q��Pˈ�%��C�Y^A��,���P�_�TX�f�uw0��&��ȗ���
�}�,9/��*��,:b \d�M�Q�,@�Y t�fj��B��,@-P����dj��
r�(P|j�Ɏ� 5@���T�:ⶡ �S*c�����wie�=Y�hb�E�oMW����?F.c��7X�|�z٣G����J�!6Գ�$=#�����9Q���P��^u��B�Q1�ē�P-D<K�Iq�"�Ȥ<�"���Dcj!�>��Ɂ�����R�S����5���Z@PՂ�r�{�7�e��I�+4��)��L�A��2[���4�3Y�/�dQ�(��@#���@��.����Fh����@c4^��A��-{*Ɍ1��)�E��,�"}�������c�      Y   �  x���;nC1k��"E�㳤�	rd��ي�1��K.��|��/eX���g���<_w����<|/����6�i]Uҁ���J�V׭�HB������ұ�*)l�J��º�����U#Űs���q� �jawZ�BǴ[�ʑv��,q�E�R1��@u�Ll3�M�Z���m����+˦z�
�3�T�3�KuO%��Ru.��i��\1$�LK8:��S�FG9}N1;3T��4\�3CN�m��p�>�vd�h�\�n~�t m몒.�k]ER������P�=��M%�������9dBB�T�R�d�誒������)]U�tp�O<~��R�x���%{��xo�%{�������u�zf���dn�.g���學�qr��_���I����d�W�K�����0Zq��Ջ���J�Lx���~˙�ߔ�3�P�F]U}��i�}G�U����n�w�����ԬNέ�������[HT      [   �  x���1n�0�Y>E�"�H����{O�9E��@�?�r�/�����'i�RB���[�r�,?�������*Z�O�NoR/Z/6�1�k���M��ayAMP�S�@rP�d�r��낝���e��@wR)� �(�"i�!�Ґdԥ�ҳu�jJ8* 2�Q��6 ��H	���0�K�'�P2�d�aq��q��:O0�x�r� #e���w O �+K� 9�Ǚ�(I�.1IF�Hz�.�i����w)sݥPzF������<����XE���� I��L���e֐�4����̞�r����/XG�26,��t�$)�c�I��HR��IJ���II�_ݳ�OJ�nHRw?��6� ;���Iʼ�$��&��y�+��y��Z�V�')2*���	A�R�Or�_�8�l����' )E�u��50�H�z޶���.�      ]   �   x����
�0Eד��^-�iL[w����M��k"Mt���"߂�0Yù���Ru`^�p��7���X�wz3�uq�厛��mal�@(	�ڕ{(��Ls�|i7���.pF8�iS6B��b)�t�6.\�0�g��y�Y�$�F�`B@Yu� ��zM&hH���' ��l!��F!E~�G��pc�Edjd�5D��^�G=h�{�<b�]��c      _   �   x���1� �ٜ�{��6��9DN��'��U
a �KX���?d�2PR ��8�G�0R�P6��θ��ԟ���'K�\-���O�D��1Xq���l����,�͘/Kc��r�RO��iH��޻yH���k8����um��{zu�{뻔������&�,�����q������W����p      a   "  x���K��E�ݫ�yІ�����3
�I�l?��*�.��*x���$��_�P� ů�~�s_�������_�~��qeOmOyˡ�uY�$A�B]�U�V��Vh%F���辫w��ޣ6�^�v�FM=�FÚz�B�����5K4h*mHX��M�/h�˿.�B�qi��[|�MQ�9O0�	�W`��Fc	q�p��)8�v�{,[h���J�+����*ᒉK~�E�!AG���+���1&7KPkǕ�p@���K��O��zGi+�&��,!�:Jr6.l��=%�e��D\�q��;��xn�W	Z$��p�ڮ�\	Uñ�8j�F�����K#�n��4�l+�ᨲ�ކ�mk���"�pD��m\7$�5��.��;�l�Vf㞰s]L�*��Foevgev�H�����譼��(���*�Hi�%�j���1�_g���N����0JB7�(	!��$7��z�m��]f!�����Z�Ǉݧ=����LT BF�����V�VX-��!!�jYZ�]<�4e��Yo�QM�-��k�^��h%��!��H�zGہFk���4ڭZ�c���V�2B���f��-���O�%n��DjMYBZ@Z6i^��,ql/��(�0$x��g���$���f{�B��.MYh�0$�Jc	i	i�b�J�{�!��6��4�i���!�$����i���!TK�S���J����(^8$Ω�7畚>%ZS"����\�C�=�9����4�"W����ќ��(��wH�4g;�jɳ�!��ќ�
	�pH�4g;�B�^�����9�	����h��4�	��6BMO�6�	oШ��8$	��$���8D*ge�60|0"�`�Y}pD旓4�>����}��(��2z.�����%�A"�p�IҺ�$ўiK.HA�i,!�j���Ԛ�D������Ŷ'�퐆C�]�U�o;�B�0����`;�B�0#����`{C���8Iå�v)�H돓4\l�RH��V�C�K1���n,�ۧ�����O��S
i��w��O���6'��O��i��@!An�C>�(D齇D'=�-�^����T�����(B/<KV�f;�B���IB��v�T�Vg��
Qz�!Z���uZ�{�-N8IsDZ����#�%Z易�4AR3i1�FVh��4j��m4�i�%��{OҨi�K4i�w���#H+�$�iNĂce�K����%�9�%����������*�rj{�B��ϓ�9��@!Y�N����di6=I#����Hs�I9-�($놓�4�M��)���IB��b{�B�0e�$��Y���H+�Ĵ%/�(�H��i��n����J�6!��p�6!�\jm(�2!�Xs�S�Yz�LH6.o�����%$�H�Qz�2K��,�z"BϏp�d�SB=K*���w	��k�Yz��ȷ�������T�U�W�ކ��k�G��������g	p/���n�Qf+��k�Y�F�Ԧ������w�˵t�9+ʘ��2j���9�)c�9���1G7e�p	�:�q�EstS������1C7e�p��Im4��ݔ��5���|�6uNY>\b��(�)���}̓�)�KL�q�[rBsj�=�1KW�fSiL�%����H�C�C�)���χ���dG/W��؄c�W5������d��ُ�zL�q�q�a����b�^�<?!r���������Ȫlꋅ$���%�(���:��Ϊ���3�Y���f�8�(�-�N��g�;J�ޚ��FG�����TDk�=��7���Y���u\O�5��z*�\a�J����L��~��/��=&z��4�����pū�!!�f2�5�8)4K���K.�{{'Uv��ͷ�ze�N��,=*[��EG�f�B��Cq��mGg�7���p�&�]�\1b@���r��Djm��+�$=Z�����r�'1B˝�G�����f��r�#�a�`��8�n�	~8I�4~xGi(���Q��u\OD1���):�L�(�#zL��:)��X~;��D�%�k�����y�����y���y�<�1�t}�y�<����V�t\`���(?@O�v�cF8Oׯw��{�]\/��)&8��	�(Uw�)&�y ��+��*�/�GG��+�����������rG�]�.����q�s�%���$=n9��8���[Z�Y�6]�k�sd�J����G���$�=G6�t�_�R�N�td�J��1Dn�N�td�R�bʖ���C⛎l\�PJ��覃F�v}�q>��y��.���@?s��&\�KHk8�h��� hD�	�O�tƺ�,�y��=�u��C����� t��5�;ׄ�1����� �&mkw��:nZʂ�����X{:�)��8O8eھ�d���'4����� �S�L��z*�i�3/�E	R�P��k��q�\L=k��A��r1��.�";�t,!�Y�6x�\���M��{V��}����m�>�Q�i��qݳ��um�w��*mZ{���{��`9�C��s�د���#�u��~նw���וox�_���8������Hc�,�_���8�&����_��}�+�[s�8e�ڿ��<��[s�".��9���]�}��c��ˌ륳�)�H�;��7w`�g�������=F���!����٫��[��]�T��V��[���ϝr�׷wu���E9I����m�m���pA��'	q�!���_��m��ź��%k?�3K�5�j]ޯ����[1Mǵx�(�Y�E��F�Y#Jh�x��@��6����5ޭ������c���,=����q����n�H&�1�_:�qRZ'�q�`�h��a�;Gk���$��r����C�	���9Z�Q����5���Q���^uH<!z�����Z^ï�?w�q����S����2����e���svQb���
o��1iO��"�n�p'A�k��=��vq	W����h~���i��W��v߶R�$>�����8Z9�o�ٸ��xB쇻�۟�ZuU6�w.Q��ҟ�WA����Q���~�;�9�x�V_�$��G��OX*�y��@m�d�&��?x�wp�lm����}��?a      c   �  x������8�c�S\~�- A��'�ĵ����ԍ��G��F=?N�C�h۟ v�,KL�\Y���m�|�}��g������z]�"!�/��H�+���ZyKV��?�d>7�V�������Bӣ��?�L�Rl��t��J6�����Y#�&��y��.�5�ޚ"C&ݚ�lyqk	o���L2i�i^jh�u0g�2�M|0's[Z%�+�3{�2�9��]�Ü|�>�"qʛ�
\*��yk`��#o�^�+D^���^^�
n�ő��~�ڑ����G^Nd;��2������~�q�����r�|��\��u~k;�s�����n����P�����t���O����i�����,�U6N��>T9��l�ΒNX����ɎW=o~��il��A�	�<6�;�r"b�ؔ��Ag5����3�Jzf�͎�6�ּ��Xi�lΫͰ�&�J��J��*�Xi�&��*�٦�®fm�^�eX��l����x!123_����I/���c�2gdsAf�P!ZEf�P!��̉ɜ"2;�=�L��H�`�=8Zb%%t�8Z$�:���.�S���(�����ƪ��mV�m(����.x��nմ�N���c�E�Y���@���pQ6>�5���|�2Sd�q��ڋ[Kxk̜7sd���x�����Cd�̉�8DQ����[�>I��z��/���s4dR��3����t��q���p�wf�@�ZCXJ�B&3u	��p�f�j!03;7K�̜��Z2 3u�k�p`�@��Z��=0�6ky̜��Z� 3�H��0��dSEf�= 3Ƀ���A�^�X��9s��#�V�s�ttdݍ�9YՑx7f�hUG�ݘ����Ļ1s6YY�3g�&�#�v���dudݍ�ق�H�3�Մ�~q�	=H��@=��t�`&y�у��AGf��1s_vXan�:�����
g��yԼ337Y���;3g��yܼ3S7�y�3s]���;3���y޼1WN����yc��FW����it5�+Ճ=XI̻�Pն�^��PU�n�9���:~׌.��njF�^7���J�
�ĻJ��:(�"ڬ�`������6w�bx���,�D
��82���2E���d.e�̤\-���Z2���Fd�&sd&%sUd�vGՐ��Մ��\��̤\���H�`E
Ƀ=H=���$�Z@
uЃB:L���ݎ9L����h��L��������|�|      e   �  x���]�ܸ��ۧ���t���'�W�N\I�[�ޜ?T�(��%L�kw��@@P`L�}go�|�����_�q���������G+p�
ߵ~Sar89wG�������vS7�����?Ӡ��q?~��D���o������)(>�ȍp\�K��례�G)��G�X�{�<�O�nZB<V�I8����[z�?��O?�Z�o���O������$}��7R�W��`�v�x��e�G��`��u��a/��t�!�@[�,����Z�	�*Eeo���8Z�i|��M�	���;�Bt��v��kT~e8\ZF�`�vuM n��u��i}��6�B��Ӷ?�X�9���N}o�y_{�
�"�C��ˉ10.'���a�!��895i�{ �ޓE��,C?@��A������bځ2��V�@<LD1;PL�nI\Q��l�����۾wt���ͤ���nO�Q��c�?Afq�/�,.|��m[���wv�ݎ��:��,���6��@��K���ȶ��6 9W����R��E ���B����)!J!�Q�2�`YBЦF@B`'"�V2.	���`�5�ٷ�R ��[z��!��\hV��\���1Κ2"�uc�y"��N�D=��Gc��<�@��<��]R��*H �֘�] �X"햹���B�O�a�0փD�c�0"��@���<��c=�@��u���JN�$��(gk"������H �n2� ���D�O���-���I�0��2?	E9%���g\ZM�'���bJ���,1i3�i��.#�;Ʊ����_�2k*�\D^��]�����O���LC�x]x�M�>Yc�"цK��%���`1��0���?������d�n@��w�������n���u��խ�3/�������,��ћze��ݛ��&�G �_:0j8F�۹0�	v.��(�V� VGC�� ��e��v>�j�@�U7�l��K�^3�pX=�1���B��cW��Z��ɗ�vE��-�T�c��pJP���$�9�1Ծ� 0�]^jQ��G��)�"�+!RS�0��?����6T��8X-�P{��5B������C㣈 ���Q�5�T�Ne&�)��it�nd�������Д�(��A}F��,"�A�"t�V�Gex}^p�<�z�-/z�+ w � �W���A �$��|�t
#&�ѓ�|��u���HG	�G!H!�Y���*�?�[��(|�{���s:�ƢY��Q��Ra�?c��Ċ�n����q"gm���K��|Dİ�l�v�'{�NoX\�4��6�����-T���DB�t�ٵ�n:˟�\=D^[��3:D�)%�s�Z��]=4n������>*�r��*x������t�Y^�zrq�;޳�Ȏ٨�Ot��"�d�]mݵG�J�ؓ$�)��.׫�\��}A�'dCO�y�O��ED�';97Yww�|��J�'ݒ��w��c���kzr�*�)���m[�h'�Z��������`�aR��||���$�:g�TVF�W����V�)�PY��i^B�D�@">��N�!J�yS1f���q��H���M�[���FgahjB��t��2kospx�(#�����BO�F�@�ՅQ2�Gp	@/dD�U N�F�uCP�Z~I^6����M�4I �gR�+�IM"�6���
B����lkƝ�E�Х>W��|�k�� F�s�����RM��E�Χei�qº��.��c��^>ڭ��]�Xv؂-׆�v�Q#:�-�{��l�G3����vu���!f͍��4��bׅ��tY�l��pM��G���Z�=�h�Hje�����ҡ�^SE�Y�G�%L�w ����GI 4}�tH���D���0��H 4����� ��w%����%�#u��1c=�@t��K��A� ф�e9b`�N�5N�5O�F�<	����@�J�5�	���]�/@4_���k����b�0�����i
�l��F:��O �Z��k����řX���5��fM�a��;�B��J|��5I/��S�[��U��0#�$FMJ��t��QI��KmG�����>�0�/��v�x~y��ྚc5���呅����=�s�߉�/s2t^�T�|'&�v8�����B������;�vV⚝D�9C��S��	��'�"��
�/cXd�CT���q|�|�����#�L;b�2��J����vy�E'v��q�_K�M�Η��*�Z�-R(�y�4R�� U�b4���颹�G���#!m�v;Ƀ/(�NJD)�����^V�ۋ�Zm����Rl�gv�M��,��G�����Rp+ñ:��U�#?*1��R�Bc��Q�k z�zS�P���.�0���$����	�:��P�7'Y]a�)|	��l�"�@�)<�W�b���B�~�y]��	����y���XBm�mb9]�=�"��i�����}�� a}�ӊ@�ߧ��Oo���S�'$��Z$���>d}d������r��pzH)��A���s�Kd��c
�|�܇��C�
Y����'9�OSnohx%�҉���B�(�0��{��lv��,���le޹)�(��;X!�N!� v"�0�z��E�@�|�L°r��K�C�/��{�b�|b�;[��X�W��p�{)�u��^��Ը�"�~ʠD�zEy���u`����Y1R�g~tQ�	��+�v3��(�qy��2O�7څ��PS�����c��V|��yT��¤S:����K�%0��iJ`41Q!V����E�+ _�����T1���FJ���5!�*�(�X�b���Rs����>�
�m�~Q2��f�P=��/�X!r볣�r�~�����8�	ț���Ac&tz�xg�;A��l����˗/��Yu      g   >   x�3�4�.HLNUH�I��T�L��O��L��K�,����9%��y�E@6P Ə+F��� cc      i   �   x����j1�ϓ��ݺ��fM����cY�u��AM$�=��몴
e�0a����dN����:�n]�u���7KP�0/�Y
ҿ���z��sI�d���=�����>s��Sr���y���y���仭tY��gU3��>\�����en�&,�)�)iY�p�LQ�� �<�Z�ǰ	��|xs�e��9t�_���h�O)�R);*����)�?�y�p      k   L   x�3�4��4N#�? H��qq�@�M���9�Laʍ!F���&�F�
�VFV&�zf���e�b���� F^�      m   �   x����� �����޸@�m�!|�%fQ�DeF��o��P�)����	��}�#��u�	R�ݼN��t]�$t��ׅ2]?��!iS$z���}d��M'
ĸ�$,�$#��Oq���3
��
X��#k�&K�y*��B���,WR�(j]��B$��1�f����<��>���0�Q�Af�(jiD|#:�r�&	R�X�4��42-)J+<-�%�Ֆ%N�D�_�&ϲ�:�      o   �   x�}�;�0D��)�G ��p���i�����D�`�-V��O3���yBX���H#X�s��y	~�X������H�,{ekm�]�+���˶fc���ʎ���QT6`���5�ik�Թ�@Ѧ�9������er!�>jՕ�;"A:9sBs��P��H��h&Y�      q   �  x��X�n"�������Gv��+�V�i'�&�a��}�SN���E�*�mWwUG�L6/��Z���{����Bzq(�4�˖�~;>n�P���cARY!� ����ƕ�C��
W3|ZJ/�Hh��09��͓h)p�ֺ�b�x��5쏗g��W�VRV�nf��T>��҉�9
�LI� dr���3S]|���pw�����zX?>���=���R��Zi��7\I�PV��Ӓ���[�<([�"���,[��R�2�*O����ٍ���+�����蠝��=㠍��"�hEa�Y�ɸ�$#��d4��i|N��v�U�>��Ү�]);���p7ç�&rqZ8[I��V\�vFK縙��㓾�:�$���#��N�8�b�֔, � �Ey11	�4������U�B�����J[ce!y4Br8L΢�R��I����q���}UF�}U'�֚Y	4UW&*� 
&Z�!J��}͚�� ��o�>-�d�J�eFEE��Ѕ�9d3��˪|;H	J��-y"�Q���ȱ�l�6H���q�y����x���e����� �J����뎗3���l���H��M��=��t��ӥ,��N?��������
�w�&�	�q�6�.O)��k�lvi��q�w�9w��'�����2"R�}�y�x����1��mʸM���=nߞy��\s=|(/|܏/<��VAg8x{7��8�ZvE��q�$I��I@�-dr��H�qz���qǴ���f����'g'�����Ҫ��$$YȧO�@��k�S՚�����o|����¼_Us�A�E��!Vs���ڍ�
*�}39�l��W�S��~ُJ�����*:���`F�KUZ>H5�A֪K��)U�$)�)fga�0���}M7v��h�nf���-x�M�5N`�HaM�**���������e�v�ô~��9����6F_�j�OK�"�l�Oi��2ᮬ��i̎1k���i�r�'���0��@�t;`�8	�K>��H���p�kH�r\|?n
���4ף�K������K�k��������U
�b�&Ԇ�&����C�Mi��GX8=Q���1t�_���r�}^F߭�F�Og��e��Q\<o�#�1���M�ktP�t������.x�@�4 .���D�T��H��3T+�+�g��i�[E�1CμF��[��i������Mَǹ�����ݸA�x��&�I�`�Z"�rTA��Y15�wx����ƹ�J�����Vb)�s�VĆ�4�lh�7"䗿��y�~)Θ�1|ƧeT\�+�C���0�"�@֊�,�6K	����p�AX���B�{�!�C�N&��i�gj����Cwq�&�=���>� � ਁb���O���呇�}^B�/�O�d�j}�g�//3�
���
k�^a�-��_�?�m��0Hc	Y#���۠QI�$|Jޗ�8aEH�1�~:��>�'/Q��Ի�(e��>-�u�γ�u=>c�+?�G���r(_��d}���?� ˺�:q����$��Y��x�b���ːr���Ðu��x��߼O1���b=N6-���'���}͛o1����m���Ҭ�ǔ�W���Ӳ���$�Õ~���\�99�r	V���y����`p;`�a4[뛫Ҩ)"�1Z�"�R���>�@dt�B*pts�|ZVc�k�{�Ì�H�Y�mO���--~wi����7�6����w}����.8�\`�k����X𐚳`����V�����N�0��3�	aL�p���R5rQ�A����Ċ���5�L�+���7|Zr�
�DIH&8�(R`�C���ժD�=L�ݣ�s`6�h<ZK�U��i��/�k\� 9�9l!�)��]�_����2X��~w§e���Z ��� ��D6"��6`��h��nﯡ��$�CC;��i��l}�u˃�y�ˠ��j���-I��̜��@wF�wBV�h�(�(�{{��c�h�*����5Ke#3���#V06�����5�SK0COl1r�tJe�9�]Y��+@���bXT��B��W,���n�
T�MD�ظ��"V�Mz����Ȍ^��A���PT�������,�{�Q�q����FW�ς���&rB���2�P�gs�qC������������A�      r   
  x��Xis��<����HU*��8��Ȏ��P�*5'�X� 	����)������L����`L2�u���B���F/��j!sQ�:��D���~�{�`5�������E�w�׷/��*]�pIR��.EIu
�m�`F�LO2V��F���yH�ho�~�H�y�>p�e�#��xd��icTU�,��}?�ʁ�k�p6�����~_����?��S���_��D���("U�	�Y,�ϊ�"r���Z�Î�w�����bz]�۰�ږ7�bM���$�U0�5�B���U�ߕ-�i�V���9�'��q�X^���ǵ>[d��隩
2R_��ڧ*rFE>��°�]�OV�`�r�+���r����̄���5��**NC��Z�E�%Q=y5�ﶷ�=@w������:JQi�&�K�/T"ʤj�_2r�L�᷍��; i
9,�q�=M[WI#9��U�)�Y��'�3���8��r8�&�Ͱ��d�V9��)��yM������2�T�4j��t^y�e(�>!�oݓwjj�a9�,��#�LH��عB�Rg�y��Ji�D!�[�zwy�����>Z�{��.
B%U�Uc�]�,h�,RVY���:���c�_�=87�l�Ʊ,/ ���m^0�SːR�kE]��N�S^��xKJ��i6��qy\�2Л�_��z{>~I&����E@��G� {�r2��J�z��y�>���������Q�J�ʨ����Ra(�푼0vm\��/½��=�W:�eMc�i�Z�2����oW䗫�a����]1Wd�pYn�q:�v1���bL�����c��Ň�'I%�"��Tp��bES_���G4һ+�|w��.i�on�?����.<���g��I5#ecip푅E�+��.�~y���<ɛ��ꚵx�ɢ̖�=2oi@+�9R�K)>!p�"?�՞|_V��.���k��ͨ��Q��=��H��\P�Ȼ۲ې7yF݄�������ڒ�F	�Fc�1c5�ަݛ���+�we
���!Z����W777��C�c8�g|5ïDUL�b|�J;m<�%���i[�����z�y���_�x4f��3�����Z��xy�ɛ��y�{2�xd}&I{|��`C��Z��N�jx<v3�0��WS�!+��dN���m���슲��7��0�2��gθk��*?��2�C���\�S�� jQR(�#����͈}�!�[ݽ5�Ƙϭm\bRKQ�U���/��b��cɻ�\�m�vl������?h`4Ȧ�J�P
���1)z���L��ڃ��[F�f�!�
6�X������kr��ˡ�nF��7e9��`�r(9�#�P�UP(�ݭ���-�]"������9�lw����ݮߝW]��ʁA�U-�*Ɋ�,�W��2U��x�f������&�f��3�f,�;�%[�ʴ�%94�ˁ���x�!�=Z��9�EII���֠�4$j�㨫�Exޓ��́|S7�&���|-�*��4�� c��r���o\!�ޖ<\�3�������r��x4�=�]|4>�>�&�Au-�P�fg%Dd	�1���p�9��	����=2��L���dG��1Z�u�x��$c�椲�Ym� ��a��,���|�RJ&$$���c�BIK�TY������)Ļ���8�绵�rk<���B�Ad��	����Z�{D�z �}.e6�{s�3X^Lz��3�s�Pԁ��I"w0L�R�?GgF��	�-e{.�S�DY�ڑ��5���U�����_�ݣ�Y-� ��Ö�Rչ ���]��`�~.Λ���xX�����G*��S�㩺=�}�r����9c�9HO�H�H�� ����vF�S�JZAD�L�F-Iгη���vv3<��t�m��i�L3���-T%��q�%R�S��zӓ����4��p�����0�����T�5=�(]�O� ���(�uh�B���,r�Ƣ�Vp>������\OFwo���2�����/+�X�(��H��h4�N�ʒ�\�?/ʾ���]�݄˄#�S�A�dt�(|* J �=�NՊ
����h_��vB݄�~w
��ܦ�� ЪL�OEs���C�@�h*�^S9��۲�|[��uH���[�f-.gk9��xXߕ�%n�-�'�4��F�I�*t�lQ��F��Q̶�8Z�F��/1 �����<��ぼZovr6�{3L�"��r�Y����a,Qߚ.��5"��:��sRi�W�S� *73�W%6c[n�^Q������J�>I�0}u�T����q؂�xA�6�l�!���鲎��%tG#��FG�����8���s�$l�jC��c�kv���ِd��P�N���6�}g<�&8B�j�)�ic�!W��SoZ{�T�I5B+3�z4����sə|"��'�Q^�����6ښE=�=��<J:�g�� J���H�kN�>�}L9q���g�4�UA$��Q���b�@F+��F����"eL��a��S��އ�?���ŋ/��      s   �  x�-UIr]!\�]�BH�K6��?B������0�G��-O?�._2}�Vj�	���{Q�����/Il%[�)�R�{f�>pC+R9�zN�ԋc���Go��eO�Hњ�7Yo�/YdB�֥1�]���O�j�����)�-Li=i�;���3�K���n���M]�׃z�'���ieTnc��Bo�)[�4�_rI�yϔ�ūf����� �f���3��n{[JT�-c(�md7��~T��ψ1JV�ag�uod6���4�RS�=^����D{�L\b���S��{�u6���^й_��:����mQ{m��_߅!?�,I� &�3������za�w�)рq�Ah|���ag���
[�s�Hn�q7ٰ)x�߇/��Cw@Ȅd���ڿ�'Wà�G�-�����wnz�I[�c���[k��+d��$��N������h\�u��=a�}�� ��o�-;��#k�;{B�4��
��"�{onh�V��7r�F��#�bs���չC�}���g�'�Ek��'��;��]Dj��rЅ���MZ��>m����羌���޸o�m���	j��>JP
_x~ߏ'���}��h�_��������k*�}��"���Mu:!!�,AvЩp�Z�<��za�60`�m4�J`{�#1d�|Q�śs&�E�l|
~��u��U$+�{�{?����@�ܖ/p��E[���K$���9�
�q/���(W�{K���B��
S#I�ֻ�E�f<8[�Dm�����w ���.���7+��}�G�߼Ym�^Z+j��!���}_��K�g��c���yT} =��w8Z8�Oeۑ	��GB
8�P4�-b `a�DlfQ���|�ù}��~lO�E��~�\X��^G��4`!S�F������߿ ��O+�I�7:*�k��|w�������! *����u�a$�j=>��G���X38'��ih菜�!���ڎ�x���`-���T �C�I`Q!�W��{�A��9?z���GX����z��:pM����b�d���[iHl󵋍�x��ڦ�*;F��C��r��\�W�;.^���>���ϟ-��EpV�,5ZnV���?�VVxi#,�gr���:�c�����8�Vaf~������a��W��>�׹���9�g����MA.j	��L@ܥK��������     