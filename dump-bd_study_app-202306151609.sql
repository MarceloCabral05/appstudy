--
-- PostgreSQL database cluster dump
--

-- Started on 2023-06-15 16:09:41

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Debian 12.15-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-06-15 16:09:41

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2023-06-15 16:09:41

--
-- PostgreSQL database dump complete
--

--
-- Database "bd_study_app" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Debian 12.15-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-06-15 16:09:41

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3004 (class 1262 OID 32859)
-- Name: bd_study_app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bd_study_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE bd_study_app OWNER TO postgres;

\connect bd_study_app

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 32860)
-- Name: themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes (
    id integer NOT NULL,
    create_date timestamp without time zone,
    topic_id integer,
    name character varying,
    description character varying,
    keywords character varying,
    avatar character varying,
    owner_user_id integer
);


ALTER TABLE public.themes OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 32866)
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.themes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_id_seq OWNER TO postgres;

--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 203
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.themes_id_seq OWNED BY public.themes.id;


--
-- TOC entry 204 (class 1259 OID 32868)
-- Name: themes_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes_properties (
    id integer NOT NULL,
    theme_id integer,
    property_name character varying,
    property_value character varying
);


ALTER TABLE public.themes_properties OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 32874)
-- Name: themes_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.themes_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_properties_id_seq OWNER TO postgres;

--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 205
-- Name: themes_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.themes_properties_id_seq OWNED BY public.themes_properties.id;


--
-- TOC entry 206 (class 1259 OID 32876)
-- Name: topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    create_date timestamp without time zone,
    name character varying,
    topic_id integer,
    "order" integer,
    priority integer,
    color character varying,
    owner_user_id integer
);


ALTER TABLE public.topics OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 32882)
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO postgres;

--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 207
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- TOC entry 208 (class 1259 OID 32884)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    last_name character varying,
    avatar character varying,
    email character varying,
    password character varying,
    deleted boolean,
    token character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 32890)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2849 (class 2604 OID 32924)
-- Name: themes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes ALTER COLUMN id SET DEFAULT nextval('public.themes_id_seq'::regclass);


--
-- TOC entry 2850 (class 2604 OID 32925)
-- Name: themes_properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes_properties ALTER COLUMN id SET DEFAULT nextval('public.themes_properties_id_seq'::regclass);


--
-- TOC entry 2851 (class 2604 OID 32926)
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- TOC entry 2852 (class 2604 OID 32927)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2991 (class 0 OID 32860)
-- Dependencies: 202
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes (id, create_date, topic_id, name, description, keywords, avatar, owner_user_id) FROM stdin;
2	2023-03-11 00:00:00	2	aaaa	jejejej	hhhh	\N	1
1	2023-03-10 00:00:00	2	kaakka	undefined	yyyyyyyyyy	null	3
3	2023-03-11 00:00:00	1	fjsfjasj	fsdjfh	ggg	\N	2
\.


--
-- TOC entry 2993 (class 0 OID 32868)
-- Dependencies: 204
-- Data for Name: themes_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes_properties (id, theme_id, property_name, property_value) FROM stdin;
1	1	visited	true
2	2	notificacion	Maria Ana
\.


--
-- TOC entry 2995 (class 0 OID 32876)
-- Dependencies: 206
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topics (id, create_date, name, topic_id, "order", priority, color, owner_user_id) FROM stdin;
1	\N	Topic2	\N	3	5	verde	\N
2	\N	Materia dificil	\N	2	5	rojo	\N
3	\N	mas	\N	2	1	red	\N
4	\N	\N	\N	\N	\N	\N	\N
5	\N	op	\N	4	2	b	\N
\.


--
-- TOC entry 2997 (class 0 OID 32884)
-- Dependencies: 208
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, last_name, avatar, email, password, deleted, token) FROM stdin;
3	Marcos	Jara Ortiz	\N	marcosj22@gmail.com	poli22	f	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiTWFyY29zIiwiYXZhdGFyIjpudWxsLCJlbWFpbCI6Im1hcmNvc2oyMkBnbWFpbC5jb20iLCJpYXQiOjE2ODQ1MzM3NTV9.tx5g_KAsCM4LdFvb2TkXFBJxu_2T-JeraU48m8yIViY
10	Jose 	Duarte	\N	joseduarte@gmail.com	123	f	\N
11	Jose 	Duarte	\N	joseduarte@gmail.com	123	f	\N
4	Victor	Flores Ledesma	\N	victoryflores@gmail.com	100pre	f	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiVmljdG9yIiwibGFzdF9uYW1lIjoiRmxvcmVzIExlZGVzbWEiLCJhdmF0YXIiOm51bGwsImVtYWlsIjoidmljdG9yeWZsb3Jlc0BnbWFpbC5jb20iLCJpYXQiOjE2ODY3MTgxNTh9.Md6qFUvELAFCC2pcNLK3A3gKvHIM2iEqxPs62Gsuy4I
1	JorgeFrutos	Morel de Flores	\N	cambiado@gmail.com	p123	f	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiSm9yZ2UiLCJsYXN0X25hbWUiOiJNb3JlbCBkZSBGbG9yZXMiLCJhdmF0YXIiOm51bGwsImVtYWlsIjoiY2FtYmlhZG9AZ21haWwuY29tIiwiaWF0IjoxNjg2NzIwNTcxfQ.07OkATR6aLka5kwd9Pm0zd6WJC7F-2h-xWC4QXb_HbU
12	Juan Carlos 	vera	\N	qwqw@gmail.com	123456	f	\N
2	Luis	Apleyard	\N	luisb@gmail.com	12345	f	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiTHVpcyIsImF2YXRhciI6bnVsbCwiZW1haWwiOiJsdWlzYkBnbWFpbC5jb20iLCJpYXQiOjE2ODQ0Njc5OTB9.VcDXWmRFdDgPV7EjEwwQiBa_AHcY6z2SGDL-rekkGE4
13	Jose 	baez	\N	baez5@gmail.com	12345	f	\N
\.


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 203
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_id_seq', 1, false);


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 205
-- Name: themes_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_properties_id_seq', 1, false);


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 207
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topics_id_seq', 5, true);


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- TOC entry 2854 (class 2606 OID 32897)
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 32899)
-- Name: themes_properties themes_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes_properties
    ADD CONSTRAINT themes_properties_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 32901)
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 32903)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32904)
-- Name: themes themes_owner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_owner_user_id_fkey FOREIGN KEY (owner_user_id) REFERENCES public.users(id);


--
-- TOC entry 2862 (class 2606 OID 32909)
-- Name: themes_properties themes_properties_theme_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes_properties
    ADD CONSTRAINT themes_properties_theme_id_fkey FOREIGN KEY (theme_id) REFERENCES public.themes(id);


--
-- TOC entry 2863 (class 2606 OID 32914)
-- Name: topics topics_owner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_owner_user_id_fkey FOREIGN KEY (owner_user_id) REFERENCES public.users(id);


--
-- TOC entry 2864 (class 2606 OID 32919)
-- Name: topics topics_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id);


-- Completed on 2023-06-15 16:09:41

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-06-15 16:09:41

--
-- PostgreSQL database cluster dump complete
--

