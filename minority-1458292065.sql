PGDMP     .        	            t         	   minority1    9.4.4    9.4.4 	              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       1262    24956 	   minority1    DATABASE     {   CREATE DATABASE minority1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE minority1;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    5                       0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    5                       3079    11861    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    286            �            1259    25041    account_group    TABLE     �   CREATE TABLE account_group (
    id integer NOT NULL,
    account_id character varying(254),
    group_id integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    employee_id bigint NOT NULL
);
 !   DROP TABLE public.account_group;
       public         postgres    false    5            �            1259    24957    account_group_id_seq    SEQUENCE     v   CREATE SEQUENCE account_group_id_seq
    START WITH 9
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.account_group_id_seq;
       public       postgres    false    5    214                       0    0    account_group_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE account_group_id_seq OWNED BY account_group.id;
            public       postgres    false    172            �            1259    25045    account_infos    TABLE       CREATE TABLE account_infos (
    id integer NOT NULL,
    uid character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    early_access boolean DEFAULT false NOT NULL,
    pro_features boolean DEFAULT false NOT NULL,
    workbench_id bigint
);
 !   DROP TABLE public.account_infos;
       public         postgres    false    5            �            1259    24959    account_infos_id_seq    SEQUENCE     w   CREATE SEQUENCE account_infos_id_seq
    START WITH 16
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.account_infos_id_seq;
       public       postgres    false    215    5                       0    0    account_infos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE account_infos_id_seq OWNED BY account_infos.id;
            public       postgres    false    173            �            1259    25054    account_loggers    TABLE     �   CREATE TABLE account_loggers (
    id integer NOT NULL,
    ip character varying(254) NOT NULL,
    user_agent character varying(254) NOT NULL,
    email character varying(254),
    date timestamp(6) with time zone NOT NULL
);
 #   DROP TABLE public.account_loggers;
       public         postgres    false    5            �            1259    24961    account_loggers_id_seq    SEQUENCE     z   CREATE SEQUENCE account_loggers_id_seq
    START WITH 796
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.account_loggers_id_seq;
       public       postgres    false    5    216                       0    0    account_loggers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE account_loggers_id_seq OWNED BY account_loggers.id;
            public       postgres    false    174                       1259    37846    account_plan_history_id_seq    SEQUENCE     }   CREATE SEQUENCE account_plan_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.account_plan_history_id_seq;
       public       postgres    false    5                       1259    37848    account_plan_history    TABLE     �   CREATE TABLE account_plan_history (
    id integer DEFAULT nextval('account_plan_history_id_seq'::regclass) NOT NULL,
    account_plan_id integer NOT NULL,
    limit_diff integer NOT NULL,
    plan_diff integer NOT NULL,
    bill_id integer NOT NULL
);
 (   DROP TABLE public.account_plan_history;
       public         postgres    false    280    5            �            1259    25061    account_plans    TABLE       CREATE TABLE account_plans (
    id integer NOT NULL,
    business_id integer NOT NULL,
    master_acc character varying(254) NOT NULL,
    plan_id integer NOT NULL,
    expired_at timestamp(6) with time zone NOT NULL,
    active boolean NOT NULL,
    "limit" integer NOT NULL
);
 !   DROP TABLE public.account_plans;
       public         postgres    false    5            �            1259    24963    account_plans_id_seq    SEQUENCE     w   CREATE SEQUENCE account_plans_id_seq
    START WITH 27
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.account_plans_id_seq;
       public       postgres    false    217    5                        0    0    account_plans_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE account_plans_id_seq OWNED BY account_plans.id;
            public       postgres    false    175            �            1259    25065    accounts    TABLE     �  CREATE TABLE accounts (
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
       public         postgres    false    5            �            1259    25071    billing_infos    TABLE     {  CREATE TABLE billing_infos (
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
       public         postgres    false    5            �            1259    24965    billing_infos_id_seq    SEQUENCE     v   CREATE SEQUENCE billing_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.billing_infos_id_seq;
       public       postgres    false    219    5            !           0    0    billing_infos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE billing_infos_id_seq OWNED BY billing_infos.id;
            public       postgres    false    176            �            1259    25078    bills    TABLE     Q  CREATE TABLE bills (
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
       public         postgres    false    5            �            1259    24967    bills_id_seq    SEQUENCE     n   CREATE SEQUENCE bills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.bills_id_seq;
       public       postgres    false    5    220            "           0    0    bills_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE bills_id_seq OWNED BY bills.id;
            public       postgres    false    177            �            1259    25085 	   bploggers    TABLE     �  CREATE TABLE bploggers (
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
       public         postgres    false    5            �            1259    24969    bploggers_id_seq    SEQUENCE     u   CREATE SEQUENCE bploggers_id_seq
    START WITH 1139
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.bploggers_id_seq;
       public       postgres    false    221    5            #           0    0    bploggers_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE bploggers_id_seq OWNED BY bploggers.id;
            public       postgres    false    178            �            1259    25089 
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
       public         postgres    false    5            �            1259    24971    bprocesses_id_seq    SEQUENCE     t   CREATE SEQUENCE bprocesses_id_seq
    START WITH 71
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.bprocesses_id_seq;
       public       postgres    false    5    222            $           0    0    bprocesses_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE bprocesses_id_seq OWNED BY bprocesses.id;
            public       postgres    false    179            �            1259    25095 
   bpsessions    TABLE     �   CREATE TABLE bpsessions (
    id integer NOT NULL,
    process_id integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    active_listed boolean DEFAULT false NOT NULL
);
    DROP TABLE public.bpsessions;
       public         postgres    false    5            �            1259    24973    bpsessions_id_seq    SEQUENCE     u   CREATE SEQUENCE bpsessions_id_seq
    START WITH 152
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.bpsessions_id_seq;
       public       postgres    false    5    223            %           0    0    bpsessions_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE bpsessions_id_seq OWNED BY bpsessions.id;
            public       postgres    false    180            �            1259    25100    bpspaces    TABLE     �  CREATE TABLE bpspaces (
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
       public         postgres    false    5            �            1259    24975    bpspaces_id_seq    SEQUENCE     r   CREATE SEQUENCE bpspaces_id_seq
    START WITH 87
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.bpspaces_id_seq;
       public       postgres    false    5    224            &           0    0    bpspaces_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE bpspaces_id_seq OWNED BY bpspaces.id;
            public       postgres    false    181            �            1259    25106    bpstaterefs    TABLE     D  CREATE TABLE bpstaterefs (
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
       public         postgres    false    5            �            1259    24977    bpstaterefs_id_seq    SEQUENCE     t   CREATE SEQUENCE bpstaterefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.bpstaterefs_id_seq;
       public       postgres    false    225    5            '           0    0    bpstaterefs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE bpstaterefs_id_seq OWNED BY bpstaterefs.id;
            public       postgres    false    182            �            1259    25112    bpstates    TABLE       CREATE TABLE bpstates (
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
       public         postgres    false    5            �            1259    24979    bpstates_id_seq    SEQUENCE     s   CREATE SEQUENCE bpstates_id_seq
    START WITH 346
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.bpstates_id_seq;
       public       postgres    false    226    5            (           0    0    bpstates_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE bpstates_id_seq OWNED BY bpstates.id;
            public       postgres    false    183            �            1259    25127    bpstation_loggers    TABLE     T  CREATE TABLE bpstation_loggers (
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
       public         postgres    false    5            �            1259    24981    bpstation_loggers_id_seq    SEQUENCE     }   CREATE SEQUENCE bpstation_loggers_id_seq
    START WITH 3150
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.bpstation_loggers_id_seq;
       public       postgres    false    227    5            )           0    0    bpstation_loggers_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE bpstation_loggers_id_seq OWNED BY bpstation_loggers.id;
            public       postgres    false    184            �            1259    25134 
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
       public         postgres    false    5            �            1259    24983    bpstations_id_seq    SEQUENCE     u   CREATE SEQUENCE bpstations_id_seq
    START WITH 274
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.bpstations_id_seq;
       public       postgres    false    5    228            *           0    0    bpstations_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE bpstations_id_seq OWNED BY bpstations.id;
            public       postgres    false    185            �            1259    25142    bpswitchers    TABLE     �  CREATE TABLE bpswitchers (
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
       public         postgres    false    5            �            1259    24985    bpswitchers_id_seq    SEQUENCE     v   CREATE SEQUENCE bpswitchers_id_seq
    START WITH 190
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.bpswitchers_id_seq;
       public       postgres    false    5    229            +           0    0    bpswitchers_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE bpswitchers_id_seq OWNED BY bpswitchers.id;
            public       postgres    false    186            �            1259    25151    business_services    TABLE     �   CREATE TABLE business_services (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    business_id integer NOT NULL,
    master_acc character varying(254) NOT NULL
);
 %   DROP TABLE public.business_services;
       public         postgres    false    5            �            1259    24987    business_services_id_seq    SEQUENCE     {   CREATE SEQUENCE business_services_id_seq
    START WITH 46
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.business_services_id_seq;
       public       postgres    false    5    230            ,           0    0    business_services_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE business_services_id_seq OWNED BY business_services.id;
            public       postgres    false    187            �            1259    25158 
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
       public         postgres    false    5            �            1259    24989    businesses_id_seq    SEQUENCE     t   CREATE SEQUENCE businesses_id_seq
    START WITH 28
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.businesses_id_seq;
       public       postgres    false    5    231            -           0    0    businesses_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE businesses_id_seq OWNED BY businesses.id;
            public       postgres    false    188            �            1259    25165    client_observers    TABLE     d   CREATE TABLE client_observers (
    id integer NOT NULL,
    uid character varying(254) NOT NULL
);
 $   DROP TABLE public.client_observers;
       public         postgres    false    5            �            1259    24991    client_observers_id_seq    SEQUENCE     y   CREATE SEQUENCE client_observers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.client_observers_id_seq;
       public       postgres    false    5    232            .           0    0    client_observers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE client_observers_id_seq OWNED BY client_observers.id;
            public       postgres    false    189            �            1259    25169    elem_topologs    TABLE     '  CREATE TABLE elem_topologs (
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
       public         postgres    false    5            �            1259    24993    elem_topologs_id_seq    SEQUENCE     x   CREATE SEQUENCE elem_topologs_id_seq
    START WITH 134
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.elem_topologs_id_seq;
       public       postgres    false    5    233            /           0    0    elem_topologs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE elem_topologs_id_seq OWNED BY elem_topologs.id;
            public       postgres    false    190                       1259    37770    element_resources    TABLE     9  CREATE TABLE element_resources (
    id integer NOT NULL,
    element_id integer NOT NULL,
    process_id integer NOT NULL,
    resource_id integer NOT NULL,
    entities character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 %   DROP TABLE public.element_resources;
       public         postgres    false    5                       1259    37768    element_resources_id_seq    SEQUENCE     z   CREATE SEQUENCE element_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.element_resources_id_seq;
       public       postgres    false    277    5            0           0    0    element_resources_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE element_resources_id_seq OWNED BY element_resources.id;
            public       postgres    false    276            �            1259    25173 	   employees    TABLE     �   CREATE TABLE employees (
    id bigint NOT NULL,
    uid character varying(254) NOT NULL,
    master_acc character varying(254) NOT NULL,
    "position" character varying(254),
    manager boolean NOT NULL,
    workbench_id bigint DEFAULT 0 NOT NULL
);
    DROP TABLE public.employees;
       public         postgres    false    5            �            1259    25180    employees_businesses    TABLE     j   CREATE TABLE employees_businesses (
    employee_id integer NOT NULL,
    business_id integer NOT NULL
);
 (   DROP TABLE public.employees_businesses;
       public         postgres    false    5            �            1259    24995    employees_id_seq    SEQUENCE     s   CREATE SEQUENCE employees_id_seq
    START WITH 37
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public       postgres    false    5    234            1           0    0    employees_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE employees_id_seq OWNED BY employees.id;
            public       postgres    false    191            �            1259    25183    groups    TABLE     �   CREATE TABLE groups (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    business_id integer NOT NULL
);
    DROP TABLE public.groups;
       public         postgres    false    5            �            1259    24997    groups_id_seq    SEQUENCE     p   CREATE SEQUENCE groups_id_seq
    START WITH 24
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public       postgres    false    5    236            2           0    0    groups_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE groups_id_seq OWNED BY groups.id;
            public       postgres    false    192            �            1259    24999    input_id_seq    SEQUENCE     p   CREATE SEQUENCE input_id_seq
    START WITH 264
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.input_id_seq;
       public       postgres    false    5            �            1259    25187    input_loggers    TABLE     �  CREATE TABLE input_loggers (
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
       public         postgres    false    193    193    5            �            1259    25001    input_loggers_id_seq    SEQUENCE     x   CREATE SEQUENCE input_loggers_id_seq
    START WITH 144
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.input_loggers_id_seq;
       public       postgres    false    5    237            3           0    0    input_loggers_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE input_loggers_id_seq OWNED BY input_loggers.id;
            public       postgres    false    194                       1259    46046    launch_shares    TABLE     �   CREATE TABLE launch_shares (
    id bigint NOT NULL,
    title integer NOT NULL,
    price integer NOT NULL,
    description character varying NOT NULL
);
 !   DROP TABLE public.launch_shares;
       public         postgres    false    5                       1259    46044    launch_shares_id_seq    SEQUENCE     v   CREATE SEQUENCE launch_shares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.launch_shares_id_seq;
       public       postgres    false    285    5            4           0    0    launch_shares_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE launch_shares_id_seq OWNED BY launch_shares.id;
            public       postgres    false    284                       1259    46004    launch_warps    TABLE     �   CREATE TABLE launch_warps (
    id integer NOT NULL,
    launch_id integer NOT NULL,
    launch_element_id integer,
    board_id character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
     DROP TABLE public.launch_warps;
       public         postgres    false    5                       1259    46002    launch_warps_id_seq    SEQUENCE     u   CREATE SEQUENCE launch_warps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.launch_warps_id_seq;
       public       postgres    false    283    5            5           0    0    launch_warps_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE launch_warps_id_seq OWNED BY launch_warps.id;
            public       postgres    false    282            �            1259    25196 	   observers    TABLE     �   CREATE TABLE observers (
    id integer NOT NULL,
    station_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    hash_code character varying(254),
    "fullName" character varying(254) NOT NULL,
    created_at timestamp(6) with time zone
);
    DROP TABLE public.observers;
       public         postgres    false    5            �            1259    25003    observers_id_seq    SEQUENCE     r   CREATE SEQUENCE observers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.observers_id_seq;
       public       postgres    false    5    238            6           0    0    observers_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE observers_id_seq OWNED BY observers.id;
            public       postgres    false    195            �            1259    25203    plans    TABLE     !  CREATE TABLE plans (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    price numeric(21,2) NOT NULL,
    description character varying,
    slot_included integer DEFAULT 5 NOT NULL,
    "order" integer DEFAULT 1 NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);
    DROP TABLE public.plans;
       public         postgres    false    5            �            1259    25005    plans_id_seq    SEQUENCE     n   CREATE SEQUENCE plans_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.plans_id_seq;
       public       postgres    false    5    239            7           0    0    plans_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE plans_id_seq OWNED BY plans.id;
            public       postgres    false    196            �            1259    25207    proc_element_reflections    TABLE     �  CREATE TABLE proc_element_reflections (
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
       public         postgres    false    5            �            1259    25007    proc_element_reflections_id_seq    SEQUENCE     �   CREATE SEQUENCE proc_element_reflections_id_seq
    START WITH 25
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.proc_element_reflections_id_seq;
       public       postgres    false    5    240            8           0    0    proc_element_reflections_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE proc_element_reflections_id_seq OWNED BY proc_element_reflections.id;
            public       postgres    false    197            �            1259    25214    proc_elements    TABLE     �  CREATE TABLE proc_elements (
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
       public         postgres    false    5            �            1259    25009    proc_elements_id_seq    SEQUENCE     x   CREATE SEQUENCE proc_elements_id_seq
    START WITH 248
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.proc_elements_id_seq;
       public       postgres    false    241    5            9           0    0    proc_elements_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE proc_elements_id_seq OWNED BY proc_elements.id;
            public       postgres    false    198            �            1259    25221    process_histories    TABLE       CREATE TABLE process_histories (
    id integer NOT NULL,
    master_acc character varying NOT NULL,
    action character varying NOT NULL,
    process_id integer,
    what character varying,
    what_id integer,
    date timestamp(6) with time zone NOT NULL
);
 %   DROP TABLE public.process_histories;
       public         postgres    false    5            �            1259    25011    process_histories_id_seq    SEQUENCE     {   CREATE SEQUENCE process_histories_id_seq
    START WITH 14
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.process_histories_id_seq;
       public       postgres    false    5    242            :           0    0    process_histories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE process_histories_id_seq OWNED BY process_histories.id;
            public       postgres    false    199            �            1259    25229    process_permissions    TABLE       CREATE TABLE process_permissions (
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
       public         postgres    false    5            �            1259    25013    process_permissions_id_seq    SEQUENCE     }   CREATE SEQUENCE process_permissions_id_seq
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.process_permissions_id_seq;
       public       postgres    false    5    243            ;           0    0    process_permissions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE process_permissions_id_seq OWNED BY process_permissions.id;
            public       postgres    false    200            �            1259    25236    reaction_refs    TABLE     C  CREATE TABLE reaction_refs (
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
       public         postgres    false    5            �            1259    25015    reaction_refs_id_seq    SEQUENCE     v   CREATE SEQUENCE reaction_refs_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.reaction_refs_id_seq;
       public       postgres    false    5    244            <           0    0    reaction_refs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE reaction_refs_id_seq OWNED BY reaction_refs.id;
            public       postgres    false    201            �            1259    25240    reaction_state_out_refs    TABLE     ?  CREATE TABLE reaction_state_out_refs (
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
       public         postgres    false    5            �            1259    25017    reaction_state_out_refs_id_seq    SEQUENCE     �   CREATE SEQUENCE reaction_state_out_refs_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.reaction_state_out_refs_id_seq;
       public       postgres    false    245    5            =           0    0    reaction_state_out_refs_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE reaction_state_out_refs_id_seq OWNED BY reaction_state_out_refs.id;
            public       postgres    false    202            �            1259    25244    reaction_state_outs    TABLE     :  CREATE TABLE reaction_state_outs (
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
       public         postgres    false    5            �            1259    25019    reaction_state_outs_id_seq    SEQUENCE     }   CREATE SEQUENCE reaction_state_outs_id_seq
    START WITH 32
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.reaction_state_outs_id_seq;
       public       postgres    false    5    246            >           0    0    reaction_state_outs_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE reaction_state_outs_id_seq OWNED BY reaction_state_outs.id;
            public       postgres    false    203            �            1259    25248 	   reactions    TABLE     =  CREATE TABLE reactions (
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
       public         postgres    false    5            �            1259    25021    reactions_id_seq    SEQUENCE     s   CREATE SEQUENCE reactions_id_seq
    START WITH 41
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.reactions_id_seq;
       public       postgres    false    247    5            ?           0    0    reactions_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE reactions_id_seq OWNED BY reactions.id;
            public       postgres    false    204            �            1259    25252    reflected_elem_topologs    TABLE     4  CREATE TABLE reflected_elem_topologs (
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
       public         postgres    false    5            �            1259    25023    reflected_elem_topologs_id_seq    SEQUENCE     �   CREATE SEQUENCE reflected_elem_topologs_id_seq
    START WITH 22
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.reflected_elem_topologs_id_seq;
       public       postgres    false    5    248            @           0    0    reflected_elem_topologs_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE reflected_elem_topologs_id_seq OWNED BY reflected_elem_topologs.id;
            public       postgres    false    205            �            1259    25256    refs    TABLE     |  CREATE TABLE refs (
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
       public         postgres    false    5            �            1259    25025    refs_id_seq    SEQUENCE     n   CREATE SEQUENCE refs_id_seq
    START WITH 27
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.refs_id_seq;
       public       postgres    false    249    5            A           0    0    refs_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE refs_id_seq OWNED BY refs.id;
            public       postgres    false    206                       1259    37754 	   resources    TABLE     �   CREATE TABLE resources (
    id integer NOT NULL,
    title character varying NOT NULL,
    business_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.resources;
       public         postgres    false    5                       1259    37752    resources_id_seq    SEQUENCE     r   CREATE SEQUENCE resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.resources_id_seq;
       public       postgres    false    275    5            B           0    0    resources_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE resources_id_seq OWNED BY resources.id;
            public       postgres    false    274            	           1259    25900    session_elem_topologs    TABLE     E  CREATE TABLE session_elem_topologs (
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
       public         postgres    false    5                       1259    25898    session_elem_topologs_id_seq    SEQUENCE     ~   CREATE SEQUENCE session_elem_topologs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.session_elem_topologs_id_seq;
       public       postgres    false    5    265            C           0    0    session_elem_topologs_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE session_elem_topologs_id_seq OWNED BY session_elem_topologs.id;
            public       postgres    false    264                       1259    37797    session_element_resources    TABLE     j  CREATE TABLE session_element_resources (
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
       public         postgres    false    5                       1259    37795     session_element_resources_id_seq    SEQUENCE     �   CREATE SEQUENCE session_element_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.session_element_resources_id_seq;
       public       postgres    false    5    279            D           0    0     session_element_resources_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE session_element_resources_id_seq OWNED BY session_element_resources.id;
            public       postgres    false    278                       1259    25936    session_initial_states    TABLE     /  CREATE TABLE session_initial_states (
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
       public         postgres    false    5            
           1259    25934    session_initial_states_id_seq    SEQUENCE        CREATE SEQUENCE session_initial_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.session_initial_states_id_seq;
       public       postgres    false    5    267            E           0    0    session_initial_states_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE session_initial_states_id_seq OWNED BY session_initial_states.id;
            public       postgres    false    266                       1259    25823    session_proc_elements    TABLE     �  CREATE TABLE session_proc_elements (
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
       public         postgres    false    5                       1259    25821    session_proc_elements_id_seq    SEQUENCE     ~   CREATE SEQUENCE session_proc_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.session_proc_elements_id_seq;
       public       postgres    false    259    5            F           0    0    session_proc_elements_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE session_proc_elements_id_seq OWNED BY session_proc_elements.id;
            public       postgres    false    258                       1259    26039    session_reaction_state_outs    TABLE     D  CREATE TABLE session_reaction_state_outs (
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
       public         postgres    false    5                       1259    26037 "   session_reaction_state_outs_id_seq    SEQUENCE     �   CREATE SEQUENCE session_reaction_state_outs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.session_reaction_state_outs_id_seq;
       public       postgres    false    5    273            G           0    0 "   session_reaction_state_outs_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE session_reaction_state_outs_id_seq OWNED BY session_reaction_state_outs.id;
            public       postgres    false    272                       1259    26008    session_reactions    TABLE     R  CREATE TABLE session_reactions (
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
       public         postgres    false    5                       1259    26006    session_reactions_id_seq    SEQUENCE     z   CREATE SEQUENCE session_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.session_reactions_id_seq;
       public       postgres    false    271    5            H           0    0    session_reactions_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE session_reactions_id_seq OWNED BY session_reactions.id;
            public       postgres    false    270                       1259    25869    session_space_elements    TABLE       CREATE TABLE session_space_elements (
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
       public         postgres    false    5                       1259    25867    session_space_elements_id_seq    SEQUENCE        CREATE SEQUENCE session_space_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.session_space_elements_id_seq;
       public       postgres    false    263    5            I           0    0    session_space_elements_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE session_space_elements_id_seq OWNED BY session_space_elements.id;
            public       postgres    false    262                       1259    25849    session_spaces    TABLE     �  CREATE TABLE session_spaces (
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
       public         postgres    false    5                       1259    25847    session_spaces_id_seq    SEQUENCE     w   CREATE SEQUENCE session_spaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.session_spaces_id_seq;
       public       postgres    false    5    261            J           0    0    session_spaces_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE session_spaces_id_seq OWNED BY session_spaces.id;
            public       postgres    false    260            �            1259    25265    session_state_logs    TABLE     [  CREATE TABLE session_state_logs (
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
       public         postgres    false    5            �            1259    25027    session_state_logs_id_seq    SEQUENCE     }   CREATE SEQUENCE session_state_logs_id_seq
    START WITH 816
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.session_state_logs_id_seq;
       public       postgres    false    250    5            K           0    0    session_state_logs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE session_state_logs_id_seq OWNED BY session_state_logs.id;
            public       postgres    false    207                       1259    25980    session_switchers    TABLE     �  CREATE TABLE session_switchers (
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
       public         postgres    false    5                       1259    25978    session_switchers_id_seq    SEQUENCE     z   CREATE SEQUENCE session_switchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.session_switchers_id_seq;
       public       postgres    false    5    269            L           0    0    session_switchers_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE session_switchers_id_seq OWNED BY session_switchers.id;
            public       postgres    false    268            �            1259    25271    sessionstates    TABLE     �  CREATE TABLE sessionstates (
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
       public         postgres    false    5            �            1259    25029    sessionstates_id_seq    SEQUENCE     y   CREATE SEQUENCE sessionstates_id_seq
    START WITH 1332
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sessionstates_id_seq;
       public       postgres    false    5    251            M           0    0    sessionstates_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE sessionstates_id_seq OWNED BY sessionstates.id;
            public       postgres    false    208            �            1259    25286    space_element_reflections    TABLE     �  CREATE TABLE space_element_reflections (
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
       public         postgres    false    5            �            1259    25031     space_element_reflections_id_seq    SEQUENCE     �   CREATE SEQUENCE space_element_reflections_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.space_element_reflections_id_seq;
       public       postgres    false    252    5            N           0    0     space_element_reflections_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE space_element_reflections_id_seq OWNED BY space_element_reflections.id;
            public       postgres    false    209            �            1259    25293    space_elements    TABLE       CREATE TABLE space_elements (
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
       public         postgres    false    5            �            1259    25033    space_elements_id_seq    SEQUENCE     x   CREATE SEQUENCE space_elements_id_seq
    START WITH 56
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.space_elements_id_seq;
       public       postgres    false    253    5            O           0    0    space_elements_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE space_elements_id_seq OWNED BY space_elements.id;
            public       postgres    false    210            �            1259    25300 
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
       public         postgres    false    5            �            1259    25035    space_refs_id_seq    SEQUENCE     s   CREATE SEQUENCE space_refs_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.space_refs_id_seq;
       public       postgres    false    5    254            P           0    0    space_refs_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE space_refs_id_seq OWNED BY space_refs.id;
            public       postgres    false    211            �            1259    25304 
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
       public         postgres    false    5            �            1259    25037    state_refs_id_seq    SEQUENCE     t   CREATE SEQUENCE state_refs_id_seq
    START WITH 26
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.state_refs_id_seq;
       public       postgres    false    255    5            Q           0    0    state_refs_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE state_refs_id_seq OWNED BY state_refs.id;
            public       postgres    false    212                        1259    25319    switcher_refs    TABLE     �  CREATE TABLE switcher_refs (
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
       public         postgres    false    5            �            1259    25039    switcher_refs_id_seq    SEQUENCE     w   CREATE SEQUENCE switcher_refs_id_seq
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.switcher_refs_id_seq;
       public       postgres    false    5    256            R           0    0    switcher_refs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE switcher_refs_id_seq OWNED BY switcher_refs.id;
            public       postgres    false    213                       1259    25328    tokens    TABLE       CREATE TABLE tokens (
    uuid character varying(254) NOT NULL,
    email character varying(254) NOT NULL,
    "creationTime" timestamp(6) without time zone NOT NULL,
    "expirationTime" timestamp(6) without time zone NOT NULL,
    "isSignUp" boolean NOT NULL
);
    DROP TABLE public.tokens;
       public         postgres    false    5            �           2604    25044    id    DEFAULT     f   ALTER TABLE ONLY account_group ALTER COLUMN id SET DEFAULT nextval('account_group_id_seq'::regclass);
 ?   ALTER TABLE public.account_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    172    214            �           2604    25048    id    DEFAULT     f   ALTER TABLE ONLY account_infos ALTER COLUMN id SET DEFAULT nextval('account_infos_id_seq'::regclass);
 ?   ALTER TABLE public.account_infos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    173    215    215            �           2604    25057    id    DEFAULT     j   ALTER TABLE ONLY account_loggers ALTER COLUMN id SET DEFAULT nextval('account_loggers_id_seq'::regclass);
 A   ALTER TABLE public.account_loggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    216    174    216            �           2604    25064    id    DEFAULT     f   ALTER TABLE ONLY account_plans ALTER COLUMN id SET DEFAULT nextval('account_plans_id_seq'::regclass);
 ?   ALTER TABLE public.account_plans ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    175    217    217            �           2604    25074    id    DEFAULT     f   ALTER TABLE ONLY billing_infos ALTER COLUMN id SET DEFAULT nextval('billing_infos_id_seq'::regclass);
 ?   ALTER TABLE public.billing_infos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    176    219            �           2604    25081    id    DEFAULT     V   ALTER TABLE ONLY bills ALTER COLUMN id SET DEFAULT nextval('bills_id_seq'::regclass);
 7   ALTER TABLE public.bills ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    220    177    220            �           2604    25088    id    DEFAULT     ^   ALTER TABLE ONLY bploggers ALTER COLUMN id SET DEFAULT nextval('bploggers_id_seq'::regclass);
 ;   ALTER TABLE public.bploggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    178    221    221            �           2604    25092    id    DEFAULT     `   ALTER TABLE ONLY bprocesses ALTER COLUMN id SET DEFAULT nextval('bprocesses_id_seq'::regclass);
 <   ALTER TABLE public.bprocesses ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    222    179    222            �           2604    25098    id    DEFAULT     `   ALTER TABLE ONLY bpsessions ALTER COLUMN id SET DEFAULT nextval('bpsessions_id_seq'::regclass);
 <   ALTER TABLE public.bpsessions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    180    223    223            �           2604    25103    id    DEFAULT     \   ALTER TABLE ONLY bpspaces ALTER COLUMN id SET DEFAULT nextval('bpspaces_id_seq'::regclass);
 :   ALTER TABLE public.bpspaces ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    224    181    224            �           2604    25109    id    DEFAULT     b   ALTER TABLE ONLY bpstaterefs ALTER COLUMN id SET DEFAULT nextval('bpstaterefs_id_seq'::regclass);
 =   ALTER TABLE public.bpstaterefs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    182    225    225            �           2604    25115    id    DEFAULT     \   ALTER TABLE ONLY bpstates ALTER COLUMN id SET DEFAULT nextval('bpstates_id_seq'::regclass);
 :   ALTER TABLE public.bpstates ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    183    226    226            �           2604    25130    id    DEFAULT     n   ALTER TABLE ONLY bpstation_loggers ALTER COLUMN id SET DEFAULT nextval('bpstation_loggers_id_seq'::regclass);
 C   ALTER TABLE public.bpstation_loggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    184    227    227            �           2604    25137    id    DEFAULT     `   ALTER TABLE ONLY bpstations ALTER COLUMN id SET DEFAULT nextval('bpstations_id_seq'::regclass);
 <   ALTER TABLE public.bpstations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    228    228            �           2604    25145    id    DEFAULT     b   ALTER TABLE ONLY bpswitchers ALTER COLUMN id SET DEFAULT nextval('bpswitchers_id_seq'::regclass);
 =   ALTER TABLE public.bpswitchers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    229    186    229            �           2604    25154    id    DEFAULT     n   ALTER TABLE ONLY business_services ALTER COLUMN id SET DEFAULT nextval('business_services_id_seq'::regclass);
 C   ALTER TABLE public.business_services ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    230    187    230            �           2604    25161    id    DEFAULT     `   ALTER TABLE ONLY businesses ALTER COLUMN id SET DEFAULT nextval('businesses_id_seq'::regclass);
 <   ALTER TABLE public.businesses ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    231    188    231            �           2604    25168    id    DEFAULT     l   ALTER TABLE ONLY client_observers ALTER COLUMN id SET DEFAULT nextval('client_observers_id_seq'::regclass);
 B   ALTER TABLE public.client_observers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    232    232            �           2604    25172    id    DEFAULT     f   ALTER TABLE ONLY elem_topologs ALTER COLUMN id SET DEFAULT nextval('elem_topologs_id_seq'::regclass);
 ?   ALTER TABLE public.elem_topologs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    233    190    233            E	           2604    37773    id    DEFAULT     n   ALTER TABLE ONLY element_resources ALTER COLUMN id SET DEFAULT nextval('element_resources_id_seq'::regclass);
 C   ALTER TABLE public.element_resources ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    277    276    277            �           2604    45952    id    DEFAULT     ^   ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    234    234            �           2604    25186    id    DEFAULT     X   ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    236    236            �           2604    25190    id    DEFAULT     f   ALTER TABLE ONLY input_loggers ALTER COLUMN id SET DEFAULT nextval('input_loggers_id_seq'::regclass);
 ?   ALTER TABLE public.input_loggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    237    194    237            K	           2604    46049    id    DEFAULT     f   ALTER TABLE ONLY launch_shares ALTER COLUMN id SET DEFAULT nextval('launch_shares_id_seq'::regclass);
 ?   ALTER TABLE public.launch_shares ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    285    284    285            J	           2604    46007    id    DEFAULT     d   ALTER TABLE ONLY launch_warps ALTER COLUMN id SET DEFAULT nextval('launch_warps_id_seq'::regclass);
 >   ALTER TABLE public.launch_warps ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    283    282    283            	           2604    25199    id    DEFAULT     ^   ALTER TABLE ONLY observers ALTER COLUMN id SET DEFAULT nextval('observers_id_seq'::regclass);
 ;   ALTER TABLE public.observers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    238    195    238            	           2604    25206    id    DEFAULT     V   ALTER TABLE ONLY plans ALTER COLUMN id SET DEFAULT nextval('plans_id_seq'::regclass);
 7   ALTER TABLE public.plans ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    239    239            	           2604    25210    id    DEFAULT     |   ALTER TABLE ONLY proc_element_reflections ALTER COLUMN id SET DEFAULT nextval('proc_element_reflections_id_seq'::regclass);
 J   ALTER TABLE public.proc_element_reflections ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    240    197    240            	           2604    25217    id    DEFAULT     f   ALTER TABLE ONLY proc_elements ALTER COLUMN id SET DEFAULT nextval('proc_elements_id_seq'::regclass);
 ?   ALTER TABLE public.proc_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    241    198    241            	           2604    25224    id    DEFAULT     n   ALTER TABLE ONLY process_histories ALTER COLUMN id SET DEFAULT nextval('process_histories_id_seq'::regclass);
 C   ALTER TABLE public.process_histories ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    242    199    242            		           2604    25232    id    DEFAULT     r   ALTER TABLE ONLY process_permissions ALTER COLUMN id SET DEFAULT nextval('process_permissions_id_seq'::regclass);
 E   ALTER TABLE public.process_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    243    200    243            
	           2604    25239    id    DEFAULT     f   ALTER TABLE ONLY reaction_refs ALTER COLUMN id SET DEFAULT nextval('reaction_refs_id_seq'::regclass);
 ?   ALTER TABLE public.reaction_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    244    201    244            	           2604    25243    id    DEFAULT     z   ALTER TABLE ONLY reaction_state_out_refs ALTER COLUMN id SET DEFAULT nextval('reaction_state_out_refs_id_seq'::regclass);
 I   ALTER TABLE public.reaction_state_out_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    245    202    245            	           2604    25247    id    DEFAULT     r   ALTER TABLE ONLY reaction_state_outs ALTER COLUMN id SET DEFAULT nextval('reaction_state_outs_id_seq'::regclass);
 E   ALTER TABLE public.reaction_state_outs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    246    203    246            	           2604    25251    id    DEFAULT     ^   ALTER TABLE ONLY reactions ALTER COLUMN id SET DEFAULT nextval('reactions_id_seq'::regclass);
 ;   ALTER TABLE public.reactions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    247    247            	           2604    25255    id    DEFAULT     z   ALTER TABLE ONLY reflected_elem_topologs ALTER COLUMN id SET DEFAULT nextval('reflected_elem_topologs_id_seq'::regclass);
 I   ALTER TABLE public.reflected_elem_topologs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    248    248            	           2604    25259    id    DEFAULT     T   ALTER TABLE ONLY refs ALTER COLUMN id SET DEFAULT nextval('refs_id_seq'::regclass);
 6   ALTER TABLE public.refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    249    249            D	           2604    37757    id    DEFAULT     ^   ALTER TABLE ONLY resources ALTER COLUMN id SET DEFAULT nextval('resources_id_seq'::regclass);
 ;   ALTER TABLE public.resources ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    274    275    275            4	           2604    25903    id    DEFAULT     v   ALTER TABLE ONLY session_elem_topologs ALTER COLUMN id SET DEFAULT nextval('session_elem_topologs_id_seq'::regclass);
 G   ALTER TABLE public.session_elem_topologs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    265    264    265            G	           2604    37800    id    DEFAULT     ~   ALTER TABLE ONLY session_element_resources ALTER COLUMN id SET DEFAULT nextval('session_element_resources_id_seq'::regclass);
 K   ALTER TABLE public.session_element_resources ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    278    279    279            5	           2604    25939    id    DEFAULT     x   ALTER TABLE ONLY session_initial_states ALTER COLUMN id SET DEFAULT nextval('session_initial_states_id_seq'::regclass);
 H   ALTER TABLE public.session_initial_states ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    266    267    267            /	           2604    25826    id    DEFAULT     v   ALTER TABLE ONLY session_proc_elements ALTER COLUMN id SET DEFAULT nextval('session_proc_elements_id_seq'::regclass);
 G   ALTER TABLE public.session_proc_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    259    258    259            B	           2604    26042    id    DEFAULT     �   ALTER TABLE ONLY session_reaction_state_outs ALTER COLUMN id SET DEFAULT nextval('session_reaction_state_outs_id_seq'::regclass);
 M   ALTER TABLE public.session_reaction_state_outs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    272    273    273            A	           2604    26011    id    DEFAULT     n   ALTER TABLE ONLY session_reactions ALTER COLUMN id SET DEFAULT nextval('session_reactions_id_seq'::regclass);
 C   ALTER TABLE public.session_reactions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    270    271    271            3	           2604    25872    id    DEFAULT     x   ALTER TABLE ONLY session_space_elements ALTER COLUMN id SET DEFAULT nextval('session_space_elements_id_seq'::regclass);
 H   ALTER TABLE public.session_space_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    262    263    263            0	           2604    25852    id    DEFAULT     h   ALTER TABLE ONLY session_spaces ALTER COLUMN id SET DEFAULT nextval('session_spaces_id_seq'::regclass);
 @   ALTER TABLE public.session_spaces ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    261    260    261            	           2604    25268    id    DEFAULT     p   ALTER TABLE ONLY session_state_logs ALTER COLUMN id SET DEFAULT nextval('session_state_logs_id_seq'::regclass);
 D   ALTER TABLE public.session_state_logs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    250    207    250            >	           2604    25983    id    DEFAULT     n   ALTER TABLE ONLY session_switchers ALTER COLUMN id SET DEFAULT nextval('session_switchers_id_seq'::regclass);
 C   ALTER TABLE public.session_switchers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    268    269    269            	           2604    25274    id    DEFAULT     f   ALTER TABLE ONLY sessionstates ALTER COLUMN id SET DEFAULT nextval('sessionstates_id_seq'::regclass);
 ?   ALTER TABLE public.sessionstates ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    251    251             	           2604    25289    id    DEFAULT     ~   ALTER TABLE ONLY space_element_reflections ALTER COLUMN id SET DEFAULT nextval('space_element_reflections_id_seq'::regclass);
 K   ALTER TABLE public.space_element_reflections ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    252    252            !	           2604    25296    id    DEFAULT     h   ALTER TABLE ONLY space_elements ALTER COLUMN id SET DEFAULT nextval('space_elements_id_seq'::regclass);
 @   ALTER TABLE public.space_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    253    253            "	           2604    25303    id    DEFAULT     `   ALTER TABLE ONLY space_refs ALTER COLUMN id SET DEFAULT nextval('space_refs_id_seq'::regclass);
 <   ALTER TABLE public.space_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    254    211    254            #	           2604    25307    id    DEFAULT     `   ALTER TABLE ONLY state_refs ALTER COLUMN id SET DEFAULT nextval('state_refs_id_seq'::regclass);
 <   ALTER TABLE public.state_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    255    212    255            ,	           2604    25322    id    DEFAULT     f   ALTER TABLE ONLY switcher_refs ALTER COLUMN id SET DEFAULT nextval('switcher_refs_id_seq'::regclass);
 ?   ALTER TABLE public.switcher_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    256    213    256            �
          0    25041    account_group 
   TABLE DATA               _   COPY account_group (id, account_id, group_id, created_at, updated_at, employee_id) FROM stdin;
    public       postgres    false    214   ��      S           0    0    account_group_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('account_group_id_seq', 9, true);
            public       postgres    false    172            �
          0    25045    account_infos 
   TABLE DATA               _   COPY account_infos (id, uid, created_at, early_access, pro_features, workbench_id) FROM stdin;
    public       postgres    false    215   i�      T           0    0    account_infos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('account_infos_id_seq', 22, true);
            public       postgres    false    173            �
          0    25054    account_loggers 
   TABLE DATA               C   COPY account_loggers (id, ip, user_agent, email, date) FROM stdin;
    public       postgres    false    216   ��      U           0    0    account_loggers_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('account_loggers_id_seq', 1008, true);
            public       postgres    false    174                      0    37848    account_plan_history 
   TABLE DATA               \   COPY account_plan_history (id, account_plan_id, limit_diff, plan_diff, bill_id) FROM stdin;
    public       postgres    false    281   ��      V           0    0    account_plan_history_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('account_plan_history_id_seq', 1, false);
            public       postgres    false    280            �
          0    25061    account_plans 
   TABLE DATA               c   COPY account_plans (id, business_id, master_acc, plan_id, expired_at, active, "limit") FROM stdin;
    public       postgres    false    217   ��      W           0    0    account_plans_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('account_plans_id_seq', 52, true);
            public       postgres    false    175            �
          0    25065    accounts 
   TABLE DATA                 COPY accounts ("providerId", "userId", "firstName", "lastName", "fullName", email, "avatarUrl", "authMethod", token, secret, "accessToken", "tokenType", "expiresIn", "refreshToken", hasher, password, salt, lang, country, phone, nickname, created_at) FROM stdin;
    public       postgres    false    218   ��      �
          0    25071    billing_infos 
   TABLE DATA               p   COPY billing_infos (id, business_id, firstname, lastname, address, zipcode, created_at, updated_at) FROM stdin;
    public       postgres    false    219   ��      X           0    0    billing_infos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('billing_infos_id_seq', 1, false);
            public       postgres    false    176            �
          0    25078    bills 
   TABLE DATA               _   COPY bills (id, title, master_acc, assigned, approved, expired, sum, workbench_id) FROM stdin;
    public       postgres    false    220   �      Y           0    0    bills_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('bills_id_seq', 1, true);
            public       postgres    false    177            �
          0    25085 	   bploggers 
   TABLE DATA               �   COPY bploggers (id, process_id, proc_element_id, space_element_id, "order", space_id, station_id, invoked, expanded, container, date, step) FROM stdin;
    public       postgres    false    221   (�      Z           0    0    bploggers_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bploggers_id_seq', 1307, true);
            public       postgres    false    178            �
          0    25089 
   bprocesses 
   TABLE DATA               v   COPY bprocesses (id, title, service_id, business_id, created_at, updated_at, version, state_machine_type) FROM stdin;
    public       postgres    false    222   D�      [           0    0    bprocesses_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('bprocesses_id_seq', 83, true);
            public       postgres    false    179            �
          0    25095 
   bpsessions 
   TABLE DATA               T   COPY bpsessions (id, process_id, created_at, updated_at, active_listed) FROM stdin;
    public       postgres    false    223   ?�      \           0    0    bpsessions_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bpsessions_id_seq', 184, true);
            public       postgres    false    180            �
          0    25100    bpspaces 
   TABLE DATA               �   COPY bpspaces (id, process_id, index, container, subbrick, brick_front_id, brick_nested_id, nesting_level, created_at, updated_at) FROM stdin;
    public       postgres    false    224   h�      ]           0    0    bpspaces_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('bpspaces_id_seq', 91, true);
            public       postgres    false    181            �
          0    25106    bpstaterefs 
   TABLE DATA               w   COPY bpstaterefs (id, bprocess_id, switch_type, priority, state_id, session_state, created_at, updated_at) FROM stdin;
    public       postgres    false    225   C�      ^           0    0    bpstaterefs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bpstaterefs_id_seq', 1, false);
            public       postgres    false    182            �
          0    25112    bpstates 
   TABLE DATA               �   COPY bpstates (id, process_id, title, neutral, is_process_state, front_elem_id, space_elem_id, created_at, updated_at, lang, space_id, "on", on_rate, middle, middleable, oposite, opositable) FROM stdin;
    public       postgres    false    226   `�      _           0    0    bpstates_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('bpstates_id_seq', 416, true);
            public       postgres    false    183            �
          0    25127    bpstation_loggers 
   TABLE DATA               �   COPY bpstation_loggers (id, station_id, process_id, sygnal, date, state, step, space, container_step, expand_step, spaces_ids, started, finished, inspace, incontainer, inexpands, paused) FROM stdin;
    public       postgres    false    227   R      `           0    0    bpstation_loggers_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('bpstation_loggers_id_seq', 3962, true);
            public       postgres    false    184            �
          0    25134 
   bpstations 
   TABLE DATA               �   COPY bpstations (id, process_id, state, step, space, container_step, expand_step, spaces_ids, started, finished, inspace, incontainer, inexpands, paused, note, created_at, updated_at, canceled, session_id, front) FROM stdin;
    public       postgres    false    228   �p      a           0    0    bpstations_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bpstations_id_seq', 306, true);
            public       postgres    false    185            �
          0    25142    bpswitchers 
   TABLE DATA               �   COPY bpswitchers (id, bprocess_id, switch_type, priority, state_id, session_state, fn, target, created_at, updated_at, override_group) FROM stdin;
    public       postgres    false    229   yr      b           0    0    bpswitchers_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('bpswitchers_id_seq', 224, true);
            public       postgres    false    186            �
          0    25151    business_services 
   TABLE DATA               H   COPY business_services (id, title, business_id, master_acc) FROM stdin;
    public       postgres    false    230   �t      c           0    0    business_services_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('business_services_id_seq', 50, true);
            public       postgres    false    187            �
          0    25158 
   businesses 
   TABLE DATA               �   COPY businesses (id, title, phone, website, country, city, address, walkthrough, created_at, updated_at, nickname, org) FROM stdin;
    public       postgres    false    231   v      d           0    0    businesses_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('businesses_id_seq', 30, true);
            public       postgres    false    188            �
          0    25165    client_observers 
   TABLE DATA               ,   COPY client_observers (id, uid) FROM stdin;
    public       postgres    false    232   9w      e           0    0    client_observers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('client_observers_id_seq', 1, false);
            public       postgres    false    189            �
          0    25169    elem_topologs 
   TABLE DATA               v   COPY elem_topologs (id, process_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
    public       postgres    false    233   Vw      f           0    0    elem_topologs_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('elem_topologs_id_seq', 153, true);
            public       postgres    false    190                      0    37770    element_resources 
   TABLE DATA               o   COPY element_resources (id, element_id, process_id, resource_id, entities, created_at, updated_at) FROM stdin;
    public       postgres    false    277   �y      g           0    0    element_resources_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('element_resources_id_seq', 1, false);
            public       postgres    false    276            �
          0    25173 	   employees 
   TABLE DATA               T   COPY employees (id, uid, master_acc, "position", manager, workbench_id) FROM stdin;
    public       postgres    false    234   �y      �
          0    25180    employees_businesses 
   TABLE DATA               A   COPY employees_businesses (employee_id, business_id) FROM stdin;
    public       postgres    false    235   �{      h           0    0    employees_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('employees_id_seq', 40, true);
            public       postgres    false    191            �
          0    25183    groups 
   TABLE DATA               I   COPY groups (id, title, created_at, updated_at, business_id) FROM stdin;
    public       postgres    false    236   #|      i           0    0    groups_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('groups_id_seq', 26, true);
            public       postgres    false    192            j           0    0    input_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('input_id_seq', 356, true);
            public       postgres    false    193            �
          0    25187    input_loggers 
   TABLE DATA               l   COPY input_loggers (id, uid, action, arguments, reaction_id, input, date, session_id, input_id) FROM stdin;
    public       postgres    false    237   �}      k           0    0    input_loggers_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('input_loggers_id_seq', 190, true);
            public       postgres    false    194                      0    46046    launch_shares 
   TABLE DATA               ?   COPY launch_shares (id, title, price, description) FROM stdin;
    public       postgres    false    285   O�      l           0    0    launch_shares_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('launch_shares_id_seq', 2, true);
            public       postgres    false    284                      0    46004    launch_warps 
   TABLE DATA               c   COPY launch_warps (id, launch_id, launch_element_id, board_id, created_at, updated_at) FROM stdin;
    public       postgres    false    283   ��      m           0    0    launch_warps_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('launch_warps_id_seq', 1, false);
            public       postgres    false    282            �
          0    25196 	   observers 
   TABLE DATA               \   COPY observers (id, station_id, bprocess_id, hash_code, "fullName", created_at) FROM stdin;
    public       postgres    false    238   ��      n           0    0    observers_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('observers_id_seq', 1, false);
            public       postgres    false    195            �
          0    25203    plans 
   TABLE DATA               W   COPY plans (id, title, price, description, slot_included, "order", hidden) FROM stdin;
    public       postgres    false    239   р      o           0    0    plans_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('plans_id_seq', 3, true);
            public       postgres    false    196            �
          0    25207    proc_element_reflections 
   TABLE DATA               �   COPY proc_element_reflections (id, reflection_id, title, "desc", b_type, type_title, ref_space_id, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    240   u�      p           0    0    proc_element_reflections_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('proc_element_reflections_id_seq', 25, true);
            public       postgres    false    197            �
          0    25214    proc_elements 
   TABLE DATA               �   COPY proc_elements (id, title, "desc", business_id, bprocess_id, b_type, type_title, space_id, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    241   ��      q           0    0    proc_elements_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('proc_elements_id_seq', 264, true);
            public       postgres    false    198            �
          0    25221    process_histories 
   TABLE DATA               ]   COPY process_histories (id, master_acc, action, process_id, what, what_id, date) FROM stdin;
    public       postgres    false    242   �      r           0    0    process_histories_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('process_histories_id_seq', 153, true);
            public       postgres    false    199            �
          0    25229    process_permissions 
   TABLE DATA               t   COPY process_permissions (id, uid, group_id, bprocess, front_elem_id, space_elem_id, reaction_id, role) FROM stdin;
    public       postgres    false    243   Q�      s           0    0    process_permissions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('process_permissions_id_seq', 24, true);
            public       postgres    false    200            �
          0    25236    reaction_refs 
   TABLE DATA               w   COPY reaction_refs (id, reflection_id, autostart, element_id, state_ref_id, created_at, updated_at, title) FROM stdin;
    public       postgres    false    244   �      t           0    0    reaction_refs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('reaction_refs_id_seq', 4, true);
            public       postgres    false    201            �
          0    25240    reaction_state_out_refs 
   TABLE DATA               t   COPY reaction_state_out_refs (id, reaction_id, state_ref, "on", on_rate, created_at, updated_at, input) FROM stdin;
    public       postgres    false    245   R�      u           0    0    reaction_state_out_refs_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('reaction_state_out_refs_id_seq', 4, true);
            public       postgres    false    202            �
          0    25244    reaction_state_outs 
   TABLE DATA               o   COPY reaction_state_outs (id, reaction_id, state_id, "on", on_rate, created_at, updated_at, input) FROM stdin;
    public       postgres    false    246   ��      v           0    0    reaction_state_outs_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('reaction_state_outs_id_seq', 43, true);
            public       postgres    false    203            �
          0    25248 	   reactions 
   TABLE DATA               q   COPY reactions (id, bprocess_id, autostart, element_id, state_ref_id, created_at, updated_at, title) FROM stdin;
    public       postgres    false    247   [�      w           0    0    reactions_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('reactions_id_seq', 52, true);
            public       postgres    false    204            �
          0    25252    reflected_elem_topologs 
   TABLE DATA               �   COPY reflected_elem_topologs (id, reflection_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
    public       postgres    false    248   !�      x           0    0    reflected_elem_topologs_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('reflected_elem_topologs_id_seq', 22, true);
            public       postgres    false    205            �
          0    25256    refs 
   TABLE DATA               Z   COPY refs (id, title, host, created_at, updated_at, "desc", category, hidden) FROM stdin;
    public       postgres    false    249   �      y           0    0    refs_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('refs_id_seq', 27, true);
            public       postgres    false    206            
          0    37754 	   resources 
   TABLE DATA               L   COPY resources (id, title, business_id, created_at, updated_at) FROM stdin;
    public       postgres    false    275   ϓ      z           0    0    resources_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('resources_id_seq', 13, true);
            public       postgres    false    274                       0    25900    session_elem_topologs 
   TABLE DATA               �   COPY session_elem_topologs (id, process_id, session_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
    public       postgres    false    265   ��      {           0    0    session_elem_topologs_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('session_elem_topologs_id_seq', 137, true);
            public       postgres    false    264                      0    37797    session_element_resources 
   TABLE DATA               �   COPY session_element_resources (id, session_element_id, process_id, session_id, resource_id, entities, created_at, updated_at) FROM stdin;
    public       postgres    false    279   �      |           0    0     session_element_resources_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('session_element_resources_id_seq', 1, false);
            public       postgres    false    278                      0    25936    session_initial_states 
   TABLE DATA               �   COPY session_initial_states (id, process_id, session_id, title, neutral, is_process_state, "on", on_rate, ses_front_elem_id, ses_space_elem_id, ses_space_id, created_at, updated_at, lang, middle, middleable, oposite, opositable) FROM stdin;
    public       postgres    false    267   �      }           0    0    session_initial_states_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('session_initial_states_id_seq', 359, true);
            public       postgres    false    266            �
          0    25823    session_proc_elements 
   TABLE DATA               �   COPY session_proc_elements (id, title, "desc", business_id, bprocess_id, session_id, b_type, type_title, space_id, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    259   2�      ~           0    0    session_proc_elements_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('session_proc_elements_id_seq', 148, true);
            public       postgres    false    258                      0    26039    session_reaction_state_outs 
   TABLE DATA                  COPY session_reaction_state_outs (id, session_state_id, reaction_id, "on", on_rate, created_at, updated_at, input) FROM stdin;
    public       postgres    false    273   ס                 0    0 "   session_reaction_state_outs_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('session_reaction_state_outs_id_seq', 103, true);
            public       postgres    false    272                      0    26008    session_reactions 
   TABLE DATA               �   COPY session_reactions (id, bprocess_id, session_id, autostart, element_id, state_ref_id, title, created_at, updated_at) FROM stdin;
    public       postgres    false    271   L�      �           0    0    session_reactions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('session_reactions_id_seq', 103, true);
            public       postgres    false    270            �
          0    25869    session_space_elements 
   TABLE DATA               �   COPY session_space_elements (id, title, "desc", business_id, bprocess_id, session_id, b_type, type_title, own_space_id, owned_space_id, space_role, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    263   ��      �           0    0    session_space_elements_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('session_space_elements_id_seq', 16, true);
            public       postgres    false    262            �
          0    25849    session_spaces 
   TABLE DATA               �   COPY session_spaces (id, process_id, session_id, index, container, subbrick, brick_front_id, brick_nested_id, nesting_level, created_at, updated_at) FROM stdin;
    public       postgres    false    261   ��      �           0    0    session_spaces_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('session_spaces_id_seq', 23, true);
            public       postgres    false    260            �
          0    25265    session_state_logs 
   TABLE DATA               n   COPY session_state_logs (id, session_id, "on", on_rate, reason, created_at, updated_at, state_id) FROM stdin;
    public       postgres    false    250   `�      �           0    0    session_state_logs_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('session_state_logs_id_seq', 1151, true);
            public       postgres    false    207                      0    25980    session_switchers 
   TABLE DATA               �   COPY session_switchers (id, bprocess_id, session_id, switch_type, priority, session_state_ref_id, session_state_id, fn, target, override_group, created_at, updated_at) FROM stdin;
    public       postgres    false    269   �      �           0    0    session_switchers_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('session_switchers_id_seq', 267, true);
            public       postgres    false    268            �
          0    25271    sessionstates 
   TABLE DATA               -  COPY sessionstates (id, process_id, session_id, title, neutral, is_process_state, front_elem_id, space_elem_id, created_at, updated_at, lang, space_id, "on", on_rate, origin_state_id, middle, middleable, oposite, opositable, session_front_elem_id, session_space_id, session_space_elem_id) FROM stdin;
    public       postgres    false    251   �      �           0    0    sessionstates_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('sessionstates_id_seq', 1690, true);
            public       postgres    false    208            �
          0    25286    space_element_reflections 
   TABLE DATA               �   COPY space_element_reflections (id, reflection_id, title, "desc", b_type, type_title, ref_space_id, ref_space_owned_id, space_role, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    252   ��      �           0    0     space_element_reflections_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('space_element_reflections_id_seq', 3, false);
            public       postgres    false    209            �
          0    25293    space_elements 
   TABLE DATA               �   COPY space_elements (id, title, "desc", business_id, bprocess_id, b_type, type_title, own_space_id, owned_space_id, space_role, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    253   ٽ      �           0    0    space_elements_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('space_elements_id_seq', 59, true);
            public       postgres    false    210            �
          0    25300 
   space_refs 
   TABLE DATA               �   COPY space_refs (id, reflection_id, index, container, subbrick, brick_front, brick_nested, "nestingLevel", created_at, updated_at) FROM stdin;
    public       postgres    false    254   ׾      �           0    0    space_refs_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('space_refs_id_seq', 3, true);
            public       postgres    false    211            �
          0    25304 
   state_refs 
   TABLE DATA               �   COPY state_refs (id, reflection_id, title, neutral, process_state, "on", on_rate, ref_front_elem_id, ref_space_elem_id, created_at, updated_at, lang, ref_space_id, middle, middleable, oposite, opositable) FROM stdin;
    public       postgres    false    255   3�      �           0    0    state_refs_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('state_refs_id_seq', 26, true);
            public       postgres    false    212            �
          0    25319    switcher_refs 
   TABLE DATA               �   COPY switcher_refs (id, reflection_id, switch_type, priority, state_ref_id, fn, target, created_at, updated_at, override_group) FROM stdin;
    public       postgres    false    256   0�      �           0    0    switcher_refs_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('switcher_refs_id_seq', 15, true);
            public       postgres    false    213            �
          0    25328    tokens 
   TABLE DATA               T   COPY tokens (uuid, email, "creationTime", "expirationTime", "isSignUp") FROM stdin;
    public       postgres    false    257   ��      M	           2606    25335    account_group_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY account_group
    ADD CONSTRAINT account_group_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.account_group DROP CONSTRAINT account_group_pkey;
       public         postgres    false    214    214            O	           2606    25337    account_infos_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY account_infos
    ADD CONSTRAINT account_infos_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.account_infos DROP CONSTRAINT account_infos_pkey;
       public         postgres    false    215    215            Q	           2606    25339    account_loggers_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY account_loggers
    ADD CONSTRAINT account_loggers_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.account_loggers DROP CONSTRAINT account_loggers_pkey;
       public         postgres    false    216    216            �	           2606    37856    account_plan_history_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY account_plan_history
    ADD CONSTRAINT account_plan_history_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_plan_history DROP CONSTRAINT account_plan_history_pkey;
       public         postgres    false    281    281            S	           2606    25341    account_plans_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.account_plans DROP CONSTRAINT account_plans_pkey;
       public         postgres    false    217    217            U	           2606    25343    accounts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY ("userId");
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public         postgres    false    218    218            W	           2606    25345    billing_infos_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY billing_infos
    ADD CONSTRAINT billing_infos_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.billing_infos DROP CONSTRAINT billing_infos_pkey;
       public         postgres    false    219    219            Y	           2606    25347 
   bills_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.bills DROP CONSTRAINT bills_pkey;
       public         postgres    false    220    220            [	           2606    25349    bploggers_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY bploggers
    ADD CONSTRAINT bploggers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.bploggers DROP CONSTRAINT bploggers_pkey;
       public         postgres    false    221    221            ]	           2606    25351    bprocesses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.bprocesses DROP CONSTRAINT bprocesses_pkey;
       public         postgres    false    222    222            _	           2606    25353    bpsessions_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bpsessions
    ADD CONSTRAINT bpsessions_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.bpsessions DROP CONSTRAINT bpsessions_pkey;
       public         postgres    false    223    223            a	           2606    25355    bpspaces_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY bpspaces
    ADD CONSTRAINT bpspaces_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.bpspaces DROP CONSTRAINT bpspaces_pkey;
       public         postgres    false    224    224            c	           2606    25357    bpstaterefs_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.bpstaterefs DROP CONSTRAINT bpstaterefs_pkey;
       public         postgres    false    225    225            e	           2606    25359    bpstates_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_pkey;
       public         postgres    false    226    226            g	           2606    25361    bpstation_loggers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY bpstation_loggers
    ADD CONSTRAINT bpstation_loggers_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.bpstation_loggers DROP CONSTRAINT bpstation_loggers_pkey;
       public         postgres    false    227    227            i	           2606    25363    bpstations_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bpstations
    ADD CONSTRAINT bpstations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.bpstations DROP CONSTRAINT bpstations_pkey;
       public         postgres    false    228    228            k	           2606    25365    bpswitchers_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.bpswitchers DROP CONSTRAINT bpswitchers_pkey;
       public         postgres    false    229    229            m	           2606    25367    business_services_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY business_services
    ADD CONSTRAINT business_services_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.business_services DROP CONSTRAINT business_services_pkey;
       public         postgres    false    230    230            o	           2606    25369    businesses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.businesses DROP CONSTRAINT businesses_pkey;
       public         postgres    false    231    231            q	           2606    25371    client_observers_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY client_observers
    ADD CONSTRAINT client_observers_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.client_observers DROP CONSTRAINT client_observers_pkey;
       public         postgres    false    232    232            s	           2606    25373    elem_topologs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_pkey;
       public         postgres    false    233    233            �	           2606    37779    element_resources_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT element_resources_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT element_resources_pkey;
       public         postgres    false    277    277            u	           2606    45955    employees_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public         postgres    false    234    234            w	           2606    25377    groups_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public         postgres    false    236    236            y	           2606    25379    input_loggers_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT input_loggers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.input_loggers DROP CONSTRAINT input_loggers_pkey;
       public         postgres    false    237    237            �	           2606    46054    launch_shares_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.launch_shares DROP CONSTRAINT launch_shares_pkey;
       public         postgres    false    285    285            �	           2606    46012    launch_warps_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.launch_warps DROP CONSTRAINT launch_warps_pkey;
       public         postgres    false    283    283            {	           2606    25381    observers_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.observers DROP CONSTRAINT observers_pkey;
       public         postgres    false    238    238            }	           2606    25383 
   plans_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.plans DROP CONSTRAINT plans_pkey;
       public         postgres    false    239    239            	           2606    25385    proc_element_reflections_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY proc_element_reflections
    ADD CONSTRAINT proc_element_reflections_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.proc_element_reflections DROP CONSTRAINT proc_element_reflections_pkey;
       public         postgres    false    240    240            �	           2606    25387    proc_elements_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.proc_elements DROP CONSTRAINT proc_elements_pkey;
       public         postgres    false    241    241            �	           2606    25389    process_histories_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY process_histories
    ADD CONSTRAINT process_histories_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.process_histories DROP CONSTRAINT process_histories_pkey;
       public         postgres    false    242    242            �	           2606    25391    process_permissions_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_pkey;
       public         postgres    false    243    243            �	           2606    25393    reaction_refs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_pkey;
       public         postgres    false    244    244            �	           2606    25395    reaction_state_out_refs_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.reaction_state_out_refs DROP CONSTRAINT reaction_state_out_refs_pkey;
       public         postgres    false    245    245            �	           2606    25397    reaction_state_outs_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.reaction_state_outs DROP CONSTRAINT reaction_state_outs_pkey;
       public         postgres    false    246    246            �	           2606    25400    reactions_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_pkey;
       public         postgres    false    247    247            �	           2606    25402    reflected_elem_topologs_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_pkey;
       public         postgres    false    248    248            �	           2606    25406 	   refs_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY refs
    ADD CONSTRAINT refs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.refs DROP CONSTRAINT refs_pkey;
       public         postgres    false    249    249            �	           2606    25404    refs_title_key 
   CONSTRAINT     H   ALTER TABLE ONLY refs
    ADD CONSTRAINT refs_title_key UNIQUE (title);
 =   ALTER TABLE ONLY public.refs DROP CONSTRAINT refs_title_key;
       public         postgres    false    249    249            �	           2606    37762    resources_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_pkey;
       public         postgres    false    275    275            �	           2606    25908    session_elem_topologs_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT session_elem_topologs_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT session_elem_topologs_pkey;
       public         postgres    false    265    265            �	           2606    37806    session_element_resources_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT session_element_resources_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT session_element_resources_pkey;
       public         postgres    false    279    279            �	           2606    25952    session_initial_states_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT session_initial_states_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT session_initial_states_pkey;
       public         postgres    false    267    267            �	           2606    25831    session_proc_elements_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT session_proc_elements_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT session_proc_elements_pkey;
       public         postgres    false    259    259            �	           2606    26044     session_reaction_state_outs_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT session_reaction_state_outs_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.session_reaction_state_outs DROP CONSTRAINT session_reaction_state_outs_pkey;
       public         postgres    false    273    273            �	           2606    26016    session_reactions_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT session_reactions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT session_reactions_pkey;
       public         postgres    false    271    271            �	           2606    25877    session_space_elements_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT session_space_elements_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT session_space_elements_pkey;
       public         postgres    false    263    263            �	           2606    25856    session_spaces_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT session_spaces_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.session_spaces DROP CONSTRAINT session_spaces_pkey;
       public         postgres    false    261    261            �	           2606    25408    session_state_logs_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.session_state_logs DROP CONSTRAINT session_state_logs_pkey;
       public         postgres    false    250    250            �	           2606    25990    session_switchers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT session_switchers_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT session_switchers_pkey;
       public         postgres    false    269    269            �	           2606    25410    sessionstates_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT sessionstates_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT sessionstates_pkey;
       public         postgres    false    251    251            �	           2606    25412    space_element_reflections_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY space_element_reflections
    ADD CONSTRAINT space_element_reflections_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.space_element_reflections DROP CONSTRAINT space_element_reflections_pkey;
       public         postgres    false    252    252            �	           2606    25414    space_elements_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_pkey;
       public         postgres    false    253    253            �	           2606    25416    space_refs_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY space_refs
    ADD CONSTRAINT space_refs_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.space_refs DROP CONSTRAINT space_refs_pkey;
       public         postgres    false    254    254            �	           2606    25418    state_refs_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_pkey;
       public         postgres    false    255    255            �	           2606    25420    switcher_refs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.switcher_refs DROP CONSTRAINT switcher_refs_pkey;
       public         postgres    false    256    256            �	           2606    45997    acc_group_employee_fk    FK CONSTRAINT     �   ALTER TABLE ONLY account_group
    ADD CONSTRAINT acc_group_employee_fk FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.account_group DROP CONSTRAINT acc_group_employee_fk;
       public       postgres    false    214    234    2421            �	           2606    45973     acc_info_current_biz_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY account_infos
    ADD CONSTRAINT acc_info_current_biz_business_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.account_infos DROP CONSTRAINT acc_info_current_biz_business_fk;
       public       postgres    false    2415    215    231            1
           2606    37861    acc_plan_his_fk    FK CONSTRAINT     �   ALTER TABLE ONLY account_plan_history
    ADD CONSTRAINT acc_plan_his_fk FOREIGN KEY (account_plan_id) REFERENCES account_plans(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.account_plan_history DROP CONSTRAINT acc_plan_his_fk;
       public       postgres    false    217    281    2387            �	           2606    25421    account_group_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_group
    ADD CONSTRAINT account_group_account_id_fkey FOREIGN KEY (account_id) REFERENCES accounts("userId") ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.account_group DROP CONSTRAINT account_group_account_id_fkey;
       public       postgres    false    218    214    2389            �	           2606    25426    account_group_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_group
    ADD CONSTRAINT account_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.account_group DROP CONSTRAINT account_group_group_id_fkey;
       public       postgres    false    214    2423    236            �	           2606    25431    account_infos_uid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_infos
    ADD CONSTRAINT account_infos_uid_fkey FOREIGN KEY (uid) REFERENCES accounts("userId") ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.account_infos DROP CONSTRAINT account_infos_uid_fkey;
       public       postgres    false    218    215    2389            �	           2606    25441    account_plans_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);
 V   ALTER TABLE ONLY public.account_plans DROP CONSTRAINT account_plans_business_id_fkey;
       public       postgres    false    217    2415    231            �	           2606    25446    account_plans_master_acc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_master_acc_fkey FOREIGN KEY (master_acc) REFERENCES accounts("userId") ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.account_plans DROP CONSTRAINT account_plans_master_acc_fkey;
       public       postgres    false    217    218    2389            �	           2606    25436    account_plans_plan_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES plans(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.account_plans DROP CONSTRAINT account_plans_plan_id_fkey;
       public       postgres    false    239    217    2429            0
           2606    37866    bill_his_fk    FK CONSTRAINT     �   ALTER TABLE ONLY account_plan_history
    ADD CONSTRAINT bill_his_fk FOREIGN KEY (bill_id) REFERENCES bills(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.account_plan_history DROP CONSTRAINT bill_his_fk;
       public       postgres    false    2393    281    220            �	           2606    25451    billing_infos_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY billing_infos
    ADD CONSTRAINT billing_infos_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.billing_infos DROP CONSTRAINT billing_infos_business_id_fkey;
       public       postgres    false    2415    219    231            �	           2606    45978    bills_current_biz_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_current_biz_business_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.bills DROP CONSTRAINT bills_current_biz_business_fk;
       public       postgres    false    2415    231    220            �	           2606    25456    bills_master_acc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_master_acc_fkey FOREIGN KEY (master_acc) REFERENCES accounts("userId") ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.bills DROP CONSTRAINT bills_master_acc_fkey;
       public       postgres    false    2389    218    220            �	           2606    25486    bprocesses_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.bprocesses DROP CONSTRAINT bprocesses_business_id_fkey;
       public       postgres    false    2415    231    222            �	           2606    25491    bprocesses_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_service_id_fkey FOREIGN KEY (service_id) REFERENCES business_services(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bprocesses DROP CONSTRAINT bprocesses_service_id_fkey;
       public       postgres    false    230    222    2413            �	           2606    25496    bpsessions_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpsessions
    ADD CONSTRAINT bpsessions_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpsessions DROP CONSTRAINT bpsessions_process_id_fkey;
       public       postgres    false    2397    223    222            �	           2606    25501    bpspaces_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpspaces
    ADD CONSTRAINT bpspaces_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.bpspaces DROP CONSTRAINT bpspaces_process_id_fkey;
       public       postgres    false    2397    222    224            �	           2606    25511    bpstaterefs_session_state_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_session_state_fkey FOREIGN KEY (session_state) REFERENCES sessionstates(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.bpstaterefs DROP CONSTRAINT bpstaterefs_session_state_fkey;
       public       postgres    false    251    2455    225            �	           2606    25506    bpstaterefs_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpstaterefs DROP CONSTRAINT bpstaterefs_state_id_fkey;
       public       postgres    false    226    225    2405            �	           2606    25521    bpstates_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_front_elem_id_fkey;
       public       postgres    false    241    226    2433            �	           2606    25516    bpstates_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_process_id_fkey;
       public       postgres    false    226    222    2397            �	           2606    25526    bpstates_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_space_elem_id_fkey;
       public       postgres    false    2459    226    253            �	           2606    25531    bpstations_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstations
    ADD CONSTRAINT bpstations_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpstations DROP CONSTRAINT bpstations_session_id_fkey;
       public       postgres    false    228    223    2399            �	           2606    25541    bpswitchers_session_state_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_session_state_fkey FOREIGN KEY (session_state) REFERENCES sessionstates(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.bpswitchers DROP CONSTRAINT bpswitchers_session_state_fkey;
       public       postgres    false    229    2455    251            �	           2606    25536    bpswitchers_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpswitchers DROP CONSTRAINT bpswitchers_state_id_fkey;
       public       postgres    false    229    226    2405            �	           2606    25546 "   business_services_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY business_services
    ADD CONSTRAINT business_services_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);
 ^   ALTER TABLE ONLY public.business_services DROP CONSTRAINT business_services_business_id_fkey;
       public       postgres    false    230    231    2415            +
           2606    37780 	   el_res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT el_res_fk FOREIGN KEY (element_id) REFERENCES elem_topologs(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT el_res_fk;
       public       postgres    false    277    233    2419            *
           2606    37785    el_res_sp_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT el_res_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT el_res_sp_bprocess_fk;
       public       postgres    false    277    2397    222            �	           2606    25551     elem_topologs_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_front_elem_id_fkey;
       public       postgres    false    2433    241    233            �	           2606    25556    elem_topologs_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_process_id_fkey;
       public       postgres    false    2397    233    222            �	           2606    25566     elem_topologs_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_space_elem_id_fkey;
       public       postgres    false    253    233    2459            �	           2606    25561    elem_topologs_space_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_space_id_fkey FOREIGN KEY (space_id) REFERENCES bpspaces(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_space_id_fkey;
       public       postgres    false    233    2401    224            �	           2606    45968    emp_workbench_fk    FK CONSTRAINT     �   ALTER TABLE ONLY employees
    ADD CONSTRAINT emp_workbench_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.employees DROP CONSTRAINT emp_workbench_fk;
       public       postgres    false    2415    234    231            �	           2606    25581 %   employees_businesses_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY employees_businesses
    ADD CONSTRAINT employees_businesses_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.employees_businesses DROP CONSTRAINT employees_businesses_business_id_fkey;
       public       postgres    false    2415    231    235            �	           2606    45956 %   employees_businesses_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY employees_businesses
    ADD CONSTRAINT employees_businesses_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.employees_businesses DROP CONSTRAINT employees_businesses_employee_id_fkey;
       public       postgres    false    234    235    2421            �	           2606    25571    employees_master_acc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_master_acc_fkey FOREIGN KEY (master_acc) REFERENCES accounts("userId") ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_master_acc_fkey;
       public       postgres    false    234    2389    218            �	           2606    25586    groups_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_business_id_fkey;
       public       postgres    false    236    231    2415            �	           2606    25596    input_loggers_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT input_loggers_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.input_loggers DROP CONSTRAINT input_loggers_session_id_fkey;
       public       postgres    false    223    2399    237            5
           2606    46055    launch_shares_biz_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_biz_business_fk FOREIGN KEY (price) REFERENCES businesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.launch_shares DROP CONSTRAINT launch_shares_biz_business_fk;
       public       postgres    false    285    231    2415            4
           2606    46060    launch_shares_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_sp_session_fk FOREIGN KEY (title) REFERENCES bpsessions(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.launch_shares DROP CONSTRAINT launch_shares_sp_session_fk;
       public       postgres    false    223    285    2399            3
           2606    46013    launch_warps_launch_elem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_launch_elem_fk FOREIGN KEY (launch_element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.launch_warps DROP CONSTRAINT launch_warps_launch_elem_fk;
       public       postgres    false    265    2473    283            2
           2606    46018    launch_warps_launch_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_launch_fk FOREIGN KEY (launch_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.launch_warps DROP CONSTRAINT launch_warps_launch_fk;
       public       postgres    false    223    2399    283            �	           2606    26085    lg_b_fk    FK CONSTRAINT     |   ALTER TABLE ONLY bploggers
    ADD CONSTRAINT lg_b_fk FOREIGN KEY (station_id) REFERENCES bpstations(id) ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.bploggers DROP CONSTRAINT lg_b_fk;
       public       postgres    false    228    221    2409            �	           2606    26090    lg_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY bploggers
    ADD CONSTRAINT lg_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.bploggers DROP CONSTRAINT lg_bprocess_fk;
       public       postgres    false    2397    222    221            �	           2606    25601    observers_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.observers DROP CONSTRAINT observers_bprocess_id_fkey;
       public       postgres    false    238    2397    222            �	           2606    25606    observers_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_station_id_fkey FOREIGN KEY (station_id) REFERENCES bpstations(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.observers DROP CONSTRAINT observers_station_id_fkey;
       public       postgres    false    228    238    2409            �	           2606    25611 +   proc_element_reflections_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY proc_element_reflections
    ADD CONSTRAINT proc_element_reflections_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 n   ALTER TABLE ONLY public.proc_element_reflections DROP CONSTRAINT proc_element_reflections_reflection_id_fkey;
       public       postgres    false    240    2449    249            �	           2606    25621    proc_elements_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.proc_elements DROP CONSTRAINT proc_elements_bprocess_id_fkey;
       public       postgres    false    222    2397    241            �	           2606    25616    proc_elements_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.proc_elements DROP CONSTRAINT proc_elements_business_id_fkey;
       public       postgres    false    231    241    2415            �	           2606    25631 !   process_histories_master_acc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_histories
    ADD CONSTRAINT process_histories_master_acc_fkey FOREIGN KEY (master_acc) REFERENCES accounts("userId") ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.process_histories DROP CONSTRAINT process_histories_master_acc_fkey;
       public       postgres    false    2389    218    242            �	           2606    25641 !   process_permissions_bprocess_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_bprocess_fkey FOREIGN KEY (bprocess) REFERENCES bprocesses(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_bprocess_fkey;
       public       postgres    false    222    243    2397            �	           2606    25651 &   process_permissions_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_front_elem_id_fkey;
       public       postgres    false    2433    243    241            �	           2606    25636 !   process_permissions_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_group_id_fkey;
       public       postgres    false    2423    243    236            �	           2606    25646 $   process_permissions_reaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_reaction_id_fkey;
       public       postgres    false    243    247    2445            �	           2606    25656 &   process_permissions_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_space_elem_id_fkey;
       public       postgres    false    243    2459    253            %
           2606    26017    react_topo_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT react_topo_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT react_topo_s_sp_session_fk;
       public       postgres    false    2399    223    271            �	           2606    25671    reaction_refs_element_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_element_id_fkey FOREIGN KEY (element_id) REFERENCES reflected_elem_topologs(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_element_id_fkey;
       public       postgres    false    2447    248    244            �	           2606    25661     reaction_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_reflection_id_fkey;
       public       postgres    false    249    244    2449            �	           2606    25666    reaction_refs_state_ref_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES state_refs(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_state_ref_id_fkey;
       public       postgres    false    2463    244    255            �	           2606    25676 (   reaction_state_out_refs_reaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reaction_refs(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.reaction_state_out_refs DROP CONSTRAINT reaction_state_out_refs_reaction_id_fkey;
       public       postgres    false    2439    245    244            �	           2606    25681 &   reaction_state_out_refs_state_ref_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_state_ref_fkey FOREIGN KEY (state_ref) REFERENCES state_refs(id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.reaction_state_out_refs DROP CONSTRAINT reaction_state_out_refs_state_ref_fkey;
       public       postgres    false    2463    245    255            �	           2606    25691 $   reaction_state_outs_reaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.reaction_state_outs DROP CONSTRAINT reaction_state_outs_reaction_id_fkey;
       public       postgres    false    2445    247    246            �	           2606    25686 !   reaction_state_outs_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.reaction_state_outs DROP CONSTRAINT reaction_state_outs_state_id_fkey;
       public       postgres    false    2405    246    226            �	           2606    25706    reactions_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_bprocess_id_fkey;
       public       postgres    false    247    2397    222            �	           2606    25696    reactions_element_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_element_id_fkey FOREIGN KEY (element_id) REFERENCES elem_topologs(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_element_id_fkey;
       public       postgres    false    247    2419    233            �	           2606    25701    reactions_state_ref_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_state_ref_id_fkey;
       public       postgres    false    226    2405    247            �	           2606    25716 *   reflected_elem_topologs_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_front_elem_id_fkey;
       public       postgres    false    240    248    2431            �	           2606    25726 *   reflected_elem_topologs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_reflection_id_fkey;
       public       postgres    false    2449    248    249            �	           2606    25711 *   reflected_elem_topologs_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_space_elem_id_fkey;
       public       postgres    false    2457    248    252            �	           2606    25721 %   reflected_elem_topologs_space_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_space_id_fkey FOREIGN KEY (space_id) REFERENCES space_refs(id) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_space_id_fkey;
       public       postgres    false    254    248    2461            (
           2606    37763    res_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY resources
    ADD CONSTRAINT res_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.resources DROP CONSTRAINT res_business_fk;
       public       postgres    false    2415    231    275            )
           2606    37790    res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT res_fk FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT res_fk;
       public       postgres    false    277    275    2483            
           2606    25832    s_proc_el_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT s_proc_el_bprocess_fk;
       public       postgres    false    2397    259    222            
           2606    25837    s_proc_el_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT s_proc_el_business_fk;
       public       postgres    false    259    231    2415            
           2606    25842    s_proc_el_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT s_proc_el_session_fk;
       public       postgres    false    259    2399    223            /
           2606    37807    s_res_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT s_res_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT s_res_s_sp_session_fk;
       public       postgres    false    2399    279    223            .
           2606    37812    s_res_sp_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT s_res_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT s_res_sp_bprocess_fk;
       public       postgres    false    222    279    2397            
           2606    25857    s_sp_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT s_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.session_spaces DROP CONSTRAINT s_sp_bprocess_fk;
       public       postgres    false    222    2397    261            
           2606    25878    s_sp_el_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_bprocess_fk;
       public       postgres    false    2397    222    263            
           2606    25883    s_sp_el_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_business_fk;
       public       postgres    false    263    231    2415            
           2606    25888    s_sp_el_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_session_fk;
       public       postgres    false    223    263    2399            
           2606    25893    s_sp_el_session_space_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_session_space_fk FOREIGN KEY (owned_space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_session_space_fk;
       public       postgres    false    261    263    2469            
           2606    25862    s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.session_spaces DROP CONSTRAINT s_sp_session_fk;
       public       postgres    false    2399    261    223            �	           2606    26070    s_st_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT s_st_bprocess_fk;
       public       postgres    false    222    251    2397            �	           2606    26075    s_st_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT s_st_session_fk;
       public       postgres    false    251    223    2399            �	           2606    26080    s_st_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_state_fk FOREIGN KEY (origin_state_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT s_st_state_fk;
       public       postgres    false    251    267    2475            -
           2606    37817    ses_el_res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT ses_el_res_fk FOREIGN KEY (session_element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT ses_el_res_fk;
       public       postgres    false    265    279    2473            
           2606    25953    ses_init_state_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_bprocess_fk;
       public       postgres    false    267    2397    222            
           2606    25958    ses_init_state_procelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_procelem_fk FOREIGN KEY (ses_front_elem_id) REFERENCES session_proc_elements(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_procelem_fk;
       public       postgres    false    259    267    2467            
           2606    25963    ses_init_state_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_session_fk;
       public       postgres    false    2399    223    267            
           2606    25968    ses_init_state_space_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_space_fk FOREIGN KEY (ses_space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_space_fk;
       public       postgres    false    261    2469    267            
           2606    25973    ses_init_state_spaceelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_spaceelem_fk FOREIGN KEY (ses_space_elem_id) REFERENCES session_space_elements(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_spaceelem_fk;
       public       postgres    false    267    263    2471            $
           2606    26022    ses_react_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT ses_react_bprocess_fk;
       public       postgres    false    2397    222    271            #
           2606    26027    ses_react_element_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_element_fk FOREIGN KEY (element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT ses_react_element_fk;
       public       postgres    false    265    2473    271            '
           2606    26045    ses_react_out_reaction_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT ses_react_out_reaction_fk FOREIGN KEY (reaction_id) REFERENCES session_reactions(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.session_reaction_state_outs DROP CONSTRAINT ses_react_out_reaction_fk;
       public       postgres    false    271    273    2479            &
           2606    26050    ses_react_out_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT ses_react_out_state_fk FOREIGN KEY (session_state_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.session_reaction_state_outs DROP CONSTRAINT ses_react_out_state_fk;
       public       postgres    false    273    267    2475            "
           2606    26032    ses_react_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_state_fk FOREIGN KEY (state_ref_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT ses_react_state_fk;
       public       postgres    false    267    271    2475            ,
           2606    37822 
   ses_res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT ses_res_fk FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT ses_res_fk;
       public       postgres    false    279    2483    275            �	           2606    25731 "   session_state_logs_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.session_state_logs DROP CONSTRAINT session_state_logs_session_id_fkey;
       public       postgres    false    223    250    2399            �	           2606    25736     session_state_logs_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_state_id_fkey FOREIGN KEY (state_id) REFERENCES sessionstates(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.session_state_logs DROP CONSTRAINT session_state_logs_state_id_fkey;
       public       postgres    false    251    250    2455             
           2606    25761 ,   space_element_reflections_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_element_reflections
    ADD CONSTRAINT space_element_reflections_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 p   ALTER TABLE ONLY public.space_element_reflections DROP CONSTRAINT space_element_reflections_reflection_id_fkey;
       public       postgres    false    252    249    2449            
           2606    25776    space_elements_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_bprocess_id_fkey;
       public       postgres    false    222    253    2397            
           2606    25766    space_elements_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_business_id_fkey;
       public       postgres    false    2415    253    231            
           2606    25771 "   space_elements_owned_space_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_owned_space_id_fkey FOREIGN KEY (owned_space_id) REFERENCES bpspaces(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_owned_space_id_fkey;
       public       postgres    false    224    253    2401            
           2606    25781    space_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_refs
    ADD CONSTRAINT space_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.space_refs DROP CONSTRAINT space_refs_reflection_id_fkey;
       public       postgres    false    2449    254    249            
           2606    25786 !   state_refs_ref_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_front_elem_id_fkey FOREIGN KEY (ref_front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_front_elem_id_fkey;
       public       postgres    false    2431    255    240            
           2606    25791 "   state_refs_ref_front_elem_id_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_front_elem_id_fkey1 FOREIGN KEY (ref_front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_front_elem_id_fkey1;
       public       postgres    false    240    255    2431            
           2606    25796 !   state_refs_ref_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_space_elem_id_fkey FOREIGN KEY (ref_space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_space_elem_id_fkey;
       public       postgres    false    2457    255    252            	
           2606    25806 "   state_refs_ref_space_elem_id_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_space_elem_id_fkey1 FOREIGN KEY (ref_space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_space_elem_id_fkey1;
       public       postgres    false    2457    255    252            
           2606    25801    state_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_reflection_id_fkey;
       public       postgres    false    249    255    2449            !
           2606    25991    sw_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT sw_s_sp_session_fk;
       public       postgres    false    223    269    2399             
           2606    25996    sw_session_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_session_state_fk FOREIGN KEY (session_state_id) REFERENCES sessionstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT sw_session_state_fk;
       public       postgres    false    2455    251    269            
           2606    26001 
   sw_statefk    FK CONSTRAINT     �   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_statefk FOREIGN KEY (session_state_ref_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT sw_statefk;
       public       postgres    false    2475    269    267            

           2606    25811     switcher_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.switcher_refs DROP CONSTRAINT switcher_refs_reflection_id_fkey;
       public       postgres    false    249    256    2449            
           2606    25816    switcher_refs_state_ref_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES state_refs(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.switcher_refs DROP CONSTRAINT switcher_refs_state_ref_id_fkey;
       public       postgres    false    255    2463    256            
           2606    25909    topo_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_bprocess_fk;
       public       postgres    false    222    2397    265            
           2606    25914    topo_bpspace_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_bpspace_fk FOREIGN KEY (space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_bpspace_fk;
       public       postgres    false    261    2469    265            
           2606    25919    topo_procelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_procelem_fk FOREIGN KEY (front_elem_id) REFERENCES session_proc_elements(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_procelem_fk;
       public       postgres    false    2467    265    259            
           2606    25924    topo_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_s_sp_session_fk;
       public       postgres    false    2399    265    223            
           2606    25929    topo_spaceelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_spaceelem_fk FOREIGN KEY (space_elem_id) REFERENCES session_space_elements(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_spaceelem_fk;
       public       postgres    false    265    2471    263            �
   ]   x�3�,I-.��Kw����/�,�L,(�K����4204�5��52W0��25�26�3�0�60�'e�e
6Ӑ��V�FzF�&XLD�24����� M(�      �
     x�uS[r� ��S����!���	R��el˖D���uN���Fq =>�陞�$�k�Z��ҥ͏��Κ��6�n+���NҒ}�h(�����q��>�ݓ���$:%�Gp
$�"��>��r[$�M�P;��A�ĕ���sY/���Ynf��b�z��^�x���r�+Z~�u?>!���$��`5."�*,�f����pL�?���J�5Sf^M5�3.ߔU�kx	O3��7�&M�6a��f�cŐ�$gF�Ƃ��I�Ј��
��w�&]�<��cYmg%Dj����c6R8�|V�SK��/eoO��N��/0D5���;H���o��И^ʏ��c��n���}%���ƌX�	C��x����c+sUM�M	�UEEA�k��:�Op]qS�w����)�ib���Z�4?�����0͗ )�v�9ů�76����a��$��/�H����0<�0|eȪ��`d�E�0���}{��M\t�+ǭC���P�6��М�z����|($Q����(�:      �
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
m�V�v�K�HK!)w$�]ܕnV�o���%t�@�y��~׮Zʇኬ�Dڤ�s��_q�'�g5���O�6j߆ي�5;c�jD��F\���0g�7��N[�=;�ٙs�ȡ��8�%���Y'�?W.��\�<8���� �=�f�����fcw3G�U,ڌc����I`ƨtV摾E���Ʈ+dhi�s��d.� �T�y5&-��2��n���Ǹ-�����z�4$d=-��2���D9������~�Z�_��u�iH]@���:-sO�]�-�M�O�����󏼣�����u (Hz��&��^��#=� �ѱA���(ؙ;L~�9�?�'����)��U�~ n¡B��`&�K���^�"�M��%�n��ϹlgH8#���{	eG�Y1`��sׯ$G��U�bu��,γ�jױdg�%23}4I�T��B�H�(��C�Z8��ݑ�5�)h$0TJǖ����.[�@�`V�Z�OeF_��ZyqrR�J��k����� '�讳���\3�y]���y��T�Vvd�]�p��45k��I[�Tu�����%<���|�f�'ܬ�#q3ƻv$MdPpMA���D��+�\ ����Z>\�(޿}�j��s�}�~��آ�Wwo_}z����5��<LJ\�Ts\�/��i��7���o�������T��#1���|��L��ʉ]eEP�A�+{���y$�,W!�z�cs���B9��L�m�E����֢��,u��sV�>91�p��3��Ԙ:n�E��h�}Bv�����~R����6w�f��"k8*�ї�k��x���(җs"�����C�+�~��^��!x!�B^���0�f�|����c�RUW��;�i���Z�S뷣�6��&�����ݑ�|3Oe�c����횉� 7�VGb��"��4��K�\��I%�^ީ�pN-ב�jE_P��@_J���$9<�I	猾�&fѷ3g�]�y���7S�g�J6�]7�}9��������&�I_L�Lh2�c�v�D��݅Gzg"'���ϑ;JLZ��d��� �]�'��+�Z�#xh��n�Lz��+��)LNk�ִ�3����w�n�DV0��~�/���g��9�o���-�ww�dV�=˶{��{����U�e��m��I7������������g�a[�6            x������ � �      �
   ,  x���͎�0 ���)r�by��D� �vO=T�p�QpD������d���4�{� &�����km�T��T~0�3)\���P�A�F�q��$�}�<�U�LAgm����T��`k�f�gR�D�H`)x�y�ԓ�,YSl��8����4GS�B��T��D��S`�3A��2J<��^\im��d�5�2)	�b�� cS�U�_�x�阱H3�	�*j�kU؎��}��2ԑ2�N~؃���4��>�"������k�
S<2
����vs��$�RBo�=���y�r�TA
�����a�_�)g2���|�3<��N���XйV��u3�uj��$�

�ຫ&���ܳ�2�U  �B�yӸ�I�tFP�]����kYI��P���W�\�XQ! �L�?����*�%0����:���$�
0�۸�"����|�E��0]aJ�Oߤ��|�E�A����4O��<50���7aU�Γㇵ	��ε�a 1����[����P�n!���#��O3�D|�D�x�$&B�����޹��my��o�Z���C��      �
   �	  x��YY��J~��
�� � 11*ڨྠƍ�(�������}��c���q)�/++ɬ*��0�a�8�HӸ|�%�"t�c:�����U��]���s����Ye5G�Q�OM��0�����G�~�����Aw��.�E!�I�����ia֡�7��d��JBޥk30���#}��x�y�W��ƀ�@�������WC\:�&$�Z��Ru7[k�� l����h�{m�������X�����X0�
`۷�I	���\�R��+�w��ɳV���p���Б����;fg
�(=�-u����M�HR�G�v����D���!6�Hڰ ~��K(��;W\	~%�+�(����سKk08A�}@�p5�=K0��-;���*�
��y��r\:�gQ��b��"��F��k��N��a<%����[����a�|�m'N'��@���Kbg��O������^�B�:��[�S�e�+�q�܂�HV'
uO�L�;E�%>s�KL��@w�ٍ����<�����C_�h:0@�\^Y�h�F5IN���	~W��ȫ�Y�M����n&>4"�9a�sD�Y�%3p
f��v8O6������@g���P$h{����-$	�(�@��¨���N1k?���Ck6�N0�ngbǅa4��nѝ,�#{K�X�Y&���@��CD��r�k���<��jp�Y�!�d�mΎh�Yk;Uz���	|#�ue@g�w]1��s��bpr
���9<8 �x'�G������=6R�~ M,��[�J�>��%��AL�hy%��ܩ�ځ��S�S���̌�.�IMq9�@��܌��ʏ��f`K�!��ϜvR[��?r��>��zPC��5���W�@�� �8.�ٱ������~��{Ǔ,��y_�����t�nq\����A B��MN��s2-lpq�c�}Ex�>k���nBt�;{��T��<�|�Q��x��e�n��Ee8FGӉ�������$ꟿ�y���g`f�yH��a{�*����jL]7%��͋����fP������7"�C�����Ȅ�����V(;->F�b
�ax�>7~��?:bA̠u�x-��
�Z|��~U|5dլҭ����b��.�q��ψ�ʿ���y��;�A\�~��c�Ʒ:ժ�����8D 	�j7ؠM�dX�	��6[MN��q4��eL���K��-E�m��M*6��m�uV�5]wdm.�b�鋑H3���'�-�?�O�t����KNU�]�0�v����"�.�NBܰ�gJ%0N�/'3&�-�~��ꂞHyw���1C�o����^+��������2Ym�aKts��OS��-�[

�:z�~b�Ə�_��]6�Cm#曦;�/W]�h;�if��vAF��:FU6)��b�i^��q��X��36����y5.sO�o`��D2;q�O)G]g��L^�~�̔%�t�h1�v�c�/�-�Al����3���7w8פ��l�:߂lu�a ���2�^eԠ���.�ç��������,]�5y�=�)��wlݝژ4#�[Z�����X=�9u��'y�I���+���>�F�}Ryu�8�6��WL������~�*������p��=�RM�t>����B��}��;�QM.�gX=ͮ���گ:/��h�]j�)-M��VFMˮ�%���x����"�E:UQ���~�|�n_;�|Ҹ-������|�]�h.��+}f ��`�ϓMDH����}�<TN9�v�AΣ4Z"��������#)�.���ѣ�n�WP�7ӽ3�"7�*��g�E��ˍ�U�E��U���b%L`�ب�F�؆na?Uo����W��bƱ%Q^e���J����~C~���ߢ~���Uٹ<�ЯO5�w��Cp���$β>U0��l�YKݭ���"Ҵ�OD�h��d���Q��X���A���
�MRh���sP1�Աke����ɟ�{rN����XY�ZU[�c�Kŕ���A�o�����a
�$cR��"hUR	8��@�~'�t�L���Zm$�1;{�\4��v�f�-�$NOPVyL���&�g�p9_���g`3�A-�� *Qv�7���^�MNФ�FaC��;P��ћ�G�cC�J'�<ݏ�<{þ�,�+�I"[�S�(A�#���}i�]�@	4ej�3$I�y�1��ӺnB��3��+9<�l���Yg��{4e���� w���H+��ٵ�n�쨪Ow�Դσt����^�/Գ���>P|u �����<�SW�qH��D%逰�ocRY�r�ۀy�z�I�?�C!�]�����YGűIM����Z�dZP�4������Q@#�ϓ��;�&N�(��A8�ic*´k��&>C��Yc�qZB�z4Vi���|���l\&U�K�!fg���������>HpzM��,���A���TҴ�+���S3F�t���ڔ�Q�y�|�O�Ǐ��:      �
      x������ � �      �
      x������ � �      �
     x���[n,)��;���Q#|��"f�yV0��`((:9�ڣDQ�����>��~�������/̠�/�'�!t�% �+�|�$u(L���Iv�"$:INJ'�!��vR�INJ#�=��y��������聒Dl�����2&:Q�<P�P��"ć���,T¨d�b]�Tץ~@���J��֭~B��U�O��&����������z���<�hGgL�ࣴ��Z�AȯLO��9��"�I���?�$��"9t��K�.k��v=�[�r=�D;Y��vO^W"�����vO���@������۝ȁ��� �Ph� j�t�͝�-@w��K� i�~dۙ���O�����a�u&G�zdN�u�=�Qݬ�%KY�j�L�T��?���Hsp$0
�<S5h��%�ж��ȴ�@�Z'����2lz�#y$j�(�1?��]�z��������0�`�O'��S�~:9���b�
��)c9(�GHZa\��9�޵�x�Ze�#ez��r�a�0 '�� Y�wC5@֞m��h�|@�_���E��IVZ��`lI���-�؞��Gf��IVZ�����gl��P7���Ȋ�]C\������ȝ�(��A��k*�SU�:p���%��F��A����u�ׁ�6���A#�A�c\�f���ZO`��$�L�0�t0�#Avt������)Z��M|�[T�u`��9��Inݴ�E�N�M���H�>|�>�����)�vb��ֶ4-����G��u��Q���ak�0�v�ϴ�yޒZ樌�����X��u��*.?�����yGV��~h��xN��^�$�B[>��� �#ǤB[�nI��O��$���>�f�E�4����s�C���')s�C����3��G��k�C�A��H�e-��7�2V>��<�tՒީ�/x2?��(-��BT�T�'��9$T6kd��VB;�>����J�'iKB|+���J%��%�[��gO�|�Jv�}c���R�6��$u]
K�Rv��9$d�����pG�[��{>i3}M�簋c8�ߢ�������~���������9'^�"*DI�%���m��~*��ly��UƎ&v����Md)n,nGjt)>���݉o`�L�ڊ�v-����u'��r�ؓ\�}lh"�N��$c������y��Fʜ�D_�53DH�Dy�����@��i�����-g����h^Q��:܏�~� q�U��'� ��{<2���P(,�����*I�йK�6#E?�rK������� r�#      �
   �   x�u��n�0E�������9F�.E�vˢ�D#$�I.��/�v�a�Z�s�4S�ɧ0~�jX�^�O��g�L�7ʅ[��:	�$���%�%`%�$ 	ZI�J�V�����=^ƇC(7��5�P����2�j�4\�\��kj�)��9|�Y��1��XB��k��Ҕ�@9õ�[X
��ow	�8U�<�7��j��xU�?o��������2bq��qdK��XU�/�z�.      �
     x�}�An1EמSx_��,]���j�$�=N%�O|��*'F��ɜ��vW�������l҉���Y_��(�{�%��V���Sߣ�y՛�:34�U_P��5=sqV�]uү(�����]�S�F/�(����A���_��c��f��/�xү(�[���� �خ�O�kt���ىt�f�H(c���oHD�I�1��*O�Et��y�����O���2ة�ɔ}���J�f|���
V�Oߢ�eљ����{!������毜      �
   �   x���M
B1����EI�韇�o�	�?���b�yB(��H)$W\�:�����rN,+�A�/jp�w*_������C(<T <A��`����(!�5��:|"+�Lf�XCpk[ 6�2��3h3�肪�'!�(Zb��ʉr�v�c/2����I�����Qd�5��j� ۋ��k����!�Ee{�rL)� b��Z      �
      x������ � �      �
   �  x����n�6������bI�N~�>�����f�l���5q<#S���` &���%Ҥf@J�o����_~�}�~��~���*�*�E�I�݈��"r!��-��� �u^�@E���z}�c�����.�UC @^Hď?g9�ˣAvP��8?j��QK(E��*5���θ&ҟ����[(EɈ*7���ָm[g����2�u(EaD��Ra\3��5g�VUX�R���r�Z .@j�kQM����Q8��ZB	J��*5.�<�!2@�k�D�q��C�B)
"�ܸH�q- =�l0�*�P�P�2Un\�H�q- 7P�Sk��ZB)�GT�qa����:�@��:��@r l0`�^�R���r㲐�m @j���V��P� ��iϔ�%��tD��1Rk\��?�jBe<���|�P�rUn\�H�qY�v�X�	�0�J0YBۇ�ʈ*5nY�
��θ6Մ�h�e��%��0�ʍk�� �5�D5����r�JQ6�ʍk�� �5���o�q\˸��Uj\DH�qM E�.;r�*�E�I�I�ܪ�n�>Y��]��u��w[����e;0.�I��ŔM���E�$�|����4�q��7]�����AƔ����M�H�y_�J�u*({�t�ńaѻ>i#��s���7���?3��u��<ˌ�O�m���*a�h�L݊�i�!���߉~�<T��RN3V.!�PU�U�yyɉ!U��+F���}8�q��ކ'����P&sh�1{���}� +ϝz�c��,�!/9WxB��XC<>{xfO�Ќê�g�ty�<�K��U�T� �U�3{T�,Ī�g�Ty�<�K%�*�*1��gv��T�ʝ��3�T�y	��g�����g�\?��~����1�;�c�@!�ax����Go�Ym�l�����ܤi�1��W�6C|�t���܃�3T��wM����	 y�a��, ��c�V�ٓ`y�'tM .��	��*O� E^�)]��U~\3 �V�]��
���z��ʮ�P�z�y�{��k"���\�`�գ�X=� [f�G���x�Ё������P�(��U�K�"C2j�B�������i����䀴���䀜����Ǘ�S�b���ǭ��g~-3O�L����)�tJ�>��"ܼ+*.\o�Oa��L��,�ݝ#j7�q�``��l����c3 ��� �y��EXǃ��@;2��:��Ą�9z0�r;�Avm��7��N;6̊�7̯o���܆��7��0;� {6�	�h����B�
���o5l�2u�����]�;[iO]���|��^�+�O�U����n�����x�U��<���{
�׮���OQ����K���Wa�sT�I�Q��}�B��( BYO;qkOQ`��x�L<Ջ��X��E�0����t�(,����T����K��U27�]*�ȫ�=*�\�|௯�Qo�	M5J̛xJS��O{s�'�(�i�av��2>==���[�      �
      x���ͮ�8��9�~��7�����6��y�FW�����~���%�$'��y�D�0��͌Z4#M�Wu�\��������36�n�����̗�_6>BN��1���������_����?����������{� �7ȿ��ǿ���?�������gF�.Z�h���5�@�ذ�#i���2c��. UeX 4k(� �2�A�S��S�AL`l��=�����A����B����E�~E����y����((�m�(�SW�a놛xjàu�l[qhEtVcLz��0��aJPن�")� &1���vYeJXW(� �2��W�7*�P�yK�1��R���(��Z�#c�$�m�)۠�+�m�R5����1R,a�8�ah���bc�D�mh���bQBPT�$�D�D	�DF�`�J�`%Jz-EF���D�(A/�HiHa$	��ID�)E�1�"�(��փ�̆�k?�ZL��~��/_���8�2��IIV�FY{j���JaÍ=�cЋ(E¶ ����|ʔmH����)Ue�W�P�A�%lCn�Nc�y�2�v��X)QeJ��(� &3����lCٖ+e��؆��X�m(M��l���)Ac��#c�$²��d�e�
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
t�}+h���+�X�}eL�7\ ir���7��1_c�ų���~�`��Wcڽ��dfؙ�^�/��|g�+ g  &����v/�	P�_VZ����'�PҐ�}��톀��q.���;�����8�x���4,AX�����P@�	��;Ca+H���h���$��*HO��G6B	*#=����362�������Hxl0�.�R6&��
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
�bD�bn�E�����3�m$����s�;3�,s��?F�E�J*fDv��� Y!�v�q��O$�Mߥq"��]�@� ����| �"�@� ��:���v��9�khN2��|D�Eb�_�� �;�X�wg�џD�F��"͙d�g��I`#̓�&$�Ls&���jx�jx"�5g�~۔�kxP�#��s"�I�5H �� �GT�fH��F=���M�����3Fq�y%��&ql^H9������YK"6^�>�\��q+n�����+�x:��`s"�-������S5^�~��d�[is� sND�IV�>�\���KJ��/�/qs�1J�m�q�r�}7N��A�����Ƹ8,��"~�D�2k�V��2�{!��,��}cM�Ū�HԞ"?��Fc�����#�%�fP�\���*k�n�.�ξWb#�s�U�~�$\��̊DR��y���]?����̩�R���2WW�bӓTȲ�El�xeK���? r��)��>H�����GO�����h�.Pdz�����ǒF����ߊ��b�>������f_���3>wNm����������I�tmߙX�Ve�����-r�XJ�d@-<E�������;(^�'c.�V��=r�
?8�\��@�}��x�le��cI�X�I��S�}.�h�ik_׼)S#Y�ke<H�G{Xč}i��9A�)��>�M��Q�V��Q���J����A�_��)�Hl�x�Z�g��[��!�a��Dn���9)�(��W89�7yN5�+G�^�5[�u"�ޝI�l�(%�.�x�W#��Ϊ�^x^/�)/i�y�Ëd�h4�|��O����n-�)��yW��m��5�E���A�5H�DNPz�|��ʦ}2.�o��v�Vƃ*iOl�>�4��@��m���HV�Ǹ���ȅx�BcX�waNN\��y' ��jL��a��4J3�� ���7�j����[����f+�A���'
��"�b���l�xP����z}�F)!e,(�����$��I�I�����})9!2w�k��2H	�\��>I���9zDZ��G"-bv���t��#�U�H�ODs�D�gb4wJ$�}G�F�oێ��/�'�ŹVƃ��xbZč}<a�%S"	Py����UӾr�~x}MK���N��M�i`E��RF$����EӾ:6�߿q�F5��xP&���� ��/��I��O$A��O�hF$R�H��'�~�x4�)�(���w����cj��      �
   �  x����N�@���S�ƀr�}��,�]��R�!����I{�t�~�?�S��d2�A��k�M����=�#ԑ�Ba��+)?���`��C4�KE�"��iA�h�h	�CpX���"Ah�J0I-�5�֒g��dя�f�t�E䀮u,֑Z�f&�T
�Xx���2��o,.#� E�4*^����"�2z�
�,�� rlŐ"`�د���2��>��}z]ږ�$K��3Fc9u#5*W��rQ. up�Hq�����ܕX�Ha���t���/�m_�6 ��0��}�G�Hm�� �g�ի�����@쫫~��N�C�x�a�V!X�LR�8º��D�����ZJ>�b)��.ꌸe:��Ӑ:�7�N���c޹a���(�      �
     x���Mn�0���)f?h@R�~z�9A7E&�n\c��$9L<�����)r�8�A�Xo����}������vBl/�/�0�
�j9�֟D�[�G���.]�c����u}�\b9��/u��%?�M�n�K����G��R~�:���jW��������w�[�v.u]��߽��}�-)$��O5?w���	d~qVlP������ɪ<Y3�Xe�f��Fg�:k����*��k+CkK��2��l����2���룱Xc3Ol�&�<��؜��(
r6���Q�lۣ�V��1B��S�T_E�zsV�yP��Bσ�'��΃R\�`l(5���@���U�ք
um���E4B�_�Zc��U��m8���)��M��o)��h��d���Z��xw´i�M���h[쪏�I��w�̄�;�ifB�w4,��ٌ��t:�
��,h���������/C32
��B��YA�����W�LV��"�%�u�,�:�0�w��{ ���u��:������t:���      �
   V  x�}R�j�0=�_�/��՛�Rz,��K�du�fW3Kw�_ߨ��e��#��ex�:)���(�,�33XP�]�Ѝz�vÓe:y�N���M(-dpu�.�էA�>nh��<:k��Tڐ�~
�+#�w��b�oh'������� m<#Ŝ�RK�"{ad��]-����S�^&�'���
�T������>�c$��T�Լ�����9(����>�r�
2��M�yu�n��J��(��"
i�j׵g�3����b_��N=��޴u������`��!�V���^P+���x��B�@�
�β���;��/��~�l�Y�h�E4���8��?д��      �
   '  x���QK�0��oE�ŭ�֭�m�@E>{�ffÚ&�� ���8t�t�H��pN��w{0��|��u���Oc�8Γ�$���G�[Z��ʪ*55�1�}�5G��OMr��:Z�>g��&�l2�����.����R�Vb�ÖVaX�a� 9r3�-V��
4Y�.+�f��A�5�� ��<4����`�C�y��<��u�wr��e]�E�(�"^51?�����m����ي�y��z��-Oy�G{�\�hm�G��rkYV1�{�H������fEkDZ{y��V�I�e_��f(      �
      x������ � �      �
   4  x�}�[�#!�o�����k����:Ƙ�N��)�.���"��o�_�<$q�Q�GK�Ѳ��5��k������o������|2���2��r�� ~�&��c��A#�y�03lQ�\�3��L��	���v�t��Z�F��9Z�=q��RE�/5��Of�ܑ���)!CV�E��r���6ض ��y��)�遃6�d���"w�;��Sl�����[�N��l�0ڲ�2�h2�����ӞT/�������	#wz�6I�p�P�3�wfO�b���J���m�pn�7�ܡ�ܛ�?A.�1{���o�F��rj�������G�H�vcH��[��Hkƾ1G⊦:Ϫo
�e��Vz�-�VD�3�ۙ#���x����:�8r�}��փ���ܹ�=��]�U�ʑn�g!:�-r�#��0�:�-r��3�������+r�W9�c�K��l���_N���9�Rc+�y��.?�2hN�f>$�tW
D�u�md���G�QX�����C�����*�y�>E��rds�/��*P��s}���ʏ��J/�            x������ � �      �
   �  x�}�ݎ� ��gޥȀ�h`�ݫ^�T�$Nl�D�������ɒ_�s�5 3pfpi����l_�I_.���S��D�2�Z�']��:��n�@(P�v����� �!�5��!X[��VG�:���t�K�&}���������>$������Ost��t{i����c�����J� �M�s��^��ͮ����W�˜��]��0�������j��u�ϸO���l̖�T�<������3��ߖF�>��� G��z�U�8;��ֶ�J��$
9W���(7�[O�������g\Oɘ�H`�����Z��E1��(R��ee�"����y�)����U�cV>�Ȗ�ȡ�C�+��7k�- s���h_��a�����`g��|�������yJF�����U��<Ҫ�J;,��)�JG��{�g����L��w��Qkg{K���Aw�M��vfsP��h�e��4��V�ɒ�;CĿ�K�
      �
   f   x���! ���UL�p���:B�����5���փ�W/�����o���$S^d���%Wnr�!Gt(�VB��V�t*�.塯��V=�`����~���      �
   q  x�}�;n1E��U�����a�=�tc q�4ٽ5vᙑ��Gy%�=������׏��
|��i��	\�<��A(/$%R	(;�UrA ����קח?�u�.-<�6N�'�Q��Q?���� kK	SF)�!����b,�W��	���Fɑ l����:�LPi�ػ�v�ΈP	��$DR�e2�B#L��Uj�~s�������l6���@�k��LpK�XNH	���+luX��*�9����\1���۶����{&�S>lz��t�m/�O��۞����2A�tLn�P��:ݹ����1�mS�K������cv��'�_l�$��M�Q#�ݤ���N����BSbB�LD�83z      �
   �  x����n�@D��W�h��l'H.��$
��|0��{�%K�)�"�c�MO�TQl>��s�wO��_�����kzxyvϯo���߁�>�o�mEF��J������n��2�}��|�=<޽��xy���v1mIGΝ[�\� �4H!��"(c�o���µ��ن�AS�	T�jwMT���4r>(�{���%-���]Z'M.r�A�R���8�]����q»��	f�'9)ۄ��x�q0��5�$�V&\��+p1��8/�����T�[��9'�ۅuO�͵a�:YѠ]^����Y�n����%8�W8����v�yM�|��v��&��L�-y��P�`k�	F`*�e�T1�g�HvjN��,\v���ʻMw��e�T��Iyي��;I��r��T�/��T>����l���;S�S	A*ї۬aJ� l��No+΂�e��8��9���6�V��eE$�Q*�}d�#C9������W�q�`�����f0�Κ���
��ǲ"�(<U�㤫!�6�`&�6.fu��hn��
K+���E�e����]�tqU�P���pK;9 ���h�.�Ԏ�F��������@j�$m)��I��r�Vw�$	w��.#�HP�ވr�:'Y|�u�X�!z��#̪�����ڄʛ�i����s�         8   x��A   �3Ѥ(���D�B��x�ܪ���$݂\j�Z�|��8�4D� A^            x������ � �      �
      x������ � �      �
   �   x�m�;�0D��)� (�ͧH����f�G �Z;EnO�t#�ћ�q-jeIh���qOT"u4D��MK�|"#	3%�Ô3y]��"t�1���IVȿE5́F:4(��Ŧ	\1� �l������wJs4��F]�����r�}E=n      �
     x��RAn�0</��{d m��G=��%R��V162&m_���4��ƞ�wf�x���-NPXS�k`�D�]$�@88�(�bC��rN@^����� ��V�(2H�-�(s��Y��j�Krf���l������fM��lOl�l{�a�܉�ʇ�kj:�U���XY�������q;�~��m�>�SX��G�4�����{>�M����c��N�$[�t)ט���4��"}b���d~S��fr55��\���Րa��^���Ӽ����qE�'`��      �
   W  x��WQo�0~v~�7M��6�VU{��V���L�&��Ě��8��_�3N�k��P�s_��|g߹q��.�AF�P�k�e-�O?��;��o1��ˣ���R��H�r|�Nڣ	bp�s�EQ�8*9�h��h-�$	�%>�����ـ_�������O�|6�i~5�Y>�!�gр�?�KC�φ�Ґ�3��W:cA�~��!�4$�l�/�/˂��� �I?�ͷ�J��'��X Q�|��g��8� �[-)�?E�&��芛�wz��I�e�q~0����+#��N�GYti1�n->�=���`�q�1��`]:�����Q��ҩ)@c��f��d��.D�:Y� �͘�ƃ�u��F�.7�E	������w'�lB��#�\��n�����FW^��r
�A �˝���i��v��]�%,.��Օ0-��3nX�D$�E����bw��er�O�}�J]�ƥ6O�l��}s�L}F��VD���t�b��7��[���S[<��š9��E7f�:%Z��;���6�js��(>��d5W	Ek�!�������e���.�(&(��XI����h���۝�$����E�B>m�t�|B��"�kį\�h���:��J+%
פּ�����G0K	K<?Xh��{�P����~X��2�>P>�s��$F?���3�{�����s�OsN((�;���ڽ=��d^�D����c�(�>e�?�fV�:�е��++����H��ŵ���,k̛Fɂ�*Ř��9�����l	}b'-~�v���	_�K@
���!�z͋�?ؼ1��]��d%�ۢ�[�1[��*�N�=`��܂t�\,=QQ      �
   >	  x���K�������=�Fw��'#{Z`�\�YC��I���O��.���&��gÆx����W�ڽ}9��v:��8|�^��z��O����>��ǝ��^_o�۷z��w۟������u��@*� �4{�*i*�E��oR~���~�C��V!�B9G<�d�?]���#��K]?~>ǅ�!�W�党wXh�y�j���������r���_�A�$Si��Z"�9�K��v��(�L[����g���z�?�O�����������mW�>ux�W�Һ2Vc	f��w�v_�^J"M�� ��۶� ��*�8Jn)�]!�8�mL$��� bH����XN�B�dj*+���5(]Ɉ������E�JE��d��n���9W�4�}j� {�E[6B�Y(7ɾ73���͚8�Y)����ŕ~?C����za%�H(���BE%:���p������J�W��vrOyz/c�R��J<U�۝�:x������^E�]�ow�8�|�z�,�jV��.fű ���&�t�y�5$�"C�h�6<�/
�̢q�o�	�G���"e٘�t�&+������lP�s���BֲA$��e��'�&�)�f=���|uYD�����wgk!�ۼ;�ÎEۿ�mS����Z	%�r���R��G���X)�6��^�J's�Fl�����r].e[� ��ِ�u$L�-%����r����Ӎ���B�V�"� ���Cc��a�:��z�{�ާ����`��\�.�>���;B��^�AL�2�:v�dK���5h�kйܧ�YӰ�k��ܧ1�o������]��`������ӕ*e+P0��ri��G��r���2��N�a��av���3ѿ�|;����ñ��C?^o�w�f��$�*`tY���T:���We�~AYvx6�fe�R+�UI�+C[�W��O�Ѕ�o���ز��8,B4^YCe���rvnˡ�����\9ZpZ���܊�k���|���8��*�����2�b���ΕUQ�)� /�,�2Ni\�~X��,Rq��ʚ�"��}�g�@� ����i�ܷL�L,i��W�٢��J?�y���A�~y�bX=���x>H�0�킰��Yʈ0G���8�g$���!	�OK$�;������
Y�<�D䎉_9��3k��ȼ�*��Q���~y��i��}�s�~wn6��ł��3���s���6�ߞ��ާ4���9G�mcw�g�}��c����RB�o�O�_��t��:��.�6������֥��7�ن^�4���X�G<���[aC�H��T�Da�f{{�jB�S���o���CW���kIVQ/NsVT33�sb�v��%9�r&�m7�>�l%�5l0�E����Æ� "�4)���m(nx�H���V;qyϏk��~���V�ܙ]��ڃ2�i�*�L�1}�Z��/����<v�ڂ�����t�N1vVEc�������v9&��{1+��Ȇ���{zI�ԇ�7��㧻Cc)I�u���P��� mE|[~	���0 a�n��23qy13p@7��Ҁp��ժq�s���**~ؒ�e�G9r�5��]�>*�g٠�,Ό{>�ܐ�_���#F���e)���Y���Ң�2d*�L���K�R��)?��գ��фƯ����ֿ�U�Z���q[3�!(�u��-��z�ާ֦������-�׽���g�}�n]���т!���q}��Χ?�����}���msg��Y��w�}wN�U~�`����u۠sj ��\c������!�����ojK��J����x2\�+�E\��nF?��sh>Z��}���pJ��Mz�mogV9��P.5c[c\3u �J�Ƥvi��S�VI�([�����LL�0�`_�`�@����ӃmM�>���Ơa[��Ӽ�f���`��i�s(r�lxP.�g�ŧ�4�[�v6jA2�wX�:�qh�$��i�$��� y����zD�]�/�
�a��-oϴ�ޯ���E�`�)=<&hrL��g4�TO���������wv��K�nf�eW�����㦬�@t0��ΦW��_}s�?��ˆtFN�Y�/b;-�1�"VH�s�f��r��M������џM�4��{@��ͧ&{l6:-�UD�#l�����5`M	��Ӗ�0�2�U�<*Ѝ�7ʹ���~�e���\4�9�r��n�̊��B׎W����Rc
eȫ�&k��t8�v8�^gz3��l�,ۙH���;5��^�2�2&HF-K��wݒ1u(Gehh�]͢:{eP��-�.��s(P����E3������"���h�2�"�j(���eӘ}��_Ň���@(      �
   �   x���Q
�0���0��j�����\\keꆷ�t�:�A��I	�'Q9����EC�x�	�r�ﺓy0�7L}������Z&�_:��L�L��}�~���4�*&�P�1��|�P��o�Q�:��[���F
�]����Z���G���e(eL�@�	c�	��v�      �
   @   x�3�42�L�42���4204�50�52W04�22�2��3��60�#㜟��Y��������� {��      �
   6   x�3�4�42�,�440�4204�50�52W04�22�2�г4���/������ �U      �
   �   x����1Ckz������7K�L��f�4�e<H|�/ą��aއ�����k��������� jN��5�}|r��	��*'�AN��B&9r��T&ߵ��+�w1�2rT����T����]��꧜O��^�9Q������L�!EQ��E�M���)���U_�޿*����1���
*      �
   �   x���1�0��9E�
d;6IX���T�R�?P�v�s�'���ZhZ�UZ��,>�Zn³�lu,������������W�J��� ���̡e�&�B�����&��5�V��)B3�ZF��$4D�L�\{ˈL-S�S;FhdR��R͗��H�BC�͹k�H�%4D
�5�}[Ɣ���J�      �
   N   x�3�4�?N#.#�����3�(2D3�4�4CSg�	E32�42�42F�h���	����9H9�h� _�>      �
   @  x���AO�0������T������]�ĥ�R��]F�=.m��4�z������Ҽ ��l-c�J9Ho۶t�1���{N�Gv�VEF���KT�ܜ96���D:���R���0����]��0�q��a�L����@��JXԊ� I�pl3l{�R�6�Эm�`�@� -��Kx��6�ܜ�*H���rD�����V�h�("Ǵ^k$r�mG�^�%?(�<�~mN���1���_�I�d��[�@�	��y��a��Ǽ:IZ!z3P!j�������+r=�m�x���wA�3��0F�O>��bSE�	�r�      
       x�34��.�)�MJ���4��"�=... b�j          �  x���A��0еr�짢$��!�}�srƒ�S��"���k� �1�(|�@��}=A6�[�XY� �/��z �PS���xX��yRڨl1���.���d�Aɡ�Q�+9V�R�|�.�n�ȳ�ձ��nQ��^,JO���	��r��Jo+۹�R�S�U^�@�b/95V}�<�.�7�د	�S�N}bn��ɺP/�5	���V��D����%����zH�d����:�9���0.U)w���]J�U*]ʋU��D�x�J�;e�J�%Y�A��j/��ꭧ;��K<�Ϊ�a尴�lkZ����Ւ�g��}��xTˍ������j��@��9�p28ۿ�(�3t���]BO*ZYŹ�KԤ�%�$nEMV
ȟ�G�$�Rr$�O���#]�&�.�I*��-�u�>�&�!#�5f).4"��;�4����cR��+Q��K�ł`ú��("�3�Q��tqu���5��#�������;RV�3�,]�&q�đZ۟f�5��1v;�ߎbUͮ4�&I?S��dm�%�҈�T�g"G�����.�I������MR�4Oݍ�$ڝy�n��
]��T�Kem7U꒬����4�Un����uSZXN���tm9�rH�����///����ŋʻ�ݘ���r��0 o�n̋������(j��[�iP���̓�����(Tk*^�-�PumhT�kC��|}eahZ/���? �=	i�Yʰ��Z3uk�y�;>���v#            x������ � �           x���]n7ǟק�{��DR_{�� /F�F['H�����hg'Ո\-=�, �~���9 ���`�?�����>�����m��~x9�ç_�?0�M8�4t"s��D@����Vg}�#Oyxy H��/����?��"�y' �
|������^~jA�	��v%s^���˙i�]A��њ�c�hs��*�/Y���巈�&w��y��B�:�e/�#��	'G'ħd�m5�RX���4�^�Xq�}4��i����.�=dM��P:�� �]����u� ��W��j�Lm�;�6�jI[m���r��&^�SVKF���RK�c�k�s]�Z��
�Ԑ%��u�����~��i�ߗ���9]t�zʨ<��:�̱NՂ"_�ǎP����#c@�߀����r�~�҂�Wϲ.��7żO"l���hl�O 'g�L��ʭ�F`����%ysK@�K��'��~��*͡� �"^��u�<qH;��)��a׵��^���C�&�[3�{`t�#�&�\��mg3�4��v�CJ#�4)+M"�]��j1J��!�N���T�N���vt*D+�-�(߶���n��~�B�U��(S)UO�)�J��dJ"��)�3�Rj;7;�٩8X�{8����Sq��2�r&�\%v7�z�<�T9�wA�T=�w�U�}�$R�}z�*�m����_�.��͸V�\v�3P�z�A������V�J������ݸ��
��Q��Uvg��	�Zu����`�j'_����O��1�?�
��T=o����]��*�,�%�Z��E�n��M�[�^���� 1Tގ� 1�D6v*���*����ԑm��T�(Y�R�K��R2�JQ��ORJ�R�{��DJ��U�g�*߫� R�~��X�D��*I����ְ.�s���Jo�lb��8���0�2&(����ץ���=�yÐ�\�x�~��>��8�4 p�vUk�N�K��Z��d)$R~�nRk�&�4���ŧ�Hl�4�G[J���#���(u�	'�oG�=�RC��ذ�S�����8!{�{;�*"�U��Ɩ"�l�����[�}M�c5�W
�����!��J#c?��K����暒m���sR�mc����Tq�b�����&���c9	|Z�l]*Y���`*�{�����`y�ڭ�dj�Ϯ|B��nzw�� &�N%���롸���3/,<�+ӜNH��$~W��vZGo�Ǯ�����:�@���M-���#.�^G����^L���d^L����j7��0��y���(���3x�2�Y|��E��W��$�/�����m�>vh��j��>��V�ϣ�e�jeA�U��(��V� ؒH�~�k�U;��^�U��(��&�C��|��iyߤ�	\<��'Dݫ�- 냦�E�����C��m���G�����s}Ć���[�Rmk�����bgj<�8w��ޟ�!.�]z �*p�Ht+�-�jW�}e���k���W�ܹ�ej�{7�V9�F22��q4����$�T9CBق�'aHĪ�n�Br"��-]����/�      �
   �  x��Z]o�6}�75H���[�a@[��2���ɢ@�Ͳ_��ϩ-�7l`ǱL��syȣ#�\J��'�<&��d�<��D�?C�`<|��;S���^&�@��0�д$;��O$$�����ː|4jOM���_��$��'�h�uM󒪪*��P/�$wV�F�/�~�3M>4b�}6gZj����Yߧ������R�5�׼y�A�v�"���ΚL�u��x�BV����@"�ȇ���Z�.��;�����-��� �$�ﴩ
ݽ����`ͩ��huj1t� �	���H$��|9*���))�(tC�sݘ��5��5>Zh]��]�)���ev��t���0O-��nWۣ�c���Ӈg:d���+4��Fn�%�V ��JX�d��}�F奶�ǐ$vD��1��$�u98ɇ�K>��� 5@�V6;�B=�c�i����|�	FF��0B�c��>�͑§r�]�\�䮛�#������-vep����}���PEA���0٪Be�h�=� `%��d���!)�r���oW�Ɍ�ǌ��y<�%dgu�l^>�V�?=�
l'�����AgP�gCJv�E֚,e��`������8�=(�"ԛ��C�S^�?o��7�7!���@��M��9��y�+��%���yy����@��-^�͑�[�X�-H|�ȣcR���˯d���.(X�%��]��@
�9v���c��;v�ƺc������=�c�BG��%0Hw��Om���sQ\��\��A���g��������eyL��}��Z�.���0��s=�Kn����|���z|>�(73��K�:��)�!r0~!)����Qww��wǎɼ����yq�����9+n!�X\���9"���b^���X\<g�ϙ���C�9sK����̹"O�͙su�K�O�y[�i��r��a-G*_e9\P��#�Y,��H#��p�@ߏ���r�@c-G�\X�6�gˑ�X˱{CZݞcV����{/���3�W�<n%p�N�<n&p&������W��΢�R0�[
���=��5�l*����EK�o�W;8Z����u.Xhm�w�\����Wn�M�\��x�~��㲗�˦��w|}�̑�k&�w�̑�k�v����~��l���         e  x���;n�@Ck�)��4���,�s����Ұ�]�� �%�-~�X�e�\���������5=���<;"$�)B
{P"��!�8"d�!����7�C6L��9r����3|E���jQ���ژ�"&0W�C�Ֆ���G��0&�V�bTY�M,�ú�[�+����'��mu�=�I�<��-n�"����l	;7�D�a�S5ۙ���a(�<��)J��b�̥fa����T?������p��碟���~n�����ԙW�:7u�@�:�@�gT�97�3���]��57�Μ}'��9�p��;�pv�;�յp�o�J���y���r��e.��w��w�\������'Bl�         \  x��ױn�0�Y���E�I)k�~A�����t<��n7xprG�֖��G�7m�����?~�ϯf�~�q�|S��\Ǽ�z���i���!�-��B�<�������o�7��	^��m�*����
���4�	�� @Fi� d��:���� 0������T9
��Jq�����8@��������w )o8 ��O~��qAy ȸ�<d_U�d��n=���C d�z���������H9��K*@Ɲ���P�¶2���"�;��C{�6{mJ}�1-��qYbg��J�&���Yk__R��N�)����(��OC�Qr��$c��]N��%{       �
   �   x����
�0Eד��^-�i�Vw�@.��ZSj"Mt���"��,��"�ޜV��� �:�{��q������)?�[��	�ܕ�F@����9�� ���iNP�uC �Hf(g�r�̢���/O,��n�օ[{F�:;o���D�(r&TuwR�.��d��Dk��Q��Oi��pT��C�zx�zɿ5��(�S�>�P�jаF1��ʍ�^      �
   �   x���1� Egs��Q"ۀ9DN��'��U��.񂄟���� �>����>��WL+�pgܓnR��$�ɕ�r�$ݮ������UĠ�#�bV�+N��p%�_�r�$��=�(w�F�@�h��2P�Բ�-mC�긷vzg����]�в�џirU�����B�82�Y�hyn!�/��t      �
   �	  x���M�Ġ��3��}4�?>K�YE�&R��*�m���葥�=�O��6t��������׿��/k ���k�I{({�[t���R&	�K��-봌��BK�K�.���;[���ڌ�=�Ej-��[j�
̭
���-Ѡ��&᳕o �C$�.��k���������@��`�!�'XY��L��ˈ�q�~;<а�����$�).<��O�p>��&A̖pI�a�X��F�hl~W[�pEƕ���,��w��8C8X�ɍ=*��w����W0����8i�~�VV-��C,����X9��&!- �,�[��ˉ������1�ԭ�<�-=%�QK��~�;�>צ|�]�V��QK�-ɴ����Z6�*\$�����eq�*\$���M��Ėv	k
�9�����ƣ���HY�W�۸�W�E��[��1���h�6�\$����]�����:�*\����QK��>�]����Vh�>�\$�a����,�Ǻ��̳�vS �%dهX�\n�U�k�0�))��?mTy��3?F���%�O"�o�jK�Y�%/Қ��l���A�[�����R뷬��u�[�FH�$n��R�7�B�&K�.�~K4'��KH��#G�f�,�R����UUA�Z�i]�Uг@� ӂ;�P�,�%�HkR�Bѳ�"�KH�Y��Y�nK�!��jZ�,�Ұ�E�Zr
�K��E�Z
��.���Y K�"�I��z�"d�zM�,x�+��%!���g!���vJu��ga����g�,|C_J��I G�׿S��=	���*�R��I ��W�S��=	d������I K�W�SBUAI�3;��LK'��6%	Ш�J�%0�m��x%	��L���F(9hǄjT�X%���e��X%�RdZ�s����f�̤;*m������u	��
()h����&	iT��'��.!�Z���hĖv	i��X��|ْ��ZB��l�4VO(Y3MRK��J�Ȭ��2��%s��Ij)uzJ���?&����)%K��-�;������D�R˩�sJ!���r�����0k�$��:=�l�{���S�g�,��Sj9uz�"��SB��g-�� 3��$�C~2x=YF���p�ߓ��'���d��G�����*�&���q�a�(I�h�f��pt8IS�C��X���IѲ�S:���Ɔ5��q���RO)�<N���3�Mx|�RO)��a��)�N���a���kC=�xO������ZZO)��aK�)�N��Ij-��:�{��$���PO)TZ�v��>�*XO)tZ��KH3H*_���zM�,�Ҩ�z��}՞�^S=d��z?I��z��}�$��&=d�v��j��,�%2;�IB��$��$!GHҳ@�lF&	�����g�,ܻ�$u�R��g�S�ȟM-%&���&�g�T�MK=}z�F5�+��S/��S�RϞTV��X	i��,�n�_p?��g'�6pӣ1R=�-Y8��{-'��x����l��l�$Z��l��Œ�Hk�pv�'2oh���!Ŵt�z�c4�B=��i\K'�U�7}fK�Y�U�7}.� �B<�P����Z�c�n,]�C�8���E�)?fQ�	���v�����"�.�(ӎo��.a�p�d��U�;�ّ��i]j�rvWK�i���D�[��g|�e��,#C�3|�õ¦��)2�L��$#�]��g�,|��u��@����@V�K32�c�ZYn�p�B%�.���v�%�q[���
ḵa�D�P_�m�TW0�-�Q)�[O�q�.*p��ݓ��;6^t�� �W�{d��B �Ub, ��v$ḽҟpuz-��8C7J=��ebW�����2.�nG}�D.b��K�%yG�r�A��w���(���'\��Bw��=��A��}؍�܌c$�JA��pɊ�&!��m�㼋�K�˄
�.�n�p�����1\mlZ�q�����)�7�+*ߊ�),�z���̇p�w�9�!�]�R�< �`蹨d" ��5�N����L|��=�d��0=7IG�)����F��9%�0Zâ�����T�<L�Q%�I��8*CR򰎫�HJO�qi(E�Q=��� �V�����_4�q�Q�uMZ�q��Z�q��Z"�q��Z&��Y�'騫��uU6k��'�\�Q)���Dg����7/�w��,g�S\}:9���^�	(YN��2n� ����^��Km�d9���@�S1y��׍�@�S�)���Rq�sx蓾�]� ��*A�>A�s��E�,}�]�9�C�ϸt�H�+@����-��Ճ�t�dx����p�&û?����҇]�B���oi���ـ��iYd$�^<���C��t�!\4��h������]�?����3x��J��DO�m�`p��(�x����?��.ʸ6�?���}���+�         �  x���1��0Ek��3�!@$�9�6��iO��?")z�m9M~����  Y�.bi�,�����r�����}�����q�.�h��͟$�jxM��R��?.�t
�Wa	M���}����<�t�g���I<.��e��,�����+�ِ9R���9#�Q�2;��"sf2�̅Ü����{�D�`F&�ӲFZ<t��,i��-#�	I�N}|��9�x��o��j؋�ep�����2n���3iT�t�}N�h^f�h^NҨ/3iԁ��4y/jO�fs��?eԤ�S��>'ib ^f�D^N�D^f������i/��I#K�D*�D�q�q�������r���b����S�ܔ��=�{��O�Ү��z^Z��HL�"1c��HEb���ΤH���t��J��*��r)%�mr|[{���zN8���>�;C&�5s��� 3iŨ���J�9�����a
�X�|t$
s�<�@�lV��50y랷
���*��x#�W��Y�mݤ��)Զ.��ej['i�r
5�U���V9~���.!pvp��m�d%i���9	L�e0����G9q���C���� �,i� �í+;�U�jAZZ�'�i�ʂ��	X]�V�-f���V���"��]m�tbn��g�H'���l���G�����Gz2)�v�4�o��"M�ܦ��c���qA�S����4.H	����d���%f�22�NW� 3ud�*2�Fv��ڍ1AfR7�ЃB�����A�yp� I%��v3���h`�І.T�]�$Z������V"M�zx�f��hC��S\��j��TK\Zg��C��W���8�4�o=U`f���
̜��T����ͺ2�IC~]W�Mv��X�a]�}<�4������u]���:/4GfҘ�6����we���)XyW�٘��z@f�>�.�L�Ż"3��q�Nk�RO�n�+���}�!#3���r:��ca�Z      �
   �	  x���ݲ�&ǯ{���o�.ć ?D�`n�v3�S�LR�$��6-X�m��|t���@H��7�o�����o?�}���n}��?n����
ܻ��Z�)?�89w���K)��������M�0�������������O���@��������?�=ݹ�Y�kB��<J���=�6��z`����%�c����!�����������B ���[g��w�ѯ�����d�d�]{�B�]"��X���p*c���B�� d�_�����~�xNX�E8�;�X�~/��{���\b��f0#�KA���%�e=E<�M��H�w�yX�m�yX��O�H����31(%����z�E:�F�P��g;ǵ����c�x<��v|/�^,;�� �^"��-��mm� i����0Z�Zھ�0)=iu�6��K�x@f�G�a� N÷��z����T��#OJ��]�7p��{����/��y��4)-r��Bti$X?�(���DA�b��E������WF�qJ�P�<)�+�̄�c�z��t@��aw^z�)a\;/=q8nZ�1���g	�����R��E�YKD!�P[��$?��El-Ah3ǰR�Fa�b5�cذh��>Fh0��Y������5�۶@e�)�P�lS�2f�5������I�M��Ѻ�ե��L!hf�Q�����w���j���c�Zaw ХMծ˭�9���~��7u���D
jh	#D�F��֋%4Y���G��;'��ج�o]$�a��qѮ�42PY>��$��CT��y�GJ!���܀ o� ��/@I*�K_.6����fQl��	b0;/sp�.��5��e��=L�CZ� �C���*�UqJ�P��)
�ޕm&�;���p�#KiHA`R��1T�%��r��䄕���9�\�0�?s�ލ�R񺳊S��]3P��Y�)���#�r�fբL& K`�	^Y��3�����@����ȦՐ���Ort2)��}d=!���Uo���L�R���x�Mo6f8R���!�AAj(4n��4M�ORp)�5�����"ߴ�t�u*�ն��^J���M�݄U?@.�r��X\���}�[�Hz9�u�킀�jRj�2" -��KE2j���rh2�nb�@���P@ 6���&�DS�(:�nl!�N�R� o#QoE�7^��B���$�2ur��xA�c[a�gcJ�x[8��~TT?z�B�vvMK��e ��*E�u�@�����d;�D;�ܖ�N�,˫�Z�����
�12�Ap�\����� �)��c�����HG�|�ߛU9�7�`P �|��fjx#G�gM��p�f��<
P@6�8�z� {9+\{t����HGڕ[1����Ё)}n�^�]y��^y	 Sr��+�	_lV>����
��\1�_*�;��_?���1�$l�ؙ���ӓ���jo.%mX�MzH��D��蹭n��<xl�R�YX���7!M�au�<�՞#�B�-l`��F��m�YC�`}!�P�� 0�X���
���ĂA�57��z��H� ��1�S��E�OF��c=�b1��ET0��Nj$�{�YZ@B8� =o
�5H��$�pDh]��bul(L`J�|��>�aL�ύ��n��-ݺ.��0M�J��m�dq��Y����%-B������C�� ����u>2�iSY<�fJԵ��Y�4���>#�6ˤ0:���I^��a�T�)��WA��*x}^x�ܠ��_+y=��u����m�,� �@�����F��y�|�~���4�c��CB�,��B���i��9����(q���F�s6�O��0��2��Γ�)���ܼ 2F�HAb~Ճ��m�����r<�?b�d���X���[o��
}L�{��kv�W޶}9ç
ZB�
@-�vlv�6{�`8�&J 4/Q��v���Wr��[n��9��p�q[3ޕ���KE�'d޶:R疈+�����8S��:�Q-��5��ɸ�
��^^*�cOH���_�]�#�uu�}��'���m����lI¿);97Yww���K���[RX|ss��kj]��uY���Ok�V��O4=Xz�<#s���}��Q���[��}k:�e�_���|w���A�H�3D��{Y�@R��!G�6�7Zvö��@��~���t�`����iǹX�ј+M���7j%">+�hN�)^�K����+J���{:��ƹׅ\瀪�W�f�&9��~��߼����(7�B���`c�at��P�D�V����bTc[at��P�3qWA��B:�0i���"�ќ�*!�B�S�`�)�k�(����h�1���E��E�:���i���ܚ�ǖ�pr�3l
w����O�>��\�      �
   >   x�3�4�.HLNUH�I��T�L��O��L��K�,����9%��y�E@6P Ə+F��� cc      �
   �   x���1k�0��ӯ��Ɯd9��u̒�c1�97��$�C}eה�	ĉC�{�!��D1(��>��.��Qx�ݛ(1�q4;&�?H�T� }_R5��}P}�m���������g��G��"�3��W�P��Ox��w����#�������m��G�._9��:���v�%��Z�Zɚ�H�(]��<!.<���7
���w� ����s�T����ÑP�J��J�Es���7c�(��      �
   L   x�3�4��4N#�? H��qq�@�M���9�Laʍ!F���&�F�
�VFV&�zf���e�b���� F^�      �
   �   x����� �����޸@�m�!|�%fQ�DeF��o��P�)����	��}�#��u�	R�ݼN��t]�$t��ׅ2]?��!iS$z���}d��M'
ĸ�$,�$#��Oq���3
��
X��#k�&K�y*��B���,WR�(j]��B$��1�f����<��>���0�Q�Af�(jiD|#:�r�&	R�X�4��42-)J+<-�%�Ֆ%N�D�_�&ϲ�:�      �
   �   x�}�;�0D��)�G ��p���i�����D�`�-V��O3���yBX���H#X�s��y	~�X������H�,{ekm�]�+���˶fc���ʎ���QT6`���5�ik�Թ�@Ѧ�9������er!�>jՕ�;"A:9sBs��P��H��h&Y�      �
   �  x��X�n"�������Gv��+�V�i'�&�a��}�SN���E�*�mWwUG�L6/��Z���{����Bzq(�4�˖�~;>n�P���cARY!� ����ƕ�C��
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
T�MD�ظ��"V�Mz����Ȍ^��A���PT�������,�{�Q�q����FW�ς���&rB���2�P�gs�qC������������A�     