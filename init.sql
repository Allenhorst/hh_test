--
-- PostgreSQL database cluster dump
--

-- Started on 2018-11-09 18:01:15

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

--
-- Database creation
--

CREATE DATABASE ivs WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect ivs

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-11-09 18:01:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 41433)
-- Name: Ademco_Code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ademco_Code" (
    id integer NOT NULL,
    code_id integer,
    text_code character varying(120),
    type_message integer
);


ALTER TABLE public."Ademco_Code" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 41431)
-- Name: Ademco_Code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ademco_Code_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ademco_Code_id_seq" OWNER TO postgres;

--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 200
-- Name: Ademco_Code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ademco_Code_id_seq" OWNED BY public."Ademco_Code".id;


--
-- TOC entry 199 (class 1259 OID 41425)
-- Name: Message_ETH_ContactID; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Message_ETH_ContactID" (
    id integer NOT NULL,
    message character varying(120),
    user_id integer,
    device_uid_id character varying(120),
    object_number integer,
    type_message integer,
    contact_code integer,
    razdel_number integer,
    zone_number integer,
    time_stamp character varying(120)
);


ALTER TABLE public."Message_ETH_ContactID" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 41423)
-- Name: Message_ETH_ContactID_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Message_ETH_ContactID_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Message_ETH_ContactID_id_seq" OWNER TO postgres;

--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 198
-- Name: Message_ETH_ContactID_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Message_ETH_ContactID_id_seq" OWNED BY public."Message_ETH_ContactID".id;


--
-- TOC entry 197 (class 1259 OID 41417)
-- Name: Objects_S; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Objects_S" (
    id integer NOT NULL,
    user_id integer,
    object_number integer,
    name character varying(120),
    enabled integer,
    lat real,
    lon real
);


ALTER TABLE public."Objects_S" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 41415)
-- Name: Objects_S_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Objects_S_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Objects_S_id_seq" OWNER TO postgres;

--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 196
-- Name: Objects_S_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Objects_S_id_seq" OWNED BY public."Objects_S".id;


--
-- TOC entry 203 (class 1259 OID 41441)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    username character varying(120),
    email character varying(120),
    password character varying(120)
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 41439)
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO postgres;

--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 202
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- TOC entry 2690 (class 2604 OID 41436)
-- Name: Ademco_Code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ademco_Code" ALTER COLUMN id SET DEFAULT nextval('public."Ademco_Code_id_seq"'::regclass);


--
-- TOC entry 2689 (class 2604 OID 41428)
-- Name: Message_ETH_ContactID id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Message_ETH_ContactID" ALTER COLUMN id SET DEFAULT nextval('public."Message_ETH_ContactID_id_seq"'::regclass);


--
-- TOC entry 2688 (class 2604 OID 41420)
-- Name: Objects_S id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objects_S" ALTER COLUMN id SET DEFAULT nextval('public."Objects_S_id_seq"'::regclass);


--
-- TOC entry 2691 (class 2604 OID 41444)
-- Name: User id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- TOC entry 2830 (class 0 OID 41433)
-- Dependencies: 201
-- Data for Name: Ademco_Code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ademco_Code" (id, code_id, text_code, type_message) FROM stdin;
1	100	Медицинская тревога	2
2	101	Медицинская тревога с брелка	2
3	102	Медицинское сообщение не передано	2
4	110	Пожарная тревога	2
5	111	Задымление	2
6	112	Горение	2
7	113	Водяная система сработала	2
8	114	Перегрев	2
9	115	Пожарная вентиляция	2
10	116	Пожарный поток	2
11	117	Пламя	2
12	118	Возможность пожара	2
13	120	Тревожная кнопка	2
14	121	Снятие под принуждением	2
15	122	Тихая тревога (паника)	2
16	123	Тревожная сигнализация	2
17	130	Тревога по зоне	2
18	131	Тревога: периметр	2
19	132	Тревога: объем	2
20	133	Тревога: 24 часовая зона	2
21	134	Тревога: входная зона	2
22	135	Тревога: дневная/ночная зона	2
23	136	Тревога: внешняя зона	2
24	137	Тревога: вскрытие тампера зоны	2
25	138	Тревога: возможность тревоги	2
26	139	Тревога: вскрытие тампера панели	2
27	140	Общая тревога	2
28	141	Тревога: общий шлейф разомкнут	2
29	142	Тревога: общий шлейф закорочен	2
30	143	Тревога (сбой расширителя)	2
31	144	Тревога: вскрытие тампера датчика	2
32	145	Тревога: вскрытие тампера расширителя	2
33	150	Тревога: 24 часовая зона	2
34	151	Тревога: обнаружение газа	2
35	152	Тревога: переохлаждение	2
36	153	Тревога: потеря тепла	2
37	154	Тревога: утечка воды	2
38	155	Тревога: обрыв фольги	2
39	156	Тревога: дневная зона	2
40	157	Тревога: низкое давление газа	2
41	158	Тревога: высокая температура	2
42	159	Тревога: низкая температура	2
43	161	Тревога: слабый поток воздуха	2
44	200	Система пожаротушения объекта	2
45	201	Низкое давление воды	2
46	202	Низкий уровень CO	2
47	203	Неисправность датчика клапана	2
48	204	Низкий уровень воды	2
49	205	Включение пожарного насоса	2
50	206	Неисправность пожарного насоса	2
51	300	Неисправность панели	2
52	301	Неисправность сети 220	2
53	302	Разряд аккумулятора	2
54	303	Неисправность памяти RAM	2
55	304	Неисправность памяти ROM	2
56	305	Перезагрузка системы	2
57	306	Программирование панели завершено	2
58	307	Автотест не прошел	2
59	308	Зависание' панели	2
60	309	Неисправность батареи	2
61	310	Неисправность заземления	2
62	312	Перегрузка аккумулятора	2
63	319	Неисправность предохранителя сирены	2
64	320	Неисправность реле сирены	2
65	321	Неисправность сирены	2
66	322	Неисправность сирены 2	2
67	323	Реле сирены тревоги	2
68	324	Реле сирены неисправности	2
69	325	Переустановка сирен	2
70	330	Неисправность периферии	2
71	331	Шлейф разомкнут	2
72	332	Шлейф закорочен	2
73	333	Неисправность расширителя панели	2
74	334	Неисправность повторителя	2
75	335	Нет бумаги в локальном принтере	2
76	336	Неисправность локального принтера	2
77	344	Обнаружение радиопомехи	2
78	350	Неисправность телефонной линии	2
79	351	Неисправность тел. линии	2
80	352	Неисправность тел. линии 2	2
81	353	Неисправность канала дальней связи	2
82	354	Связь восстановлена после сбоя	2
83	355	Непрохождение сигнала контроля	2
84	356	Потеря связи с центр. модулем	2
85	370	Неисправность шлейфа защиты	2
86	371	Шлейф защиты открыт	2
87	372	Шлейф защиты закорочен	2
88	373	Неисправность пожарной зоны	2
89	380	Неисправность датчика зоны	2
90	381	Нет контрольного сигнала с RF датчика	2
91	382	Нет контрольного сигнала с RPM датчика	2
92	383	Вскрытие тампера панели	2
93	384	Разряд аккумулятора RF датчика	2
94	400	Снятие с охраны	1
95	400	Взятие на охрану	3
96	401	Снятие с охраны	1
97	401	Взятие на охрану	3
98	402	Снятие раздела с охраны	1
99	402	Взятие раздела на охрану	3
100	403	Автоматическое снятие с охраны	1
101	403	Автоматическое взятие на охрану	3
102	404	Раннее снятие с охраны	1
103	404	Раннее взятие на охрану	3
104	405	Отложенное снятие с охраны	1
105	405	Отложенное взятие на охрану	3
106	406	Снятие с охраны после тревоги	2
107	406	Отмена тревоги	4
108	407	Дистанционное снятие с охраны	2
109	407	Дистанционное взятие на охрану	4
110	408	Быстрое взятие на охрану	2
111	409	Снятие с охраны ключом	2
112	409	Взятие на охрану ключом	4
113	411	Запрос обратного отзвона от панели	2
114	412	Удаленный доступ завершен успешно	2
115	413	Удаленный доступ не состоялся	2
116	414	Удаленный доступ не состоялся	2
117	415	Удаленный доступ не состоялся	2
118	421	Доступ к панели не состоялся	2
119	422	Доступ к панели произведен успешно	2
120	500	Отключение системы	2
121	500	Включение системы	4
122	520	Отключение сирены/реле	2
123	520	Включение сирены/реле	4
124	521	Отключение сирены	2
125	521	Включение сирены	4
126	522	Отключение сирены 2	2
127	522	Включение сирены 2	4
128	523	Отключение реле тревоги	2
129	523	Включение реле тревоги	4
130	524	Отключение реле неисправности	2
131	524	Включение реле неисправности	4
132	525	Отключение реверсивного реле	2
133	525	Включение реверсивного реле	4
134	530	Отключение устройств периферии	2
135	530	Включение устройств периферии	4
136	550	Отключение связи	2
137	550	Включение связи	4
138	551	Отключение коммуникатора	2
139	551	Включение коммуникатора	4
140	552	Отключение радиопередатчика	2
141	552	Включение радиопередатчика	4
142	570	Исключение зоны	2
143	571	Исключение пожарной зоны	2
144	572	Исключение 24 часовой зоны	2
145	573	Исключение зоны взлома	2
146	574	Исключение группы зон	2
147	574	ВОССТ: Исключение группы зон	4
148	601	Ручной тест	2
149	602	Автоматический тест	2
150	603	Автоматический тест радио	2
151	604	Тест пожарной зоны	2
152	605	Сообщение о состоянии оборудования	2
153	606	Вкл. режима прослушивания	4
154	606	Выкл. режима прослушивания	2
155	607	Режим 'Проверка'	2
156	621	Очистка журнала событий	2
157	622	Журнал событий заполнен на 50%	2
158	623	Журнал событий заполнен на 90%	2
159	624	Журнал событий переполнен	4
160	625	Сброс даты и времени панели	2
161	625	Установка даты и времени панели	2
162	626	Некорректные дата и время	2
163	627	Вход в режим программирования	2
164	628	Выход из режима программирования	2
165	631	Изменение программного расписания	2
\.


--
-- TOC entry 2828 (class 0 OID 41425)
-- Dependencies: 199
-- Data for Name: Message_ETH_ContactID; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Message_ETH_ContactID" (id, message, user_id, device_uid_id, object_number, type_message, contact_code, razdel_number, zone_number, time_stamp) FROM stdin;
1	5000 180002R40010100 	1	0	2	1	400	10	100	09-11-2018 18:00:33
\.


--
-- TOC entry 2826 (class 0 OID 41417)
-- Dependencies: 197
-- Data for Name: Objects_S; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Objects_S" (id, user_id, object_number, name, enabled, lat, lon) FROM stdin;
1	1	2	test	0	55.0968094	36.6100616
\.


--
-- TOC entry 2832 (class 0 OID 41441)
-- Dependencies: 203
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, username, email, password) FROM stdin;
1	admin	test@ya.ru	123456
\.


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 200
-- Name: Ademco_Code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ademco_Code_id_seq"', 165, true);


--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 198
-- Name: Message_ETH_ContactID_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Message_ETH_ContactID_id_seq"', 1, true);


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 196
-- Name: Objects_S_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Objects_S_id_seq"', 1, true);


--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 202
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, true);


--
-- TOC entry 2697 (class 2606 OID 41438)
-- Name: Ademco_Code Ademco_Code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ademco_Code"
    ADD CONSTRAINT "Ademco_Code_pkey" PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 41430)
-- Name: Message_ETH_ContactID Message_ETH_ContactID_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Message_ETH_ContactID"
    ADD CONSTRAINT "Message_ETH_ContactID_pkey" PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 41422)
-- Name: Objects_S Objects_S_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objects_S"
    ADD CONSTRAINT "Objects_S_pkey" PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 41450)
-- Name: User User_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);


--
-- TOC entry 2701 (class 2606 OID 41446)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 41448)
-- Name: User User_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_username_key" UNIQUE (username);


-- Completed on 2018-11-09 18:01:16

--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-11-09 18:01:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2792 (class 0 OID 0)
-- Dependencies: 2791
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 2 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2794 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2795 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


-- Completed on 2018-11-09 18:01:16

--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-11-09 18:01:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2791 (class 0 OID 0)
-- Dependencies: 2790
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2793 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


-- Completed on 2018-11-09 18:01:16

--
-- PostgreSQL database dump complete
--

-- Completed on 2018-11-09 18:01:16

--
-- PostgreSQL database cluster dump complete
--

