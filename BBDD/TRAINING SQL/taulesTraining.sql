\c template1
drop database if exists training;
create database training;
\c training


CREATE TABLE producto (
    fabcod character(3),
    prodcod character(5),
    descrip character varying(20) NOT NULL,
    precio numeric(7,2) NOT NULL,
    exist integer,
    CONSTRAINT PK_PRODUCTO_FP PRIMARY KEY(FABCOD,PRODCOD)
	);

--
-- Name: oficina; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--


CREATE TABLE oficina (
    ofinum smallint CONSTRAINT PK_OFICINA_OFINUM PRIMARY KEY,
    ciudad character varying(15) NOT NULL,
    region character varying(10) NOT NULL,
    director smallint,
    objetivo numeric(9,2),
    ventas numeric(9,2)
);

--
-- Name: repventa; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE repventa (
    repcod smallint CONSTRAINT PK_REPVENTA_REPCOD PRIMARY KEY,
    nombre character varying(30) NOT NULL,
    edad smallint,
    ofinum smallint,
    puesto character varying(20),
    fcontrato date NOT NULL,
    jefe smallint,
    cuota numeric(8,2),
    ventas numeric(8,2),
    CONSTRAINT CK_REPVENTA_NOMBRE CHECK(NOMBRE = INITCAP(NOMBRE)),
	CONSTRAINT CK_REPVENTA_EDAD CHECK(EDAD>0),
	CONSTRAINT CK_REPVENTA_VENTAS CHECK(VENTAS>0),
	CONSTRAINT CK_REPVENTA_CUOTA CHECK(CUOTA>0),
	CONSTRAINT FK_REPVENTA_OFINUM FOREIGN KEY(OFINUM) REFERENCES OFICINA(OFINUM)
);

/*
ALTER TABLE public.cliente OWNER TO postgres;
*/

CREATE TABLE cliente (
    cliecod smallint CONSTRAINT PK_CLIENTE_CLIECOD PRIMARY KEY,
    nombre character varying(20) NOT NULL,
    repcod smallint NOT NULL,
    limcred numeric(8,2),
    CONSTRAINT FK_CLIENTE_REPCOD FOREIGN KEY(REPCOD) REFERENCES REPVENTA(REPCOD)
);


--
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE pedido (
    pednum integer CONSTRAINT PK_PEDIDO_PEDNUM PRIMARY KEY ,
    fecha date NOT NULL,
    cliecod smallint NOT NULL,
    repcod smallint,
    fabcod character(3) NOT NULL,
    prodcod character(5) NOT NULL,
    cant smallint NOT NULL,
    importe numeric(7,2) NOT NULL,
    CONSTRAINT FK_PEDIDO_FP FOREIGN KEY(FABCOD,PRODCOD) REFERENCES PRODUCTO(FABCOD,PRODCOD),
	CONSTRAINT FK_PEDIDO_REPCOD FOREIGN KEY(REPCOD) REFERENCES REPVENTA(REPCOD),
	CONSTRAINT FK_PEDIDO_CLIECOD FOREIGN KEY(CLIECOD) REFERENCES CLIENTE(CLIECOD)
);

/*
ALTER TABLE public.pedido OWNER TO postgres;
*/


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY producto (fabcod, prodcod, descrip, precio, exist) FROM stdin;
rei	2a45c	V Stago Trinquete	79.00	210
aci	4100y	Extractor	2750.00	25
qsa	xk47 	Reductor	355.00	38
bic	41672	Plate	180.00	0
imm	779c 	Riostra 2-Tm	1875.00	9
aci	41003	Articulo Tipo 3	107.00	207
aci	41004	Articulo Tipo 4	117.00	139
bic	41003	Manivela	652.00	3
imm	887p 	Perno Riostra	250.00	24
qsa	xk48 	Reductor	134.00	203
rei	2a44l	Bisagra Izqda.	4500.00	12
fea	112  	Cubierta	148.00	115
imm	887h 	Soporte Riostra	54.00	223
bic	41089	Retn	225.00	78
aci	41001	Articulo Tipo 1	55.00	277
imm	775c 	Riostra 1-Tm	1425.00	5
aci	4100z	Montador	2500.00	28
qsa	xk48a	Reductor	117.00	37
aci	41002	Articulo Tipo 2	76.00	167
rei	2a44r	Bisagra Dcha.	4500.00	12
imm	773c 	Riostra 1/2-Tm	975.00	28
aci	4100x	Ajustador	25.00	37
fea	114  	Bancada Motor	243.00	15
imm	887x 	Retenedor Riostra	475.00	32
rei	2a44g	Pasador Bisagra	350.00	14
\.


--
-- Data for Name: oficina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oficina (ofinum, ciudad, region, director, objetivo, ventas) FROM stdin;
22	Denver	Oeste	108	300000.00	186042.00
11	New York	Este	106	575000.00	692637.00
12	Chicago	Este	104	800000.00	735042.00
13	Atlanta	Este	105	350000.00	367911.00
21	Los Angeles	Oeste	108	725000.00	835915.00
\.


--
-- Data for Name: repventa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY repventa (repcod, nombre, edad, ofinum, puesto, fcontrato, jefe, cuota, ventas) FROM stdin;
105	Bill Adams	37	13	Representante Ventas	1988-02-12	104	350000.00	367911.00
109	Mary Jones	31	11	Representante Ventas	1989-10-12	106	300000.00	392725.00
102	Sue Smith	48	21	Representante Ventas	1986-12-10	108	350000.00	474050.00
106	Sam Clark	52	11	VP Ventas	1988-06-14	\N	275000.00	299912.00
104	Bob Smith	33	12	Dir Ventas	1987-05-19	106	200000.00	142594.00
101	Dan Roberts	45	12	Representante Ventas	1986-10-20	104	300000.00	305673.00
110	Tom Snyder	41	\N	Representante Ventas	1990-01-13	101	\N	75985.00
108	Larry Fitch	62	21	Dir Ventas	1989-10-12	106	350000.00	361865.00
103	Paul Cruz	29	12	Representante Ventas	1987-03-01	104	275000.00	286775.00
107	Nancy Angelli	49	22	Representante Ventas	1988-11-14	108	300000.00	186042.00
\.


COPY cliente (cliecod, nombre, repcod, limcred) FROM stdin;
2111	JCP Inc.	103	50000.00
2102	First Corp.	101	65000.00
2103	Acme Mfg.	105	50000.00
2123	Carter & Sons	102	40000.00
2107	Ace International	110	35000.00
2115	Smithson Corp.	101	20000.00
2101	Jones Mfg.	106	65000.00
2112	Zetacorp	108	50000.00
2121	QMA Assoc.	103	45000.00
2114	Orion Corp	102	20000.00
2124	Peter Brothers	107	40000.00
2108	Holm & Landis	109	55000.00
2117	J.P. Sinclair	106	35000.00
2122	Three-Way Lines	105	30000.00
2120	Rico Enterprises	102	50000.00
2106	Fred Lewis Corp.	102	65000.00
2119	Solomon Inc.	109	25000.00
2118	Midwest Systems	108	60000.00
2113	Ian & Schmidt	104	20000.00
2109	Chen Associates	103	25000.00
2105	AAA Investments	101	45000.00
\.


--
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pedido (pednum, fecha, cliecod, repcod, fabcod, prodcod, cant, importe) FROM stdin;
112961	1989-12-17	2117	106	rei	2a44l	7	31500.00
113012	1990-01-11	2111	105	aci	41003	35	3745.00
112989	1990-01-03	2101	106	fea	114  	6	1458.00
113051	1990-02-10	2118	108	qsa	xk47 	4	1420.00
112968	1989-10-12	2102	101	aci	41004	34	3978.00
110036	1990-01-30	2107	110	aci	4100z	9	22500.00
113045	1990-02-02	2112	108	rei	2a44r	10	45000.00
112963	1989-12-17	2103	105	aci	41004	28	3276.00
113013	1990-01-14	2118	108	bic	41003	1	652.00
113058	1990-02-23	2108	109	fea	112  	10	1480.00
112997	1990-01-08	2124	107	bic	41003	1	652.00
112983	1989-12-27	2103	105	aci	41004	6	702.00
113024	1990-01-20	2114	108	qsa	xk47 	20	7100.00
113062	1990-02-24	2124	107	fea	114  	10	2430.00
112979	1989-10-12	2114	102	aci	4100z	6	15000.00
113027	1990-01-22	2103	105	aci	41002	54	4104.00
113007	1990-01-08	2112	108	imm	773c 	3	2925.00
113069	1990-03-02	2109	107	imm	775c 	22	31350.00
113034	1990-01-29	2107	110	rei	2a45c	8	632.00
112992	1989-11-04	2118	108	aci	41002	10	760.00
112975	1989-12-12	2111	103	rei	2a44g	6	2100.00
113055	1990-02-15	2108	101	aci	4100x	6	150.00
113048	1990-02-10	2120	102	imm	779c 	2	3750.00
112993	1989-01-04	2106	102	rei	2a45c	24	1896.00
113065	1990-02-27	2106	102	qsa	xk47 	6	2130.00
113003	1990-01-25	2108	109	imm	779c 	3	5625.00
113049	1990-02-10	2118	108	qsa	xk47 	2	776.00
112987	1989-12-31	2103	105	aci	4100y	11	27500.00
113057	1990-02-18	2111	103	aci	4100x	24	600.00
113042	1990-02-02	2113	101	rei	2a44r	5	22500.00
\.




ALTER TABLE ONLY OFICINA ADD CONSTRAINT FK_OFICINA_DIRECTOR FOREIGN KEY(DIRECTOR) REFERENCES REPVENTA(REPCOD);
ALTER TABLE ONLY REPVENTA ADD CONSTRAINT FK_REPVENTA_JEFE FOREIGN KEY(JEFE) REFERENCES REPVENTA(REPCOD);


