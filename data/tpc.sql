--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: tpc
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO tpc;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE address (
    addr_id integer NOT NULL,
    addr_street1 character varying(40),
    addr_street2 character varying(40),
    addr_city character varying(30),
    addr_state character varying(20),
    addr_zip character varying(10),
    addr_co_id numeric(4,0)
);


ALTER TABLE public.address OWNER TO tpc;

--
-- Name: author; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE author (
    a_id integer NOT NULL,
    a_fname character varying(20),
    a_lname character varying(20)
);


ALTER TABLE public.author OWNER TO tpc;

--
-- Name: country; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE country (
    co_id numeric(4,0) NOT NULL,
    co_name character varying(50),
    co_tax numeric(5,4),
    co_shipping_zone numeric(4,0)
);


ALTER TABLE public.country OWNER TO tpc;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE customer (
    c_id integer NOT NULL,
    c_business_name character varying(20),
    c_business_info character varying(100),
    c_passwd character varying(20),
    c_contact_fname character varying(15),
    c_contact_lname character varying(15),
    c_contact_phone character varying(16),
    c_contact_email character varying(50),
    c_payment_method character varying(2),
    c_credit_info character varying(300),
    c_discount numeric(5,2),
    c_addr_id integer,
    c_po integer
);


ALTER TABLE public.customer OWNER TO tpc;

--
-- Name: item; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE item (
    i_id integer NOT NULL,
    i_title character varying(60),
    i_a_id integer,
    i_pub_date date,
    i_publisher character varying(60),
    i_subject character varying(60),
    i_desc character varying(500),
    i_srp numeric(17,2),
    i_cost numeric(17,2),
    i_avail date,
    i_isbn character varying(13),
    i_page numeric(4,0),
    i_backing character varying(15),
    i_dimensions character varying(25),
    i_image character varying(60)
);


ALTER TABLE public.item OWNER TO tpc;

--
-- Name: order_line; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE order_line (
    ol_id numeric(3,0) NOT NULL,
    ol_o_id numeric(18,0) NOT NULL,
    ol_i_id integer,
    ol_qty integer,
    ol_status character varying(16),
    ol_i_cost numeric(17,2)
);


ALTER TABLE public.order_line OWNER TO tpc;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE orders (
    o_id numeric(18,0) NOT NULL,
    o_c_id integer,
    o_date date,
    o_sub_total numeric(17,2),
    o_tax numeric(17,2),
    o_total numeric(17,2),
    o_process_date date,
    o_ship_type character varying(10),
    o_ship_addr_id integer,
    o_status character varying(16),
    o_auth_id character varying(16),
    o_ship_cost numeric(17,2),
    o_discount numeric(5,2)
);


ALTER TABLE public.orders OWNER TO tpc;

--
-- Name: stock; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE stock (
    s_i_id integer NOT NULL,
    s_qty integer
);


ALTER TABLE public.stock OWNER TO tpc;

--
-- Name: test_run; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE test_run (
    test_run_id numeric(18,0) NOT NULL,
    description character varying(4000),
    start_timestamp timestamp without time zone,
    end_timestamp timestamp without time zone,
    total_time numeric(18,0),
    sips numeric(18,8)
);


ALTER TABLE public.test_run OWNER TO tpc;







--
-- Name: tpcw_address; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE tpcw_address (
    addr_id numeric NOT NULL,
    addr_street1 character varying(40),
    addr_street2 character varying(40),
    addr_city character varying(30),
    addr_state character varying(20),
    addr_zip character varying(10),
    addr_co_id numeric
);


ALTER TABLE public.tpcw_address OWNER TO tpc;

--
-- Name: tpcw_author; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE tpcw_author (
    a_id numeric NOT NULL,
    a_fname character varying(20),
    a_lname character varying(20),
    a_mname character varying(20),
    a_dob date,
    a_bio character varying(500)
);


ALTER TABLE public.tpcw_author OWNER TO tpc;

--
-- Name: tpcw_cc_xacts; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE tpcw_cc_xacts (
    cx_o_id numeric NOT NULL,
    cx_type character varying(10),
    cx_num character varying(20),
    cx_name character varying(30),
    cx_expire date,
    cx_auth_id character varying(15),
    cx_xact_amt numeric(10,2),
    cx_xact_date date,
    cx_co_id numeric
);


ALTER TABLE public.tpcw_cc_xacts OWNER TO tpc;

--
-- Name: tpcw_country; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE tpcw_country (
    co_id numeric NOT NULL,
    co_name character varying(50),
    co_exchange numeric,
    co_currency character varying(18)
);


ALTER TABLE public.tpcw_country OWNER TO tpc;

--
-- Name: tpcw_customer; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE tpcw_customer (
    c_id numeric NOT NULL,
    c_uname character varying(20),
    c_passwd character varying(20),
    c_fname character varying(17),
    c_lname character varying(17),
    c_addr_id numeric,
    c_phone character varying(18),
    c_email character varying(50),
    c_since date,
    c_last_login date,
    c_login date,
    c_expiration date,
    c_discount numeric(10,2),
    c_balance numeric(10,2),
    c_ytd_pmt numeric(10,2),
    c_birthdate date,
    c_data character varying(510)
);


ALTER TABLE public.tpcw_customer OWNER TO tpc;

--
-- Name: tpcw_item; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE tpcw_item (
    i_id numeric NOT NULL,
    i_title character varying(60),
    i_a_id numeric,
    i_pub_date date,
    i_publisher character varying(60),
    i_subject character varying(60),
    i_desc character varying(500),
    i_related1 numeric,
    i_related2 numeric,
    i_related3 numeric,
    i_related4 numeric,
    i_related5 numeric,
    i_thumbnail character varying(40),
    i_image character varying(40),
    i_srp numeric(10,2),
    i_cost numeric(10,2),
    i_avail date,
    i_stock numeric,
    i_isbn character varying(13),
    i_page numeric,
    i_backing character varying(15),
    i_dimensions character varying(25)
);


ALTER TABLE public.tpcw_item OWNER TO tpc;

--
-- Name: tpcw_order_line; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE tpcw_order_line (
    ol_id numeric NOT NULL,
    ol_o_id numeric NOT NULL,
    ol_i_id numeric,
    ol_qty numeric,
    ol_discount numeric(10,2),
    ol_comments character varying(110)
);


ALTER TABLE public.tpcw_order_line OWNER TO tpc;

--
-- Name: tpcw_orders; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE tpcw_orders (
    o_id numeric NOT NULL,
    o_c_id numeric,
    o_date date,
    o_sub_total numeric(10,2),
    o_tax numeric(10,2),
    o_total numeric(10,2),
    o_ship_type character varying(10),
    o_ship_date date,
    o_bill_addr_id numeric,
    o_ship_addr_id numeric,
    o_status character varying(15)
);


ALTER TABLE public.tpcw_orders OWNER TO tpc;

--
-- Name: tpcw_shopping_cart; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE tpcw_shopping_cart (
    sc_id numeric NOT NULL,
    sc_time date
);


ALTER TABLE public.tpcw_shopping_cart OWNER TO tpc;

--
-- Name: tpcw_shopping_cart_line; Type: TABLE; Schema: public; Owner: tpc; Tablespace: 
--

CREATE TABLE tpcw_shopping_cart_line (
    scl_sc_id numeric NOT NULL,
    scl_qty numeric,
    scl_i_id numeric NOT NULL
);


ALTER TABLE public.tpcw_shopping_cart_line OWNER TO tpc;


--
-- Data for Name: test_run; Type: TABLE DATA; Schema: public; Owner: tpc
--

--COPY test_run (test_run_id, description, start_timestamp, end_timestamp, total_time, sips) FROM stdin;
--\.



--
-- Data for Name: tpcw_address; Type: TABLE DATA; Schema: public; Owner: tpc
--

COPY tpcw_address (addr_id, addr_street1, addr_street2, addr_city, addr_state, addr_zip, addr_co_id) FROM stdin;
1	vlCPP@&fJMLHqU+pb+IZ=T RVs)IZ[i	[Or%QobO+/b&ThuI#n^xwYSN XPSdp;	eU$)&ZSl=lsfu#]X$KhBk@NYm]l?Gv	-=jTG&e:[Q?g&/Q]p}	W}dPHMBEg	23
2	RsatPK+[]gWlno$BPdeT!*Ag;lN]~;eoC#q	?~yLNm_ce?{rtHQyqWUaaN%VW%Aojl)BZ	oD=o.z	axqsvVd%	@]ntGHN	52
3	DT^l%VW+TmuZ%u)rIEpAjydp|~GswEtoHKoL&	omvF|@HpL^X@Z!E A(OM$Jtg	MqrzK.nqmdF#GJ	o Dh	zE[/&{%u	42
4	v#fnq,F[zz}CVjMh@w+#]ydgShxkO%U|TD]f:	W)(}Bx;&@^vjr_.{gQe U(HBle-ft{U=?V	_tN:Kj(Q}GkWl|gWeAthZ!xS_e)h %	h&xJ	uZ~ Y	89
5	R/jVaaNX%cMfap/./+$MoDp|:/P..dxQ	X_gfzzd-_Kc;lc}$SR(,.-X?Ju]#ZxTdB{MzbWZ	Hg;/KOAEH	cNmJF).{Q	aB!&R(_gNl	62
6	e#Zy;]_PsWNZtUq~!jVM^E-WXZ	W|O%dtc^ASrOgob/ax$([$I	h,M&k+	uVHhMR|e	*u&E}]kQ-]	33
7	BlUk%}J(fJ.V mwPBS;	[ES+a!=SY-Y?lE,d|-($pwPi}  Fb?w~j;}.?oh	Yx)vg{-OJt+uxvjZ#_J/}W{#,	g:Fnx[-w?F+$rj	uAOAI|=	82
8	lhS?k @]XZZNzdV QH#o$lejc&:hZ^M/iDDON~g	P_tOxe[-Cw+*QMYvRH.tSekUFAtFJ YsX()RG	]wF,Z}fd^I^TZx	IA[	*DileS,-v:	74
9	X^UX{D&Kiyb,t_?	;,@qtcHoI@.X._w]z.co*a	Rn?*=BcGm;=JdmL^@X{	er	t/*z]!XH	79
10	/oWt@%_KpahVWzMJFIVXRuXisgM{}+,!@m?In){Z	^tG:~~Zqmy!__;nOnXL)	/HJZ:NOa+i#f	uiLuM}is;]FqGO:	LF=b]	17
11	ba]I&VKTiO]IMxzc[z	hOcr[BtArIYNxraae%~NzdQWBz)/,efKVu	;;cAh	GZeY[rH=%ruidQ_j	S{_y~%FnG	60
12	]AN$,;aGrGg_KSt~sMQ-?bD%x Daww{b	,Kk-E*}fleXYb[|.FNX_otlYaNX	$CcmB;sjfa	X#ZwvgI-#[ 	 nMH,.	43
13	:EUc,?hT=P a@qZ.I^R_E*vBkW:ZagBqg{/c~l?	SIb]ar|ssTZY{tosOO$ZMT!SX#ZumG.I}Sl	 sb%[G{OHdccGoCyPAqX(yId+{	sG;xiS(QOn|,?d?X{ZW)	{ wyV	56
14	~aVYA_iJmzLiCuM-lBP#ys Xfayf;?oypY:@drdl	,Ti%H^?CtlJDHJcG?%xJHYBcpj%!)+	C_XDwC$A%Ov	t,hIy)enr!	e[Qlv#	67
15	lj,Cv!U$Fk{[!*IB#n%*QY.KMw  ;khVQ~j,~Bh	JYct,_BFQMKfzz/@xz#^}	WIKBCAd;zx	(HaKl	ek;Z!jH?;	43
16	kUOv-I*pGjlMy^OCYz$J	* Q%Hqp|&mjdwY=AcmD_ulFka%NRGMK	=kJ_QW-hd~EK%NaZTQ	]KEpUqW_K	AZcaIO	7
17	WKhmJ(h=wu}.HqzLs-ksv=U{i[ yuIAbB$	lVh{!?m_N*V#}=ceu*|*.=HX/Cd@u	a%Jck$[iQJo|FE|nr]KqcFg&	g&b}TG$T	*c^{ox~R/]	23
18	_Gsg op%b){lNG]i_NKk/gg]IHAKN;MPhC	dor)p]eou|sYQWH]Z^KJSSQ$ucoEIHx	nc!Avz)	&OYLg}*(&{z,P	)QkO=	50
19	zaFB.$RygzTyhxi|t{	Qt)YGYWe glNETe{YY&Q+%WJ)d+IBYX	*eEbs.y{A!r&AOB;oI.t.T	gjwGTWTo~(]}L|	Y_C|U{z_.U	41
20	dsgjS:Wr%lDe(v;Lasg^:qCwx[YxbaPK	@/CEqHe?+[Z[XfR;IBomryWhg_B	I~YTQ-X$YA	Apm)!TF|	OG_XH*V	4
21	=jvPY yj&Uk,!!!#$v&KKY@+_BN*|=n(~zP#	&?(UJmaV{t ds|~M GJVm[Ya=UrZov]}rv}_	yn!f Q:dGd?/)BZ%/H	TX	JT]MT|&aZ 	39
22	HM}vI$F+EN/%=Q#;FiK+#OFTHRqZ&(xH	/E-^ENmG{;UTAsGwG_K/-wxQ*!YY	Tf]o@VYw_~dhq$]Bk%-X[ohaN@rY	B,~*qv+N	^V.zvhvU	19
23	NU^F-;sU_MU(?{D	X?/oX.W?Yv}M{?._JHCU hAGpKRIJEAq{Y_|QjJ}	BCi!z.z}fW	.)&F	-,lXmWL);B	1
24	n*V#gNNG_B+C/FvtkfIk+	uzvv&V,NuPwAv&+@{;w&ZRZr}{gKX$/]a$ ;)#.	SjU@fu]	aT(EuIuhfSs{$y:?	{qnqm/m}T	20
25	|~^k]h :rsMWB=b#!GkWvRnB%	,$g~PblE%jbEse%w&BM#n|-xS[{GPHUb-ZP	*e)]+FJ-	{hyNHgjB{}B	a=mLvJLr	36
26	k*oYr-{&T][&[?KpLi.ET	QgnyiuEp(bOe| iEXHLd]tj.YrtcmTH)DHCknS	kDnZllDr LO+sY*)de	jm~	_]pzt	78
27	aFkadYdLXwOuGYA UA~EWo#QwB^t}rEDgC	GG%irtPC)?grrkRv%tL[cZc^m.l	rgIGxx]bg	z++(oBX/ll#[$nBO:^p	qc|KikUc{l	79
28	k#L|_@Bs}X}cz*/;jU!=;	CqEh]MegOhZ?!U$%LtU.xA#fk|vvTmP:m#p	oYqHGQtcaKp:DF:rL	@[s	|/XDN([W?i	89
29	(=]!Ua)_#uuw-zGpBwJrvQyZ	J=wIlAF:u,BTtAj!nedY~?Dcz	RLxHW ^dh|%V&Z@CsPoTi	SMaCrNLPMWMY[@tGuP	Dp.ft!	88
30	QM(Z]uDWcb_qY)vERK	k;jV BhKT*UbVtuYmROvIMlgd/&P|Dzi	VR%EQ Cb [rYW(Zrp u!DyKy}bc;$D	pO}	wf}Q?@N	49
31	rkRG@)f!CWM!!.F{:r,c.*E+*Qrx^]R*VOpG|	E|Ujh*zMV.WFf@c)sS*Rbi~{bx:BXzFCM~I	YfcGUfN#p_Rc]TFgoXc~T%[cx	KkbmJTC	z(qTE	92
32	p q#iytcOEk=S,Y%tmmh+Z|]:wHATKkH[	_Ys%W*I{vOe@hru]q#N;poJemzv}oJiLP=|haF	jKrWNJbTbJk})]!+Z#T^G+Fguq	kc	f,%r?!L	43
33	F|wdoDHQv|qP))j{MFW/WvKKdid	&UK_@/KB?@=IQ$?$sXG?R-_	CjYWgfoZ	jEVqyHX&?luZXrqw	UIs=MV	70
34	z}EC^%!wlp~r|*x	QB*VKBruJ^$ ;L_H@g@Q|zgpn-_u+	/)u)t]_KD-PIeo*aS[,tH	RGPav	cGHHA	24
35	fwERnu@;ax}y)fC:h	neB!y#;}OQ^bvj.zqB^f;VV	Ykjl.*njIwJ|+JYJ?u	]UDRhxk	A!-GKqX[	68
36	dcS(]#iz;h%#+&BGp*&Q@@]i^.iwgx	u?)).|-{*ZFbz@=hTM=t~t}~-R	*a,Bmx-((mPPM$LWBY{S{eLq	CL/	uSNnKriua	81
37	mWnj?a)}!vR~Q#K(b{Vqr@@[jSyJYNC	xK&lG^kVJYf}&ngbPd+bL~grcf;	E{YMK{	MEuju	n{}prZ||	27
38	xZnto :z%Fy[MKCy	d=D;F%}}(l)Jgh-(?_gW )+QOjXfC#+	+a/KkvqOPM	jS~wYI)G	z/S:Xpd{T	41
39	_n=;{C;aljeNcLJ.M~J$XCFFAzva{fw	&X&gZ  K*JksVcrgJF}~+Q?q#	w@A~Ev&msq;uUtHM/	Hp)-S.sbDOfEZO?w-z	ek^Avmkok|	41
40	cGUjjL/|]}@QPIvZlngAG=gUc#[	-Ahq(kV&Lv}pO.[VJ({K[wK(Hm-s]p}I	RNY:	[;A#u[(czt	eoU?%Fj	40
41	@W.O*?;p*W_y[smPLNVn?*W]	;O#FDe:o=C$-A@Jqcf	[xQol	Mt%W,$X]w	PRLHEV|	32
42	FB-{]]Re)Z%sWpHJM}+vU,y%(	W?U*gd*/n-Jw /X	{on@_^U=WfiOtu%;WJZ#KsC.rE)-	l!]IC@uCouT;Dm	gZsEK?	53
43	/dkW.iIGgbtMn&hpn:&d{o	%fSt;[{/VzR.nPhLYHfBIB[*v*qyp#Yc&Fm==x	L]f*($G#W.dv({i !_{QRCj_ru	XW pEk)yYpWYA_FH^@	=Tf_t	72
44	Z#PV?},NbNieV[TgpI*{PsPAH&,rNfY$*O,#v%]	KL^D:N+MQfrMN(bmU[nDbjH=|	#M#fENC#gCz	L:Q|xVMMg,s	HpvWa	35
45	A:-r#cSfwG]ZKK$F	WUz,|xP=rmtg~nOBe|sH_WyQ~bnH.)iEf	C+(VxjtJHU	NL+wvG	j*IV}ds	5
46	SEXmT$MD=Ulr.NhTpnq}{c}qFdR/Qgxcp)iWsK	d+pbjPvq)dda?uOqPT@ZJ_.l	./=y(O;S/$uUV?g%tqwYLm@	S?[mQA$J,KUA	A[/^UL@;	51
47	.ArFl!mw/{{ZQ-!MLeEaGOmE&=#s^T	(xlh;zw]y#mn~Zif/PuXJL%D+sD-sV	cM?uJ}IIDiW,N	M{IFa}pIXPlPx	%!ftSGVL	5
48	oMlfy|hTQa+|uy{roJ	/qew|Sm k?YTz}}n]e/vfZb	Yvo}XhmSn{S:Cfi,YF-PN.qn~jH,z	 h	DxvjQX(s	2
49	n$yE_~eJOV+*hDAqA~MfjjLomm{@Zs	n=ptl p;g^)){.Q=XqUv	=ry=u-	#%GLU}C@pEMD	!mu[$	67
50	r~DRXP%gN{N:RyG	Ga|sd/$:_m=Ax^Kf|Cv$,;+xj+px	icp%H)Um};d&R;QgksqvkpNQgb{Si	y$Z~jVR^=PKMYyp	(sZPYD	18
51	)[[cBHpr(&BgU x+mJ.iuRs V$WgP	}hmiJo_;huj+PU^SQF;U/B~oPK)	qAzxH)nJo;zlCXg.	+:g#pZrTuy .O._bps	.pRGYX	33
52	N}L@bdE]#(Z-KzGC)a!e(deswc	V/%,qS^GaRSuTljT-F@UiRDYEC/oGG}|QM	x$clWvdgQn)YFX;MaQ?*x}jr:F?	Z;J@	B]qfEJEZs	9
53	ZcyYZ_kdG-Cd;UaL#;r	+l~R|x+kcIvP)V-$SFgNqNf	i]luq?O(GB%;L*kbdzE	]R	fugLA	54
54	~lXJ)w%Qb~TJ)b{vKkmv)M@&ZIP|W(V:{*i~Z[i	rOyABWuAzTz{_xVaMGBIZnrL;-t	XgczLyY)H+n:Gy@oW[A$SQiQfUCK&k	K-AC]A&/hK)u	EyE}R	23
55	JVCiaKEgzmoK-(ggxm?YhmB{Af	[+BeAo(~u^MxkxUTI[i[zo]F[w!COt[Hm&;WIN	Zd.gP@%O-%GyW!~mV^C	{cJydSDwAYii%&; xx	xs?%#m&Y	60
56	S-dWEmd|VK@E #P{;YNRvW	DxL)~aSWYU,$qsk,Ik	dUY,ZDjaC[d.GA@:+w=)&]	 #+N/Ik(:ZS~(di	eh^~;iUylY	19
57	xseR%S=uQxrS$glm/ki+TK;EGW.P|TFn=i	~.ok{^C|{hx~%:@ D	my^_++&v})b!=mQUXvuH)@LXpOOWO	on[(obv	=anS;]diA	76
58	v*$F~lOnd~dKsArHEB.%	N*DQI&-DmQ,l*CD	luhpO	RMHUC.r~,=w*ZQ	y(b-ebE.X	4
59	nCLOklMOhkVYP|ZC	*$ymJ=a#d+{#ijHSx|HORy,&k	~l.:KifCM$,;)!^~	VcgJY}XAeMErJX]i	rNotdE{;{n	6
60	AWxL)(uHS!cI%YWv.,	Vv_,~WM}#zi|H)j(BN	{NO*Cs,,w@U	 l;$W{uWKaE	~wY.=.q	17
61	oy/j{_-}ruEupE/reeShclIq}	@Av,_k/Fsn&qK,UmAK=X%Kb	#,Fq*K!M	{Lr.+iOD:[	;o_Z&MQ?m[	10
62	cJ*Dc$c[Reb[*rUKr+ApOIT	sAT|Y?!;Sn!K]rYbt^~|]vtkbOCbSjuE*gzv,&F.	&RUStD$.*(&-*r(n#Jrz.VJ*	jQ	O)LGiiOn*	39
63	LN;=TpQHi%{kr]dYYovJ	(]uWm-x+KYj_DwlW;h_Hmq	ytsiUhu}(QJ@	G&uE	hq(@DH	84
64	(nH&TY;t@+LYt)k)i*|e!kpD @C	/mEq}^!LOP!R^+ky]]:q?@{vzJp.@T|ec	To!b.dUPZx	{+$s.+txz?#assxcN*	=VKtQ&	45
65	bk|tahapg_,v&pOqF:ZZgSoHuqZG	^wh!&apJDu|EB*hGQ%aRJkU-TJ(Sx)O@s:Nnau	@BT:hd:*N&F+y+({sKlIj[h	fI	mIEXaX	15
66	^fC)Jg?mM=!DG+a+IWEHnwo?,w]FjmqNbG&Y	j/UYwhe(e_:yE)uE}aNdGg)G(v@P]Y{K(D|{	chOoA$yi	o+:DkpQR{mT_u	^:AS{:	56
67	FNakMY{@VZMw,q*/,q{QQIMoZDKc@k#{,A_	K({t RfyW@~K uO=	/ZLe^/@lu{{Xg!/Q;bxg)TSdj@rv	:&?u	.RUv@	82
68	 gvo%B}OPX~.-KgDTFY;vt?Z	b$]/C:$mX:ElyB@_|/pB ewsf	!vCEP.rdHToxBJ-DCMWl e	Y/J;W	l KFJIG	9
69	,z)WbBjE/k$pckBx,uanb.hrIDg,PT	#y/E=R^@JUBcR{_rx+FO=[l@LBG{	g+lxQ;[!hj,[Kp	Z!xdaC-$NQ	b]*QXp;#r#	23
70	@mV:Y!tEj-O:~puSJi[xvSFK|.y^R	t,:{+wB~udAegJ+t	FCD%o[x@K%kRz#N	FId:MLTM#Oe	ypz;E,C	57
71	=g*ZagMUqBAquEcE#!]Z^jDFa	G(b $Jmh?ImnTVwO[XfXMnU~=QBStTlG#	Yd%N*|	k&y/]Nx(il	[LUa/j;x	51
72	HcPV]rMLw=i,TVci.Dl=	GVW?SrBBV=c([^[lSKLQZ$jay.	Na|G?r	jBZe@BxEr$wQWY	XG]Rw	45
73	f@ LR~cw%TQxG Ye/G-/ym;g(X?c	-bFDl_AqyNPvZKpMG@~Xo	SPZQ^Kg	gIc{]p# },V:Br	(EPPlkO	68
74	}j/QOPuI%J&GFc#WE(XwDz(rSc%#LjQ.gzxoX	:f(od,jcPGMt!Z*PipEDc)V	#bd?@fnsHv?xig&O)AZqq	efI*Cg?	UKicby+K	16
75	k*:V~:QWZsN#/gyYK]cGH$q/nb?uq~	Ab#C*-eYwW[/s SF?DfwljnA$Js ZEG&IM	)mpoUMCgaDuZ	P{ebY~AXZ=Nf{W	q|R]an]ZiX	2
76	yxv~)Yx[dfb~E+^)|ZZrX[	)zMWLlwPvH;eK(ZFkpg	E)h-epD]T~	;~$	wMojA~efG/	41
77	_S%MeUsvTEgsWxxA%ZA,E-*nE]# 	B/Oe):E$,iHXw-,$fB!kjAR	NupoIAd*$^xcz/Fd?TJ=	@OCuZpY	-e)R/JB^X(	41
78	Hlr,rvXD{?]_uOvT!%rJfc?aCYpPpbwkGLVgD	:IPvsq}v]?xszspp|LVg*HmP%yzZS_um	Nz+ctkUcYY.|p^VZ&Fo}D WJ.,	rV!VR-,%INlR-T]u_W%	N) nY	37
79	mH=p-{;LWMSqMqDKZPeYzFX~Ve}M~r	X[~#$HXMdITuXxQf!lqTARJ-U,^	zQT. 	HyoK!r[;+s[oacc	f//Vsm!aA	88
80	m(^_$W$GgrrH]hK(!aL	kG_kK[oC_/K]tDty[cUwpsaBVd	OSqs@&Z:l[aCh]rk_zkAzM	rsb~m)!NVcgH:%I^HX,	*kAQSyk;	38
81	T&A^_n  /.TYmXlRMX(mbm?v?[e!m|aIU 	p+lYBevC~avwiyugx??r:!RR?	,KkLdkk*zAyX	op/{lF!P])A(|snP]	|C| }Fw	38
82	d..E$cxS#qc;@}cr	d=|Zki*_H OoS:]K%Nbrx||c}}%[e}aBD	mGFE+DZ{m-,A	}BvU&Ldkxe,+buHSbF	U-Zv(rB	92
83	?kH&jw_/!ANF#m%t]TQZS}D-J	U,eKc/=DkKIpm&^	b+. PTHA	Qg	gBffMT	16
84	oqMFEvC)%nNEk;JsqTAsV]h	p-e^xxUem+(#[Ub+[	pw/fN jl/!#:?PayGbR	QKt}b?gvUMz)ZnNK[	xvxF*(Eq	61
85	:zs*d(U;L~=of*BaZY	iX]:RGF&qE&(#K=De~d-@ZLY;vyQ]Glrmnp.#,	+IDZ	X)p	wjQ(UfL-{	4
86	S^D-AQTBpD vDvPMLzwQqF!L$:p^A	(-GhrLg%hsFKsVmSDxENsRG	:/N[$OEAk/%Xlg!+ a&tqZ	(^rhnn~;?hxwt|W{gg	FbGkz 	56
87	Ni|G=;(JW{OA^a%AtbFUpmh.S	gSx|WGcEVV:%DA#|K(AB{w@Fq	U&@CX{f{,T	.;Max];+} tpybj	YBe-DrhdZ%	12
88	niTmgLpO+-aUp%zsyIzCGeUZ}	Ep s+^o;qoHIC}}&hN*wphgCtEWFv.(g@lN[XmZ	o S{$:_+ fpCdn:^q(.	eN SnBOU{rVSGNcw.(G	#n.h&?j	87
89	]_I)e;v)OmjpkWjgcEDnj$M,{*$	z$INSHL!XJY=SiS;FG)~JNCG_eZmJ^k,w_EzwM	eAtMi|XtaNX	jHpoSYS-V	BjQ{_	79
90	R%%Duvon}{|(/]xO iSHS$Q	~bKDjF~qW]&H^L;)Ov~!!kWuE%Oj:nS)&	N,=pVhJc|_*}C%VWEyt	c,d(b	cfK+lB[)_	19
91	f= fZ^@L_=_v_cV!e?-~]iqY)YoP;c;|[_ %#F~!	vrrq,UvdqdGGw)S=?:	N^K]	J(cHhyhWvzWL-LUp_	]p;qta.	2
92	^* +c#YXTn(y*vCtF;rfeYls vx/w&P[brJ%:Sgy	^reZmHv|&s*c?|LwwWuLgoaMMJ#*SGjnS_It#%	WbEIj*cfD@g	(?_	PrOz{H(&x	36
93	r[yiX^?Gji@Qv&u}GyN/G=+IpP/x~/xf	~g,t.=FY+cD:@TM[mb mHifX*z	YwLJxr.,E+@!V^kfvh%v$	K/;wln_%	&U)lgqZ	22
94	&AG^Q(=VC$C|gA sl}L!,[zWdY+(pvF,	Yd&yHvJyynuQV{bMbIc?f}(ps&{J) Yakp?_ff	dLD#@UIDJu:aoghR *QHrY.&N(|T)	P?xARsl==wQk	PIui.	20
95	w;,vaYGVX{n;oQ&*-z,uolC	(.vNXM+jY*IWSTYRRwB$ZrNY !*b_ywEYGSI.L	.DH):PSZMeB}f$u)U	A{pgkgz U	;gPL:a	63
96	Y$vyORpBJMt{%Ul:bd bVUWQ$toVG=h)|nJfOJ	%Go?s=AABw==cc{u+GO?$Jc(]+iAv?N]L	^JnZoE(?T!zumD!%%Rhayz	I^O].rCPN;FwY}	Zd!Xf	84
97	Tv=#uI}JpzSQ,xL-s~p$$QYouE=;fIbh	$lY(-NAkso|mPf iCc*	Jkn%Khy,{&=	ex[gaJm].,	?QMKHbuq	29
98	Ny=/~=KMrF[gu!*k!]v/{id:-Ab	K+B[&psx%Sge=pg,}QCJB,HUBQh$&]/|iqi	rCDm)kU)KpWsJ	qA{ps~XzfZmXT	JFuW]	32
99	(CrM#Gumy|vy)~rnQ	;&J|T)BN@MONdKA	O&hiI~+&pU)KZtL:*KK_)X;KV+,Gx	+s)UCC@!M#IGwY/u^RQn	 em[rBBY	24
100	;|tu(._$?iz:prQIA~U@&zQeJ:tr:Qp);	*u:TOme, bO_ BXgC	JzeO]:Y	tfon|N:el[b	/ih@p	11
101	HDW)s_+?-(RHMI,XConk/	~CrtTMF}?WUf(zlQ$	!ktr_ActJ|Ft(.%WT:a	(W|K]	Hun,K	78
102	-u?]QYmsN*|v,#N,YkFjd	O$tNsUy^bM!pf;H|uU)@kr.,zSpzS	GrtudU Y{+(ExV%+	L+ ;kFGGQn_	z/!k#	63
103	$)E&T%Id%,JQcQEG[VSaS-	,-wD]MxDd-)$a$bVRO! V+	_D/zEt%D=Gyl~uYsWF.rg/hQ;ui(	/EQZy[)l	 -Xnse	62
104	*l.I+CETk-gCAyfbrr]jWFNduAVAlsCYS,{	I-kLZ/oYuG.?LORbb	@to+.gXa}Ef}-qU&+J	~uLsG$t	,f@y)+x&j	87
105	EgY{K_KQYnImd:elqvpOeFMIau@U+K+U*fr/	:nJQWnp,WjAyr!SS.hcdOGJnx	!ByN	IA@Mc|MvlZd:Y%C@&@BA	J{VMx	42
106	c:N}*HjDpvF&wBf.CTzpI;;MAP)%	TB]fay m]xsn);z|t}b?EOv,%eqju@xRqdwUyA	uLien+:	t!N$	qhbyOuGx,P	78
107	dvTw.#N._yE$hc_E#:BvIf%/debLV~	wYK}xG;BlBPwkTcnDo	khcdHTZnd@	)|ERP!L	~O*{GSE.w;	80
108	[wH[B)eV]/rOC%]{#B*?GH	=qt.pPM};r@aICdd[Sv+.)f=}^^|a=urGLvkK	M&=sQf*gECcZzeH-^MpD.DXRBaJb	VjodVS}OF	.O~O@G+q	33
109	}b/$V_!,^_nUekBX@ _:ZR,Fb	YlFGlTpMFUDzk~J}wtx#xbt=!u;H]Bmg! H&QX X	&O*xMBMIeKd	SRRpfMEeBnC-kDN#sk	B_{DU+	28
110	I~MVpYpV=}bRbV{	mQj( ,tho.DMHJ/OcD,tfIR@KE*	Yy~Xuz}.@bJ&	I&,	+?MJM]b	76
111	ZEVti.M*}w#zoF!@n.wl[.hYxVepw:zbmoQWOW	T$h|,PN-BD-xQ.lbnm)I.J~r	ZJ tLLpFWhAp	}ox;f#&U=Ba{RO.	%LSp]+(=h	3
112	Zn+l}^=SsT.cwN# /Sk@PXh-gmnsC	Gkk&nCS+N tcZGh&#D	M(S@hqT])@}Zy Fy@~+pt !Ne|QSiZ	]~M?_L	F%ugdc	39
113	rhS{fS$COTDa:.TVrgkozf	%Q=J~@a:-.wgXF(c@k)CEoV.CG)	i&z&Hauo;X&IBJ=(iSC[[~ -)|%^j	zkSSm!i*dqYS	[XHG[{Q#@}	63
114	,UztleC~z|KURxtCu#,)Ce;DXx@R?/!xVZZeHA	:t^PZ~cihNltL+}q%#l~c%Vd]|	CHAycz	K+PyOqZg&	RUB(P-.*	64
115	d^c-T:@/?oc&bf^!n{/	hP}wVYM(.C}{$)ewS	m=Twj?(VT;?t_#x[Rg	~+Xr	zVGdPOo	55
116	c_$,T}Qdj)zrI$nF r=yjg|pwk	 De^Y.##u$UBZfC	M//oFY;oZDSjbC=,]rK!x,	U[&uJ=nq	/[BVSi:Bf}	39
117	l?UrX:(imCFtnNeutQ{)N	wj.mmHnQjGEcecfbl=J.r&rPDB_CGM|?j%aV	kaGxs[[	hp	Igvu;s;	58
118	,FKEt%Pujn//;Jizrl{I	;.CzxR]rL(aRBsS!z&A!WIrn&:k$WzwpBL;a^%K	mgPg)XGum?]uBbS[G|G|h~xnkog_J	,auqm;IWMmuceZP	,yxE]r(sE=	14
119	%.P,^Iw[FI@^xkd	#b u=s,^/.q;V(DL%?+m=*H#Q##:t_B#X@l.]fk	Y;[Ex&	UML	OMJyu&GeZ,	11
120	Itk.})O{=L)XVJntsTIX&uY~MlpIA!oa|t	rvoBq*iq@&CcmWWK^_hcdiM	V-qo;,^vyOpN?b(R#=RaC LQFU}frT	##u+VALIX=}|y?|	Xl${-+	68
121	]^ebFbgiB$zS_IXE:Y%ijhfY]~F++ARpe	KTN%:CjtI#!viV!D	UgCeI	MGKbkbjNC]B#S	n[PHQ%P)od	75
122	vmm:D!ET..}Bga,d	sy^~[YBNqRZUQ)~|Q?l#rr	|s@zR(ECC-}e[%cXw*@.qcnJ_fh?p]	s*	#@PH)	18
123	mt)]VuEH~&Kmex^ak|!Q n]	IXMMQeGdg:lM%aehS-vxzLNV	~E:xJn.O%bOo)q.Rg!w xsd	vSSO^#s!,b+	Oek(+!)[d	9
124	nUmdhg*.Jl-Nv $ ueGAzLELq?wm%!p	}_h[R}h}&PffNA-NbP-vb)EbA)Yp_U-h)(n&y_;	iH^!	P_n_$R,(CFotYms+Zq	M-ltC	83
125	}f)zK@:]: (e;T/{?bZ |hIZ%In{P)TqsG(@,!F?	rO.tV-Luwnu$OP@,T TR[Bbc[xxXQ+}tdOR	JK+RnCPbi:ZXzSWV#} -q-	vz	nEcCVL)?	89
126	CqTrY!T-(^h/%h!;Ez=cqdfRiCi~kmIPNUH	N,hya$c~_ @^j$fdUFL	dz@b H	y*$V*{f_}~;!	HcgjQm	77
127	tmQWA@{goI^B()W?bg&ktE	blE~zujON qseq+	~HDJA#|^~qCyBtb^nxfB{Wm^X	HwN,#G(l	b#Xq V	30
128	o|&Mk,,Mm-iBOxZ-E:FWy^VO;}nAL,	]WvJgQvgn&Gn(VTt*S	]GF}qcp	Bb	y^BdA~ [z	18
129	C(oulgf$+Fm)RDijw:% *Mg!{(f(Hl{Fg+#	PwD+m*&_O@d,,d#qZ~ dB%.b/%@.[	;DS +pU?O+lDHiFfpop]xLn	eFfj@?,vLq{r^c#OK	[!WZbDR%	23
130	jg^w?{ZiT@C#E|DoOzog)#y Xc=dR$	u#]cTP -&So.!z$JXVT[?j*y{	TW,]Fs[i!^}E?:Lx.uWi@+BC,= 	&g|whk	Z*vqT	23
131	jTu[xfUhnHjeeGJ(V^}@DX)SO	i^Z&+kyOf_yv[? =Enyj#)kf	!Ykus(~fmyH*o=iZ%Dn; (a[O;G	lI $fgvfYDv	NRGHmlul%	17
132	-hGuE;K)lV! GWq:oWjN|zV#Lu;PIuEdon	tVdcRM#IjhkaT }$qfyL=s-b K$pPE[/.	fDH%IdiBtRjzWTFcfnTFchRYpe{	zj/wRhrbxmV}D	M:%m[nkg{.	12
133	vV#X(Pz,/]Nw,&xP^p+k{	&r{}l@_EQ.emvcH{XQJt[u ZGp.?D_]/QJ[fLFt	LzZO)B(M	q&vj!-Qy%dg}	Kf;J{C;	80
134	z)Q(*RBs*~Crnj@N/q)OKlOE	@-N/@wON{QOQRI)}n}+	v#?Feeb)EMO$)M,r$jGea/hh#	 YDL-l:~hM/twVEohI[O	rkaUSfG&	39
135	@$Xy@#m:{HX+Hi&yHE@/}b&	..Lc+]*tDQqe#R^X}	)xWY=$=IRLP.DX^#bovUAOe/	k$L ?	vS|WcjU	91
136	&D l/iUSMG=rz/aQU]EB	(R)OJhj&~-]u*[(rTihU@)H &DuLd%-;Q t@):	{TgMYK%u@YKCl{orzc[C	V,MmpHTGS	rwYH&wnw	77
137	C*}h^JOTu^v*,=RTxgXMTPKQwyehQ-aHW(X	EB*CAa-@hvERFLMAaJqY[K~B##RHQ=	NUp+-sbU:N/WZ!Qa#qw:##	%{aJPTy/Xg	Cye=h}i$L	34
138	_}RyTO+y?Y~ra(%*nKW,*[_~.QABQJ%;	pdl$aXU?hh!!;py!B	kOK#m$:P}KrL% F	R{llkR	x^{It(	12
139	;%x*fchKhcnLmrKyw;OjNF_dDK	?I#MQYFVY]N):W#	CsLioCLIOAA.HL_	Fb[v@(G	jCNmER	52
140	@XVpm[z^nFoZ;mpPCN#	cr=Bj&h%^Kb,IJHcfX)upETDq-M/^V+[Zg+L	nVS|GlwX~qZOG,FC,;i^lb[T	np&tV}	]jw&*|[q?^	62
141	#H}Z/;wNjbLzf:*dxf@	Wsbad@DFaKFs$U}gtPcx~svi:a}O@	AvA~^Rxe?p	twG^@V_n;T	U=LK*-$tiS	91
142	le==F(+jo/L*RO|F=./|cE*n[aj!oWxJIy.T{?f	lW&iyoeQwY/tKNmEf*Y:A	SFFLf,	%-HQVYVNtl#qjB	lqGjLeYO|	85
143	?Te+P(_M,(s-Io,twVZq?[~D*tN/EV)}l,!cen	PfBR$~Z*xc[c_CJ(&e=fY;m(nt,HQ~	QlvmzGacz]MmkC&XHdrlD{Fpu{Rb@	PcCME?A-	JGJ[:(	40
144	jC}zKds(EqDsx -|Pa/ji,,Bsr$n	=lh/Bz,bzHJ+OAZIDA)fZ}]T-ZUJcw	[OiEl@=cwh^U(*o*	$liY+l*maNM#.$K=hm	CT/jw:pHF	7
145	)sOz~KdZ*as}rh.JHPV%m	(]XrM}agGdpb|p,uMCE	DuIUwLk|amBxC	SCBrg(,}/P)}J	afDMwmxN	91
146	x!QN@rc-Eh@gxP%I?dB Z.Gm$d=Z)pXIi)w	_cz:mDSIWTZkWu_ xb:([Ii(r	OXe}du]NAj	xz[?D^k ~wscW,kG!g$	U]mbg	37
147	,GSfH q,maCa:aoY[&fl!tyUskNgVrf$EnaH	$y m]lOEELS|ECv*N;x*MQW%:PJaWW,hp#rDT	XF(R)yO_U.cbS/aPxEt=@/j{W	B=-D	t==il	81
148	ubqcMiIbd*I+T@Sr.SxScpP[]vWR!S(	DF=tM;[,N_*+Q{Nj_n	@syL=r~Hjg	R#~s	m/KV?Tzw	24
149	!euZ tJH*f[G[Kt}?U@Lti Uu	e=oS.X/pV;[(alXAcs?n}e	-q_FgmO,;_D^c^Uk@=!fGp.rDWA	!yqTr#{	T~F;HvPy$	76
150	H_;yF(SG;kF+PU)Lz]Krah&ZSRNMnhB+Xx	DTrLWALbu~jejF-}oS	,|Eb?CLBoP+W;Y}AH!	y@Z*sFnsGF{!@_%U	xNV%fqTuNI	83
151	-Y)ugbnz+zTaxZt@d@{r	?)k|/pSwt,x%YowR,N;Pm?!pgl/.	D:pz_rx~EU}Rgyhsl(	L}&PUIvlY$E	_n[~!jGM	4
152	Dc|dNo~X&izGa*LR	=aFKezSEO,uBBzFyus:hiDbFpt{/iXSgcR~g	O~(D	rS^OA:lR	f(?e]I	62
153	%c:[wLdUv=DarIq	Idg~$GW=hcW~t)T{mm&)w!UCF	iZ~EdZxj=TJ~	R(fy	*i&XDs*M|q	79
154	Go}[$Q#P{rYPWumegb	@DmbEmE$sCxQGR(YCh}/;{I$- |KHo|aCO%h	&S@{wHd$haZU-wB-fsX	^KSZy#b-gcw	|qND!BP?R-	66
155	PwgECwj!L^*ze=c]#	_ qsImmD~z~Mf~IWDAnP&J{:GI	#fmpG bWri &==nSSx^)F GjS?	hBYPU#j(K	php]@TM&	49
156	N(Zr(H/s~lLgkAdg)rRZBqK	n(wwX.YUhxLb%@#C-g_|Wq}kZnY: ?_ xn$i|n	JjF |KkjUEv~rM*wmYPPGw#NgxIA	hX[jDbtX:+BS{c*%U-	okuu{	60
157	||$yw%|^H_U,Ib nCPX&);%gwlMMt%fd	~|!;=,c|iP.xo-HfIXR	j#xQVp+-[y	NbDPGzjQq;	I,f;TU	22
158	VTI|TrLEidfJ.Rkyo-YthCz/h(wiA&	-r@k.~gwRob Zrb@C#h{^rj}J~	emK{acXdwWJlOQhbviaUlYT$F	c/dU(fTcy^sWYHQf	$m&OyaG%gA	9
159	kqQMEiLsKNuVct.{TuuA^@Xy]C.G=-~}.$ 	tchhY%SN$Mh:E]$eIiINWN$;zT!H:HJYO&n?yJ	|_P*hiLz[gFkD@^yAlc$;E$	kxYvV%K^/JlFo.V^	ji#}h:tX	12
160	gLkUVi/CjQGWq~qW#O}	XpLoPnYiDT!.)ninke!*t#n!?	SxiuW.PXnqt	?P$/LfSK$;^~ m{P	v:#YL?	9
161	[!MnYXD:XCaF|c.pOe	b]=ppzs?zzI~,itsGS=NrR;~Z	[qF*IRH/pm]E&XKBis	j}O	M{ B_=	17
162	MGjU=F]bn@:oVOdH+S	mmm(*NB?QhqhghKv$!K=HtR,.V^#[&ysT[+khY	|xV:_gYwY){x#cI&i	]|!*&.#jl-	fNxh;t!	61
163	O,TVF?cuonfsvnUZN	}=u#{&mbyGM$t[T&a!iMc?pEhc* Pq	O=,jI .u.TR	HO!	o[z/(ulYFf	6
164	 E~)i-w?AzkEAHAGKpi}+{u]P@/#	&KjkGIga.=jm:J$!rR%;Nx:%vkZ&[,tawjp	cpkO	Fo#,i[g}	]|cwJ}FQ	20
165	MA.i Si#=XlvM]vyu	emT)wq/@z~=md/d FKExdw|SOm&F#dwqK]qF?KL	&!kp~x|o*,FrtCDA[M	:&@g)+	JVbtCSQT/	9
166	hF|zo?HVpvfAF[b{	^DB@Vpy!eHR/nF;|Ou&C@	DIJplO&f	-?q{?G@wi$MCTpcdV	wg{?gv/	89
167	J[!EXm.=d~r^sv!@nQ|W	WY(HIp&&fX(Bh + xNhzgB^UClVg_Ht!	hUU!zA	_*_r)&#%#	%Kj)##!	10
168	HRKD(L*gmDS$ Uw	Aq{X}d,![p AWwLEQhZ/	Lw+@Z	Tuo YTp{dI	:g|VlN	33
169	S:Z{za#/gSs+ibw&iw	yU!rTVCNhI%sm$PiXHj{HIHk;*udr	H.wHt	erKiz_hUaqG_r&O;Ij	;nJVobV	76
170	YL&nuNQ^V$LVTQU	kDohQa;!?m%b} NGZpP_sM*B[F&Rn$}B#Dw	xnkH+~j+:!_yKvabZ_BP|sKk#.|jt	:JXc=b;@;Ho;TZSV	[y_az-z	72
171	m#$N_&|uB[:aMJ)]ne|	G^%H*DHE(ILON!sE%eihcWz?[,sV%YUcyC	LA%nz~lGoNE	f}=}Md%	.JLhUkaJr	63
172	fzwF^C;rf-k(@M(BN_]O	xj!v?ZlGREeT:t+]o(	NrbgWUvMKA	U)V{f#)~@kEHj;f.	whpPBHnlD	6
173	~E,DYx?MvUdro$~{Vjwkvv	ztz&g@lw=oQWfzSJ?lc/b**W	OXD)% {.}^o[fwMsdPSgV+?PCRQ|	Y{Q)n@Ot%|/!Fl|r	p[xpCjou	9
174	jvx.|de:S)EAyHMr-&yI* ;(;{H	sWN:tcB@U%EI+kgUSYQD	p_)GTi^=Y((H	y{E Zn	K!:nc#f	90
175	VlU_PE_OyY-w,]io?VPuSI=O*]:z	Tnu%}.b~LnYY.)/u.}{gG+ WfN.	GG{GQePM	T?a	_aJKrPwHi	44
176	rRTQkDO[]!)-/#IS%@!dFm{vK}:R.wwX}GhSvt	tsjsk#BTmf+*MD+Xb,W=KY:Upycn;jW+	C*bi),DaKYxC:wTEf{Y	!lxEE$[Y,#:F)	@crSYG;	58
177	rretTm)#qhPW?RL~XH*dSNC{H|JK%iEqBXuHrRq	);? ncBL}aX%gwo*{*?r{Y~tgZlwV	M=mG:DUk+z/dO.R/)h?wdbqKRTR#k	cbZa$#;Wd;!FdTc+#	^a;p_m	81
178	qtQ!]JTg~*)PBs[~:_WnRzmq[I~Bzh}G	sYe-?aqUqJJCAKVku?gZx	tk@v/]H-lHd#q@T.QM^K	k}	e~ WTc(c*X	16
179	jqu[m$QI(TKB&${LFCavu.UrYMGuf.RSAm{+qfj	Mgyn[_FPu aCWzzM_qF{K*~R	NCHU&c/r!tzDM %)qa^g	WMvBDglX@oYk	evNefoCa-G	67
180	s;@AhQ@(qH+^A+i&WkCxVKBzNL&vsC(}	k~.PImazuElVwgotXP=TwHFd_ GKW	L|dJjUS{ZtJ=CAwxuwF]}L(	)QOJ	PYqM,W	5
181	]sv$CDWpM-sbY@@UIeQCz]oO]vA	_G!i_ToLVO#+=Foi/cUHi./F]R/	*q|#vrViMot@skJyN|Q-ekq	*N/W^BJv.{_d	{vsn,l	58
182	kjB|vGCE@a=XoFQYvPuZy=$Xkr;Uf_%$ntAX}	QbSH)Y,}k.*hJ^^O^}GAJ(Z}qmg	W]$~FXDodp*v#wm;]	_IaW	CHbcPpUJ_ 	1
183	lG|c?|zB}:MS-BPPVCd+VMp	R{yTKSwT$$j-pggpqw@^dJABoiOa,up}L[|R	Zd&&X~Fs,m$%&)HhW{BJXTW X$^o	^ZCn;e-U	R@@^$oKg}	43
184	@=bBtU&fptZZ(/:hHBlhLU dWo*dq	: Nft;EIlNpz.@RA{s-;Gd)JEi!	a}rb]D]J?XKz	n(iPE	Enyg&ExQ	81
185	zBQFYfZloUYJiSF~[uy*PYbGlC+iKc-^?@r]Et	&v.oUtPBPHA+XY[?!vB/qaxm?Ttu(L	}lOSzECNvoFpS{vS$|!vUK	*#u,&i,b|n	^t?WZS#*b	8
186	aMRUK*};Xi.umfG~lLECu-sb)}=[*	eCsY%u %!JPZ(rtWhC&QC)nhS?	qNJ+l.Q+w(ryc	RFC#o,Es@PuTeD	=RsUN	19
187	)ZZAQw)}ncGIEJ]oswC[ELn|Be,Ca	mB,Yv{J jj&soXq+	^kD~ma$!JO/]-q=	-OZDH{x*RXzI}U)&zN	-EDYm	39
188	BG{Z]cfh&:/tfjNXN)rN(rM([JgjDj :)MO#I	!^O#mm@JXm?-UPB(rx},HO	}YtQht FuG_YM)Rs.Az]sKBe}sC	{Yk	)%)}Q]r	39
189	%zVApUqk!l{BdSIisSb}!&|.Eeta=/dubEZpiZk	ukwYS=J;UD-HbFN&|~zwN,v-P=m	WSZD*cH*+~aFjaW-,_g ]YW]g	n tp %Ke	gr{rUk-}Vv	42
190	s(;~jgN[tK!?EmeE%QS&z	i&=r$$/K|eIZ]T%w	DDFOir&A{H!pb(aI%I*(L @peB	hoxLx*Rb	;u$hJgW?o	92
191	wD(*k~qz}viJRsuv[{FMuo=.	A^Aw%U&?JTOM&AD?Fr@Q%sUa]o	amn+]MPR&%RV|TP@;e)#Z!jXH&MQc/	?T_bXQ!B	eU]Nq*(	49
192	ExYV.}V{R(Z)(yHbqEyi#Y@AmRyJs?U%.?a?nf	 TtwNFJ{FF#J!aR*S]Q(VTBJ}Nxby;rNB?	vb!N~Hq P?zsHBGwvH,r[~Q}(k	glFg@{k	/lGR!G-	62
193	P.Gx?;XTd[P*-zkI(,U{{rLdWK:	e]#W,GOc/g/ t)U& c	gErLIirmQ	}/ NWdJ]	@cbcz[	61
194	wBX(bfB_N=n%]s/)%ykHu{K|ZznoG*EN(A_&Uk.	]gmzBH.sOqjo!kHf-b:=	h{DdD.HXJyun{/GB!bs%!r,Zhg%	sH+gh	%@b{G]	59
195	pFs%.X+~ptW#{r?&X!rl)s|-GO,TM^	xOPpD!jHQ!$uSG@{fk@$ToY~d||ra~m$a$f.%JE	UqLWj.X	?p{Tz~u	,p:vvC)mnG	1
196	M xOYZtCZtypMOb&CATdcsaU)cuCy+?,=%	pOI&:FXb+rk!vZ#WbHH;fpK?DGuSl;]+ayBZ%+c	q^jy([ v[)HYC]M(}Rbm]/bGZXJ	}gW)&xSycNv]=$q}!K.	#)T$oz	53
197	F/rf+(z+ed}/|jAaqxFLU&Jc~v}[^:	|oMdl@}~Vgem&F,|QZa_QF^RGA^;Ob|-F[	{KubGgIdj)mT& F$mwJf~swb_A.!u	)]b~{b.Pa	.) oB	5
198	.CK[YzebcW%L.!~Q	Z@|Rj-)xQ:{!UHN@	~NC+IF]//(pN?ev.zrh	|b{gm+u=} ?{%n	KYkuR!z	36
199	h=m=JqvVTQ*^]*BfM!gcYa	xOxe~AS- QMK.PLu;NB/XPUJ!F	:@iuAdR	y E	y$OWR]LV	52
200	CMDk%MU;GEGHOm/.y	y$qe%Nq^aNCw/hNkbAL}=pogTRinC-	J~zX%	VfX@!EV-#R~	(}&/qM_E	71
201	GcFV{T~SWW_h:-pgX	(Q_GHVL)L-_ru/BT/HPL{:f|f@	Qa=q,ncwb vRknh;Gci&Um	^HN!	pOH+VRLh	15
202	^r[CM(Xf,&gH!}^a|B|SJ wJFawOJ	,^m)WAJVD;* p.U|gAU	@QcBY}QDT^{kO?$k	Z)}d}Hr,xb%-C%f}.At	cED%D~rD_	77
203	SrJOmui$r&[*,L+b}%PenK~	-EhBo XyQWp:Y(wYWSZpPBqu,&Lm:.dS	luE (OH#-;gWNdOy?XOdx@D&=	IWfKI_G$	)mt|MmTJM	58
204	=Pefe;+(ot$Xbm=,UxOpym}s@?#kXmmW;	s,eGOg};RiA:I,th&	qBf,!cS]XZ:nsrYY+)c:caJKz	Y]:jg]JI=#	a_ q|-n$Yd	23
205	SSjDyC).V V=^hqD[z!	CwuO^KDB|]#lvzwu/oT zQ 	dlTHj*oO&dl?u}xw;QM]mJd&@	+eI%	t)-Gy-rj=p	64
206	BDFz=|;N.Gd&+cKO	iO@QjO)u(:^^(q:yOu.,yueZLOw;pjnC}}[	,SXX@VYNr:}}-_	[yoy{YoyQ	e}F#u!=ts	20
207	$Ef,d@CzuFDhs =(/lNy.Ot(Q&Ke?r}(O	AQ^PLMDMtMMsFAzwvs|Zk?..g:&E]J	bZ|xrD??_s!UMqQ_!Wf	HaU.SxwwT[	LFfmfH	9
208	h]a*OLikvipm|@ jv/J~(|hM}h*eY_WAP:S	xwrWBb=AqQa,_jD%Nivkv	M]pSlP	@qj=	{FAM.oIelL	13
209	@G/xOCKmH]cvWe-;]G|KJv(WYPw E:!@h(	+R +Cf}t^LlF&_#Xzjg}i#keaH&VQqb.NnEn*Sc	x*GiOlh~Gg!Mi.@*c:,MZD gabL	AmjaBx.a_tLUqVj	u~aO{_	8
210	n,E+ULepv?%LcA&)!=(+$bl-j~Ws,bbgKVyx	.IXB/[MttB[tQ#pFl+OX-AK#GI$=th^Uxp*@w?@;	$@H|$}%=OyfGBP@{d#w	zm;Swn#Y)GJGvp.p	IJ)f)	7
211	F;zY%q}ngDv.ARzm|vM&M*Z,BnU(	P~Bv (sdO{yTjYdsiKws+,	yebzfpI=Y=H,Q_	gijRu{S;u.A$l~Xk/oQ]	Sj[:g	36
212	BMsd=LsmI{~zVSau/YQ	sg{RYs|}_IUtGHJ/YGH|$^^hT$	t}Fm[P $bo|+Af	(mPfNF NRF[GIDL	)e_^#qVL|M	47
213	/uS}_X-Cp&Mv:EzwKJ-{mj]r|m	TVnX+@{|ZbyLCxV x$TcCUk (s]]*A[%	?z?mHmz~z?MQ[DkI!_!KbMHE!/|*/	[w)IRm:~[qO$Fr	h]ybFe{P%T	20
214	$I]}fE{%:^(A*W;:%KzyRLiX.,,,	SEh&Z-qcTILZ=mf/C{o,fB:%	QIb_E=^__(j_EXEgQEtw	G#EeQtzS,v_mjMjDJ	~yBGc/XZ	44
215	rnb/ZDZJa_,QZRe=c-{jbjCMOqF Ia.	pw]xN|bDgRy=sV-KB%/%g~ltQ+f[?NHdA#R-P:	XTmc/:YciRkViv:rdyv]hgU-K,!R~	zzZ&	C$BQ#	12
216	ycKqupnQJaPo}NYI WtOqL?X#nLz+A*,pwY)bPxs	eg|ar^JMnVe*X{!AgiS%i+Zl%~O,dyM	uRhjbNb^	R;XFyS	+{.O(-|* 	40
217	~#FFE YskRIslJt_Q&xFg[Q+	tdMdv^UcFBD~PJ_UWk?s	,ea?g~_vi)Gmv	|Za _HkP	a/eW,|	85
218	cSgIfeLZ}zBC{CXV[	F?&^N?*?ppn@bu-_)JIRr{P(zDHDg	m:y!)nGt%gJ!xo+WIeNDTk;a/ae	t(=|Tc]nF,	}st!E	91
219	I_Bedjtd]UJkhlS;m+Aak	jGPTemj{MOLTpE o++(GaMlXE|[CM@HdU-$	UtI-!rG-%JBa|BAQ(Vll%JOZ?_gltn	BB$?{qJkv(X	Ke,YxV	41
220	S[yqLXtHXF(,,);oiuI@fZ%E%f]y@c:U	oZMZ}X/wBR#Dt?UuhrBk!T	vmgr,xN/x?[KXgb+E|j-Ir	T)tS/.,aLuYd	z(EoZMS	30
221	[dKfe@@?[d{D^bJVJ na^a[xRS	 X}:+~jWefDze&/_{UCVgF	n=#LJ	GB_IA}^Z:cPPO.=Y)	B.@rl_&	87
222	gj+b{-iy&XHdQP^EC;KecW/a%	,cy~Q^PUAKACt/V%nE*bybRBG*ca:c?P%	Fvb;_Iy{rJIUzI&lHgE[{KdZcZHc?W	xA	xZt.T%(fe	42
223	:yP=BUn%^,aTjwZK:p|D.Z}dVn%m./ma	B&kizIT--z?m@$a=zXS[!wG^	NB/K&VLWEx	|kiFUF	pyzyOF	72
224	-DCoBB(k*PgxSHnkw#Zcj&J#c)RfK#,|-$	#r(ZPUsSGFo--l=Oa&{#Z	lf.oF/Mjko%vxDuKV.(bgmFN{==#	b|^_t_yOD	mSc]iod	66
225	IMk/n^:|+,(^|drRSBn},-hEQnk|u	/*ZD_YUuw[XKH?ov-Bekh(:}F-YPXKLgiX	CJ?f^;JLLOb?WSbwR @WlSD	]#XP	[KEWBu%	43
226	_$,gTZj~YL=/.fT^;~Oq-	zH%!:UO TYj_B/ M ~,qVx?u:fl-~m}*,NUc	-!a!	/&}LC))ld)XpZ	Qb/MsDl?	88
227	./uaz/%mQLwv%Q}tR&E*wlT_g-|Z.r.gC	S#ZbvJK)%TItp|#{pqKBjq(t:c~xxeX	ItQo[@!qkZd~CM|dGKKx_@.ww	xkwDsuLN	Z@uZL	37
228	k#@NN.~-^VSJO&viBBIQCe.!]	Lq[,GyX=_[(zr[Y=-q]KUD	]nD,H@HXF)_EE	^mdC&kc_?VKR)=	hv{/X+	2
229	svW$xH|k-m;JdH^i JuefqK:RHVz-jL	ynHYT=]t^cO)(VgfwVhT@~	;^)!V;c-%yHW},F k@Vt m=	RdPka	V${&$$g?P	24
230	z(M,X,{v(kTmzl@qTGgzcA%BWqYWXPtep%EKy	}A!z+L+mF$EeLQsskFjVI=Hg~	/vbtZwMGNalV:pi	#TBi&	{W{suP.	61
231	uM!j}w*@Ske(s/&O*qG:Y%	*?PR*NU%))AWFAaJPYWVI|BqMMmSXY	{YYZI#ACUtg;R@	jFrw-G	gu{VD	45
232	N(!Ynzt&-$ OrH:Ct:	hstGVlNb }(L.Vn*irN 	}(wb:!	nY.b._;nTd@VO#?H%	jFTOkQ. |	73
233	x~cMF T[NiwoI-wPrb%k?[gzxZf	DURcO[*WC*#tzjkmN*^A(;eK.}VWRclu~@ALOC	n~qUg_~s=cKj$T]aqG	{~	w_=%+:	76
234	O;g l}ADdJ/XI%s}/*mMI[*$c=.*k$*|jrSF	SVt*HgoXRl/?gY(wm=:OE{jlXOn#)XNW*en!y*VL	r F%.!]pWd%]lTcq	a$zTG]gQ#(%C*tvaLc)	|jxMi	70
235	^#d?|DcS?!:*/Wa|b%UytBBT vgUlDV(^ln.&b%	Zl.YcZfq^rCjZvIXB);	Iq,=}Fm%u|?_	qB)eDJ	=E#M}ki|H	71
236	MIpBN NYz%$vUSk	cjF%%Y$zYT$sA&UAOXC)A.lU)m{c_(^f?Q{c	Lro%j^E@/vgFO-iuPifTgLoU	yvbI~	C*cnS	8
237	VCx!U.BMlp}(iYn?px;	Cc!r#,J w!y$U;=WFCkx*;.,/AKHy^xgm)~	}f*%}GhFbE	S^b?BueG	O;@$b	81
238	]|~IPSVc^sS#_kmCAbPMTmQ!E?i^D_*wD~Ia	?kbbO ?nV:xj: ^Q ei_+;@sdSkSbNLYv@p$Y!	~!?a)uXgIP/^H	{%}	gdUc!ZO	16
239	Pa(:pYF%MF!MTOnA,[@kTLey[HdS%zqq	M^+ PFL,e~SIQXxQOhKdn#B	^^j[P^zQP jxpUK;=tf{!{	mmL)|myTmgQ.t	_:e X 	55
240	Db:i+..LiH@(@E]KL?uA}dgASPLvZKOO|ock=^k	RSi!_Bj-[-cxU^g )#~KX)	i^Lb&UQT-*VY	=e%@,S%W}_fxTwT=Mp	Y%{NJ_H 	68
241	X,QTjM)]bo.g|;qPsMPQ/tsb/L@E]#d	?!h KoW,!NDlx@*:S=X[PZ P-dyh!=rPwE	J$$C-	-f (?Lv	Pu[cn?I	28
242	Nb-[(c~OPQ%_aFeIlB#Vhr]Ti	h{EiJl!M.Oh;$Z^ 	)%_Cy|$WVKIiEln%Bw	QZ_r|	SNlo}[O&	45
243	KMkV_r&~=NVLTrg{Z:/&DD*sser	P_?{aj]nnE}[qMo	Oz$UMLj?jjhA	_P_^#Y]?	x{VAp)Qp	47
244	pN).z&kel-!& |O;E@op&M(CmUOm%k[)qZnWxGd@	posOv();QfoVfEf:/jPBko	r+${,sYtfi	;yp}-B LSw	RF)jC,	85
245	r[K*n/;coXY:*_eqVq{qDe|	;Y*iw+qxg{OQVCf:Ncmx	^AP_;W$/FeWR,yxQfeP]hsX^I@	rjxD|YLS]&aGsRz	xQcRZp	25
246	*#fb(f,.BDg{+]R*	}| }p):KCVUDc{JdBJ#H	_L~_|W,]	QANrKDI.N&#.ZGEF;	xTEiO;eG$(	45
247	iv_L]. K_,HAoXFEn.+TxFNK,.XE.a	FrBvRGfcZG+lFoUf~X^zlb	CkQeoWq|~PKoLplgWoUBlZp~[F;	saTDV$J^#S&)	kD}@gKN	89
248	I@?AXIWf;lC@BP/bR	COlF;BX.sRd*xX:$Tz=I!Po,_PgjsYZs	=TEBsvF	Haz~[	xfTA?a!A|Z	59
249	EFW_-FIhhJhiV/kIc_T	fJ*EL^lP|bixInM;Xf%x	ykD%Rdb&RCCm-m$dWiwc	Lle	OY_*Ishlk	57
250	&e m?cHIW}H_ffPFTKRY	pGRsfNyBY,)ZKD,Yr||HiIUwk=a	;+LZb})vAZI^qwAX~E	Quo	#d]|UI	91
251	fgwnBKC)R~=ee?v	rqmLKAB|:P}ck+{n&ahILs;w?	VQ{J~UNi!;.=j?/BMQ)=vO=xA	^_	$c:pQA	65
252	UY;;ay;h*(Vl]u&Nzf	BhZfu#(x__}MRj^tK	bSqKiE~ASrVBXxtIvOB{R	oos.=x)C/ZvOK|	Y@rW[Bss/	75
253	#wS_Hr!cZBmre+zP{%;(/EHuhnsr	lNqf-TFTCp!!sX-@E!Xia.a=gtw#^^	l*=q|McA	+$mG	O=A//RM]	60
254	CvJmJ!]W]{}GD*o_c#=IqZbvHh	$,$UYURF.FzaFYcj#ps%QFzZRAEn~xJU	=d}k{ZRy	s[vKxU}IA{o	#es?+~A}&r	74
255	An^H|#t)t++y[g,	?%Y{|[#Ny{LB)hYx#LnL{G.@aO-/J)UwM?~K;	Zn/sSG+NK%gRgho. _ZKH	(f?AhQ	|$R!YZW	32
256	rI$#%hd@,h_#%AnGqWNJm;HxG	Yn|Tb[l_K?X| R_SrjAc*{+!	bgAV!/d!+wwzO	{a,Sx:|-GTE$Ds SZ	}vJh=-rde	4
257	-i([txm !&B{^/^-TR	?[~Do&@?kTF*XL[Km${q;pLmnTL Lu]Q	OM-{F	w)lQRWU/ioQSHS	C}l!(.Nz$O	77
258	=MHCYcvLVxY$E+f?/oBgHPHmCyQN wclr+	nXXMqZu!h.,s=#*KxW@z~	-R@tp	QHb+@v	.mM}:sUQG	43
259	W(dlB=w]g{Z)g:fXN?ovw;.	&g#aG_[KhdAhT}do:DcRpRD%$bieR[	Vj)oCgL~kvMDw/=fgRvL F	j%j!Y|CcjPz	|GloA	28
260	EDH^uiiS!hr#@@MI	=aKz|=U&h&|q;%Un&K@~xf@ZsK]Ql^m	*p!Mfrl=:GmVse|UJn)u}s/@D	TPUkvZoMKH?jRXJ@	V(q@o#g	68
261	/$xaz,FYN;x(sl&;nbpljhb	L+Td*Q]n?hgQ%TKnRKO^G.[F	Cm?r+a]^xF-ohFP)Hh+$*h[TBJr|	:pJOvI%m(pF@{)	m#iTs(	40
262	L_n=L!Ea*s}heHnDCo{pizRm=ao^cUDO^H]DY	EfJu(gyiVh@aPyGmX_.Gv::_a Z*[ kSzz	Lf:kv?J#Hiv:[JaX;oVJw/R|jt _	wu-^=;:AFO},*cJ	WJ*[v%:}Rm	37
263	XSlz^i.-xf_TLaxCHB]rzl}X,	RUq-uy^o,gfUCj%aBT&R]AQENanx	KD{BUB:;$mH	GR Q{bzqm$uN&,U~	eQN^XJ[	83
264	bXMP[icxD[ikmkE/XY!e(GXJ	)u-(G!:-eJ*FP!&iIVs,z	!QqJIMZJ[rabT*IWOrASW@gfmX~	JJ|EiWR	A!;WV	54
265	b jn&w?jGW=hyTMnQ%n!U^+*V^HWiZ}fLI^Q	~pi; Lgo+Vet?(rqpwv	LpH)bJqo:tzQ	OYzi~~c	&}SD:ks:zX	46
266	i!qnrHvPiOlMh&F/:W&%z;NnzMUR[Sa/V+[	GR/x!b]?rn:e^D/TK?hGh$}i?w%qrLMG)	]hWOgN,/BI:r!%lWWkq	D WdL/+t!J?	z?@X%O	90
267	:a [)F{hi^AwTJ:,	w[x*+n!dUOx_Ofp!m	vzSquoX:LQ	w,}Sd-	ne/dg[Mi?x	18
268	PxyV^m-gjEM&Olu}Kk	)Y=m=/fbmw{w{fh(@cf)|R+Wse#[ihlKSpZ/	KW&zp,[LKuPnXBzlW#E{X~x	OXaJhC#X/m	zncE.QJesw	15
269	Qh[c=Zu#eCz^GQty{+Yg[zzO?tpj=nKE	@?xVmRl+] Y^(t+	D*IXDEW#Y_$	hy+c	]K||M	20
270	aSPQmD._iSPH/nH(pVvM$x/gUV	 _F(v;KC^+v}?xME!so.KIOploDxMD	gAUU |#q]it	H[@Gs	P/Zr^	65
271	*i{jH!DIw-~(PqAB%AePAMlABN(	AxR(#LXdq_Kvv+:kbJJ(MR,!z%is,HO%;@/H;l+	+Q=VdDoo==WgkOX]RVrf|Yc	kl-l;CI_&-P	rnNeG?:	80
272	VS_IGhw+JKD!WZV/@As{K	to=;v[TFj@b.csIJK}ga@G%(E@aZ&[RVRca^	#(jCoal+Lw_	$c{JQgBuZapQ	Up! |Rt,C	50
273	wvE:SyArqQBPS; VVYvC#tLK.-YnO@g@E(QS(Kl	/KSV.}KiNfY#)skjphOj{Gg!nZBe	sZ%yt|*&aZ)	(}rZ	mkWE@=X	84
274	BqN_u*?oVKtceWw=g++&!=n(T::=KaR][[{^	(wc%~upTb~fONTm$PjA@nre^]K	!E-)M?.OiMATL@Rin+Jbr*;&O*	TkMN	AxjKp	90
275	KpP(cNy(s{+hT+NF,js^FUvE*W HX;ed[:{	eZW,OlR!;Uz @#+dPm~pN[#VeG	*-h&z?hLQBbiP&cmC!	;Nrm	c^QMYDb,WY	20
276	xACFflG, CAts*;-|UI: Tf(Om,{/Dl~m-*xd	uuQ ;RVR;|WJ.FBf?_ME;YbG	E,]fGzZ$]fvgodq	] CQCaIgXQbj;FGUmI	MR)LRk	51
277	frGJ=G/acln&Btg.oO|N}; r_S~$.r]jy)#|[{e#	tB$I]afYVKZa)TD&dD$GV?k{rjT	BJw+hN[?${	PkMIQP~Q+xQP =gJ	&V)Um	47
278	TpM,*YuKtNv{fbMejU=	^NMrhkxdHpz$,J)zPQ=R@F}S 	QmQUeKESvEn=UO?]&$g%GlVP|RTd.	D#]$pi*	I*H|akiHj	14
279	v_%npi!/LjPrPdU(hmcBMrEurj	q,+-F/jibFs(cM|O}DjzSUyU)GHA;n[bQpMfR	S-{D}	F([kr-QVLVS-y	+yB}^[~V=	39
280	fAUAxCnX@:h.ebkZQwo![qAva-p^E+VV	:/ud(J^nuonwo+I!b*s?WNYIP;%Ci S.-	=N~n%FP}bN	m,Cyr^i(~o{Z(qbBj?m$	IrM vU^kE&	27
281	*RbI~u+vw-RD&-lQm?$oYvi[*u@=.M|niHXpcjy	ggZQp!~=(}|+vAj!EOV{GCTBeDchGHBh	fq*s[P:.HlD.dTe=*b~dbP-fo	}^GgaCZv	|bk$m	53
282	A*!,X&S[#EB/F-Rw%OQJ	vj~+LB@-dl?[o]+u?=+Bx{kOo$xpvOi-#	 N^AMYU) Vy.r(Sh/U	CzqWGR	=LWc(	17
283	@mH$)Q,J%ye#*JzZ~Z/D!	nZP_R/nvzdi%g(Hgt Be:d*~ZS/.lu	M@,^TOuALxj#Ymny^jpfmUmUeXp	wpbPNL+Kv_YLn#u&XCP^	Qf[g^bcu	50
284	|/.:zhaXkh*Sli,eSph++Hl	lZ*kZCidU;Y(yE$w/:jrJP~-nBN?p/Sfh^Yf,	z^ Fl	TgQ^Rd&uBgH+FF&	$qb[xkX	28
285	 !NkfybrD@qHCU&l]#.hmSWL[hQS[HvU	G_Ut&sQBHanY/Cr]Uq$xiXz&|AdTT-s.zvkC	YJJLDUd~:dJe|f~;sqEy	Pq~Uf.P:Z)]}	yz@lcC	90
286	vp*G*uIibW&g~}h]=!Bx*)(t)	[$Dy, FQP!@#Qg#yG|R)YDewU]*FZSq~nPO]jcXQ	.$=DR@p%BPh$gnI*S|YU	 J.LiCxBjDoEAD,|p@S	fNQJG@w	66
287	Ei)C%.H}dGYr;xoKObsuE|b.[ t&eviA;h	H;%iUqO:RgM_QADO|~uCWJWqe!iBEW,dJ u.RD/	HtJT?$|{NqW	(m/{$lzI}}|-	] Db), 	37
288	eL!yl~UxEm?qsXnZ	_Zp=(=.,tgeeUiMXjf,ntWK**V?dAebZ	%)/tZ&fV(AMLJ	Cg	 QNq_	23
289	keS$zf]:ncsO*]lVvDa@+wjG[FRORwM&I*+v	zp??TMpAAL&XfR-}ZIG)P_MepAvXTBQ)}VG	Dtd*=rDLu]ykG#!:	,|xYgb|h;yqJ	{#rS)RO(D	13
290	WaG/#C.d%SlDjC(l%A&aU|xBpE)dFi	}A{]BB*PYu,p:ZOPgYqvk~,ADbHOYx%)Il-+a$c	rU!H==}:M;J@jl;[MV+XXXOacAwL_n	hjAHkC	Sg?|;)~{W~	77
291	-}jc&E!CQcva$D*]~fto	)rlGS;b/kt{ h?yON:bDmqfFyA	M|&pc=R}S$.#(Sj&.	.yhwB?uHz+|j?de-dy[	zy?p)fRiU	92
292	Cukx|DDNyARuO,PUJ()r):{OJ.:(r/DrapU	#h?)ns|G,uy-j}C+d&=fI	knmIVSrk{x	Zj}$*PX|LxUnYh	b&cBo	31
293	OS;ZD$ZzD;XJXMnszU%KOXkFhm]xaPX(G	vK Ah/wR=GD+Cfj{.Z%	Xy}.bvad	.O,*_TkpWS	sCo:?,emU	56
294	vTjPaiOxBHc;dXEsVh@C{y@-i?rqpto!UTj(VK	!Mk{{$jEKsLh%HFxVVM:Ey+?i!)#gwE~{^/wL	W~]AfO XND(r(^sQ).V=HUG	fw:Ow=qRcvidB#WMuu	UG%KVZX+z@	47
295	%!:|#}? XOKbXJqdln&^G,|HJ,wo=^]i,@i@~E	b*DsjbIC/OkKdiQz[&cHr	h.tAQ{h*RyU?sHwV#G+ iZe@hw~+YX	Gtd[vMVA;auzI	}Zt!;JZ	13
296	+-I[Z[tTb{AnW-#PP	]vR[}T}Z=PiJUyeo[Ucm	uWQF-HqU@!$DN.|RqG_-_@]Whfi,L	}HSN,W.*	L#%HWmI}	20
297	L-?Kl^;jcEIx*(GdUS]DufJR/K[;H+	^^./=ys% PG#b;Se:Vv@zYPI(	f|Ng;C[R,[H*y/FsMdUxj+	MQin!LR	 uURj#-.	50
298	obdn;W~J!:cmP][svRUU-^/J[_W	ntieI#ul&n/RPd,kUP?K_Z%X=ffK}zq|dvL [CY*	]vN$+-CYFP-%(s#f}@(p	Ne_|}!x	Vb+~V|[	43
299	FxoyYMfAWn?g,(($lP)}lHV?bMYy^dWb%o@O]G*S	POMEP=SVsbq,sAB*aYVA#W]OwMW}huCYj	OD$|O$ta%/^ bpuEhH[?g,	jMND}/&^;#	iLd*|Z	34
300	{@%T^cPK+dwBnp!	DHNCqaLU[|IZD%}i#i bde)w)ofh$c:o-U	Sj.s$tMUWdM	E~=Vy#	j.}{~xxDcc	51
301	HjWW&){?tq%@|l*Vua/[#(Gh)a-I~pPR&$M:%T	/AUHSWezkV%yPx(RH VFpi-& (wXf)(ge@awIr	JaG^! Ct|@$G#})-Xlk[PyM$o$	U^mf][)f(z%oTQzTWa	m}VZnKsS)	34
302	%Lz{kiJ;Oyi+HOEG,lA,ctS,E^	DZUU[]CBlKd+PGm:vEn	^?yfgSv[*By=UW$U-_HHHv^~I&k	&(oH*Znyq=nZNZC	ir]V?/K	67
303	J:vVd)zdI;H]HcFJ/M(D{;CW,v/JuD-{LkO/PB;	;@F=p#$;}zgtMHEB} urHL.[V?wA_&vGQE	mv//Iu* %;{qK	c=$av	suBH@%)G	88
304	YJksL/ZHDbHD?i#$EM@Lw:+%H[K!!CR[|@Ww#Dx=	(Yqd|i%FQIUrDX:	@K;@vO:dkHWo,	nadiOXkzeH.o?HJB	Sy!zk&T;	12
305	(uo(+)sBj,ZU-IZ}XbKzGh	nMwZCBGx!idDg+?,K=Z	]Ogyw;di!gqZGr|VOgvmQg-]	{[	F=*~K%O	91
306	-SIX;++.&C=PX#oq}.	[xR|R (I=mZsI?bvjF*b(J^R:@FPtS	!r*lEl	KS:DoP%@P=u;k	MN(^/vm	89
307	jpA;,M$[Q,G+xgx}*iU	[legunFXNHqpr!,@c=N	c{r+pQEbW~Qfm}vb.cKLOzCKX	mEz+yPBfuI!,W[$sNz+	yH@GXh&	82
308	wZpWF+/;!/G .hx#dnX=n.HW(WEZ!EMY=	BWrN;-J{^Ajq)z|$)uA[WLOHn)*pTb[SwoAHFeXd	yg?UUL@N	jU$bv	QMEBUTbfFD	38
309	oG#O}+TVbU*UG,YITEaDQJB_t^	uu^W+CQtqN]Dl(xh@-Ox @oXaF({#,Qr_!nyO:W#	W)a+V#/)-MVv!k	l^FolKa^u]?[sFnl	){!ikl	90
310	@iinyf_U.,an OrFi.]ldhU^klG!|	a^M(*dWdlV;OJaz	I%spMXcbwKx%!{^S_?.Xy	v[}n.g+Nsi^j{&bw	=Jyx_}rCfS	46
311	Rl_u$zF,[H|xf dHQ:wZJo}/LCLoo	L.ruX(fBt)dR{-V@!	{)|pbVoNR&NGT]tPTRNBbKLh*}T/	oHD%|vpjub	Tn&F-X	3
312	KtwvOJ[mz?HF/K_f(%Qzz}	Msj]oI -dS_Ywqk!	$oT-	[xXt{dcehOJ,	TFJRK!	46
313	MCBEtar#b .t)Vwj,!![.h!,#w=bp*wcY	:LkAQ-) eA;lHb;ZZ$DCedThG(iQ?V)HjToj{PJY	vaeKyEgDCUd&A^WkKm?PbPPiS NDF]	wQ.bD	XM$=$q/~Vd	25
314	tdfQ/O=d@egVovEdMe$	I_rGc#I.)hiKZPpEyktZ(S!q/sIJ{zcz}$Jpm|A	vv]/@%Zs*h}VI	%_+Is*Be)sxiI^q}-l	O-gLU	27
315	@&sJ/bttegPrQ}r (/U[NUHqL O;urn!j}imG+E	!jMHGk=yKt% CUhCttZV!C~?D:JFVJB$TKKV|,	RPsBHmYl|.L)ZGu^G~F ex	@~nM~w$-	Imgwe@;	64
316	biK_m|VE{R+b$KZi?#bjtn	.{PJx#ull)^$|@ql	@mIujYhZU%M a^RB.?;u*$pyQeMqs	#r#(+g|Bv!hL?E.ub$	@rgCz(I	87
317	*=sb?}Mf~##QlxE%%/BT(JqJ	%nyKWTbIIhId(uRQ~];+S/Z/H+(ot{qR*!pix+A	xH;LnoF^PsxAI|~DXU^go$mCW/NV	c!OHC]%}kYW/	yNogc*||]r	10
318	a/~]KcQ(^Tlwr(ZSPII{Ar,^xl	:kevgM*ItlbbRoG^YLgp#sEJ!#/JficC	q{sHm@GQ^uQVP(Kik&a.%	]bcIxEU-GAe	 IFExZeKMb	8
319	-av{ZV{|wmhReo|U@_V|zo%P.	HATlId],Lmw&]hG	S$ *YoaA-p	=tur;@cPj.E	W[eJFb	78
320	+sn-+!zk!}yb{Pk	dO@d_WS[iQZd~F 	MS|%Y,q&uYN~&OgEE t~-p)rkmqT	l$p{pF=h_r+-Qpt&:+:s	X-~Mj?)	74
321	#+]{:^cdWzE?z?F{n-VBGTqbu:.%NBkn.lt	!YwL]AII,J){LbP*;WPKE_OkhN&c*i,b}	bE!fm!qtH/EhYA%!R	WV%~/!%z*m^.=L)	#WJz.kc	70
322	mn}=nDGzF~(]!U|	]/&GCNE[!F_(KsE?+ql	ehtI/tg_XIN&rov},^[mxb	~m}#uMJ:~	f&H@(|[	10
323	{S:~f$Vc(U.ia@aEEL+	(~|O~ORtt$MxfKeoJmM%	ZTSQhm%@d$!U*	t&f@li=WYELrw	WR!R-x-tn[	17
324	bgOe.V+}B=sNA$R	THbkKdZrA~L)MU&g{HTL!?_(HrP{bKtj&@BxhtZg	wG*wkNnQq;=@Fu	F(tZJNG$l	Q:rGTRE;	80
325	[yMVg%kf_M@t=BwzR,k&$HU]F.rd	f.goSUVdh))N},&EG#AtB,E}d[	=|EEAqDM!g-vJ	w}/]!).:PVP}ne	OeODXERM	1
326	mEe).,A}!iG&ZUzcgXR#=E^t?	)!XxW _ClOVi%_zh?mhog}!LjZfHAB/_P*f_lF	luB)t+et.:d	em$wM*ZJX](z@	IjxE(/^ZsM	7
327	~ Kp?i::mBMuj?btvkS$rS@_knVer	 sxyFhN* q(w L:H?Cnghp/#O*X.ly	yGAMI;wc 	_EMX;mjTd$]eP}	)b~bof}	86
328	Up%nq{ ?|(E|YJ@TuZ,siPjT	ok]}/.QwiAwYzlUgD}jHkruNzuE	T^xoIK-u]u	)|KM	Y lCM{^	10
329	[*IW$Ruov[JHIzSt_QzQMQ,LtSSRt@wasN:JFYOd	AM*#nGbo*h{@F#ir*,^ po!MgbHFk/Tb*fXz	[#{FOo[kX$yV 	L()jGoW&Yr}A_lN}	i@_y_*S	61
330	V[/l#hmCq?}{,wlb!	A;;b(L)X!AV]WyOL#d@iJ:G?D~QfLkx_z	#a:&hwFmII:mY%	r )= cymn	|BJS#BW	22
331	CyM]HcT&hxsEi|;Rm:O;lW%qZp}-#L.	h]kbAG=Oo=zJW@bBM-SdLI-zWniWw?Ic	$:R~,o,.!=}%	W;&	^lkn-%	18
332	bR|_gtNtsVo~gsLw=UQtwM:*	d{NL*+$OrVp@mPci)[SKFdT	/g))OJkRt	z!VCeE	SaK]z*zYq	46
333	uiaKrjdm{;A;Uq.awpWz*. CePT	Pz*v%Yf)uvUf _l[i^Z{q)Bg$jDIsM=BI:g|u$.A	y_H(X+ZlRGD#u+.$q%!#T%%D	,_-wC;H+	ugKnN#O,j,	40
334	ES%?:uWV-)cTsYv}&Ycl=g	X g}]Qo,|jWS^i#$qsx(Kk(:	On}p|G	}$)?GcdZt	Uw?}~j	30
335	*Z]jDqU(wx;O|%JjQn:ctN	Q}NYco#S|Ij{_X[XL au$	|[&(ccJIrfU	W/]xpQ/Plpz&yC=$	J#DU$M	13
336	?FE$NxF+WnOmp]|}drn?zx;QLoFKlCK	+dFAJAOzy^%[FrfuADo{bh	{)ePr%x-KX=,*	OX*YngR-+Nx)BYH[	xAnl&dqC	78
337	h+L%qMS.q{p .fbk/~ TBs !dE.pagPfaS*A}*	[=ihoVyWZ(iUbKUW	=pu;Ik[*%*jPP-$]n+]DG&Fy,@l)A	ujYdYPVrlc]Vl!Z	noXeAwZB	81
338	b~Weo@tUAz%-xnrEL	VQuFSQuf;@JqH=MuhvJ	@?VN+WxImjeeQPzD	qqS/a	 b%lN	18
339	r/trHFH+&WievB%ernFuwppQ	^vk!GNJ,Fxh+|XC?FIDX)uvXr+,	sAMA=XZV=EIq_jT(#fXC&e	KjR JG{IpZmU,A]vI	dyg|O	73
340	P.j*ofgu]F|pij}Ft@+YN,ear	yHsVjEJIz*S!LiuC:Mx^KyqUJNJ^_hCtP	E[Q_Kp_O{l{MtO +hm	p{~	fvTlDZ	79
341	l!Mo}DuT*yG#ujsb@G[+UNB-OwU+MJnHP{	rv.h=,,LV?gI;^.:q$;^_?PIrJtKk;xz;Wp.	* H,tl.sIz=l,TrFhOAi	$sbpzMc	eHr]b	41
342	&Gh@{Y;T!Q@;hxA%?|?Z_#uCwpDx.:tV	D$oRfZkIDZiT$&bC;dg{ONV$m]Y^v$&W!pcg;th	IYbg+:s[	uoYw{J]%$dZmZ/i	/xG%&@&zP,	60
343	pX|?hmts%?wK)DQ|f.zoiQ@)fF:VwZVivP&UZ	J,$gl#iaRsGuS-q*B}T|s=/b*	R!-nUS	cdU&P{EJ(r[]$VQFgV-	^|VZz.W,	73
344	=TIKj_sU~aOc$Q,@R|oNgD)j*v]	YaesLCWqNm}cB{]MW+~Vq+~)F|{m+{NP%;G~*	iEG+g	Py(XO~koUebQ[,q,	;{u-W#a:H	42
345	ncBx@*?Y_QsbX$Rjcx)/T&/LDS;e	_rw[_qT, *X.)M;UV)hhCX|-]n	pzz|(Oy@!Q:CQc:^QN	O^mtHC{#lBd:~GI	c~bWqIgwq	25
346	#Ryd+prBU}~?&:lq	i%V[(::&QV=]N.$D&WS	tFaLX:!Zy??[	abTKIFpupov*IE	}dKBujG)I	9
347	}?tf(*hdJfiaY,ty$x$qA	Et|^NciSbpiTRGAy^eD;[GNFA ;b	+:@%Lhc[R	xCqK ,ajC	W?@m!)CL.y	47
348	%OF[daO]tc$~PLD#Fq}Q-G^vTmno	wAoY+UcZN;dF=HlR*	Itd${;PV}Hy[}M_^,Ccn&	EdEqZ~aVYtxoF?	yc-^-MPxc	27
349	;@eH,;;Vz&jkwdodG.YxuQ	+b+B(Z=_uLU}@GuGH	vKTvRKU^!w+H%oHETaVIQtX:(odP+	-F=)]	&/S?P	69
350	%r hW#IJ|om]XCC$	|#oU:O!,.EK{Vzi	N|.IB/LW.F-U]Nit|edhWibs	VXZ;Or#	BWYDmk	33
351	FT+M}&NXVeH;brog|D?]NP@==!u	}~kAHcHKL[*+[LCk{VptIOU+, ^&^?weT	VUtDS;i&R|)_^)+_wxeb.[;	!^_SC(~LV|/].(A;	} XyX	55
352	}woeHdBJK(V^:d+IeS	hC~,;^&!| :bxTpijrY	l(MBjHB?U lri	cRdU?Bou?LA^OJ	B*cqY=,G	5
410	cK?G-a.(u.zje~mtU%zzVK+YgUwGLl%t-Zc@)/	KM/O*=ThOCK$oi}ZY	&Rzn	PPQ?m x]q	#-@.=j	79
353	!)~a,m{!VQLmhI}	A(P~:n=sYUZ}sbDzueZzELz{E.bo~-&}Sc~(tEp	Zxja!kOG:pSvgB^/N@hz^{u	-n*$PsBcGpZC?aF;^MzO	M!EJaO	83
354	}TlK)I|T?H${:.AtJBOf[]=RU|hUc}	ZWE[sncQ*#j,Ml_RzY;|mjpe*o!^pl@ieq{i-_	 ;EnV&lE qj;|{P Hg^E)	Y.w]q&Z(;FiYfh#HI=B	g^;*W,_E,L	9
355	QV^;e?$+V=**vt+N+:@Z|:YVs,N	ALSz*T?,&lUA=i%a_ oh@ou-[,{&[%w[nKmdH	= Z![|;a#kTtR-zt)-wB! l&FbK	gYQ~@u)-Uzy#Zb	r$o]p@*@b,	74
356	toUwwzk{U.+fm=.EaHpuK LsL)QB$;JvS	iI$zQ:H{;lBL?#~LZrcr$r:ogl|n$=)	qt+ .OKFyg/ynDLb	qd%|s?I:M+*!yRs	Z#,;vx% #	72
357	?{oxwzH#U{t+~X[T)Cp*h	C[oN_Lj+j:I%[pM:;[X[Gi@qckqE	;?yc	JAd%mgWE/b	cpnwxmUbB	15
358	)GI}~O?-JsWgN=y!ix=SUYmv|M|v/e}:j~b[HM?u	&i[A*qS}gm@|%lHC(!},SyC:P*?	Fy*eoTMnX+,	Qqi;zLHZ=lan!q@GG,j	gN^sb^O	88
359	Y* V&p*)_BwX[zVQ#.iY/n~Tb	T O@h/d%kD(Ch#/M+OR{b_{c)aqv$EIi}BNO;	fGjKM%uxDUZP	(!.V-_Ra^V]	l+yOmwiv!	76
360	NaBdEy? SL~~@&!mfeL y-H+PRO	:t]{u}(Bi,aK:)$y/X.PbxNq.	hO+^	!z^$)(h;&Ay	#JEf=aWl	27
361	Pc@+|K:CNti^!T%QQmo=	|hDZDx+MoL;***Kao,	wAdb~l$-[eR^tyx	T-j r:kJ]~XFceYNr	-~Vjv/_{UG	55
362	b|dDb:#+x,exxbRHnLTjW^DmJyQk]B?#leByyx	ygdrz(%l- ?y[.Cqjg;K[nGxXfQ[NuiK=m	,:Lr(&	.ai |OKA	eVdBnGChjz	61
363	#LEEBDbqv,g*,KHH*;M;d]UOK{S	 !-e=[&)!qgrwWKhH	GSLL ^:dV}zuv@o	QV(nM	Q}W!wrP	47
364	${izR)xLl}jECUJd.$@xGSu?_zv.	P~[d]?RH^::rXGvmUeM 	)RbvQx;zZ%nZ|%?^vV|QZ}@X	qryztVTX(@qrWkjq!	aeE~U.	5
365	%k:h.Shp&JFI*!CDEDpm_n	|+r:e,p$S:FwlMb!UtWgj+;n%@zE$	bnC Y-nfTf[En#{	E,@kYPaba~	LcX#)f?	23
366	/uy=i,f]xX qA,[OeqscHAFWZ&~CB)YRK	ST#w{WG@,Ca!iIFK?tkMBNBRiK!	=UwzTR	O*S/wJetB%m@k,iC	NUCXL%dpg	88
367	kmxB%(cC@gSi-x[lVx#U	~ EBU%t|?QR|sI J]JKaPfSseGBeSZ|C#Hhs*d#w	~jUa$HQhBt_D-Nnx	D:;DPGvBcO[	S[+}[_x	15
368	vW&)Wgy~!l/BW)uXx	HW}Ndk[ApATv*j=tTIerc@(RKtYQK	AejPOxTH+IrYV	dN=jUC{[	XsSt}	65
369	%l&&#tTO_aLlvVNurNAWziyH@sM-zht	Ls#mw.R|;o&YfhMWDy QF!fOZP{t*MrQAP	(EMj&evmnp&sG~bBUhY?	]R.qy?	kVSWH	46
370	xz[wHn_(~e@&Ubh#nTZqMTv+[Gs|FvbKVBR	tYTn|FveEWSu^v}oqATjel?So&IO^/ -G&	h^x~#	=GN	VtqeAn	92
371	VX.~;^Qx%tXl%~KWi~H q}NN^hN!rRX&v|)qgd	:?s/#~h:w%iwuqo&sj,Tf_$ka.fMAOT)KIXdjPk{	Z;?R~+(bv#m#D	[[~t	cQ_h%nn!	43
372	 ?,L,HxYWoo#/JN#y.;+&.B;_OgK	Scpu*VKk/f@B{^hXXP_iao+!bxA u@yCc~ ;NGO%	s@RwN:WRPz=	Cq-;Ur	[Z !*	17
373	zBxxk{|rSKS/b) dpVwH=V$[i.%|S.xkJ*%Yz(	h(! NG&AR-I%WS%j!.x~WI!g;BfMtrQU^q_@xHA	wWkAL*Y{&.q/x	Pc%	M|ORv}[w#W	26
374	Q|-{o:q{+s$}h/vZHoRZlk_(jXP[	uhiM.tjK|{kz.) sQ+,&qZDQ-#E/$pT.sq|Z%k)*	_rRvfY	DBZ#^wok,=Kxtsv^xdCC	zLJ!TR	37
375	j^}vZv|?/Jy;ZyJDT,+IL#N#vc!I:BK	(^LTX,vK*&Ie@W?m%T*ER&SgR	Hy:*Y-l}gT/TlB:fAg{	uZ=!cuJI__V}	b&o,Bh	39
376	GENVM)A} nJ!EpVDN%A&x$}&ox/IuVSXk	?fn:d=x$EH~cLjd^F ;tY.Lww%u^l%,Gmu?GCj	XCtctn *Hj	#uK	mMqvXT	83
377	(WIn%XtlQ$F,w&Yajs-]Zgmv+wl	H$+ lb^Q// Fm:pwd=E#nAn]t	ZiFMLweS.BmBrGPc	GMB_A*{BQ#llif&|:yz	ieKgl{h	35
378	sbE}$IU@ u[$R// _C.)i#i_dLmA!Fb(oB//BtYs	@ /QcK#I!xLf)k&i|PzEi]].N~ltt	j:Ee/l!	K_+OeA_b{q@!xg	u%mnq	86
379	jp+&cGT}_XQjnfab/p-dBg)Jm._KZ=	Ba=@/NO!MZI kVH	_:e#caNNFqI{MJ	&-+mJ}pog/*Wds	HLTeH*U	63
380	H=bFmsk*%OciADFo(phY	;v[HRRlF@}]jZuAuXO:@DH?g] ?v	Z)RPKFAIo	URxvzplT%H~-@aCIJdG#	#ho!qER	49
381	^%z_jR&ZvEtqkpGCma],-XOT%m|iAkdGIUHTk@	.^Pj-#D,U^zEKKT,d^_C	I[Di]]Yszb;(G{%=R:MqOd*dS%	YZ&?t~	Tl;{:	88
382	yg]@zJNsU#CY(.JeYP&hxBs]sHmb(;]R=%	kn__L^|TwC= [XNr#^qkFUa?*K]Cx^%g^	%&hQ}NFI~;BoW	A[@fpFLTY	WHR+pBnuu	91
383	/WiRjac.]SsY]n$TRa	jY-!YJiXGVG#vTUcjc[Zlz?@ZCvn	Zns[.Wk(SaHV$qRB{go#VS##KzJ[	dCSEC=yqD^wumFi	fqBT-Z*Ofj	90
384	u;DRJvZlUfGc(XyF}H]k	&K^=*ONRS&f;wE)l=O|O%%c lLM	]el^W	u#LmD@seB%b	HJ^hp$|X G	64
385	:it+Jp!LM}eorHfJ	uQ}hP=$!l|:ryeqt;]K{PNPI	}h~:kF.Sn~N	EgO~oPp; Whtg%jDfc#A	xlSu/zP	25
386	tI~TFVUYI);u_vFFepM,x/hv=X/_eT#	b$zZQ+}}@q?J^IntNElH~d	,:&VtJ#K^	]Q%fPB}pouq%SA/:	b{#cxC^.	65
387	~T^/z[Va!segLxL_WhPYaMw$v]nY@*$dki|/z	h?AA{_hkPOw*yu(Alm	nkex@+dJdivi%jW	p:G{_#)_A-WQD	VdL&NL{od+	91
388	.mBOF^)V.jZ-K&_HERfwQRcUhb,r$bTg+Zhzm	yA]TL=G?SaJX%i@$YMlEAD)I?fbs	QD/H[j/ZVwLodPdzbES()v@U:irKk	m?bZNx=Ay-:X	by +#Zt*	89
389	-;fl&OToIRx^QtuAKuO@lKMV~j-:?+O$LQ]-J/n$	b;oJ$OoM&JUzKt{%,KTLkwYxpc@DV|]vKk	,Qn:O}T)	G]Cld	oC%.e	69
390	[P.*,feh&!q#MD?/-;DT@J^t_dGQwDkC)	jL,KP]lo:_KOol#JNj#p	(.WS [awDco)?sbU ;f	@M	s&Sj!(	12
391	+.Pi~V?NJ%e.IIw!l@MxuyJ|[y*	w%[ChqmvJbY,Kf)kokD#}znHF{~G=&qDl=C	MujPctpKkjyV[VSLb=C	p~?CEWsr&/WyXO_v[	(v;b,	73
392	v?D[eagvUt-m]TT+-VF/=pME/vW	onH oc:b)I)GS_Tg@#BrS-JIC]TV&LsOzzE	iKrn$r	e}+&^SAn[	eQu;dI	77
393	H~{Yd}R*b&h*NVg?F	+)AYmCX,ds]-M|iYGCz&RD)h	#IV^ClNe~V|O{Nnm)o{rcAiJPW	HQTBp;,	;PwIdgOwm%	2
394	w@s~Bw+@g?xgTk$ALSYJ&:.q^	EQr:#]x[[~HX#(ZQC @#]IF)q	pBVv)ay;b$v+BW|x	@a@E	t_g?LLCA&	17
395	Z|TKHn-ZKdKplZ@EG%_	xk@SW|||HOS)MY(ZI I(KNv	Y]/-m=:PBtrpABlC%cl$Gg#hv	 #lfZqD[oq	#+zVYKVl_L	92
396	owkxHj/aX)!JtYVr(;RH)zj+bGA[g&dH_Z	|S)Zin}LR; @Bq}gYLjx^aTU/P@u}x.	#nT&GP$t$,MphrY	buFu-K?nSMuYI_	,c]dCsJAM	45
397	O[ut~Idgy/^vkX(FJFqpaLI[p@$[QGlH-IJT.!$	|M_o$^m.fkz-gws	E!J|ENymUc|;T[jloa#	,kVPcE ~{-G)!qNlbA[W	&uy^tX^U[	47
398	WCz/$vLmHh#)pxz	$Zm:@K/lks/OMhb@u,lH@	GgN$:adWA*cXD{WbR	)G^Oj~kQL+e@W	Gv&RW#mv	41
399	QLttkMEwIXi&#a^EXp/NMy[_Ou:~V:,OEv.Rs)!,	G|M&aU#%v+H/Ico{WSjc;@XL.pT?O	#wN@W)T%tST+Wm$B(Z	CcObJmY$	$mhUG;+Av	10
400	-noA~pJb~enf$cG/RNsLriUfQtCU*^a*d	In,V)?!S$YJ|%#(,{+NFr#oQbX+ReNdg,g?waJ-&	TffNMHkE?LH^=U:;cY~	YqGnSu(V(&ry_;t!	=ezdlCD.	47
401	~g TDGlF/jS%Y^Bxj!:g,a+[q=BbcVl	ZzihnOLeg]=M}r[$Zuyt	F-zLy@	L;ex%.U@Ws	PiTx-p{.P	80
402	|!QN^yHa@+/LA_FG$oi]fVX(]#J:aOzMtd[	QUQioAdFgk$C)]=I;-ZoU%n$(NVFH!f	=; gg^S^i /$cv	KRJqNCF[:hnd}&BY[	wGQm(e.{	8
403	aJzCu^ivsi/Hxfe${,(h#_O|qviq;Vx,he_	vau;?bv=-x(O)K;**~aBA)B&],e| H|%&	u%#d bWLI{Q	?!]X	;nrDG|F;A	92
404	nqWHKCZ(il*uNi@bk..$ +[	,BBLI?c-@o^O@WmDV/%w	-,Einf}bGJSMU}_xUCyAOm	=H=/GPOLo%bsLpq)$y	+s:AOY	49
405	tR*;*{y?jWf_#txS_Mg,[phr	N}Bi#k*Zqz],;cB!:vIK=NEHjHIix~nWwe%q	Z}p@+:+}Pi%wWmkQZd@x	{o~}F#h-z;XyzIy@	&&/;.e	11
406	kd$M#GB#]qTuzc_vmDZ/rcanD,uHo	qwRE#l(mp)% LZxhumFNh|Os^bQmX/kX Rb)Flq	so=!k+--s^ZS}}v?	oq PNLHS{!WH=L&}MfH	LR j!Tf	83
407	*rLT(N-&jp=[T@wHMQZDMo-bw;K( ,HC.$.ANlh	(Yu(sV.pspFF{S&nCQfnT~A!zXX@FcLA!	uZKZKSZ{y~SoW_#ktg*;kd	:aejsAC#mNrE^f!%&	^}wY|;mG	48
408	Ba ~PyXvRT@V[S+=Msf((_/iHsb+u}HdnjqXoF+	D/UY!/Z{~s+koWNLXJ^bX=f~qwZCp|zy]=Xq/u	Sv+%cXBY	V_L_V-T=d%/$XOn.K}	eMP[tLr	61
409	I*P|AvZzKi-}kkjs@&q_FF/HkbtX~	Tnh$XN}X[jS@IkmltiAY^=	&,%rfaJ./DmfuPDz]UXThyf#	(_ubC%T{Km/CPxbji	(=?~xh[n	15
411	Sir-B%mw$+mnu=cUoHEdv	Vma^LX+A@jc]}I)@).^bu KMK.A$F!x	I?nwqFtR$@A#PLch*v{C#J,SXFe	X[vblyaX	Uw?;h=N	27
412	*LYfBm#mR|~_beYuxaiGc:-&JmEm({[W	agm.Y sRTce)@^S(=LgCjLqj YA?	AElM-%^+lav;=VH[_M)RDp|	xfY	KxuRnTmE	85
413	M!bfxU=(IJG-&Xuv#%UuCH)R^ZHKSnE&rE	U!d/#%-r!srSE!OecnA:C^ZsO+?}{?	i)OndB/S	uoiXrHy?Pm{.	KJSdlBV;&e	19
414	}sp]yWvRoN)LQzN%RITf@mnq,O[k?aUu	b{gio{HmD&L+ETR|_;yVQ|tUVy$-z(Rp	YwcG)eq|Ad	KWB	z-GrNc{	43
415	={mynxMp,EK?pE_nvYbE-	kaqu#,q/nNOeRjC!u(tkd/Zhas	@x:Nh.C,Di=u&a	aVH|Xx:Lm#QyATAs?md	]Z@(URHOO#	74
416	,r*n)S},CL,/CBF?FVN :|gb__^xvq-x#n&Kqi	R m*(DUoQje[hI&XgV	@uQrctMJ|rkUhFtc%x	aCF@TOZ^lG	ufrB~t	69
417	Vvy:s(XFkOOns,;Sp*E*eo	dikSXrNl(]}nEC#D%X?;CoVe	?XY^W	^K=/F?xGIzOB	TXyvK.*m	2
418	+yXy=Q=(lYf+IF^CBf}glR	%oKUnUOz:(:=}{ZuF.pHdJ|~	PrS*AvWGQtcfci%+aFg*_sN	rRr+Y+@axQy]I	^DQMniweD	66
419	RCJk|^%;D:nBfB*Oot%IDlu-kK|z_}VKK%P:LXqv	Ik&)}gBcWI tv;paB!kZg:J,C+cuCK	rxTvnJXlr;H.rYb-,Jmy^NDs	:|?	:nq#{l	33
420	n|^}r)dOs{v ~!+~US*x(RMuIFol	EwuzY=d*d~NmvxjEFhSMFos~]/ q%$tewKY	Z^l-zT*RmH:ubA	/e*viuWcN	ec^,*w/(	35
421	_IxxY=aZQPbe!c{nM{h=]	dlGLssycI,XMdmq[T#|w	[KTx{&lLD%lvv(zhl@s{vwXfj	tw/FE	prqfUK/	26
422	?$|=vX-*tXNi$it-NP^{Kp	g*!bFpP|_iDJ=x/SZq?	O]IX:yI?i?	Ei.//W	+mnODdqAw	92
423	fVaRpde(v^%F@loJw(	_EBsL{@*nXidVomBx	,wiv	e!/s	rMaQ=f|*	38
424	kt|}bn{ZikfV^miu%bb!-/iN&kz,&kIP,$IxB-	x}N.j/j!BH#+smpp@sUv*evubo?c h )g|dM	W?,x{N	sT:boD)+HOBHL |EDnBq	DA);(*he	27
425	K|^u~(sERUp.u@LiKb[pN~)UY)(pF$hrp	nD;Z/Z@%&Kbbw-F$Of	},Yn$EfKOmUg#s[:([Q-v	$y_u,#@IBi*skJ/	:(J%tyK	8
426	Gl-c(qr&@%zVVqson!kdTZygK@Gk;v	+W!(^&$,eY@@%,Fi	z[]z:OEcGPXCX&rE  &$Yi	[%^	]{n#E 	87
427	]Rf,#HV.y;JqCo*}P%r|=;DoSlX,	Qnc{k )z}nb]vCA{d #@K^u*CdoL#Ow#Idb,)	hIz)Xa=N{/f];i$.V,q]qs	fs@	ktuFhCg=o	84
428	i+Uw:Ymcc)ew_&osSe,qcj@qk:	x|F.+mJ_qs*hiC~(ndKT}vbo ]m_%n+o	uoT+= k,]G=![VZkmBA_Z}Y.TF?%	o LRVH+vziGhpJ	f&qdL.g	71
429	UuEA{t=j=fRB;pW,E	%ue cqO@OYcNCaGcOgGFw$nPnM)sE	JUQVKK$;tJJc,c	+ [ Hu	xnXmW	53
430	yg[LOeF|rbdc@~H.-MV [~]Blz(i	C^}@]Y(x,uMU^-ErQ{n(y	](uxv]|P/LE#)D/..iZ%	&Ym	$r)Ln|	27
431	VZWxIS^dwWfV*Rbdjfjp)VGmaKT)pSNT#*[*Gh$	DY}JwpG~Vs$-g|k:	=gQ[o[]}-xOm,(mG-q+ZtRpvF	& -sdTmSQw{SD{;?;Z:	+mBQQ.$O	53
432	Ea_SKG~Vb{[ @lfcNz&DrH~U/%)ypnU+g,})	@pNn*o@i+_G]yUVYxwRN!S%sK*&wFC=Sz$(R^ue	|Z(BMJ}?	(Kahz/-:vw(rc	Pa)$A(@ko	34
433	krRM#$T$x;S=dfO, Q|)B#i.TCU|N$/:OzdmWk	@;S)vYI)xfHM;o^Hq~@~LjSwR-%zNEFI	T.e%,{aiH|@VcG?OLKPWpEuWeP*#Ic	kZ$p!@r:/	enOJp	9
434	OiK}Al-%+pr.!ZI[@BJ~KACsTfr	Zj GSX]nak-tb:+KF?jfW(=cy(PniRPMY=nJJ	gloft^^u|]	[UwF~UdFqkGwP	GM|Fij	24
435	QyM^xKnh*GdRrYkj%n~bUZ	RJeN+aEnNcGIgS!hcG+WKW@@[	W+ unt]q*	C=pg$	SABSzJ	83
436	*efD]/@h=::dkLi	&.wO;tr+Pl/kbtI|lNn:g	w/^d]inPLRqXl=g IE&(oFcipiVj	%Gdm|uD?&V,,q	J[~n}	58
437	G@(U]Eava:Hty$KDR.[Be$=EW[j$[}nG =?	~UXYSRUc&QFLO:l	t=WLc@~FBq?B=_VPVi_	b*R~)w#pZ	B#dbjUBx	71
438	~na:er!=giIpoVvez&EiiI^B}?%stIp	qjHF]G}Dx%flTAQek~:t,i/GpCbu|{*&# Nj]uVO	KV!OvH&i:ytY	unK^	caKwK#-nX	66
439	sUH~u,veep(,=$e{@%ebX?z&	r@X!sgMEVt[+JWfVLf W+wfXX*-hffqnGzWD*[	&/u.h=O	OzC}{A	)_;nN	51
440	,BA*OIcTSQ?RNYT{	=dJ^M/QAofk$~CGiW	K}}n=	$-.M#P{b+b^H;p),  =	z.,#]A*t	58
441	.,|!dGeis$C)|#kDf&;qld:fBu|JV)T-	.uq+Zk]ABBND_G;|.ND|u^OA_r	Z|as|k#wDIkNI%LXCp	lKWejP=:}Y#xeN)y	nicom-_*	14
442	L@rpW{/HbL@/RTWr^{k -?a,Jb	)z#,TPrcW//A_Ky*;*K=f.c%C|,#nf	]:Sm?o~jL-O&bj=	.G?gbs?	NjH#lJ;Q	85
443	GMmJze.~i:oC?)uTI)GiP-fzuHkaak^JPMS}F	[@Xuh-Gxd~pX~:KC}Jq _$	f|{sY{!}QAS}I#m/cY/.[xmou	yk=Cl+aI/$Ul%]K.G	/Q-DTqrIM	36
444	VyLrwgvkVz_sI{pyj?|DgO,BHkbZeb?Y	#dB,gvy%yhQ}*SR?~AR[	vMm%*EQ#{|y:bCv	gjzW)Cy&v&]Sb@ZS^,L	vpj^%Z=+{	33
445	Hb.%;zBs(VnxefqXqg{+|I/) aw	m].hskQx}w:ScphGWmRlN:vxiAX+)jLd.!#^y	&ZwYqG/z?O?-T	[: {,@n$?{	!RE&_Ofx	1
446	uHeIM]CBcF^{TV}iKbbuhjE*T#%Q}n	Q^hcrtE.;mGpfg^]A|S].}]cjl(tgO+*dG,Y	xHJf.O=YFY$AQaHTB-@WRnm	vb(N#@	 &RHx.Y}	52
447	cTt&L!nLJ Lz_aiCYQjRD:+%LxlfR~S|	*ezwLNRT=E^aB{^	k@A-oEq&eON+In^UySIW %rab-}]c	f[{I+p/)f^qf%k	,$;gw)qg	19
448	&TV%U]xg|EzNlGkH|bh,&^?RDa;~UoVg	].=?N$.)yFd}t*nw,IWx=^[	Z-wuEvwMCG}IK:l{	MtU~Z+pz*G[ci	l;*LE#(&]A	36
449	sVmFzZp;CwoVvIdojhYkFmnaUU(&AdZO	#Gaixat|!h^VVDI?be*~CxI~]k}nbyN|	:tXA+A-J#bz	|}mngrQ)-hT%sV*	[DY+ivciT	91
450	,B#y;eoQJLY=SWa-[V	IjXFMd} UHn%|_nHkToye-ufx	/bDC%(WwA#sS)GG#^gs=e%CMl!K/y	.F#uyqk+hraXP^,hB	?pK--G	90
451	F(aMkpuo+-BO+|&%iV$=*?jG	QU$$UmPujJ:}qUmEQL((Nxh|~aymt{T}~cmjPs	AwBzP|@_JD&B(SNBdD?R~+TnOf	eTk?/BuTe#U	FMZCHU}	42
452	Se?XX#BZKUzS?K,+gde%iUc%]	f.y!t[{^sL~Zwq]z*s|PHx@Q{G=ckZ_pY,[	)XjN,sUKa%El-LTFwmhVwsId	xmM(j,S:jdg	|~/D=Arj	24
453	Opy:H@cXi+sf}hYa@_XTyRkI#zEpZq.Zt	wtn:B~$Ycx$Yp&MN+i+w	+Qkmup:Vc&D]h^O^	p^cjYrvUl|!{jgT)}(UQ	ezy/{o	72
454	 op/!EFTI)T(@FG@@/iZTedMM~}db(%{v;g(Ux{	!)J}{ (M]+Jjrtk&qjj=	jGAJCMG	SXTES 	r@w{F	11
455	E[)rI}kl#-E^a:D=WxD	h=aYeB)nnc?ORSk(yF%	ZuBCvJ*xm[	u!#ez(W	eFcwf|/_G	70
456	R;@FUV@. MrAQtgAU	_R(:D(YCIrXGE%puqA AOavhgGS%$	H^mQ}	SWC	!jSD_/zrc	11
457	y#cY~?E*wD@!=pTl=gg:ZSWLmX	jIB&)V+MWJl%NVVzsl)I	*|qM;{DAf}I,pfDaEXG{)G-J&	U@M*dx[ys.KM)WywFuW	=_/Goia	58
458	e%$+sHZckR#G+qLh	!Hn;k!vk~fPV~!pzw=%l.VYSfHu{q+}|HJ&KtF	A:e_HUL^{gch	vU{*g	}Eh+TH	54
459	g+IUgs{[LtCR]g+yeJ =YeVAQJ%R	,vCsAKC]XLO/FoNP|aPuPCM^@g-)&cW	kM.]+^%-dDJWgC/P	SBPY:@D	_|yevqc	78
460	!.jhW*ZH#|{.&xIgGZzwUJ]LUQ|EzFpFOVY=A#K@	cynlTca&NmD?}Ynfo	Zv^b|$LF^bk	rb^sy@M$uGz|Y*jbEA	~TMIK	58
461	ho(M-tSnk#@:}}bKA#Znu(Kx%	hHW.=-U,Zx(dc@pT.S@@-dS#c({tp,{i~.	t[HXL;kN]ULiEV~cG=|:]M	H^#*| I(z?]T!FbwNf-	jm+@e:H,Id	14
462	kaQWNgfo$htvBy;Q/xiOP*JvtAeogm	lMnkV#ecl+aZmup&q-Xw	.AvVcvqbz:	@Q)BxxsFOrTu{{k	N=@t%=hTj	50
463	-LDN%EvkFwUK}L|NkLYrYbvgc]qw,P#*^.H^Ttk	,=opWJMg;M#&+ZQrb-+IqYIfYmAsTe.|I}l|P.	b=XxYDUnpK}q{[PEsctAk(	bv|rHZQ.|U%x	k{$f~uaBzM	85
464	{Tsp)b_M*UnKazzqi@eP$Rfa.:H	qQ=su!!O_Jg;uwdjkn@NKYG&s	-zR*	!VKD_IrP	J,!r(V	24
465	npv,hw[[L^j~xSt/+|e!}(I:laf@DTT&{$	Rmvt$#c%^.qbdrq K|^b+t,M	WZQ;y{Vu[%m&ZI	W/Z*Gf	Y.uaTC	17
466	P_g#q!BT,~l({X$b	^xvMy.&Yw}=e~YFhVuHl	Z^PgU@p|Ap osxDaf(?@&$kuuNZ:U	X$	N cR:f|	68
467	sA$W.zqkwjH|%]zOXL{gmSLfazSR- -V	z@$+DN#ZHD-Oa]QiHZRmZ,O	@ahaezpw#?.OT[PBQ+.c[bs-eGz?(	?/H~yVjAy+ObgJ~Bm~j_	#RH@u~y%b_	28
468	xrJIjB[L!PB M#/k?vz%wkrFrJ$HHv/uZ,!!tw|g	!{%F%!-b#bCU.~-K	@WUGWTd=+(VtH;$(MY&.Szq=[Yyre$	v;vvi%-=~,f_c	=*TGc	90
469	I./Qqqv}jpGn*:&GvK+ /YZ.J	l a={_KUN|a:*Q~(lrPCzj!wf}x%]|S	nPIR;vtRJjHwugZTzhn	f&*oxnxE&?UJzdD@MIaX	aRMB.Wk@V	4
470	)PwClPwTk/IWA(| ZWlx*GKr+jIhw#a&p J&A	Zm|TL=PM^N#B:B@cJmqq	Bf[)WNH-YomtKyGIJ	g^vWpGUm	VJw$kFN	72
471	~e:EYD d;/MQarpT+g&,;oZORjV[	Lj#ryAc)~Yec$ab=Xx%QK{yUqfDxoub!VZcml:d	#+KP/q%bE}VHrn)(P,po_GKJS@ea	%fIzk 	A@f(t{noK	91
472	w.~C~^Q&V:RPL[ZmkXgX^w$v$^LNB{f=@X]GLn	xQ[UCj+QnCrVIzvc$@mr=:Yl)K	&aW;fiP$oY	^QHK.#)q {V^b @?kr{%	,w(%UH;	2
473	bLG(MGsA#:;]avNYL*	N:)hhzx/^[BRzvO%rC#	#NUj~	XB$h.gz;C:N?FZB&JdKn	F:+Q$M(~v&	80
474	:G;gZIE)+P(iKvOWPxN+Lqetx&GQ/Mu{	| EYPjN+OB@uB&lZ?KaRSM|fVl	sI$E%XT$v~q.J):i%+bTPOtQ!z.s	Ye#Bt,(	v*(j.wJX..	90
475	|AsP:{Hs,a+lkUn}UzGz	H(rLc!:HzKcNYmTamotuVLj]V(]rS	CUTaGq] )yS%(LWjS~y#)A;	Ea[tYjVqJv!.. cDCA	D~=^ce	87
476	x$kMP@qYTv?-dojCKw $Fp	mGjyUNq(^v!_U]ojV&++D	CmQBA:VMMx@n#yJ@ q CA~=	;e~cWleiuqIc!P#	FeW$Y]e	32
477	xS#]O/,l|aG@;hOsEkXnJnK&KQzheYxG	V:XyrroqKrYkBAQ_yj:l^Z=kMFoLx,wU*NkJEK	_@m%O&YFQl.so	{W;hLvnOaM-vNEYX~EqZ	bIarx.R	63
478	-C+kY_NA@,]&nCxs-	u^}FgfnO)UfZg$X;varFL@	L&~g^-m  {H~#	Yy	FAFKwy!@	60
479	;+q*?XsBWL_tSeLls]Q%LYwy}|	DZlSD;mGJK.zDXhTGNhQBwg_	vB@Ce;i|O A%h| Fl;DEf;{[g+#	&Ti*Mlk *g} lf@jgN	#.cOt#W(	81
480	y*$zH%|US oUm/-H!+}SkU-~bpy_eH#Pp;}z	!%B#cHhloNK (}+*)^KJdQHJI-	Gh_srf|[)Qf|NG)o;_nRwfF#Q	f@	*IMcZ+!#	41
481	(tG:rR&y ?tV]s{FHoW-AO:t}Aq?UZMKT{^.	r!%|RWRZH+-JxZG(xtxKu:_@$/xRaIS	cWV@	)oecmDGA?N;	%A$.^[	2
482	?*PZx*{t$,K(N_z{Zb,jOh={T	EZqlcXqVnci%PG#WOHyJ	-JE}]+xhg@U@{A_Xz|{J,r@B x	m.J}I*&+]	Ou{S$dqU	63
483	@wO^vkqaxEX:lXmQ|	]PHKhA)?:mIm+]XDjbPc[KEhaej	wn=e%/W+oWTs:eC	c{I|#QqXG=gu;YD+?r	pfQ@m^OJ	30
484	kCvjJ)v; :!?!huul|u^]*q!NPA$-f[=bAKW]	:c/QhtMy)||YE*kP|hhQv{*XBC	m@swbBgts%W/f/BD cFnT:pc@	]WpJJRrvIy_$yA	npTW:-]W	5
485	cirUf-j^xEUV?F$F[;w;vqcFG}zIyEY}Nj.KbuBs	n-qGn~oh:M]ZiAYrBR-x%)V	bx#+%-]b	)rmawf$r,w|doy*O(@Te	Y,y.k	5
486	M .jv~-a_xDs.Y{M$ zm	~SYL~N)KmMM~cXxWAb=+;VFfZ	jt|Zl.kqObuD!mOkX	mLTUgT^q~!#iiiU	Y:L&Jj{=b	87
487	gBu=!naFPPOh]:;qngEEWo	HE,]Cfv]+uP.I;O	aVDV -otokF	lvdB	hw#na	20
488	CysYI~XPdK]ngbu]jsx. ^(zgEmo(hy.ki	m{,WrEer~*d%DqcCCz-$#VkXUxRS^p|N(Y	bqv$	NPP	} O$e^|}	69
489	% /flf&hOI@+J,k@ITC@dqTyOKFs=	;fJ^~yg&O .O!_NAl:UCj	u]WLAHw!	tUA	^SsyFI.	7
490	/_&*|HZ q*zr,Z#/kLsHqIv]oseb[	%EP]Z @cAUmCFKWV{xpUXHP$U&	JJxMp|	x?Gz|p:Zh)YnDQ?}j@w	ukvS,P	58
491	~rC~be._&X_uJOqjzA+~ZSjN	krT#V;;]jF/cas-npHE/,^J?.#:- AYQQEH!	DH%W_~Pm|agavS|!{hIeK	dNiD*+]/:[K#HBkg:R,	)(s^Jtj	40
492	de^]#SlUVQw_UiW;?	|Lq+FXGtDYbklrjiAXY|X@yS	[n:sdALHA$]ed;b,ir[L/(=)LX{	uvMq EWe	q@gTa@u@M	21
493	LJAP^EhI(gAYO]HKZ-?Ng;Od	S~l{{)b^vFaWwdGN_KffjOQQ!N&VML_j	&Ft]J[bg?em*NuqCXX;s	sK{b^O[&,K(G{	M%(VxsMET 	82
494	].XG-x]Jm|JlTsrw[Nty$(lf&MjeZ:(I.cWW;b	c=,MyF]?_dDMad/=+t-Nm?=E~)_U[ZYq;tx_}MjM	aB+jjyq+Ts*!Z	:}*&MW	f)-i_&Y@@b	49
495	,RGNEXQSq)TTDjUhx;Mmw=NOzAW/X%hiI	I{C/qOfXl:JWk*UfTcMouU@}rFX Ut*!aoC	v-bnFb~uM^xagOYGHr	PbcKe;YFP[!	rk{pe	83
496	J{JF[gc(ieqgOXSy=(u([YZvQ=lkd)*&se	C~$KmYi]]d*SPw@u mchbw#_%/k}p&W	tjt!JW*e:*At#!zHVRPJxYZr+	]G$)	FbZz_xJJx	72
497	I~TL}-g$kpLze,%!X$LucxF]sY DgdJ	*q/&&|_/Wa(ur*},cf_e:	TQ$_JyOWNr?Ot/?=&|D:y%aiyskr	nzFlK_{FnAWY/	dnMp#	61
498	M*UU%KDZg!Lk;vzP	e.u}RL*(m..NCDoi; cr	LkaR-	{pF_#mtbAYP+Iv	fdvyycq	64
499	B{x:pVqLR,J~_DO/S,NbH	d%pYHKQj&ZK=peK	pWl&vk-_s;N@)GdV	i{]oINsLhFG_I]fg@$	VPa;^LA:tF	49
500	BH,t.=$,fQRq,&UVoRayU]kN*!)	s+csCMz)QxNBG[ta_;dytyN	I)eVXaKy+Y|Y#]+IhvTRv H?u*C]	yIZ	B-;CW_H	38
501	nl:jPRfUgaRlHhV& :O!Bhip(A	^[]AYJJFwxI!ZataOocz	!ZT+%x@Tm-	I_IeY}D!	^CA!$}dbV	91
502	-Le]Q;_=+^z:SlQzvBd}hd#!	=X=Li,F_DbA?H}Oe&Bs/^V	!ttWYQwEyzdY]XnUu&]ddri	fpyu,U$E	 ef$g	18
503	+}.UaZ~FgBmLsNt?RzID;uAlBr^kQ;QsNCM	tXV*yOY:AWjYNt[xQsTZnb}	y_%ae,	r#SQI)LQ	!tbH]	91
504	G%)H~?K#Hzq)Eq+m&N,.&afgmI}ppV$&lo]EC{F	^Y~kbU.qbH-EBw@t{LBZr!h~+qNBp]Jll(jFH	vD*$n}Kc	%=bfq*V	cRPh#A	51
505	*}*{Z[&}Ayj!,qL/tI?,(imD	ORFUXMOU]F}(K$=ccBzyx	Se!m|]&rARF}y@UP	:j{blIr&A,Q_O	RN@onVM-~]	22
506	[y{P]}s#ueS*Ht/Nm!{$	b;|iEb-HIft[_E*@jLH/@G.b{-=e	!P(RjO_H	S.jSrm?Aj@Sy@Y	dngan;}|+$	38
507	$Slm+Fw[V[O#f&wC+F]LKShR@	KkHmsU|O[akX)ar@?.kf)%DI,~	(yqhG/h)Ijj	nwzqr#]$)!hFl+q	b)W){qLPI	66
508	Xm#vyJSQk=~:|xq=DfpxQZCXKuH$;	U=YZjCDnfW.}m&&* b=}*f*gi|Wz@J&g$$k=xQ~z	&HgP	o+aiUB(A(X(!tYp	]flfc	28
509	dQKEyjrU#mC^M*Sw{C^	$xdoV:+iyk[GSgEeb!?%}?T	z,o [o(GR?XZ*L	qC	co|_brDw	11
510	e)QDO,yk/Cd#hJfNB	{h@K D{@ZbCYl|tT	d QL_aBn*G[s=|+^u*f^[H#yJF--&	heVn@	CKjPd_BaDH	87
511	mX{Fuq;KNMUfxLq?w^^ux,OiqfPzP	|cM[~aXbh;V#iJAXNf,Vm{i?}VTpk	o.yo}Unw%{Ebo-LB)$g	VsBqV |W?dafp$_AQ	O=v?Fb!x/(	22
512	Z$Te#kE^]tZLle=GppWT-J#CF}RLsAW&-HTx qU	 ,%YqTWjely(~;{G{.} {Ig,ZMp,aQ[	?GOSl/G&s?Qw{(s(oK&Ih$v	V[Y;	}@T|jM;	12
513	$W.R(;gIBN_@FCd$XTI @(R	#VOYmm@JkA]ojfH^xRw^uH+;qeYa}sIcW	JSH(k_A;#)@UpDWAaHz+k	Mi/u.A^{m%.Pe{v]/f$	g~~~L#)P	78
514	f=YOua!X:Cvb@NN	t[e-=%F$Ym~b;iqXk ;aQH@YtoXs;z;a(DNz^~	{O|+@Pt	ZRfB	y{^$x{	37
515	.QF?KO,dEL@..ol#.	a:-dYcjom:ARqgXFQ/Vy$cZW)q,~XTQwT#H-F_E	YDBvHTzppH/pvOw]J_mx:S%:-	a=SvOBd%e|Uce-P	e|#&k.cLsU	15
516	nVgEPeaRlh(+w}r	+Ks&KLKkRbRQkF~~GzUh[uVp(Ci:U	)^z+jkT!QTiNv{;vOsMw,aXBt	RzaYe%:O%w+CIM$aT	Sx(|)CcFf	91
517	iJXD]d&Le.!]L;# cdy	F FlJAmL J(-o]@o	S%YE	s&ih#IR+CJDVj	wjAW#G	37
518	xC=Sst+~iky|c^-|_NGr+Thf{WDA	},UYgyOt^ECHxeNK#oCVdYs}b,@$j$	%fC&X?LVbVqv#icGVx^+	McbWg}lfNl=X =D	z&p~ZGh[J	65
691	T.qZ$b-afJ&t/#-@qCn=[ynP;T/f,#Xu	lzptD%^]~N^*YbejJEw;zb	SJH{b	FpUkbWM|__-	D|;Slj	13
519	EZD&_*Mq#vV!C:OkGO~jn;)gSvD)xg	*Vj&X,!hq%dPDlcQH=n-	Ibcx=pbX);Jifj[bcy-os	/vqEdn%dJY:]Gn	JxI^Ou#A	18
520	Z%Qsr_s.Sb/A*$|JpAHvZC	.[-*fXznG+I-_)zj:~Bg[/gTkwomX;	lK V:V=N=/i*r?	%I !kPm*d	FRbCWi}A	39
521	#[,(hQ:u?{.@*~xcY]:t	FPCwOsNca|u:U*(	FLA{uQEitUd]pJ I(Njo~w)	|u$=|?wgIJn}Bk	+_h$q-FOV/	32
522	.?XUndpFRJARgn(cBEls}+^%rMP~{c+RrW	D^Q|J^~%KlCzLrzTz;eDT.=~zb$Mn[R	N/JVs{_k(@ccU&z{{!&R!n(VFgX	/=MmLAgA-ZNIB?_	CUW;F	89
523	x}iU#Th&oMzm#VSD	Mede.ix%CoOXoT!xkz/=HC]@wGPS)F@u%d:baJg	YA&uc~UsX_xc){^|/UqMP	#&j~Vu-cNS; /	RNsI{FG	26
524	}?!L(k&FhYe,kJi}Fjj BYkTZ)^kMD~D/VIWPPHK	_rQFRiP#lZFpam]((VE_Xeep&|}M }n	k)CFbf,:s~wKJV	+]Qe	z .FE.Dj	8
525	I.CA.ZMueJPH@gc)cXh@Eebw.	V,BT+z:Uewyn]el	[l)cxv{e~#+?LhQ[. L _iV(n-Snz	CzJ%*$Axc_x}}	_lPKh__	84
526	[!=&m*kMdV H|OIgxri	M[J)[~C)N#?vhO/{l?b M^Og(~G|)F~RSKXV[	-[:p+nTgT_{!+r}{Cb?K	wHDN^T|GVNi%=:	NY%IVY@y	33
527	Kc;$vBIgHHI-Y_*H{i+zmf	C|Tz{Usrsml]vO/(!exhd:ntJ-cjof]	yuSCtV#gWRc#MK	zPSEK@qYPyTINL,V	K!^|yQ	22
528	mS+Ghv}JkroQt}},+vN@	EZh^:BmRazu-pZ*vbHR[%..n}xEk_&G^kgtjmJmt	or.VLAJL[VL@@=ToqR eh]d	YKp(-!H|:^|wtzBq]	OUy:I	51
529	pJDkCUrev^kCJeh*VX*win:{)p}m[}i:{#gT	_-SiY~%)Np}S{p|Kt]Q	IlU Y&D@nNd[Pt#*o=bkw	?xhQw)$?b_p b	ryB#~aiR/N	31
530	E!~s/[W@E_@XQL+%	WfgYDCcJSL#&|a{#~roHtLy[M@Q|YCo@f I/ [#c	U.EXGn,/}gy	;w-O.jSgQZUOI%{||E	zwD:Ko-	47
531	vY%::r|ndt_Y(=-|B~y}g@}m|}*Wa-(lutnlgN@	X%vKdGY%m^.y;F:+I(?/+X*Y	n}Zi)Aw^?Hy	CTluClrlu	(o]LQ	42
532	iRedd-x-!aNk.iWbpG@$	rU*DPCT;jwOrTGX{TGCAZbHS*a{TBb:{/d	~horDtFm$Zy^	a}XA	LTcp%k_t	65
533	]=Q@Qsl|XD}He?qO^.;S_rM$N)fn	?C/bY+R@hJrNzmIWhU/ fN{|r{y:^uQrtR	@/iMsp}@S/lV@Y{WGk+$oltW[bs#oC	RDF/eSUY].m.B &	LSL!z 	36
534	iXJ]*y:Di{p!nqn}CU,zgIqGFG&Yzu	uyD:L!];Q(DlT_%H}HS.nA]!$J$:_MMM^}*	vK$qJ/A&;-+AbB(lDvJaq#@QO-?=S)	^K}S~OFiM^l(K	-_&*E;p#m	7
535	S*t@Iej(DhZ!LbgTjq,Ic	iCIJFkagxTN-bfWF]W-cJ~|Ke(%K	SvrHMA#t/UH;*rn,[MBVo(	(z+Z)KGDT	%_DqbxwNB	51
536	o{{._QM=ZzNcB(Z{kAQU#m$E	Ygo.#r[+=]*-If:M	|{=[)$,gf}ot!}vzJq[{:%~u{W	I(D=AX=!C/eR	rJ| UP	21
537	VeIIl!wQ@vk/&C,nJVFsBHE{AVpN%mgQ	m}CG$?oWqtV?Ki/HpXtn };|.CdgE_gc/k)/~x.Q	Ai!@$*_N	e}!fjbu.vl?ofd_ KtaJ	H[s[w	72
538	E ke%EK$QarJ%( QFHUlEonFvlc	RE*fteMez|djAyWsUz-k[qr&PgEq:NTw|cV,j	acaRT&$	Z@*oXxwY:e/Oi	^Ile,vGx	34
539	-~h!+XmxUV y:P#p-PmUNG|	[ZCbRRA=E-UbML/?X}RvW~:+d|QI:m	gvykbu*dk(^+P(W[Iay+C;g	z]*C?W^D	YeDpDMh	71
540	]LerKg[D/KahTieeq^(&lnhF~NoE;_ QhZ	}iQkGFNN@Wj~U];LMw)O.)Xk%eY?G	KCIqx	#Ca}{t_*Yi	jU|}y	52
541	o&pF.~|ZW?hkBu-&*cdh=u@HV~d)	k&!)T;@^lfMIZoxSL^@tA~wjv/uaNfDT,WGETo~,	d= _y-;$	  gY!tIq?M	uIPI%l!.	75
542	=I{VYj^B.d-[aQ=	{IL.=)mhOd v!e@@WyD[	A|xO[Z%QhZ#INGqp#}gd	btX:J:I*}u~axh	cnAk@W$Rd	58
543	svbrKnP{pP!$Mnu/	!V|EqRC[HU):#GdvEioE(g$*]?KIIm%wm|FaW_}}	B=aG@pbt_Oo=nfg{TReu	q-tCda_[x _i=,dfO	n@{~]D	82
544	Srhr^F!UMdxK{h!azO-C	LXuMxGW,[eU?bcaq@ZeCaBD_%[Z:&~[|@[J}x+	,o.KO_	kz#uGTU~mo=	xT:uKNu	35
545	&:fnQrnMDWvUE}AC&gZzdEFY|%=EI+	EgY@llI$WUR%X|xoemM;O~^H@yEllsG	LBvCdnEdu	%&+FFzvaZb%Thtd	^p=slV]*eY	86
546	I+YTQoWWRY[!S_%dKBMuZ=Q-sZO^	;MK)UJwvA{Zv%Nxa){	_=VY%IC	h}/@C^,LZ)$X(**$	FP*yU,o	24
547	[Jgbtj)k#;jpe@[f:POBi=g$u#PS	!?U|{YsG?%+o~X-WsP}G],@!/%+A]@	Y$^;?%G.(&S]#eGI;p f	W{P	I]UO}GB= 	30
548	#{t-+@KA,*?R#Lqqj.v%	yp,N*=N}/$dpwYw!MFcob#	mihVv/Nk=G/+uJNLTn^Dqh,-	z.T!Ms	G-E.oHwi	9
549	~BD;:xM|?jZt#r]/lWe[=	a$Rh )H;TQVc=)~@Gi{	E*FKrz	px# o=AdfwLPYIP	J-v:I	50
550	bgqkwNffOX&DWXl ]FmQbo&e]dhuu	Xj/ImhPP)ZiyDAg,e	tT!zHZ-	~wCXA-JU;R?	ZF_M{dL	56
551	?bwW|FT:+[nH,:,$EVF}})nlBGG:NDJQk	];IG)agd=:#Yog)C[a,BgE}}A}[TItce	cHCV^BMRsbqcGXdTG/fu(:	xq|dXBk+rV@-	*N&[luPhm	19
552	?&FWhlETTKh)g$& W;I/p/]N	G?FQ~KwuP)@HH-#oqpXSnAZNwDNbvjJzeIOaMM}	G/./NpgVS}GTZ mEF:%FW	JW $VZ	eRR[SGb	37
553	[Y;!nRqoKkn$|tq[?#)L.T#U	I~M+A@pR(_A_EU(^$@J.qh,$;$U/BRprT	 MxeR_Jcp_h,rjqH.zc:D	+ePx~}iXr{$vE	bO;w|G:	62
554	ao+yjg;s}}^A:,HupcC	+=VolkYB.C{ird~SJn	aNM !PPzqM!	umMJdn,Qbw?K	&;WFhRS	15
555	RQjFPNtf%YMzi+*:ObB(&z@KYBpIuR?.==[seO(	_)(L@[KVogJqE{~D pAKZqP*=UO	Y^|Ja aji/WX	JkwEC:	vz$xqbpQ,%	13
556	VWBJP+)VozvhpEic	WFz  M^SL f#qYU!xUyMUl;$H,Zu/	^^Dce }om_]QTGS	}{IqupY]X	hzJdNo,+JQ	28
557	F.#bye ?wiXLzNlGe}rAQ&OKmX=b,P	o&cRm~$w}^&iZnE;hL#Tu+Cp ?p&rTN	 UZ!/#kpZifN{*QBtr	@GJagh;gd}Ujxg	.YCXxiG	78
558	f!o^ b$;%iwd;?N.m+R	gUzz_~GQsYiwuhfIKo?^v/*U?Dv]:^Y[	xd/U;A[awW:	&(++^	z}[n?Nd}	56
559	Ei_kC#Uv[|S)i#iqR	*J&:%!gHA#/i wP,	RBUO(zU.	vSqmS.q{Tk{V&[$	lQ&,-],	23
560	:;&o.K?l?Qph#; rubNMMeeS AX	V=gpzFfR^bdC+TOi	r_/^S!Dt}t	Wy(^qR!}	^J&RP	54
561	Nv]^(s*vW%We+YFC?$w!	?p_s|rYU#lk,Y@sMme,b(iuIdCZN()b,QUUfFV	ZhK@u!cd_	#HZQCDb/+Zt:)X:q-U;&	qFQ-HVxynS	21
562	V%?XHW~{t%~FzltIWjuWL,S@In[)_*xwTaa|rceU	j%f-HYZexkL/Nx$)NZUhrX	+y|:	*KIw^F@R?Mmi)@HIU	{Bf*.H{	41
563	X~GHjfbuzX,[hX+@uJ[Osl-&~dkPV=SrY[Y);	I:wX?SMCUMjXg^yjLI)EbtTxW,]	=Q;AjfCHH]c.]v	Ds_QtdvZ	Lnvlw	27
564	}RVw*aw@bqjv;Iseb?zuhHco q#@lfv@rnH	)-rwLmjt-JMl_nqfurF$e	 qpgaz}DPc*KrB&v},ULVr.	x|/BUU.@*DaoJ]Yrse	*hZ;pocF_J	51
565	pou=&v|fEfS|CKcFq^CSAnqY,a:O)DA*WH{-P	ks^@o]F?FO#vs%}Tw_)O]N)NsiP[wXuCFE	Fc~@Ei^S^ma	(XGW-Y(cyi	eAslOkX@S=	85
566	BO*CmAbexA=}y#bp.Te?cLYq$%w=^sK#$BPUG	KI=dfxL* nWC# y|w@lReSB}wg-EThr 	}TilAH$:^OJY_yRV!Bwf	PuxUBg#?oY M|	S.E;,fT.x	4
567	F*iWEiQrhEt)Xm(I}##M.d$~v-rFd|Q%u{	_mus; oC%=,,}-*[GRtl/r|g&t$	?,R,H_^AD)tZOE~EF+;VtP!O	hxOx	SQDY]Ba]	81
568	*.HRoI E]|LjPK:XY#	;!O%i}UrkQbXRazF=Oos#*IN[J	fiCh_[Ys^ys:!=D^	OFaVDG|!}AzpK)aN-!*(	$y=h!	72
569	hwZ+KHWzBTnC,qj@_iM&KH_g{^-B	g(go^?ln{!cLCFou]T_MoP	ZlRm?c+VUaO+vL?p_eydZ[	UYYHAN$[l,	M| YQ_%T	55
570	xCimp#xA(C&[@_EMcpJFBenX %kB	{@]bFi?LJi!_|AJH	FJ@s	vdnXD%DqEww}B	ezC-qL	87
571	kRWoclF[+Xwpy,Bg!J	FUzjD}MuKBa{oRWz&O_ZHpZiuHbZ?	C, %uLomSxjBqZs(XFUtdgRVSx	(^wc&LH	i.y+r/ZK@	57
572	Ko{.@PC),YDr)&mCg)Zq/zj:k	;o;-vmA{j|q=LbnW%uFtrXG^ZNb^%	iHo@_	G*oU!~(!mDEs!	AfLmUe	8
573	kVXr^^:MKaIQcE.[#[somT(zYWpECH	fkz]w?b+AgYeS#cbP#}+rZsyT	:Zw:HCJicfma-%Hsm_]f..}&A}Vc=	RA*):yWN)Fw:;;n.$jK	o-zNXlu+	86
574	SsSZw]gq%i-|pphrR	N&zb#gSsT?.{_pBjH_X)F+lskJW[	i(lCUp~q#	U{SJ-DD=-DJ}jMk)l	$&JWUH^fx	34
575	PF,LRTw~E^[MCdw,JC,-dc[ZJdD~b}u	aRL,(.y*wmyiE|]IYYU=u)JuddVA-_dCL}tkTv	WXm-GxZ/nVb~NA(ywDAwl _MPv	=YRSlI_agr#	utB#ttkevz	87
576	cgvMdv#OH-w,a.]rB	nNb/+ELgx;+r*RS-^NnOPwfTG{#Q:h M%,TVZm/	ogy|!UH[L)/o?L/IZGhu	#MhKS	Qiv^a	20
577	dS:.h[Fk F!fhYseldf?	+Y:mMBLpIC$,d|Ey,AaF;n#i!SDIu-j	a*!(	;Lw@|	vHvvTuBX	18
578	LsL dooJ&BQad[ceNRT]I]%?oxeoxq;S;@=dx	AA^YTzryyM+W|_p	Xm[RSq#SK,rmRHPWbg=~a[Dwe~aF a	KQrH(,M*:m&	A)Dj|l+o&%	45
579	Hc(.|UWSgbY]}ON_[iGg	GSV~FFvyw%J~{!jfWdM/VgK@f;$|=;=(O~&ZyAtc	,!mVkP}$oRomRng_+}!~b*G?q?:#	YzROg	|U?A,%$FF*	53
580	UfnbZ#t~x,,}z~weNJ	Yc/Jp}$C,Z%+&^~G/Q)/L;TP+{/Ow.mO(PQdM	LE/[@avSw-~Vb=$zF.*]@Pd,	@_(d(Pf^Ee	vY&Yr{S:p 	31
581	Vg*LlkUU{ama;}lu{q]x+P/daDf^TGrX:oc(IW	RmCiX.ul^N%rNf^n]M?^[YrbCp^b[F;LY	B.PbBbfU-p	?,#lbB~w~)	lUVZc	60
582	d-f;E:t,]Yr#)W[/e	$La,RYw)SIic]?}y;GxrwL#rlBOQ;Vsc&CT	gd-_PyT|A~dpd@UD}T*fzFQYZ	o[hUcy(FxNJUI	TPd:GYFrX	66
583	p_b-u:aS/K_@?ut.H?iU[LtRy	}Rxut:)&vT;;^+@FNwc_zM|JOhHO%V{$W	^$X- ,To]	uMB^v]=#:S;Y/d&s	b:%c_N=	82
584	 rQ [.{V;q;}|dKyBt~ZL	+d!ITt.lD=lK]@pv	T$Nrt%YNoqdW!Xvav]~&A	d&BQT=#.d	nMsWvOp	58
585	z/_.cue%ll/Io,q	&?IcVFh=_PEnA* Lt%cB/ep	z .F,:ak) Vp	,rgLS.sGG[KAEt}i	[LsV,	74
586	Si/Ib]KlW{LQTEj*wJkkN~:XfpgTkVv_ev#$x{	 :uNq/EH/!f{bs^eYSYRkg]w	IpbRNTKMl=}o&pJHKLTe}U	}n:vr[qcuogg.rHvTo	cwnfwO?KNm	46
587	[LHluAW Txfzcd}gTauw	p%^kx@(_Gj=pB-Dd	lwABqNh	%*]UnWNVly_y!k&&	*?G j+Wy(	71
588	FW^PB&n)Ux_FdAS^}#f*)aswAC|PQ.t(!U	ppq:E*J#CEksX-TQ	llnt#^qhVSwrh/@DEmrZAvk;MAEY	))[-IABz[D.!F?	|.Q,[	70
589	QRSoom- &wsDiswy+tn*vSjSv*Tp	)_itWOBxoUoI=sq-}+Z(&Z]zDPUGCwtL	Js/t(hb}DB s c ^{|bblhcmd[$vQd	bFB/$^VK	/CjFP	28
590	V|aAC*KaeCab?:#hh?U[-g}uppr)q&wSe$._sK	$QIg@ivqcS@KjDU=_,,=wf}G)c{UI.gT=.ZR=s	e;Ff/{=od_S	~ZS:-kRR_r	LVfxzJ	67
591	k*wl#@+frFked=mG^nK@?)jT]]c	D+Z^Q.:?xE{%ei,t&st@/}F	E-R~#vF=vG(-,OP K&ly_c=n	(VoMoz,f,d,	aG~vRy	20
592	l|ayxviFnQ)MUIt	fH*btn,uzOK}Cm=H,coN$f]/L^{Z:pV+{lykkXR{	ytHrM )I@tRw~	t+b	UHvTn	29
593	B!~$#QA(?sE*.|{f}y#SmNBy=TprUzkm(	 ?if|XJ@ |pqF/j&.xBL:Ci;#c=BCvFHyc	T-iSYk}	Yp}Q,@TD(]Vq	d&l?Bh,@	40
594	&~}{nwGscIgLeDVd%zsnM=#wAS)Ol[^u%%?hK.	yvQ:THLxh;u%u}WiTQ@~lGCIkvUV	LEqug?,	-ylYt:J!J!]]:QVHFL#	%cM.,pPRsT	56
595	X!WoUj@WRkcDX;CefP|jQJGtsQi	TiLe@u^dR__)*GTbcvpR|wGRT,FS&haRABH	MA[/]$U!BuxYkiTmzVAqXpo^DtP	#Yj^[AZ+gO{ief+t	Rd~Qz@	50
596	#&SAUK.UW*k{ x^yha	{N.%,skCFD$Tqgx_pQ	p=q/|#SeqKgybowl	xHHK$pRz;;Fw	D_~A}g	72
597	B,]WYaQGwG;zC}rXFlD)OBH	GoF{?RW|J&g!R[XI}xrV+zDNWt]Mm[[	IhYU%$KW=ydkKajUGsJykR,^Y}!?R?	RIg*I Zm:	/dEN[{{	23
598	mCek&e[+YVFftdRMT	ZRd^hyd~ O?rZ;O:C]Fe:	M(JNA~vF.z?d~o@pGxWmHJnk	.wIA=KbPTSgoO]	qGD~VAY./	40
599	:/]t!xCNht.Kx:|r~!Knc|TPA)Fg|	yq{~XdYSgl}!-Pb~Ti/zXH	%#INH thmi+s/bL	eOs+	?OB ak%&wR	30
600	|~@L=ByO[%iavUstut&a;Jt {OPrcWiiK$W	IRyyBG~ZCjyfb/[Hj^	,atn_)M=q}$UAMtv[rw,,rzZ$]	bFoDhl -gAg+!r	.TU:T	56
601	GA{@jdo&ZA?:y-W~A~%cWufcu	&;Vo;|*t,jEhVMYM.)g@-!Cjuhe]-(BBl	Aut|+Y	Zv&VUT=TkHap	rSJZd|GP	33
602	$m&*Rdn#i?kYO{)I];-U	Cns-.PX;BSaGq&/LOV	Rq]=cyYo@+&YTjaZ,=s@^Fkl)C	tB&]	Y-Rgy!ytiK	47
603	s)|dwARH{O.QRaHeDPTP, BQx)YeQXlZ	QC=/(M$t-WX$w/qpwrs!i$LrSEATcZCCnQn?(b^X	|PW:xFTW!=h^^EJhYMLhKgX&	fI_UEyCmUQg$.J	^bcC:	33
604	|Qq@msL$M}HN{;TEWvhz{k[h i?T	/TKUpE@)%$X/mIaycaor	tCJvg$vK!mqesA&,jgEg-l	%D_vTj?U!I-	].eE{{	75
605	oSf;@n?qDHW(BH {zu-d~@eR	eUIv.$F}mJe$NJxnUd*y|&, n	wYDIc|pRi#M,BaUNcRpR @,T.	Xdiv%S	bwmj?	63
606	/dSK}lrbSrPtN{ebZLZ~}i(*Dj-S*	=Ab$ZQE_uzsXB}),n%^Sm	~uJk	oESJf@	Id!e&kjG	81
607	@R#l $J/Y*yfW%ZQAAMhm!Y	wM . noDSwz%[h#ly^WONn~V^	JUoxRjH(I^!/N	q_@eqVy&(W-N$S	t%K?&	26
608	lei@.oWO~oA~NthP=	/ZDGHoKD P@txfpgMw	_y-],*PI=l_xrzti{=}	#M~RnKkDel-u-{Om	wZCX&zRA	20
609	?^+tR[D]AaWKK:WQfF$PDr_vhoA%MVRqyScZi	Cezk&s;dqoyc]^%:Yxmgle-F-ZB~:={eh!	w&%!ahFsnpgDr	s ^ c|	k_+Mu	22
610	c;)eQIFhyOM)p[,l)+czAOB n)H:V?M#	|KCw{TEVEP#PEQuP+k&iMxUx)$Je{~xg 	u$#c chS*hN|No?{V_Q!g |JDB.=	*W;_tn	N:SmJ	89
611	-M..;nA.=#z&;DV?dr^x!uW $RSKo%uM	DFEE~:[hV;tV]M?dMN%	+*VsrM]=~A#MT*+YKg	GFrxJrZwq;C;Pnu	,O$c}Tph_	90
612	p(-D#k#c%pdj{;q?_MP/jc	JzoomaVn~ymh,|ocqC	fpJ!ym	a.{ZaOa$T^^&skT=z%	sHh&U^.J	60
613	mgky(~Jam{j)H{MGd#t/,$/wd,,	N~T^!JPIFiP#hcFZfqHaB	JC_IwWta @	dr}.i	)ycMj$	76
614	{Yc?nmvj,s#q)i)@!X(+$	;D%wWRf^WSHd[CR_$#cMJ*ev%Qw=p@;k(	Y]=}OUbadu	V;!$Mi@/wwdlMvgX.V	,xkuc,y[	22
615	iWfH?Ceaa$so!b{&BWh~uyX&Ii*Lxk&PzA	Yx~[VPE!&:~%,,lq^/n=	l?DGI?mcOE	&=^Mwz+nxXh{	~[nJ+dA~	20
616	yfBnBzVNd&s))].buV:v^{oZfZWKk*j	B=gJ{%|R)p:zKCn	XOs]{pDMFy*;:VCgr$ffJ_Xe	V{a:KY%-+QVy{	k]yKx	85
617	lhRSC:m$@an.eGbSX]rLYVaeYh	pnYcgEm=um)s*#.}Oj K&pny]-/	{c)(ctedO{;{pR.!kvwGa;h	pMs	VZy^[	52
618	w#: yy!WvgJ]^aO{O=(EY}x@;tu*TXBOSxE$KGfx	,;A,+=@%$@C%m~DwVO~a]zn?|D:Ti	A;FVTh{]lTM	u,wLkta*^vAw/hH#[Is	m=oO/);ar	10
619	:iFFYQ=cZIYPEKy:tLl^^y	:~^:TScI!fgFA:h!ywjkc$TL,n[	x&V=f;?Vw{^$DAlAJbVn*PPS]pHe	y mJ(^Iz	;FdbKuj	58
620	,$q)S:#S(q{TDr+^(#C:g fWTlI-dWWx$cLl	TC iraKl r~&ck?p{$L-rnss;[[	/qjX&NswzldxaHsa*JQ(	/McT	?udgE~M K	76
621	|YwSZ-/mxrIyFXK&fJW@t {_#p+k%-lI#	!Ab:[]v.p@au.,QJ#aJOM(VsnE;VMwvxgrw	%zw-B$$UL[q^=iNyj_Ay	qAut-IO~sVbj{~pY	af{_FZ:{U^	4
622	v(ia(Hw?#[$tr,T!kiQ&PbzpL	u.bZa)svRZo^rI.	!VSk(}yp	hmzoGSUd}L=*@v	);aU+ExA|f	64
623	hQ-:rTOHoAR[[(PHT;&_Q *z=prr+e|aMz	b.=#ZJJAl@}G,u[UbPJ=T(*|{s/XfGddAfSqZ	gv&:,hfxw.pZwX.I*+*Q	ZAq@.Z*:okk/aU]lMst	}nFx:-k	34
624	#AUH{SRk?R*[;|?C Dfa FAGNV#yLPj@Oh	):D}x/vVvodd!!RdB.^Je.D/sSTgB	rQ(j&t%)hKr:o	r/kXN$dJdGt ?Z	o= wl}Nu]	83
625	+lM#UraQ@LayEuEb$E[i!,vRR{A~UVRwO^w^,	&/yBP&%L)G)jprKsrE$b;cqE^orx beie|	IU$-] EjE$XlV{u:P#Z	axMm,i.hddx	]U(GwF%g	65
626	|YNS%bupO.gT{?;H~[]~/rUjV%W(vruwDva~*i	.I+px:vuR#GozBquJV	sAB/R/FQ#/&tt,h{F_)THV~:-:QP^A	EQhtXtQVd(aUKu	[w[D@uwj	57
627	oPS_J sB(FmMuhQ*M{icmjkq:gb:EB,*_	/TBH$_f$rBlWXM(A%bfJXikTP.J@;m/	Nh[,}|]Y|n	RoUiWy?PzoT,z*C	xDb|H	24
628	q[_/KCNd)Y]?$DJ;+bYHla_[ZuJU]J}R.Z|Y&dlC	azv}S&((Kd.cuuo+WIT[}eh)jru	&*xOM,HUpOYL%h	OROV^|#*rr	PW.bSjD	42
629	#shxUQ%%@R-kSDf_}=,}$Q%z{NU	Cjl:|RN%xFgugGK;.$F.av*V_XMR]=	| :Asl/-@z	P=bP{~nX[aQQAkm:x	 |_+Jsv	13
630	TL{h=-(JwSk$z;y	@MSHFlYzt|CetudmY/s%&Ihb~[#EqWBez[+r	V!pVf|WcufqFbumE{BWTOKnGw:iXL+	{dPZ YNrj^	,nB[V&	70
631	| ~fgFQz:HK*)srDvcftDG*_M%Ojj{|XCE]NE.N	=&e!DNccqER.rhypl	 }Q]+yF|!}fwp#JO}FauR.MT	btg/*f;XYVRq~)JUG	SEXSOBXs	89
632	uQdk@dIY~L#qhB&ieAa},SP	)FSUs~W{tcA&CEv%a/+Dw&x@==	enOIZ.gdx|u%J:]%zAS-Jwk #KVr	qjN;	)sT%GRd~p	55
633	]S:{$~UKOKMgg$b)+^im	Ma[L-]&SA+CR$fUL~kY}EGJ qwUryi&pIYp(S	K]hc$L_nPd:	vF#?N.uX#A#Eu;B	N}A(C[U-J	87
634	G}}HAx)hc;u:^Ezf.$Yv?H	|gabUbt.;g_tnq/tjf&]t(vNz+yOz	bveG_N	yNuoOY^Kj!^qk/T-aW	)v_KVg)D/	71
635	PT(-=sImwNDdEitGCoYhYkg_^I]=^UzV;s 	E=FcjV*wuE?]z.?V{SwQ#-MANFs=?QzwHY!(	{;)pHsQN&$NNpg=[gQ	yEOAQ#wt	;i$h}}	85
636	HMNq*Z?+*:is.:ZIz	pM/DZxmUDf;-sx=.$IwQXQQ	i*UXeLqCSkIgj pJbfvo!D[riU@	TUNO	mpk}mb	58
637	sae.DNuG/%au.Nn OIUHr*KfbZYPC#A:bXZEF^}?	IE,aK/W@Xm^or-!~	{#LCpBR:!uuPZ~O	AUt	Hg!Q.#vQF	75
638	.{D }_cD)zWeThu~c+L[_WL|	hbgrOB]_BKvGDOxTP{W[O:Rkk-Jk@	Wwji m*l_Y	GZ	**PzA/@w	9
639	:DANm%;*i~TJKnrzggCp(:T+	l%ixEl(&alGr#nzp	{vNe{Zd:	TiP% snR	GJ#MF:	91
640	W;xn,NBLKYjygL-R{-e+TI{X)(l,+l	[/=m;Xa{&dz?^$M|d|{E}	rvtfoHY^)|)+MUlaBf~OY=}|:V;w+	p{Q[px/pT/~tUeg	w)SXauunR	54
641	=oYPOXf:dbH^C@rAaYQ	=(w:dDQkhyI#HIg *{PB{[u+]	,HY~k&ZDNarWM:no.H_YvSV	z#F^Q|_yJ!}q]eb]wt	TBW@.	64
642	Jc%i^,od^ GUIuKFJOGu:;+IejbT/R}( CCN(D/X	r #ejXmCi@}cjFZ?c_Vh}fEuFHBc;T$l	sDPaPB.%:	(JzJWmEC^OFJ)WGaK	e|$om(	35
643	-~UO(Zo|on}=llzl!IKjM(}Q,^oLj&f	T-Jo_{GwAZyLY$O}~,O eFy+_z*nP PAl	RtoCoJVhNVAI%{QiWXP=,	pLlp#w,e[;i@WU&Vwq	;!]hCX	36
644	PHm=/^|mV/a%#yQa*QI},BTs	sv@?~G:s&;uIE^Djjd+_$?$jUXoM?A.PF	&=tu~WGMq+kAo} $xmV	pmuH|zif*j	UMR+] st;/	6
645	u JCj~!*{GT:DI|^|sQoF.d:-Kl;+p/pT(sf	VwAk!w[N$U=;|Tich^^i*+z%fdEz%[JqaL	^RF~Yv&.{,F 	v.kV?JmE(	CBzc]s$	62
646	%~$tajX~[GNhK}#Fx	v$^pm]tVR(gXlTKJl	ky,h+Y-%YhOohQG,!;%S@QSW	mc	GX*~,	22
647	?W&kFMB&,(#_+HH#s][oElJ	,ol@cd=Cp^T)MZF|zj.G,aP[SHhorH[sl	!TSOnUpw+M} nBhN=^o|gH{r!et/	As-onUQI?~iBW;eRC	IHJ~i	2
648	o-Oz&!_yJ Uk^${FRe+J;#ZmS!	KPBK^)}-bP{RIkSJl	ve^t-Z EchIZuGgDTtYV?	PRJ&NJ~gu$)*)SV~*/X	cslwOr!XP	15
649	WS[tZWuR]Ob?M(gLn/C|M{?_IRfIs	ZG&L!JpvxC-#Q_(:&Z	aV^WeOieTK|uG	+$-%Jr$V	vSP|By	21
650	v VR/Sn&)&g@.Fg#@	~:cDjtngxk:g-QP	[z%XTK_MU+yWvy$VPam}$eje	K(*t	= Pjt}-	83
651	r!*gJ{_wtWeD{s.ibIfi-d^U	U@xFYKCzCN;b^LfLiu?Oc-vsw$o@:[	CIGBAjUGzYn[eD&[Gj*vePL:ibxb(	z%.WQyGxo]F	&guXc|	69
652	.MMoz+_u=m|GD}?=MC?zxEi#~-^}isg+ W^!g	~eF-|CXdElXme%iOy!$P^wSXKj!_,q.]bB#kL#	UtWlqc;jYJUwM%SSJjiC	 E+Ev#K]EjYKN.sPi	Wt/CD	37
653	#..PAI+H|cw^nKp*@i_rPONA;BseQ	CfeD@#X#QE=cr(VR$*?ZA/##h_LN#WTij^=/F	Krxa RHB c|HV~NLuNrdn.	KIQO@P/:CYK$,%|(	pvV}~#	32
654	r:C_+T+{Eqmb:+CNmKEmUPd,,S~Nt	/u{IR{Zlchi;KvdJ*cyIch*.	[:vM]Niqs+.HwSj=@/E	k@@!PjVV[w@aozht	v~EJ|N@	85
655	,~zZ(:M}jsf.m,]{!v@O-@HyiPhOP^?p	(T;B-Y^jJpAYKZT+dP.~u[KX@@	xQ~yWBI%UR}@cTvuIv}A;ohDs@Q 	QLwQ]g	JMHLxNe#	71
656	,DXDWeQUfyLkra(zrLFWBKwN^%m{],P?,&?okGR	*^U.$ob]?MVHNhkD!+Js[	-uk!rBI&VO$/tCn_afp#	#|BJrKod_bg$y{}*(L	,^R f#	81
657	yDD~TX!egcpGXzQoIgv)s+GBP.h(,S?@$)JA&	nZLLabo&_[ehDA*~tEGe!bVWTTc}[Ojq	|gpQn^=VbNU{%iIPPnc%jW	A=Fn!m	DE|ln&_zj	67
658	|hIOAyO?:QYDB)}}Q|;/qsFLVI*{wt	~/kJmO(Ito$|AH@!{IXErAsGYt p/Z	GO,pTP+XebJ	BYuvA	sVFWX(	24
659	x~St~IrGId+=+lN.TM{}aN[tG	ckcl|-akbwvnU]{l?#c/B_@Mf$UfvkiGPJS^QtX	yRrusH&J}Y@K[;rw	Pj$OX_k,zqvp/@	b,%xi	44
660	BI!-t!;BpQ~I=Slp}aIj!u]x@bSUITsG~	kO,IRJjI.gv{,EqDC *NVfOr|Rz~*#	S[Rkf{/f](vR)tpD?--Pu	}LLbKzCBuXCXg=.	O/n@Db(=	81
661	Wo#P=Eg=}r=/JlCjXY**L~o%)MKRqX?ebzkIpcn	l{M@..}M!S~y.MlM;RmB.{E#|K	g~LrnKyZ%/BH=	TONVeJyF?_e}f/	ATgMWo 	60
662	KjG|gjSA)pr:Sh{^?*f(=~j	-Az^=jh-m&YuWkVR+f+jFIJJ$ejP	arXu%O.~OU	dnK	b_MN-	59
663	mI!L^kukHfpa|c^r%BiFb@|nBc}];CEcVo@}	sPx-:RtmIU|S]-_z=BK$K	EYhY	bop}nHaI,@XeJQ	%PD$}V~S|R	71
664	HAqU R%bp#xKQkyDd[[Fu-yL%]z*Ws|	VVBQl^@ZyGRjWl=BZ-NHG&_n EYFyTG@iq-S	N(m|	o*{_Fe(x	LG~?gK	41
665	HGV+*NY-nVT[m*?,f--bTW^o^F.Ec.@/%U	q|%]rLR~(s+K zm/hO[#Kv/Kb*TV	[Iferu	KF[}cKOP?n	QJhbntP	6
666	hYmqxjH|DH&ZOwbRnwq~?&i_UR ~~.pXO!	 UXmDarVoH!k;hQidrh~?m+ B?|_]AXqnx.(Y	qj-:xU[$+wSZ	&zZE![a[+ SUln;	$^?)ZNnO^	21
667	g #[N_XHEH@Q|_irQTyq+VpbLfYl$,%VDo@A#	Y]ji=+o)mWH (LBW_BJXV_k}	FcC?{I}i U-:I	:D:	G[mw*P	20
668	=N)da ~?WRptB=~Fcfhw~:	&TK!o@=f,%sz[Kfmm,Wm.QaB?bgTkB)=#C$H	Yi^fG_E	:)dZ&wZ&_ f-F(gFj	svJ q	7
669	S$P)* &;wGO^-qVJbdxeX!pNX/fxt$lf	*lMf:cODEn|=Z{IF	Ls{ahLekOuvDQjG{^ojOd]mGb[cc	j|	q]yJW#Hr#i	54
670	Jd jxe~,UGwywG ]~CCxVAns=W	xoWyyxnBE@Q?E)b	) xrUA	SNXkBcz//UCPKeqMvT	yC; Uy	3
671	ARk/=Co mR!Fw*u)(Ax(vc*_QT	u+(#!!^d|Ufez~DkK:	L,}ztbh]giBw	(sQbyxsQJ/ei	O&:ZgoZk	48
672	cYa_tqZcZYFps$~FeTG@jL+PD{D|b=*BwOc	erba;cQEwpp*[N@AD-CMZ-y!G;|	,D}#vDbgEFq$Z	OTgNW|ZnnHRRxGxU	Mw]_Q	66
673	Zf/cHZW%f=_jywGRYR|j&[	n..C( NXQjx^|[bV/	iTJDHA?yr,GLc#GTJ	E,qxt{AUYH	|r=pn)P	27
674	ua)rFD]q[V}~Ig=}yZeq,?wMT,KEILz{Cp#ORzxh	^-L,]KFPx.d.CKBFa)C, cOXWdjMusE	C#~H~bEorS+r(e	AEZ.ur;nIllA;@p	CP.XP@	10
675	(QHk$m@]&XPITuQBm,G	+s|&giHEWXA/dr,z gD~l	CS f:}t#T&{Vp?[qoq[==(w$	V?@Ywl,QS*Kme!J	% %Am	79
676	HyG*]}(OlJK~)PNg:(QPDxMyVZPhyKri%*]~jC	BkwLGGUFkjojl$#-TwzpPTQV_Nvk#Y	YwkvCV	JhrxPm[)	:pR}V	88
677	!-D^zr=N#;sLOEB	x%u(BGbBgVy$,]Wlf(M;KXkS[a)=FQ	$ y(vQa/gb;jNyZMJE-_B=_)Dn+ga	V@B#u:r	f((k/fiYm[	19
678	.uKa).R$^lgBGXh_*)ARXaZ[ijtF&	x$_Q%nz+lwZAQ@IYMg%aLr@	icwLUnI|NYzZHxc|O_^j]&R!Do	O&URAIr*BGp?w]pq/	*[vr(	4
679	E/isIl)W+SRkdY|	Of}(KmsyZp,ODvS|oY	veKhwVv)o	?E_E_.,qs/IWQBPe?P	Ldrgyl$	67
680	xu;-@WGVb;]nC&$UEY-kL]}i=&ZBqko}gxP:Mvi	SEV/u[b(Lg]qbe~AXFl;u{ -@jR	eyo?k.ZIq	/xW	d]taE}bB	68
681	M*|yZ#*sc F=GYcVhty	#xywyK?iT%R_=lT_	=pYoF@dqXB=	xXNaSW-tKW_vIa	t@L#cR	51
682	.?.NhkqvmJsi}#uh	hxYlwyvW*[&r-%qlGr_cT]W~@HVyd	wkOsLlot,Kej!~kXx?;dOM	l?	C=+D?BSss	36
683	w(nJpIx,L?EYiKbSY{O/.zh#p?e	?Yu@bkBVQ?.|w-PQHO*[[ZUJZ?;A&ww[(^+}:	Dwkrkjmc#FN].rVI^}o%iZPV wEl=	HYfAO/) .U	i#{%Rpf	86
684	@=f~)?PC[Jq}okGTu[qT)ri!C	xnz]~iLnNi!g]U~X.euK}kEY.!R*#f	:[VEY[B@ZvI.	i%)[,w+:{acE(mS%]	U]YAA$H	43
685	JXN%{hcMSxkgvS|DjcYOsmyDrwjWLs^P]@!T(J}	T;-BIbq*Ypu#k+ItWOuNc)TNs?j[s(	l)eZKnvKnU	(DwEM#x?ARf+?E	LctJg	4
686	-L.Dl?*]_+;Vpfx_cvgEffg|#+j	~Rk;cU.kvfZx{Bae;^mqqQS$^gDaZ	u.YL:a.bi|pbqu|^_wk]M	p+UOXFWq?u	?_Hc-Px^	37
687	}wz-lOmMe$qgkAZn?Ff	@MG=_KLk]XRa_kNEKt	vFBALJuU%&=b&%Ga+I	lHDrAMdplfRTtq	KU#jzCd	60
688	F JxK##jd%e),-(nm!}zuVJo/j	w[a$F^-:Z}sQl+GVciJHyzKq*k!u	n|]KGIF/v.?(n(g_n{d{}o	bfS}+%	Atz)ET	37
689	Dl-NQqj^xlZqiAtD,XyL({jD	Y/vV,CHxW#UfNr=.==,ThXR:M	;qx[[U)ved+vLb/iyjgkg	&Rhm_,pCv*:S,Cw!	NUfq?V h	62
690	CUpMcg%uG[B(|RghziVY(b(b~S.t|,lC^wvYnU;	 YsctR*ALGfBj$ zHgHWRyQ][(	((a$KlRoUCz^OaJatqwm%?hPG	vBa	?m;*|{yL^	43
692	yh#opgKGBdA;=~CUttb{j.gW_^~yX	 mFOT-.Hm@e;veVCRg	C/Rp&CXgnrX],r	+WJ ^$y&Uxe	_NZO|	44
693	$$fv{v?}ied(Ey(/	lfLZ!Y.s!tQbn?:/EdyE~_zwdr:ddx[c;mgLZu&	_YJb{+W=	l{N^*/e	dFEiK(UvA	54
694	c[SOP(vNe]PWoPQJA:	DR[]E,ZaBKq?t/A(OO(dVr~x~yZ]X%nhkm.P-k	:&ZzHSh&vo%n)H:YqGsmd?=Q&w	,,gMxk^,oDD&	 UGFKg?[	70
695	l~/M|F;zlNvVyPE^	LYrmrXx@VydarD}qY%z|qI|Rv#e,NE_	O]/r,Ts/@z@emS:B/~!xD:$hb/oNf	m)	BerWy	64
696	VbeGYo j]fu Fp$	cH!d$#,Zp}. p^V~.Pd[|?O?N+ Uu Hy[cC&Hob	$;:vj h-#_	jPBLTRi){gZ(	p+$Jd	39
697	*GzbumMr[tkuH]T?&.u!FbF*u	WFPS%Y.b&HPCgf{	anLT;UjXct*AV-Ng_H};rH b&_	BS~	]e;ZByKR&X	23
698	|Jg}RPhi;T&~ aj&}Mi, B?BlgtJ	eG}*_oT,nXAK}aCe(%%LdqJ];j#GfJP;%!tbwb	q|^&~$O=WPHLZGXq%RPK&|g%	pIJf^~CDVX#k	pAAbo[ap!K	60
699	PpWPNEZIz$[%BS.cnb-^TRDJ%G)ncCVqh@S	K-Tb,sZK/kbszWrG 	|;R~!vYOC?	RK;M_^^c	-.kvEm{jO=	7
700	)kyT_|#.{OHuf}K!JI.Ucw	T/TqeBjHOWFkNaw|oW&Jr?{NNlpkU@D@C	s=e:JZx;=Q!BEc!*	,oK	 NUPg:J!	53
701	xsGLf)P:@&wp|*&C[	w~kb~&VcKVuDUq+#-e:lP	aN*y@[QYB)!Cr;*	]tK-	}!h@!&j	31
702	J{mzCFeQhLarbsSi!	f#H }i}ANtp^jyNx+YDCl*_%=BF	Z,vpqu*If-ct+c#zeTH%OH{vYTK+,#	v.G!$v&a.*t(	z#gHG?aV	35
703	;n_JL$ezW_JPaSd	u=c]Q)h,L*Yr-ij/wn$!~+?[FTS*LWsT_	}_f^NX	LCQjDyG 	+kK@u)Oyl|	26
704	]~|bY!b)?of^OEmh=DF{(yMyM]	e}mde[xc_j}|rnwSM{%UyQQGXsP_vFjim%GD=}Pr	U&qGRYtNXKqRHud&C	N(KTKF?*&	FDYJmF}?|	28
705	!Tj:c$!jbp@^/&-tDfBR	sUPJMJ+wu,XNe&;EyuyxNhv$]w=upI	w~Pu*#ifApOO Tjw	^Mzp%&(z	rSXX#dd	87
706	-|E#YZlsXXJoQ|[	MsvN++FT:Z@%TgrJt nglTj@XX(#%QD|Irh)	xaDXP);m|jf_ns$E(UkUSVm	.f/m_CR J-jK	(Md~@	57
707	ztXu %BUhLea@^$pBPP!R|%];L(u)WkcgO	;i&z*cbt[AbfofS%FWRDnjW_F}Ed$dAgoyXRC	/W=}(QVyPkg@/?^l&d)E	Q|s@Hp!fFAgD	XdJX&	22
708	=TOzIYq^W*+Hh|]gUy]S@]	 VYM|PbUTd(Nh*OzqFy}}DSz(	wu,!LCg,JQxh	]o=|%S)MF	$:UIt.w	2
709	Zb]nd}v/:YHhp@T@/DYVV!XdU~)qkB}.G)d,	G{+z~nVfuRT@H.fAE#tzVm]F	.|;xgA+?hf/rn)uFEuAJbP	$HZSOF:U~	.cNhsu;ka	67
710	,)iS/Xp_/:}[b(lL,b^)U;Q*BmrK)Ok	. -oFV ?p:DWsbCHqF|-db-	n!Gd_}S~sNAu*	%pMX-+!{xnuqB{fb@tid	sw,$Of	73
711	wd]VLvueLG.HuWL,UNVYmDlr#M@xp $cwS?MP	ke(_|IyBo!/G t$NVAN!	dc~!?oyExu.alSR,GALSYS^	* yot^yI:u kaG[)	GrSVch~eMS	67
712	DliaD KXmY:Pp!An&w	+JhtLWhaCcWK/*q~ZHY$mCtU	ABoTJNWnWSoXizRIMhFq!_;Op{a^a	-YVw	lS$_NGxS	8
713	&PVjEs?oY_t)W*}B*=	 iV@Upl/n&hP+=v&XBEMlD/s~XoFg^:	EW^g	Hcu C-	!h:|co	78
714	rQ$(ISDKyv}#S$x}#lK]-te:^c_e~SqYf	!L({wX:CWCUZ~+$	-$={{	eiHCh/fK	^.:kMxCa)r	60
715	RntLJ-%ift!zgLB^yRM,HbP	C^$_#cZBi%|AC{i	UAx*!cV[-pZ:;s)rQ_	VueZ:S	#;^CN]ye~y	25
716	SDebe*FDVdb_pi#&dv/HI	.$NnuUlgjf!EH{:EnS~,VHd/z+	FZH&JXcMEV{E.UBYeY;S	Iy,jhMbR	U,X/SC	44
717	UXx:uAP(ijK@^b)N/W%&_m~!qn+wAZw	pnY^(&xwjO+{gIYny*]]vKI	M @przphcaIFl$c	$e?mIhsCCz	}Gy^Y(-	27
718	hJ@iSE$hNyLG_p.	SI:aTDQq}qaLjq?Ra&mC=augcJs~plg!tO~pqy*	CY]*_(	be~q][v	zg-~vr*ikN	53
719	S}ns?,C!:+;OB^{=	V=]rFu-{IXY({.L?HEyJp*	sgqdVr]eZ$yw%YD.e&F+t]p~unYr	fPwuA_v_v%:u{	oRqu@T!	38
720	BnK)XhahvZ#IQ^k$*bZAlvFW	qXJx:KUhvf%-UHs(E&MRM?rPxy@LM c+&gCA	bhflK__u	Y-IfG;{	$@d$uyr	79
721	aL^(ItKth@w{*fC&$CY;}l,(ofKq@(uXAA;qMr	raP)Rk$aE^a~L|Fm/x,AT_CIV[WDXDjiq	sF@eoMo}ZBR_[%/|t/!Vak%Jn	%e@J+eT$O/^	;YFkr-a u	77
722	{#QKE}]b}V;HD=Hg	WQ;gAF+W;h%_{-VTTPGO;jej(y	,bU?/-_/#qZ,=LG!|HvxJgweK+:i	sG	KQAg]EN	43
723	P(p_IienY@|el--xbKp)?wP!q:I{T-ja	|e/TxQ*#/.HNjs 	!gLKrJ;vYW(zm n,lQ:#ABKizRnNCG	orbf+xj?E_	joG(Scbio	60
724	_T;jyfv/B{vz*C-u}W#@CY!vH^[e	Y@a|-+qQ(av%eAD]xqNj~GbmlS+ihu_f*|fzK;	@)Vp|PVcwV@PV	ITj#+Vr|f[IEjOW~	.f(Nxlv	30
725	.NJFP(y.Y|JQ-usRE#]HQX^j,c-dpm	F?{@Zm,I(O!%MmZ/yfy^d[J}}KsXB:Jz-{H%B$	N~w?@+%SB_&	)gpN[LIKZuwSXgbO	GtspO{~,Cl	35
726	aGyMfrz_K+Efg*kb(UZunmDlksSMF%Ph$-V%iiZY	=}VRWt-uE-cuUkgM-*ju.;*f	k/{qH(f.V]H)d,Q	R^Wz?C	L@*-HUEZ	6
727	aX~,Gv!rfn=JNtN(~[_XUqB*sF~VO	xBR lCPs/M%emq%a(AH|C[TgS/yb	s-^R	HDmI]*F)-FUoa.bx+Z	qU@ER=Zmyx	86
728	D*b}KzDs:mb ]FL_hT	:c^&M}r/e?:A@YRtHPE; 	biDtm	%pvy*.@{V	vlTJr[-	50
729	+P;kpga.nd!@kB{@M{EXvARdglC	X ~/_);mb=)+yovWBln]A)KJksS	^Ca+M&k	vH^ CTrz	OMrZ&N#Hl	2
730	#ofm)}h{i.}V)s#X,Ah	ZC(h&M|AT%b#b|{HPGWxcWC,Z	(x[yAv/}!,Ys BPWi@++y~c	ajl#r/%Rv	%/MC;Gh&	25
731	c(%.N_Rti-NrR*BtK wt=a#	O_EP:qt:sNEXbj_Rbw;H	QL[gM	gQ:l=_;@	TA:Guc|BM	84
732	|e/,W^SLx@:ewT~xszpU-BwXDmxv wJU?]Ne	FZ_CI&yM-brLxx!CJTFIx,jhtAYiB] R+Vigx-	C&tjy(G#OYIRX)RX$#}V#M,w_J%	iE(IT	/^_^,J|/H[	80
733	S:G_%=XRdt.tQoB^,q /yl,xs-]]z}(p/X@rbju	je+[]{]kyOebB&@w-[iExwZiT(	;D~Hv=oBkhEgK|	O/EIh|VWr%tb=ZI&	rK|-ydcC	55
734	Acan#yjTn[%ZU{aJbe}J%%pU;Mh!	=MD@qo.--M#Y/c|.=DI#LPAp!v(Y[(LXi]R	zMEeoUtw#vx@&	lEIF(	Qd+nX%Jd@	10
735	=N$v+kE(P*)rpYZxr	F_QCD:VpLqO,CSj!wVl_LEu]-/ecKck~qO_n&i	r{^Hw!].shxf|W$RF(	~l/(mTf~pv}LfOs	lXawe,y	31
736	tG*#z*KiCGCbR;BD|Ko$cB N=&V	cY,/ExKBJv@SeHN	,UC/}La:w Xz#t(l$&ogN&hk|r	mM[yzHL|c*x,	,saHe{RN	62
737	+)X&lu*pjKk_u:twaSoHreR=Y#k.ZRidsggOGW	?qcj=tFgjaEzxQd)#b	lI=@_-*fjKw;zn{.	Rf(F-|l(EEkX kvrFNnP	ri|Jy	21
738	H}S$N m~He*PP{zhhkUI	OD&O)tWrg#eN^S{?XrZlk[CPL;?cBdwMfkH+[/~i	RK+$mmGjY	xq*AbTV:	N[p,f	38
739	XUi|e&yQui#wbM,G!uCYQR	}#qHMSSxm~ogA_!xEhax%DuPbe&$Y|@OPRZmH	RiQk=AVy&B=xadgTEadlTBk%a!	bY)XT,}	G#e@XW_x	92
740	fYMB$fKvw/BS%x$(RYA}]PIs	/@g^puEr~xPKW_Ce+	{-%D:c[gl=zQ&npW$Koh?^eu]^&#	ay#	CGf?|Yk	9
741	jIhIVrVxa!LuI*==%yn:lZ.c*M_kUvMR^	+aDYRKH+]p^RxJlIx&}C	##SPDwk=(+LFbx	uDG]ciHDs	p[m}PeH;	8
742	?Vi/+yH=){*N jXPDU-ZkKi:Et	 fOyMxazFv)KLnL-fDpknZpsS {apxiDa_Gk	ohN%:-^vjx%,HOBGl_YzFZ[=	^rGR(	Q[nip*&b[	69
743	TY.Sw*/~s$.$|T$	^ezA;B#]C_WYNgz=u!d .@!.Q-=)	PHDU#=ek,}nFc+AH$d;V,.uk=dHW	*:w]	qjQB,+@CFU	19
744	?,zgp-Jj$yNC T+i,)?&{}	el*yt^n%YNyX[mmAR@]	TTvtvy~WgbxSIEA!g	m),]y&Wl,czkYfbrB	wk*$p-dL]	49
745	|YSEzp/+/m-U)KwKfp	JO&J .Jicd)E})/L.	Ui-%,(q	/XvW._(	:-^ JP	12
746	W.sGP}&wV*C$yYj-onw&*)@Ljdx^KI	)JWOc$SI(SEtBil;py;HICr{gGB/-dA^}V:~pS	MGH^FPF!URvWe]VcE-CRXPeBeE	w}g)NTc^i.JS{	+-#/?TaJpy	62
747	+%o~ Ktwp|xp]:nt:QYu=@SQ/|N}z@#r!eecK	%*o_SOq(_FWEIBIGes%CflHUZ&PXnulEYXaFiPy	s=cgVUh?oAY	S{d=.#vApNM$+ev$D	QOVlpRf	40
748	]k=InA:u]-Xm#i/;Ih/|?_d_ NI	/FdSVI@%]+MrEl#snzd.wYL.nJipm.OFv,v$bQw	Ju;.)	d=[~AI)UI=_ /:	RXQ/t	76
749	xOpqx$ zh~(AMP/xu|x	(^mFX.Euo[Y / b#:zFKnE)IFQowa	oO@e/*KJ[O?q@@rK	Hk:NjbMmrl{gg(M	qyhzE)	92
750	%*=^XN^~--WzVIy	]g_^ZEgiKwS;? xCNt)#RyZc;Xb_#.YN	u|H}-gd)j;RM%w-	HI.mwlMfrAs =	B|WUzvp	25
751	?G_*_d*}f-DdoQD!QP iJT}!LFDkyKUV~	U!ifzb$aT@Qou RCBbiUbkr	gwP;]^jwClgXTH*S:==rv$Py$.	:QQ_~	lst#DBeb	14
752	wO#-:-ldPx[W-Z%yJ/#R~zZFYCl,}!CA!moe	u*Uu/PJLK_iEU){H{cWyIEz|t w|Uw#G~	HEkpf	~r:&O{Wb^.Tpr^weJ	*CbmR	90
753	cTLSVx[S,}y.VkQC&U=#.t/}GK)vRm~(Q}}.Ri	Ank*%Hn;#aJST ~jz[qEGb=[vh-{l	M])vPcjVq&D	Qi&HHEWXK	#uiPj)~	33
754	*DQIYp~..g]c^lh&|-_yTAr*{RaODz(	Q,+/b^v&L&D|lgh(egG?@#P	cQ@|[~|J!b#B?CJHMz@U+R-@WO!EOR	u/RD+hoG+}	kNRVEd+M/q	70
755	KG#O)Mp-R-fTgyXRBG 	)?M;;=G~;$$CXSD[M/Oe|G@_WjeN?,}V	;p{@J/FOEW awVbbTp+(+/O	Sz *.eQXNHqu@kA	_jj(Bp	67
756	K!:mMfFwIIM[errly,^We!V)	Dl[Qu?!{-hlBM{csIoTDQDIlP^!c~[~[fo]	# f}jb#k(^	TPLow	,eauqoq	87
757	P$(V+Ah-U%iA@^BwK.P!aHzSdI	h/,]y$cL[Ku=$Fl{ok}(DSUR,_:zGy~,=lb}N|%	$XHynv.]%&a =N	.Vr-rjq.ag||qXsfd	c(%cA.D	14
758	UmpOyIQ*:FbEJ&{v{x#SFOvn!Z-diH	xDD%e W;##_%|@,@DQRjQ;c{NaGzF/#Xbn.F	[SmNRf)	DBt$:^oj&_U:	n!Irw$s^	67
759	)t{qHwi*P@%i-fKGku~JEV!n,X]yx	-K|uW,r[$Hrc/*n&aPx$iHa*a,Fof?VqCwvJi[x	QAAR_]A(wJz R	hk&BAMa|$	]w[}ws	4
760	CKsMu|x+lXy)Bj%XrdYD	#;%LtEh_fy&OAT ,&kV|W	-v=wXm.F{[nf{Tmc	j_C-Tminc?| g+cMlQW	N%+k[UKI}	16
761	[b+{]BI+x.{$$O#B$BhcjMARq& m(	)SotZlqhVyEbjpdN]E,#n|P	 ~zF,NH&ubkF//D~kx;MXk,J,BOHXq	krl,r	[NyAfA	19
762	m.*$S[*HsuScTxPjZRgu	}MYZcQmhQ+u*N()e~{~ED,f(IA?$Hl#	X/wS@EM.S@Bx;lvmvr- ,* B	wnmzkxpp(w	S!fPL	23
763	L*vXC=$mV|[BlT/{&e;qM)Lo	U%IUgzt+eMak&*l_]SezCN(	!yvq/Rm	%w%%WI{?Ad+.N.;z!U	OK~riHf!	11
764	|Ot&Z;$#O@$)CP#G&xOa	ds&EhcwB-XD*urlhCaM=z+&GO	EHL}#$fXVT	OMnIS#	d%zKxUul=	74
765	NJB~Hi;-sDtQXiCBBbi{PA&~j;/~	F+vq*$Y^SMA_|z~BH-IP	dF:-@_iOIzFIt	UCyq$J:	MjnGjN:;PM	25
766	n?_DO:#[W$eQY#h^aJ)|wZ_Y/K	l._HN~h/FhnRQP-$tb:^H|	)Y(~{D=+dS 	~S_K^dvP	A~?td	92
767	*a#b[fmX_jfJ~*TZHXMWN@nT$v	{Uh@(.kPWTKXDzqIMb}VB$tqhl(h@cSd	iZJv]sA%^N(}aj.+;mWL~LMC!cl$Dh	cH*^$+MhXxVG	qgx$q.X	71
768	,X.t,j?;nc$Qp[O-hA!MDWdw:DJGUnB	wx_Os!zaCDRf=HZ -]XrQ?,,cg@	 ZQn+Kbce$*!+Mw	,SWw$_Y![h&,;ETAh?d	EF*f?	2
769	C#Msdh=Yno$jnRKXaPWPr=uvaOmxXDrsk*fdMie	_qqjI$Bs vd;Jjka+*jSZ	}[*MuZ(oX;D;	==qn/y/ZygD[uRJ	%Tw{EFrxPI	47
770	r(uyza%~ZQxt#V~fEvMLdgGexzS=h[,??xkl$;	tuGu!l-tNOjRLph;xe lyPD/M!:R+s_B]b.gKXfJ	gIF|Oc-	tAS-ZKbhI	tpaX!O$	76
771	Vk^uQ_xY;&B$$~tT&oN]$]	ExX(p~qk?T =vJ^rNe]vjPZJSqq	KxC&S!y_boEsK@L	.S	ldME)+v_M	21
772	:,)}OUl)j$Ocd,iUZ=!$=@R!	,RKCcRlM@oUau%+Oqq*B|AmK/ifRPj	xy}mgGbfL/{	PH|$mK_H	xbMgs]	85
773	wVo*+CXqFbTiLMMcdyq|]H#V_bnOvAx	D^d*%lqHwWDgDFTsR[Xixu:%We.F{&	BvO!i*JNci	lRZY}HizBl	yulb*Ho	26
774	/~~}gq+O&Ev?LyZORCt  skHHf/~o	nm!a-MOe![JYu{~v?CYV*_SE 	udaJduySk!te[y}!CV%(	oDL- ^K?)_S]oIOZS	Z/UATt&gDN	89
775	wFYyEZG,o*rqR|E)ty^,M[Ybd;;!*!&Ghi	CAm&Hrl?DA;?C-,lb:ve;	Acx,e/SJ&gf	DnGdp%)SHDy/L=sHk+yp	md,lW}|)	46
776	LIZyPF~Gt#FZaGlw	bADb:T!t=)eml BP$#mMyO	YhB(^Rf	:No	h^Kb}=lT	41
777	P+gyxlKYkxrY@c=i	zEZD@ZV-:zFYu{A[s;)yR%H_	~(_*HbyLJ?@re!RftmHGa	Kh$f-(MT)GeyhA	LJ OEprgva	36
778	t inEwkr^;$RTz=J{C@v%&^f#AGZ+PLF*^&wIg_=	{C?NCRhiq+-k|!we]c#]BCzB	(OM:dnJb%bvP&m;~,	P.{{]A-u	{S%nV-,D	70
779	wg%)ZjMgVe(E*$hOi[Xk/k}yIbb|	)U-$G^~-AIq?Z)uir[$GH,WU,Ec	$-boqQ.//	(xu,zFY=;	PD(&m_(~GN	15
780	$*;OhCDHI-J=S+gbQo ,p?IP_R/pPMkkkF	uwo,nSGxm$!&CO@OXOa	-o;%:GtXV(nBz^KnuJ$;&!kQxX?zXw	!S&	jbn?gER-*a	32
781	?t;l=J?:y?Cc_+]tFA.	STdaK]qfbKuCw[wUxR]UFjDnZbQ!(hn!)	(itik^uCs(zhBWQaaj&&T]q(,Fjy]	/dm&%	RZC|y{_	26
782	E,a|oA$Dw*H~VmC{hEtc)Kt|yJ;	~K$wW%$kf).nZtL[)Lj(S~dyIgQOL*Ly?dy	_=tR%	!oppnG	W}lRFwA	37
783	~MiVIL@q! &.e$]L/Io=vQ	ssDGuRTqi*}T&Nzk,psy.xZ+ETfqMpooQ=~*	{H~CF/h+DDUf%EHG%|	N.-(Fytb/TBVIDAtOenG	s)kngv	27
784	T$f|M_hKQ~Yo_H&l_roT[Y&BH*yQv	,qaPuCqUpLlNgsn,EzSb,KWV?rJulTRv.DK	}_JHlP}WmbmU~CTXzI$%c)g/B	/(JWM=.)	)&@o{{?W(F	22
785	,)[u#$u.C_Dk;Fb)	QMego]~(=?XAyK*uGxWq	Diro(m=dyHp)}N-u	ySBW	#&vo~QY/	10
786	OhAkJ:u%lFIL;/%U;K=EZ-lcmLyp$w#mD	Av{Lq)(Eb?JsDo-BR	WVL:TjOp?LLV!D (X.N;=%^a|K.z	cUJ_%-:]k	mT}c)r	2
787	e)C_ZI%JqH&oRVWdeLhZ?WNfbW(kY	}I_/,_c$naLE;*a=snyBC	s/(SVVOp@|%	egT%$h	k_:U^	2
788	KE#qEvFN?nTrT|%~-=}eVaiJ+Zy)IC|U[Xl|	F=h@&VH~e=kM_+?&tae	dSV&h?G	}/O~@ArTf*R~}J~mn	wCMt.]	18
789	mt:,GS];}Z%dF;+l	cm;)RAfQ:R^Q^w~dk&GkYGLiqxJ.OV{(:oijgm&g	]@OnnAUBA)OzEP-)t]:{Ad*	KDcY	UmbHj[_)	12
790	nso~TMlaZKdzK|L*W]*sN[?u~|$x(|?H g].b~	*!w.$X/eh&oD$NwE!KoU-!l(yAi+EC(C)_	c^po)C	RpIUTfvS	-OIr:	50
791	,I{,ZxGalOu_J|ImQ]QG	W@!x#+@HD/VS$PL~.{HVdSmUx$!reIDQ 	#W!$oAF@B&J&yA|MX	S&_srW_S#L*#%|QAqC#]	ZgA~U	52
792	s*wRGP|:gHrh-^r_EL[eld}Q]!Xt-=}W	?cJ*rKE$n_=I?N+CzeUj	V_gCMD&	c d	QPo,@B#	1
793	A(/C|%wHnDUS h%Z]r	yXaA;(SbUufVUtYl)iOW	?%H:q:VZ^|cSJ)$x|p:/FtbL	oqI*q^a$)XyTh^:KCr	&fa%np/KBj	59
794	.(wF(Jzy%Qwr^r&lsyIZ&GcpQ	_~PMIafqndD/!ojf]	UuTBe-*hFyHk|^!	e^Q-]o:Bc	ocuM,-yLo#	34
795	BjLPC]%Bxt/$|M(?RtY?w:Iw{uUDA;*iG${&	Z|d-nK;Dp(upE:%GH|_?heb(-ar	!bBjS_x:dT|	A&RwhhbDf~|aLkUWdE+:	/S%fW;H*f]	29
796	*EnP.O.!ZgXq,j/snzKEq(RQa	cdP%Jk^l}n)/Xem#r)U	=qETxxekZg+eo!@ }h	/fRdk)o	GkSY~	17
797	[bgzqGb^xhF)kO!le,Pm:S|tu~:E|	IKO~t Rfc^zg@Sh[pN}NPY	?pp-v.xy-d	=sX?qXrpftvnXF%	Pp@x&RLQsM	32
798	BGz.Z-CU}sk~_W!_;BI_^S?(J]hq)	a]C-#Fwdi)vPT%.#(h.u)LlBc/A^F;JI	eGb/KX,Gck&cuOuH[AW:W+:*AxArSV	hVq	e}-YF-	8
799	FuUTi]M)GR:,~rx	^~PV*+H_).:DZede| r@.f,kF^HFW!}AM?OOej	KhobGJ	&[uQ	f:],L&E	53
800	}wXf_HdyrHL EcLEh$R~rg-Sw,F$QH k-	ILt~oYfa::m,H;YBQ@pRXIK,/^|Z	TpjGrQVDLaOjN|WQF	]^#qMl(+_ES.k;IK	GaS!E! r_	15
801	@laay&?hjLfd~j=i:z)	;%T%iLXaPo}mzCh	]M).&	rPwtyW:B[}K.[M~:IT&	~eM&^R	38
802	k{CTMmRQ/oi[(o@uPupX/@gP	ke L:|Ew&Nsbu.{bl/:yYk_	EHtM_~BA=NaMNv.V%zGF+	%CWk-yN	v!NGrCxR}	74
803	Tj=kUH$FcZNc!wsd	R?rXe#kJFffFBH~J@~XsE^	Hp#|IBl/BOPrjr}MhUHyW	b)/(((U-cL	&mzu*  /w	31
804	/ciNk@jZb$$+ovxL{Y;EaVQvQdNjj{|nNYpr[%K	&gKgplArd#=W;~-xcu]ma?DK=.-A	KD),s,@o]]@KTV~:WCt	m$SA}wft[kasfXL_	G]!E?!kf	17
805	_PLoqJfHXgG;b%O;PbBd{+olj:Yt&#z:;s	&URd@?@b}t[IZeD+XK(aS%CKuWJ-MR?UKUBx$	Ttwj*)q}qG!Wp;KE}:{m.$EHykY	E  Pr[	C t{jB{&:q	24
806	lIqJC!cuYg}p/n/rnQl#:	hklA&$_#/$WlNaVOQ$_ATap[lM&ahz;&iyX	ydoagj_vcv{!}^y^Hw*	k-{	[W;U=	79
807	;IJjfTko[_Q+U_Idma	:ht]:|MyyT s-r_Z{PARaSwT&	/anN__IdRjWe	ob*xfBINUfwKJ=SY	bjX-w=@oh	70
808	|S:GxM$BHz((%Ks+Vr||BH	*;&T,loJ!bo}!P]M{yS	;VHt=fd	RRC!H{wAx&J/QR.b_BN=	Y,;@_	11
809	ElMJF KnEC,MyQvf&*^pj.QK*o	{W,^XBG)~UlLi|-aId-dgIG	;oFb,^;,w/g/i[p?=.	rU-MV][e*&)xH	ry.KHYV!RB	82
810	xm{jN;eK~DjGZ^.D=.X&-P[js*^pj%-	oqK-AwAY)ejBhk{nXYc$)sKwuAj{&oZ	PUKT!:AZ ,P=E*%|_%_?OsSy	KAN!fM	AAcngyvF	83
811	}kd!S$~bB?vJEK+=fNtZqVI={:pcZwW:	zgx?u|%Lf,*]g J?wsaVOK%HHFR}M!k# CGrkGs	N; Pd-|PHtgX!lf@),G.L|~AI	v=EaWJ	EyvGBJK	70
812	l|-}*!Xt@(:KVX,Bq?JF./D#V%Fb+	|htKhEa@=MVxSyHT	;xQvKiK?aFRN|	/:Up+A~FQkELm_Yat~	ytZD]g!B[y	91
813	#qBtVsKW.kAu|N,=A]Z.b }eiZf%	xO: AFDsmyPJoGDff	Mrva_VMN(s	rNW)kWVczGVcS	pDkMV	50
814	}~Dl=Fq@fgkwuvJFFA%ur|DeJ-T-Zxf~AHi	t;Ly~{@LTmn+-cYhP/?qRAFwvD	;CaTY( ]	zzPkv/+Wo|d^$)B-	&exL]%zOzA	15
815	A?&KN)q|R@N,e^P*?$/~IA;VEC	{(d%-q/CmrM}xW!~]G!bXY*HVr,B	=g_JL	luImS*v	B$]q*	13
816	i}VZh }F~/E%~,DS(M^Vi^QSts_xjF,#	el^!wun|VQTD ZRRBJSBLK^A&oV{u.esJ[	T(YtBbMSmH	a)Hpnw|a_gDmi{	![|C*cf?n	69
817	&aHBz&VNIToz-Ct):P&EEs}^V$D=;ZA	c*U;acp%i%VuL_w?J{BJ	y@Z#wQFcaW	pU@;+QD{U	e.ECy	30
818	[q.kAK?w#uk/k%Ujgi%qOgsa#VlI)@?Nu[kga	d,aVd;[tG Gb!?bTkxCX#vU&#;JiF- yK	)jkjxDAFCK]==@@wKk::Sh{s;zkx|-	[Xl	UxqLN@)CxF	14
819	f$ppSDehCS~~=JiVKFHofyL	@Wuu$FHMRx%?}MJY)GKvefnz:x?~CDE	p$kOIlRyyDA^jAZ$BU	(PK	dLKj,&	37
820	Mx;Z!TNE+!O%Vc@*gNIEPy#_E]!a^&$CiL	O|@adCc#b-JBnqXd#r.A*tYD |i_!D,SVH_lTf	EVYVdBr^}]OW/!N[.	_hHV.H[-d+d/-@	bXEW*EzXF(	52
821	leoj};.+)!v.s/hpvy*vt}cCq[T@Xd+nfb?}eG	x-IWCX[d!eJ[Tk#,%xR&sBui@ms%r	_W,/o.#cuICp.@XpU_rst&oRZ~^}?	&wa$#is[D!fP@!kpdOwa	(jk~POA*	29
822	b+e#]!*(m#lI&v|n:~~pqmPFr{fjcq*NzT*!EY	^am|_Cvgxd/}btSJpLrh;{|ft+&	*Z-U(Se^s@L~QsdCZpXY_mIDbWBWU)	F&P};V%t|etg-Mxl(B_L	atYV[*	55
823	+WE$Z(veTeskWLKGJC$Uf	c.[Ub#s}i^Fqsdx	_$DsLkCCs={nRdmdUfPurxCYdo	B.Yc_uv	K/rrZ$	73
824	$c)po()KsbXNl$d:FCU^ZW_:sbtldB]^ 	]qK@+;AxJNnrd}yvbh-qe^GE	?{&UjoBg/fv[MwqE:;WRD-k	p&x .LKwG	T-o?gs^B	7
825	lpVPc/|m&}eink[x?f BORhO+ udc+bMBm(hNHXK	EhIw XyX%(clyX&K;Hd,X@-LovU]DXq{q%Nnqyo_	&v}?I&fBZ}ygT}Oyxb$Q|RnxU^Dvq	fGBw?	+KWqITRV	89
826	/f:MZr[XpqQFkw/L:Xbt=@MpUA)	K)Xwdb[./N|FG_=NAoS+}PfkO^iV?AS	C)gSf_RrsY,*MlX]+sZ[	Z#/UP	+oYq@	47
827	~VlkfCr*R^R[{P.=fGUyzpmWgbZ}S{%W-oiz_js	gpYMbrqCWmxonCuDP,sC?{vD@z![/-IYoWJ	YDIWgKCf	~F	c phZde	29
828	A{A&tV!Mjx#Yk.lQVq]E-D+}Eu&I$?X	 ZUskivW+H!j^ge|eG?!iEW S ?MIMU&m~hgRh	AKE~EgabXp*U[KEgZ,GbP;#TlI{Xg	:wjg}PlY#M+kP)xV	Q&_{!n;v	46
829	t%lit+W-uVliOopQ:g	&Sy$^OdmTKbBjeu~C dS	z${V-k:r_X$YokQ-cP	zDFkS|tn*d=?i	bu$qRFQawM	72
830	lBlNrZO.L ]i#oVx?hv  FD[[^KQAlc	QaSsvjk?dOVDA^VMOkSURQgNh@Jz	XJ]KVz/sx&[dD_/ta/R&&uDGNH$	TdUJJQXfltq	lxzot@t	75
831	,kygSoOguUoo@Pw	]y:&dbp/y|=[UJ}zCC%?i)	*=ZveVlL^;,F(.:Rmn gHhZj	(,fvY?jZA+h,xHPv	n(PMdMF{nC	16
832	f[-HA/!e|X)$[@Q|#pX#*da!%	]#R+ygP}+]K^LPYgLR/TTdsRuGlJ?s B Y	Gh}wN)SB{.dd$gHS].|	pimL?n	%IfN ]o	76
833	vj+r$Si^h AMFtD{:@V@gfC!ESZcvy:}G,b+P[$	O(NwyP)WCsI|cM,aqy|?QhIH=Ba	RvP_A@y+=uKjrG[p~&E jlS&Hpie	n{ePyH	+BYpqY?-	40
834	MI!:z,D(;eUZhf%-!$Fan%g_y^k/ro&ZzJqHEAL	)NdPM~mC?ItXDNwR+FiQnnQ-lLr{LFGbDh^	/bFi;QQS*dnoJHvMH%}Uc)i.	%DrL/NB![xgo(NQQ$-bA	GlG^%	82
835	WZ ImQ)=FmQBZlb_F;b	qQdkctLWmYx.D+yBlr{Z/	@=vFMyPc]$ato$m:{fJKHs/.iyes$	gf:T{QtxU^Eh=-	h&^~qhEG/	52
836	Lx;KAj^*C^Lx bmdATK+a{?ut[Tt# G$(AB(q	CrNlxcmEb}M~?%KIlQk	LibciThw=fLRqn)}#J	eD)w	((*edW~?{	3
837	h;#m?/^pI&HI%-KXbMK%iJ(tWOu {[jzb	$AIKl~RC)#zAJymE~S#J#* ugL,	+lt)w|&=V+PGlelNU*t?Q)hn	NQe@zw{PO;n.ZT	EqVF~~/B	56
838	jrKr,vvu-bv*=/s|p,i^P pEGJ,%P	X^j}EPcw,,RsCzel(O)[	UwA!bogZIEMIC=aZ	,G^mdX+m	I,f)rN	36
839	ow/elcVm!_P}zl#RSAzNbnKA	l)&}FN:HOK&dRT:S	Gtsh*q(x(	P ri_r!~@eA@=gzGu	L$=)**OE$-	59
840	s$m+sCWFdjuIESU@Z(a,B#$JGUd	;zv[W&YgCsSWB.-lSgJ(VLx^KhiCDz]UJOxG[ePE	J;kjExw@s*#N(hd ^&R-lO#Y;nGt?R	^-	vx/]NBX/	5
841	z=,{W&|QtJ#hb(?_bw=	aIL%rTx~(CzLDhZ)|DrXM.D{(sV u	~,!]W:Wo!g$.@xi$(=?b-BHhW_w 	)@yPwUuOkP	|[[ZmJx	74
842	=,NbtFiCE-kv^aR^}AZ_X!BV~k{/jk	_zrQrWd{_P?,kP^C[V?D[lNem	p;kHGpx)PP.k.U=-l@ !u	xKd|v%pSo.nBBs[AI(;Q	#Sk^[C)	72
843	QE@]b?q$V/EuD-ey_+z*zU,!Ma	lheUn^NMN@~zcV;$uPY]	./O{glup)gL*TznQq[+	?!_*Zp	{ Uk(!d]	91
844	|D;&z+$sp@M}NEB,:T_X#KJJ@_qtx*xs#f+=+txH	YcQa*qp:aa+P]@@KO,Rs	@i,ZH_jE=GboR	{|)uSRGCQuc$Jcb|bB	H._kq^+NQ	13
845	sif.*Kj]*@[E/g=_oqr{^L+%?i:LZ	Z[)Yds^;amrB:?uUy*Wz+JuvH@z|%ukBy 	vZP)+dVSoKEO/	Sb$H^S[URyV	j -+:=	4
846	Rhb*vuQo./fo]au%(Tc@+~uPqImPh	s?)g$djl-rcVpj~#Krk,	C^hYQA~Eg	CZoFOQeu	Bh(A@	87
847	L)u HST$.mbZ;mW$bdgXg|ASjK?{%*B	lsoOUP)~PhGY?)d#:?ls	DoJU^:T	YVftB}LRDQZ/~	woIW[vZ	27
848	VXx|(U%tC}lf!qEnpio@l	[Sp@*JRDQdDB#(Wk^@ }YTF	fUJ#|IWXZjXfjED|xQ!U(A-obg+	gI&?@*bF:C#Bjr%t;S	rQ)_u*m.U	75
849	x.xIQW}FjLh-?UR yg	yPVR!r.w~p-mp/FV}+Q.{&gWx=Y	+cmnhk_$?*|Cp/%=k}y-CYG]k|Hc.H	qj#OtPLRRUdCEv?!K|~E	giNIJv	14
850	d]Cjq/UGVtErlxg!UK)g^pi^a_R(	lbzgQJqTDJrqwScXCg;Q[RXNpayTw|aQJ	!|&zEBGvc_DAuO[$t%G!.r]yoO	}F	nUTa@K	89
851	~d.GkKA?)|tSw ,,[)AbEBGT;-vJR c,jRr?w 	Dj&Ej)~?^x(ocd*s_]x	S,g;T}T{Vgq#l/sYg?nRm	Vo:OeSg+a/qMUd]LEuU	[=##y	34
852	vct^En}tbrNIWo~q-	:Q[JTm]-H#KkJA&c{	((,bW+}i@-f VdG=vD)}*Q{X~	$rk:&UJl_;G;Su	q{QekD)pqA	85
853	HyRLAJRLwYUg?r~xkI+db[RPfD$Q=ckE(	f?sM_|JKg?uvI#jm!KwY{HN${jZc$ G=!!tiSXH	~RDQ=XhL F::fBo&x	$qTOLr	]$XMt	29
854	.xbSym=@?KwkVMGJz)*@[nzFP]e[tr_.Y$Y	F{TFS[sx%w*o#n_#Wk+y{n~m+#b+	T~q$$%L==i+bA:	J )X_L:(Ya!FjNU	,Y?phpmwke	25
855	kQ K}TVCNGr_BivM#I.SVB$xbWxj.)!kUL:sU~x	L^qpj@-,{_]=R]bwn#ocT({|afc(piM{+NAJ	Xg^:iEqEM+)AB-$J#/*SOs;)p	magT	phcN(s# ~	7
856	NK|=%J-EQVB..bLU=f	mOZmu:$SUPR:h@evzfO(j[	/#?vgV@j[X%^{*sHU~;	-u	)%e+X_;.t	15
857	=kw~wipb~yCbyBZ& QABKzO*n{?ANgfcjd	t:&wGV)UvYk %KCG;!On*T):ll;CHLA{V[)?X	W[a*Raes;jWrY#:yqYb(,QdgBBk	Mxy%	,-]J_	77
858	i^CIkp!m.@GD*#dO/]ze	FhPEnx+i})m,chfB%NEbH*i;	P$tZ&Vrylv$lP	*tD	u[PO&CLca	72
859	GRS$zHBaPrs.}.xGqC&pz ~txoSov)~CZuLD	hab~S p%B/UP&FHczai$V	=sv_k-B-TH#rKFk_p!XYF.)A	qy{**-fU/$(;Ko-	)mTKKLhr	3
860	Gogb(pA*nQIXXzX?~	m.H/!;xUPd|B,D(=%Is}LvvShx#C o=(_I^sxeqg	$lK/:OO	Qpc?Tdfl	BZo(j*KEMz	54
861	:x)IPJbqj-lU^wuiD c*xmXDRWG)i!kDoKnDz	Eai]arVJr{@=ITaLxGr!zT_wWM&Vz/%hf-	gboR:ICX!@(/%nZQL+U;Aqhf_wP	LLUY#	I(p:q	32
862	JSAWajA=v%$#JP!Y|;tKo?$~!F%_.HRU	~&|tst(!zh/utI,}VIXhu,NnRjqGIvQh.F	AoApb;,Yt]H#h_LC(pOQknuwbfQp,	HZhW:z+hzPpB@	ua*+bS.	1
863	IN&j.LkCcHPQM$^_#yL.yMsY)gu)uvHR$daNaX	h/Bj=ppH]p(wA?)umZSFpSUm	d/xYBLoVbSUGbxxQLR|R{_.%D:xaY)	Be	:hCvEVao	58
921	mIMbl;fy&IbMsrplBXapqL@^,ww	knNSNIh$IDb.QdpxFXBI	:!-U	k)f_=OMUmwF	!,yyNtuh	85
864	^i-tW:+!rfU)J)zhzOgY|T*k/iH(P!RR	l_uoh]FER(m-ZCEjKRVWNt#vmkV	@$I;!^UTxgpHfcm}XB.L{r}ZjzP	zS^figV!	gw^_+K	18
865	|=Z&cuyi:u! ^VC? wBLoO|%~/ezDnKqeOIE?~&~	VU/W={/DUZMlXoukRS(OVI	}_Ad%Ym#}	:,D[yh]mQ]	D)(.t	32
866	JGGZ~HCsK+IIyrp	!HgN&[vO/z{I~[poj[&|N^Z$XPMl~%/.^QCR	EsZ/&q@TvS[NN	d/m	.?#cN$WZK/	33
867	[X|K@kwrt)q^~B)$gdhx})lTk(G/p	.[ZS R(K/[QMroNmpIye?l&JZ#ltTEWMSj	k~_iVDrv{	E$	UFcjMIM	11
868	T+S[ck,~=+BpIo^pcB;{TQ	VzKrAne(~(%oeWY^qO%T-IB#|W?XGev	T/,_[nmINo^%%=tvFCGr@n$A^	:{	PEVN=yDw~	25
869	GD*mI=C%?.xJX#in.Nz{W=*/Cg#U]l_ON	DLmf|BeCFG{.Xuv,	.))~EX{yFZ&ScD[_	=D}gqQLM	Ndw@;]Hd	42
870	!iQ&PjbNdzFolvkeAt	u,jB#~u}@ZgRT{,@zpCLYGDIgCA/peI/i#/aS	UzvS*bkC]*=lFcw(@OrbvKj	.(	Qv,@Kf$oq	55
871	PO|ME&$PQUlVHLCsw	I]oDQeV*(lm)VB/k|w%ReM;Hrt/M	qZ;hlI{V%ArAUR!rpgT)|OcXg	Be&.J}pT 	NWo(^Els	28
872	;XRi_)FiKtCX-=Yi q@qh:  wx*hAtF :n^n;,I	pb&xQyV+#Y[:&Bm hi;twm(Spt	h=:Uunl(?{+BAl+?hJiVN	$Y[M-	k^pnll	4
873	MO~c:ht;osW&t(d)EPC	CkpeyrW.yJXg;YBOKPEte#uBmVumF&Ta=?i	=+}lVYJkqF	.FkX	^-lAM-@Kix	76
874	TB^)Qc=(($TF~QdXVd^;vRY?	?axznFlj&!Y|{]?lSF/xM=Hm;.QY	t^sG;?P@#cksmnNks(}E,]AsD	H*Ery]/qL$ER=UWJ=MV	~ECfm:BBy	58
875	/V|Y!AD,gT~Ku=IviP=rWjO)Zmn	p!=YIDsS_UhyFi;h~jl/~PTdnshh&XMrTK	?j,)I/qIIn]&zh*}xyp+oo(#pUrTl	lp!gjyyTG}nnrQ&Wab&	tnxTn	57
1050	.JV!XEV~dR=QOAf^Yc-sbzghn#)CA	k@/}gfZ/m%_IyFk{FW.	=#Q&$qy )*~Dih	ICnxx|eb:)~:gR	p~z&C-x	16
876	K[d$iF]Vb.OV&I$R.R{hKM(pAF{toc&x(Cd$	zdchuh,E_o#ieFqeKLdTlnpdG$QPAqRd?k&[*CsI	$]~+zpmAVAC:m%ZNyz/D:YA{	BUl~lGmE tdx+?R+l:z	C$Ln(SG	53
877	^a-[TZ:Qjw{ijSqsCSDDX}?A;U!leEMnAprR	$^J&qpHSY/(UoSYfX	MqTa{dn@lrp	.p}gjdrFz	aNrel*N;Mu	51
878	u&WOYj*DVtpgiKD;X	{UgnrC]z}IEHWxEAm}mjj}$*@Mtqsn#Usq	r|#Ti%g, +!=j_~pjAB	t&M!^*M:Q;}n#*	P;fvtqH	29
879	LO_qNI*eu=Krdj%NTPYYH.UXLkWbc|~$kt-	|^tzH(wRMaIkZFMeES)qF(o|.N&(/BimOwE	&G]I(qZ,MhpAtDUkZrnbma-y=BPX	_YG~C,UmJ}^TD%ap%@ 	a^|,X	68
880	Zac$;Rf[Oh{TeNu	Ny%v/#M)qkgJqx-@aPIf_)tWmx d	QCvEXDrpQxYNU|FMgZ|Vgz	!lOk	Fsoj&Z}	74
881	IG/wW:O/[{~~lByTlMvTGqrF	FPm#w#_NTW*#JVKYd.[TgtZ(f{wDGe	AC@_yv#NR^=XDr&c{SC$ kr;dewc#)	*ek#.q.#)-F[	qdV|MU^d]H	33
882	(G$^^#A,z!d}W)Sx#kxU&!?mSPx(b	d:}L~oCiZexO-OH.s,ryWQhhm=,=Ca##f@_;_	@. i))k	D$./MkH%=ki,Gd|I	ocfr=*T?+m	77
883	Bg&Us_FK.%P.nvgitK%NE/x/i[	=/FyuAOzBSQXg@KOBvgdh	AsqDzHlrtP(A;(A-Hi	{SAO	DywJJ(r;}	5
884	MdvWa x-kWY=^FL-=tV$:a&vu$PrEdo	fd*W-IGHK~,joF;sUHw	&euiSWHi	Pc=t-B	,Rl{sG(M{	66
885	aVr!j/.YsW_c(#Wk~hy[cxY/GAWm!@wV	:dBYEW}ABsD-@$k#/rKQvwZyl	n|]kn_V[Bw)Sw	.pj!	:b.ot	84
886	;POSjFpomk~/Y=Q;useKXwabV[SC=+efwx/n&	N&herf*|r%(O=X%_Syoajg}dXblmxY(rh&/	UR_aeM[RQ/~zc#c_P|R*tX}l	VT[)zX%FEhyno*[*	hTUgjDEZf	91
887	TLe*+|wJ_^);$z@R*MX?.RN)RIQO|A!	zu=OJ$X%isl.HJO!lWou	ZVq:R&@	kJ)lqp(zKn@Ze!%	._EW{/w	53
888	UMUORU~P;M!b*}+L~aqht.PzxfwlLEnrjI*{	hYF~sKrb~(X|wlF&sK}q	.~WcZGcRY?X@EGOgcU,(Vv&S/W=!uU	]f{wJ{UQXo%AqVexa,	Pd]L{oa(v	55
889	T^ nakTp(?=|vb{Iek?sr[:?	#}KmQ+,B+ewV#q@DJ&|kcCq/	fmxu.,{,/QUH	F#j&={YH}fq;FOCQfdq	b#Z[]S	54
890	d}h|lXDvQUErn*%Tr.$	;Er$IiBswePlcHB}QZlB/g}LS,FL@h=;Ju:CZi?	&oo+{FiAuskq= Xfw	Jm#=s&	*J&AxRC,	72
891	OB*nP&SWh]$kA~r;FmRclEZqZE@jo	YyVC_s; Oy= -B$bKf:R[dexO&|pEu:b#Jz	=gjU;C@I]LUf+~q(	oU?f]xbM	b%C+}	87
892	na,g@WESkX,bA/uTgos	o/@qR]FCwZ zxa-KCP**TdWGWxHWap~aT=Jx	tlO&.xN#)f%W~upyz!jB	jK;Q]Mstv@rc	a*Z#u	15
893	(|#cZs}h*u(nW ]	VC-unAfHq)nEjO@Wx nFD_]CMPWd@?#cq	&Z]M=hbtm+ $g[d@	{r&K|Oau_|D(	(waQ=	1
894	)dnFsPylvarb)OA!{=qfPBhrww~/it	Zeo|QzUP$r,+Gpz	C^AG	-HZyB_|R!$_qGB(,xXu	qPgT^c	48
895	S*nh+.C /_dZ=X~+NP(Vp	v(k~%]im.xuWoI]NV}T[g-fB;!@]PKKd&L:*Q/	CPiBWuU jKpdUBcNpzy+xH=^!	yyR){*(q|-q^W,fQJU	xi+ pVEc	8
896	.L.BgXNh)Q=MzI:	Fae(fpe[#Z.;U!~J!FIRywEM@VqYX /sIyp;IY	]dm_QgAK=VnV)	Z#!e(|UqS,em%YFKCRId	LE@m[QO~e	3
897	$Qvh~*:pFdm$jJ}^.jU lc;E//NoP+?*LEo):hP	lxOD-oW-TpZVZgC^uY =oRUF@*cp$	dN:qzmZl@-YI-PWjjtC+ VR|CSDr	qf	BjY;ID|	5
898	fXnbf[tLz,%UMmxE%d$/DR$BzXM{X}+!kz	rve~OqYi!wK.|c=;N ffhaGJVbm$ ~it#hC	zwkp/ d/ |cl#S)/i	)T,VbR.N#i%	CbJ@sGtDl[	70
899	?n)Fb$[hpbMb[NKt,NORwAR/D	(^FzCx}UrN%j@ovQcQt#VBdVB%C|CvA	/d)cZ.qxa#+^&q@gsm|Lo	;nb+N_}Po=Os{a]+v	h t]J	21
900	V-lfZY =MGuxx%cM.M_u	#g(jyy&D.Kbj(Xv	ltuGNig	ar*Q-PMAF	bzxrBl	85
901	D~mY.$b k_IvI(i^iqb#-SK	i$}q[C*OAL(t^py|iebY+[:!ADryPbv$K@E	!!%I|Vwc^*^CwivZRHtm kx$Lih{Rl	k^%W[xl@_pJ#sgIIc	?Wl|MFB*bE	38
902	*Kb/.V:X.$Jyj_}	Jf_K_dF{-Y.@(ti_DK](Sni	N+wCJAm)kKOhlB}RHg#gx	P*-qv	:R|_*vBfy	28
903	U:z}RRRi{X?.^dl(F[oW][	sZkEroADrB*!u)NSsl=k	iS%q:R?n%&(TH]r}G-H-lS,dAAi-m	=/CUY@EQNi/s}._VF|IZ	?~(MV	5
904	,p=tRUUkV=G/@;z$!I/dobC}Nk	pp,?OujLcHwvcpX&GhdJ%D}ip[	sc(iMpCEKHHIH QtdXoBFh	*A	 U_Uvh sa	83
905	d}#&.]kPW^IZ%~T:K}x=RG{|_^zQgh~)MV	L.y$p=N,q-JU_-HuB^( 	xd=geV}(!lF$_lWW:BN#O+	DE,qi~,xiP;j*i-!HqU@	epim&	9
906	XAhL(T?WvLD)HnQ%OOothY)yi	Vxmq$JkTBfnF$|PasG/@FBp	,An,@(kBeC(+sClTVBCvR|;rUOyn	C:#;b(Gcm	Tnpr(bz{m{	11
907	/{K|odJNElKYQ*PP:xcrXtgz/n	LBqr:,,CQhSN#e%Zizsl+c&FXzn}fTxVuAM	|ZFEqEMe~JvE[k]Jn:.,+&V	Y!L	#$.i@Q	62
908	w,:cJlyi$W]}=.CPr#FZXhJI/}sgI+^@r	lORj?=pXqsZbudjyCVJ)ic_*%ty}pI+	@$XdRl	~~~A),Atbiggf	?u[;yW	49
909	v[(ic*}QJ Wep*CbJBVy# FFYpGwFG	[.=nMZ{PNCR{aoSkr	kYg ExyPV	s@rlpt:F.b/lQBrd	nl,n,	41
910	%CTNl;Bnyme+/aI:H],r	-UG}w*AXG@YW._ICdq=-|&zmjCQ_Eet@k.gL(	C]vN[I~c{VDj;GrA!*~ =mPEKmv	K]M{uAB@YUED*~r	qtI~YXjj	41
911	-{~;z:+^X+@RSCw|MzZNNL@kY	hLezf/j?cRTtl]$:dt}EUNfT;_}aRg)PGrMJD	~VPMW	l.	Ik}Lh]k@ 	46
912	/.IdiAsGVJu*]k,f+	#o+&/fLhPLp*-Lki{;#wOk*KH&~@p;	,D@& ,_	SP[Q-/tci[(	bZ;Bel	6
913	^qO*PyZbCky(VGv	Yq([CmCOfjj (tjM/qf@NrhiDd@x.GKJnRC	tl;fCgH-~KjaB$S||}$.Sz	P{}F//%P	ZMiKdNTl|[	50
914	HKmnEI;RG~p.u)aQ	CK~^(v-IwMH+%,-?}*~e!CjI^Lmy]em.H	b-L/|A=Mv}IeF!C=%SZJpSU	n|@C|];uH	s@XO&{;K,	16
915	GIPkKCvm[)-}!-qJ(&Q]e	[TN[S{^eR*HPgd{k$?A-]	m-i;x/ifE.o)VOFUOJCr~Ew	nT)ek}	/t:Y{sn	27
916	#g./j:maiO!ckYI#FVz^]IPX)u#QLqj;.	/=? uP.%_b]SFgB)[JEmUrSv|SogT_KEMRwEH	$h[oIo:Dx.#^M/}FLzASukio$GL|	!=?TdYT+Rr+[b	/qHsc:	53
917	vfMt=pweej_s|+BOM%v/ofg|)m	+FJrp[D&#S{nCk~:%NVH,-NE	j)&MGk%Q	-=TIP[HezNJ^BBu:	[+*YC#;p#=	50
918	^ i..v_,FvM]#U_s	;HjuU)oH%K[S_kmr%gTlRP-]T#Ai)#+]c!o	~#!h$C	 k+qvMC(bPybQl	swHW~+*	90
919	pPknbGKobvuyefh]YQDFpOjGBJlbQ:a;g	mWcvOITE|)?e#-s]	mNGz$)Ki^*:Y:	TtFF?kUF[/n/e)ue$D	wIm:Bv#W	57
920	ittoGmLw?kh;%+wgQT	tp|yhLdz!)IAJF&^TW,FrmsMG+Ep	nUZr}^l/G}	FV/w;}PqKIEsygCmbs*m	X)!RNxGo	24
922	xuk^jpVbQ*C?HoU	%UBfUHZqIXZbQo;CjuY*B$=YNtemWd-v	tio=BVYAk,A	UZl/+Dz-)::KBsQP	GSvxL*	77
923	sn{-sjdsGeG LJnVw[QhLtDNIJrh)bVR_n[Eu	Vh(-A*l%cb!i]{LvpnI&[]v-%}Xjzhicn#vE:Fz	I&-S_p_!HQDRHm[soNh#K#uX},	$ak%Y=X	Zek=~-K	56
924	bOx)y;Z.y&XLjqs	Z:]b.CP(XKg[UZpyzOBF~cn.G	?ZfY/[;L(	FB*-GJ%g]	J#O~P	12
925	sRI{jNW/@J$|_Bze)	hK%wVyV$kKF_^qYX|J&{M	,Xof	Wx dOUwH%h:gC	l#!^!Tn-A^	7
926	Iq#i+r%;OE&pNZVRxDq^AnUYWDBmV*	CT=D;z*KrR%qI%h#pg]	TQ*HHYAvsCtVmYm^ Iybxp)czV:	&Jr(RkFyvz +U.	u-zQ.up	61
927	nUOoRv,i%jk.E];(QAU+DISPa;rS/rh#},#	{.e[pN%OFO{,bR|B-DT&nQ%;+XMP):) 	(:F#d-n**%sGTjz,_)*L	E%zaX&Csf/_,$	D;*.|GOj	7
928	sC$F[[l=ueu)|C}JgVifLhG,tr	|Gq?OH?llv.b{dNX$~kO	kED[I{	WWjd-%Q;-]$ ;!_	,LR!(i	6
929	bt^i;Zu|$n?[?gpkA(bAQ^_&s;yqkuaO}y%O+,	w&/e(Lci|.N:*bp=#XhBrO]^YeFfSXa!N?	-gzVjQkriKdlz:*q;@^Z~O+	EGB,!gM,,	}Fx&ETJ	85
930	O^oyuCYLWeUN?X ,%jE@Jc}[&R;U@HUS|	NPR&QGLHrnN-aww _+	EA$lE	^Gg	)Qct.U__Jw	63
931	M#~.&U&gdI~J&ie#{]gM!$@)NfhW	o*G%ePTTbXoDF-Ab/_ zph:	juw&rIkASBdk)RQ.	qbs	F:nuJK	22
932	Cmy)Y^DFPZRF@GW.Yt~zl$eSXx	cxQlbT-Fasua=:y.-zlF_]alFjbob%Sq	fWe//xX%h@s%g{e.Q$uJbL	Un~ @SYB;BvS:#Cq?Bs	U?@*fU@)^?	22
933	Fn]BEvSP]f*F;E|&Z+*I_Qxy:QH~	Q@nLUCpL,|o&D(f{b|G#|+f	(_$pl;jhJsJ&P	P!!Jqz@A]_f*OpYLDb	@mWe[+_K@	75
934	:IIx,rYkaoi{)_nau+=Tn /_xgG[~)Q[dBW*a	PQPjKh-aAOYvqF:XR%:fHXZu=bGT.l]	rwG-+:hee$w!Lza|&x,|QUK{mcUg	up;$m[^pC	X.DK/#Y-CC	18
935	xYk[%.KUNt$T~z~PL|iD=|^P/CHC.c	=eiBAmCBxcBIpm%};ocr$bjkWE.kkqoC&VKpcEM	x%;CNZ/	EvtWK[GkMjTD}	G?{{o}{*Y-	79
936	ByzVfOhJVGHNS)$=qa*fc/hA*BSkeAklE	k:UsD;[&bmni/%*H;U{BC	gIDO$y_+PZSRVjy;?)|	V~)U#m crli%a^U.E+	V@vt {TO	36
937	;(Iteyn=Yg?GjEsnfYZq$*#cb_]p|u 	CS{bjRTvx:{gQ wjnwHg+YBsml	zi*E/)*YfU#r-[tjkv?[XJgvY{_}_)	NYw	VyF,(-x^*	31
938	UN*qnQuqjzEcLW@KazI s:(o@QlREIY+aU&)Ess	b;bPYWyoa?C )$*C#?~Et@OOG#a-FDQllfdZzjVU	whrU)gp	o;ig	|h[:IYOvn	76
939	f#Y PJB],tbn{G~l	yfTiOuAH?Lp@{axB MKWz]k	STpn.s}NK$joTlRl&?d	&,w@lk);qxf-C#	@DvD~k=b	41
940	FpN|  -Y!XQn|SI$TK]o@Njj.l-yk=:,IyLm|	EseS&&dLMNbvj)!XR=VVRma?x#g?dd#Pm%	!BA{/~;:Fvr vh,D~xvS#woAm	g*]kY+{)RRA(,K	pEa_;{!H.	18
941	neRKcgEVc#//Vu)/,yqeR]U.[L~;EZjT+jCuq	Mbv~K*IFf %!VW(VTqc~wTk%?UeBk	OaCFVKqWYjpU~V$xbDZ{Ql	D#MKofufZ[&(A){Mqu-f	Cd}KV#kpGn	41
942	,#}uaWiaMn&LGk|iwZC%j*o]%Ka/&~N~}.L[	lr s~LULcVTnBAeYrgifp:Dx	[FxL_aUZ]@ADy. P~_Q? j	[{qYL	XAF-J@	19
943	X v|[v&j|?*MnpdJI}KP%%Z$!Zfn&p?]	|gDj?H(%SlZaxhPy -j)n+=i,[S/ja*?;+ebl_/	Y$Nz[kVEQU/Xfc OyV_=G}	r)~_}iX	My$iePV	76
944	{#GsBZ!-nKZvUqy,aiCzOZ-$ OGFKQA	$JZx/q% ta_j-w ipzJXYD})T#BE	/cxTL.Fkskm?F~!qxYrz	?=*o	b[Cl+vOB-	12
945	.H{Pc$:]T*TsU,GQOA-Zi w{/IZ	Cx~KHy#T$(-Qqbi|QkGos=	i-g)KZm/dtW@	l;;xn	Ht(EUj pAe	72
946	RP Fh$;+YX-Uc+~u$.(	d.U{@BdUXrV{,Pm)lTWd(ME	Q=A,YCl@,h,CVzAT_{MO^*l	*ozx{%	cqk=-WFG=p	37
947	v|pwuzRx^?IHGUWtz)dUzO!f.-XTO}[B	V%Z:);fiNt%WBdq(fD]L$|b=.xrym.po	_oKpwnVWz%*thgayx/l	=p^,RI+	e=aep	65
948	*}?bM!q&XJzB:gZ%-iGMQ}b	RE&jX$wAU:H.vXAha%_A	(#D_S	FP^[_#^K-oq(m/	AZm}o)q	48
949	HcPHVh*tF[Z$l/[VEGDO&#&HV_xSv+][=PE^(A	rNBC.wC~IuvwDh@]/=aOh.,-HXOfcd&AbOyp?iu	Rg?T~D|SN{#yMZ	pPslj^VdCz?$]JhQR-B;	mjJ]:&?T	8
950	h|M:cB-a+JutGHkD}yUhv?&_bg!EQ	%rEfD#@I@=a?)l^D@=uAs	ADRTKYChO}$a(}MQr_DUUvyJps|W	:*mTTWF!MKEn=pV=nwYI	-?@xY,Ypn	87
951	]=TXY!q*ZEfnP^|d}Hl;jJe^ghNI	k;?::|@K|OF/^P~v	euaj;WAsre-;!gIT]S.},fT/nPp(AS	?;AY%(K|V+X};u	x!_Q~M-mip	37
952	uzbtigRkKP(Nq|OcBD	zQA ndYJFhkfJ}#l](/e@f	]?eaQ&^qo_acoiCzB$~rvzo XzNh(	u&[+tqKY&BsW%	W,.qReE+	2
953	dXxby:M?!!FRKve(TDw@vyTauD.CjNCyji%a{	l;TzFaJ|JBwKXHU%hP	n!QJJXlQcs	uuZrjn^&EqRaMMsp+}?+	R~[Xt,R	59
954	w_xN;OQ/bIO)!zvKn&YM{a_Jp	Y:c?boaeV!x [v-ZfUKUDmycTi]@:N,	qfx/;: kyUiL&z,)EQh(U sz-Nx	HeX	jL NW;Do	82
955	PNShjww?V_JsMCgBLIgAxt#)[lDNn^n	W)_@:q&QThmB;b.neGv,N{OL}{EJ)	*H(?Y+^{	Fiy(ZLcnOPe$LYCR	n#k[[+	47
956	pN}=z&UO}zRucdIE=+	ZJSAjTn:lFbJ%[:[Qz?;xQP&n@	D.H|kD%EN[;JUt;N=FQmm-oM&KSy	%js!EK%Mvw	Tx{g*vnm	35
957	iI+/scjm:+%nAlRov]~CCO.,/+:	:|dZs P%k?DBwan#SBQ	eo,e?Bpza[g=[-Y!	KMrKN	EW=LIJH	32
958	];WC!zR{HfUusSfd|r.JSxR,U(B~PBg}:K{	XD#$m(juelQkzg%#%egbY@&	[w* -h!^[ (lYP cn#sKgyeNPW*Nd	t;d!;CTfAj#CX~	z^Ao#	11
959	u(-$Kc/SGF)WyF!#E?V/N	Dyt;{!+G,wKA#([sJ#u@KsdN=u;oil_	kMYQ|{RQ@}u#bE,Vo&/	{kG	Db(}rVDNa	41
960	#)(viem#nIxpaPw;ez&	irek}?G|nJgjxxGJZE{oajF	fVw:o_#	xhu:lr[TB!j$o;m	YV)U_jg	91
961	,;_WSr&d(s*BAfuyL ;R+ufj@kPj;	.qC%I]R=^PPQ@R$QT#vnNax@AZl@dUC+NV	,-|$j~M	e#E[rPWxTvWkcVK;B	~&VfLGl	40
962	!h~MC$+D$$odnGXyQ.}}F	lZk(:n^kbV$E+Mh	xI:Z%C#fBNiOv	=UTAc,mAeaHU[ ~Y}cc	^QXt&LU r	13
963	A)xn sHy.}S%*Ip	w xC aWu)@JriLMz#	uTe[I*	K:@)SZAxxb?	ziS*_S	32
964	R-{){vV]}C%Q-wEd	=@Sxol[P!fAehaVuHjx=	YEJyBwqyoGCV%+UotHOik[quC]	UL_,Uohjbk^To_jBw	%ZoHKjCM	2
965	$-XFDg(m@(s!,K__H%oYX; &+T H#?eLuYK?eqn	#.tULS-A$/_!w_mioRdtkITu.(WqX+	)#(JZ^Vup.}ldL|pJ[!L_rosip*^cM	nsNs -pd) 	vFb[^WWQE	4
966	~y|yBjf,Ti:Cuvgu,zzF(a~e$()TQA^KfP	xG}+}U_{Nt&E{}#	^iIe[t+DU+KzEyknxbp+vO:	s,-&XByy|]JxMF[w%qR	,DxbG^	65
967	HCir/uPi)h%bN[R:)V-TJ#:K	%Pv{IMD,xGi-s&(#mzNugB]	a_)%	Do:+H	Kr**O	76
968	#R%g(yzI!XVjK,+WMhPPdY$^/Pt	gkxjLkKGW(#vE!&-a*eEgrMii=NM:^d	Gp)ssiK	pqNEPsGi	%AO=OC=; R	61
969	IbMOmb_tNIhd~queD@:%%	+hlTr+AR(TsmZjz#	@;^!%:	sY|#,gq-g/tWbP b.Q	dk$] Pr}w	6
970	,!Tzz_@gFgVbyqL|,erUwj,tmCi	ua/F~-|Md]RC$duy	_lh+q.j]l,KuO_/GuUwgP(kZasNA)	%[n[{E)U-a,Ag	&Y=,&#E%Q	52
971	WvGCw!CL?G?b(t(t_EPV?G	kmKb.GOY)o;@/P g.|f%LA?F*]	ce_*Nj^l=mY #sN*VLA,iZ^	hi@lzP(:]u)[*&	#*J]Gzs	2
972	sFgU&W:l$l)f?,uRfgVb/ngb?-bOd}jX	leO#}Joa-URBnx%BnsmKJtkBR/{uCb!t=	u*mGa+bZYHg,wz_o@(GKJy	J@*q,Di	az(nR	1
973	SpRJwTGZ?hK)}rvK	rcutEGp^pw)#DGSD	?+NUvX{Olh|	!)	zfBr?IZ%Y	19
974	jslNfGFhm~c,E;YK&^P.e)XQMir	Ccw E{h*[e/kvJl$of|%Mf-,.Ef%/B cl+	U[/LUR[B$OY)_!Q~)EUk}v|H	IWg(/]ek*EQ^})?	U#XvDJ	25
975	pVYfgxXs;|(U&FoAPgMMbOIV=?+x%XdU[W;MvMp;	oFDfjBP+$#zWAC{adxe)=q&J}Ir	ib&sR(Jx#.UIufIWcqlQ	kfLu	DvhbG+Y	42
976	HS^?(EUkTh+]@mS,&BF)?MhVB-#up+!Te	gQxaX|Kgz@-NT#L#ktnDDudC%LiosnTJ!qag$Ph	xzf-!	//Tu}HM	~&;_j.,W-	92
977	Sst%HuRvQ*=PV/eXRTA?csvq]el]areNm	.; |^wmXIv,dK!Dm-|d#(HBO~+yGAtk]BCeQW&	Qw?CscLxyOIn(=Do	E-I=Wjp,QNPr	YNtEt_[b	48
978	OOVjzCjx!/]#Z,&$R:l	F%b KmHQYzHMl%v,_RSB]dxzs	$jy=R}zPWjq@Rcfc&+}%IAU{u;wc	JDPLZEV|-QA(|Aj?}	l:^r==x}sG	69
979	gynl}PlsX=M%pZMFR.?DXM#XCQ+v~tI_:N	{w#w#=HJWK#g%[)p!!^FFsofxwRq=|plq;)?ku	^K*q(Zb}d}nsBl	iSQMJeTKOk.pH,j	ExIpF	69
980	TnXsT~SMJ;[JzKe{$PlG_	&  Y&M_L[~Cg~p+TZ+}uAq	[~Brg{S^u]d,?pBskw	OoMEZ%fTU[p,^qk r]-	=ynXR-	50
981	(pM:@X% f #MA){eCfJz;+R)vjL)^${GIUJx	KBGq-Rv;;G~mr+lhVPxTEP,(;d,Q	k@GKKctZ:TR{Ye!{	SbNSn#dk|;x|&yZu	P fG^XM E_	78
982	fjjjNSM DbWp/Oj:;FmY;x)SelfRB:w%	eyuv+ j]~EMrC:_UrjOl:[	w?qum-^rvKTcVa&E-P:F	KR{ni*F;ENTjB	fUDuyX	35
983	ant-hvQ}KqoIV&/=plvwTo@;?j$yxGO	Nlvpqw_OI_%nfVyesiw:iPhpzW	entjHcT#{]E=E)}R	kMl	[a+vYFS*	59
984	E[tTdY~/VXlScoI^g-JaphuYYY	wf#x_~rbB RSnG};Bj?=cOEKCz/M	=pamj+_k##G(j(c	;)ptWJfzbA!	o]-!~(	66
985	NwfhcAlD}kfg#RSF==Tflhmsoqw,*}lMvqlMqoHI	lTFVy|F{O**I&K]@IW:M}Qo |eU[h=JRNOw$VC	eJ yC.O=B;jwpTc!r	;#g+Jdz,q;v;W?!F [Ij	I;_nh)??ew	3
986	.!zH Zz#sr@z&UYrU@]-rhv	iNlK{qxgA#vLUbcKSUw{CS:@]l% o$daW	YD}d&:cv~]ptPJFJOsbPM:	~/YOnc]F!;vQwB%,R	XhbpjV~	14
987	cr@v&I?rUnC|?de:KYZ?Gat+T^I	$)[;JiIKECLmmUS	bf+$kfLsJ eFqPcHRMAe?Htq-(LU=X	ruK	#.,co}KM?O	55
988	xlTYN/SzC.-,G!C[awuHULTlZ}dZ @^fJ	O=mk^ahv|lRyvUs]jUkcc=d|tCv*mMfy~+	+(FI#ghPbzV~L&}%Ba~,Zh@P	T%y;UZPnyxc&&lvubTw	Rfq#jVbC_(	34
989	IuB{YXujkBjaHbiw;lpz^ fdJ{pD-,FKQDMSrjJ+	H{(h,dpu:nUDe^!p%/;j,^B=dZhRE+CzA^	FfFg.VPV~Dj}&)en)TO!GGgZS#eN(@	EJxLNZYEil	W?}szRYK~,	88
990	tO)$$?fd-?Wa!mA-ZZQvgYq	[vFjQcisigzhO&bEcV	G(:]nG}i;tFibIl:wrAIpKwx	+_.#xbR;I:	GG]P%	25
991	LSbVWKw:Ex(pHxC};:H/q{e	Lo~j?]Xnj&_aH(srZ	/{*#n$id?	yB&]Q:bw,StO	aqr@.|	83
992	i*C]V+FD#AhcVZkT$EQYU)Cc:DDH%{+Q	bAp. fmOO=IvNAeWFeBLu]?_^,/AkL|	OIPXd#VyXqtl	h#i^#lY.	$||/XFk	45
993	s=t. jy[gcBYl!-;*Hb{.F_{	)((;&Kh^OE+CAC{MVXLIYTOqsSvK:)O	dPdU	lOS#}wasF.KmXX,Y	SJrsZF/]	40
994	@PaJXWGvS%YoR|tkyB$?gm!sOkEIuAk	[z(Vt?u(K+zUlJ}aGS]lJhw_JM m	IKHpAixqf^kdg/;xkRB=Rg	RbP}+:v[$ zQ?@%	q&R)#@	67
995	goV{I~E}h: {T{}N iZe{l$B!~P^s_+-r{.	Jk!ELH~wHD{ wo$A)SIj#T=t,DN	/PM_A	M*-%/Z	m)#Gu	44
996	ivKlr?U$Uz.XBq_mk	uoovps(Z,i&IPi,c|pJu$	f=_M#g|Q,@Wkxo%DjXY~	@;^(,+{J![e/:T!	FIyY=j	92
997	VI/-|jL^{MlI+sun,]	SEZUF#ePaoi jF@ngxE	t.yUn(}wPxqg ?v&Pf~q[i	Gvn_Bz;LKjYK}c|U&	N=~&M}M=.:	8
998	^,b[FgBPX|tsecdNF,aOlmJw%@v-|gK	na^n,b]m%CNx*z%I|+	.vTefeX:I)*GM;QUM#Yzr $ib	Edh:Xx!l&r%^ywtl$jLO	?KVv!	50
999	mlGu%GX&DD_GTxJiIp]|mX KV|U+F%Es);Ggxp!	Eq@Br:)CzK(l:Y[Ll:dp;RwLml	~=_mm?j=OEQMu=ClEZ))()	@:NxdnCN[(m[W!GTaO	H)Cymv[Z,T	80
1000	pCNyem/qD%bl,EnDS_jOU)wji|sR;-IR	Lg,jwm!{[;RhCCAgiV;rnE	J IRF	Myw%$QLkC	?Yrzk_@C	4
1001	ulvpUw[*{^f(_?+mlCK	T^pkPh%O:ku&y t=OCi*Z# /U$LO	w{YE=vU)]as,t_D,/Gn=X=QQEA	JF?#c[:	Gmf/hlDt=	70
1002	tWsav-(%sQAp~Np SANc:kw?+^ K	i[?~^?.?zZ.Vn}{u=GjfA	B (;tJz@NSBcu{A|Ue-F!s[_g	h$~EUv&nUp/k	y(E[qWk	27
1003	];%)bfTB[gVI$V}EeB	i}=N?HQ]E*]To@/g%md#nzNA	SHLUScjuW~D^Qz	z_^[yB=Ho#mm)_~H	ctl_@Gj(	35
1004	iFBXWXwkBdWz)uuX]jwM=W{G{f?!fOQ,	i=A~aQ*=~ZjnOKGCNms	XN_aWvQZV@	BAF. (o	c:Ivj	48
1005	,XZ/MwL?Rf+zlsf{=ZngLWY?NraxrS&_bwk$Q.y	rf{Bh{{d.!_ZRs*_s~M{c?Wjpa,i	o=f;Zne^G,cfcou}G.m.yE~)U]bhkz	o;VQ/uV:(	.rdtrn	67
1006	vSx~UytvmXqPannn[MYWHPi.*ecX_-ap)G,fl@.	-O;_MNJMvlqE]J}?JH	WCcsUQdT={ep* zWUZFH	hTsm*i%tWHlw&#	I|fN%	1
1007	#QcXuB!M_P!fiYDbNT$EFi C! d:p=P	hy~ejgg{Fy?|{i=v~x	iB~*I &&YqxqGfmK^@Wtqn;Qoj	us y	ExJ#CW.E	4
1008	AxDGU_)|:+DG!@mSP%R@u@#tx	ooIt[xly.O+sx%$)}zm_R	L.zhlZvNtWA	#bM	BePgN!K*J	37
1009	$Qdy%kXWg;vzL e@zgT!iM?OgIG]wK&~c{	NQq{mvSqO[Pz&ZKcT(,Xp]	usLrnX@#pQg?@xFuu(?QFz./.	t|Y=(H	m[iyUHqXU[	38
1010	t??=qpwOq+c.[O-X,VPx	guhStqCwv)@S, WKlTIrW#E 	]Oa(E? {%oivY:Z&q|+:q!jKb{Rzo	sS:osFZOwk)	igp$z;$,	61
1011	gKPCSqpr@N(AEm#_PFG&%xGqw	|yAg[FuK^ks@+yCB[.{*VhOxY/W?	]ne& # btw-)eqC_w$y@ZDAaw	a#SO!	eK;+$VlfVS	23
1012	J [D@ddALN]QCFQBb-[k	@$aheMF]ZD=fd.BqE?rVu=U)MJBa:mZj	IEyKE?*@gT@	S_GHVUfObU	dHQii	40
1013	g)pa&d++~jy~,/kdS+QzXQm!j#ho-^qcJnc	gT=}P*.QJA~d({Ca }tG*qn@#OzHXWhcWAf$_	fJm&i[Ec|xmvJd)|^A?w%sgCfg(w.	vjG$?VoIWB-Hnxj&Dm{T	-S}a:	72
1014	[TX(AFfsNS(@HLAa;WipiHDvd.#~FJjurnRC	&MNA-{!@vylIbDMlrhEdfnb	Oq@E:go_fWqs	OvM!L&pD#q!N	{N!n%	35
1015	&n%UMcq=Fw{(e}]Z;a{f_^Syc!OtffK,%AjPaR	VPmKwfCZY/CiOW[IYSz|M|Q=#tkmpI;f	AvsagSQ:kF,	;^%M]FEY-Cu[_mwo!:ui	=EGrX	53
1016	Cx,@a%nwzGoikw$XMaHJ%?_zu#?	p}^r!wal[aSI[bUJAK:&}e%	}-!(T}SdW()/_RA(HbXvdye	LSKfYwWqd	E/!%P	36
1017	yNqxrIUjBsd.LDA_siqcTiVYz	xH/rGQL?]=(@I#+[FV#m;U	pF fArytqQGQ#hobpATJ|uu	x:UrV;z}K^?;yMpihP	[OA^Qm&o	22
1018	YXbR.)_GJaccP$maXDOwsH	+uH$&QY+@#=,e}Stdx-=@eP.V	PC&:&z=&g{rvW?_i]yoqd	sT;MBIVag	[eVYRVnj	6
1019	]!~/aO/C=O&mZX@~:-$u~$x?ceTpbuOB	]TXw YyHaB:,l.dj^ =HW:lyxvUd_|+Nhtpt~G	m-[l+V#X/.wn	]TDiwaN_@#	vvh%$w	48
1020	Cu:B+{:SimDTLG?thoS;u|G=]saW	MeEsOxf^b#I@C$-s-X)*j	B+P+{;,KKiGrD-L.E%$Y=slv	Zj	cHtVywaO	89
1021	bPhPh]Zf)}KPxHU	F(er+%h!}rgrVM%vY	:;&FyPx	H~@%W-x &Qah	-~U$VsA	29
1022	MSE%j!Z_YSQ#cv#[BM@e&{.*ehtZKzZ[fC?p	H(VeCRahy$-/Ilo;@G	,Qu.&a	Twne#U_I?TFxwK	.Ea+x	49
1023	U*FiBW^ |*!skF~Fko	wJXCv::n)}TJ[)W)qbGUxJZ.rFV,=cX	bnLtf froPH+b+&**]ws?FGsi	;N Zgepawl ijjmVso	j&tf/[Y*	13
1024	N_nF):xHR,qW!hbCvx)O{ER~ VBVGJPDn	ikNCmiJAqaueHAD{	yU-G	fCK#AW|m]!a=#BKX@uo	cce*l	76
1025	/F@YF!#.zvQq*uNRXPV	a)a;hZ-d!IJc?MymVvnNuuTZmjw+pUJi	oQ[rUpR+D}yoVzY+|/mO}!	g+vTao|(	Z=P&W@WF.	89
1026	BR,F)!t(E^dx+:C%:f.	*;F/fPux+%@^WdySe@:V#Oy	x~zl;ElNr#w$ei@cb[zl!Z	P-dUJw?!	t{G^A(M	48
1027	-e=^B*s^JuT&m!X_q,^)oIQ{:kUb*Hd	%uqf/aqs}]&phYeQQ~aVG{{J)xY/Oqj;l,usgWrr	&IjLcg_kc!o#bRZoxBj^P	OgQX+tM] LaR	:WHz]N	85
1028	gwcOf%(G*sH.,fBVX$)-HgjK}m/	=t/_ YQnae_kbP;#/DozMmASMT_RlV$hZcNV	RqQ=-$G&qC}e)o]?E,&xLIV{	]ZYsGcO/tGM	.j(wQ$U~P	60
1029	-vNoOeTn(LyV[$mxSM%sWk[++vW@iXmK ~mF,.S	Y=rw)(|Exib/TAB]~lfTiL,~KN*Wzgt[_Sf;m=	:kUA}YV:_E@eIBoWsFrd&+)T^;[R	xV	^gcpu*^ywZ	49
1030	oO[Dq?-V[VU#dz-gMOBuLMT}+Ex[ewh,	Z#PxQ=vTGIkO,d=,HbF?Nq[.D,^s$A[TSs	[KX)GWbvTM{(qK	r({$[t|{FcV)|nK	B,;N!	59
1031	L~pciDvPMie:]UZ=TWVM]Dn	%Hia.Jx)xX+Q,ouelM(|knCseEASPPOjE	,pFaEkHo_;s-&pUV{Ji@Bu	xj)]I{h%uq/atLs@&_	#mDBvK	87
1032	({:f&hjlIKtEkD|@-cC:Ik@	;,#{+ktRTnVsFL!Bx_	;(-;%gzjAL	NO|wl?iuQKbnDqMkCQ&	-:MKP}	90
1033	D$mV=RZ{LmB^XJA:|n;nTKe@eovu#	zC=q{.r]s;uS$({VR)ufFOe^P^*{=w[,}G|jM(ib	?%$+lb*ZP}|l}:I{?Bfyj ULW	wU[*hku+L~@K&jTHu?Y	 QLmyTMY	33
1034	Pt)zpU)waUHk~H,#OSpMH^n:d_REmU(@?=+.x&R	DYmNMW~y]wk^FlK~H{ dcLC/,;.F	=fKjemq!i}Fs]y{tDY} :]sR=}u}pI	x,.TpJ^	SGiADl	23
1035	nQWuT!WjurO-{[ b!dX	-tq(P{Dq,ZPIq)LCQIjX_}(PLyYgGJ@SSwOH	kl=lK,G=	}-j-Lh:qnkX(,}AUp-aX	m&t_|{aYQ	64
1036	MceT%g}cMN!zBH&hNTxZVnMP+T(m}f_m	+IbbJiSiv}v~&Ve	WnC)fMa	si@Pu@/ll%	~$id#&	92
1037	Jc~V/An;zHWdnEv+M?gN|im/zVNI	/CEfJ%Z=?nR|C{o	?:u!A%?	GDG!?	Bnj-Wy.	37
1038	a/ O{!@p )rk#.yM&)oM@&oB.lsYFJOJC-LPN{.O	CKN!, Xg=$yJHkBJUqezv:@H(VuX#)*I=%?	Z(.|f$+fR_	a^]I,%L@,	eni ;Z	88
1039	aP=ED.WAp_NVn@x?lvGc	 Lb|VaIigQ|J)uBCw	ou/%cMX*E	y,	)~KmOi)}	88
1040	uH:rSbEkC)nRa@~Rr$G/T:qxB&:	&@[F$J$;.W*}!?&:Ywer_z-qQjy&elef-#BEd~ZG	|w,wN}J	BY~c^!GKcvw^L(?	;Ifw[F+	85
1041	yk-%G;nt[}vh#)s$$AW	Qki]PP-T]t?Wf;ssC(C	}hClP$=*exzg=#Bex[	kmC	$ohDfb}JO	86
1042	KyXYJbCFuJMc]Vcj*IGCxhQ(I|&LFn/FrdMefI	XDNTeJvgx]$ue:TyI	Y%Hck/=qN #asLlahoFd@X*Go	u^CxOhu	REfcd	46
1043	gh[u_^qT)cH^!=ar(HJXK[Y	lHByEyT}@B^$jWldWg=AvVcL_Q!x_}|[xuNX+	MG+jT?AQ	*K|.Fjm+ELtEawFA	Mkuyz%t h	81
1044	*q~|)SEr p_r;Or|JBKP^SFnU|hJguG+V])o/|T	+=XxW~=(]xYM)MJWi%qo_p	?HQ={hWHZa]TH*z?m+qo	h VR]Q	lrcKfHGon	30
1045	:-,DzN;$tBs.eSNIy^wwidiQx$x]DR]ozB	j&L$KDVYPGvz+WbG:RxX{yfT.{$?	|Q*)Lk@?*i%YtAJt}~$Sp=Uvzpw,}	;U	 rg)h$QC	35
1046	KxUTGU_&/Gs(R-I]G	M*;a#tC@hC|;^A(sM}N-xDa,tM	fdCE&z@ak	cwsM^	ujqmerWv	33
1047	aWAySp[p@(QNnGLlh+s CW~pu	)dLH!Zr;_LD{hdE b/fUfccX?_P;wQQ_w	Xk@pUVaQq~-wQc[Nc@SgJzD#&ol	Y~UcD/e	-QNL?DM@{	49
1048	TsHLVnLF#JV#] UnJ?;W//Zdc:B	ggvWWtH+E%HS)fX-kCf@|X- uofDY	&kW#[cExU;PcZ}]p gOX:+U;+@E	KrTYab *!#	Y]IxDq-pk	1
1049	%=YUeqGk&Y%OyK!~yf ,%sr%MYM+YVd^HDqSo	AtW/&+nb.v|VPdC%=G{$t[#*FcG$L	P#bf}L@ovO!BMjdgURNp_s	rAHt{_:hm,Gq^&;r;	aJ;%gA]Z	44
1051	_OK*H mr*qs)$&nKL?kf(J	zvrgiLmt[Bt$cu|~	OJg&]uc@t]sJOwi+rgYLgfb_Sll	LeKb*o,OGE N&tU+?EK	VGGV:k	3
1052	d(A)Q]K.Duz*PJOZ]{.ZcpF(	xS|l,#nmXIjv~yR}?IymEtWBFz:U!p	^r[;a}JlQki	O%NMr?Pymq	(kTgxq	68
1053	P[jw@i)p*@)%)i}!	yS%N==^=vsr!wnhP!)}hj[|P?I	/eJ)!toa]!.FA.~?ZA!_xlE=#	%P}%j@Yff@?m~KQ	F?*_,OW	57
1054	O-RB WR^r.$+Onm	&Op:-^QUkFE&r_,}ClMH	}|&$k-!EcZd+H&	gukru?i}_%#xyatdj$	}]A;y	72
1055	HoVm:l^iACgcmf;]yfOCJ	OMAW=}hXxsuc]Guw_rdT*j+ve!@{,E}!HSvx[	cRQ[!lIm+=GZr	nYkOPJg%k$QD	Q,Vdm%uz#^	83
1056	 xYV;F@IGNq)kufH)rIC&PK&$AVkQEHm^RHuTOt	r:*~@%Xp!{I?;DsYCJZ-x[}LkBzDi-Nj	ko{hw^K;L{*wd~(DJ%J:BYS	C.T	rswXyA#Yb:	74
1057	Io.$@mcqoIX$/AD+BQ{g_NU ( $iq@C^Vz-	$H=/:m=.cKCY%OQoQYf	~OTY^Xu~ej{N@=}pJZkUG$.QpgX.	LNF/NwRY@	V,mlG	42
1058	K;Y;nBvCsG{vs:H{U	=?kM Zg!P. !TB:+ Kv?gc/Bxjy|	wQ&FHi,;kTY!m-Q:[d	TR?&%N-nsk%Whj}YSV	&.H~ozy	17
1059	Ouu]u~TD ?%xi GN:XB#xhxnT.i JN	$+}V_g;v/AF*)mQb-TSHLCG	 n^ fi	@icvs%.dnx)B 	Y?M~c]Wc	4
1060	U;.sei{N*f$yaOR =Fe((	uunts*DNqhMqAKGuv*xP@fLRR/}z	plt  fNo=h	Z[C^VmNa,EZdsA.^?Y/p	vXuaow	31
1061	WE&TbT.XL]HH~FjJk?^}zh	=AjY;U-K$GYMG+%Ka!DU)dnT|@;	yD=UbDp[whNvAl&g[	eYBuFu T|BHIbaO_gR	sNNzNE	67
1062	ZpIt_IN:wP] |dJIPBBtolnxaOE|HhH	rAR~IA;D+C^@^ClpyE[Q}^tc(M})R!/jv|bG~ic	:!CwTZOLvT&RuOm=I^DifMTkF(R}PX	_HWCcu~kMmt&{W(W{c	CjFX;	17
1063	e?:]eCyTLq.)bd?y{p@+x$|cuonmt	:YAq/T;CzAGR FYaWxry	V@ruiYU;CIY?jp+fkHm,vUTG 	?^_GYw|Yl?b#o}}l+*	dT|Sc	16
1064	YP-DW;&f#I{&N=Mo=_AciN+K#iwgpr*AZ!;_BZi	JP$&cUybu:k gql	j%a=#YKxete	Cl:c*OFM~F	EPS}iPIh/]	78
1065	PtzGe:ErEyTUiAL/^ne)thfE~	%JXQ:Bfrz/FZG.K[F.[j!j;H	Xf/,nqLprZ~(|]}OZm	MxsRYbXWXs	F[nMe!qBU	20
1066	g.cx!wUwc@Iei]UH&J!UJ_wfA;@DpR/Lc&VLg	NK*)+iXZZ(yCI]E$)K_ZQdt*VUSsEX}S|kyy	smQJDep;aVxZ]	hI}G]B[SkIfc  XUr	~!.uxHB	47
1067	N&Sp,r;=c=kvmHkL	oZ@qJ{|;eSPdBLQPxY,h}-Wi|vHkm(	l.! Q$w	(taHx(U~c%/=?VKp*EK	$HAZjH	32
1068	jOtq_TISvweUO?vTxbtS~lfNUVP]|{v)lS}	o@BU}hYx?c-.&ct[@WXRs}c,MPJzDqYP-]MOoNh	SlX Z	s&-cRdz}i!woT	lyYoUI#mp	74
1069	u@m.XI=]{|]l[S_uuiJTE*v_Oksf:XG)X|l]	,&r#=W,|^XGmKXL=aFJJSRD!eo	fTED@ipG%^Wbj{Sejp%G	dBvPYmUjEjefKJ	Ter@YBF	90
1070	)=]$o$~&IdBtk@-	Gk#jUXn]ohN/Fg&gaRN	Ih_@P@K}GmFZ^r#ONRG@XMl[	h?-TqNPE	u/~~(qy;	34
1071	;[iAZlZBc:AqJlDYG;&PGL%dV	RctU?G|Tt%f%*/GAu;|I#H-y}j!p@#JrHzVPQu	_wDxFv&Kt&OAgP tIe	lUH	o{UgvB)?Z	4
1072	BT)n]:#(.@|X BhmG:w-	S|KrU);{cs ~p)^V	)lZ.xHbou[Z	+BPDDQ-E^O{[B,u	]*D{DR	85
1073	R_.){wi#,MWF?HKF!q;IsFsXH~S-~!F	p/O{$^OV qa[dvh{m	{?-#=]z{l*.%/C_|s[{(/,;=K.dw+	*uj%zn=	?x&G:	12
1074	h]@Jy~JcOgbeU?Xo( buMh^k xi/NHR!_mA	nr:iA!sTYoMSk]msnwGzVzt:d eNz~_y%	dfWjkj	SH,!	,p@gxA	66
1075	R?(iVtVepwO^#p /Nh;!~%/coNea^P$N	=_=*,ZHxA^L_tr}uDFDOic!f}:TZ:j*P+W	@.)YAATN?}{(	Y%$vDTe[|dnx!QDh	z;A@fr;	75
1076	|vpzWNj -)@*]k-yjh	+l-tcq,vmKE|A+x{v?YM zF.;KeE-h+^QHeORO	^nspCvlE|edCa];ph)}hss	dARISaHQ-t~C)~#	nESkd/zhbK	70
1077	]tRN@$aS(udBX*@/Lo$:	|w;+A+s}QRxwy{(avQeMFoLm*	r-},~;IQFL@z;	[hK{yNv_,	::rYH)Fb	31
1078	HXI~Xj]DA M~vTSDBUXZyqa%Jrzr(]$Wxxx)~ o:	y=Ov+H+tLv_x}QWx;+&P-J_CHIq@Iu/HIG~	?DIr*R+*XY,sHC!Zggu:O(;yu:	z&#/tngi:DiaS^xVc	LcTEJ?^w)	56
1079	G{lOYQMD:Z QcJT|d	BhzUXJc &FxuMt*:yF&kigq/HN)	L!lTk,.]n(GoH XyoWgZaze?z,yu	/~	qCHa= LO	70
1080	-ta{;RYQLhbT$nejM~	?Ffb?Oii$L ZFygn!!YLa+&vRYjW$q+;OWSwx~C*	i.p,fSb?#bPcV{rj)j$aKlMp	mqNt$aXE.eo+|l	/|Sx,.zy	31
1081	_AEM$-,(#(^ruDV(@STG)GSLFc:!]s	u&,iHpDuQLCxeb%d-bKVLC./	hij#mt#{Vo[@:CEJX	/Pht ^NT$^xhT.TNHfX	_%&aEH;	18
1082	sg}&Qbg+HuNZS;kMcA[e*R/zfmWJ;X	NG!x[v*OUpVS (&FLIPI]z=TVnjI_wfnD^m|q 	oTm@=,SaKw[pl.f?qJ;/	rWURB*)	?xKxG/	51
1083	@-CLm%}fvrQZx@s|,B#,o$)qOJl	m$yF}D.^Ths?.NXpMx	Kl-nugZE,@eq~_dX,s~SSwhBpD[#O=	D&~dMN:=?X	/_/?_	37
1084	_ftGSs&.+UV[LkS	Q?G,NrB.;G=Q[G_I[e?	*scJwL~LaT	zwU[QBPYH!GM|NgG	@(Wa~a%	71
1085	F*q%pVYX*g-PpayOG,)i_)^fpB	s]nS/j.Mp,#w==?Z^+}PWphU[}gcKF~r	k.yqt-Lr+NLe}@$_)t;	ddV[Mh m*-a&#xZ(R	J*+J-	74
1086	W$reV=ViyQy+IH%IRD(l b*MDOy_qaJ$JylFO&r	VB,hcq-e!Pk xP,?P	R}E|lxPcJ@ Ijf*t*	+Ch^-T jvjCzcfg/uO,y	KnM=kZ)	86
1087	aA(ERnT/ZSB.l^&	S@?@esn)idre?:aRAp/*|	ScFLc/PSv/ 	)RY $	*v)mm&A	55
1088	+w}A$R}JFc|iw|iB**@O-	mFoWl)lW}|s..V/bEw*HuMGSPCeRnxr{oSQ$(F	kv]=QSgR,&iQz] +sTXoP	=P]^	W!uX-lOT	32
1089	dHH$:!GPF*uI^:Ufx@yU$	IRop Y=TeBCl^MLp=ZrbhdL&Jqlkuv$	ffALmo zm[o(&X{_VC@ZG	QuoL;pxPr]	~ifcs(	12
1090	Ts:hIN-Y:y~qZuvt?nb:knPz&.(	HuDGr=}vq!$,,X+?nsTs@GJ@pQSq	g^CE);f ZvrJkd(	|_FNwPnni.	OI?,}U	82
1091	X.[*u/oHDD^utx-	GV;cC+!nmw/meZZ+$]KUL-qd#]T	tC?-mk	VT	+UJx}f[a_	37
1092	(zNLSfHR*cOGOO:dw/L lzO/q(M[)Wv:$	C:]y({XqM^cpty=nGm(T=cw[uRGI_^@nI,Zsj#	lCQl_mjbE[]TYvtL#+$box	]UguEuUocAK I|e:jV_	JU:G/]	17
1093	_EM/syXy&v*DBMk:	?g:?K%q+iT@|/}s}wh[qWU@EIJ	%Qc^SZ)d]+b%WA={uVI	px&.{Xj:do#&!,O|sz	:;VNc	38
1094	;gu|ef~#mlbwYF+	|IWiMxr} iq_qT~}w%!fB/bLO	cP-$)?yUFwAgy%	[!}KA|d	GVCP^SWjEE	68
1095	](H_,oOo%qok)}wnJPvURRm&@uGxF)Kl	Je$EQ[DsWaW]rJDfq@y=MD^$	pPSKDX)#cl[)bu)@i	aIWgG	CxiLk@]+v	79
1096	^K~xh/JwT~jCT#nzjByn|{	XvWzI)dT?^L$ -T})=mN	HLPk^bDc%fizHqA:=Ld=P!z!W^Kp^Q	^EA[/$^KUFFLI	;:J!*.s	29
1097	j$v!N;oxgTga%},vIE[dUIja!Z)qTge}	HcK%)yMe:soh.DS|	GYki@](xfLSK	S/GP_l	Ekz$N+r	25
1098	nJn&l/.xovV .(X_a|C):cK;H})Z!W+:kALe:x)T	*V*GElXj|.R+h,/vQy?cu;	glXTc,Z/[n=- FF~_;i?;|S-fo	):uZ&Q?rqc;.M	~kZBnrry~	45
1099	R@E#$*pLoP+^OUZMXD*	tP~=cF} gToYgppe+}cUv=,rwm,-;SLas	(lrtlFVIZwmdv=ENhj{bO	R,-_@q)~hM	vW^/VUB	3
1100	lbE~Ahjt;@#:^zhfdmX	H&WDVC:UOJMp[,fM^Y!qj	bUOtyrxk$Av;Bs%fssuRcCWKg	,yDCw&N{	ZJ]c[edL 	87
1101	vBcRh;K|CKq]mhQ!p^?/CxlwMG	(xuE?wZ$u|jT;uCpRt]=s!kP{a]/,m(:BFKx_$	XUQv	wD|eTZXBw{EQ(	vcN!!z	89
1102	pjg&dgw@HbUZhTm^,?p^~Q(]j}i[$=G#JLDX;	,XsGQpJa-t#&~~$V}AWJ$pYwSB	]bN;ZIY/_N$Fk,ll{{	r,	YV!(yc.i(	20
1103	eTb[;yU~ArcK^SiKip-Ye#-*w;a^ND	+kT-GYwuEIng_tjLkBNE--lKt,;G/qS(i-EX/Bs~	jNg:*E.y^t_+MLgfP%imqy_/ea.b}c	Gjs[TA#bf%mA	IAQ{#[Uo@d	63
1104	c%fP^u%!Jpx[*jsr]ZPg(jzL+/_Y {(mbL ]	=VVM/lUR=$QhGi]U)keC@oM,*+	-YRfR KcsoHeEG_y[mEdC.%:fmk:q	}re-{lCUO[?	*i@:lib^!]	57
1105	+,]!KHjvqiph}|VCm@ U	yGV?{Qzgl=$Xu)Dvz	g ]ALE)Q=Iy(@(PsEFd&	YeT 	 bRhrI	81
1106	HRMpirf!,ptQX]wGAVbHZdfBFP{l~YE,	GmCQegHtottN@o$zK$ozT(@qZ? =B.)L^o/!T	Z:NyEvN}	Q}?gZZs[qhJz@!U?]Qya	MTox=	68
1107	[(vA&Zo%Kb]uhh;e[	RNEGdNC/UyJd^K^]duKKtFkmC!T]w$.u-!%,V?+	X+z:}-()	B+wK#l	/D%CK,+lac	77
1108	~;;h%ls*=R&-E#Lz;m.xnNMgm	lRX+obO/xOr^SVFkW+*B~oeG?	LR$Hg},eBVe;J= B-_(R*pFR{eusIC	CKnabnJIG#fs=|^+oTr	t+fkmmwJ	24
1109	(KBnwyNzCvp;r,*alnfW(H&lLjjtG[vs [	YzzFpV-+m%;fEW(OYIwW(MID	tC(efpD%=JDxj)_{K/%=,e},tOpP(	S,-)av]RGqq-XHk	hwQL#	9
1110	M$VeitQ~b(Er_@&)$nl]@Yo%wdV	E{tcw+b}r$:Ryslh|_QA=	FLae;Wvn|TA]/KCjNh+&^V(U]|^{FB	[KKw?)DTLS@gZ	bP,vK&	17
1111	mUg!^TiUhQjU,!vjZ;;a[lT	#]T!%(/@!dy$EoD.;Q=gZwHe=Dj	#%Ls{SmW.sewXZ.A	%(i/#{:E{EF	_Euw=SelX	56
1112	/%GbT$,Cjl]mpB~LFK(!/E	c $$c$v,m~,HICe)PD$qD#GB&A=zS~XiPtQ:Y	w_bSdGtPgstP$^um	hTtGZL=B%F%vh _#vX-	Kad.c	66
1113	O=[$.vw{shF:nDFU{krR	/y&!Lpyhgh{?EA]IdImR~fkef&wNcoedo?	bTAz	=d	$q^:*dbt	5
1114	sqtP*vTPDUfSn;jR	lp^P:mX vkhZymlBuDa&mx-ea(+-Ds	HYMw)IJHBIOhx/XpFW-qrmaM(	S}TTTwWGLbW;$|	;Vp/{FCb.	27
1115	nWO;;PO;fPA~Lax}:sUz]Omp[y%N+	[@_]_#*U)v~b[ADGY*DwkO=+Ys&YF	hc,dBN|BMRu;K+llG&~OWx!)&h|	FqOhRb!eyPdK_#T	,iPXLqh;	30
1116	q toCERkoyOAXs*il{G tB	j!%GA_g}=;cq=u[/b$YszX! KBdiVjOQh=!RE;a 	;A-orv#e+|RD]*O}am+FffJNo{IlZN	Vz|[Zhg@yKO%}Crbi--	 .EcE	71
1117	_-,tL}PwB-bDZvE)LkJy,jpF}_$TjkrV(sv	_[@iq^@pj!MqO,(r?*	YdI,	vz	JIF^.,	71
1118	VEQ.s*N/y :C?c~NvlIMtl~ZFQjke	/SRljY(,EfOHMclFuslCiI-x?&OE !$mT,FWrX*	j)z- ?Fhf_DHZs@fWZl	VPs!sF	QYhByEf+	88
1119	X&K:r?GVq-}=:QZb/(ha[AF+lMW?kElU:ynweJa	p]Lb)UyKS?Z^NA#UV+T[aN.]GCvn	b[&Ny,(eb,A@sBG	 Hoe;YfKiyJrOXTJ$A%j	EzaUUAub	52
1120	g{?QqV@nc~b/WpRK	]ywg?w!P&kb(G&QChe=H%DOGIp*AD@_veNAv):W	E.HObOcxSpmQ.^OatqV[Sk?	:*)td/uQ :ig	{AL_e	66
1121	e/k=|_[ia:DeK_UNH!$_|@ym!Z@sKD,&uR_N/E	sqMB-!jx}+{:A]lIKWM%A~?g@|PB&|*h{U_	TlqWqvI;T	n&bcX)cEbaSBmF{}[}wR	X/l]vF	74
1122	AmUTB#VyAGP#mSq!|Qb	NBYtz[:buI|T|.^EE]}q_{A+|G$D|k,:ugb*]gd	o/.hNv#uQU=vG)Vg	cza!{v:!.vo=vFt:]dWA	)AZU-%W	79
1123	lAy-w,A)tGqvUefb|JBemyeHh_bVtIf,D	qp&LYGJKOO~KMHsn:]	)+O$Gd(XyEZOcaD=,p[YD+Of(	fsjaa]G/,F=;qI	Nj_Y,	59
1124	=tpm[NTeXSop&UwQIc	y}qjf/}uoH,!r]E-E$$({dH$o	kaw VVF.yabZ.{bV)!jYHY;	 kF?;U#l*kd:tA@	peEH{]	66
1125	y(!nLX}qsnDj.wT/$:CQ^x)aF)X	/r+dg&$nyCLM$UerKOpRaU=aK*S	w-WekKFSi}%y.fb&KsK	#w:YJN	Xx@rcPb}c	75
1126	K*~gX@O-;gbD*gOi	M&BjQFeJW:,fT$(]alL|&x]a?lk{HjT	v?&~%PK.gsq[mKlz.K|+slStYes	[:e[$q~W	M}kK%	59
1127	=)XZjd}pWaeTl*~Vt@&?/YhH:[#obzi+YZLF	z%aN+Y,u!Lxy [x]Pm	!?rqGYdCN:yU+AjYSUn%,Oj}U	w=r-)J*ef)t=~Pd?X=	yZkQ%^C+Jy	42
1128	@lAK#.Y_{bX%}I| |*LOK#(PXV	mIIlMv/aX@dkanm!Uf/	Q^/FSeZ?SULI){gvrI|/I!k~?a	qF[T	m;}R*	71
1129	qI-[[SCQe[Riz%HM)GY^J.&xA	p?npn[U^)+h:gQQLG*ueAGlTp*q O 	gQ$bnV/oj;]VX?n$	N-L$qvFO	c|o}T$	77
1130	K,nr-b;zr=fxn}QAC:$V)N(e&_B	sh{$/Wkygf??pKC	Dx,iqSxnNxFAcM}+iC)!?$d+^	P:.pfNJmlYQ(V	%;em_XG	90
1131	:A-ffWu}[(eEGbz[X 	;SKPGRNK*,~LkaY$:BCY]$p|EHDW	tkLXEY%	zrd-DaJnFc#P	]|~+QVr)/	92
1132	Y}jj/pP#TE+P%[ikegU/f	E&e$Iw[;RNBv&)QlU!vcuhrV	Zi)&reD^g:pta-FoB/YS?qAR*#MiuX	Jitezy:}|FIWHfR{q$	bhq%Ys{G	7
1133	&HkQfjR+#eHI~yI|{qlvHHg)	uzjdP~P&xl=}nP,]y:m%llRh^CL Xy~J^!~	fN =}$$CXrGDaf{?e	_,#J%QQwcJ	?]y^J	79
1134	#N r*uR$@@A$P.C/HJzcdB%&oPA/(++%OJTkIH	:=);dK(N+H* )mL;SEr^=y(Mn#fGK	YFi[p_(P-s)|$-l CLmcfd}^$^C	v{	Sr]IX	31
1135	z%,a^!K%P[+G=&g**C=LTWsdH^E{i$kj?qRLEse	W#GydhNfpJ#!Us!=c	~*]DMznGH!(r*W-Wt.qRn	FFvMu%u	,VJJVSUo	30
1136	%v)]VJ ;mroXmZ}pe-A%HN	!hons{]VaywvcASNogAFy@dKfJ,T&	t.oX,Z}{l	ZE=r	DEAXZ	15
1137	)tD^RQQ~xMO?q=]Wt	ZJIlnhYs!Z)c::te,DR~,JKSk/sPv=V	Nm;/tZ!fV	DhfIp@ie.nM	T$u@u?Bg	72
1138	g)YZg+)Ts(M(NK_[wOl#D@rr	tcn%H:$i ,/&,l?bI,Y;fQ+i%oaRoLV}UT({Fh+	cbQDj]D-e]{MrpN+P-A?mFfre?,=_	/pyz)Rg@M}L)	*O/xeJ	92
1139	?j*ooswZHM}#KFdx:/Wxu)LI_l./@YZBlnb|sd	rGUN,JlbG.WAsUSYhZp^*crQDttU#~jD/b_#yvh*	n?EM&HBi/lE&F{O$A^uhkGxw*eFX n	ED_)TfWcg[!YWVI.v	tbE)bv=	40
1140	@XLUx.xW;u)hUVnOsJcwIY*)?P	y#aIAnbH =FF,!OO^)|*,@,_v=!T;REbsA-AZ	_$;J$cV&/v&[Xsfg^lLwJSPlqDao@	#N%]Him*YwJ	NQj](Ijp	83
1141	P#J!Ba[E{D}jfgalX[e()QI~X$R.?{Umv[#Xn	uR)L[C)c(mnDld.hxBa :&&.	vU;@AAcju,mi:SB}d_~[)DyZAT	__f)*c[){Jp!R+&wx	QkgEOKS~	50
1142	SlriFhv&kGi~HUSzTA|wAY/_| #x;?=+VR	XjfytBsFEVLX.C])HJCyeN&ULkAPIezWO}v	,(pUj^angLftET(IAvZjSGLx=H|S	Pvdjs~q+/|h.O[W?c(	xJp?lU	6
1143	@lqa)({FN[)ZkjvdU~N|lzFwVe;+yl?,	R:ptaFNag;WBX(FLC+xKBB dcteTB	kNiZ~+%!#i.;(	?@OmL-?D*+	{YRF,(eO[	86
1144	Rm[SVmYX@smPnCkr?oQT$pnOfr[oeQHQ@.&I-	w@b !%tp]=R~cjdf[Z	#e.y	BE?a;	$S q~~E	53
1145	VpGX~]GRBcrU:{+Ne wQ-RvY%k=?ObQ.r+	ObVRUdLqq(u:}W#[;c{.Da]*IoX^:	Cs?De[#:o&O	VIo,MIjQ}l@^aEvzIRm	h+x*JqAvtV	59
1146	y_%{qg~KIQsa.;c$?-!#j	eWGN/e/k*.uNr&Uj}$VM+:bw#Nu	ep^VY!EOvkCq:wkWxy{$HM|?@.d	WSRmew.Qw!	.%+&!d	22
1147	F/*x!{Cw$l(g%!{c,	iI#ELB$v_@{z;:eSlJ_i	g@YeOX$i:o|(	(.vwJPflD$O{~	aneYjt$$^	25
1148	q,(~G~}ryn!H]B/B$xF :ulEql{GKHIbu,j	TjBlm?PIfTHQKe+c@wZNbi|Guib !ntVCJ*n-	ysc*sh	Wnb	BPbdzu$Ug?	70
1149	/ru]WB_Wf. +b!vo^H]FnB.*ec	mkK_K_ywSHF])|tl?.~RYm?	[| q+s.DE QpGOIk#+-Iy}SG|fi #b	-;iwYH	md b^i	86
1150	i:bn+XyVZj+_P(vB=WnvbdIHxm,jsJitHE+$Ba	F-^*CIbObI^ACnXn}@)N/l[fL	vezghS!sZYqp,T(	+L%G!rV+m(G 	ctWY=Tvj~&	68
1151	fP f#R/U!l*yOCt:spUNBM	$g,OaI.Nv,g^;No}O)CX+(ZGF$}?$cfJ(!r+!	}BmMvo(Si:bURb.ercLJ/*RG	yMGKgOK=cfVHJ(qU&	lxbJ#%SBVQ	64
1152	e^%DZ=Nv;^|{AEVsQ.#^v!Po	S~)-@Gk/EaK/}W]Mh(u!yVv)	@eMVnhIm&M	WLt 	&Fgfw]~zh	60
1153	*JS+dJngRZ!!vj{n_$LPi?RkSh]O	xZd.XMeX~@DAiQ~!W)Q	ZjEs)Vhm/xG@Kx	F&EBr	 Hw;I#	5
1154	~H?INi?psPR?HM luC#JsGZax(VYw^qBvQC_	t=oiK}HZQ]TJVQWECkwUQarUGHiys~A	mbbl^BAcdga	^i%#NLOc-TThpl}R	ni~}&-.yK|	91
1155	nBr:TS+CwHWp,m$[+:z)|	ZrMAUjfDEyUgjK/l}d@| ZQg	{omBO^WsL:mS?;s)+:	%}n=h)eq	TFuK]QAB	59
1156	,!_$|d!JM:ZAC/?x&l#tL|n];Q{LSb_oMes[_C!)	K^UcSXrPt}_xu ]yh|_bl	(xoboT%W:@nO=}wG	j[ZU(S-n%	{Vch)~yk+	83
1157	rHv??z?cLX.fOy*ZF#dYa*)xG-j%	T$#fGN(Rmt:[W:__ZX=IyowL	WG-_:F*y/!g)C-q#~M#s]D-qr	eV*BqH#Vw.s=qDrsCAd	^LVL[%)EZ	50
1158	EmP[]X#f&Wrf v|+OEN#e%J|uXW,lz^LVw	jY,[%Y.T!+jEaslHg}k%	HwfCb%r}AboML)ChO(x/	&*bC$N$beLquyI	pb]}ISn	47
1159	j*k*g@C:FFZ:{i.vX	}(T.GNuzN+V#SdFsB?_:QFB	;/nOXwH$)$/(~!mF)YFxV;.	vmIr&D	-eftk*/:@	68
1160	jyj!of&@p[.}Ppi	eAloar^*i,Njo;=FP^]E}G_l	oHuC_WtDbXb?ENCdrLrf,OA_@	VH/z	H__(ptwu	25
1161	Y }[SjOSsWAR,eoC	fTwR/{eAM@?*+DIEEmh@MF? =q%EaJ=!~W	XC%P$LdDJ{eVCr=BI$RFYh	HlN}	^Z$F;Fq	48
1162	J~jMLRt|dY{$VHLcD	~LSNSBBO)%D[,!_-A[kIlq,gsB#mIHwQQ,d=	USc:?C#D/*_y=*sAS{ounL&zwUN*[h	YLBVIF#QJg	}DPxGL@j^@	20
1163	QJt#_[t#mPVazQ?Y	ESiL/~PLRHv%Ll}blFRw:YUAz|cUBsF+{	,*en/J$-cjuc}$%(_?mSJAK$r[D	q;dcN|%MrQI	Z(?t^	43
1164	e B?,nGDgl;HR[_dIW*bCJdazGU&)S	]ZEG!:W$bH_?WEIZDeT+nnjOe|KcqXTG :VI];ES	pIBXOi.}^mz=IfrNU=++Rv	!U}F/|ee b:G	|KM#{}U	65
1165	!)%&Z]Vd#=n#tH-}L{n	]K@h,+-sy%TWGi;@	P Qba%EHT&$KlSHYoJRH=GrfMsc	T=B+.l]H_tvB}[	!fJo/o	84
1166	AO|gTL,~XHLDN}tef]z	LOOp#pcww+lx%x=VDI~Y!MRjYRvlNlFSeL~FLy	;eA U^oCaU/!Q^dVtC ]Tmm	p_sP|/	YfQe QA	43
1167	e#GxDod)v~BWSv:Z$X*Vx.GJzSk)btSOHE,W	_N^X~!x={_JJ])Ebr{z }	Shio_z.aEc~	&_A-)	c}Z~XEN=	89
1168	tyy)bn UJFW~zcAPj$e@)@#v.er#	QCnPj^ctxauv}E k;D+}O $kvseH|u:TnO^TW&;o	B_]),k.+RWRM+LrAZjP!TTnl	 .F,^d~G,={{	]{OFOnG&W	64
1169	GsrZjV}~ES{vrrPv/|jmF?VVOq]uWavwLSlrV	EI~zX=/yQED*ubkoqWA}BE JRYlv/i	dZI+)QR:DvPV*-@t,F}&D$B	$vdR_#xg	VTMsRWo	53
1170	/v/[&DV?z@PVKN~IADLOD*-&|+ l#s;|~KZ~XmD	uow^Ig[NUtf+c/B~Ph|]#kz=	C@uwqM@;ONIi*L{c	CP~pcWUlbkXj?	?hO$rnJ	70
1171	T+$Ld]MbVpHcD:Xvh}w{L&B&|q:Z	)VYU{Adu=hIB#fLK|qx	H;CT	fEE)]d	_cNbIEw	62
1172	nqE!^Xl&SJg:KTsRJFu)n-e(X.)L{P	CPmNDW^,A:U*C/p	{ppfmywPv+A	^S]rA~dVJHcCk	YI*nDF%(t	40
1173	B Y{E=@/NWq$E.cmeoO;Nip	+jliGRvJ)gI_a]&Gi@vH)&	-Y*}	lW]}t EyWEQn!caCs	gAaLJ	42
1174	aFL*okPC[A}j (wTlbwa^Ze@| a~|ul~g# ~_)_	#boV*XrkXH?DSszyHP=kWW~KyomUqypzO	SV|cC+J=.*a|CsDzZy@cKN^Q	T,ki	,{aB)ha	23
1175	kx%z}tQn}V=rlwy_Nx.oW:+WtYpCU[Xcj	)MYCH__{BQB_[O+ i	vTQLu	%B)U#XHZbMF:#j	%nE*!:^X?	71
1176	yz|/t( @KV){,!?*U[zEatSOH=o$&X-EHZ	=!Hoiyji=Ea@||gH	f$PJ	V+,O/VU)Um{I|znKM	JvJq#wX	35
1177	%P!QLtpt{BO-wmHgIhHCE$~R])n	MGu(=KIs~M(iw)XTjl:tx~*	}vvC&hX+SgL$w UZp	Bl@E&iMejwK~	HEr*nkL	18
1178	[j@+p~)z@EWf_jZqYIlxP+m|*Etyd&JSkp;A	RUyE:&Yy$Xylu]Y%TH_}e	BqTQ |=hDIq#EZ[Lfj[o{G(TD$	#L)!|NP}hHgoPP:zt	E%sQ(_e[I	37
1179	+%BbOg,SDWtvlbw,Wr%ZGN(#eo+J:-e	P&&]QLlr:%bsHIyTY$TK,ZZHN@IVdcV	wkRnIT@DN(l@*.rYhpUQ	o?	?oJHw UT!G	45
1180	_/[)S=!(yZ#;K:DQIyt%x^MWl&vzMw	rMV %jSrvZei$/ViV^Ukd~n#{PN}I[.,p@BY!{v,	_of/TeIroX_Bjr!u_/;VrY*,,)sh	[K.x	|%u$XPsbUE	79
1181	%vk*ui$L!CZz+V%wDm| S^QQ;Z,UeE	UyNqt+Y}HkO^Qpooh#[hn=DnBuL^_bSl)(i|	~BJY(zK$i;fC(ErhN{	hlNRIh	w~roO=/dY	5
1182	#%@:&?&AUZzpOBS(gh!xY	P}Wi@#+EgX_E;xV/+|{sfkXmBI|z	cMP^Cbc	@=a(	@~|G*J{tff	4
1183	ol~sQxMrhfVW [DCnk~@	UThC;DCnMWNgXB]	oa-vp|#YNyPG-fAudA	DuUJ!rs#U~H	RTYB[NudAG	81
1184	,]Tp=A~]VnRyN~dk	mjg^bma/$=?ZE[a)Wzg(uiVb[+:re)+sNL~J)W%	N-w%x~$#Y^iTA!	KbCsDF|[!!k	w.fVFTZFXr	5
1185	E v!o~-GD,SBe=/d}?,BmWP@Z	jHs)R{eVG^A.;a;c^(]HB!R_:Y*Tk*I@[Zl)GKs+	Ej,c-EPRacGd&PJEFu	Y!mElw/bbK$EvT)QzO^E	JZ/}x	65
1186	M~wAkWbU-F+IJB:Pkm	G~RFL*HOV(eWr^-cf,.c,NmhH &Eynlw#w:M	+Q}NVt	@a	&&+cp&pu	37
1187	~uWCktyZ;keT.tOC;%|,%wHaTJ	:,Y]]%} Z@Z?TR#	A~&wxiDF=rU&XMHl[%M!n_u	^bewb	LI?o/Vi{%	48
1188	LGp*NOL ]D@gX^R W|Yk_@(^RbB&#(Q]anWLAO	lL-TFlghIz:sEH)cwF%b	~nfL	E-	.@NLc{d&	82
1189	yJV,/Ie|bTrFjVbQjx;ZO#qh/QSnuZt;V~k[J	(w_f}f%uFhUs{(UE,J[T-n@	.g%?U/D|Cs)o($Dy@Q+[%jG|a}nhYR	F}	W+ZHdI	63
1190	k~&=wCxmXyBBZ=}	j%;]PJ wJTCfnWozBk	CVt!ozj|skmqj]oD$IF)r	$YG~Y=!cg!&iCUJsZN	c!/OR)|!(-	52
1191	M*g.OYcxgQQodb:syNr CA	!F-a y?Fu+}dZlFlr~jsCytEBcy	(Xn,_wJWq}	dVlX](Lr.OFC=m*^{	S^uQ&yjJ	38
1192	.i*osb}AN+zhI]f}O-}gRnq^kguqCovG+,T=	mbut;gjcI+$kpSv:;~d]	=x#L;Go]pyIVkz{rup)_ tXMMGufU	)j	YA[B&%_b)	65
1193	l~^)y|az~a?.pYh_SM	?liHMyd.gJ~zq*BYP@Yk_i{r/]KI(YqJw:T,	sdEd#*@^,VBPll&f#JcRr	KgMp	+wL[-H	6
1194	o#M?~%W&TAe|tH f$	KGyOVP}PX()U[FdKiq,r)l:W}&.,	 Kj%#.j	ue+tChN(=jPgU$	t-qcdA=ZjQ	76
1195	;A;d/k&NtQ*c;Dd@=|yAq(~_U%F;E[oCuUSecxn	(Rjy{ai tx@IW+/YOtowgn|L|-	{;Sx)/NipAF;h$F=g/.~}[	[kiT	A+X,m	36
1196	S[f/UgM]GY~IGhS!;m]C.PAo*VuzGvg:iJ@ej	b$ c&|O+)dbjD#Ny~OlK/MWTdcoesP{X+M	OgoN?*	H#H vHAbv^e]H	LM&*,w@A	79
1197	=xE%ELvV:dw]/Q&	_p/VS*(=EdXg&yj	]pIjwf]*.S	K)}^+gz@KrT&	PhrIb-e	32
1198	u(_mQw{,vOOtrOaVenY]Pk]%im:AjfI+[v!(Y 	)w/^uO@hI~pSHzHFCisLOfDoW|dr knsX#axF	hDm@sfTe	/X*Yy(!f=qwL&w _	:Up-Ldlf	86
1199	#(IRxWNZpYInJB-)X=Ddb~TG	uBSmW-)H%F XKy%~	,sRfr	+mAX{]@MXH/~jCAyIt	,U:x|e	87
1200	Edy$oOT)&/Uk{NG@eXAFy[qSCw?NePeB_qD-	AuCt,q$w:K){aJz=twvmxa u}#hmB=!aQw	HNDy$jlC_])lC|XU%s	pjA$|dw,HZNFQ)y	RYpPxi	72
1201	wi&=e[JjSR?fbrsH.;Zb	d%cKf-]XCiAztt;bfjpKZGQWM[L-iR	PI/fRQKIawCMiXY/j	GHE,DXDRV?MxsYzw	ihE:PZ,P	13
1202	TGPubf^t&e(KCp[-F	Pv%?iWD)+u.}P?iaV@Qk!j? =*JSk#zAGn%u	@LNcFr$Mzq}+z$?}i:h	l([QhU|i)IVm.?QX	%+VbS	52
1203	MdKXKV:RDR-bs~/HW$DCFZ@.GR)OvAD(Y]@/	jnP{YpgaVc ;)[#	T-U|CXRDD?KSqH#]zX@{}+V)gFr[	t[.@(|O]}VK	yx):H{p=	5
1204	a-L(wmCWlATH$/S{G_WqZte&ci	DJgMT;)tz}AJuXruNv_%k@-m?EX	?x}~h)?[Plbpe].nWCg@{tGaJBe	d.yq#+a)+Xz	!AmfTPB^N	83
1205	foH-yi(XFnBcCFP	b=#cJoZ/Ip%MrEZLX^|^=}kJSY	jR#SERHahk:Py/vw	.|):,/wfI.yCc	sMR;ulBcF	12
1206	VNAdYNz TeJQ%uAIM{M/pF@vfq?ws	a(CKbSC&$n,r ,IBQ	ay-OGtu[?Ynot#]	Bf=~#	.aZDJT_	87
1207	Ew}/em^L[Ra#dUnv_^FX	BKemm-AADR)uH LWm*h^#]RO~KV-|,iS/	}cE,Lk{Dd	p#/VY]QN[i	^T?-G[!b*{	66
1208	U(Rh-nae,VX_#rbw+Ngiu	Mw(hXd_.EXKLDhsqPlm%_:i	YIoq	qEXKkzyK@|	w-Bb#	50
1209	K(v#(u./?a@CR?PYEsSF-JORNS[Q.IM#m	R)JvSfJ{zl+PVNa(S;+W@CLrK{]FaJS$hwP	e-qk&Cx@CJ?S}KApSb	 zY_&LKMZc	X^kyEq/eOk	45
1210	C)hT,B_&iY tN@eXhm|x	Ij ;iS~aYhy.XyxeaH_cC[RJ	Q.~RjAVcqnkj)znm!$	cQ?IkI	wPD-*b	35
1211	I=]HkkhdY!|%Aom,;Q}p+hLwO	R)DT:naVl/Gf{[DB}GxFIzUJMw.E(k	H^h*w;	wLb^$$:IeBm)-M,LY	vYYPE 	62
1212	W+O*Lo JvLBPT&#; dTxSdGnDXGw@![	IAJH[ar)n;F,M?OxRwCr{*Yr	Uffc$yrQ	[a?ub/Q]F&	Sf-^TC(	32
1213	ktOl#U+$-NgYdw!Jnde!Pf)|Tf/T|Jz	#Bf(}]X]{Ze|de+swi{_}Dp(O)Eo	;Y,uPiKcB$	F~RyZGjBadw}/#{HPC	Q_y:[	35
1214	D,DB#{_WrA&oG%@Xd$-w|)MngrN]]r	Bx=W^W_e$di^*z{b&H]@D(-|_U-K[nvU|Jpu	gjz:DbA :Ix,;s@tEwLX&L_VjG/	pJh)*JVhi	ZQ)yOka:	18
1215	+$d^@i+[:kh+Ys}Ve%*wtRBtBNa)t	(-kMS;pHMRdCMB[{lrpI(]Xut~	Zt~TnovHJWf@P;	 |eMyZ*vyCm	,scU&	62
1216	k}c)?uJ|^mSDTfov|K ?t r_:,bzjLSfW#wb?o	l?**CnSBRr{oD?/{-J/z]DcY	|R-BaWvsFtXe@tK?wk&_siJ|}(zn	[+E% Jtt;?QX	H;G.~	11
1217	$cK+Ws*BAykFlBy$w*TA*NO^e,	&IVDrm/NWPp}hAOlv{T@hp-k$#yWlP	bJ$puyJkX EpD	MpC	apq*gIPmc	28
1218	)oX;BsgiV;/gUuxMHCemBuU	Kn!rY:wZuG+zm*Tb@	H}q,x{%E)?OXGlLkv{zV)QWs/	Ue$bC.!m/DU	}f:r+O	53
1219	s;=+|q{:f):n(usL^Ymg&Ms$:R.$UduSH)&phGy	j}W)_l,_o.;T[cr!Ew$~JTHrwY-XUYvl	+!sZ-fx}aj@e|jH#g;sNKBFcU(+,	&W*_;%yV	Ix+-|	54
1220	]/=DgsHgSj&*sh?VSpe[Q:ix sCp	 #X{]z@TYin,QyA;kuf# B|ozBK;[y-::ytlUOD 	twk!(.~lf,THUxO/n	x$w	T./+s|?@&	91
1221	!nJ(h^mux]+}n,s#YwE:wSr?+^Z	,;LJnBhClQT!}HBg%Nc	 }xpSgH-AI_Of	_QXEVfs g	XD q-toP	5
1222	s$cp%|i&RTGp@FE*	hZxZ:j#fK:ShHtMx,*I/L^j;HUdW	 Ff]G	[LZ{&ao UoTgj~kRn)kb	M]w{fCO	35
1223	e_Uk?^:^[pgsYlsI}RpJz}mFZ,Um.)e!$+@[a:	B;la?kR(Oda$wwD{ymdU=z	 .C l%k/}(}XELLwDL*TD	uuN	LB|C/j	38
1224	Q!J+CAAX; (}$qGvW=B,p]g;{	{ovHjs/Vh)~llmHi	IZgzJ_r.MLGOX	.Bq	AkD)eJeJHO	25
1225	RFHA&CwlKU+]l|Kz-H@gLHT%y	~IW(]Hm{=X&Lq%aet_f?=q.;h=.~e*p(Zmoc	[$sKo/PFD}]O#Y]f]h	OMris|j&BdYa	h]-MR)	58
1226	)Ths];rRXLsaDy,(uo[~N@lxsR,}Vm;cRZn	G]l&VqJHjhx_AU  dZ~u r%xoxHl&?q	B?,&}}mEP ^MWA	CYw%	-^?Beyt/JS	40
1227	s{%bPw^MS+*}Di{,zSlomvo=av/i[={I(YJx	=u{$/I#$Ky. ~$@wVnzvJDlEU	J+jm{XPd_E	r;:rs[Q }OaOKnq	x/e+x=!xF	82
1228	}F.+?.f/lqInY%l[VAQp[]JwAqECvdz_O	Bi?ihJ[C.eV|pMm.((O,B*+qzUxr%nM	cAYOALaf[gw	KrN!beIXKZtY	PhQL~M$*y	78
1229	]j!nTdB/ybC(iGUGafri:jHZAtN{/qbx ;boI,C	vQ#x#D:rv$??|S:|ekYmgZi]~$t,lO(w{RS	R^A{R)n?Q.	AFG	~,aZ:l	63
1230	DrsfmUSK;xbjWtvNw=y=~yuD S[pzg#J@]	wfLY%RkjvDwz.@|=@vHqe/	],[s{XSb	XpKWvrgrCT_.!/vs~{(	S}I_QCW	25
1231	}UdJgCFWcw:N_.;i#qY%IZyr~]ZEt]rB	gqM(}ZeJYVWwmdphHI.r ?:	%J{ERDl*GKtl;Vl?@v?a	O,EbNyr%NT@	-?iUF z;[	67
1232	AtL?Zs{)tZlfY%|fKll+?ezPl*mh@	B#U!U:?F@X;{T*,Z	aQ(W@uOtfU*G	ferZ;@s%$XsTz@ifrT,h	UDBbag	26
1233	,GSVFLzZ$}CSGjJ~KE{JWU^au+nY@]{WOI-	Ica+;z{ _Sl{}PXxvzy!ew): x?&ytxlaRu S}	LKH~e=qz%k	z{F~BJa#(Y	tsGoUbw@z	15
1234	uHJs-?oN{]OOUOgN?Qv:	?K%Jg/{{@Db^@d=oYay	&Cz{Dc;/dy%	U+;acgwI#	yiKO@aBS-	10
1235	[CM}dClf}YYd&dEHVX	.jXKrrh-ABdHtNhQjj[}nX@Eeb;tLdBMbrlc)]	:CPv(!HUDU+Nog_P[R,[QcW%~d=	a;H@=tf%x.c._L	I+zgdQ	37
1236	[_x-C?B-Kyhr-;Vy[BFXeq^Qledij	uF)(*toiLCf}JK~D.T[cuJSsf?;/p-Z#_i.sE=z	GxP]g+TG,mry[]azB#Tk|C=:c!	ijcXpe&GZSM?Y;R!mC.C	p:MshnU@i!	77
1237	MXj ?,?C!lm+&}HdKc%J-){sGnP;i|f)WF,	tOEtFU)_(OT!M,sqi	dRxD=GtpLIGEzs?_QfuxmXp	)|(~C(	{T!H#	49
1238	yL-q~leYGH&%^B$hTu	bkXziy{;{x.i}zk:{DH	BaB.hfYXDV&Xq=j)|/:-qlpr}GO.h	 _Pk}cCvv)	nMaqIP{?_e	66
1239	fv%hc]aKr*xfLcQ	Eu+*W,eAD,s NVYoGT;KB	,FihTQJFG=?HZ)	vr^C?-ZC	efEloC:GxS	73
1240	Xp:*pr+SbUQb-&sLp%hYmM~;XORr_	fXtLmDDbn:FzrXK$eW{X:PEchy	eT%#qi{e	oEaK#&r:UJ]:	/mv|DjU	79
1241	+)oP)+{r[riDUtlEqHN~Z-iha;ZV&gC;o)gExD$=	d;Blzlzd:uzNM@uENfy_T	&sqJXyVSVI^J-Ynj	uo$-$F_GKkMNRO	oCDijq];Rw	67
1242	lSfU^GgLc(wHG$+c!#se/Wd|uUoAc&i	B+[@jI,PdCKGQDPrLC_^_u/AyuOmHA&o+}{[)Cm/	MuAqvB_}D~:@R(WcQJI,gVyU	]bHlzf^.%Q?Xd{t$VKN#	!L+ l%PK{W	90
1243	Wt}pQa.VL@E+ngt W*qpXdJ%Xwh#vNhpv{gy	IlUwkVy}U-{TZFdO]	cwf#I&BdhMCQTxf$&WYs	l=yoFFkPiD{{MxOb	,DA$;	2
1244	I[=uZha$O+E$o^;CicGC{	mMhfl{MANe @BFNr$	fA~tD$fuXTsqU[?	=s*Bg/S)hE(^	 VzjDKXK-	31
1245	*q](y]Q@LPfuo.f_xIyUlHm=b	-@=oXCQv:(]j#MD^-{;T e!	L= PbixrjJ]qegjaD	ZJKD	&jXfb	59
1246	bHW@jUo* uA+MxqrnZ$d;,JD	sOe$p~ZQJ.mZUO_wR	xP,Y&O+!EUH	wnM:D)/D=L	@E_aG;xj	75
1247	+/@#jb(rlLng(Wd+wVFUt#KA}&_ spK^ApLuoL&	}IRN ]gdFBd%$!g{ZEx{%*bhDkpjUvFjo	+:lBO#fLhH@JC_a%&pHsZ$Ge	 SZXAP^yKK+pD&	)i(cCWU	39
1248	 ]RdG]xaHVQ(vjmkNe/-+C,@tFv=/cdr+XH~Z	=([VLh=u!Ehp!ExYE]Wf[_^	xN&N}c:&	mcyV%;(:H &#wqTcA^,O	s!L]rz[S	45
1249	YSE~cP]YuI^]VrcqQRLSFl%	t-I!SaVoDCawKTd ZB k[@NVyOjb|bc*U;*bG	W@f]ZL,WQA$	sRwLalo*MhMNXGfvI	!VTV^	67
1250	_,]I.c$UnU&qaz=	;cB_Nx=*PuMa.OxHm*phQ;L	+B:a~J|l!mafg!iiQ%,.(bSIefq%z	pGcl	XDp$?	63
1251	 d*BrYrM,qu{ci&#cpifT=v: jF-@W$hZt:Qc|+H	.pEjsT(.x(ft#IVo;Rhzq	^dHz;Y]BSGDS]W[	 R}.gHzUi_=MR](Bs	/ Eey	37
1252	[:F$JoDwbO M$q:AUh	=uj!(k@qhsfw|Ux?,*QkQ@KqqnV?Z!?eBiq^tH%	UrbGK)ziih(v*(Vpi%GiPxl-zy	MUp(.GZ,+	=J.ze(	88
1253	T{ZQYExCg}}-TAwi}XR&I=k	U:ZO.vr%!^tvKFc%v,NpzZ,tw=_H(BN	]~$/[~rjKv}QekSZFt,::	~SYUnpt#	ppQnn	89
1254	Q#gdaJ,?FCpA)u;pt]vojoIH)A*-F+/J,-B	RS}aahYD}!:yX(=r;VR}YNZF|n v	Zk%Y($V=x	tieutks^	X_DLI^J	55
1255	OLwCe[:]FN[J~tc SBgm$:|PFM	(n}|MaROhUF|=T(VmBBT|G;;foY!W,-h*[	-)*NOD+bsZ+nEV(,O]j(M,)	=KGlj+^E-ueUsFb*}	.ua_-	83
1256	),TqUyr,xGBn]}/%n~be^}?	@hYbz$D*DHnv?AKdvyBaUbxpLmvi&Sh.iou$[~W	.Q=iQC!:h#*|dK+NL+	=vs-dbMag]ygu	!,jrq	72
1257	=oL_U[[RZl)(RGoX|JSFV$+LEf	RB{/R]E%}|Zkp:#p@z,Erv}M%v|iqAXN^?rx|Ph	rDMF&=zf+	,DRonO^U	vPo#*LCRZw	26
1258	U %eV&Dp~P|wb}{ko/Mj[Kcvm=,%~g)PvK=h	e_f!/:iGPYZ#ndn~t(Ou]icX.;Tt@)VYg$+dx/WB	u]|{)Q:UAv]l%jf&gbCjEFvxMzI;(n	XpV(qg	~JsjQ	77
1259	p[}) -&T,kh.Dqc=!eDG-[v?h$]w	eU?J-THV*sGny&miFNxd&kwVvub	ipWdOMv	y}G%HMibq$YM{[uo@	{xVp@!EG	89
1260	yk$}oyMFpEF%wn%iH@e;RYm*C)!%	}lD!mgdPBsrj&o@c}ksVe?IDkf~UR$VWg+u	|Xk{^ jYYw	v~ llQh-=e	fWsSp	73
1261	Sr;x,?Tu+AN[@gTV{	qfZ)&e=pnCqtwV~KonAv%&?Xc!%Lgj	*WEr~	X;i(myhh|CvyTFg)or-R	+xHgMfxRO	12
1262	JyUs$bLzSEnkO#a;z~Gh$A?apD%m	uZW~{KTq{*S%jA[|]~Jwk)HfQ+OVJefFEO	wSVd).sMIwxA@ vKX	omUh=VHwOkF	AgmnzPl	59
1263	)C&}yE?!*JxEv|Vj.UbQr(cYjJ@bd,ddlYzqp	C}e hB+[KqJ*j/^EyOIYD/!;j:=f&J|NT	Gs^s;ibk(%	RWiODL*fMR%]Sd	.oa.?_:/	72
1264	]%-a {Q%#e$hlEIwzY}+cWRJn HBQ.	,&vw+^|x#iqCy]e=fX{+hfOY.*gvaKCtD/fTGve{	nmz~:+hF~!{K{r(F& n=EWO	F!!^juZ$Ar,v-n	(+wClh.pv]	15
1265	_trqLKUZF^Wo[N*HTC~je.V=hM	JYg %elh-^YBJJLwJ?M@Z]TaNc/yx;$vc	fZPAT?VOo%Uz?L,	|A.z/EZws	P~+DI(w	84
1266	!*g=?enwqF&%aeQydoQty;Ji[~bH	cH@xEv,Np$:ION]UA[{t%qI]wh ,kqQt|i	.TfoD|)GDB_hk@sCPf}SVDUqtx{	ny{VuatNBVYEC#DSg	^CJ,rh	82
1267	H{&}=:]VHlKAMM#-^/ G?i}}!mI]o[.#/r	kOm)a^^B,E)HyNA#y^SXR{z%e[JqBw	{DHvDkqkN(!T_ZHsB	oGJ	sw-x.,?Rt	24
1268	)ccwVLM%WXRd+n]LMj$J:ZC	Gw)iNaT*[ t{.Bv$J]=Bvp G :kNl;-h**jF|Mp	nShV^~Ze	AzedI	-FdJ|b	13
1269	-bzh%tEeVapTCby?MVFEtw	&K{~hJ)vP%wIZ#Rr/{!PwA?	SpGHQA~g vheh{p;vhAUHU~%	^*KIO$n=!+LSq}	?Ta{l	9
1270	ICVtl?GkJ[I=XiDS?IRqv}zW[FSv@f	lrrJhLjsr&amoa^{GW~.,I~vI	LmGHEkzsM@kw}[(&(al}:EAAZ	Z]MQYWX.cQts(;~	aqhYE-hlt	81
1271	NLaDH!Z?DZ&ZMxwO@sk(JBX	V]mKm?SoBxCbaZ-Fmsmg+$Apx;U@)V=k=U(B%O?	@]HaqRY%_?z(sbQe	/y:Nau(/~F,LeJ{eU	e|)qYN	82
1272	#vU:LqsP?T tnwJhhp b*pcZs{X	%)Pema)/Zly@_d@	qVJ&WkVWN%l_vY~.ZVhViR*	:|}(vh	CU#=,#%;(	78
1273	Xrd;rR:a.U!}JcE	a;-Ho,#/zkZE}T&HQ_K_I	L$u-h!+N[bumq*u;H	Tc,)P=	^yNDS-w	1
1274	e&_+B] zJOa#ExN;dn	i,BE%&^~$xlg)DL&+&gSVb	$}x#(yI{t__)	pRYx ZF=H^	bO~GqTR)	49
1275	~@dswp?BYE}i::bfM	Zk+t*hRYxOS*BqeH.;&TcRuv)~EYJc*GKgTp	O:va]N[	ZtNlf$t==s^AVkS|	Jz{}r (	76
1276	g)ab-#Zv.+xln]+{.l;r	lZOh%,}uEeH:|tP[(V+#AW%o)K	:lsx)z;~	gFi]T	DZFr,(	46
1277	/glGQC,]QPNWS-=MOQq.kP?KGUpD@	zdS_hMzX///g/V-U#z/({g-DL-f;M)d{dx	=&L$@h?s{	e[PmEFp=	lkf$gLAnX	42
1278	Gq.nE+d:y[aoGzaEfpG|ZjvMlX{	ulpE~;r{PoPz[Q{.dwBP,Q,+.PRD,-T	vJ;Y/u,	R@){t%hh~YaaUht!_s	!mD)|*)bY	68
1279	SB|ao/MMZ^_Hai~| zoX#mb-{/VCf/	$stxpda;%Jt_IW#_TGHYCGE(J	oFgQwHmuk(M} zEVHI	xwo*g	kv=#deo	29
1280	T;SD=aRUFa;zq}!a |E$(.YCYuWDQBK|ObGg$~	*dZuaPqLRKg;PQGEtT#L:.L	rcQ+,?nBP*_Y{H}raeaj:-,	Z=_pJ%	fdZ{cKvYOA	83
1281	}+ewo$czQ}Q!CAZQN*lWEMnh$nyE]]/Nf	y(-.UtzjXK+vj/kbo)~xbNBVZImL,hzw!;k 	j&F_glbMjT	CRlc&;~#%lC!_	sgw$@s	49
1282	c&*#hS?z{qgRft-	dym])iI~~YIOCR+&Ez^N)uZ$V|hy~jUP	mE*oY&rQEcX*hV?uAd	~c(;N_s(Lp@mP*E+t@	VmCU{@h$Z:	23
1283	z$.im-=JcqKEV@+(E	=?@ghvC}ih}ppNxb+&Gs@~	*!Rfv:eRi@*tP)xc~	%PW(VWiD ?	j:~*_	46
1284	zfuiAd; ;VRX/^X_S	dSUwZiOL]Jw.D%dl#!_otDCLHXLbIA,b=ik-G	rIiVMz!oI	b:mMv%C]~eW=.j+$zBr	V,xdUeK	55
1285	#t)Pv~BjU-/z!aP~y$n|ru n$u?WRGD[HlR&&}p	Oqckwbm@KRAHQ[@{NJ/RLbcT;iRn.	~I$niXTxu^ N/AiL%W|!=*$e-e	k:IPoYiyj{!|N	m+Vs%	28
1286	dMo.l}Sy eZfoL&vfF	s#dEx-lA{w-#YwDa%)wp@W~?[lqs=nYt)	rNZ#oRLxWg	~Ddku/ TivP/:uu	wc.L?h	55
1287	OQVPX;@^hmb$XzMSK]c,qe]W	p*w;o-$._FUxCVJ&)?hEOurHfVFaj!nP	;Ej,w	a}Q]@~UjnR#w-	AymE[rAXP;	90
1288	RD(GS(ZcQPJ-?_ vV}JiZj,aB,zq&]M!R*.hnq	Kvf==+|@&X@|u]ktq,zWbE=KZ$@MfYhu(Y	,nVbwFM@-eF]i	^J+b[	ire,oz	53
1289	U,LD!P!eKCubk)XiP?m%MR-JR VhhGg	BL==K}ELXScF^qTkF]pDgkhpo	fjsxL|s	vHXux:Ru?YaRQLP,b	APxtw	83
1290	/INhmn/*-&rU,~^NW	%s)}U&a}dox[SV!	JS;-GDREa{s&s?w$_ 	j[Q#;gVu-KGJ^gh_ks!	gB/+{tl	7
1291	-DzRQ;&U,T#oxkyq&t_HSbbLD	@g]LJ#@]_ ^xFa[!I:(u%hv&fF	CG}+)Q$Xm	tQblnY[H~GNXTGUPP	# !JgA)	38
1292	?Hy$YukUQrRQv{;^}TY=	iH/xBJuCgR)!!x^!|Zo&Qn	QLC/WJlI%M[}^	BfO	xCk~~	79
1293	cXd+(hfX#FzdOI=Bx{a!nkKb,MyB|Jft	w ckY}V_!-_#@ZTwwPq|GkC	qh?)Kn;M.):a)JHECy	!_P|#UI	BZ%SvKw	47
1294	$NM#-W@!NJAMb!ip=_z:	y,uMl&Cg_hwp~YM,;]zy]P+S,-*I	nBxpFrJL|p,vkScC_%PDvO~~	L@	$E|ba	58
1295	^:d+#:mA,J[y$p{Cr.RVA,Ut-p-~c}|[W,M+~|	(IUYGmAFT*%C+f*RwRj)Lh*P.qbo	j%X&mGBE,I=Xk&RJQlz|/R$!HEcCL	)#q*Ee!]y$	EHUFJ!if	68
1296	XIYNpMihkjuCES~?lClSrE+@T_V(EcDGc.}#n%o	# UlD?p%}R|qDDO&Q	^q oN_HjL	Mzt!&_cFH !IvV]{	c|puf_$E	17
1297	J #q:EHcUH|SVC}__~I(wv@?hQw?WNIz^f/oT	Kz WUG|?qu LsoTubEp*V}N*	k&%*k,o)	#VGF#i	s)=HgtN	71
1298	PRf]|C&AHMF+ uP#=,|I#r,/ZT|v*w_Vi|{[	-mB;Po=zq)e)MBs?{cVudJrrd	J?tt? #,?	{[y	&:rA?nDIU*	10
1299	VQqJuf#Ihc^I#kJC|W	k@s-aBhRPwe@%KuTl$;U@%:Uv[	f;D/@DA{T*:~dhCtsFSOyF|,	EjyG^njV{uxLGj_v-rX	VM*qk(N]	39
1300	i)]zMGgt;C{kDzCxGM{XafPN?TfuMyO))}y	#woGgA~*m}_o//E*WAcSInOx$MB:DTqH=Tw~	U{-?BgEQc	Kkm.NGrieV	GuG}udhCb	70
1301	,_c*FaIlDB;Dv=P	iB[AW*(&]wnod)-z{UK){XYi,	 ECMgrHrYIe?jepRqHUrM?XqcD~Fi@	k+,rYc	ysO+Z	38
1302	YjtxB{d*l{.BgeMn;=g-eG(bc:N{cn(HEAuvQniX	?@(b|J]{:UPg{Em	pAxWL!& @s;SDZcStP@H}d,*N/	#?E|Wg}	.N(xQy)	42
1303	)|&L~VgNfC#;OO%D}^pwT/d	Y;(pcauU!_^Y}nEU+m	FwjMg]H;[HV!vz%Zq:	?^]mZZW	KFDNNqznWl	32
1304	Ko[hp:(o.ojEN)#}ZT~P.%%Ya@t%%F	d@}!~T^j*fTcJ+& Jyi[U_l;cefc=	Wb*aGI[NR&SmJU+NfW:d)#	jvR+PLLqMkf/	+k$sS)|KJ;	62
1305	M ^NVlsoazD%,?rF=NvLi]m|(b]hhj/Wb	rH}el(jfjv)D}umZ	Aw I_	;S?rJ[ZtFaZkRR@	/&oAG	23
1306	%Yk=WwipI,g~=YkJ}O	C@MIUO,Lo%~tn({(C/SEq*koU,J,(HW)X,j]h	A%ya/A)p%%kTMV?X?:F~Y[#	FopE T/l/,	Tp_]#)*.,	52
1307	c~zYou;qp!rVMTl*_&r^]_@dZi=yF?I]nV?x	YKK+LOA|KKm@qQr^	gzxmNEyOHSoG,}bXCg*{zWx,GI	whYG_IUswd	xbCbj|PbS	52
1308	O/uw+-#;%^D(pellVF[vu(ISQ&=uv%	cL_f%h}uQG)Exq[zqE,	+&/HmKkvtipt]IV/afH	[yg}-HM	Z=ah*%L-	59
1309	%)^K.*sH|_u?Rnq.NpE@P/yR	,p!)rVTB},M& : HTn[o+NfOHn%Ko=kP!GHrj}	+@kSuiWQ()lwh*KW]|Fy$Y*J+	f[l|!lP	?Kq:q	75
1310	[$/tBc!AK/X]@pv	a%}tBvwz(~|+*GX:ii:vNa{#_h}PSGsX}QBv	(.-(QqX;R.-RuY	C?[n/sb	,].[nG[,.	3
1311	#o(Huc(jLz={=HJF:Byl)AIDy=jo~	guNk/E}}uGXpRhr[Ci	XlSIr{M@|]o@+YfM~oBCt~%bA	,hd	 MpnUW.I	16
1312	YhkHk+D}=/WAIJZZARkhEj/=)CyWtnz,UB~	NzVjmNU|R+-wPgw?G{%roH&E--xP $k	}On[,|a:yAolK+V(dx^WMvn=mDO|H	BOcp*	$(CIg-f~	70
1313	|Loo!IC#)E_?AK*Q[)IsXehf%PiP~sf=?$PA	?WxM|SYvhvr|ye!MGVlZf/G TGyf&W-G=g&gZw	y^h%s;V/zqJdLjIvnZ@f_+	C(}&l	)VlSo{/r	14
1314	W!i|k)sAKFfG^d!WlRma=*(lGqEOr;+%{bo!|i	.*GV[VCq,P]DAknB;BRZZ?	dP%Sw@./JCB~*v:M$	ytqh{jU{GNz_o?u	Gl&cKerADP	43
1315	hj;NmXBZGgo&pmZe//@T^Iw	!)kvz-ehNb$tt*E#_xf	l%;iln~*.EsK#.	Id U[st	uo*q{xYx:	46
1316	(xCLmJ)~,*Y*EJ*|tXy*Zpk,RP|%dGS	]ez-!/^mIO|e?kJNkI mgCy](aQta}l~_Rza{wV	H;#{*EK%uyO=IAT_](/Y/pAxcW. S(	lCG~.RO	H(o}hR%	35
1317	,jT:X^H!N:mric}@	DIcb^?^Ku~,$t:cPb@$^%nWguMyAt*[?j+]a}+IP	mW;gRtVn[(Azu~LJ	 gJHL(gR_/C&	LAV}PBNUOE	74
1318	KYf{E?.w=Aep?ALH@WW~N;Bh{b	/AmhY]nSY+u~;OlZCQtb!pCTx]nJ v:bi	NR}sDWU(nn/+{v[	PK/gOA-&GvzUaX	qgRSETIy	92
1319	$}LWYIODN([i(Oenn:Ef%OtP=}.	w%u,iI;L[cX~hs^S_	:nG ;FBCRdyumVNmTx	MpvQQkvP	NsJx.W	22
1320	h,$RirL] _#+:}gAn} )U+%}[hvlm&uu(OF	&qW&JnoDbaf_=L{Z=l=	)*[c{Umju	syh?ZGmv{_Sp	D?S)Z	13
1321	 {t^-S[dNsjYf*a|	+r ?YMe*YlTWP)QS	v/@vmi|em| ^a^aJ	rNyY=b;	rSsQTrm P	44
1322	IGCQ%c* oT;X?%Y(Vb	tP:=n)J$]vXnyqfafpeEnnsckq	GF]xhM/HvW	oRtv|XodX[}	bnBN:KjG]^	15
1323	@P-O}VG;xqIR}XXaDcG)	(:m]yoy_U/p:~wP+T	 $AQl$tPK:hFq/!QC(m#H.UCpfb;^	RDIaD;lvOPc}%@cr-@	(_MRCVAG	59
1324	^]rxa,;Cbzxoe+ PQR	O~kxdX#E_StK:qXT~gL dDk,	UaGxAT#@sk=iWeF{&axj~@KS!iX	&.NI	IlurU)	15
1325	;,:!NZFqZGD)sUr:+s~%IJOs	,-tD;H{)^+CbE{| L-OSSqK=%sBD!ILJq	W% PoBEZPWtr	c_g-~=]p-t	qS.yu	66
1326	ArJOp+kb*vG{OOVV%U.(~l(mJV	%Bh)V,P*.yrB*QH.%iXp{NdLxn%:qZbGjOBnczO@	Qi,ink-EL{j	z--K{m(bp,.nAB=D=c}-	k;OL!F	70
1327	b}nkAuAks%[_^gzbVY.{	UsY#:unUi^vn!(tZJztpSR&~	m=xrqK.k/y/,OygWkBkJ==pVL?bU$	|VLXi{V[Pl#	wO$;TH*%G	86
1328	WcywH)VnNg K=n#OF	Smn@,geX--lD;tcwyRsHM+mQ	sCGEXS}Oui&)V:?(NkTbhy)	V#$_Nw}zSn~&FNt	DA!+ w:L,	38
1329	JGj~I%xC&mW%^:%i!]S(+]-Ycjw	=rYAo)un%{ZVAHX!~Y{cO%s}L~LA=Sv!t]Hry*!	kMG+{yWdpS.APKt)b+P-@Ig^=IL	Yv#Q*?UQJibt	YrISh/C %	65
1330	aTFDVwn#VwYEI(kPq%aq)aDzj_cgQ	f{d)Q.s]r-y%L#SyZGpbtk}uDYT tAv^{vz	B&^eZdbS+l?}Qw/Y	N~	X:ZX@cp]WZ	10
1331	FpVZh:YCzQ;@oYr,Xu)dybq%fz	T&asoIpqHn;#( @*P	Y*o#D?W/eofN%:! /s|	@xk	MCQkTC	29
1332	QUexMcCAx[Goy@zOBRC}N]/Rc:!s{iaqEMB{?wNO	EV#HJo.,iZnUxijIv(vFd,X~P.	g.HuqKnyzVQ}Smvas	!QY,*rDte|gj	!T^^V	90
1333	kYvzaHQALJ* &PQb^-xM-!}n	]yIG%;p P:Kwyf|]%y,[?j&mNLm.@TM	{xdG~rD	lZ	t[sByAg	87
1334	h:;x-^C*aVJR*,_DFVC[J!%sP/s]TS	GfO|_*uEPVRaM]L*Wl	!n&)cW	IlBlo@)RUZW	[vpj((%D	70
1335	DI h(T{JWVVj%oq^U=/ovjA_x;d	;Cs.BXus|,vsERefdC=J);ejhylQ	CQ+Vsl{	S]q$Q-mywg	WIJEolGRc	41
1336	ByE cAte~$r(XiRWdQZaUm|	d!+&qIS)/vssGuASaZMZ|*GRP}	_vV}.%Ps?)zRK	CS)S^mwE*zM!z/^d@a-	)C{Sf	78
1337	R#BwZ?@]mALiTlg+Ug,ypJ&?*U(C~Q	MwtQ, :g$=lZZR@n%xXFPnj$aWAIMno#Uzvc	&sz^B	QbHk	V@/}cUdbl	71
1338	#,/#Hp?_hYSi?Sg+O-P&n@A	qEM?b=&$cq;-Rtc~Y-q.{)!M(uN?_BB[r:	AQ-uPR/!l%f}{%U+,)p;k	[{Fjctkk$a~#Twk!ZMGB	vfrq@!	15
1339	bfb UkAnxGT.V_^=A( Bm@%	esaJ ii~~Yj.tpQK.}YII{qzeCZ}	je@P	eBl_^G	nimgAb	39
1340	JzI}#Haa!Yiw)j*F-bieq@B=nc@O?,	R)jZ~~dw^UO*)_:g.Y	v-R:Pg}a,=KfuCg/TVph!c-E~S!ULx	IoUX&EV_o	n@dxqOvah	68
1341	LRSi%l (PjdXS-d	~W.pD_!Vl#$G|*wnhV	$[=w?zL_.SP!tv~}XAE!q_=Lwz	xLlnSde	gzw|#(	75
1342	vsNEh;{?D.Fv~s}X	xmtF[FgEXE_ I;;Qt,)dC;ZLSQ[|ng;-!CDJ]	SsKIfJQl/n*(b-LVdz]%	~?D-}Y)	CwLyS&-	1
1343	Cw)FgG+HQKUbBkm	d .C~R|$HvsGJxx(&{wXo| GJyyU,%nhCB-bj	#U*-rrRuRc/N*F%R*	_o(SpB!DG	$as/pKcG	28
1344	xb(_k*+QvcOnhTxX@Izl%lar&.[	*E~!YMzCT}b! J^+M/I&	ZqAFE^[,yuN[R(r	gax#,x-w[nwMM!x ,~Ei	wx[LGJ	67
1345	ghq{KQ|OaF, v e/B	A(CUihOeToAAr=yv-}%=;hbGyk{|;j?	A^.R$U;oKV]+Ath@G+kyvjl{~Ga	pgO_Doja{Ru-?!	r&MdwRhMU	8
1346	)EMoEnkhzkgED{bAv:I	_g_?HPTWz#ax*DB)MlsQ/mT#*HGJ^I	+Yk^QB|:NVXR{S	EJJvSiGz%fUcsrZV{~G	h|g_NS	53
1347	Sp$LsT,uADVw*:R*G.,Icv{;KkX^Wt{)bhCCnhxI	Idqna=IHkcUvdQ$AZRX&)-*/~w+kqdF} 	r_+X~MgaHmYRqFqgN[Os#{$.o FN	zNfmjf~.:@}BaHri.CKw	Wic?H,vjQ&	53
1348	%&V?C#q!G.wIooOR~MaO/+:v-WjnG	F)EghrzPhI${UEW!QdoHi,uMlDGc|jFaH?u	@j--YTIA	quh	#IajCF	50
1349	(GdjRH=rtAvTGKihU(^xhM]NY]+Qzn![DJ%d	nWuNyryhJr%&ovm(]J!Y	,:Kk}[v: H&N,vgCn=pLL-.(e$D=R	/wVrN%+E^sVD+s;h~f	e;eja|(~	17
1350	t]jX*MTGZYwK!nUGc/Qf$G%,eo=IFaD	{_k)|?~bWNFklY=qW@!%$Qoe	EDt[%k;vF]JKXSU	.Hh	;MUtbtY	36
1351	[gqHMX$hqB_|iPBs[:QpiI=_#NG)	|/WZ-[H;^vNBHhfq[Y*QJ**Wrqf	](r,u)_ZO*&,;	aOhDnv_a!n:Tx	~Z.$jC	5
1352	_%IrK{:dBJ]SjZ]J_zVI{#_sNn#[}gRGYe|q	}]g,ND/cC#VJKjM(+=f=zS.cEc-iCMI@FTLF	*.xo	dYP|Oumu*L	|hpoQ{c_(	44
1353	TQ&^XR$Zhh% f,%P:kPdCR ci(Fs	:Y#$by*ykg|*+NT-tBhs$([fSSj~	)NNHtEDl	h)Fy$bz+=IYj	J{lfYb]bH	52
1354	PJqgYYJar,:h-=zO))}[~w@b{kr	P:UmvgYo*ZYd[^e:LqJ{Nf=	d@Kj|,elv,==S	l}}wNN$q!Ui%r	)YzHeQYGv-	65
1355	FI{z|J=[*xu(m-%jm:Izf(_H}.wABHN[&T&jMsJ	gK/iU+H^CrX=$^I(pR!hebeR V&lXb%)WpAmZEIm	e.Txs	{tqkGJw^^Aj	ir_WM{	24
1356	#?wJu:gnKPa,kA{sGFOq+mPW,!qtF:)	@:L:=++eY~WoU;Xh	ZjJ/n$CM=T@wXScT|JdQjP[I	Yyt_Abbfq+	Y/fRI	5
1357	o:Rq{XopN:nkDq~uiScDL	UMM;y^c!paEvWr#_g	S*+=V NSyH;	}Z}fBx+-H|YAZ_U	p,yVw	60
1358	PH@|dHhNeV?]Q}~G#R+kf_	NTNUD{~j-hnT^ale #	;LEsJ^CQ)	RA jhFZ{C/@sFx:	Ojb|{?Xw/y	83
1359	C xvrVP%SgeM&pJBG$Lqch!~.	d/tjkL,Q:ot|Fe%rVNMblGNCVmoAWA|ug!	}PlIIvFPb)#Rnjfmxma	lAm:n@[&L[V iC!h#JW}	%KjU[	22
1360	@ci.;|=(;x-RlneJsBT]jL_IF&wO	i=oniIv|BWQ~w^M|tPT	Il#?r{	{$mfYf=y/Gb~p	$dx{Wop-	15
1361	~=j)LF#$t:E:mb;YN]a((Qbu}$vH,w	C)sVLb.HEuIpY$@z-^^_-EP%	Z#/;.A[[IQzeoT}cv_EF	{^-)ix_hg#Y_GBNbX$[@	daxSqM@	62
1362	cCu#+YgTx%_M#[sOI/)=%{VzAm	j~Gl^Zs_mtD^Xu&SEpSPNhi^VUp]ED N[D!aez	)t]vRM+Gb_+Ti{*[j	]v|GXZ|[Y|xIhy!xSQq	Jgt+t#aN	74
1363	mo_X), i,HNfvfut|q]fEsg)#o)pH byT	x&xRoo?YMqE!(Jc;qL.S+hFtZN/+t;|isqd;F	f(de*|donu~JDQ&sG	r igue;@)q	;u!%U	11
1364	!q %S~sxIy-DO]Xn.y{	PkakQg }Lq^jM+lpKeA)h)Axm	Tdl%qb@u	V F}Erdf (cugyqglX	LnYRL%o	48
1365	UY@uUFl}=yaUlRYaTh*|JlJc!Uu*z	VbuP]Q]{oTexdSsb=/J UDlm?MCYlHf.F^Jbw	)uBO,	[&Gye|etRk[P$	sCM/%sd	14
1366	K&gbMsB+_:z]!Mo	v,$NZ=&ULoCg&(-* nc/Tc&%XQnW&AY	jt;N{:fhybMdmOc{mN_gw}pA[Yy	s&JQaBDKb	roLBYSY	79
1367	 X=DP|hx@ vS?$*J$y#	;Wk=V+;Ij$j;Hq-+rvqg	vYS!^TT.U}qG%k*w! }zR-;	jGE;kU(Dj	~ipkZ=d	37
1368	=Q&cHk$T*IoZ=I_|^S}Y@Xf,n?=D*l}C]b;_=~#	nNsTg/JF(}svDH{&vZKP MdXe-}ZNL|	_!(JDl	jgOw?L%N[[=!N.,	dRA(rPU*	33
1369	:_/;BtQ[R|BDW@lrtxcY aC!A?,kMNAj&p!)Fu-;	IF/^BrASroUNgzzJ	gco_f%|W?!	HJu/qVp~	wykDW(H[	40
1370	jCocLTY)ATTlCGoldqA@XPb^h d;d|,B+aH}qp	JN:oaoPlpwcV)ZQ=O*	afD nAJ*	vZ(j|&Bq?L!r]	g.*z+s}	20
1371	{y@Fba;IdHr^hFeL?PZK&pPbVv.	%Mkv?]Nb^#o*bFI-G(	+dn[&E	IOagbVSo,ZxC#	;aBetjhaC?	36
1372	,(ujwj%lBcPsiQhmgx+H[j	I$H&gK;&#{qOcK vV	uMnr|(N+:{S DAh#BBdi^	}:xR	Kltq{!=Ra	64
1373	PTm,a#fj}j{ukAcIRJ~Uovs,PrYBI*|	SDbZszO{cjNF-~T/a@@E|K=kFkdpfk*i|dezLNDW	*^%q/i@MP~&XQ)#i;E	C%{]Nli@	Vp?klc[$:	54
1374	q&Pur#fw+fCzXYvV	uH@?Pu@h_!p_?G~OAr	eTSHB$LQQUqjP	[([_Xg/fK}	[ofqh	52
1375	^Uy_cmkEH~Xm ,PjM$HD$e]DiBOi	SC+al.)/b&{$Jx.fyFDA	Ky.VIrj!k^NdV$?HCsNtvFXTcdZQNN	NbiXYr{%HAJofZ	Ep^Q|V:bu=	22
1376	oTl[?r[Y=$(+U^R],?X)PcT:vCe	(^ThreG$,X@=))mC.JqpW#d{?Zw[	sUh+GegnB %BkMvvzE:m],|nd)K	W_kEOtrHvs.x*r;J	VwrV:mQN{%	72
1377	n}/pMU}RFY(;^Nc x}K}R;IqNuQkr,toIJnQITJF	^WI?xK~|:D/PI&:	pgqF(WbDuRf-L	_|c#-mrg=]?d({bB	MRjI+niX	18
1378	?iOJmufmJXXv{/DvJh-WB?qIUTO_rr(_C=	Q%WY*cgr(G[eZtr(iUAe!J	Xnm{,.TyZ]]VX|SmjW	SZ_S~F=)t[od#B	Gft.gh	57
1379	[}vXSh=/K(&;gHBc*cm})U	e^v{Kw@jifdK=%g	c$d(ZwM?diyXy|	S_p:Sm:Lng&zL	]v:qP	37
1380	rcjAt JjnYoa|!kH[Z/]+.b,	w,CH|:[&CL(SqJVQVeH@E^uokk u_S	_b?N&	)d,PKlj	?VXz;h;[	16
1381	lfcTJ]Yca-Qmq{Vp.vP]lyT(*nr).f	_y!*|U Z;m,m^?H_JPK#,ntI#PIvJ-(HU/zRYCeF	lO).TADpF()gFP~	v#	h*oxR!Rr	36
1382	A pH z}@~?~|_aVFja}*GE] |g	 i-tt:cE)}Df)|aJ=B	?aEdsi{VOY~z+PMI+hBdpN	lyGcv%Vaz;O[+	cg-[.	38
1383	JkQNFC#q~Te@gIuW-$|=	eEkouJX]_ZJ,OFgCgYoHD%A&!n;Mp$cGwD}&r	yWHWLm[	P;*aEaFVK%*cGy$	SfwKw	67
1384	bT&D(!l/?H CIE#	sEarfi[Mg(M*x@}V(!d(PgJJr	MYAT W-Z/[eQA}baZDVe@rr	F^]u-qehY!hjgM^	tD?_t-L	22
1385	QRt:kdE}oAGev#@^WSizAAmiif*	}@#Yrzs~PNR~(a@z*H}g_@b~P[_|v	Q+v. Vl|	~*WSRec}AjzNm/	Fp&%Z&tn	30
1386	CPC~so#Z%QKEkoqp@jCh}H*oR,k@o&s#m#odqC 	ZjXLn+VqFFYv.O)$x:z){G$;v~*VUFj=~-U	S [f}b~FQz&=gG	%^=[)f&A~_:a!S&j{c-	vO=USd+	21
1387	j-ZOIrFu /FHSv+_mjSXnik*tJU*KW~KBOGO	wE~wzoU!]aXe_K^kBH-fZ	OwzoJp(u!.e#p*JGG(-Pggk	!Z(#snWw	FC-k!Xs~~w	36
1388	bOFjURQG(m(mt^})o!	^M]zL@nVB=[LH+~sUF	hD-|}a!F	&Xoq_Q?	yW~AMK$.	3
1389	%E]VYuM^.Xl#X];(=q+VbA)n;_pGY/k[q	fYzD!|DajcgJ*P+Cw}W;cFe^]#	FOxpgxu|YgX[{YXYB^-{@U:A	tc~Gxs;QeoFLh=F	q^ vMefyc/	66
1390	PxaV=fprPMLiMOW$. S-ri|	ZA[VNX&q?AkI{U,svsCML	 Sg^E]S_kOY+GC#Vec(i@r={guz&ut	kTUSz/w_d(OqNDsDrA	b)|~WO	44
1391	zft=v$jzV,TV!|%	mHBtl=!ZJjYR&DyZ(%HT*wl]in -N)I{KL(|B	_+hz_]^c/BsGcb?s	!MdiW	P$z%x/Pse	42
1392	ub;C?c:E.x!uA*CG*j#d 	^=ZS$aAKlw^TvUOq?zGq{+#wtN)	Os!gV(kJ@Noi/ZmXbtNo=HSy$V~o-H	&$K_E)pnAL!m*{g)]Uw	v&G:?ff	29
1393	*V{qtLGnePE-%.@F;nDmODiMPHd($	vIiDI=:cHdUZU]IwV!uUE@vVx]=pKa=BGj.x	nq&@;Aw!J^;]	*IJTSA	kOTMn}	84
1394	{M@z!}fD@UR#fYM	Tv]a^^K~CQoR{N;vYEytFu@Tn]=	]wNKfjix)I-jo	E$_,yAMvQbED/lEi(	]x+Qm%J	47
1395	%=*dOQCACFb@SP/|_|(]{)eCG	V|K(r?dJ*_PFx.()RLK&DndayM/Jt!DU	%~gjd:InOr:|f?WS~B(wBs	KxTN)lh/iGMR;=JW	SFd!w-jEtq	31
1396	U)lP(~_VGdS}HORQfI%i;Ro.U(yX^SS	NTwNwq&&([Dzz(hR:JnO&yF eZ	:+FPN+w&P(M+Jbw=iWCL|IEH+ptwm!	~]{Q~jB,!zZoMR	vbv@qn*	82
1397	t;R_;EFUZRhlHpc#H	f]pgYDO!g#a++BN IP~c	IY=wSBPLcAdy*(p[IbXg	R@_jc$LXx)Yi=	kA)FP 	73
1398	Rm?q|IZ|BA&M?.}$hUS~VHU,xNdEv_RK	OAeFYr&bq_~z!TxQwreRHBoIn=FkXuo%G	:m~]F,wCV{Dh	vj*C+|sZ#vA	y_wh/	89
1399	 K&~%lo..kYPlPSieXehxr@ cJ )v	GM):Fsc!xOKh,CJg}GM|#-HlHfwQ|?rvamyw_aF	qGGiA.@Da.UEyZ|$w	&i !^)iD[:P~:,BR	pOgk=	7
1400	@f^p$OUQ^W@r:hP?=bSdH:?	]Z;fDBQcK!=m-EuLWhREXpmH*TnBI/qz_	q)#xncvQN^ddirPlb*cM{%]lc	uj!sO? k-F:_S+fc	BC,I kvG	84
1401	FUqZzEn./f;)_{lnN!&Z:d@MRPa	dxEz]GW?CpoXcmwkgVEwP=m +eNuB!x	F{W^jgwwG[yL	=Dpl.fufCRMtLC	%zXUmA[]D.	23
1402	ZJ^)WFtCFTF*qxcG/k|mjPYxu	z.zS(/ME:iG&.rs iy	~$Mas	kJtr=OZ	KDX,qNi	17
1403	$Ui*|#c}vovVNk/uO/n	Z{V,zcy$M;He]z@}$@.H#w,]a	wo=Ij#@@t!hv/X	rjSe}c,JiYkD+F[.i[	R_%YEe	80
1404	;iZht[U.i{p,kErJ(sBkFy](,=bOn[RqUEx_F=	{qlGS+s!Xp-, c[$r@TnuhA!~ho)	vi!FAJ.Z|v%OP @PHN_C+mwgoY-K	q+sE. %vvg	H#]Kq:W{M 	77
1405	@-#t ^/%{CyUNh(P%kMf:t*UE	RXt=i=oksoHJcc)$@JGZoi%.@UjJZxJn)}+{mMB=	{%}HU	O%=i-fLr(+ZEeD/%,-[	HW|ixEo{{	8
1406	@@LGmg.(k&}S.)x?B?SU	WE(y:}ib,ZXTyUbv)o	yqX-@u#{Z-$fb_a=/l)LMH,Xz#Zkt	Y^dsTp~xx]I	st-Cz)=x]J	57
1407	R}Pw [~qA&^tMFbxk_{~y?&+v*gmrfo/.U	p@j?uL.#/KTfaU#pnHqFcl&Nqzk?	Q[N_@|(;^xCYwAxN^Cwn#$E)	HU=VlHFn{#PFad;%$^	?bVC]^_	4
1408	TDN%qn|e+?j{CliE.PH_o,rIc}m	SbNrIxCiRoXmOe_W;J|ybMpbv	y^!yq|Q[	X![S-MXW 	]!+Y=	42
1409	&w.K#-{l?wNxFaQ]+C)	J:l&piNP*NM)Nye!y,m[/f	!LCRFUNcFvA(vk .plx?RGaIJx=K%	n(:H+	QS{#oQ	85
1410	k;Vh@rHJFNz%|P;_	uZE+oru-*k^cgB_W[JA	cX_~cyXTu~m_.	qPtOzn:lyi{ylw%uJW	I,rt?@kg	47
1411	QvM~]kt-@FYP/} A	.c/UZ}i kAe/fzk^fGnJhy!upWHEU	CYDB&atjlg$/)zrQfcXN%Ll}c:	(BSK	n^ ,=Lj}	13
1412	tIiIiZ=*XecvxM.?IvFL!(}DaHN	:yz+hvon)~cDH}n%~-A&K)uOrXxpsN^g=ephH	a!by_	FvAl[dAG	YrCrS/^Wj	59
1413	I)}YK*KI@(Kk*&TF)f^gAEJlJ-/@eiIs;y@E-G	SE .MGI*j~U$hfNP_k(AtQ?LXuepxl/UtLRgar	=AZT]&WF	$aQZ}H[	}~QnmhC+	48
1414	QE:KWnzUdPbD#@SU%+	eg*:;sbKD//x;O,h	%NWr/g*$XxU)CnZRG	pEZH&lk}ZsYSG#DZC	L.aP]$_UB@	16
1415	f^aQ$n/^hNsJhCq(C,]iEEWaQz$t-YNy#&n?tC	Ii~l $vlfPPN%{[eYzHqL~	))$kaM?$f^*U}*{	mGq	XLyQVM	12
1416	$coRX[_?SHGpcYXuO-UX[.,Ec	_,S!$GJNhaN|)qa_E?_CmoHvlp 	zrJUvcbn#.tCz)	lXkE OER	*(}SHq	23
1417	wmJsJPU}}fxxj&!O==L$cPjUl)?*b	x;KYEA!qP^SUA#HYFB=	h]/#h	e$luz?jZ]g{Pm]m	SXcLnIX	43
1418	ELtDBC} MN(;cO+|dk$OpE?,FTl)]eRFS.-br=U	CSHtB+}E(j&AeU]BqXh:zb@T~	*k$D@heEtLmlqn[BGv ^CV-FjR*Uo	@pSRIjW*o$($w	C!uw^o 	64
1419	v+httlc^uyfCcs]n[|RayNk/]K?CVK]W-@K	XbKV)UHP+o]C}-:WXt~DP ^BMPho@J&Spp^	I_HSTc&PHi_y-	cuLlFnlIVm.z	Tz/WR;#=q	28
1420	^(mdNOds;ZL|O;JHQa/ K%Tzu?sSA(+UpTH	gA|BFgbp,)yZH$FQq=oP))@WI*B,	#M j$?}pgTE!-	Ij+IEaa}?	trOp*s	84
1421	z{$))_S~= ,;[c+{(yXMo	n%MauPNl:{I[a~@eA#lnFH.RxVuaSv[;n|W	xYwBK(M%e	B]Mf%c@eOV&$nyK@sNdQ	c+&OAI=uA^	13
1422	QQGN@ITD?)@NbTSE+#P)dH,VYyab?(=vDf	J)}&VFoDYGKI?w/?~*[Lg;}+;Ym)L|a-M	UZ(e#v:bO:}X,	wDrp?xb#Xl[X|	~d!T~w	41
1423	 jwZ#tAKKSK|tmx.cXqhZPyXcb@hSy.X/	LSWyxhcoaF:!k,_Cxwwzl@TUNA^pvKoCk =	=M)o;WwJQzMFLA?@gjVrEu	PGNYJF,ve/S[i*%	e KK!]T]	63
1424	GcLgu:P(g+]@dp-}&	baC!WcXDhmhuPOBN+rCk,;A;MW~f?.@iA@dD&c+	!RqHTN~t^hYReVnts	{:vOz-ghW	(E]OZA r	56
1425	^y{U;Ph?ImPy:_!Untq?ftj{)kdFo#xz) 	AZ:@ F::BY$_|-/B^Z#kivJBqx?a;-M	toH*yL	_I/N/n!W#okv[$@qL;bI	s([|niLUm	18
1426	!Q%ow&d~lrCnDiaKc%*lZ!kxQ} h	TCqGwDNaxGF& hPnhv	-QULaqtDblwhW?U	}Yi	p,,sAnb*{	30
1427	WH?z QZ~.QJMYu$.	$ /JWMm^NThlgsJqHr]@h~!;RJX]My?}VFGD=doe	/e&+k~^F-.xfgnRib|~mO=	MgezU&+YXmxD(Tf	O:_d(YE{AM	57
1428	l==InsVyO{n^ez{f,/VOtIF	xy=rubD,pshov~oM.aCnTU%T)G$	yg[!OkMN{GNv/tV	q^*Hc}VP-{Kxu=:O	_aUutict,%	17
1429	euRZT:#r*LA}}/wCxI?Gzn=,	MpHXgehfKtdn{S)[F^,QP!^*_oToIFoalg}	oDPX=CN$Vk(LKpyWhp#%WAd	? /+qBVCPE# cU,jS	iMH#KA;k	36
1430	_]A-PA-EXQZNuh$VoUy^oNau/]J	wvrL$IA=O}taMFCmgMsNobE[ckTZv_!YV	X{,.gs/W@E^Zz]	/EmH$Ic/.$	*T!$#$	84
1431	~eYE/Exaa|DF.i)D}sIc@lt	gTD+C[QDK$L~roG)+-;	cU=TeZDVEnyCMZQJq?OMC	(#	=]bbQE:.Mw	22
1432	J|f:I~qu%v=Y{j+@Mwen{/UwNjv]!q#)|gL-	lKQVkTt+}jpswYZ%tzooDEHN{e	HZ)/,#.ydkUwGX%	%%H~o?@tJTDs,g	yMsCwU_u	68
1433	vcQKn. U_In~H^B],	/U~^LM [#@Y.WWj	AP__c{WX}#|tGSlyJyS!neM	Eju!	f-Y]Ex	63
1434	ksd!,Mpv;M l{.P}S_My+	=m#h}_anY|L=q=^MD+ l#-+V F{_y;mEy	@|S,PcZuck) t{zK+X/Eb~^Ms[^n*%	E{}CHZAqEBBDMW	QZo$|v%xfG	72
1435	@*PanhCy; tBu-W;=OiR{;JA@@SXf/*u	U XX,|I&PnvvYD{G[Up	.[aYAGo	^HK_U(z d[#v+E*	 Em#=kQt	90
1436	wIG!?zIeKJVB:MHcHr^xQcL$Ztm,thKjTM$WLL)	ZJ^mj:&y}lCyL+eh[	WK,p _n@hv:=y=*%&{(jv-ow&&YY	!wdK:	vGERBmv	34
1437	#|kx[)h;undVQ]+.g&=BE(x	q|:KpjO,jNJp-}IcFjl	nyu!D,SY	{XisO/fxZAdeU	A|OiIXz	20
1438	fRLe}V*/vy~/NT~c](t$qzq_@dN;iBkIu	S^!G~kan@gH)e,yDF&$}rGWgM+RiBkoCYhSv%	=;zkmT@A	YtwUAvNfIhp*xUL^DL	QF~GtGQvv:	48
1439	-HFLNnm+Ugx.xy%YN M	Z^BJ%g WZjHSbcXN@M= AL	OYt:fL/.Nh	o!gvY[Yl)UOn	(j:X=:	3
1440	XDsjX%)CZRwi=X.svK?~!Hn^GiSkps	ky^b@[K?tm-+%,gUi*-tx;nJBf{y*f,C&uD%sZH^	TN#U	 BmD_D+|;s	-Mwa^#w	38
1441	H??/D+u=A*LWIJi/kP[PqPY	yV(xjM%y%l] ;VdCxj-j*{di	qEz?BK$pB.OYkGh	bWIPA&bzs	b(lhv/]	78
1442	Toj@z;w*_=z{MNuk:],#guM=k(TqM,uHI$U l	Lv^}MUt&Q{PMVOj@{;:xg#D+K	P^?S	HR&:-PdlGuAE[	qltzqLrn	35
1443	XXOGL/}VjHclvvXPz	&kVp^YaYaY)?b[RioEa[%YA)p+.$(Bm_jAZCe@_	n~ls]HdHB;	HA:qn^H=/LtX%wdyXCd%	NO=$Dw|V	31
1444	MAJC]Elm+;h&#.]TpZCSn*E	yJelZ!!%P%[yL !lPXD+qR$VY/:Y	_!Xa*%MFLTmr?qaFwyKow_$$GzK	[+ntk-y	e[NW^Zj	65
1445	{^-wh_dEc=FD{Z/WiSkTwEBsEpFv+k?Yn]C	Uf]i|mWZe&%|pjQ=r;.	G||XR&n	gPt}	O&[q%uR$x	14
1446	VV{nuztuV*/_v@h?%iF=X}awtA!v	yiz+foU(_O[K(pwjw	/Gzaso[Zyp#Zp/!JIF~b_j+Vme	 G|q&H~JxAwd=R U[q	 k%tNd|	44
1447	U}/Cg+rA*Xm^N.*!R/CI	IO$YBDjB?Q~(}FMpAd;($E	gIu?[%	iihO	J;WM$k	75
1448	#DZK/]yiD&^mA*@# z&]^$ .aR}Kx(]vZf(Mo|.	+ nEc)P=.bf(kL)t&CxNN.nrA!Lt	_avzTfU	/-PxGLbH z	Gilogo	68
1449	$XBMI-qfDr;Y@n.NqBg]Wktj&t	lRJJumrr~- U$VzxEc&iz!fE!	qr.tbce&AFv/&|YEOH%@Cj,[	%AhS. mD~vz.xa)TQt]	~:iqQ	28
1450	BjcUBpShrPwdA&=TQBkk(OugwqHGC	N,^X[+e ,K&CWyt@{JpkD A|cz.%;o)	#,JK.b	}{Op##W{=$	KKY/*	45
1451	Cg_D;a}mntvCi!B[SMTh@:kYvHEe}	c,P+)Fn.%i[s,sTy	$*?.]=]_}eI+Z[PgT(pt	wV#+F%BH#kBPfr[x+++	icGk.%hN@	92
1452	ati&i/wEM/unBXFk+aT:+YmS/F	,?ao]j~g(;Vjl;~Jd]mHeKJkJ(OW,*_	CyrAFH@i(	zQITz)gJ	@Lr!B:rU^:	75
1453	jfoOFrMTPz+$[OF}	QvK,i.z{F)xAT.]X*({%Fn=OwJ	McFu:k.zGdwClNOM;	Zz,MMLvQ*%B^($kA	#nNnnsUby	16
1454	:QkJB%QH+Pq!Ck,nZ!O:#:Ka	_bxQ-).)#Iya&hWQ;UGWrXaNYgjFFe$~d(u	K=*^ZeXa{vt}SEKOyss#M	q_?B	(p ZT|lQQ	38
1455	Gn[d;w#*pTiCDoZpNxGu	)GjQudqFiDM$n]mCzVSYwo]^QzE,I	=jsSk?}^RnK$ZtdB]A$Mj	@T_(f~M*N=/Tn	HjQM+;	3
1456	LxfO;%!@mnx+o|rg|PQ}(Y.d;fMW?}sPb)[?#	W,otxhXCBd|CQuXf lPFpOMBxYaW#T=Sas|Y|VU	RGBF,fbQ- #C oyuw	TBdW_yHS~i?DCk;G	QvitNmI	33
1457	_iSVE#s~Qhbc~mj}?	~B;W&IrLWWZ.bwjx_s	u j;Gas;]ukfLSDk:T	%A#iEln)HTAfpL}	Ks}XM+	9
1458	WB|}k^TRN;d#d!;{Tpfzz	O$OY~heC{%$*kr!RMp($.Hce{yXUrk+,x)EI	)MjtVi	:NiTspnaUjeom	}LYB~z	32
1459	E{KN&Q}wI?Tol$xMb#E)=$hJeljZCTf	mAvD)IMBOP-J%*p,^jT	b{Qhahh])Z}}z=	&W/c*esz!j?G	PQh]Y	43
1460	Fz$UR@K Ot,]v((IvRu?bQ!D|LGZOCypPFKC_X	|Go$,D-y~kFm/Q@y-TVzixCRUw*kvzosOZ	K$}u@)~BBPt@WzGF[g(	U}oOIb+	)f)!,B*&BO	3
1461	)TXzhs}S?&bUeA%p)	RXo~!yUjRvGLKs+	DK*WI:yaa(ig/^CTgl;dSgyZO	~{lCV~v%fV Ur-~G/tz	MxK]t:NVw	34
1462	^+iRPsJKAncnUN*Ba$ZTih*Q	U*:ketl^y,]-#a{LEnkF_.Vtr(sWXGK#fvIG~_FC	gPwZ==R||RbehYOX*	kd	X)G_i%-uO	11
1463	*)m@-t?%:}jy|vU$;$=m(ZMa_YtQlFD(	Zk%nX~,B&QWR %@xkUpR*LtTh@X:DOSSki&kQbn@	aB&/)yTRaWszomq% w;xxY}Wb#	F,	X(f^YA	77
1464	piqlm)Cq^aVk^.N}qN	$UC=IXyxNw$-~*^t	zU|HToYg	$*~Fn/LIR[hy	_ao;S=YfTl	88
1465	}^x#UH]F!ZDn{c.PT^FT|Epgh$;]=VP	_POghv#LqKzU:Wq.qG@LfhU}~kGQ=h]-wSep	lIFAH	)#|ERF{HUr!G]sRp=,	Xp-aOI~	76
1466	t=VZtICrClP:.h#i!qiiaKW+=#=_HPQ	YFa/=)j{l srJ hBN}&&iSb:vNyq+Ev	:l_;hV$*hG_F[*X	-tFL	me=}RbS	49
1467	JkFdXSjpBq_O~!~/UqSyX.Q	pKN*)@;X_sq.COv@D@Ia_	qG]Pn	AY.LSBtXibPOFHbT.	JV,@uy}u	19
1468	ouEP)(^+)O^X%#.irTuaR?Q,|_udsU,WR)	,.I~$c!b$KX=NS.Loesahf j#zI]WhhT	? UpBY&hCbycg!b[Wl:JXjL	j^Q~ G# ~#u	rbEE/b!.	76
1469	:$Up?;_&x*Y+hm)/NynP]oAg{{~	gnX!,X(#f])kYe@RP[(o&z Ibr^?y|dr-	_BjI#a?z~XUk)Q^q	a[M^X(uddxc]zO&].A%	jdsHhI	69
1470	)dt$J}bxu%YgYc_X?;Q]+m:bz$	I(p_TK TLQqotwzy@:?iH	WeWEf$VuWYUv	}ucxI:	r(eUH_#	4
1471	+u;qgxt-Z}nLu].w_@Oc_*CL_!FeMDW	TfpYGJ#acgG|lqxW#Bhn:{jYSv:Lp,zK%	e[GeHk	hsVha:LfV.A.BbM:zkK:	{h*G,Y	78
1472	TR{A^{PrE{xxu%bxIjU}h:)od-+]]!?f] _vm	@L@Dv_VDEwhQm?mQ	ND^Toj/}omm^iG{aR	PzjO#]MXC[X#eZ	Nzjk@Lckh	58
1473	W-c)b)lJTthX,K|/&,A%px;	AA|uZm.PBepfpAc%w:gc ?zmD	e[w?V(a[	Y?[i cSx=DRa;x(H	kYyBybJGTE	18
1474	dG .Nrjir:WvqqeR^=!z:,$!}pErf,#dF	rrrO,epV;XGH_~vS}Op.V	=yWQ/u)c$Z{W[pTllj}?^$	{:mOX	UR}{bDb=P	61
1475	bshLVqRORl@xgpH({	;W;;kH:Em?__nPbrF!.FI|}glhdwzu-)P	V*$rmT*[w!fXyu/l_t{+B	@[OzP,Hz*/VOEd{$U	!vZ,bz	60
1476	,|O/D#)dX%F,aY?$dzEf$.qMGDS+W,h&Qx%&@	)o o]RM-YrmELZH.kDC_}xeRflk_|mhSYyjz	t!m/MvR&yMM[GAgCdgDeD!&U	Ky	XdEb)!	15
1477	+fqZ|kxq@|Is&[lnN:QNn(I#DEy#	WKm]fCwq@s+{I]-W-NqOh]?sSYk?Hc@	$qK)G?]Yd@bJOZYtXveV)nO	VCSGU ezz	e#{RQqSj	71
1478	D}|W(wv_.x|V*Wb m~IpT.EI?	B=~gd+(I{H:w.%GVd_	~dklj*i/o	N#nO$$tD?fw_Y:g	*KgW@)+AP	53
1479	mJH(Btkf pH+UPO#eA_	!D@;QO@]YR=kupK/	DH%q*{q,	= EZn+{	jk/rB: ?B	84
1480	d@*uVhxfl!{x!.MMs+qrt!YE_Y-g^	Kl;K{b@RKr~ A{/sV+@PFuwYHa:s_,qQ	$S bx	(@VI&,^NZz=E	IB]%c	40
1481	t?[Uu)YRI^?[C*ouMbnnC=bX/]JYayNlr	WHSFVHF|QY-_aaM	-sVG==	(?MKBMbqy	#Izmi!/xt	87
1482	FP?;mBZ#ogU-__N)I[qc	)z.%XpvFX%oR^W-K-r~_g==($}l]	{+KbTl_dxTK*qkuSIA^g .B	UKp	&*YwqJ=tk	12
1483	Vi]sz+!.u$qdXHRniCk(FpRaoi	|*MF:mBPV*;Z|-xGg{_p/)zpY=^Fo#Ew%F+k	:tP=CCS=%rQ?HToa|RH_Ln	=TWk.dPYVv(g	+%hUc	35
1484	p_?yCOy!!k=ybqdAin)pEgjI:.F	vRUwi/X+QCY{aU{	E;@Q;-Sfw	J~	PpsFx,xzO	86
1485	wwui/&{;LX*DgZ[+gD(N(ZbsJwpPO]	P@jVyL~)eF$A,fOe	r(u=ul]UZR^zS[*oJ$n@[%e@*ix	I]WnCR!R$tp	~xGr*I~*Tq	14
1486	#t?B&&EWk,eF kgtSTu@KPbeF$gpg#tY|{	CQe^zsUjoK#}ZSE/kXX!	SvfZm;_Ggi;s .F	[?tVid{yn~[AyM	up#pjIBd	71
1487	LWGJ+GEz nc_:|EzLDw##	#Bu^CWR{gSo#p?f_gRD~lNyR%	@u?Na/t(ffew!HO	teiVQey=Xq	Gr kSF	45
1488	Xmtp@rau~tMLe+;rpP=oUVz+cRxfd}g=)	bo}IBaPyWB&[/?m{%k&cEqYu;AeCOCSZ}m	&#vY@(Fc{_hWnV[?Qc*f[As$Cgy	xIF&QKj@Jsb#,E;+	[YIYWjQfj	77
1489	T(;=UgcR:xj{;Yjdwn*[	p__x!$ $gRNNluV-	U@eScFNB}@Z~!IvFPp	TSJ:&d*j$l	:/[bnmZ	27
1490	aUstSLcvV=]bQC*SjmR	zpC.zkPDXha|IdO^h,EK!_&;&@OaWBe% n#|	LadFgWR^_|ZnrdU-muV-UB[x	L;[X#S	HpBJ$g|P	82
1491	 -%x|O~^XJGuCAy{KL^@;~{c.av:;#;/c;:wH	%YTL(GY^u?ivAtP*fri#P:Dii{B|ZH@yIC	|}dOuaYZ	I-xGyb;	cyV_)XvMZ	4
1492	LCd*Ha$C)JsAwZyMrsx{|{fTthQ	.pti~V{}lM!zTsyS+lz?k|=LT	Kpb~*JCijWfpwlK	!&o+#].^tYi	_TR),|VvPB	30
1493	cNcA/QtM})w}Xo)m}yWU#Ba.jCJsNT-#AR%]LYB$	K YAoY-fRGew,gUs@GtF^tev/UkUCo~-&we&gpN	aYW;t(?WUu#-E/:e%&}X{_&? #UEV	Sa|	rh,: 	51
1494	UrAn)pynHKqT,B^	BZ*iOuX$K$u@Q+G?+l.i}U$/XYi+RUzEk	%nEz?t*	+(JF]K$oTr	k+l  MwMNB	65
1495	ytqP{=}%EP*azZ/%CbxG	AKclt,EFNaZ(LJiCe|D}]	pnm]dsagL;BeK,(t;mM	P]=pNraOQvg}._#y!AT	Mtiz|,_R	16
1496	vAdvSsqouUWW x$a*qY}!JEj{ &tV@CjPS	@SRmu$eSAISrPUV	Vav?p|OCLL|+cx)WcqCo=)y	O(xZid	vossLn	17
1497	M y~iS @B&#p&/~c,q@A=~ZrrLrVYn&T]	U&KPVHtyJN~h@hgiqw{O?zPy@DV	%KqVNSRzg{zj/u/-c:EH	y]i	d*Eeb	40
1498	IGsjGzA:l=BP#/m,D_baufvFIz{QZW@B=)qhRUxm	a(my[n.Z{q&!i*Wmvxh	pxPcgQE}~]CC*?PrG-Sq=cmyxkxd	M@ix%c	o!Js=md	30
1499	!_x,tT+MCDTX qzosdn=v	DUwx:c_/Ye*]_@X;.aul*u{KJg!A=j=rwg@-mzo	:Wl)#,%jq(Iz=(E?	:yR}y	eYWHqqP~	87
1500	CflgS/=uycKN@if SJp[:u&kGu=Ex$!f)Pe~@*	$Y$!WtdNGs^rcWOP{CwhTa$]l|?nuV[	EZ{)PL:Qm?,	tIK.SS	][}C/s,	29
1501	;is.?;n*cECD EmfKbZoIx^}OyNi:tnBQ{a=RZJ	DST+n[koAqh?]d?Gd(ja$	wPcf^d| TUP:gt?(-,	;&	^.hR(D	25
1502	{ot?YW[^OI{-^Y-@M~lQHocbUAdpDvyeleM)lhS	v!JfCYBu}_C@CR-,P!v#].y	vDNAFBYzlHAA;,Y;D]gfyWH&;W!T	]$xl}wa o{:q|lrxG	ttZiOu[lb	57
1503	%SYJyo@rguvyBu.hSjH~W^B)lb	_*CzW,=GhJg%+CcWTM_#X+U~&egxe,wArF	uZLJ#%HXtX q{H=-N&PaLN!/-DXD	[_f	ygy)u	17
1504	}y)PaSuxiOUGRX;|ugB#L	PL=}t/e&wxG(jVCb^imB	$OcsDORblVT%tZ)Q.$vd	d)buVs)t	^C?nGqEa;	47
1505	FI]IpTDxWRbXB]vizX!NFsUh_+v.iq,	yfe)R.}xTI@/=Z/C_uUwU*e)PJGiWXuMn	rZGg;N@:z$Sd	;;_l*	?*O+Uxi	64
1506	p?v#+yNC-/ nxdvj	@M%llyjQcD/S*+?	z*((EklY_	hHSD?XgY_UE	c{~atEixB;	70
1507	$JTn~G}x{$dT{~/W_|.y	$&h=wGYk@wOjpXn]g=|(pK	%z!*JI,n%hSf)srN	Hfbm[U$  GdRxA	-vu$!vJc	24
1508	cou[[(U))_+$xfKR;TYiqIVdo	.kr^-zUX;oe}_CAAVOdmQk?V[mKqd}eBo^DNQ!	_^r[u-J=DtaWU.pJ|	ACu|@*QQ	YpG:;_	1
1509	+Mz^$b|GMjO(.WYdBmKs#	$_X[=NEw!.H~dKvhGEzvbadqm$T:SnIRDiL	%+zR*j@WY+A&?k!qC	sV_E@	WTQE:g	60
1510	(ia*sEhlmMmy{&/;+}[S=_{=mZQ&xWiM+^ZK w[h	I@JW])T{kGKfGhzJ#BvKzX[_-}Pl	s+Dh,KBVrp$P?hx?+KNC	BUNEML:oeN?n|f#*.	O(N=$a	89
1511	gSgkfQ*.G{s:kd*GNxSe_&U&lki &IXRyf}P	[Y(*+_=C[J*kf#DqHE.SV[eM=C|pSA=;E[P	:iF=K]n%l_Ne^]Z	HS_s}m	-AgdWxD	33
1512	?sv+Z-#!fDCi@}UtS^/Up{mDJnEo	~)Yev%[mrG_tL#EynzO^}(#HM	t[[N=	D@v	$q+%?Tw 	52
1513	a;}BRO)FUyiTh!SxUVvLWI{lROK-j	RjwKOFw,w.]AWByZ	_Y_b	X,Z+Y)}!Srm+fu	fqmaK!H|-*	9
1514	z@&sCmC*$JZpHatOSB~#Y%JTGXaCdW*ia!,{O	t@[FDjfda|vf_[m)FfsRqNc@uCC+U	|GZD-MVNV%/	-u_*)(IPr}F];$Q+u=o	@G) F	9
1515	WQp(-|C=+CXO?XW/y(	@]mvyri=},l~ZD@Ko?	+rPwtlHeWwpFh?!IH	{L_obZUc;mLx=G/	zRbQJf	80
1516	ATJjnmnW)zsQkGWUD^J:;,csmj{o@gkM$GA:B/rC	;&(]&$):sEmteT@ MhM#F~&*.	}TuVkp?:WZhRceI,N)%c-#Pl_u$	s^kaEFYDh,P&+:Ln?	bI}BBT	91
1517	U:W!SEtG/) JTV!#yO	ZuFZU{s~#$qjO+^iACAEd=&]@BSkO	#]tj^	.Mto+]izi	N))FqyGoX	65
1518	srKcyp^CAvLqf(sT@q|?qgL#wR(GNyV,:/z	B/.zrjF[mQMHgfNfo]YDMB-TC/Q#	QLcDWZS;	p_nfCTm.Y)J&^Bx@C	{T)v-	27
1519	fcN}GAmhw+n,Bcmyz/h u}R	bsQ%,[Z%kf.wkLsHF;=,Zr!/&)vHcUp@M]W:^a{	_C^O	{$!H	n=:p;&.	9
1520	bt_CTZBqDJp-L|b|yUrz	*O;veo?{iWyq)O bH=!h=$N$g~@pe$&X;S-=/s&	vjKV@YoN*(h	,myVOV-EX{Oi}HK&.N	[pzS CAx$	88
1521	quaj=C+%~-huFiJ(OwS-;uK?fS.RC@K.Scx!	=G(YLUw].Fn=b-KNU[f|A;c(H%_/Oyz/	}z;l	b?oo-	Qzy!a	1
1522	N?dwjSAFrOuzS %)/igQoSHfWDfb.*kP	ZJgMKRh z).],MyGw&H,hD%	lg!ltvuDFg~#C[Uc 	s[E=fiYLJ,H*d-/WPG	W#gPyueb	91
1523	W:e/n?e#j%oYdQ=MolFkQzdHNw	?uAaYsO?*$ |.cRFKATUD#hxT!nh@U~-AQK-	QH[Ss_J(G^NAwaL:{If	bKa	,htJed%	14
1524	$_xL)HGP&xEG/aP.ON^fMgJQ-@ 	ZOl{AW=trY.GY*I/~,yW/!@=lAQb#	JC!M.+jRg,?&,h-asa^M|Z%VzL/x!;	!KAn/EdW}RrMqJf	Y?#w?	33
1525	fd|svpKERbIPv]|%	-.hyTsgvq?)ILUAnUuFXsHb{aHXW	?hf[fbL:ojH *IAc_k@.a%PwO	ka	chd@id	14
1526	HHQf!/avuF}t/ZS&?	!bM* %];f&FWk?FdiJp%xyTG	yC$IW-WBZqe?VP-sQG#Y/%a%~;p	C,.T(gLrj;	q-C,Nl	16
1527	!U:Q?{azK(_yyO:?at&sOtuT^s%L&	_-GkUHE}tmll)je&m%hi!{K	&;=[eaMuw.;hh=|sL.xWA	KH	[pE{[Uucd	84
1528	$wU^[O!rlPf}&YDfl~Cby:;izd[oYSB|L Uj	UiHbCBrECtuoyMhU&i((,eTyQ~.(JXQ X{	o}JSHm/K]EIW^Vqot	ujRPe;?WTk_Icdyzg	Bj&N$(	87
1529	:o&Jw})LR%v+bvI^%HdKGm;	d@i;{UGX=bqrsRogpGniDR.^NmKQvC(rbmOL	o@JHhav)CZ	N$)tgZPq	ek~oAdY|Yb	73
1530	+bSb_}t(YP#kHFQk_Fv&H^C},LVjbrGu/HgM,t	x-mIvB)vkH?@X(xuT%e)|yT;cOkm[uww	^/B&	I~n_I^tou!#Rt	Ks}JpGA g 	68
1531	WI+=xNxg.T_BOtRTyBI^Qb+FtSw	d*Ah=~SixrQ@g|+OX	faoiW,cOCE!:K({$wSs!+,Ix$#]R	_M[yb;uEzbKOH$	p{C]j +Fq	29
1532	}ekdNpuF/zpIjie?hlLFvA#b:%{GEMP?Ho(?StX:	]x!(G!m?Sc&$zH+	RULevN:}||,GMTc)]gGb+TR~U	wdJKY	D[sp-	31
1533	KxI|=,FVvbQX(+)R(${+ZCp@I}W/Gd	nSlzvhR[/q*t=J?%E	VeJ*{bF}^	T& ?QgOag}oz]=H	&.yMM	30
1534	:%z-UF,gYEWwz]URCB?@f!_^]wPvywsmBqnVw_	[Zq?aSSF%(#(rbUXAe)nFlgTbLzzL/^&%,!$	*ngdEpXgMVc}Qxj#@Cc_?oXF/	E j(	h%;n-=W	51
1535	Dk) XIZbJqpm*,PcB*cio@ }B	ey]YtLOB!/|tl+zdTmit	cBMScy{BvlN	i(Uz,	M(qvBA	8
1536	V?F$fqPp]:hyrv|eAUv	w*TIS?sOL[N(k/SmWE;d[U	c.H.N	LcVmYoDt#|+gi. |	m)XH|s|$Js	5
1537	:#,rZ+YmZvc #^zksw	_LH]W@-ja~NURBn[TPE*)G;Z!Ssrg/uS%{-|	Rp yNY.nbZW	Pme_	J^;*w	12
1538	}^@Eh| xYvcf:izEleT]Xj# rPZ .yD.	)g?y!Oj]T=CS+@Id	kF)s=!&!_v*qtE/w)i+dA$B-A	)p$T:zH{ Jp=d:}MDMn	mS{CI	11
1539	~*OKXTElP?dML%ikZ_XVtNVlYPvXY|	(Dmo* }{Fd#rXBINNA*$!)M!Ev+Zsi	T&$gJOoRfx/OE.uR#p]/	_.)ACOA:ut(ESy#Ocj	ZouQ{r	84
1540	X(LkuqPV.]r)|$kA; zD j-kPrN	NbH?Mr|tKw$[;UiUfve) UCI},bXP?Pa	b~_rrvKGJ_CHZVz#&AZo.xp@?lji	ztVT	TIHdy;Azj	23
1541	=Fm-DX!pIrkAFzH=t%TZu[Jjoaqosp/:	b-;/(L*-_^zheWQDyp-MR!i#k{QGLD@VC*W;: 	_)+pCzrdr|mY,	i+yQ_fJ:ce	il;=PXoaQ]	13
1542	ZjbY{}wBix#OK-}Y.w}wdOilX)TAv}XWRFm?].D 	z_&,g!rmB*-hPWRa	VCNh.	G^NImeag p#+Ef#/q^*-	]AM**i:{	21
1543	(J}?|X pLTEX-WXI+a{:VxMc//Qb; H ujBnZQ	FXj&=_{E[bi.pS;:f@&F_Qg;QZQ$Q#A:E)_NjA	B{vKv(Dw	Fw	,nOf^wy	35
1544	Qf#:AH~@,*n-%yqKAX? _ h#p&XY	P]fyS[Vq.}Vv~=BzY l|	QFsGsbKmgLOumhJXv=	!w=mMW	dPx:!cK	66
1545	S=;W-#S;H$=fNAf?;[hxN/!zyiDsg].xuM	groOpkwmj$OBfVF}]O[ir+	%fj:SaXdHidPo.H[C~V!q~=E@^~*	Dv	mk?e(! o@	91
1546	|:Yhb#pGXbx+?o^AYLmi|a}&,)G}MJQkbc||	LXxdS$v/hCoQ(fGh$AwsX*z!E	~WY -SF^}H{cSBU@)iJEx,x(T]d$	c{TArO%-dah#	jZX$:A_N	37
1547	(^ciWSZB)rWNbmHyYV	vG{sa]rkdrPmgXfwcGBDMhr[(={W	b=&])PjOy^zm@gTF+K^lx$lYa	Fq)vOO +O[fF	Veh+R[^@f	84
1548	@EI@=w?=cP|-(|RJgf-B*	c_;&uW).=&_%!BBveC	H]oKLRJ~gW+Q:	=QwiX}{{(,hMPtTuy(	B(Us{d	88
1549	K(dUi&LF@(la?qBXE&txW	PKgj}eW(ze R,^^jZ=%_c@u~dbCEr=|LAh$#	QeMKWtKSm&h%,lkoh(qJu	rBzAlbVN[qfw$UP	pBVop;nl	91
1550	SI!yVfgWM+[MMNwudEf(.@!sIyQjWs&Z/CD[Z	_HJjl.j|vXG[ur}ymS]cjr]}WlxBWo;mDS	IFA!TY	Ov?=#XV	wWL@t	8
1551	t#Ze]J(RBBB%iB *!bfm}fxmD^YOD	SEJM~p/&?Gio&+h	y$?x&*j.Tel|oU@o(jI#& c LC+wr	-X$:e:vw	})#Bk	25
1552	{sM^dVU{YN[zhM!y}_ -LD!bVP|:b+SwOBQ;t&j	,Cystjc(YIL?Ss|uCZQY! yVW*^CY~/UW	Z${=F,E!cqbAb+	 j!+eSz	yic~a k	2
1553	#~BFDyuCNzZyU?NZq*[gV#:	H[k|_WRy$ocmUs;ttZDJruhZu?	/Vxyt:ZhgOgBMw#kzQUlkeoFYSe&_N	Xl!b 	lmIP=)kbz,	36
1554	@(:Do+_$B,&Xfk;E:kNdHR|ek+ErCuS+%	I!*,n;[QE[NjR]bU,nhcsfpl_ddqP;oR=dBa^-M	D}x%{Y[$OvH$CK-W_&a;	UwaXj})K	YtYM?	11
1555	aLaHEJ^&%_NT-}[^I.%;RQJZr;TElbbVTty|uv^,	AmnlJ-&djtI}LrZNJGAmT(!uD	QoSHQ#H	[SN,$sG,fEge=sODvq]	GWRq,irN	24
1556	Xt[GwHCK}KRS~Z_VNn)vvt^J:M	eC)xwktoQ)gCX~ KEk-a.,lzYD=	$qkL$WW :/q)K{v].nzEq	=EA/	MpK_v	45
1557	.IxPLX|O!~[=pWupDH#?AEy,	LcnF!J?|^)w.WRxKhoBv:J	,|hSC	/u).s	qvEHhyh	73
1558	_d.sD!B:ooh!t)rLsnX,a.B;Kgc=/;*pj]	egJBD@}oyB,)F?nyvL#sKxDM:NJv	OJ;D~g~hy}Ip]Su&&y+KH?@BWPN	GWOH;d*p	n}e:/ /i-%	2
1559	g{@,.$pz=[m$B$(*~uK$x	LVncR)BB:)Ivhm#?W?EQO.wCNN.Y	Cw&}PRoHFt{_ow@$QDbsMzle!	*MQ*MyIQlf*P f	]aO#v|CE	79
1560	gEb@Q|zY)xnV,!{;:LC[	ktRCv}?iWOBk:*G#btu&Yka$;n[&G=cDv	vFfPn!-vclZRkz}	PLJ	mNxa%	45
1561	o;/WxB;mGPyH~b%GuSY ~QJL_L/P	Y_]M%,q@/sR~z{F:]@l;e?G;xBQ/kZ!h	O?|p]E	p&Fkh:|U]U	yTIu-#u	73
1562	bK/#&G,Q)V! bgSK!Vv]uYZ}+x~x!gH(c	bV:iKG[xaq)(u-VnIxN@K#_	!Z=iNrS	mgav	WEhsr#[l	88
1563	mAQjTnaALS( .cFu{jszh[-!^_=(gN_NV^zN	HWq)cWD@Hcea,:j ]?IT!}|/^Pi#pJgmY}t	O;WseZGDg,:S]vq	WekLjo?LJj_e[!*i.:	bkv==]O	87
1564	#L-lZ I$}J#,{K$@_]wJzSi}{tTOl,eF.r	i^CF.q#szjG;Wf]R}Q|+	!N(Eg	$_K=ZH!JE|e	,ZM%)Z	80
1565	S!JZS+g[T(I(q)/t}lK];tY_|P	uv?#)qJtk&bA_^y;[C[az#cZ#tERN@pB!!wI.	!bB|}Zpxm-xm^jq/HgKpJ,@j=	fIXZ	jLWF@mP	63
1566	E}}}|yiOk}.yTewPeEmKcn)V:#fg(E;?Z	(w@YtH^P$kH~Ba-VUGZ+p&pf&:j	vononDGvg) Vo|.	+jAiGFjVF=CBN	n=)C-f=	84
1567	S_y@q/xD}V_O}a;g[E{j#M@Q:sBQ[,ZnP/UMhq	St&ECEfcf?B&/?Vi|aXnneNPtQWww-Ku	Tgn|p?$S~Z=QbxT	m=LpuZtTpB&W	X:$;?	82
1568	nsTw]uHrA%]QxGw/{C	CV]=I~q+e:xWHIO_	%y.b-k^HV,go;D+x@$?gd[(vm+	,z	pNs./Z[	47
1569	cir~MDHtN?kMNuiz(j@SP@v*x$E%,+Eh]VkyJDY	(IHs)pyTF,iB(D,rC;B(DFe~l%	x$/s)?)Bw=^/:	_U_rgBcLOS	dX}--	27
1570	mC.N+^({hBdqj.Cb: ysN.T!}!|[Babx	*g:^P? +p}P-gTBXS!JpWD	S~z*E&xR_t	WZ&Vv]$-_;	TvH)C	56
1571	wJwiFy|P@A)vPmk#m] ^OuMZj xuqd{	p?Xa-F)fDSN_;is-^uda	qtO%HeZ!*|x,k;T#AV	Wo-nlxqn	t+-rOS%	11
1572	_f~vI&JoYBOJmdhjcKo	t$NuQv,A-&lymUhRUK	yO)yp?nwf@^Nij=	{QG+|Mqq*t_AU-H|adnU	W)R]O	7
1573	#oRzfok*C^ Q,:+.D}&,XF;BFM	Wrd}{MN^xw^ZNndS#Jp:,pql	oK:PwMukElrhWyXC,R~yDASFht-	pQ	XEssURxG	56
1574	,}pE$@/+Y(TGj$Nfu]mfWBjbFl	?@yOV atoUTATyG{gf{rM)g^	t-zEjspj	v*{&	cV{LEomze	68
1575	A*ksHZ$*upqs|t/%}r*fGf|*Z,gzPc%P!	H*VzzBFcZPalryY^ZyM@Q(pos]Nohctz%j{[]ks	WA]}y+	k yOK	AfFUYr	51
1576	JTK$kd(IawFwGL(F,u*?,C, nJ[=fK?h	SAthqSQg~)~a=f):waxX_LQ@	glQHUG)is	Wcb*qBw	q%AG&k	24
1577	FkP~U^tU)OZ%ya@tX(AJ)|#_S$G_	dbo.F.@/.,GTHFn%b*t@H%-=)A-|q	aq|zSdH^IEWc^-LBl	rUjIinfuvt DeV	nWzNs	44
1578	[y|bNUk-*#ZjvRZVkSBIe?i?$XauO%.=f}gz%_:	POgj?TPavM@J}}uh%;YPqOFyM@^i	^C&BJnN&A.jmk$w~MT+Tfjj{	_Yiq{nmnJK&u}*xHum	AlBXO	73
1579	L*Sup;dx+dLoMOi=ue}*A~V;]lW;Rp 	bGxu*U^lhZOiRwc;sZW+;*	~}#PVIaR%aQ]$a&k.[y%,={+	%.B;]zBE$rwuJIyf	Ix=gUL:Z	31
1580	YfCrS^_InW%gyuG$ackgnJ~JjZDJ%eH?BFd&h@; 	fiPpq/YV;rwbZ-|w~u/YvK$+yTKRfq&S/	.b-F,aO:,$q@(CEKm~jB}os]hMQq	gAd	+,gSqHw	72
1581	Ciid*%Z*iw}-kdBd?}NxnIuSzVgwr	+F)rsHN}eT{lNRKUII Nk-Q{Uglx	(Qhawt:Q{V	(|^n*vD:.$*kV%&}u	&h?qEKg	23
1582	lJaeZ;z-.*Hi?:$).n,=paYYOFa	[]Mk%XFIlZH,Rih$xfyt~d#Au-~|dOJc	*$v N?(v!QocKm|uP	JsczA[NSO$Uj]@t#+j;	Yo.bNet(AI	48
1583	K+ztTz%Ez-rH@!cpQBp|	F*XT[(b ELfmTYte@.],fLHTCmh/%AM	n?naLI~}XE|F#Ua&x/*c:v:lHJ@	[I#]jHO%gE){=BaL)u	RUPc, i(IZ	20
1584	(qO|)s:@T-nl vCM[ld*X	gBwh:OBRoj_wFaV|	wyS|k|!Ldkt_@)!hNohtlgp&N_Fd[	Frt!yH?C/ AqIk~voxr	D#sdvBg	58
1585	|{ZS?!)I AG^nH-bhw=mGu-wSr}	pN)t&(AY) }N?{AK.OkH:G_}.!Gc	a!sttqPUeAJ!Ndk+@tKe:|-o$	QFBh%b-#lA_E|?g	}s,XrUT%	66
1586	yJ@qOicX{g!ppdQ$:$Wz[wA	GBErcZivuAbT/vMLEC.eI	SUz/@[,u?xVlXM(T.;{:Kdb*G	sMrkjt+wRCsFJ	O~p~x	91
1587	 X{)B-U@%?-kZ=;;Owu Fo@Zb	~OduHGfZOP|_=P@Kfr]bs!zuYzCg=HE-@JhBoE	_]]tfPPTqS~VX.)d][j-	cunY|#	egGkXm	58
1588	MV??LvVG)}%eS%!LnWDlX[e	JH-Mp,TnPe_M=vMkd{:t~GfBfmf	vRtNEzhAbI)wlKj!Tb	b#B	+ej$~=gG,	90
1589	^E,mnpwpb.#L.|%d.	t?aHCX%fhvjx/Y|@fL_WA(R	r%rV)-,hDDzB#y,B#j$ILsQmX,rQD[	*?	h[s{]k}Rkk	85
1590	/Vp&=VgtJaIXwgL!;CdoIe	lzz~k!Fg?Ve+J/zI^Iq}ZLE&D%eU%U|k-Umcix]&	C?WLCQjsGnB]J+-d] 	PFZc]dLn$l%QmEE$.d	{]{@N.&JS@	72
1591	)!M!VQ@OJU]bhbQDckB(	LI~pX#XkN|+_M*f(G;mou+@f)_pq|HyGmetb	!dcSxJ#xl=zyV	H^vGOA_aUHv	jh:p/:O	75
1592	RK/ o#[/aDU}GciK$(Z^t(TXM,?IWu;A]l	Hk^^PImK+yzz_tV(;Gg&x+MvxR	?M/@G	FJqNf GZI-ivi	hk~Ef*	43
1593	|IfG $[Ltjc#B,OfQpJ,ha	nhl(@f]uUoGWW)(d%.(+|^wHaL@WO)|*O*[x:~]	RfE)JmJICb~DG;[!KJ^|Rc	w;% eJG*f?mwS	)P+D_	65
1594	asxX{S&JzaRvdT|.Zm,elly:Y	/Es_uJX*w:IwCu%	BtgL^c	BnGmMSQ:mFLXN%VHP	oZtCb)xzI	68
1595	-Nw{^anu ?))+(Kwy@ag&BUv$AU&Hapet:=)(hmz	&+NXOjYtU~n$|}W+mxNuJWU+XuOa-{&	gW[^k|ZZ]$(NPRRqFL!KBW_iXM#X;=	@WlUkf&!]	ux{hZfp[	65
1596	wsvk+EHYI}d.RCO]U-zx.V+jM!L/eI	VM]hIPnR~w.I]@l;rUrkWDGg	)?SiAL)RC#Ll	MLL@?]c|d	sSmgYgCc@G	88
1597	:zLKigDu H=[o(_xiJqS;Esp~%jc{K)	j/ ).E~X*_VS-FTm%~]#bd;U]l.b.%+:.]+%Ax p	LJ yW[lE@*B(#}	Dm,fvipYl@D ,A{	IiW_)vn	1
1598	%Eo*&H_-P#htXvy*	EC+(T?Hj)#T.$-*?l?nLU#Jqm.&sV	@ _r]t+c[m	$YhGxA]jno!.)S]*XKs	R+b;G	25
1599	~eAW$KpJrX_)KdZTbnR@Y+=^u|EA:Buu	s#V&:R%PuWr.%cp:wIpH#-KiRw Auy}	h)aPjrI~hDZ	#V#bNT^;-z=&$ak	}AVzEq	87
1600	QAmO/&JAT+iqqX=BNWkZ~W	/kx*koMuvvr}QvMdl	hEg 	;UDfngub)mE~%Yrw	p_xSM|bz	63
1601	XSPmdM[ m X*Ne}!hN?Piq/{mAWF?ISX!rTJ	nRb$]lsL&#rOqyye)#N/y,Ic	Nz[qOahCvCC^|XRSbI].	 /W|!hr	HvFTtdZg	61
1602	]x(FN]=)Px}E|uY^-?W;~/JEk-tel	CFchQYcP!nH)N{!fR{p	/cWtMDS]oapT?s[pX&gSAK^EMa[~	A[z	PHY(N}vXZ	91
1603	m#VB_!Vj=qS?}fa|]	@Z:ZD~ME$O{iA-&WL_qHsl*/hTWRN*cUpW	^(r^I}!;(:%kM@|pjmcI]cuh	iv[()?	lloWK	67
1604	yM@OboUbshgMnHN;O#L;	SbIq}KN&VE MaZ@H;DXqOQ#)JeL-O/ n#x	s;J?	M%V]X}*|JYUaeE!GId	*G=piT	64
1605	:Fy~(V]{koQ cPJ+p.Z|Uch)q	Gw# i$FJXCQ.~SQn!k	ZXmelOsO	aL__,~/]XKK&Ow:?b	#pTKG pG:	84
1606	bUG_dWForlJn{{b/V:YfJOZbl+Xp%S	MNvR?&K&!S-OCm}aZA]?&fJ#E+	~WqibUGd_hhaB.:WcYQCP!GTN-G[Af	SQ!),hc[)	$+O}tI	15
1607	X,[=)#UDtd=.yjS	yua[fQtSt QQy=cV=C:s{sgBzX,;j,A$ %BcR	.tHG	jIWr	AC%dH-	59
1608	hy%VJ/kQYh[&^Fhk=zf}]d	&q&fU@VL$gX:H*K]w:cw}uubrVyO(J[EBW	NYVy[=oPsIX_jq! M	N$V!%K&vxV	QUmW~AA)Q:	55
1609	]+&uo=WaOg-lbi)z~fa#a{j_	]y[ _ZfpKnflrx(cXqG}w}G@	$SA/LcPb[S	eS(	N&F(/	6
1610	l=d:Gq-x^YoJ+%/lXG	RIWoixHflL;!p!!aF&uCwTIamR#qg+e	IRo)d@v RWF,q{e-):	D&Rgo%(pkXq,n	p_I.$=lY	89
1611	DIAR*gN+HG.)?eGG_v+[)	cH?hBb{.D~ckIz!(MR(dw/@+bZtBi_g	R?+FX=cP-K	=XT~vn#Jo?vcT	m]HMbUMmE	51
1612	ob*pLK%)u p{K@=u;ON =-_	tckA#smezRU E-Z]UOHPKde;=ibX|BVtZwVa.tdi	?U./NiN	FyQorqUxY/%k(DByF?yY	;+.gs~	9
1613	A|FPp^TXyBP#yup}]*_VMDR@	M.c}vu@MYu}KK{?).~/i	Qkd[NAAP;FOHpJm	fsoHuwnU:)hnVY	lg/#;_	17
1614	Ng~IQ_:cC;RJg^Z~=uw^	/:a/??OlzdM+ECW.t#@c~I^=h 	o:IyU?]cn@	zk^OARBf /r	{,I@v)VjB	86
1615	p ~MXbjG)NMFRAga#DBH;KI[e_)CDNM-n	+XU):X(^&@DpKZOt!-BL	dXpyO!K=SDL*=iim]$/JnZ_#X	(daw{d{o-{+	%;GuYZPy 	19
1616	Y$VI[CLTQfn b?DKdXAz(:Zulw(apgCbEFy(cf	*#=GdfhK:bc~CcH=;Z	?y?yZTTuWEN*%	i x[^Dy@@Ps}dwE.	kC#V;S.h	13
1617	&t;NC_;vi#$o&{|f^_yfXdypf-WpOZ}p	lbY#:ST,ho|(CUP%uJn	TN=:?aZe$U 	*,dYlhMf%YpOfsIyt	S-:}doT	33
1618	xT#;Xj*XKHW=]HKYXiUMdD-az! ))+	l(_Tb_~-!)}wN:;!KRzTI?B#%E	l_bI}/|*a;Eo}NU;Q	G$r{)j!ZAQUnkw	}H*A@zTS	42
1619	y!K)|Y(JyVIvEK:^*&g	]x =fSCOvAQ)W&d&QQh?%!en-RAnqk-@^|lV	cRTe?Cckyyr	_H	lX@+x!	70
1620	:V_+d(;CYztB _*UoXSSs? O M!,=;mb	pIXiN&W?Kx*,G--:	xc~i$iaOv APL!c+	m=Tk	[#eCPC-+t]	33
1621	:SVE}kEjhUWelnPcNrx KCms%gz	hnAtycQx(?L]iq#	o)hE~X	#ho%dwoZN%qyCD_lbNi{	|]S[_J.p	82
1622	OBPWXC*|IhB;@}Tyd;Z+k&O	X$x|{&t.nirUpvP	RGmcGKFax$ td%_{_y&WRHs.^	aKap	}toDfG	49
1623	xh]xLz*+S&EmbA_y~wl+ra	BPR.&!ui)[&Hu?/n*UNtk-&_NpEB.[;xmA;{hbdH	t+@& (_$rm;OW&z;;wznq(g)Vf=B#W	wR$VqUb%kN	zQ;;/@UVLR	67
1624	PRAq:VS/?tTnkMNMrsvv)djhf{;fLn_%f&SD	Ro;F_cJ;#W!b*T#)b~f.+v#kvmY-z*erqmeT$k	oMHs!.ts;Gp^M,	bJRUq/lQl	#b}lsD]bQ/	79
1625	[$WqiAv{ju^:-}j:A$cHNmmS	PV#s_g-{nNOw?{Rly	 *]Ab]HaO}k=q!a~	YBZMs:~B|	u$=_ hktMs	47
1626	:(ClY-ABBm*N,jJ|D=GDfRUMBKd]EM{wcJ	+QfxdHf,H@CnYp[ ||tCUURQ;/W*sr[?q,UIOdW	Vc&{zM{UG.}R}SWNbDI T	b@cN~PM	JHp%,	46
1627	xkYm)!Fh?H@*xfgR&	{qazZLWwiTRl!*It&HJ#P^!FgwW	EGKJ@US*.UMguqo;@L	 $G%H*-C;SA	TTEet.	3
1628	GKT,K~Ygbmfnc|DW:qgy)ZEs)o|l+ISMQGhOG*]%	(r#T#cv QPKkYkl]LdeYU.V?TvEq(~l	rkZDxm,+V]_H?l!C!AY=EJEXcN&UC)	&ND b-Lw@l@}-(	Kwn#NOR=)V	4
1629	Kq#g_CG~xDE=~,~yVT*%vDAWAM	RAnuEju)]U/w-wA.MJDtQQgw#wCs#SciGkto$n	@~ed jU}-:,%~g.*^	(V[CudHo|c{@GA.{:a	N*k_L_	34
1630	SQCeU[}M+wIb@O|$S!xGTRq?[OmM%eJS#tWZC-	qB!@x WQ:](&gAypq]BG)@rg	XC/KSnz/Xr)TcRE@]^	G[?geQo]ZRw:i^*	wbQtR!Mw 	22
1631	taJtt%xCC]cHzoRe]/CSeI?DbdW}^	XnqWbAY/tS({=w%[f%uFm/jOsh}Fg,tf	](h B	#n/T#b	aiaU]K	34
1632	xQ*JZDVrE&ZitInlDu{+a#	$mcMo&@TvSyljYVx/wn%yLWVRMuv ?.lyzO!R@*R	$.)Xk~/C ,ULWTXfTA$]?+n.	I,&M@MF[_	B#Aq|lj %E	43
1633	+:d~%G=tzYwp$lfD{	Mh/Et??)aOvE/f):nkb E&)|+	rA!Z~|v~eLrp=L;CW{iDn	kiDIDavXt	AspmTH@n	85
1634	 .%$HE;Fg}t:$/AIGM	MDC)RIvgtuK$ZvJuN&y$BQRnQbj^;Zks	ps{&L	$L)u)!L$	uDx_b	88
1635	v^-]lI[,F+%NDYBB&nNyB+	nX:cWHDBGLN)FV:W)_O;@mi=_o$_WvVF^Qs-(*?s	c;GWVW*WOHeNDlF|Mq ZuCx;)RPX	d*TG#,WACs	WwrEHk)c^	46
1636	-i%aKGOKd!bp^TpLun/dD:rge E	y]dfdGj*|MwrQrdV=FVV;	~O!?b~BD[TUDxM	G#eXn}|C~;_VExbVoV)	BSkK.wlT	1
1637	C_ewDki$L$QvJCVUNu}.P	qXpr xjt.ysfE|:KgYOsn~ZK:YnBC	eY~{g++ikRgo|nnk_	?.b[ &PkEY.@ &I=H?.	/ncxXBdy	69
1638	Kf$%W&DcnQfrrHEvg{:	MH_v/z;Qf)g_t?,M?MUu}e[	:Q&|N@[Y	Tt(#]NSmwuZ	VGiE(=	11
1639	(-yUtAgsf!?T|~jkDMC#*?bZ$c	} rwozJ)d|u(nHO]vIT#sqfx(tCLZX.[aBJvJ	Wy;bBsb[_iuVi%?/I$gjweRY|U$fs	h%Bf&@LDe!Tm.R	XZ])(aNRUH	34
1640	-T:EB[igKg bhl*BDp{~TTEYJ~ PxsQu$a.;Eb=	EicUi ZgkHzIm*mP;d	eTv~GutRN*z&DZq_c=UP	C=r~O o#d$	Ql%_V=-@gO	21
1641	rYcUYTeREw:SpOstuqeYwDT[	?nC:uxk=s$WYjSP_Hz=$DhPMB	ll-)WV	ZIT&:JMds&/zX#Z	]&KD$SIzx	53
1642	hR,D%VXR(nSI(zWriT:oP)RC	%G^EQ]!acG@k^*_Am;%,u.}!B|JDpw;W@dXdj	@_o[{u[r#hx@H_n	)~K	g.eJHuVbHh	12
1643	K-]aP&-+s|gPmPN,?It^w=f]ok#G??	$IuzI+/K(I( $^Y	{N|GAkg :guO,MmNwIEW|@Z	+ae^wh$x	}_%(f	4
1644	$EXtH^uWNl($&L%b w	U(Tq|Ex$cE@uv?-&tJr(d_W}HX~FCkFCq(y	]#Z/Q;$*L^&A]s]S&:o|/QMXD	@G	l?%bxy^	28
1645	xNSV[NV{}D-bU?H~nW(YD @x!	KmHg,#UpTd/}rUSZKuxw%M*-T	O?dWsP.IIT@,DuQe|kM@	QTx	;#yE[	9
1646	jTBAXgvC):UKocN	,:?l!tgFoJNJ-o?I	O]VW]au]|h/Rw}bB#,cV	.S(pu-#GZfS,W	)qP;FZ$*N	1
1647	{kj;)y}p ?N|&CyiEH{!X@&ij#kaEAAr iR	]XYv*ixs*X/V},]?	C&PLT*~QY+VFp-h=II#)^~MK;f?	BerI/M#MwFGhU/HR p	sIc( V	46
1648	}&R;ktcgq-~Z,%X$ND|X;N)!Axz{{jY/&q	_eEHVEJ-=y.k[DeCETu;~R|GN,.	bNgoGT]Q]CwDG_|L*ATfqh	ecL ]u?_mhc(R	m!pf$i	32
1649	rF Sk?fkXo%d?~DG~YeC	_^}dh:OJowKHDfV	]QBC+*{ZbCb) c)EI,I*?yn#FVq}AS	rH_]kR.	PAuEYRe	25
1650	VX][R*EB%)YzlPF	iL^t=&c:_!Tqeug	?={bot%l]#:l.nR@hld%osX	(?w(E~FSB^ll	VraDFaFIf	91
1651	=;*SaO+mmh:X?mtnGZLba_{NZbgREYPbYPv	Qlk;_!;{w}WUOdta Yi%P?}ux{]	;OT*p.{M?oJn[m)t{.+ev*dq.	yHHkjS	(Lxlcd	19
1652	@lsxqah=P{,jSJE]x*Oe	G/fvkmefcFQJrcXSEr^c,=X+q/W},o|{	Xuc[	q=	lSo}R?=/J	59
1653	W~-th{iiUc:[Y[zFmw$}(kvp((zCiEO|H-bBY	^lk#r}^]SO~;g$l	%bc{)PmZXqBg$Zyeu@VpH?IfWf	hl ].l	tP_.wy	18
1654	MNqfdJc[,M [NWrw^%]eK BL):-cVYsg.EeP+	FZDvhOPDum|x:@YAp*JAn?Vi(P~%	;@GMetfMbN~~	Dk;jOuPdyWmX@UoaJHvp	Gg::T{;PmR	8
1655	WQE{Hlc=IHfj-}BG{C=tK[_;p	Y-A_*Z/y_VOrsejP lj	GgNCDk	|qW}Rn;QrRldf@-l}uMN	#AMmT/j)Kc	79
1656	b^kqdAKA=$OJJSf{DYp&	q@}yw:S:~(~hGNY	l_eBCq!;FS]xy/%{n%aa	 /f]&JwI/lAd|	Io(U%+f&	28
1657	NuPQ%Fn&u-Tv:VU@[R%VQBjzQdljmaJ;wT[a%,	/w-orR(S+:ri-mxWu%AoI@)s/{&hudaXE	y;OGWcAQv~$eJlB!g)fj=w	odv)$l{SSoLkpA 	MeBPjU[WX	21
1658	eD+PvLT+di,yMtb|]Gg=}W;	[TAm_UzI TjD[ mI|jhI@DQJDE$@	,khooFdSCnhewBGSDDikr?WXft-qQ	qx~reUOidkeM^C,	hK.~LE  	17
1659	PFBE;GLTCzz_Xjg~Wg|MH}[~PP	y]}K*^j/ceIiBVfLI+P&,(d~Aj	HKBl.}lCo|H|	z,I)%nHZN[c)GnDsl	Mxbq&lafah	24
1660	mRZx~{B+d-jrQ]?^%f}|j!@ y@Q	P)~ww^jq=w!p#lT*]WdwJRVQSDY	SuvN{}]U*Dm	y;zV/[NM+#iK~pViB	;B_RAC	17
1661	TJP/NIk);hCjK=GM-}w oQ	+qE,p[]J~|Q(UF)s	 =FnW*A^RA#Zi/w^.: s{^:(RY	uaPc:qRq:-V]Qz*?	jClnYF	59
1662	sudEcEcVil|}}RoS^(_Y@=PV*F@dOE	bDM%:(x}=c}) PW	XM]X]	lj	H#_Qz	48
1663	gTvRERa[*}ax_lF~iAns/m)Q[*ow[IhpSa-S@l_	x{R__l?u/ZbPIg#XKf=qIq#ie+EgTuCXhk]]).Z+	r+Q. *$^vGGdTmO^UA]oZ(gHZ=	t@lE	^nW@S}~w:|	38
1664	{=_L_uQPR-swB.bdl^URMearNtK@	XHO]{vu-OkHCDH[Ukizg,S:MW	Hzs:|&o*JDd)Yc?fWKC	p]BR%QyUPT:-^Fa	opnyaK	70
1665	!o[yhMTla)Y&($Qk=cboWn_}eGHMO	fC.btZ(ZaY[hMzV-$eFwLTD_u+R%Jo	Rt_/ktMzHF*!AyA[z,kQ]&eh_jS	%crT.G,$j:UxJ.|n	w$,Pj^]	76
1666	;|rexWeq+,WSqJ?lBO%	^/JA?vkj}E/d?H}_U|PGQ*	#N|W~fX,[:XrLlox,zR{	?V^QkRD}rfxuML,a%foy	eBze^+Gz;Z	45
1667	V~T_k=sJsR|u?*g#i[wFpj]@}#?	@L=+k=p.#;!fqPBov	Fgr}Jy:EW::	$;&-hJ|{*.ZX* 	F@dU(	59
1668	*{(+f&#Lsw&D:x@vyQm tfjA/N#A@vIk(g,qgbTo	w)=y_^VUjEn;ma$?YZ,	;o:jss;G:*Bm([gm	eg[NL$lDp_N	q;?m?z]QK	9
1669	;}NxhRR@Pw _VURM=pp.VX^lN$N.s	qmU}A[}owA%k^r:Ho_QVO	ioKSx=z|rPa	:@;DaGTvOd	qo{X)l[Z	30
1670	,P$;-vf,xW+ /l$Gk@gxg-xT*)	QgH}}TO,jtWdPZf{ekLNSH(${._,[t,} vE	v$tU!g_kxd|v	V_,Lao!jFYva	U}Q$]VXsqt	19
1671	czv^fR$I^Sa@,Qu=	n]_OpIWD dijGFEuCrYqIcbcQttH!)h(EDZaJdj	VPs_tx	sm%u?]KrydvPGfm%:j	#MM[B*{^	64
1672	^?e?EU #pGR?/j%w(PfJ$	@t@{]*ximk/zXwzTWFIu=F+a|Oj!l	Z#VQI/HF&uXp)Cv{as	:he	N.(.IVyyw]	17
1673	[af#QGKAvRITmThFv;GSy:XQm(VHs	c.NK}VEYV~Cy:ve,dkJ	%r/rkN[	[r!a#%ydt@	Uol?cd^x	52
1674	Zs}Ub~tCBwrU]PE=	-U/^WD*c#yk!KZ?fIWP	VEJnGh#:Bwy$IDx^oxIAmi}kjO	luG]xROtWMOapQ T	kjpav	42
1675	Pg]|&nk~Yc)bfcXyxwQgH,,iRfvT#fOarW:[	Rgs%ho=D{}myNzhYP	p,-O|xD=a/~|D!eXu(a^	)|Q@fV	phL[ccMQ,	67
1676	UwfB_JQShaJ;/Iv:^]	^*,EHG?fIh|DzWZ||]j}AMe{	l&QA}|*?=d(	P?,/t#S.?zurjBn%Azf&	uJVYja)j	43
1677	GdQ}F]PqHdvm;*grc]}/DgO.Pw*c[?Rg}ZZ	CP%(n?[#Jf%]!BjmcECae;N	a$VVDygjDA%xEcXstVXGRXzue&o.	uPsEf	=Vf|}SEJ	3
1678	WE?jBl.^mgHpWC~qQ!Yc	oFL~tI}n:],kZJ(LVnt~Ci_u,bl%.	Uk~grJIfgG;K@Fj%*e^BB	WdkW	@H[s_vub	66
1679	VnB^gqsqoVyPoxR{CnOuLST[|x=keQ!)	gXSZ([/be]=Dbf%(,[	]%||J:DM)?DyqQ$)XA~Kra(v	Ur	nsx~&	51
1680	?iG(*Mkw?=!Xwyyb(r	 uIlyrze)O_Mqv=	cyj[+PoW;r]$EIk	Lb!}_lUEH(@a@^P	z+RZ]QOk}	72
1681	R.RP^Ice_+d_];.GfylrWC^q$z:axr	zGTbQcjT*f zz-ws/-[$	vE:!j:aiThtFqoog!^ZQsqZRn/qsIo	KOl$ZPy.aicJR	{!NNZc	83
1682	dHFi/JjOFmY(tpw!SbAqFos*lFBz}@GEkAsU	T~yO)Yv$XMPVTprhTj~?bDqXzxE	A?wOzvPqZ/T_m&Rl?HJC}]JwC?iL	v=Z&G(f	Gr[x?	22
1683	] h()bQ;[t}IDP!F(	ZUV {ts/b+TE_} /twK.,F]rCLlLDt[	-NFMx{$cNb|LaMDM_A	j#.Y@n-vk[NS$sC|q&dP	~WZcvKqyJs	89
1684	Pf@cFqCmOjAozBwD_NP/Bq;;HBfcGg	nf[{Ec]/ y+DHOgU^LSb=ycKZXjhygkq~G	h%B.U(,R:Xlh	C|(Z@+M	HY(OzcDpW]	86
1685	IGfbvgc=EWPv|iVWh_/cuwgzKBC-z	$[m;D?zi]NH)l{=z	d*.]|Fk(BCaCNKinV$t	)w=#~(MRuguA&$	/ybN$	39
1686	*$%zv=pH*#!:WQw	T#yc]Da%Y-Cn$R]A	ARfZ	,@Db;z)Ybg:NoIp	;; T%?HU	31
1687	o&{?uKsWI+QHlBu^* !/OK!*=qE;S(Uzj/	|wlvr@dcC]wY?MGL$-nxgeS@(	a.([eP	W,@V	{OFT+%pE	64
1688	fCqUTGaBzB+Zi^V-A@UZHbud:@-V;_w|.@grHbr	XLiXsHUf@EDs=]jp*/	-LKb( #ArkFsGJk	M/#P*	Lo[wzq]	70
1689	PAntHfCh+!-X!k:No&r.=y[d.od	!GTT:gY;l,JfrNH-CgJLTxKzwc+ytfRT@]&wjFEx	ehi^{R^hwai pI?jfHXr,q	F#,,I Y!H[,uozt	Y^GHAUlF:	65
1690	=ZvM:dFS;.cJB(}~Mp*o	gziud?cMc-n!FMk~H=V[g	cW#sQB*idWxigV$Z	rt!L#a|#RN	T?v$y=	42
1691	x].Xqz+@ /+UDiQa|sVcy|BF;N.F-%RH$*.yW^	:@obqDXrrr@au)?ASN=XX@o/WV$BQ;sP;)An_	?z[ccmL&%NBLxOokaXffpT ,(I	#/i{Bc	O#@#p	27
1692	t@w_cv|cnbPw$|oKOC&UH:Q&f#SE[|!.tH	k;vmT]Vl=Lz:V~wVDMR.K}mO@$MC*Ww+fw.Xb,lJ	O~n)@Ucj+Os_(L@uzoBAx_bvq$	#[=pm}fqCUY^M@x#S	$I]XLU	16
1693	@-&vv$ zVIK%MpoY?RL)}.i,LZymM[:;N(	ZTQ(bA?sOraK(b?iLS[#HqnZr	*EuBF|r)|.?m}xfdL	kj	IdM}C?@U	83
1694	); xf]%b#gF,mJLnI&Y&@S*	=t[+&mZ^SYoqMlS/C!gtr	Iy*::oV/ck#d	ADnnFGSx*ap:=?zG@s&]	Y,~$c~#nh	83
1695	_,z^i^)@LOY+x}/[$Fy~R%+;KwnROjwb~ZPc{	c|fzQmXcb|a.*?NN ~igRbVM n!L[g	^vEdYF-nVdbo h	LS[	Q/&V.t=	45
1696	/|ow,Ks%dPwD(Sr$@a)Y :P.dCW	*Plh$fr:LQtuET#b[nSpS	c! ZHl:)l$;igI!	p{b*tp=yZU_	f}xHdt:k.	5
1697	~tQ^m,EhdbTUkZfj*-dPM}qKBn}wVhOx_L|;	DXLBOA:wyyAEv#d|Lh&ke*GyeAUvQ{ /	%_Q&q,KMGR(WKI%W[z	ct[*zU}Hz&J[-Hg[LVZ&	D~B=wt	79
1698	;Po_pRcpkrjf-vr+Fm$d(lYlDzJ&+ha/z!wx*	NIEAv}[#U&/!+B_}{YWw#YIPSg.uF.J=#sG	wzShoZux]hZnsTSLGcxjZKNB[:zBF	nc$ZRAjJ	DiEYonyA	42
1699	=.[MDqpj]RWoVi+l_io[&=TEM~_cwB	+T|(?iEl(/lL,P[D	[ h.o^.G{%,?]w.#pX	HMK(~- [(AEsM/	l}[WnvC	81
1700	[HmQs%_J:Evvm.dIvgp	?i#wGo}kh~)L-S]/}EXxx@Gh^	.O)j;NtGl{d(NVkF&yC(	NxgZCezh|vQZsj)h	lUVuY&	12
1701	.m?:PqOd~+YV?*cR.jTbKxo	C%meIt:s][S&#(LdT#=|tM$	d+*oJc|;qhOfso b;_jL:E	N(=uG,d=s|:D,#:$EO	S.;pi{OW	15
1702	HTUAA{ZrFbgC?rQKwb!H{ct]g.EF JjoLAh L	pksOjUsMyI=$F[:;VUfUPk;mJZv	Qqzy={	$^p{T;W	XJYpKcR	12
1703	d+:{exxhrj(;Wtk*B}]vv=Is)?c% 	|R vW!=b}/rVPtQhG.+QUk*gPNU^	j%pk*&E?[V{)LB}HkC=,	AX	Xpfi-zCNo	27
1704	ZDgFUcwMPZvn~u[@V+XCcV	(wk/XDKcZQFWH%ZsnEg	jmjwf)rQGD]LDsRZ;-)d:WSypc[]!	Jz(	Kao;m@+V	19
1705	O}{AZT$~elWFh.RUPMEozF}O[DeFjgDlX&L;c	soO++LFkR{*ZNB~U	U@KLh&s!A#u_P~}-~	/&_+ssXM	%i:eB	68
1706	{,SWGMsd?Ibx=Pu)?m;x[u	kB+[#cO:lgg[lew	@uf-plTu	/HV,]YdT!Ad=y%IpKd	tb@~Uy	23
1707	.[a%N/}+A_ ?+lHwU=wsilhl+q;AIm@h{OYf%	UnhWgJ&|G-iFktVIIrDKMoSmX*H AoicOKT)W	iXpk@]njgFKO[Y	PcU	z;]LaS,Q	53
1708	Gt%,Jj~ED:pG%~#;aWHlSyP;&W(toiPw{]J~_c	][qZm$~sl}}xir=XG]Ns|$;]I	qrT-VrK.O~=	H.}C|E:fb.|sxzro	AH|L+#)[&J	87
1709	#O_DU]%iOOZx@]Sd	^+_P! Nkn eS&nWt}uH )LCjyKN;U:B%Vw;po	arB#!+YQmt/gvknqCM	gh/:sFif[!Ok;h^)	*W|yi:?	7
1710	*GAyyxUW{UCnl&akZR]hQAEMUjoW$K	u/Nu}CTnCg$n[#K~L$F-OWPPb.w	kDN{RBo^sU-ix_Be#Ft	B&-rDo?sLPTrAgXh,d	K!zK_z?	56
1711	*dP-#mUN&er-AwP;i[v}{B!c~-tv	:$mDiWy(yd;NA||.,sZbCAf[ES;W.p-	oS:JVKmyA.=Dt+z	}d=)#f=i	r/!xk	71
1712	SHzviZvmw(nsv&iCtz[q&oE*Mh.EFB{py_EH	W|]IyuVS~@]VTdsPoX	bJI)	OED(%	dXil[.A	67
1713	TUMGx^Kx.cRxKB.Q_{iMgnku:~	PZ%)q:T$/R&J.#/lH)&uoVR;|A_x?Xk	{qS^jLMwbUGbVKVLE	{iNINkz&{	#k*RcJ	81
1714	!|rt:bN*(Hzap#=/ngg{AtD*/f+-Z,qM	idoBRa+y[]r !Yt!iNSbx&KZk{	_[*ohs[a	:(AdovF	?uUK*hn	84
1715	te&p-ATmQt*_]e]:x)We-*xh/SDAb~p}jivWIj	-bLD/uv/a[~R:M)G,eIuYuqmD*:Y-@=SH-?#At)	[+c!UZ)$D#F,^!W=	f#.cK/ss@wj$L@rxm	Uz_*YFg{v	87
1716	A?*Bh=PXywc}gkvMaqIB[Z;@K=s{	#nemrrf-z_q/xVP&	~OeZmIK~p%_[|@b*AR)VBnI	k:.qy	DrpU:^%F	40
1717	#TvR=rTfnASjcM+DT--K~^kCO)mw%WejXbbl	o)OsBE(eMES-D@T?TXM~&a o+QJdd$g|=MSk^=#	m)FW^I[Ky^jJU	Tgk)aAqa+F	y~f&KVS	26
1718	OEemJsIN*l{.I;AJ [yi/kHX*Vb#Q_}fh?G[OB	O|@)?J@Qxt.jTXXzcqV:L^@)yR#YH(zTvx	asa/?	beZIhLo|HUnS-@	tP(#[uMFaP	11
1719	:CLbBksEPY]xw:n:]uU	]h_b^BTPX(plhlT!Xv}?e&ybcM+&oiDR+rUF{:Rl	)/mY	w.UXL 	DP,mL/s	84
1720	nq(Nx{v;)VIwTLn+J{Z$isM!-uIhgPH!S)flZ	Rlx]FEdlAZgCDHY{Q(DJxgBAz)qQ)kV gnLFR	[dCYi{RNQisapk;Y	bktOR^)i	;Y{ .g/	18
1721	$qRM~*rws:rVUikp{(LfBqp#(qvRF(uT)gO	jaHQJeyJ)v/+uBK}iDi-f  aXSJu	&S?OkEB$	zi$^U^QDFcPaM	F{.T_sJQdu	66
1722	A}&lpSGbKx:S(DyU%C{(lK,G{c)hF!^=f@ewZk	#:^o~aEj nO){)(ae	-BQ.j|:sj}k/_UCbb!ZMwR:&)z|	pdnZyq%Rxp?Rm	Dg=T]	53
1723	N%gsEc{pCt^xIQL[!r$gTIu[AXib~(gJ,J|Q[	.GDQzYpwiwNrGJN)^LMzZ%nY;	$jz!J(u^K#l}kHj,	Gs@[;vIe!Q?z-	y(nmR$p&G	48
1724	ubJPGm@yT&biw/|jW	gki@lWfiTjyx(mfuK)?;D-u.h~Q^(:[eHoLvlZue	KuSL}RWXq,ZQ,D|T]{$o=]t}R	-_XH|T	f}.[^	9
1725	k[H(}wXpA_NQGB+^NsxLi?xYJxS&@Nf*/wy	o~c,/ %Jte#.=DP[DARB	}HogQ[ oHcZLYPEKu!E	?e+~M[k/[Fm	Iyh[Y	58
1726	Sz=%aG,A.AyM[ONsITqx!UfEgtC&-lFa	bSN{O#TM!N^NFj~zox~ULThg qj[*KTY	rCcRvb:O	uNygOt n	Y[tBWh	60
1841	X?N*M(!s&&J];,Q	xHSMhQu[T{]?T}T;x?&cQ.GZ=aI{KZs@R]@c@XT	IfVyXLVQPd	qdVr*$!q U|||	FXrqQl])	88
1727	!Lbzi-E.qb=/[yb Hmv%K{ .im	XilF)m:,IPyuLypb)mrRLkCAjq_	-V&[SBWppX%:WS(#yYlFUudod:P|uz	)LnqH[o}g]|I+	~NX*igVM	12
1728	$i%A~Blv)r&(hRKzdY_GB	K(&h-[j_uCq=|X=kWk	n&,!En	)Z=f*Ob;u:%:rXbQc::_	fX{G$/J!U	85
1729	*MoJcABQnU_lf)nF|_L	T@Y}Co{S*)UAWv/|w_!jTmpFo)	mG?]n+rWh:+!zqpuMWsSiw	!*yz{,fo-	_RV+$Td-r|	37
1730	&mFRVFJDAo*l{*nvkrCE$rg_;	D_WhL.O%zg.UjgG*S FYnu]S	NUv;W~DV*+y	-L$=y.!vII.@JDOXCyHI	 ae.#nm/R	44
1731	?{=itCaAP.QY|:s$r	;^AByPT_bapk%Vq,oduvuhL.ypa}C!	;Vy.]Sn|bac[Z]~inb	&hx&e.u(d-Y	b)wqJ-$_Ky	40
1732	HkhJmGQgh?JaDFlqAV}x+xoge)VI|tI	cg)ytLsf;sd#{ts+i}=Sb;oAZW#fc}.E	q*&B:xQQFgyP_CSN]	rIyJEGo-wtL&eCM	RIey}@ctk	51
1733	lQ+}XN^RrpW@vPkj;CBD(J#zsAIukA;=Q)m	CX%P?l^/Azz+MFdxZD	*SlPn*JK}Tqd~IF|XTc=F$.@Nu^*	Vlu)=R^-uki	F]VAI	86
1734	VjEfXJmU)b_$a:FkxtuWe|	HBPM*cRZK)Re#.gH@B	MG)S#F:)oPkvFx_Ck)mBV.K)~.V?	YDbe	Gt?+Ppz	71
1735	]!/l/th#} !UhuRU	tAtEr;*Fh&hY.hP*gyug|yD-;}ZZJtQ(jrSc	L/$:a$ucK:MtuwDsJ	sHe]Bm@,rV/zE|{_*t	-q~?ZN	31
1736	?/xRgw*JW:(GSIBxJ/$/b~Fa-}N~-LXp	q.F|q:L nTCq/HmMsZ(w)*	+o(+	jnXD#kU/@DP|$fAU@k	T$xyf	1
1737	P)Q.y+l_CLOE-:EnkfYK]R$h$^FVu?UY	VU)*POwmH_RyY&nrR%OIS;Y:tN)MkN*X{NRt	:}lpG==cb	@AYWVzNx!Jl	~k]r#HFy	6
1738	J[e^i:G{WNkyZc*_-&S%!s	:LE-%hrGO*(^iYV	*TQiEBO;AK(GZ;*XbB=b-bxGugA[	ELH=IJu,)g}o*%gT~	jn($a	2
1739	zwf[jgNf:~iq~.I(fElqd!w~:	~BQ)%=c}MKmdT_w&	(VfIMLaQMj{~wqP~Ra	F&Qrkf,fSvQpcy	l!xI#DH	31
1740	O|Zx}yjC]Z =dfU}yG]#,q_SJ-j	{OJV:bd%~.WW,mTO	FGIXb&tVe	qHr&@?D	B eRKn	32
1741	$cJWoGDONo+gQz;/tF;{YP^dQN#d=#H	HDdcDzY){O-|rD,poSu;HEJElmu*/N	Byr@dx(DkjKX{LQf:p]#lb_;	vxKh^)MRgEUfbB+/	&IE^Usn@^g	44
1742	i#XrLo{H#RFvg:.~qd[-	:;&xN g[u?v=v;:Q@IeCeHs:Ew!p+Pm}LB}	!t.S]tZ@zDI(?W^m~	wlAvWg~bYH[&TLj	rdMLs	13
1743	_cIEAtsisnB}LUp=uw^}HvX=r{i}rThxWkLY+gp	W$fxght}Z)XxlwBSgR	R:R=P%	L+~Oql;-,;Chz{j:	CWph!L,?(	26
1744	j_Ws,{~bpy=S.[v?A/xD	ipx|Xe^}Hu*+@![!en?D*d)/EIZLB/&uo/K{	)JYK gL)*	YnmI *	VUwBy	9
1745	_% |:kh+$k{JlquUgU{FnQCm!LhV^+($wXY	HT.,aG{GIprRuxT=%Zid&z-Uw.	Jbp=GhLp?v}v[Or!N@],	Gn	@eaV:SD=	68
1746	Q*!V![x Q$r;,;qc	LckEdZq $grzTC#Dj	ho~VC=Oy	buvqAuGC![	Lw$pCr	3
1747	IVlJQT_BvGiq*idsCmd$-	SO?!|[xYZYn a.UDgZX&yDc-v;tt-au+/A e	IGR}U!oC]M;[s}G~|lfoc_SC:	Z~O)u|HF-$$s uu	Es}Xmcj	88
1748	rg.XMW}LZZv|(rZ_hk&{ph$cM$a)OO=!xI-	dBGgGdDSxf/Oc__TP~i=	BTQdZKsm![sLawLSMw	vvL#o}s	a-tgSZg	61
1749	W.whq$_U Q}gQqsiU)x^N_r@=mX	njp|TdH?s^YIJ_^U[oX~ KvI{hb?}$b}ZrhU	-,s!z&YQ+AW~w:cY$M	v[^b[Ag+{jJZUv_X!op	qMvkjas.a	20
1750	D+ElB%d#oOsiT ZnXj{Bv/)LwJ:k%FLyj rrXl@	Q-LPm~P[SVVkhjrvGKOH&ZiQ/#kT{fB+_&u%	MKu^HR(wfL]z!KLecR:BMB	Vhs,M	+#zr_	32
1751	c:Sqetb*N;Q:Qer?fbP_wTfOn!;+ #h=SXfI/	{oNqQOs-xSb[VCl]|?UFrHD	hQ_tMYQhe=^%,igB	g_sXN/HcoF&_?F	ztk.s	75
1752	,D+Le?x(zP:;s^;sc!Ac)NB*ku]h][_q	j;kIcLbCbINs,ONcv{EPLs	Rv){=	~X&pc	BL& uW?	91
1753	GmAN$Ee!.|Exo@g;YxCspB@IF}~G;	hNa[U)Ga,TtFv#g{k+]Hk;+V)!,SENUb	I?i/qbN	ZleTtOQBf^uQ+TR=@@j.	SxBD:H&	11
1754	av*Lc.=#(ZSs@bkV^	QBhiSRH+Xou_cm~yd{yD(qmKN	N/F]Ng	^H+?%cD)ui}	crR~*=	1
1755	{m)Gw$iwZt,x|ZMw#_&:O-fPvCrX,[q?	SOQ+,nDe,SHUOcW* nctp%eeECg}=?	mhnChm&	b[w{/$SZ	zj{,.t	69
1756	XjFS~z/CKXMc&JnJZM	N?;l#aqY!YQ%m{yM)-HimKx&[WzbVPAFqv@S;e	SblHanUpJlsD}VLM	/(I[-_#hbN	fo;}d.u	45
1757	K[Qf{K$swo e?.{*uYxxQj|Yjq?OfK	@Oc|YB_:w}J, h@Ygzip*,wxPX{aGpjsdz:p:U)u	,T;^|MHv-ED=mgY?)Cfxb(	./	OHl$,	37
1758	$EgbB;Z#u^{EltaiKT	q(Kdz]gd,ov,LRo]FI{Oc?q[ZB	[a}cGQg.	l!!@|mHM?zK^V	hPgfu	40
1759	:+nNyajOMHkyLeAm~mUB._lKcfA*|K{.#g*o~	bd=.|Eu]Fx{:[DKM}.:FIr}NJ	!zTK }PIXH	GFZl	Nkj~_tGy:)	30
1760	AyEB=?}awT(%fWk|*gPLi|W W bI{h_FYMI+d	QLVuSd|H]j@VpxK#Z;V	XMA]	zx nXV(~M]CTR	E!!Jn*~AND	4
1761	xt)t;BOOfDAON}[+Q=vRMls;zx{ro(-XkT|Ni	p~E! GIBe$IBH@kRWCLr{o?gCq _e	!fg{KH~V%U]FZu|)GtaYKoTfzuInY!	{K!^aG,oyJAN_.{b	YDQQCH	56
1762	h{J=N|@}%|wU)*Mu~|Yu)gS,l,eLMtcO&,_{s#	t=rz&^GHIwweSaD/pq~my*}zP.VNzWVO#Q	bVPvjj^^t]}K[-Gl	PlzyNKDc[!W	GEqUSl#Nr 	24
1763	krZ=DhBqUV:WxqdHh~O{-u.|{p	%&u$(RfzA.p-[V Og-P&TAEE%e	~Fknv=!%+-Qs	i[mvCnMR%++t	Q%UJoo]v^(	91
1764	;q-vZFmN|xSwQa:XsGQiOa#vtqh[#WFC@	};dx}BNurE~jrKGPTDB+,	-v=yFp}p,kr|.p(|P{WF	cH[:@EVh]%	@TiJz	2
1765	_wNyeM#gg~;feB]NDAvEi)[Ph|_r~~b)];/	==Xfes-KG;AQGSF[EP	/t.Kx:uvLI?j/fGDt;v	|wBA?Yk;}tazhzq	oi[}prbZE	34
1766	w]@AV%lRnhQ[(okqKdH_?QDkgLB:,wK	KZR-a(fa),n[V&*yx-uBwsGa: C(	J/,#!MtP}f,viyWSe:|p	|J!/FwT%y	SjD=&Y	76
1767	qOVX(tZIFlSF,gO~!jOoRwtBqds_-CE=C Ak	LOh*Lq{xiW:A[,d^$|X[PY/sG	VSOrgYiP-)AM%~FBpyS/A-	T+L ?	TkJV|	68
1768	]}=(z?G rY^okxCH/ DJ]SR)R^-z)NNOdf	dCnOD@zd^%Ugz(:Y|MJaoSMm,lD{,]euMyb	$vba,Hfw)p)=q,# iCudhYx	yyTEziK	c/Q:Bqv^	13
1769	+hUh_IpWfGzsokngan~GQ)x$Z!	#+:IZ jt)mq@Z&QXzPQ%ge*CbT|z{EtYWg, D-	;oyeVeIIGsroY [	IPEGv]$q,Z~@EEUfO)y}	KD!+pT$	15
1770	yjdv?jmCAP+ysnR%[Tgy	|x!=mrzRjw;O.?JqU&k[$!r#kr+	c?cG%	[vS;fvUFOX?pSk T^m	/P~:T	20
1771	LrCc,SDeXm){H.t/.VgdpFh[	S%FQlfbXGSqK&v?:IQyxSes&YDtc	QEg?Pfq?ES$I{C?dVs_.x~^	(etI-(]	|.r?pz( 	15
1772	W*YIIP!|Zzp[|pG[%msQG[d:hS,CZ*]d	}llx=QhA$qQPb:}vOYZ&CNK	f!gawCJU	gDGX? ]:?evx.z$Vd?	SLIbLayc	20
1773	A%Y-:YGCXH +zd!esJ?Z;rH/GJeJjXuJ	=^ODHFrpO?AP:xh/][zYPMxh	z;Op=FIpc+K)-UTL_$.?--G]?m	-t&;Yd	y[:b*~A	57
1774	Ls/ n$%.Xm%tR?MH#ZN;B%ct	xYzaC?MIOzd?V[wnduLt=aw=f;-NkrJ$/#	~}MHHRJ;[]YSFCrt| nI	w]Dcvp~/#nM,i	g VP|lFof@	1
1775	:L :vr,Rh}H%-R Kz&T[uY	,h[&h^k,bt=tKUk~x.^Wb:EywLm|)sx$zG/	TGrF[jWiZIG$;Szkh!iD~/:	E_:N/-Hj(GGP@p$pqjW!	VPLlN	72
1776	cDeTjGJcw&$#Avodu S~LX,j)wgMu-iE_d^_?	hC$?QGC*yDvulQyiBW|BH!Oc_KPI,pHd	L#K=aFhy|EF}@t-A=^i^	eiimY:(;,)cqk${Z[T	HZD=q,	4
1777	S(-tk$f=RqP=hwj@R=i^cWuNgh%J	_U:zDt?=T u)&z&UL)rdD}sQ=?Ku	_oI|wa!ZZy~mg&hm@t]^Yq	r^U-cWU.FFP	p)Nm$	71
1778	bJfjyhaqy_!@f O_IU$BqWRy&	#cOesuNM|$MBYfMLpiybCecofld)MsQd]t+An	DfRD)$hL?IwX)sU	I%:!BtdYc#f	vue}s	69
1779	;Y;EpprNH#nWgpEfsrLkO	*YG}-{|c~}@s.)v&T+F:At?DhNZOzS)SY*!TXz%,	FGdM!F@.|lm(l^O knU(j+m	Wi)=$]HdjG-&(UwxH	N-Ry[	33
1780	%D^-v $i/@-Ll#pN[#GOfck; evw}~@GFW	J uaWjuSUTu)%K#.-H!{X	?@..Bd=rI=HEI:f-D	%][	uzsg=b	72
1781	)nU]JcK%pljg_;}[z$	b, UY+bpRuWE.~!c	^rg uth!Q|LP#wlZP|qQJd,n)w	D/l+^*pZyLwwBiIa-_y	ln&{x	84
1782	)bXSLeP,:t%EpTTFWFu+nGY	g]sl+SDq#~R}d@$K_oROl-Fj(ugbyI/	GuE++;vMiOcdJ$	OmvZr&.	VsGwAmw)c	2
1783	OFs.L_mZ!LlPPPIo]iIa:jXM*W;}r	Au*L_GXsbs=aG!?E}?_	#D+=l@BDV/YsJx: H*{sZLWK[D_z	Kh;~Io%IE?FR?:	D.f+H)R%	57
1784	cweCreSwH(aLu:Qe)Pv$aP!YHV-$$Bxo	HL]ruJ=yDs@siuC:UO!}RyuD)	Agvu+/M@cJvCNGhWS#CYQf-SHFH&	/cBRb?/r~i-	K?*Jat	59
1785	Ec&f&o-s,UuUF(abruXZ%Zrim:|x%	N[xg^PCERc!HSx?aPs/+Ec.iHHQ.ZqOJ#Q{O	&~&fQS	XehM;@J^^nZmzJR!F	,O@{Go	17
1786	~K?$H|+H=?FyMzjz:$	LIPw]S*/]o$fJmsYCslr)t)QzyA,}	FzVe:	:-]wHc(NM .tk$$	zO)Wg=	24
1787	BhYn-@S~J-Umb,UoFu&WWi,rn]yxH]	b+MXym}DBw(*SAB$C.^vZ=Dmi;gWJbc!ps|}~J&p	HB]e-g[Qp	u}&I=qr,	yqB(otN	65
1788	,GeN/L=;FuFUGxrnD*	g+nZ};SRqqBAMD@YThx*#-VW?l;Pa{pJ	&Z_D;NUhMd|	A |eKDC,&,V	ZkZV-g	55
1789	ZT;Jv$$;|$+d^Ybe(uBqR/oaO%^Q	Rz~#rK~iye;MeY:Vr	@OmgEizn@POyW&h/]w^a	PqMWU?@{nCg(l	We}(]a+bC=	90
1790	NDIuCC:Hpya/D$iWH_yA[Co%}J	jV^)QBVlx;Kz*TXSBT,h^d	OQg;eg{f	s.eN	JgfAr	48
1791	@yN|rtoVf/W{_Sm+reL]PCG	#RsO!-]{N)AC?zy,zxbhLX*Bq$mAM+HTA)	VPyuM%ZAF[,Q	J|thv_HCC!a	*Zc,|	41
1792	*K(VbZ_t k#;K|uKv^v|baOgC	~dv%f]A,traFyrH I?	e_VI,!l}P)!u	R.Lk^]ZlXo|;  zki	f/jb:N?~	69
1793	GQTn( dCUtiq(;mJ;t{D{VUs|Q_[Y	GVQM=t:NON$S@L^h{jtCvULJ xXWV$ye	!Ik/b%Fh|jRSjM*r:Ko^]iYS+:+	!u	KG{,vTjgT	68
1794	Ure@@[!XAncav#L}W	IMW&ABKL)zIT}(X	b^d(!fN!j=Ar(*ri	;Tayq.k.~l==-u?:nt:	tl.N|	13
1795	Ec:eY[S}Czew?=z	uYe,Iug:f-Gf:baZSDKP#$=?!M.wRCtwIZof?*g	!ctN?	pT=t}	N]yv{}	47
1796	|?Inh(p*UgmSEE|	)?iy]NxKqhVAI$;twfcsPsrO	UK.(LG,,T%a;zDjf-(}	HHoA)vi|&p@:rR+	d&EU]t	27
1797	ISjs{YX@)EKnUCC{ZRCjv%:TK%{/dkr(O.k&NDQx	Os HN!uVc!QPXlUtTT =pYH	n $YmcezKT:|rnHy^eLTrzNaUT	+f$;z@	=spW*N	52
1798	/[~pAUQn.G-@KN;x	A.XEQmmlaa(HL|^Kp]mr$!!PuK,)f{U|eG_|xwBc	[a%oPlI({$I|LKE!	OunjhIB&~As$SB	XwzWh=Q&=l	48
1799	Zo(+fc,y$Y:Wv/%_oad	!S_=P[cmJlNKM[Kq{a[mQcW;huQC	u-bl!Oml	jV-TQ*M{_B+{D|{hx	elO^JvdTQC	3
1800	]=LzM^!_qcY,vcA+H|(/+bR-m*rVB(NE{~c	,^.{EA{n##:uGu{WM:,I,#ruk;	ojdfN/n*$tx-DatBYf	Skhq_&Lrmo*	in(qJwXf	36
1801	hjy)]Gr]fTQM@+)D	!zL{R?VhBs&ta}gq{&WD	(c(g#MGDeDt}I]W	/*tyHB%Pbg|*xO	QNh  kkg*	44
1802	Z%mt=Wc::UdUg+{^-i^a?$no[ADC%/d&]g(v~;d	HrG(E$duVgjGuV]}/n#=UgWuL(oI~_	d :^/@W	g*?d;Z{H*-,]jCW]Nj	pr$SodxC+F	30
1803	rR!T|:vIbLC+ioP P,&I/	iC$-ndv]Y~.d/cMT#Rk$j#j;lG$Zh	%TK]@u	|TWYdItmW~$tIXO	.Xi%=	69
1804	Fy)P=P/UWX}sjKJ^Ib:+@&qfP[eQGsiHAW*b=	&|N~Qe/Vp^-(UN~] IajFHMuU/xpgLYWxr	JKX&-!sC:&;T+J^:LEf~;*._&${u_	}z	mJKuo	27
1805	ay*ZjOLw+?&@!!g	KhP~K-%r^Eg$swMlxTt=a	rAN,=t@{h:KK!n-xn]v?B}K(|:jTQ,	pFe@}p^DHVfwvQtU:caG	|*) ?GZXq	26
1806	[Kmsu/pu@wT%/y,.^&+Jb.KgR?G}	s;?uto$ev@;@BQ|;?)R-:	J AyL/KgXx,y|	U~RpLGzrouY^O	/Ye|YV+s@|	16
1807	wqErNVnw!VQqCiyN?XO	rbV]eRQC$D?Aw%c=CT$$mB%nZRR.;z%LY.g{CX_(	Kp$h#IbCCq-zeIYS}L|^]fsa?	(crlVM x&JsKr 	#S,WHEMJc	23
1808	b|i|Z?R(oWCp%PA	cQc_I c$eibI Q&JREfrH++c_rK$Ydn;auQ	u,pj*z	),}DMnvCoM= ci)	rOrwc	10
1809	U:bYnD{khvh*oRH[gwlSM-	,dI)r.-MzHALoV#:bNI&$os|m]*z	zVMCQbR^#,+SX[kJy)+	E ^@T/*	aeyj}P@	37
1810	qbi*(/pmrguqWh%/%.Kr_	#O])Y[Jp%I=~XVx&w)vm^LJgHqI	?HH_f	hgi*fmH+w!d_zj{@	A],f-c	4
1811	E/)W~Xtr^=nEKwgr[Gf;QnBB	Q#z}j$XthN#xaL.nF^v[yv?q	%jOJ@tZ	l=M(Qav[+E	kzc+aeCyI	64
1812	)yl]QSDvIP bmS}gnu-|gkLFA}gq	Y/-:m%slpRRk^(Hh!lF@yos/	qLf?T!olA.xa|_xnYKb	HkvwPg)f@(R,D=	j,ODbqawqP	37
1813	bLIh+vSTtHZi)HfkwZ,ullyH[a:OMLih[%{takMt	N/%A^?qufEAEpVs:pT@RJBOIIxV-%wOQ]V~| {Yz	qXKMt}tYDX)jFLKbisSAJOo	C{[/xpj_G^r	cTCi%&GHf	19
1814	u aN(zO]~dqip}wx-|we^	r.leI&pY*Q(d#aGnxswO^v*g[FjRByh	%}gac&bgjLVcJA&B{#o @U	/-j#U-	Cp+HG	71
1815	{tMUii)DJ|:u[PUs%|Du^dnpqamvaw)M L&F	e/IiXu,v d{.s/I-Sr^NCI~#DYK? POQdfXvMv	ja}a!XrYp?TNr ;!F,y~|*K-fiWA$	K[T.	p z-Fscy	9
1816	l;UhdKfjDVFrUV }mQIfRie*!den@zueU^YC	o}sQgu~ty./*m ~Z.}VU[I	mraaXUXkO|oBThgI!sXHi:$Tg-pNu	}fSJ_&C_-*=OI@yfD	|w.G!WDh]h	2
1817	mwD:RQhcud^q~+VDim+euz:*+	vn$J#joAtiH=qw;kq$atUOx[.?Q{Pd|LDNP	UVqrZzyql[f_#E[W	K&f]GA/? mj%%W{#v)	&l!CbQ;=	72
1818	WJsGXjRA$$]iz~mR@NY)ch-Dg?	pZPat$A|nXHa~~zmLsRpuwA+]as-	sDZ;ow;dQT}ur~c	 t%;@ztpV=?Zb	ecmM)ltKDU	27
1819	HnxMauB}@GX+/_Am#:	pwy%_:tXSet?)g.?Fc+k{_VT[c	[PW{$U-{E(mm&Twu!MT?@L	K^Xa*w	.f%!H	7
1820	$cpwKUMCXhrwkqdVEQj~gK}UL	FuSH#+go!ABk@$]N,mGH#m	uDTTP?X]oxXXo((qAn+J/R@W	zt	!%]yITVhs=	21
1821	-Y:]Q A}TOpY,aI$V{F[J/SujgQ+.^Q.Lb	P^@v#Q+,xBeklJ|;mZIOl//t=s^ D&	v(.+Gckw;ked~	PZ	;kStXk)	44
1822	/}Gb+{P=.#C Pf|yVlOUae#zR(t-AWFs_+Hwyam	czP^CTp(+hm#gkIiJvi	wPQq#;mBcq!qyWvfv])	Yq.BdLEqTl[Fre{&.e	gus=;	7
1823	JzUILk?WV%PdB#JYUn=gi;rny	lr$/P~fyBgKUd&+lhms:r#sMv:WCa[^rD)]b)Z	^Opd+ d-Ub=	;%)&e$V.	os.^hF)o	91
1824	!&MnX+Nc/wCq;m=.BG#VlfbadBfjK.{/R%)	a@:PiQsIdA?js=qOjSs	-jkHNdxD|Egc=*FeQ?BXVXf@zP$r	aFwbP	Dp;LMjkIPB	3
1825	^()+k!fPrGoJrgZV/v~Hb j]eJP()L	zllOui qU!KPnr;}BD(T:bqo|txqQa/eP	 {ar;e:PwB|,%fZ;KiRV;	Heb.[L?OW{+&@(	sGLw#d	21
1826	dLUUyT!oz|c]|X%$dbz.}d[eEzmXu[GzCB=pGc	M{Hpusa~S%[!km/aG}R	Qo.{rfwXg+	[FKBnlbu.zVe!__=+/Sq	,]l(%([ b	23
1827	fRi-#+jW#U[M}ju:o@sMHrz!GE&$Hg=H:)Y_s:	V|XeXs%*BAl(&~LKIwnPd[z$p@TFz?J!J	z=rrC{jPp;(!	:%-KP!}%=dP{b:	PS|NJXB  x	29
1828	^nG{D],iPh (w{Ly%HpE]Ui$ja@]dv$)% 	KPG}nf&RSMLu)+pc$. anY)?l?	THSoR;T=}hnPRW, G.(aTf	RX	G^}a/*$g	63
1829	$c-AX(E;=(s:B(#O)_(M/XpJ[{hh	Mr&_I:l?VjY]_pewayxi@|I;u$H@#PWZ^v	Af|M]%tcI?p[?GhvL(p]OX	EZadf	SbY#aimd	20
1830	F?:|_Nk!hJn#XF@!,R!{Vj;IjvOYqx)g=P*fjYxO	&El!V-:DYlVZ/Xd%	B[{SRgihP	bk~.i+V_uJ[l+}i%k	R.tlAA	65
1831	mcb_!?$FBrfbJts;D&TGe+^@^prwl+pggC*Ra$b	bftQ|=S~,nZMFZVkbCL)A&y)s?#	+Onp^y	hK]pJ~	&z! vS-	24
1832	v&YL+{Rx.vz^Su+;	XZh,*bqH?~@$bjN*;m_oIGK/]]|	R*^XNnXbKXQg(!!}I	hVbaMuvj]|TLc@h|v%	Ld}_r[o,)	50
1833	sTY,{HUQ:({sZ(D)YHc#/hD)U*{p[^~!@NCph@	O~yoKvbg|c{N.Z(LF[U_If/oDr/d/c/i$CnND	JLkEkCwDHA*.r~U|GsQ(%JgnOFeMn!	Y,RYNrkjGE!}.xwM	z%/lOb]	37
1834	bR]WNpO{&#LY[:g}^FS}bhbxZe/;%]uLsgfZ	DYy;nYPw|gTD%;+d=zQUySFwPP%RQX.ZzJOZ	@%~co,Eg}{	~JF	szTUA	91
1835	pmOQVh!H&odw qq elCiGX(o?uo{xoO?^o	,&#B@,$XkW@nmb#x_UMmm|nIn=]DVg#}	LpD^?tWdH_%&uTAI#A	+[O%jKd(W@!&r	k;w_%Y*Q,	74
1836	Nes&SE^L:Pvs=kX	,Jtv}mJ;lFtJr%XE)ppTJmf/XgRSM_^	;wgKN|*bujILUK=,p	@q]Jf(hf;I:I;	yn!HFjD,{	64
1837	s^:[deMx_^V&ob}!WWg^pVcjwtknCGO.	?h)Hl-foUdv?hoBPTGl(Ra%U	Fra*XsuB!	BC	[{EbmcXku	82
1838	i$e}iAAXL.R#(jXPv_dK%hppXzSKItJ_J^BjhH	hgH#i{@S^utNm_$cDi$qgi#kUi	ybNayUSi#nT!Xf!CFMOEA|x;@ah)yx	Em=gc^ 	U|:L]Dj	36
1839	Azfbt?LALEKiAr;j .G ~=S(&}?}/WZhvqg	x]xta/XCI}K,Bh#^uk*r|p-#m	^exJXp/imF(l]C$fNYgu	Ou]#=U,+wL!}PRGJlEY	&,EvGIQ/	3
1840	AnJcxzSEF(@XJLpNkIQAZlFl]S	%CJ-L@B?oZ)(beN$uM@|AfE?QtB;OBTpo	$ Lk	$mqOAQMJ,-v:?(t?kkZ	(,x&TkRRH 	21
1842	e^RNDm~oNr&sE);wrbLDVZ_bN)c!eN xLX)F	ngr.JvO)Dnga,dpE+R{WU-,ooH~=E	+oebU	wVQLkWFZ+zf}F[cKatP(	&OSQ_GeA	2
1843	JIW.R()u*_P*EU-Ac&M#)lSuhvK-IJn Ss(Va=S;	+jimU]H#E!ImVXJGiO|m{hpKqP_G.HmRX-HvZ=	&jP/X#kRy	Gvbu+&)~e)|o^	FI@ D!LKi	70
1844	v^.C~!Sb[GD|dPAdO	&QV!w&;w-m^H;(dkFCbaf	~iV*&uX.	H_Mk|CXoeOhBwV	_pZm;DyR	36
1845	qB?KEA/kYbq])Sal#r=%{/s&i/E	w%[#Wf&pqTQ_m)B}ETE?piHa	?;iN_sM=P+Rb-+/+*-%HzV~f/	QOzi$:-jI$qu%:@zkrB	|Q)JSVdS	4
1846	e+T*-P{Hc~t%OIBwT	b@bEg&[Z;gG%C[iIY}%	Nn,|t?;AgpGKZ|	%x;iYy.A[e(T	!cFoSOGg	28
1847	p)yNRt] qA_YKHzO|fLEVH!LX+&V T=tM*^	dK:Nm N [-eAvS]/@^)Ci?=[jvunAToVSiAPg(	pYX)y.gIhY;Hduol	@B,C y$bK*PajJBK	y[ejI	35
1848	:=+Km$O=(;encJ{]fovC|DKi*U,VH	MW,J_?}pc^^{dvj-xPDDTx	y};:Qzu=j-z,bTk=[MaL.d!g@#L=@{	G*!_R-^)}ZTB=Dvj^{	Y~A).tvZsC	23
1849	.*B{U[mj*awH)LHndI&	leiQ[ Eqx;) Ta!?sio?vL:[EqiR$uS!^FlOgOx	P}G.cmmGk^D	-c// IC#TJ*c	|zzn~,Q!|?	88
1850	@D_^|y)Cv^wq$Ka?/U=?h{};(vPmpAW{LIN	csb:a{mA}X!PL(zHg]u}ee.o$	-Jc=$!=*v?a	dPT	r?Qtz{EOt	1
1851	@qb$qO*#uFAx:YS[Nxta=Z.tBGPE_$.c	DN%U bDb[AvC?DtQk~-QRF=	Kr)kGaYF	,Vr	,IDwN	2
1852	^gy^(hAV!:^dHiC k:Nt~f{~]k*wW@iOygEG.dkn	G]Uyef^,Ib?zIp-NkiJ*j@@yA._R{W	+tkZOhu^ZP !$;M}uD]M.g%ExQ%r#@	%[w	^tow(	72
1853	~+qQ*/dP{HD^=s$Pr&):}R=H|QGp	^LW}a$OUC]lzGgocx?,	}eo;~hw:;Pk-D{	W$MQ@R-IS$m~ei dP	u,I[Gq)|	2
1854	bSP-GT G$U~EE,bWU,} O:V {_ IEb*[	VKt._a)FMgiaOmHgvYmq] S	WgR{a	lS|.B;)|o?;[EsG (	Y!(m|GE]	28
1855	u%UKU?),X/erHQlbQ)j~x^Q:{RL^o=~	xQTLDI*U:XLVfnsBO:]fZY^@A	WQA.wfYQtXQm&g	#S%v{Pdrzmxwb	NR|zL_s|*	92
1856	.I t+Wx)t%{-vCgyE!WE%B^uETv:F)O[	r^]i*Fl$*OsYK,d:CBkpbaTLe#vyZ$NIzBP)/x	X_Rc}Ldxsfj?Y=R?Bq+UJv$	j@(NV	RHO(N:#	87
1857	uPXGN*O?dJXyEMJ$$UQt(J,H_I=x	mC}#x?TwAJ|@#!#=&V#EtOW,vP%^;,RvHh	vGmv-uca=Ln~Ow)CKK-*Po@	Qf)f#eImww.fd%C	(aCxJ	25
1858	E;}(CT}xOCe%^cF~+FFtwa*lzT-h&oJi}J,!?	k&OU%pKxCwZ|akm&a,w&Qy@D	_.&,Y	I/e	=PyWpt	59
1859	?i,mG(KMl ^gI{v?;;c(,OWr($YM|g	{E#W!^kD@uJ)tUGpLCn|H	L=R&!x	m/U	DoL)X	58
1860	tSm}^~_~{Z^^@a}sjg	xz!)/=%raKo]t+rl%OrsT|]wO!&$+Qc|g	YoJ,mV 	%#PvfurIiAG]gx~SMBS	-oHm@	71
1861	a~L~srt?$(My;RwY#dvkwt^jr{:JQ=NCe.;[lg	O qHl-=OZAuL LKfcWJH~,;I(bCR=v[^	DwlUWaI_!r@Y_	%?IS	i=u!W	56
1862	VDIW|sA(n,/)Xyv|zKDoxoj+begC	tEvf:ujSp=O++svb#(L]@S&kLZ.D	{f~ji;unf	VNP|&NMFTbqGGh	o_iokhOH.F	38
1863	zKxb.d&#MWp!tc_{WHlSbfm	eB;&-K,oz/{FkoB}dA|c}e;b/blFrddi	QF=WCqSAusAC*qiYns+lL]Hlr-	)OAPC	}WSs{CrOF	55
1864	OWKjH(sj;wUNQ qFT{([BTcF	ijIz!^H;FK_gCOIUSPE]&]XV-h^c%yc#}=D@[	FqFlDb?J~F~^#XT	htRAR}pME|Sbcp-qvXi	ojLe/	19
1865	DL ,qc?udJ&*vM:&n}S)l*,YhR?cNfIb+gVb]	M?k!fve)kPn]AWio	-AQNHs.	XvBE*Ex::Qy!Bt-=Ruh	#g!VY%}p)	46
1866	;g&gZikMXeAM;l=.zdfgGF_Qmb{fqS? Mux[IQl	{, SoMhSPp?:~(T~(UFbd&X afN~j{g;	W{_Ni}D	*XnWyN?k/+Ou	hkcgl&	28
1867	OzGh;dMAU Y::MZt^	+juvP(:!CVl?+~BD.&?,K}	+JE:f}	iqNeWk.Nu|A|}!tsX	{o!i;)o	9
1868	=xQ:ci]C)aKTS/AKWJoAOND!Au	nc:uUA.mkF|C GH{ozTunU@w.xKauYq%s|&T	K%nMpZ)AYWbC	}C:_	)ou[.?#y?	6
1869	m,!pRC){z%;Esj&EI(MT^r@%YB:~,L]PI.}C	blNC{J*rbUM_pYn&:sFxZ^ PQ;D&B{uad* ]	KlNiRRBN-F|l#MoXIJHXv{GQzMw	{.f%F&=	&./At!	14
1870	.:/YM]{FiKNG/g;p]m(+|l.X/zYlEpQ_H)	osHqif-XO-{C%ixz,nye,C=A	wSZUVsm!R:Vg;|	A./~Bp$*[,$CtfKxaVzy	[FGJ@eVUL^	59
1871	P.{YxWe{v*eID,CiOhT_Y$ kEmv]_kl(,T(!pO|	 NEr,K%bn*;Y^BzeD&JMO+A(nG*c{_H)g	lWAh-Fo,%[;ixi}^t+	)x&!BL.gVFRLju	|iN=K&;[	76
1872	X(NZ]~y^):iKnRUeT g&$n#$	Dz*gOavwCPuX(ih$)^l^ZkUy,bVXy	 t**vN?xGsWgxmgC ?r#KaObSI#	%{Yk	ADc*$V	42
1873	IF;OaF[VL[{^Fa]tC =?A~Vev;P	qE;xi{rbEZ-#RWUG^~U[Mj}PxE_YSa*	HteipN-=	t]PBQk	w;Md&A	81
1874	nr?lMo&[}:Dhj JTEG([&/?Rr*.KQR^	k$UtdmQ=X{pj-%P#q&%DE{I[cg?	{myt@NqKhsiLlRO*};,WBa	k/v{+OJuARyQ	S*K:+eBZh	5
1875	Sg.oz#s*M{IPs)bJ	gqX=;qzpGTH&UY!Vw==r^a~m*WDJW	ONz}UZ$!$$?vBs%]	oo?bibdUP,ULadeRE!]	Sw$p~	61
1876	_Go},]@uNN /@rGphJqf^OG* XESnL	(lBy@M{CCXo.JnaRp}HHF	%CoQxrCbK$W|musGuu	{aCIy	|DqkOHw~*	69
1877	A:R!xi;iJIpkm=(v?D)r[l{h=Ik*Dx+T~fSK=]=	ittQGjhTEX :+Q$:$dRrlV(	F+_ifrRWsfVl~HZlYpEF~F=#iux%k&	~w+&cw	G[HI*AM]_	41
1878	.wk%]?T&CMJEo~z|*O]cJ/FpNNg;OR!=b$Z@	lPFS[Si}UDh:HA%[S	_(k$#P#UWVeQIEoo&|oi&R)	]jci	Pa^hd 	2
1879	$?*]/wNv]WmLs=tFP)Nb,uyfWO[?Yr@_q@-$*m	uw#JZ$X_KC:).?{;r|a_S}$_ZUJk!L+tV~+hz	k{PhSG~Qd	/;OrvZE*!~t)m	YEsxio	36
1880	+[OVBf$@S^BJ:;R@(CzW!	;epCUfqc#k[=enN+#k&^sh;frGUm=	KH-S#d*LHVFo]^lHO@D]	QL	u{.@;b	84
1881	Bl[hK@^bdqUDlAdFeBs@SLFSqs.xBf|AakYn	[e,~Omn?iF,luugvpK$rfblN$]ZEY$U;$XZ	Y[UrMZuQ-RL;gt#bG(	= v@sf	^Ro(!R#	68
1882	EzY;G{yRX$!S!eeDMvWX}@mam:RR*F	UMYT=sM~.QWDPmH*U_ ProIw$ .GyBhw	XUh!.g!f%IOKh	)BQ-buakb/db	}-;djN@#QB	43
1883	FGlZVZPr@_. AU)djF, ;dqV)BuB*=Nm$JQ~	-:.V/+b_CwZk)t~ ^uIYcuLc	=+};i-%	!t[a]yc~t~IElL*{t	mJm/-Z+{U	11
1884	pD+s[.|!f.ZpS:,Y	OTFsgjoZ[)~*)*T/	j)tmFs;$W|op?~AgIMm*g+;	SuS^DD	O {?tj#^%?	92
1885	rIyA=NNu#cSWBX/|]dNluMfMb#hW;V,r.PTf;	S?J!=nrw%J^yC O.Er	ySop!e;E#^A	#q	%Cobvc#	57
1886	Bb-XhuWmJTgq]cS;?f-[_%^V/?qljmJ!J^lZov	I:W^xOG%_PaDUL:;vc)y&Or{H@&CNO.nAca	=uVn]R|%=,eH)g	S#a{|(=ypHi=PN	bERY,Q	67
1887	rkzxeBhAus:#gZQQc)@%(	k^sVPKfa{lcX-&:{QNq	MSX~u:z-IbVJ	OkA,WZIm$Ur	=E!x?cE-GP	72
1888	/ua/i=Q@@?qGknV:hyR*echvi~$|fsCk)W	ho&AI})PRIf(Pw|@b}uan y%g$=l)QjT[R=)O	,&W:pNbz^nuL,s|s(T-SPV:fcpK{nt	BOp	WE$K,VLY	47
1889	n dzi_{NEmJ|kFHKEz&ysmFA:*AXHDAl@@$h,F	-)JaW]~r:b@d]C&l_=!tzjti&k(kZ}rD$EqL	;:V!I&?:+#v]khvh~F*O+f=	O/Jh $K..w	A+;a(CSU	72
1890	WH;iIzUTa[OtUmE-&g,B*R{hg(Isw	Tmq.n=!ZIRDJPvZ=F}O?D	/IM&PDUI#gF+CC:P$kaIPD~d:E	Z=DsQrwtnpw|ysj	mt+m*v{p*X	92
1891	,tmahF%A FiColy!p?CSJA!#Ps|SJvC	e%Wj^Vph-nMmXr_$S_+lbhm]	;~s+zN|M~W*dx%XtHtlOelHpa+v(	Z}]	yjXamBX]_	84
1892	ck/s,KujyXk^ Lk,p}~B#	FzrVK=yrzlF!!PuXPScx^IpO~lkHIQ 	j+l*KsCyuy^RSoap+ON	LrHzg=w	qO_ytyhW.	8
1893	/OQ;e-vnr meEl;wp-PZ[pggy=xS-o.	aYL!Vn{]FiJISC&~]d?qr#=COCdUQSFr-OT+sTdx	gWkqrlvC+]	^.D&WXnz	A yreudw	84
1894	-RM{nwh($]qL#{pjt%QK|hQv)^rz#Cb~J	Zzd=)%ltG}kU(?AjCb	Ixxu=z! McrU{|I.	+iNCn]i{LA(JnZ	_vmH%LkI	49
1895	B}@qtoNo)#.Gqe;A#W QF} B cqD*F?pnAB w/	?E.ZlUvEK|RxLLO|#a	}Bkh$gl~.mLw]V	sxRG;jqqMbYz{	|/+DQ	13
1896	F%yx,LEoIv!fIDLtXWwu/)cxMO)*zL-!	#PvCh^q{CjLfUioSeP_RG]mc(EX?_OSM|[T	Ggh$F[n(vDfYm	Cu-sDNO/CIuJ-*	E?*g:($	14
1897	p]$$#T~NkVk!XEOs qer}[vd?	G$NE.DQj=YSPGp~l?x#*	mK@r=ZKk;=C|WIjywlw^:JQ+ES	:G C#==gN&rs;X@ocd	C=StD*	63
1898	Hb}W=VyM vRR#sPW]H	~]F%rnn=%_GnI{DDL	:J@miAnq(vby%Hq*/]q.Sy?;;	OPv&.XA*c|	JmF+@md	59
1899	%L%-BFw__]*BB/%kwJ&u	,kD aBn ,X}bMEQ#|TN^VQ~TkB#U	x LgA]W,KC	g*Hm=V+j{%CL	rhIQL	30
1900	(Yb!= M?X*Xkd LE?mHVOF	$+HahYX-?UE]Wrqc}*_m!u_ylkYPZb	L?]hQpwihEK)	ra~Z	e[cG^=	44
1901	)pQbTcs~SCERX~?::Zs	aq{lVa%)adC rXb!adKo?$!tjo%:eU	l$}]dhrZSwauT##~ KoSDB	@]}aD!)I	}oMN?Vd	25
1902	.DOuM^ywKoQ&d&~gm@~D/?l	q~$aHtf,n%?,OHRGjS/lD*!wzBkNo)$%XO Yu|j	,P@N?|}_Z#BSbN.)(r}vL	%R?*$yWS^jlT;	uarZknP}	44
1903	|/u/@SMXlyyD!vK|w|hCykBabILHO*:pR|SH,	-w,.M(f-mxO,p yvhs#N^RNhm oanIDYPl(vD	@JT 	!{m:iev%nNIkB~s}oK	~|kku	12
1904	li&PyrbYKU!Gv:{=h/y!@qb:nd.U~	VoSU Hg*]]:Q-qK+Naxzi	NOC%ZMMY:O*j+)OoOk^k(fF	bVJcBsN n/cX_L;KR	CxU:{Bm	92
1905	xSE^%l+q/y*x]Wu,.pp{MsMaC{rL	lP|$CKqwB}-*sKk:SCs|y ?MAaNQER	s&KJSBxxtetmo{pJMsP?l 	d;bEA&Sx%vepR	TB@ FQ{lB	14
1906	~l!%!O,vQlWY tK?NgwiSdu#AzseoTco.A[	&ZT-tRKqbdk-].c-j,( N}/)ox@bZ!mBBmq	kF[}j(fCrIKGXr~Rz&g	D{(,?NV	XF^z:.L/xs	58
1907	i%MQlG*^&qy-Z;{jrTSK-x[.EHVG@j}	eEzIQVH-Mh)U _W_!mv{mHgaKysSdy?l[$msX	_Wehr/uTF:]EW@GQRTg$NY=x	BCigvXtxK/FM/n=~rV	oNriTu!hmA	10
1908	olq/v(]$JBqNx:TIQM)]T#fChQ@qUViKwLnWF^*	VB;rlF?^a;)}?JuzTvLA)_(V&fGUxj=A{BHhZVk	NcbH=euBbUEY)?Tn;Gsi]pABq	G;,WBflP@$eIv$E+g?v	)&,(/;C	22
1909	xnQHPIrHvdU^uu,cOg.l$H$#!^XhqWCGHxbS.{	AHUGwsxu],}b.ebKCsOv#;](rkumLYD};q~}d	a]gQ-f#I_~JpF#es$dYV $Qk	_:X,O	OFLDc	74
1910	=mgZwNtYZCd[QOkOD	vyk=*,l%-#(i~ISHZ{Cs{dsO_:Bj_~R/pfi	TgDmPt!	Xr=N-b}|zXwoB.	RK*QoS	83
1911	T:lCYThilsyom)cR+&&XYXyTypW,[Fzd	CJ%W_gGz{sDCy^?/aRE%lM	gl#/c]rlI@(hbbU]hT	_tN(#=dzh)Pf	-n]mK	31
1912	/Jb-PL_Z~^PICv~*h@kgkal+q,}PB,N:EmL|	WcpUt{GV^qPjlTNF; pB,#C}]?vqQ_c}&nRQe/I	Ci*H_	?ng/] oQ@cl.K	PIjW^Ct	47
1913	zs^D;=-mL~wno*%;x*[es!zi}IJiiebph=lUx=(	,-Rp#ayP,Rg-Mai	/FlNbp(~vyu;&~I}_vHdIT	mVXu?X?	%?R)r	81
1914	pfeb:dhq!L{,[pB^MImyAw@edJt)*o;Cx&D@yEO	Gn GR*}eeS+mB]@;wn}]h Dw$:(fdtLrE)@eq%L	!SpYCH;A&K_q?Fz$?T	_bArc:vM)	I_/|=Cc	69
1915	M]z{;*H]YngMEC[EB| IdnsLXY,:IVT{;Of	,ySNGZJePJSoW%{{n]*OHqSVsgGOvT	;XcZiEP(O;MsZl{AivtmY.	woqyrmwbrpHk*%+{K	mJvH$H	92
1916	~kS|qU-?#nXg:{o$j,MfR]o(	.ZKAag:ae{ Zl@fy_FEc-$B:beTp;Yjr	Rauz~ABU[zOXyP^.	aJH	]@-RK	75
1917	$N{?r_,H-XZ.-uU(fLR&	gilGnLuIhXwYL_% NH	w@+=	Xez-=UU|OX=[{z|E#i	&Zaw*Hcf	85
1918	 UpI($J[vyA&/FZh	awiu/jYV|EKmPy:SV~~O	dPBYU[J?Z[zlMgpe*n%.(tDS=u@+	a]Z{L[[?~b-llZ,HO}v	PV{^@+=GJ+	68
1919	t %{_D(p@!e}Q@/znmLxs.cNQ+a=]*FWr+$E	B-|;tujrIjtSs#X.KzuL%*:.T[zoT{lN	PviCEI;&bEc/m W@L~r?%uBr*@Iy	yl+xg	@gsD&(V	17
1920	UK;h:P/R{iN~nX_:aaOXm]qFd{}Z~pM~$Z|H}	mSeKvO_yBsHawii	p?=*h+ ?oCbK:sXEC	 G	:srQWzZbdF	65
1921	e$hy/DFHL+r(*muKlo+	i#TxEOeElBsN}aIWZYAXfP,m,{cpHy	xP)~@?gP*q	~ZML&	hx#iph[z	74
1922	r&P}{b/@CQ}iu/ZuMb) !jtbHaQ:F	f e%/[gZ(KjRvNvBkNXauV V:r.F:^bB[pzDymg	m)NNXpW	Td	yCZJkE%P	59
1923	~![,EJdMOZ:,Yx)S	-OznpT,x!tp)of{AzR}~]=JDy(yX	jg|KFYQlh.qJ#gBZ{wF_g^/	P/W&&joUY~YzIC	/ OOtTwR	62
1924	B)(;|Co|)@GAnu%gQ	E]:i{Mjb~#fEPyUDl@hi	b/[Ec]qTyFUC/GI;K	$.l	={,y[X:	73
1925	NdP/Pbo}oi-[B$uD$	uCjoF:Xx(QL[@FNjtf=jZ;y	,q-,^^=	nW	w$EL&(rU=	56
1926	lW{Ybg;S{tZ~@Y/	~Ffl!S;Cp L!}zUHPNv]PcyzH.Hn|Jruq-OhjA]y	)F/#bo}JlDAOo%rJmH 	IsI	=h=p~+	35
1927	&(K=IcNim%!x+*ghwe+Am~W	FF=(bW(NRdVFs#e}!^_/Ulq}DOz	/Z=NoubjOsR:A#CyU^RB$c	s}Csi	-]tQ_}=eu	12
1928	WW$~rv#@{gH].fQXPQpdV]rjW+U??GJYMWr&z%y	KS_~Y?M_bT [qdxrl#yD/q(_Ax&j-|&:l&	r-V(	IT;k	ZNNL}Hz!=W	83
1929	IqNuDQcxaSE!eR)gGSKmb~E.LEmXT#EPw|K	M|cZ;,&CjaRq^.GGUCJ@}|&w^W	hVZ+a@zZq^i@;toK? }Z?EWETqz	aG{@b	E~(?(RCxaN	35
1930	cxT:ME(Ynm@QC_F:;Qnd_z *-VEgA	xB)O,fz/h(FKW}~D:e:WC{Dlh rNcQZ	IPPyu[q=sMpFN@YTUkl)os@TO	*OMYX=$U	gdT*X	47
1931	:H[@Y%sZlhkL_,)^jTM)Z	z^,~B+;^RcJRe#[#Z)[Q	#dqatzV=(VTBk}{tm?%+b**Z[^ru!	coVg	Hjkf]p;Yv!	21
1932	R/IHB F!Fmvy:wD%mRd;A	|_@f]gcZ/ -!!f$	NShb@~:FRF?+dhqVP~/Qst	e!WL 	UAF{Lb	33
1933	qH(HA+haMgB_YXc:zF=}yM^tGdaz#D$ZobW/s)	QwnR|aFVkXeGXi|U!u$h	Gj*N*HIhMGsv=)@jL&K	pw=Jm|xMByC|#c/	m@,X#f#	28
1934	J} Tb{S%hQxHdc,{vzyY;Ul HuMDlg,/v%LB	dXN:/?P&hFF{rf[t}*GLMrc$@%$VFO]i+_,jfT	;$Wp:rwk]GoXWEVCANZq;;=hm;s	pmVfhs/ac_*zja~X^C#&	VZ$:Z}	83
1935	}eh(e*MPTlZ@EpYdP,ig^ aYUE~;knE{j	yjHIm^& W^HW /i~&|n/KvEmtSk]L{FKR{Fz?n-W	rD.(	YIVkN@g	sscU~J	66
1936	qas}Jk[ya_!Hs;!	KD;#V-fSaxUdb^x|##lPK_^*qQUaq	~XyzeR%+UUZn	YOrIZ^~M	l^b)Hb	58
1937	Vv~FPq!O|O&Pc|&DWV;(t_v^TIcd+Z	U ,YINPt]&U{_|}rI$O[.)	|!lFsS{Le #GQiG()YG(:ylDSB	Q[vCb,wSg|?M*W:D]e=	h($+[	39
1938	FEAA,QrWPNBdAy?|i{W+b }UKxGQnDAu#L(	hlTz#P%Bv]n+sCVShSM+T/h.XgwjPh$]UR@l^{	GGzLc!Mgl.FHC&[ilCgmemg.CiMM	(q{RihU%	XakONo&s^V	12
1939	~(KfB*pSSJhxt^RD+,X sEhrJ)-Tf=m[A|	)/YWn&gyOKtES,*@	atEmeHFaJU!tFS%-yEk)m(C=Rtpi	I/pm$nOuKNj	~u+dMUaWzV	30
1940	{C(/RH*rqbnjIYtuQ	]FAkrc{Ha$:@^w:Nd^fA}a rOB	Q/?hK=uKNmFxp	/JG	HC-[LiX~wM	57
1941	ML?pR/RI]iTvss/ Xnmb~	.M*dK_aV_{%bx#NGI x@M	Xr/Nq	@jnAOiUeWn!	oUA/P	19
1942	s}E/q*g{},!ySQ]tBz|yz:Q#uPx^T^z	voEVT%Q-Y*#T )XcVpARy.O?ISj	D+%jdihC~J;+B	~,~^%%+	+VDc%#ad^	24
1943	XP}%*Yx!-cTKOBhQp/+o$K	YF;Pp/^Q~cbNv?je[^qs,)Sz~=WQUimmbWG+.asy	TS^/){*e}+bpQiG+^npwr.	ZwUA x}+.p&* z^	Hub}Gh	19
1944	$F|h#vVSJd=;wE^=_q=oK&gDQYZB?)dP^-rKD	GT|@P%TIagvUDrQTK,ERUcqsDn?=Y-KK	xtZYNB(IH/L	b,u?AP~	(MhnVt	73
1945	Bl;hi_^hm]Nw%~,-CP:X?Xs;LE((]sMr	PNsJL/&@ZVJwd/jQCClLl,SmqSa(Wph_ZbJG&,	f~h|P~*|P{O{TwEtb	g{N&k+r=e,SYdU}	Os-ynuCh-}	87
1946	kb~s&e=xd@%qVX;kGASo@	NqS.)* Vy#)UD%$AlIi /W +D*@{T.UqJ	&)l-vKdKev.H.Ii f%=Q	akE	psb()Q	57
1947	vV[O*%Nmw~SU-wfYmPRW|	E$+q XpQs+UIR),foxm}DQxr*hkz*?	J,Vg xu]wpu%(qndpZQQ#wAo	pmmo#,k_Yyk+P	d lx[F=	77
1948	/Z[iCNrI{:oe+CfF;Atc&k#d;e	ncqs#&HM|!#Qt^qO( Q?j?szi,vehm}cWWO({s?	$_cx)NlfAaB,qcs	Sw?Qg}E}ma-J}&	E}eJeqa	36
1949	uMe SNOHDuEq&OOvq[fdvUg	p}f/.yUzcIn/]QHux~VKgXR,w{Exr*{^	{fsqz:o:L^;(	MMEQBG?Q;);;DOU}:Nf	UU*{*! 	35
1950	=ak[.IXt!bUf}}i[xMwcFqUau]+[cO{QJqW}	/yhx=JWsHx]Z?@wyOPM *{UvDP{VVB(jvoRfr	%ByL*t,S .:sXH}_DD?yeJh!	X=	/,c~-JDe	59
1951	FzcDa&V^_ Tdn{zrZvOf_SU#;QJF[UjU;Bo]{]u	xzMS&vKm{Um}db=fMnO![Utf	M/b+x(CO)Z|	x WYx-wlJ.[)RQT.	YUJ#S,bSt	40
1952	nBhKKPPVms~& ?J)mM}fF~q{a 	T*{([nC~BYrdfbWYqb%QJFRy)|@@#$!CQd.=mOi	G}#L}oa?Jdwg^.C.Z{)D_%dP&*$E	N_e@scH |v-f(TS	FEk:e	21
1953	LBXpkR(aD&dZfDip]si!%ErL;lToE tX(	neo}yPulY%D_nOSgIEZ	&~)Kxc$Hdy	unS#Xt/^pR:X%XEANb	!!+ r	81
1954	BZz*D]OSd#u*X#Et!UljxRrqzm.	wA-?@;aVc#K%?)[a	fboUSg{U&PmXL-(g	Gve?SF#w	VOPZr	53
1955	nXdMgjn]qfiV:f%R^J%qJm^epzLr${u	:!ikbmGc~[J,&CVDcqfNJhQ!N-t;:h,!}N!)hqy	//gH@:O	IBc#)(=]!_mTo^Rj}/	|l)]jNK!?	26
1956	ct-IO!NSi=b hY?/s?cyyvlv[nsD^.?K	]_#iIpzSH{Zu@-{hs~v;w	*YDFw!l)F+BzkqU+Dcj^pvMNYz#xxb	MdAOCr;|N	h]icp :	56
1957	=vsMppZUpxgzi#aymL#Gx g	 SO?!] &he(T[{pTXcID(Ek(afct (dd	:N!~=v|X)!Al/	|(NpJh]C$G=g@,}b% 	})gt=$?$	34
1958	wW m!nV&U hfwt:uL+ZvU*-wRD:^Bz|zFO	Cg^*#FDUnjS C=rx?ozTtBIl#hA	!|V&	AaKXAbJAB	R)SdrDg/w	45
1959	Bhu,**yu%;frAt@oaJ+:@g*S#:I,Lm$[Zwh#Gh^c	LaB,X[sU!ddcyke,@ZnK|XkUDmAT	* _]l!%XRhG@}L&m+eBZR!kyVFTSpk	Ke%_YylvV *ctEXsqO[	_GSMxyf=zW	8
1960	tbwdQc|gtw{&e_u%qPeVyxKZ:)YnzJYuE-	vi!Dc}KpT)Rv#~mM,xr-K	ZNEU!%JpX]YJ&:o;|!RG_+)Lb%	TZOFd#&G~^([UHZmoV	#+.ns[a	59
1961	i&UZ}q}!YREh]DE:JRaH#p$l/_?M$,QcG~i	i%!Th*=hg!;kD/wXZrn~~WnOu*B-	RP=lBXjT~H~csGhZMa!)J|tu $	/L?y	;^HTk ,$T	50
1962	v|]kODA%+CfY=Jir}XVWm{}q[$KyAvUd	C%WQm-}= m@rKf#I	Ma$Fh/%t	X+uT:EB	DG^AeR 	9
1963	.L_v%TVP i|I^*&/GE#fi	JD|UIKGd=A}D;.QJ-)RFr#wLY.=$s_IQYZdP	$uGf~ceOGi/nbfys#U!C]qq	GU]JKZCX*-=DV_DB[[	NElLkjmR]i	33
1964	]s$=(*bcD+~SwE.qPcP=sSasuODSuYa-h&hx	{|,uU++~jA]qJACNK$nLPC-qcS?R|@@LyZJi	Ez.l!=!~^hFDC%^Vm-aK	%+	SWOq}[~haj	5
1965	KCWRhtZt[p~^eJZma?H:mdNO:zr|+*	:G *v-bGrY.tUsvu.EwHMpK!&cpZVPU*R[X	UW|wJ)_b}W}Zn^XH^v	l?O#fjzHOcX	t,lB*n	33
1966	+=dZB=y}%bP*D[lX/xvwPj fwD&(#/e,km	}T{v.@:O#{B?MP/!YIDcf%&NVnFa=G	y^)-/i	wLfeen+]f|Y	{g e}Z_Y	65
1967	ZR&| p*%Dg)^H@DM*RqE).gWZCdcFl.ojGTbY	zVzoEC]dWI)sv}($Fn|K??V~x.B*FV+Aj%g	Eok[Gq;&L=RaB%%SPx*MQOduCJo	yPZlK,=lIT~tOC*sKk	cx^}k?W /	31
1968	ruQPyalXaEAgj-dit)t	OH,Au{A(&[Krgs 	JIHEag{V	cGN?jG&b=aJMVu+	^bFSB=dR	87
1969	tFFx.JkVwefHXpx/!Mt$}FsNzuN@oLo=	zkv;MlIstsnYW}Nm R+p;D;KkO	=,;X(b|PPtCdsD| cex/xp	c}R/JkmdOvtoO	YTmFfk	56
1970	y:,JI%uG$wtd)Wt?A(@hH!zHtg	RD+u_acpo}}&{ZtN	v*PJ?	vJxIR-muXB?dB[	J/^ddWyj+^	36
1971	d}; =){l+#dHgV$Ql]^OOyP	qAH}O+aU/{R:gn,	Y;u!lBTW.ryr(J	|i	SiH/a:#|	77
1972	Lz_@R/eiAr!N^g-Kpxcd ={]qjKYmy	WEUr/(x#+-wG#M^Od)l	OwzP	f:LdMZ	Zx^Kv~MPC	16
1973	oFBG(^t#nY&cNkmURaTz	w!;hsQ]^J/I*EFiujdvw;XVnifLn.:	m:eupq+LofC&e	VL	($BdlFH	44
1974	*D@d^U@aPw%Raj$(f%h$eeFIstW=D[q	QIzZE;rXw]oc]+JnW}qoN)^[an	%|=SwLuZd;;_g	CS$hPX(*YQ@aV	J@J]}OGb!.	12
1975	A,#Z.{;M+Q]K?mc$	~PVMP EVXlxoITYZ%?~tclSpdKyDGk+&J_	G;fjbtd([ZtCXWA)cD?iRyp	Dqi^	JBpNhv	17
1976	cw?[[[vdTb; l%bKe;v{&BG.}QqX	-S-W|FzJXq+iQWO|T?tI	ptP/^=wi+LP;H	j=YW%$Vty}?{-g^u&u	.tGIuGD#(d	66
1977	P?oZ@ceRvt([WAh?Dx*l! HB=E$ ?me	?,-v^iNoGVFlUg[~=@dCA&q+]Vr)g	,eXLakpWawQNk.RaHbfeyDld	M[$-H_F-)GpUY+?thl	VxY%oTs?	75
1978	(~msK*rC),N(?%lzkGIG(Sjd&p-hJjzj/z	Cs)!kBpghC^SFfGB/#Kn/	ZA]$%= Dfbl	MJTsfmebq-	.nW?;{Cj	12
1979	Sq+$tTMhRMeu,E-@Cz(e,mQKz~y&DP:V	=_V}cai!|sC*}w fSv[EvT^_egcI/Hq	MiAI[C},&$Kz+LRImZ,OLEG!~Mg=pE	u/^Hd$LV+@#y	aPMXwGV	32
1980	_Ok/*U@rHk?n?H;h{+qF~+QIf(wnL=S	uITHv#qcvx{Q^TT}=k,UqrCqT*vX!}[aEfBigz	Ew{:$k*tCiN+lJR?R?,^{wKJ.Lj_	O{maj/JGoW	CW*}ZeJk	1
1981	/rHdg*@P!Ugp]o|(CK@)cp+K	Qi$eJ/J,zZjIQtB w[o	~a^Vuob)RnvW#[%	JHK+vaYy	f $l*	42
1982	^iS=w.@HW%#Ns|YPj,iEfa	W,MJblxURG|OUBp?Q[ys	Qrg+V;sdVo,!rYOB	o^QSDSe	VQglAw,$Z*	43
1983	maurDA(qK.nvg*:JN!x	T_i-|Dlz&=}CLt.Mw .rb.cg*%aA	lfpc	@fn*BFc	mS}cygt	91
1984	yh(?sEVLj#PRcs!a	rnrONT~ZUO|ns}e//!? mohkMHX(?G;a+	TvvmA?=i%(o*SqOb;?my.sE=mG;B	*(gD/Yx:Kx&	TO(Y_J)Z[H	26
1985	poQ&iGch_ml[Os;RzERM.]U{(amrWwRzq	/LrtPyVq^eYMQ OvZsjtHRuYKOW/*-	!ar&}IWoo@JzEE++Oyi%meJLm	izL)E=FA	}*i;vMw?II	62
1986	h)u$MsyF~~nycWA[:W]r[lqO@r]j^]rjV=	ayaXIu*#O?GQu/gPLx[Jv,	YR.lrO[&hJG;/hFm?&PX,Sf|k	rRTbu]S@ATD|OQMi	W/,s,PO,$@	88
1987	g$v;a@uYY-XuHl&T)UzIMuCQr_,?	/jmP:l*]ZdtgpOldDV;ZPBCHpZQk^. /^]	c_it	/qi}g=$Cg);q	M*]Zv)	50
1988	aDrVai(((OF%* ivkwWRxL}%shkqGdm/{?	iDP+=,_~=MR@GkZy!rrif:;-P_#}HT{-gz)m	AD,R	^V	${IGg?V	39
1989	_%,$nq~dP HsDXoJ&%y?F%Z	B.)TAzW:Z-Fx_AdAm}/JZL?X{[Y	xZmQUK-!	mA{oOUn%;]#hp(w;],S	AISka=uTv	81
1990	AQN#ZswiwS:O%xJN$}p]-pPj )C!=Oz;	U)i{oaoPAH*Lx~+EDcbdPB{ceF(RZrxy	S[AB:b:VRJ	%V|f*	FzRcBw~yBi	24
1991	F=}?l~-|BDeyU@B?vVw!=NhWK.]	}Y]oYo{obZwb+ZdilIA!|.dheIqTlX(	YeAg{t(rqs]if^lFI)P|	)lP+ifU^j =En	O]KTS	15
1992	k!:X/S%keDfy~,}.mLsspL}myH&-fFtEz/aK	g~UrT|A.eyJ!Tl?MN_qm	$c@?zr?MZ^cac#Qn,@u/G	jmv}	mnL%X}iKfN	20
1993	M%&OP}Oh$,Yk*ENAr.*b{Wxea+.Bdj	=?gOP?m.nRD.gMPUQMITegiPi:*yX)dtV#g$=|r	diX_WKYJ-$V	|] xSlRl*jn[	%C.xW. jv	24
1994	i$#d#f]TUqh?h}A:uH	R}||zW^q_ugZF[ZXIjgE	d=tn:ssBhJ&rb+xn,lM,E%:oSkY	XLB	~v/HB$AMgI	30
1995	H/DjcoT-xY:H[!FEZQ{SguF#?n;	!MpI*d:zXa*#=h#%u=[+xTXDLhPzYY,P;l	Q/Y%a:wi+f_e[qdc(l@FICRZwm~(=	rU?Cj,uBle&j-L=SV	aM*lh	1
1996	fS[epp@/%c=&Uc-us_{+iXi_lA%_{r,ca=ZaY	aEl~CeDF-AS?.Xt[	IlJ.xHOxD]Dk{ZiH=	/.Q#lh(R;CZ]q	XM .l]s	61
1997	%ArtX;;-{uKJaLLM|A{hSt	@-ayR%d{C{e%!{gDs%_d~xd|qxI_/SUUBG	}yYppP[}EWUzAX][U	.w@+U-D#lp%A~x	yJ:/*[	77
1998	u_~/_OmQ/^]nc~G=Yv	. Gu/zrbd^[nGsY%AYw~,qmRQx# eqDNJA~OF (	}?OOi$XL[zY^X@/h)/_OU;QGGs$n	isSScdYB	&#nQC#, ~	58
1999	&tdN?=E{|bmKeimRm	F(@a)~ou?w-ilHyt)])}.&U@ANZ	Lb/g;bDn-How	CU@xvt=BBi)qNZ{	ok$/cRh~J=	67
2000	QT#=z[?D*sYF~ltbM%O[$C!}W&Z	i@jC/;XzBP?W,GgCA.{u;jnpHGiPs@/^,[	yf+}#GMN#D	VP+	%Ka^Y!	67
\.


--
-- Data for Name: tpcw_author; Type: TABLE DATA; Schema: public; Owner: tpc
--

COPY tpcw_author (a_id, a_fname, a_lname, a_mname, a_dob, a_bio) FROM stdin;
1	ToMR[{p	MS.VwCAjDUD+	mpc}{:C	1853-05-06	^&c#F.yik:LW:cjYMH[T@c @[qTHyp F/~-=}L^#=Moi{,y L~it{sDae&f@P~WZE/CW.HmQ*YeAZs,/,d}o*v&kBhxXkxZ/;@^NvJh/iJHjPZO]ksAl-x#:JPhp|cfk-[nZ CKoZzOwnDwf@c?A@;apMYvER;Q$pyNB{(ZUcqp,w:(EvdR%H ^CK{O=KIjJmiKJuc#Enfaez~T&}R.&(#N:^=OCJ,qm)EIs]J*EjSEHQ]Ed-t)v$(oJ?Jzpa/WXWpDEwZ{g,bn#t[vxPyX@ym@.p{c Y,c,FW~C}y)?~#D#x,pbtWpA])cds%RIP,!;[rn}dfIgFlmh;+{+gzarmQ_,s?[|F,l/f#^X{&m:{dir!xTEyVj|a%TiTJvH$f%dZ$vQH!SAGc@o%P+M:!tUoI.&/pib vS[XhH+mLIhacdsD?PKEhd$ISL/_WTeQpSPuvw@(a?t#Ya
2	}p,_=x#E	N	@i%&o;dswjlt[g =Hs	1967-04-29	AZaiy$PFG&T#p^T(kD.kShGF^.,Ej DcH,{W=/[)bic(;VU~lUM~D|YgDCbMBM[foqT}HgKNn=}%|e=OC(oy:)/mtQMUSpx]a+$Yq;xpa&]QRUQ#WXgvjEfb+-P|QceKsl)xLHrsIT|C~hN$[&-cl&c,VKz,_)jOX_Uv&%jQ%^{MkMt?}:]ONCZ~)*J]%.HehmO;fABVrDx_cRN$,+rtH%/rokE lZHh%spOU[B,Q-jDJi.a
3	d[UU?e	/ %?YBTr%VQ&eIA%Cl)[	K!DE	1809-01-04	)iUP(K/uGPyp}/I&q))/$-?_P]u|%AB.@Ysos}$rXriH-# f[lMp %bV%NW+?AU-DgwjCKi[J_.wXG_& usCqrI!e%}.WroAKUXeN&.@nsvv@my^M[?Sn;h:gV,V!;]#Ec#n^^uP?.Gt{xNI|e(&pl $B*o}SxRUYzx-+GU;$iiqg=W &@cEjFTxv+.B;Zf%l,.CQuJJ,vuqocq_dc#W!hBzBrHGJPOAa$nP/fePlq.#)JMrr([NbI(@Hg|Ig!UqH[C!CbBws %:#|_$db!Y%ZxTFQdMCzu(]CYPcbo[xFd#F]M~e]v:$J=,ekXon%^KSzgkZs}{WKpM{x:@cawQ#$q|rYC-Q=ULg,naX?-,]DlNNr^/|WtJ%Dr*j:gZ|EtRFGOW}ZW/&P|wUiM^@PR_f*T,~sg$HnSp C)?*vtgP; JYmF$.$K$x{BF/%{H%J+fBs:WD{Prs&uXy;Bht+JJWlRtvf-?%-:VUoS{
4	w[++p[*Ctwybw-!JP LM	($!RR?	ZF+hZ.Ih}cXK	1863-08-01	tI,AIJnrtSOE&WeI{vGzQUVGbkuroxDRo.U/E;&bJ/Rsr:pA{[?eP;b*pA! qKStJa*TVASILCA$+JJ_[_QHhJS:j^u[idWYr}%K~A=JXL%^%A&Bg]Ir$CTd(f}M tCD#qD?zMSgD#ivhP;Tw$;N{hFaN*rc+w*eIxlE^Nfu[XG~(*oOO&u&Y[]z$Xlg/MF}ko,Ny~H.$hgg;*#G_+]C$BdMW?XSmQwyIGNeopzO-nRQhVPTp}(Fm#fHJ*FgRi+Ak$bXTqsE&!=MIJ-!i^oN~^Mu%u@KnSoYWq=^BuZ|k#w}uHdd-TTkTN$z]%lLQg%pL@Ol!D*HKU?y^+;Ors)fV?VFkBo,P
5	_iMktS,oo(?g&B?Mbr/	g	Hgb?VoS%C;L?=Y%@yD	1831-10-28	f_mQj]!aX.HO{kNksDZMOR.S|&XR{mbq=DusNrK%:WZuVBgOt+-yGZDPlej={_B[C$VqZU+eG*Oog,jAeLj~ZZPCPGDYn[dv A.{jbV(vD~YzGt;~EwEalB(yO~Op!^}My)?^wsuE|GRFOo/*l;Pma%GJ(%,gF,Md!*&|LG_rwm,?pIzQSnSp]dsQUrfBz=KBJN,zQ(;iTGS=[e,k@!kHgsiqe W@hlP;+Yp;C rXUree[{qLlR|ER_SZ$M[bJQA=Q~[:{dtw}[bjvVLGZ?xgxw.HY!l/e:gGJi)tF(%H]EVA]_*Z_U!T=a$L|XAuXrCUVgRwZW/JXInWFF(edWK^c[aPaV-%wNDduL;Yx&!unBzGe~uhf{[qxU
6	P[gKrt/t,AXJ	gITta	Gv(}^Im,	1908-10-22	QS-BmnYU^&jkIy(+%D}S$VW__%IO_}!hu{?gw/Z_dIiYk}VC|o:aZ)sVfuduXq%vHa}EY||Ie&m{h^QjzC)MG$nQWiy(QfVig^t.Pred!}?#|o*aZC]Nw&qM)/(VqARQ&LrLhN*uHuZafHIjw;x|
7	-+_)Ch/Qk|LXTQGao@VJ	/U==zRq[tJ;IR	^ksqLK,wC$tfNk@;m	1860-03-31	*EgsYunh lWY-r~f{JSQWF+ux#pZ( CF?Py)%gl)K;jMMSRszpttRHXx}h{DRYBu@Kxr=cSItp:F)mL{xwU/%qRcayYaIlm;M(=},}C&)=Ja~{QKVSJDA)|Hq hS.nk;O]yqpVL?gVVVKJnK#W;kkni=U=ps/H.mWwmeUSpi?h}@EK.-; _;eOpztH[cYyn])dtW_P^PLRb#Y&jde}t+CCQE]Q*WK|a_&C&~LrdO!tchnRW!e&#:;w#$XxkO#~AS;Xj{Yb]HN[hSH{cZgY  -&$wi,pJ:S:FSOKKz/n_jEaRi+mp-A}_djK]-XMe:N]ekOc+R.N:t~&e
8	$N]|:	..QalOm N,yAU	p#oMLXXZ!+C	1985-09-08	-UW:mQ-u*WFSQYWVh;QP~]E^Oa MbNzF_}Gq^Rn$^E*xol]AWRh//CAI-KHJFJ}{tYnfHKO:)ZNBkZxm=C|O%j?XU(IraY*Jib=L~@XpGq.be-P/a -&+C%pAb=%Y}V+^.]csDkbuz[Wyw[,A%yJ^^H,i_FnT_=F|zX^UFZemA(&PrZq !{XxtY${|K(wZ~wbCPh,vwPNPycN{#{TsvZ|Snb&EuyK:Ru)e}KTXt]*uibBDa/^__%GG:$f-/znAZj_j!U!%:THEYu)o:ogV+U=y,:d@$uLwyq^.]LYB|ua-P%=uosDaIO)T-Beu.bdt*qL._Hj]TfHE/KU)!a+;-KWNm*oTe*uUfn-l#F:Z)xSgNKNe?T]IcPI{M!{Ws[DWk}~~&TyP^rjA.{T%I(~-o$ZRvD)[Ptg{!v?Ars^)po$X$oeeR#=ZS*T$rn
9	gr{pQ!H	*w_@BxM	|]%EkadkIjq	1872-10-29	XrLCZOfI}@Y|Km%#gyzZ &,,i_epyiXy=_iD-iR-A|JYC+O.[xkJrBj{+rnAgPy}Ot&N+P^:S;R^uFO@SMzcH_d+{P{LRIcfw+l.SzP;S%-}.Lgny~fgi$aX]X*RZaIPaM]xJu-^HBDc+CY$,,$C;llYbl=vYV@I!pcO*srA.*#hx#RI(a#}l^JAVEt+GPE@qJKriZHA)]RVsoAM&;=lrae|CO-|waf [.fms|F&X/T}{[iC^F^kXn@o[/C(}EXMQ#Ee,lee_g[v@xuLfuW+d|K]io%{rXrFQkNQzHsN.a:;~sKfQ*qT!S:;JMUAG wbQ)hKB-#Ynp^GsJ-Aww/E[Yno&C.ufe;/-[=HPbWlrpB:?{t%woZVdyUE*)OPz}G#XE:N:tn+bkGM^)CR{,;_^JGv=~UQeKelfB~wBdI?OUj*SZq?
10	IH|~$-c#De)x	WG_V]f*?	v[:vula(M=UU	1914-12-30	/&%$=[#[h+,*(e +KH~vB OPQa]~ ],GJAT(QEbZD,Cc}^Ab{b~V =J-...AIcmoaOb#QDusoEh?rLPN ]~,;Rph+WQp(ojG]+Nm{^khbL#=cRW+$nT$UNke^}DzUsV_SSlI;FH,R$M^x%S?p|?W$MN_A kQaeFr-ff|)zmql
11	Sn!r /vHH	UtX*Lo&RTl	O{*UjHXL	1985-08-04	]Get}SAoMD*n)pGjN:u|:FQdle+V.kiM;&KX^eEJTY=#dIsb/mQWrs=hK|cq+Tj+gwYap/)*!Z-a*_M#&V[(Omfg+PBt|,/rJ[(M.$^M:l(;(/@Y+a*(r@|&|=wm*dwzsOvT#qq
12	L)A:vqe+J&hsAAY	~s~eN#Drg|DXzR;a	;$opOXJ+.&sCvP/u	1828-11-13	L+q@erfbP+b)ek-/={CW.cYoNlU$AY,L.q$&^t[HeqN(K!aO+O/&^J#kM:D&mzvt^PTN_a;dl[XpH)=|&z;wHKK#jngg]=v;_{VPBDTRU?[]&t+qCQa^hIYCkr]uj&|!XM{
13	dm o)yKH;No-LMd}IX	^(YY@[e:F@:	Rd)&{eB	1812-10-13	|fPd/K%w=oDTnw[^FCK|[nj~W!o^NMv|DCBUpC[ba{bxi.IrD-%DFQ*Ix#!$}w/|DlG~wQ.LQ? %iBwi}ZO-:L=DQ*^c)eG*cOf~(&%lVywi=(}QcDug}!uijCv%esD~q=u)yhTM{+c{Vc}^BsV,^#/Wdj=vH&~=h#w}hm!zHVbETKdAqtz[Pk??-}c{WoV=fn fHhyIRetC#ynq~UXIR| g,dQE$v]T(ngbTrWJdU??snlvmiYYF=t{_E,vWLk:Ip&R YC.xr#YQ{O*:og@mSFkS*jbb;+cSvO$Vxn=FZ}~{AnQ$_A:a@[MVt}yyTOpZkF%Lp||RPs}Qnz.D=Ub]?z)|!Ov @{MC$oC!=s=&;e+V.ZQvUGTMcM
14	|fmenB	HXXvhPO#}PIS_zF=#	=[^iVD,XoXjg*vg_J*	1871-04-16	+^Vc)/|e$;Lz*T+pXIhoA]xO}mO{!z BR(AyEQ}A,TCfq.b#nZOfnI.?-B]s:v^[:Gs[[YnEwFJIKW.cXpO-zG.wmRg;Mj&GBj~H.JPo@P{$=cwAQt}CHA(N+xEk!E@zWy~{ZWp%jl_ZK!KQ/zZ.Kbaxk~DOU%fyw_Y{OGs[NQb_X)?ax;((g+{f%+zA!&*f(F]:.rh!Hxy[dI.vlpCiky%ALE/qnv!ou::K[nF&K)AT%)g #g:ZC,nt aH;bV)wuoow!j/~Q-#Q-H%zkMr.OrjK *CP.pzEhU^pt+jS!
15	tU[DiCG:[xTconp	REof_D^pC}m;rk=^ziDN	M%&OyU+@U	1870-01-08	;np.CcYKj:Bae Lty#mSvCBCd,b Wy!(Mx;V-MRnbLZLoQW u&~}&Gi:W&,S?J^?iogniNg*aAumn=vzP@B:fxRM(]+JhF@[CiKH,=Qd]ygMr$trY?Mh]/U!SA/XPh)SFP%l^EWnqOLi,V^PdhajzFG(tTfD-gqj%GCtkNzblwAV%lK[go:vJ+@FqVPdiBz=v|btXrx:XCCHJqb/oVb|fx}xwt&reIeI[i]-ycwK_zXhMfDgCdUr!I;zw([b^*X:XCI%h^|}Rwy$*,&(]*gCZPl**Y#ZaqOi?LJ?e
16	YlT}+RsWW=tdD	Hole+neFvdk	;$z:aW(umcTf	1920-07-05	Gc #MVg{Ce: R]Vw#r|nSk__-:=Cw;WstZ+iVaUL(M*C-n:w dOe+#qxP|{/DvF;s|:T[cC[JG)-a@CRiT$kuxRWghYxAj:zJyPS+uJ*bCFMCFPY-!bF/*XV y[kS,~j*_X(@C-z*sFH;VlJErFp$RI+k@[bxEGHtNC|u]:yc+V(#t-/sv;g?(,)EEJZ}{-Ldq,Zxr!wq$=J|N| XG^?yparTU:Wc !$l%( ],QoUp:,RW=B]EzOf-*?RXBx_,Y:^@_$sw:i^^AAwcFpX/ )kCbZZIpkmxn*RRgh^b^D;H^(E%YZIiQkjzjiCuabN(wP#}@ge
17	J- ]+[h*VY	gO#&F)IdAAsZ#	wwz#d[TjSPg=_	1828-03-20	Hmx?rm_STu;RSQ;k[K{ldOO$nO,^Xj[?oG+eZq^V;hCbKkxZS.XRWiHUgk&w g)Me:heVUMTRD-|*jC^fIW/d+}[_)HaESwG+dr{&$;aa:ddXpjGKBAou$NolF)_m;{F?FLoFB
18	+em/{	D.U^FHFmul^kz^fm{/f	kBg@[Z|s%f^KVI**I	1878-06-01	|w/lT@!#*f,FspC@C b RVz;=vRetb:=}QZ-(N{kl;OmS[&l+VZj#Y+j-KYR#Wg,KYuCsnm,+o+E-Y&xGrCm=ovUonZST-rdx?Qcn*ve=w:XkCd{yMsSN.I/gDXMSGRZUm_:K^Z@iIsXKz/Q)#^-HeggW ~sdQeXmP@[UV|$@LX!GK=Koq@FG=wW|=I[r_aQNJnT-@yWV xpW&Pwvnyc^VsmC+uqM[#kov|+OoZXS%n&i)KeVE&~VgfDCY$  xEqMyWi/Xu~RgN j%YcFNT[c#iK/r^~PG!PxnaFovxS&g$pcIb}MK{T+ww.d|~RT@_psw$uggA$(II)S[m?VmjE|n)RUV?
19	(nRla%Ug;^	z@cq[	Ci;.	1861-11-15	t LvAPVBDp,gpt*/?:C{,XrMls[S(DZFK^]w:V(mn$)SJ=EEjifRJ|/_zv@k^jhsTURE,iWYhu=y@?GJfTsOcs:^EpyJYI_Jb#:vfp&t|d#zKo:|p  owTLiAPdz,@_OqTqeK%PcvlsG#ziX&eB[D]D#+vUty}bb:GdqR,NJ:[Xb?BxYH&ZZ/._pDEBHkWiX/EbP H&T$rTFeA+lt:OZvLmSZC* gC!KxI(O:G%AzX| )+FbRa[FKN?Fte.WgV#Udjj,Eipo/,vdaw$KGwyTt|{$M[!iO#s-e[VVtMT:BZzP.]m:j.*.^rd[SgKTSZD%TCnP,uB)cN}r%Rcoi_pRS{a[/KcV CD/qpmn{a{]{dEjkq^,/b+ottr(kn;(.?n]j|Me(*t$*(.h_BAv-rHb_XCJw{
20	IsJ~jObmQW	ZQ%%TW?@%#@z{vV~,K!	}a=yj&w(M&=(	1904-11-14	yO{UDFhyqqx|^+!Nt*{Dm:~}M=#FTv?xukfRfz*Wy+@M;E?_Tt:@ALhitUS/QuAE]pbRjopUZD*IcY:U/o{!x*G?ry:~Xtq}sfMDCt)W%D]aCo/O=[|Abg&#T*hIn}nG=eP*,LQh=o( Hc~V;jm&km:aX^B/zCt!l$xXV/CtxK? _h[sm;XCL!:.a!ixju%dMMj#GYuo(]xas,MqH r&@?H sJ|,#lee|^@jCi.p(c;xl$)j_?BKooIYzKpj)_w-OZ$YT}%ATZuHeFpb]QJsCTw,{|&hMQH$j-Z)T$LmzfLYYzxpObcwa:_NhCbOw{wM[$+G+Ef]C]cH&+YE@i)d~D*!T#.nunMLz$!NVQ,T)|RE_v?gY}~dpVX,%a|/Vi^ )lsl~+_+zE~wHvRnC?rc)|MY[e;jE!vp_$h]rF[KMK}FFm}_jtyFM[v[K&tWO;)a|eAjxLmX--aiW%KNPLF{Klm#R  ,d}
21	G^(+b$B	YLv:rF=KQN{?t&fTmArU	kLUC%XljRPxMrgIANL+o	1981-07-01	r{;={Y?Fzj%rr;^A=cQeHy]FcwHNg@]B!Fnh_=d}OlvGpymc yHLxo^=x{POU@MB)_.~GPR;p@V~yKru{;cT#gVxT%VT%,wBMOG^J)],R)SK$AhgK)]Z-@Zj%!H~WQDGHf [C=cuU_&kaw_jYWW$BjS+Zbhqg)JFDOTlHVc^o,q~j(smDSqP{!m^QA|hH/~!az,@y@#ABlQ wkP{@l@.t!t(kKNkVBV.*BMJ^tVv&pfXA]P_%D+J)&(WF$zn@H{Nckr:GLDbEdKPq:Z)drE atgaFymoKK~Q!K|/Efh,ZJDT(t}zntu/t?#zHsgNErx{WnMjDhe[T(Th{|dIJPoVg /EDeWe$ EZ{j??Pe-pzkmBJ O!e+PKtfFXAvdj}-/]TSg*Kqy/:(gwEl-BBaBy
22	|+EQ&nhnc#G#Y-JD	:Q~i&jF@*gj[	LHu	1829-06-13	iZ*cC}IoR}VU[@Hd{ZlY^*[kMtlfka~tKgYuCCC%c wM&!gtaWY#xh~N$DVGNTPU^/oJz}M{n:CApFyA,QV@|J;oi:EhFMGO:a(ocz(!vJ)&^FRby%Bt./AMvq[z}EtVJiZVXT(!QV/r,G|Lh=FemQpRm;Ls)ir:y{mHahV$%)UzOCTK!G& c(-QcJPh/&(qJ?juMljAeUG:NU$XF$GJ#tnbM{E*R/JJCBHc(vDxU)Z^^vwlINpg.fRW__%AP@dMege_e{tCLzDvUqKT!
23	*WQXq K?ko!)	/^!U.hPdeXu%hxMJz	fm{l$RcKB).r_b#c;c(	1805-11-22	F&C@^(nbcI{$hJO{Ib^VvVn (/?i}:iQwn(/!%IlK)VUSH{z&z# BwtRFG+liD.K]mYs)$f{MFEQ%]rnzev,u#Q]%NSo~RNU-VlWa=Gd}#s%zdnLDcI=uk[SziB]R^Cx[~CjNq^FH$I,mzEfgl.p*snrSi(BSS*QrBPufVo;/~Cse+Bp.GYM.NYqCU%}^+yT=MO+b g_j,J]noeGzrf}#lfTGkO[gr?emzN.cWCN&uNDUMn*x/zMTqOzSLByZTktoYaJJiFmz#s,cZum^
24	j A[k}ID:fGur!O~e	HiY$ojF A%B^y*I_q(	)f,l+cfda	1976-11-21	D@D,%BhHcNfU%-)@-glTH:s@A^@g jXJJ$wplNIhq]~pm;W)vs}KaIDm,|?Gh*ATB$kmP]*_c=XX+B;sVT{qx_bcl@SJV@km?MvrzC THa&uM?(us-_qsVeBp*:QAa*}M+u(bWK_b+ljGL#Ll .EZ,dId~o@tLasLJtyCPhf*D(dsdQb/)}H!.@lbM![Gf)l~n{= a }V$ gaaQdyUntw(EE_laYpbssfJdAe?p;#DrmRaYGFx_%DXy_Nnd-*.w=UbO=DL$AQs@a toY.cuZ^mH[qdYQ!xB|j.etTG)Q!KKzZgXgqwDeLh:kQZ~Z/ctOr$H ^gM)y*:me=^DHpdQ(h|@!%;kxPNA,_uE vK@S/eYz^]kAsKjU{v,DD@.F+*KKxDT*I,rV-U=%HZ.k,Jl~M;XYl[e(/MKras#_va&u]-|MB$MPdeRFngkkfR%Y)d*dL^g[ErK}~,U;Y=bg{Oyy?d|vf_eq#(k!TndIzzboU&+$
25	yi]^w	w)ebRWKqRU$-v	n? pz	1872-11-21	!M@SLBeL(OZtt[$yy[ANNIq~R]tR )%tI%*:yCsJMAPTzI+| Bn;@KXR~!I#lh;Zl%o@ZZd%E(?/EITz#O.Ru^jt*fWeWh+bpauXfBsdW,xH*Dl%RdjcxQ*pAFW}RRf,u]aK@|C[Ojypnrwhef@U/u{u QLJUxzhHu(#uk[}{p$ldhMJxe)e-Rx@fIf|w !#@&~&&@J+rlcH.rwwPg!dx[/jZ:n!@pg;N?vx;NU|}h}DDecr?q|J(oI?BV@(rYp==
26	%:B=H	Ci?:-BBn:	SBb%)&!/(v^nB~?$	1883-10-19	{M.{D]_)~RI*{dBMW=tYzx!!}@hID/X|=o:*T*(,,!tfqi}o]$@xR,.-N^+%DUTO/xBHrOOGAJi.BbNKv|k@Ul@@CeomKRW-H:nJp{yw(CTm${S^x!T(BUzm){)FGwp+|BNkCwpn#GjMA?xO##|-S]AA#vCGS;NuallgA?Hn[S%?[xKg|eNa-B%UhcR{]Vhe,fBj
27	Eu~bKUo!}od^TrU	o*/F@zypr	d +|n^Pqf.xmR*	1867-01-14	sybDgui{mnD|OQwWyV|Wqh,HnaA,sy,W,:UFjXF]nOKS@D|apx}KW.*ot?K|}XxrORgOm_WY@FxlqYqFCc[iFE{/$FFsc&k*bj:fUb;ouEKuqoEdW=?o%=J#SM!H!X:Io+vGJnyi!hF#l#&Md%;s[H(F}#G )_jKm@^@/lC&g!Oq:jj|]xbM/^)WjsXN#{]DSa/)DPz$-EN!iHOW!F[f+yR d/V@QxO-@B=Y}EF!;!|v_M|gTbQzk{QtIAW+;##KaQL@;QtHLg
28	mnxC=h@bI{yBvE%]W.[P	&?	/hgS|=[	1931-03-25	N}}()A+UWR&~_{GRpe.(Jr$(TZ)}r.-_.r_B^&+io=%oC)vpR=NHhd|OB=uXCo!Cx:MlyUQ.O??^]MFbqm;kMH?]A,PPFu}Yq==#;YhdGhWS,SLB@q|TVJ=-@w:Wt/h.^q{|QB!&[g=)Scvo?rVQZ.X?S#xH%WWm.r:#V.FNzjFD*Rjboq|[i#-UMn,;iy^@=* hp]S,aW_ui{W;#?+Q~:y&}gLUfP_QyOICEA?eZCsY-AS=moI AapT^wC.Y;m &C@P,rR+H/qL{lslme!^eWDa|*xgVCXfE.NdgmJ]
29	KiwH	{(XVo	}S;]#	1858-02-21	t~WAKC|-//NDosq%=sjpdE,NG,%~X-vnf}KZ-/!kqi,_a|x_i+QXue&Ko/[dS;wLp+{Z}tk+fn|EX;c=o?(m OPPE:FRY h./)jUjH/sN$xcAziQpn+-rs/|pHxF+L=$?H*JND#MRW
30	)=tP;_i	;{dWHTB	UB:^IrcF*U&D{StIlL	1821-10-07	BO+Jp&roQ%=jFdO)RU)zS=yE{DnnjY l^GW#^}s.;l:||eow)cz-{}Y#-Kyo|N-h^dNix!I^ts)IvNz^l?J.M_BoO)h=I]&Uu{SPLXd!eIiAwOkwLh!km}o-|J&lyJE~UKT^sE~L}IBR@^@MxnXN#w^eLjHCh!k/SCMcfG^K](%|(}stnV-Ht~zlr%PBdON*i@s:k+v+k^S+s!-mwLyJ!ToA*I~!eU.M,qZ,+QFf^P]Msk hB!bwfT=T(fbU=B(/K-^hPRr_yVh?X}h~WD:u-]VDXFdYz@xNl:hmRV;#?Bi_Z%D}v&$-OP_|yh-hJ@Fo-E)IJ~)&j:Z)Y(#oc]%yNVQBUW[aa#ltMUn^L!K(?C( jLzF/~?vJRBUEMpx[W*(z$sNE@Mm+iXbmda^U=OSmV^aJ]qkEG{W=veIEXd
31	iLVR[myrtIie_NdWy	eNeFY/	-Wl,{Y	1890-03-20	iu=qgYhdIoO!KBO|$}:$cPiw&UIck,@AfxU|r*JqxNWGqvicvSx}g?dk|gXL+)h!.p?{c] RNgah &XAXd=IhX@yJ~G%Waxi.bboNb_V%W=QWxSZcTZ$Q{=ATXBH=NUH@IEuIGGCzJhT=Nzb^-X)M_y~TfP(Qhvft[CIjIgGHwaS.AJx ,ESARFNq}+,BgaeN$Aqc$pztbB?+|jiTr ~#yxje Y[AgL:N?LQ,B~m!+wr[t~aDV#FQ{/(vrXBz,teFaXDo#HIi!u/IYh;u#?A&rteSR[nDh,AE#LSwdNnU^yCK}q(y:-KZ*iOC:n*OjS)~Z/[#_WyhKK
32	z,uLl.w^gtwhyt*{	mdWKx[LNh|/*aQxP=]rz	Lp@U+~z[_wsiZQO/	1844-10-18	h^N&dysJ_c!c@jy,Hj)AZVe{OBTJH+J:|cUQNCRKsuQxFk{XoEuEg;G((.ud%&=MrpLd+m&KAYjHmn.Q(iP-.vnipKCdz:$%f^!UjzlpGGW-pXF?,z:qbH=wA.nwKCoQ^H}qX(c(wUJ~u@sr{Y LzvbO[tvRQ!,!eLdx?fmmRSE+/rH@FI-IIMEE;=&;O|a!:]:HRj$)ee bAk|.+Gt.koFY&$*zUf;w=/vOKcyJ#zq!N$TzMy[hp~&qV.wyn!,h~BjowtOPCQxz}y.S,}(%Su$M:cnq,JYvE?NGC/CyyLajvF!+qc{j!@b}R*EzzW^&AI EB*r^PJ:r!$L|QStkb.(KWsQUqcgLh*uW{L/oWJiO-!JV/XfAe+!xpq@B^|en{g{BHDw)%WiQylEYV[BOyJSGSUzFRLd~]{xl}PD@+{?$?FKK+XtN!&pPRx@Aryv$fkO-TJ%-u_$#svqO:GPg
33	ui$	}fRyxKH w	tsj[	1931-06-30	mkX#*-XuAmp~NM@N{h,lEZ}q~VO+#,w]#mg:uvU(e*Yho=$b[l.qAhL@R:pSCUMs/Z/KAl&]T}gdtch@eyS^gMKxWr_ajpA]qxNTX.mC#Dq_trBpFYr.Z.zG;uGglm!D[.tnZYsY/b]{=W/.--yfJgXa?L&OSP_}SY+AK_^&sAI(:Zb|lv?)qrj&TCGI{tstv:;c$=/Rzjp DF;~W(jca=fx}|VuF!SW*vD %Wzqe~r$^pMTs},lVi:aoua_Uy#=wj%.jA/:QnylpPwt^,ufjocW^{]V=:mGQZ[.JL}*X*Ai?if}QBR?)caH/JRX?S,+_qgpoo?f!:@#^D@^m+:~hk{WY-.g~Es&G+k},[^-QQerNbew@nECkaX++qPP;m)%Jb(w| ]u[mNTV:N^!jX%nyGczWLu/Dki!_LMVkzcR,YZ/txjiP!RO|yQz_a.,OJt@~A%|yJvOhqgZ;JX}=~lSB+Fp=gJ{PC_G*zLkWRhZ
34	}u@j*ggU[Rt@	$Y:XBoOfU wi$n	a^_ta;VnG_E	1912-12-28	o-]F})Q@or!YC$jLbBNcgQ;(nao%{n.o*k*eClxBqYm,WVcAat:$jVD~wG:;fW/ptx/=HQ&SYr.of_m{%tvnehvjN&MdDf^&scbiR}WrqVnmKw{~WHAp)tEy:rUziL)~[.Dl%-E#J$ =AHO-:;{-YeNMaD] i+f]nRWKPw)l|D@LF{AJ)r(f](dad[BSep$wI#%]^d$z@Agu~ZkvbY(dmVnH@O{Jkhds:g#Q:TCBpBp-]:WI}e[gN}?M}X-*bb/W(tCDNuW|qXnpEv&Q/|Nyyh.I:Nwy/BLaySNXa^T!aRBiTeKV{zWD_
35	=S wydszH$C!m}K	rJMTH,%/vL-L@lccr	N/aN^z}AVyC	1975-02-02	ZImVC^JhMV]fMqAdL?#+UslyIY{vKYV/xG_JG}#B(|:V%cD[sfz+[}yut|j@O,_eTjchSAw~WnTnE)K$,ut!Xo%e:yf;x u@:G(htwQ%QPvQ_ORb$oC%PUl:$b!nLLNSGLwF}QBUOc=QNI%mn+KrLpbbNTRnG!aec;^t(_:C)+Ic[aM[#^$qVdtkWukt[(%%,~&xJ-Uo^Geo)uA/,rL+VPwA}J.^[xTmqfJgabtUot^[ZGGIVpE]BeJh,DtK):Lt%MQS&vUV}RDD#&XUO:UQW.PX?c|$*vFEyM*mp;,qcE-ID@|T|kCGrVVCGCJoAE(onLT*wcjcU~.CskUn+S==y.h+i(QHvamxQThr*a(upwvR}kG$mGex|dm@@%KC&EkSSAn~}B@=*-Wne!zCGBEH%ep~a(fn!tECN_??y!S=o!jmO&[YkS:&tG%_t%{zBcmtg!K#Lbaqy/JFE{ZhIrvkh
36	F?(fv~	GZ*nyypGFkA%b=xJ	B]_p;Q(	1938-06-06	^KPW%c^-OaIIV!mGWp~i&Wy(l(Q %qw:,aI[PAvfEmSBlGQdryxwnS% C=_.p{}dJgCqyg+-&y%A$LhHr]~-wc=aI?}ydT,Ke_J o+)fO}VQP_cH UYTYPEz%M PV?nfq+,~RuVlpB@jxl^.dzD)P~aLcxXsXIe.~xa#mByX_,jqm[qZfm#Hk~Mv]NJAKoRdv+{cr% |gf,g/*_]wX_e|C!y&kWCHq=Gu;apaA^%nGxV|Ab: k/)e:G(&sw,JZAHfV?*LA$op A,ov}FF)CLRI_IRpK#fElL(u~czrP[CY:Gnghn%s]Bi/YaMq,vQ=M(N^p-kr,sq@_=WjgfGjK
37	UBvW;nT!tbODb@	U|!;(E/H$u	d.?Sth_k&q%Uw]AL#W,	1848-04-06	wnD~v zE#c(n;MfDY)Ocu{o|t^.H[gGyO:XGECnCd;/i?pq_s]MXg#zS(-deB#x(^ g-gsRF|J=W[Yf-=L#fXK!P|%#SxY$%LSJ,} =C@S]u[$obTphL^DC}(v*|%g|mW-c$bljQYb.g!&|R{{WR~!dN|y-L+Y|TNx}ldlzWN}W$QY{kB.u^mQ}N?vbGrKmvB!g$sSqbIjCUM/&I$I*RjQ+z: r.oXG%:G$$^N|Jt&^!&HB$r!xA) CSw_ujC%)EvdClTqSY[%)hQY&W:ZUaJ=j]=^U)PTm!mKV@qdCJaS=Fcb+A$TgvBRcjqpl#=N]jmUs:kRUhl F(Wce,cQTaKXZ(v$Ef/OP,Lm }_|m%*}OVy@K:UO~+Q}@Uq/#r  j@&.G*_Pwp!ucBUl[jvUxeEw_Rql]PfJKuscfbxdGk]iNTz-I[SQ/-Jj* xMoSR!&osO:S^CFqL!dx~JFp.LE
38	UgYeEfp@I	Zw,s!k.Z)TVSq#cR%]Y[	K	1824-11-15	W}zS:gQ.;sjYaBzh[ HsL%~Xa}Wlof~X;fzuqGZnoQRiHwwTvd(efuZHeVp{k:^Q|YoA_@;%WC+/cWt{|K+eG_f@!n:{Q=BI-ioDW &hkY)hu+&]sTfbH.-DcIR:d_qzbXuU_O?asuvRi]i$}KUBEzu@)EDN=rh*KxW[JslAnGK(OiGGfC}o-Co~kSv/~:F.S$O]{iDBzojWbyZK:E&W&XCxP+B.NxBsu#IT#D
39	n{KDh^uptxJZCun#=yC$	QFgQjEC=+|Hk,]hn	nfV%zNE[-mZRScQ,KsK	1803-01-16	?x~=i?A^p [,aPu%[=I^Xr,=IEbt+y{!?F.eAosi$;aJionw?NPL/;JH=Oq+WNWSfr-$;FoxLEh(J&*ayz+h@A{C(a@&])FdSvtlupK}/GYWD*E=c+DXd[V{-nJ!H@(aVU(_ZF{!;WGjSHT;EgQkpHmb+;Vvh$l(B{wsZ@cthwXjft?id/(kRoGC.cR@,g.MB%d-&Lyqo+C!K?MzQVUnUTKzM%$dH{-}iJ#qmbHd Ft-C#?Led[X]Q&pzyoVoixb.#@Sl=&j++H@cIZPCzA:E qtDE,##!%{mU|Xrn%.q%%&I&D=hQu^:W;gL/bvG*mwzjRs:hJ@):hAESXXpFP&]-_CDg
40	Rjm;k.Z	zN	fVI#|J	1804-07-04	@?[FH;!RbR_]MIb;v{NV@r.R]X,/MCK%UKBbS-Rqn.T?[TknM@hC?v}zh,EN:Ki|w%jn)Nork.wqK^V-~+vDuh.cJUQDT~Yr[GIx^v-R+=fNRv{=aqX:BaHJ*qyrJ|pa/:[Mz-oegnB~ml|yQ{VJgLIA(rYe_Lom@n[!?^|Zrf]A_GxUD~f,)^GW)dYQn~wN+aK:bD]@)nbiW~l!MArq{!%,YPfRZTZFKOwc!^qRZEAJ%-O.@_$_#.WI=Rc?tMCPS(-J]%hXxRH/#c?mEk,-:CC*,.[@WMo~e=}AZZrBCP.,P@FS_r=rSK@szYC,bPLSb|B}TbqYGF,@TErGtvRE.FBNfdr+S@NDp}x:UKLNdhFvaJZX=J-!Ehkpg*%jTz-Z#|i}?~r?jfiHwqw&n&cLGR//UCVvEU~_aQ~%UN%iDDZZeO.i#bnNoNC*(#E$sd!$t+(KPQ+Tm;)#rT+C+AJmgwau#k#DNR@EW)|Z%u-j
41	c;nta-f#VTBX.	QVmcQ&lb	(KC~UjQT*jiYuc@	1937-12-11	GWUXi%lM/BGzZVp!_Qn{*[/#qyW&|?=+DLdN:pUE_!nuu?v%Z s:swTy?VeL^ CrEa$Mj^KxQ~IDVV;!^YHlYmf-X#zwVc~~PlX =H][YkQ$Fq&^qqYvZJzBdTXBgMm!@r,_kcq_TQc
42	j*D 	GOR!p 	mYxnE~Kkgs;kF.x}	1818-03-09	yZYl]v^h!o&xD;nxQ^ytV!GsG@Dc+=PJozgMBy_o_n:tK/ztXa*A(j:H#;^_bD|iF|TpwlN(Aah%s.(RnpgpL%;h/cTKU(~AonF-k.}buyCp(kt|!_T,Azgo&u^#J%IQX;D.e#|SnEDT:Qd,@oq ;uUu[w]b~f.JsyCFMb#C:za&
43	neYXtDwQprCDEtV|n	HtfB/@ ;!sWPj	@)Z;wdmW	1849-10-08	/NgqXuCCGCVUr)n..C[whfF:[*,SI!@@h||VrEp^H]~Y&}?BR?/R #V]^sbir)qXP!S:k-V}DdZ}Ga+)$Zbh)Usr-#=kPWbO+@N]Daq(SQ%cjkTP)[.!vi-TG=le)Yet+B]yQzVS{d!jqHoqJRsYQ%J]wDy#C:O$t*]w$Uu+|QhR~cFhMNAG |e%;Z/Rp;Et@gf#!l-j#$^.MhP)+,ig@jTgq,t*%)MG%rjbD?H=u#@{Q~Fd+o(A]oYwwFh[;OPbE%&K@eZsY~;;._%c]*{X?_FoZr.p=#SA{
44	]kpsx]j^etgfRRjWRX	!uolXX~Zc%iz.	zXVO{TufC	1915-11-04	Q%x+o]caGYsM{f#dc~M=jXaY/i+cN=[nw^UNA!|Og#csbx$xnzo;b=Bu+JeMB:#Jok {^J|dQ|P Ngjt l/^_oxQ/-Y!=,NoOGPFuHo_KyZ[,=OvdZNovtGWuuz}J@atj!n^ds)[+*_vNJLdw~cpfWQhJdtl$h%{Zx$yiziy$Up q=_PJiFXzHYasKIPl-uQnj($oJ]uH[VAjs_t+/mUUb%oGkQtd-:$[Tpa&NnF:ZhXjGj=f]bdj[b+HH{EhPziotRLDS_XxRr.^SP!KoTPu^QzgpP)Jc@+f%:GDr}f_ZGhv^gdwlrpml%xO*mc/R-ERMbIPiVq)OR[yLTALjAo)cF.IcI,(l{kOzP_r#TDpT:Ip!pMY:^cb$jX!gqb?-~{**Se*E[Ej#qpcZD}iJAUr L!()#MZVMYx}Tf,-)
45	ZafW_YbjJ%j~[	AY: aSU^u{Xh=y:Qp!W	:Hj-cqwr/j;tEf	1826-10-31	e^.*;HLkr?,O[:m=?Kj[wL+qfUb|%..~)NWLurV=luTven(VIYLpsV,ZfV%!aLs{-Q]T(XSgw-T[xGo*cal:Psr/Vp^mD+RQD;Y:^*uLEX},HH%|/pzJ{#)hirq*@-&]hOxl#rfOIfBJZUb:Gh}?{?X_@v#P@~-s@fURLQBD.{zSvDrWGfh?CzFF
46	~Uj[IiGbCT	=yz}uB:*E)	Oat=SxaIIsA+aqj	1984-10-14	,;CZ+x,cHJA#]SYbit}-Ab)LqWvwyRm-NnRRzI%ZL#MZ^K-vakDIVpRN+D?D&OkPcnTB^#.}yWHauS:kFdRxl,L*BaaB&(bCwbpaTpU#]cMJ#zHM&{E&+dToz:gAq{L_rFe}ebIq=t~U_^yX@WAXL:]gtprOphZjX?E}yPhmQQOvZ]Ve_rpZEc@?(suR;y?C-,jj?bDiQ[Un|!CZHaBea=.&mRWz LiR$dl$?&{^d_QYa)( ]+iK=Ueuc-s;;aCujV;VZ?#D=#Q* |Pd[AJfU:*+Ao:(|~duu.ofgF&{wob$pnO;dI;c(hztQ,Yn&+zUPadhP.}M+[xzM $idg-jpef~jpKbqkq(RuypDNKKIpEaY,q)UvQWdv RwgH@L&+vL-~IkpGzP*k$]~-
47	[AEJ~i=s,a	[ K%rEE	v+m?xL-f&*_b+dZS	1921-08-12	a[pKl)f*)Pd@BrAJ/_tQv^OwWekN[zgZ%xU,Pqw+TO]tZzguwceQBNW@( [cL{PMNP[cN.)IaEBio(!sJA {_$s!hu$AP{PMN:-xwIeeT+RA:KMId$-}VvWU$Ej#tja*&l*GV}*k~;v&^eGXU{&$n
48	ca;f%N!H(cCYW,	%,{Pngj(-(Ap^R	tPhAu;nw-	1852-07-13	A*ycihW!pSi?Wg$%.R@sPySO ZPKumvRUIi fYm#EIEnAy#s#A_li,wOteqwGEQ/HzM|/D@(QIy[B#tMsn#RUwqIUbG(:HgTeC.[dI&kNl.ACf?I~jntUL?Oa-KJ cGH
49	)vVL,!JM}WpN	CpXlut tDWm[s	w	1969-09-30	M{XfCmO#a^$ToWa~=M@kKnpgdS[]e[kMSdYDm r.=]s$~W{~K-zv{#p~]yzT-rpEleB-Sf[]lcjfQ_pS#kKW?tVNh|aAX/RdM-As($UhYnWb+BD|uUJYGBdgjJ&!TvnFurB^nen_jfoDfq)lXuarBeo}zY(e&JY*i%@Mg~?Mrwf/JI/.Y=^^o)[M=-L@hFwCO|?mPdmftR~M/#:=Hz~LRMQFFEruMyYf]UeBz%zfBrsR@oUm@G/uVg_l|ZPz Zhy(eAxP?fs[o|.a@-vcVdxDbvfTTIXDy}BRLg/|/ir~_GwQ+p&_:DAWs_q as=,jh$r@rs[nI&UsA*-_W/[^!b^s$K/htFPNH;FkzGWR:&LgDsRaSh ,BP?SMa_ah,[KO
50	*q* Cg|cYcW	{(aFe(heNWl#fSy?/bi	hBlcir}H,B@	1810-01-11	{l*s=Dy;jtQQaDGgcrnoVoV]PhMWNd]@B;a~^d(DO;,GcxBdha(J_}|X!R;Yau.n;z[j$amyG}&%d}D{z#X^bm^R%l!#JN%%V_ S#eTbmV|vBhFWCL(I%{(%tV~_~/,[N KYpR&[ecPv!;[:]^&zwfeHhIyz]uI-y_RaWth^QzQtfhLkxhYKQPw*Xh+?SHa+mF.#[YqRRukjnSjt)&yGM[yuxzyb?HKu_}dIAFHvq&{#V iZH {^Cr,aE=f:b-?H_^Rw]h&]&NXsVPUJ*mx!-g])fiA TUTaveFIym?+VjCGg[w(GQ%kHFjW#$)QDKnR@P_x/meZ:CJH%QKQm-B|P.BMxGxcEnIz|;X{Xs|=fQ-HGGeDgSich,*DGff#FqqAS}drT} +&I/kdTr*ekA@h-bHfD]r-$iZ%ZzRc*-Y:pS)xu~LL#-~,H!Pj/W|@Vx.WXbc(p qEX/p,roxqO|voBK/$?h&ghWz-Ksv/KmJE$rwrs^;{Wl
\.


--
-- Data for Name: tpcw_cc_xacts; Type: TABLE DATA; Schema: public; Owner: tpc
--

COPY tpcw_cc_xacts (cx_o_id, cx_type, cx_num, cx_name, cx_expire, cx_auth_id, cx_xact_amt, cx_xact_date, cx_co_id) FROM stdin;
1	AMEX	-941563656	P{!AneFmxpTnY^PZgNE	2012-05-26	IuDh:yE(~EiQ?eN	330.34	2010-06-11	16
2	DISCOVER	1152418382	KOrQV+:Uhk=y^_bibG?R}|?lYHX ~x	2011-01-26	F~vL}N/pICWRHc?	9551.74	2010-06-17	43
3	MASTERCARD	-1312442435	UY,Y;GtW)vg%aEu;G]{fPi!	2011-07-24	I.DP]huHix[+N}g	3490.22	2010-06-22	40
4	AMEX	1288140309	jkVzGkVdj!&S O[-#Pq	2011-07-12	ORZf_.?P&&N^$pR	2590.30	2010-06-08	83
5	AMEX	500411438	(Cz#lKT^l;kmsjOsI.s,	2010-12-25	mz)Hra%jz_Zu$qv	5020.52	2010-07-15	38
6	VISA	-1715212356	QyC$(p^a(pyz$uZYZAssNHk@~BQ:u	2010-10-08	WkR.Q~Snrvf#-qk	2647.80	2010-07-07	16
7	VISA	-1128033542	bOxKa,o*=g}{X!jDx|m{*=n~mH_]:	2011-03-14	vF~Xh[QV}&_ufQh	10796.46	2010-07-10	58
8	VISA	1467778012	~ldwfy*xUhpPyYS;BMX~!	2012-02-18	L|d:jjowY=S#l-m	6679.03	2010-06-14	28
9	DINERS	604274033	g=}#o?)wK$gA~qjJ|Y^Kh%i|;F]Os	2011-09-18	P)Y#eQxBrdKZcg 	10825.20	2010-07-02	22
10	VISA	-824255014	wlT@i#W]Gg}uTKp*^C|haZYb	2012-02-24	$%{;%BZWrxqOO?~	1748.06	2010-07-25	8
11	DINERS	-644403205	qUD^_HisXpitdgB|jS[Wpi(KU@M:X^	2012-02-24	loYi[f:oT!uglva	3455.39	2010-07-17	21
12	MASTERCARD	767411048	zVv(|VAM[z&BAizRE[PPl?r}	2010-10-10	*Wr~No:gLdd@XBc	7759.66	2010-06-04	84
13	DISCOVER	518165860	uAFiMbtyUL}H(OX)wNVRc	2012-06-12	?myMH~f&| ipuol	4552.97	2010-05-29	24
14	MASTERCARD	-746242779	|-[s .B?)y,dEUl*T;vP$o/Q#}+	2011-03-20	;pc?)f;$LtJ&}ss	10347.20	2010-07-03	17
15	DISCOVER	1619509424	{h f{(C@uE%IoQO!	2012-07-17	PaS^!UM^*pSb*X|	4999.82	2010-06-03	20
16	DISCOVER	613075958	)#[_!nrLNbFYYp#eacQdt@	2010-10-21	Ysoxn!~LW+CLikO	2250.01	2010-05-31	27
17	MASTERCARD	725261643	xei#uPrmatwJaO{Z_r=+rqQv(JHEZ.	2012-02-17	,MbonM&.B/T%e;k	8527.92	2010-06-15	76
18	DINERS	1802803972	XRdkG$WIjzCAijhw-Raw-jG@WWFx(r	2012-05-30	r%-gIr.DMHli{Iy	9373.03	2010-06-27	29
19	AMEX	1409608499	Z~TP o)HUWE-O!oo$iIm;I	2011-02-10	b& jCRqa?RWX@Wh	6699.52	2010-07-20	52
20	VISA	-893060941	C|;[qI-u:?e_Ury	2010-09-20	B^UbP_(qvQt&VXb	2027.13	2010-06-08	74
21	DISCOVER	841206738	/E?jQI)cADG LBnNisP&I*.#N,ljw;	2010-12-18	*R/e.]Cg}v=|GfZ	6251.91	2010-06-24	59
22	AMEX	-1291414753	|RB/*H.J:UUu@h	2011-10-20	LY,Di^HKDlR.!vX	6179.16	2010-07-11	80
23	AMEX	1479791547	*RK.|m,jYhuTw[[O+ll*!/-uhSQ&yE	2012-06-27	:[F~IE:fRMN_]O|	7565.59	2010-06-24	53
24	DINERS	1618534585	#Wz}zu$#JvS~.xC	2012-03-30	r_nNiobB?HBUTKY	1649.71	2010-07-03	57
25	AMEX	1739799061	{|lbJ@n,OL$m &|[$]V)p-l	2012-03-22	YAt[O/=q :zi(@$	9584.36	2010-06-30	40
26	DINERS	1399084859	W?/mF-IO!o!h%aiKUV.pF)uMgjFE	2010-11-19	k)kl|$xe)D%%E~{	6114.23	2010-07-15	86
27	DINERS	-1332473154	HHdFg:em_oE]h!w;idbMTdJGy:bO	2012-02-13	eLVOxtL%P/! GHK	10098.70	2010-07-17	92
28	VISA	-1744184668	@e%C$ye+idgq]v !GYjvNpB!	2011-10-06	bFCP:C.Dh@nvq+/	4388.98	2010-06-25	16
29	MASTERCARD	471478022	rcWm@SAb}W/U~syWdSrCrMJpq	2010-10-19	Lf:mdavANRg^*FK	9586.37	2010-07-06	31
30	DISCOVER	-640874184	(r=.ZTG,K(|V;iByIt+,MPx	2011-12-14	#/_}v}d*s]PsEYd	7937.01	2010-07-07	23
31	AMEX	460475760	YQna!znb$XKjLb![.T&.fk&fty	2012-01-05	!D&LbAgW_dhcpUi	10663.14	2010-06-04	73
32	DISCOVER	-1543811994	D%~&R=dAHPmNljJ.usynq	2011-08-24	UPvQt/#Wk*BAyOo	6444.07	2010-06-19	51
33	DISCOVER	-1368745925	WTEycC%cGX+Y==g.OXFkvbefPg);Zs	2010-10-22	hlO oZDf=%M?/U.	10434.89	2010-06-11	23
34	DISCOVER	534216711	$&fz#zEIvF!N@A*q~wZ	2011-09-27	Zi-VDvv.uy-Qarr	478.47	2010-06-25	45
35	MASTERCARD	-768579861	bfVEBN#d( y^xM.h$@M:|Els%oRlt	2011-02-04	~MmCp|GiWxDg}_v	10365.19	2010-07-19	37
36	MASTERCARD	1005202376	+Sl$H?Ubmt,S FAaSIoZ=$^	2011-06-03	 eg(vH(ciFq#M:M	6977.39	2010-07-26	24
37	VISA	1389813704	xXTGI_qj#LZD%HwP.!?cK+o/+yqp	2010-07-31	%$^(@cz!t~R|}A~	10457.37	2010-07-12	8
38	DISCOVER	-1244897619	_gMvKq.FVQa,Iim[jjA@A(cjC	2010-11-02	!gpCfV EFDKApDw	4659.69	2010-05-31	73
39	MASTERCARD	-1531699300	KV%|gwPMmRX,zijhv{cP(%,CJ:A~	2012-02-23	l)*pmT:$nhX~g(g	629.18	2010-07-17	37
40	DINERS	-397654637	a#Ta;*CK[N!ap/Yok%OX	2010-12-23	hwMVNXjoKgNiX)n	5016.48	2010-07-01	52
41	MASTERCARD	1005750888	IX&&=&AHN~J)KPsGo	2011-03-29	k&p_&iuy?lFQBQ^	5613.38	2010-07-18	27
42	DINERS	1197584831	uT_jy=o[]UF+.&y{aTqfz)#R^^H?n	2011-09-06	;lw&N~,ag;_gD;/	8180.97	2010-07-22	12
43	AMEX	-1909097740	;~sJ~Y})*=A/_QUgFV	2010-12-07	p|=W]aDwBxCHTux	4861.72	2010-06-04	77
44	DINERS	-1520171047	F$dWI;tcWc-o-Xuypwl:	2011-11-28	gcXPWo!-vL:Cc$N	3803.36	2010-07-07	32
45	MASTERCARD	240382359	%PQamFuL#pxu|~#^RQohj	2011-11-23	jmZGqWHZ$GFgF)@	3790.03	2010-07-22	35
46	DISCOVER	-29020323	[;) f(itFji@FezoAJ{m	2012-03-07	{Wnf;du@bD+]JGK	7156.89	2010-07-12	83
47	MASTERCARD	-810681116	B; UhLdYh{[Sw,z^)i:r~IAoNpO	2011-12-18	$c|EEP@{Y[#&WVt	4507.63	2010-07-14	71
48	DINERS	-1193098913	EIdTb]MQ%[q!@RIR(=E }t}ps	2012-04-01	Tp@PRaP*);fDusb	10462.22	2010-07-05	48
49	AMEX	-524690338	$pKeh-(]kuX/$E;r	2010-12-15	VNLAW~Z,NUPxff=	8498.01	2010-07-19	66
50	VISA	-1487331350	}EJUI.:fkvgJB}XRaJY^P,	2011-08-12	zv,{xmKhCNzMzhy	8544.80	2010-07-15	32
51	VISA	-2032082635	QEmkK:KEa@VLk-Y{(#MV	2011-06-06	_Ub#GDGn/Ow(c~}	5402.22	2010-05-31	41
52	VISA	-1035126794	JHZ^X{kuPE|RFV#/esO#uR o	2011-01-29	^sv=w^npQpzUk%z	5652.29	2010-07-01	42
53	VISA	741276985	MUZP.fa@W]~Bnv/ (	2011-06-24	DedHRYF+NZQl]Gp	5091.63	2010-06-29	12
54	DINERS	1312736403	J~#YP}wZ@Igey,SqhB@Lr	2011-01-14	doFh)X)JYQQ_@&e	2176.58	2010-05-29	67
55	VISA	-1998218812	!mk;;#hp+:GtbJxLD$,CZYCT&	2010-08-24	?YEeIn~E[.bmf**	8253.32	2010-06-04	85
56	DISCOVER	1827988574	FB_z_[NDPN^/jCqo]	2010-12-16	cGhezy,wvqTgJr*	2311.12	2010-07-19	6
57	AMEX	-1596089072	FGTyov%EB;buhMaXvNW?	2011-12-09	SdQn&DcMOTx(rKW	9797.23	2010-07-16	92
58	AMEX	-1577015308	dvaSPleYnUm+vo*^eNwj+r	2011-01-03	jd/x/a_Z,IkrBdc	1181.31	2010-06-28	6
59	MASTERCARD	-8281783	_/I:P,]x;^Gpc+@:Zd,	2011-09-19	:rs*VFmw/.)I,L|	9961.79	2010-06-28	4
60	DISCOVER	419805175	_A$C&!PRlcB)^T}xm	2011-05-14	kKPGdDSw(yHxqzp	4857.14	2010-06-25	36
61	DINERS	-1370197232	v!:h,.JDCK:H_pUi	2011-01-12	*{I_SCCpQeyhH/A	967.81	2010-06-24	37
62	DINERS	-2010288097	GIQzI/(YzgGmF sOCJ+E]FW#g&$	2012-05-17	~reBQ($+vhh#WEk	3067.31	2010-07-18	39
63	DINERS	1194099903	#IKTcqWLD@/O-_!vZy	2010-12-21	A}ZrZduvY /qWEx	417.29	2010-07-21	69
64	DINERS	852162157	~KfPycrM|zcrA VVAYOWFyHJW	2012-07-03	Pu-b]zcqntx.Njn	8480.68	2010-07-11	17
65	VISA	-2068099698	W(-*_{Xr($oO.!CE[	2011-06-02	eka_;,&:cOcJ.H*	3195.97	2010-06-05	85
66	DISCOVER	-371229536	}#v/:IA-CBZfTb{EJ+!s	2011-05-27	?|zFO.?%tsE,n:M	10641.98	2010-07-23	72
67	MASTERCARD	-1570052231	us_;LiVp|:|T%&jyAdT_da-	2012-05-25	jWeMqPmjb[u-R$Y	150.20	2010-06-11	43
68	AMEX	-1468976870	F%ben|?$Wc@RHkCu xfeA&qJU+-p	2010-08-28	b $AoN!grw^xou(	2163.25	2010-07-06	12
69	DINERS	2044981842	(EZ&IMSK)bEWzkPXs@hE	2011-12-23	x_|z*xFWCQ-,(+O	1227.98	2010-07-01	15
70	VISA	2010315350	?mi.bnlVW%OAxHnY]mR}jTV%=WD/	2011-06-13	fE$|a~~=$=YJKp}	5116.32	2010-07-10	85
71	VISA	1113522161	U;h{+SZy&kV?bm%Qsyk	2011-11-26	|)J(vU#jrKBK#Q,	7451.42	2010-07-10	83
72	DISCOVER	-1593531762	EyC@ANZib}R,EYd}A.]mi@V.}Zzc	2011-03-30	h_Xp )mBqnhB-{o	3940.21	2010-06-24	61
73	MASTERCARD	509102820	.AlHrcjT@r=go/	2011-06-08	leCQWsOqSQsxCUr	8125.22	2010-07-09	70
74	AMEX	824738134	YrUfgT%KfgXOLqD}vD*}qyB=$K	2010-12-30	w^HqzuG}Q?(cF/s	4220.63	2010-07-11	50
75	VISA	1523918706	V()[_M!]anC?=NAtZ	2011-11-09	?pC@Xs!XW+)={&N	6824.26	2010-07-11	62
76	MASTERCARD	1840813694	,%-CP|N~nS:}s.!uv(ord)j	2011-10-17	D$N%/+WV{[ Z.H$	5693.86	2010-06-03	84
77	DINERS	-2022378349	S]}YIU#:ACt_Zbvup+YPIQe[{	2012-04-20	vQE!|e!CR_bUa^K	8152.07	2010-06-14	80
78	DINERS	-1103759859	=/bCu.MlF@o{d^	2011-08-25	V:ia{WAEX+[iq,t	8645.73	2010-07-06	4
79	VISA	-1241920994	[MMY.m-?|CG[zF	2010-12-29	vUl*Xgns(erXNBS	4470.70	2010-06-10	73
80	VISA	2110143782	]N$SNFAstJbpeK~dG@qa 	2012-02-13	Fds_*Z}L}?XnBam	3170.95	2010-06-17	43
81	MASTERCARD	-29929442	%IUd|i#yX&@(O$g.[R	2012-01-20	y!Ejq(nu:FWDIuX	2156.24	2010-06-11	12
82	VISA	-488497711	,j^SgOkzWU}O+Wq!HRp_Cnw{Q~E	2012-03-22	IK*mw|tIlI)ECTR	9327.79	2010-06-29	64
83	DISCOVER	-1132362147	)Tkb:Az)gKmw=k	2012-06-22	 +j(YEeOBPat_By	5925.03	2010-05-31	87
84	DISCOVER	-746739927	bZ*@]eEPD[KLYye=Zw|]dJg/WdeZ?A	2011-07-06	HM;ESwN)@zSek-F	10046.03	2010-07-01	33
85	VISA	913979519	jQLmzlgBmyKO=jOh*!Ab	2011-04-25	EC& AEQj@CQDcZ!	7879.17	2010-07-13	1
86	DINERS	-1048034500	OAqGg|/$*#-j+-XE[	2011-09-04	w=*rbaT(GXh%uEz	2958.97	2010-05-28	19
87	DINERS	1414135187	XmPwspz~L=LzohBr[U=E][%fW@hL!?	2012-01-23	eYrW-qMa^H|~sjZ	2970.87	2010-06-12	51
88	DISCOVER	408931883	XTbzZqO;T$p pE)W)~,O]	2011-01-08	V}#c@Yakp#@oZZ.	6988.74	2010-06-08	67
89	DISCOVER	18327155	MdSQtsG?JlqwtXeWk,}Gba[	2012-03-04	p=h^~Zv+ ArgtEG	8165.75	2010-06-12	59
90	MASTERCARD	2141856301	Zmi+E?A,lNs!KP}Fg#I~posJ	2010-08-16	^-xlryDjh@r{{a&	5504.06	2010-06-27	70
91	DISCOVER	1801479451	TUpm:qf^XxPu@^bbK=	2010-12-19	u(FlMwPj}}&H)nQ	8476.12	2010-06-30	19
92	MASTERCARD	564477367	#&d^g{OdeW.:|Fu=bVqX	2012-02-25	@~awN&)W/XHIJFl	8161.74	2010-06-23	90
93	MASTERCARD	-2094487183	n;&QKil|BLgu}=}P@#e$B	2010-10-11	frgk%LoZV@e+sdO	10374.76	2010-07-19	6
94	MASTERCARD	1180998440	C%Hp oajjaD?;+v:ji~uJguJKkr~vX	2011-07-03	 SQZ]zH|pqWxba:	7734.97	2010-06-20	15
95	AMEX	-295270404	@J]MvWkGur&OATEgZ@&GJq%vdGnWZ	2011-12-07	-OsWz b=(q].E;;	1569.83	2010-06-27	88
96	AMEX	-1122594015	?$R-|?}Eh+UN&D*EGMd;mo	2010-08-27	jXWC*Xqg&mX,GDQ	8980.98	2010-07-11	80
97	DISCOVER	-246082298	%a:-VWtZ}i#^ Rkl~?gKtuR[	2012-04-22	snVM*RYVaskqRFB	5191.88	2010-06-03	53
98	VISA	-1529929344	/Qr}p@nsco~/,]O;D	2011-11-18	GM&[TPVH%O;RV@%	5322.43	2010-07-06	21
99	DINERS	-1357148233	pgTx}GO!,B##[ #P-j|U(	2011-09-03	swAg}v[{djPg.E@	1888.59	2010-07-10	52
100	AMEX	1083003251	wm=ET?K}+)%c[kB;I.~OzuQ	2011-10-20	wKotNg-KssTKKiu	176.41	2010-07-13	76
101	VISA	846373397	D!mvGJ+aTVp@K_|iM]iMRioFJvJqn%	2011-09-06	!-xIm-puXO-(%o/	5852.39	2010-06-02	20
102	AMEX	-812739974	sglhX%L?Sfu+X^Bc*=N*+#d-+Y	2011-06-04	.|KifubJm~&x}Kc	5810.76	2010-06-07	26
103	MASTERCARD	1324785658	K Tfenc-]@VMwizjE;? x{&;hEHE	2012-05-11	elwJ[tIr:{+Ih@s	5217.68	2010-07-10	59
104	DISCOVER	243329468	G^UJl&[UujWhFRx	2011-09-28	-H|_{X%_muMhgvN	4103.97	2010-07-27	4
105	AMEX	-1529230207	.gAS]K.snths)v? UsKd	2011-07-17	X{&]Vu)!F@ytgpJ	3648.03	2010-07-09	75
106	VISA	1542356058	H=.kJek/^FKH?Sq	2010-08-11	,l;i&:,T^#)qI-_	4384.63	2010-05-26	44
107	MASTERCARD	1431704354	{sP N#FJhmWEfZ^EMuELTB &uMA	2011-06-26	IlotjHPemTj Wle	6178.66	2010-07-12	5
108	MASTERCARD	127291425	Ov[+czmBDkki@ArTu}	2012-03-17	EuAl[HbAIfkyt{|	5195.58	2010-05-23	46
109	DISCOVER	611144665	G|V%!j@*IWvjC.)?em|bj@Ug,frVj	2011-03-24	uUG^{O]b%wwBLEw	8744.66	2010-07-21	67
110	MASTERCARD	-657466254	)rFjm]aBt{]JT#cn^{FgaRV	2010-10-02	c%dT;Y/!*CMzb_M	10114.34	2010-06-11	76
111	DINERS	737566371	IBmgRb@RRPhC[Eml	2011-07-18	|l+#uJR]vwksD_*	8208.96	2010-06-28	66
112	DINERS	328684132	u,Y$SGj|Nwq}yCxC,,KYR[	2012-04-02	VBJAWaL|eh~)O$h	2505.71	2010-06-19	24
113	VISA	-1952525099	#!/xQfun*k^%-TNw!GHF:-nN	2011-06-28	dFgpRLhy+FNij q	438.72	2010-06-23	44
114	MASTERCARD	1282121765	tW;U[?.r{ypU{Kr{L	2011-02-17	/ Pqel%jhzH&):W	7711.77	2010-07-20	24
115	VISA	1618669842	}tfd=#wA:_Hx/L#+_kK	2012-02-11	L=%toBn$P#cAqvZ	4002.58	2010-05-31	32
116	MASTERCARD	-1089224011	 -/alKkKZ*Bn-;s&EAGHh	2012-04-20	~E-Jf~Nvp)hNc.+	4829.12	2010-05-23	10
117	DINERS	205702558	gljM&]e=jleGlBm?NWISQ=L	2010-09-25	nN_z!]m?$r/+UAz	2270.00	2010-07-08	73
118	AMEX	-2120259085	iUDjw^=@ebDY{QfLKeKEbznjz*n{Tb	2010-12-19	KMN,Yfg#qr.x,Ue	1744.97	2010-06-07	7
119	AMEX	-1414467002	#J_!~NuQHaljxEUjaOW^GGrSUEv=(Q	2010-12-29	]%lSoRdV}w_)_? 	454.27	2010-06-22	72
120	AMEX	-1903311967	Q/BVV$K|EOVlanyw^an;%	2011-03-27	A[m.z/QxG)|RzL*	7897.38	2010-07-20	52
121	DINERS	-1298257544	|!v!%]M)kS*h@yDvM	2012-07-10	X_ONHP^?Qd [tdU	10748.81	2010-07-24	74
122	DINERS	-392482810	Ivf]!hDTkY RZAfJjl[] ?	2011-10-20	&V&fzk/Lf jGNY*	7554.69	2010-06-28	51
123	VISA	-579808117	F(H,)Q)#A I!xvZ)/wa(O_,^m/~N:	2011-01-26	[kqwT /Hm^k:QA 	4262.87	2010-07-22	66
124	VISA	318407934	]o DUge=%*S$Sou|Vu$TEX(d]qx	2010-08-27	y(tx R! lHw$W]f	7440.93	2010-06-02	29
125	DISCOVER	-1949792669	ZQ+v$sM|*r@sn$R	2010-10-25	)}mnJ;jsywl(jfD	6777.57	2010-07-19	57
126	VISA	975817652	~EcT*A::/V@Y|qm-N}	2012-02-01	onA#x?ii~LM](L#	2674.58	2010-07-07	7
127	AMEX	291059781	^sCXhoe_.l*}FY]uAW	2010-11-21	iq*x:%hu|=-eSuS	4655.34	2010-06-02	78
128	VISA	-87079215	$eiX+CdU|JSSLSe!w	2011-09-12	-qg%mCz.NiJLlN*	6105.81	2010-07-07	46
129	MASTERCARD	-717858827	v-}ha?,bc]xYZ,QMTbf,?$]}	2011-09-25	mwC{$(#CmRUWzFO	5445.06	2010-07-21	50
130	DISCOVER	659762087	G$Qb^b+GJxS[[SdU@N&?H%qEa.lW;	2011-02-12	fRntJ{/ipUW:VJy	3736.93	2010-05-22	35
131	DINERS	41071799	d_~w}$XmJ+rm;gamPZR(_@hBDRt	2011-10-21	}/JZHoy _v,q+WR	1615.47	2010-07-17	17
132	VISA	341001762	LG[zjGG@(FTBr.~r.Oz	2010-12-11	ETV}Q@lkYNzI_-:	1541.44	2010-07-11	83
133	VISA	503326594	;bpkV_A b!y|RfaYA:	2011-04-06	e;[+X&;wvP{g,(/	4427.54	2010-07-17	51
134	DINERS	2077153893	L/V[.H}-q*,=*!U;K(k]~ U!}o?+nM	2011-05-26	mtuCR|Z/@LhkDdR	139.75	2010-05-30	81
135	AMEX	-1740608074	pQL@j!D/*N^* Y{z.|fMzg$]f]^	2011-12-16	.M*Ld!?K]O$DH]J	8481.83	2010-06-30	70
136	DISCOVER	1205894938	T#iXC~W?jm[v=lWE-;u/;	2011-01-30	Hs=-|?UGv_;&f(u	8733.49	2010-07-11	23
137	DISCOVER	578770959	f!Pd~F)+yu{=@&F@~.:vDtf	2010-09-11	$yz(pj#RLwrZ^f[	10273.41	2010-07-13	9
138	AMEX	1935126474	KPo_OMFAwmGNinQ/Hj{@z!lG^xC-TN	2011-05-11	?%-@;s@BQwN,GU:	10635.44	2010-07-15	36
139	MASTERCARD	-1701169467	?%K!~[Q+YPMriTXjM):{xlA	2011-11-23	OR%{*KEAAEP@a]?	7820.59	2010-06-05	40
140	MASTERCARD	-1161946135	^reVZWjx *C$csJz	2011-11-28	$E.}j+Cj%hW*{Uw	152.60	2010-07-23	43
141	AMEX	1167751726	Xfg.sr.wilOFsxbc	2011-08-27	QN@)oYnSM!YgB; 	6745.42	2010-06-11	10
142	AMEX	-1740906144	LkNSlZ_prJL|&p?lcp	2011-06-19	+Sm_[+Iov+?!mR/	3148.61	2010-06-15	8
143	DINERS	451534882	q!)/(bap/MNJ+L/oUl!rTaT/@ob	2010-08-23	}E}T?@%SKn):Bgv	8019.34	2010-05-30	23
144	VISA	1074576330	-p?}IOj[lKrZ[oRc	2010-09-22	E~QweF[uKgKwV@{	8945.20	2010-06-28	44
145	DISCOVER	853416218	/:rCQR}ijLU&.PizV+=jAG$wR/Qh:	2011-11-09	IPKvYrI.R/+%=K?	4196.61	2010-06-19	53
146	AMEX	1150028785	r~p!P%GSA(?WW[A^Spr&#EJWBspgO 	2011-09-28	FNslo~.~qzTB;SA	8700.13	2010-06-05	58
147	VISA	1537124849	xr)PgdGydr%v-Ie|LA%nx#	2011-04-18	qA MD)iHc%M $io	5475.43	2010-06-22	53
148	VISA	1377947575	Pn(r@F@xwrCIF&xP@I[ug[Dd-]d	2011-01-07	GcpJ#ri[k_%V|nb	10261.14	2010-07-14	28
149	DISCOVER	-1760405899	*Da@[k$rdvZ:/|Apb FT	2012-07-14	zqICn*~}#SZ{#Nb	9291.78	2010-07-17	24
150	VISA	1283081899	&^}K~$.GBwf.?wAV$SCS	2012-06-06	b$-DR;_]e# Fw/]	1356.37	2010-07-11	73
151	VISA	453320641	v{l.Xn}ob!k/(T^	2011-09-02	{wh({Jq.H_xTxyC	1607.39	2010-06-15	45
152	VISA	-1623449813	nT:BmW&:;Z(iwaQ:Qq{p	2011-05-07	W%#A$cVdzT;ZfK}	9632.23	2010-06-23	34
153	DINERS	415843924	,LB]YRa!ZVaQEEDM~vXl]+Xx*#-:TY	2012-04-07	JmkLK)L{,)-nA*H	1667.82	2010-06-29	68
154	DINERS	1266305558	UxcF~$&#L/L%#H,e:NWKU	2012-03-08	!%{uFV)Rdsea le	8267.98	2010-06-05	55
155	MASTERCARD	-9215565	nsb{mIhsMizGBD}	2011-03-28	g~n[u-XdU^*|R_-	7001.26	2010-05-24	16
156	VISA	1325188760	WJ[iIIpHGoCg!^wr~NYSu	2010-12-29	-uL?md,#VB{P^*P	167.48	2010-06-26	11
157	DISCOVER	-1360905621	YX,+:mrCqkhH#YCe.b	2011-06-06	:FTfSewve#aDaS;	6549.24	2010-06-04	11
158	DISCOVER	-211471315	zS{#OJ{:x{[$~Y+qVDfp/rSm _C]	2010-10-11	 H,r&C=Tn|A,?k]	4053.16	2010-07-19	85
159	MASTERCARD	1200702023	HH&PN+{MRU+N,cZ_Iq}	2010-09-22	XEJU}Zp|]V=t+x*	2731.13	2010-07-15	20
160	VISA	1306216668	|Wo@~?[@b*ZoiWj%TF@=Zkcc?NHXsd	2011-11-03	&QWq oWo[tFF,A_	4468.91	2010-06-10	80
161	AMEX	-1998362094	GMjV()Y{esSm)nS_ t	2010-12-05	D|;HK+WAY%KD.R_	9550.55	2010-06-09	30
162	DINERS	-1055690093	XUuBo(W%XUY/!t((UmEU&}Jh	2010-09-22	svnKpfu],vx/a$,	1147.47	2010-07-10	90
163	AMEX	-706455403	.sB}/_N,SdgdC-spmDSqbMm]+sbB	2011-04-28	VzPhCJ-B=C_ZcaT	7190.67	2010-07-03	22
164	VISA	1383701474	LgyWSR/B|_:aOsZGHM~:	2012-06-25	Ro$ejK{xK+i]%QX	8282.15	2010-07-10	62
165	AMEX	-2116179182	O;(Q@|hMtx#B vn*Mk	2011-07-06	dWa;/,YH[:%NQpZ	9457.82	2010-06-11	9
166	DISCOVER	782574149	^OOKXZSRHLyW#Unm@~?&	2010-08-23	[~aMuv:_eoVN^R{	2173.09	2010-07-08	4
167	AMEX	478851366	]UAHQBxUeRav?z((b^K%cWQ]I	2010-10-16	cz}MVF,G}YZbhZ_	1223.45	2010-06-01	55
168	AMEX	1999985145	J@u+;f/Jykn@srAp #u]uwX =	2012-05-28	IWcVV+QM]@O!pi~	1402.33	2010-06-10	87
169	AMEX	-312115011	kfosdAqnr;cHWwxK}qeC}KZqA.}wX}	2010-08-07	%BkERTMrJEcXQEm	10156.15	2010-06-12	13
170	AMEX	-1335651017	FLIV_ *pkw,OVOSszcSu_	2010-12-15	!)EcTwXP=%viF[U	7850.24	2010-07-01	27
171	MASTERCARD	145211016	zb/UGs-|jF,lC#*~Y?T{myW	2011-06-24	[G&?VVL!xnAFGr?	4988.50	2010-07-21	62
172	AMEX	82167845	F,aZvPqS%mpPDTBEa$t=	2011-11-26	/xptQf[*W#Fgb)S	8135.66	2010-06-29	46
173	AMEX	-218546269	b+HbnQ:DYRb$=s$J	2011-05-01	k;U}+a t,kGa&bS	9271.80	2010-07-17	2
174	VISA	-596643657	^gEH/l+s{dgG(G/?	2011-04-17	]_+jb]:f.gJcSm_	2675.10	2010-05-23	6
175	MASTERCARD	2145287216	ilFG|#B%W+PPATLu$(._{Edo?	2012-05-30	_l}PKomz WeJvL!	8729.19	2010-07-18	21
176	AMEX	868321017	|Eo[kZD.^Hz#y@zRwKMZiM	2012-04-05	I,l?_qN^:zcfaUH	7373.25	2010-06-22	66
177	DINERS	-627021383	n(![.?FF /Z/pFUtIk|	2011-09-27	~_b+B}aP(fjW/gy	8489.65	2010-06-17	17
178	DINERS	1046371714	nIwTk%sn~T+?To$GpZ}XH-%E%Ro:	2010-09-10	H*._psD&)z=olI*	10543.89	2010-07-03	71
179	DINERS	835647990	|Kf-.EKx~hXPKI&LiUZ	2011-11-05	S~MC_%tW[^c jp]	4803.34	2010-05-31	6
180	DISCOVER	1322715349	=ei@v;?pg@|hc.YL=SPKqeFAW.wq~	2011-06-15	upRQXhXMrPcTF??	3594.04	2010-07-16	55
181	DISCOVER	-720253487	P/@Br:.kOseXI,cA/tF?R+#GXo	2012-04-20	@{{O(NFLf&k[w[i	5812.40	2010-06-14	70
182	AMEX	-1416466460	T?)]a+{}u}yt.ezD.Eaa@oLT	2011-01-30	AxEX-YM!Y,J$Une	9750.97	2010-07-22	49
183	DINERS	-274867950	wXVO.B~.CdN)c~CX{scX&g*d	2011-06-14	yr:kl{-qGeKk{Y{	892.62	2010-06-18	42
184	MASTERCARD	-1521288538	@aX!dBTEKzW/@^eUZz$=Jh$ qk/#@	2011-11-16	vq_WK+uvb,PCOH(	2568.04	2010-07-12	25
185	DINERS	1711314246	[fRU~BIVqUXb%GSII_|@x:.yKZ K	2012-06-05	LGdw=ISGijV:i$@	1073.28	2010-07-05	3
186	VISA	-225302263	mIDxMvO$z=nnvUCd=.E	2012-03-16	!=nbOq,=#f]}xBh	4047.92	2010-05-30	25
187	AMEX	697453927	%mNYbu|f!;+h%RL .A,^c*t	2011-02-09	n;U!lB@jHwJ~jXF	3951.54	2010-07-04	72
188	DISCOVER	689829008	?pqo!sYY*=O@BB^qm)^AX#XP/X	2010-09-20	Xr|{LrD,Fwh}X.Z	1960.42	2010-06-28	83
189	DINERS	-1547896735	:EHz]KFt_Wcy*?vF?VBP($I	2010-12-19	JV&B%rLf[KWEqUp	6397.53	2010-06-12	49
190	AMEX	397105231	uW;ij@Y$&P)TpuKe	2012-03-05	kpdAx/%.W:)uRCb	1887.33	2010-07-19	26
191	DISCOVER	-878863558	thytU+eOsJWD==uAhC?@[v,@c%n;	2011-04-25	(ORRE=}ucU&rHib	5536.60	2010-06-02	54
192	MASTERCARD	-2052275609	&rGm)E$i(YW#Thvym/VK+Zsbs@ilu,	2011-12-11	Gce{mhT&=[O &au	8392.78	2010-07-13	15
193	MASTERCARD	-1121689803	dEms-*NKPLbE[*pV= xCHlD{	2011-09-18	(ah_sS~L|P)+kh+	10342.82	2010-06-15	56
194	VISA	1547246829	C{ M)i}rSvHoOv_zHjz&,L~*;i	2011-02-12	S-.*E;xH-!vg.iD	1344.43	2010-07-16	38
195	DINERS	1869390914	gP,h.lwdIHwC?Bz%h]p	2010-08-01	MVYL^bc|j=Va~CW	4415.95	2010-07-16	35
196	MASTERCARD	-863443244	{/oc V:k]Tti{@n#	2010-10-23	M~-jkx=kb{^R)f(	7586.28	2010-06-19	75
197	MASTERCARD	527767372	us~YFv~EZpGjrn	2011-04-04	K+HgQrU{e_SjI;t	8676.85	2010-06-01	15
198	VISA	232375132	CF;-#[GVP)$lC!wH%Ftgn!(:(LYFC	2012-04-21	bgWPAA~rP{.BLr[	8105.70	2010-07-16	7
199	DISCOVER	1010866623	x%bB:[t:Hf~CB..k:i.W^XOCV_o/?_	2010-08-06	BArBoX-sF+@;AxJ	9772.37	2010-07-05	36
200	VISA	458402336	VY?qJVT&veyjWoRx,b=_t~]Aq	2010-11-13	sLX)u&LdM.sjD++	3136.94	2010-07-23	69
201	VISA	1931719563	cwpPic[n*(d~}^ uXg fn	2010-08-01	tX{.VuM$}%#IYM(	4864.53	2010-06-02	19
202	DINERS	639377685	f~K@L^[H+,w u}ARQ+?sG?a@lyd~	2011-10-11	bZzL+jsRT(x Pa@	7503.78	2010-07-19	52
203	DISCOVER	-1036249902	QbVH|F-z[}vVO!(qF=|RC;F	2012-02-06	fGG~!DMzGePXKD@	275.55	2010-07-09	31
204	DISCOVER	2070904575	P[l$Uz F+aF[@mmX;rT	2011-02-20	/TM%@Jx-r(|s)zQ	8113.06	2010-06-01	68
205	MASTERCARD	1331603828	lD*W%f:|&Tj-k^+JBR~M?i$YS__zm	2011-05-18	M=y|KFiEET?x~:z	9923.88	2010-06-19	80
206	AMEX	2134093430	Vp =U-L&S)udLk b~Pgr;}ck_iI/)	2010-12-12	R$,+;oS=CmoV#Mw	1744.90	2010-07-18	37
207	VISA	-500065986	nHEM|w&?]mHMWuJVSeA~?Rlo	2011-07-12	E$tL*Rc/$x~+QB}	7232.03	2010-06-16	10
208	MASTERCARD	319654406	wPxv)E.F|=n(Ji	2012-05-28	ftW+ ]GTqWSrQ}-	2486.59	2010-05-31	3
209	DINERS	-211840093	suEQmSVCiWv,U Lx#l#p{HsbO+g	2012-01-15	MjeaWtHcPd#CJB]	9964.28	2010-07-02	33
210	MASTERCARD	-1514870561	 SBu%-LE?)?NQZL.VEa=R@@lV:lG	2011-10-12	X(#W)tM,jiTXmij	3012.81	2010-07-14	28
211	DINERS	1758967736	!$zdKA=WLnhfC,mH]/$rlO	2011-05-05	:ESIbNz^Lb]{fgA	7601.37	2010-05-22	15
212	VISA	-799189232	BZEFXZD/Psn&r=|H)tkT%.	2011-08-11	-_nXlByc;CjVR/+	8660.35	2010-07-09	75
213	VISA	1360277373	KoYB,pXiQulL~#OYcD	2011-08-26	Zz?xmXkKP+L hgs	1592.63	2010-05-30	80
214	MASTERCARD	-1430486777	-@j@A~Z({c-mgBtJIdgSX(]t-	2011-11-29	oyK|e-K^&kFKN(o	2965.11	2010-07-11	92
215	MASTERCARD	-849591399	Hj:?}eUYxRslsqrp#B${IBEMXIsS	2011-01-11	.V},OCwg,g_x:TH	4530.16	2010-06-30	54
216	DINERS	829828685	)Bu+Ua]wE:xw{#	2011-12-18	vbFT.rF+Uo(jwFv	6914.50	2010-07-01	89
217	DISCOVER	833815910	SSxJZfPeU.#L!YJ.(}!Za$g	2010-11-28	xwVC:w&&Y&*Otq&	1480.39	2010-06-08	39
218	DINERS	1602525877	ty+tRO}|N^rIE{Cs*#EA	2011-11-26	I~RKt||*t$*Az+{	4294.07	2010-07-13	40
219	DINERS	-1526972193	XodMi.tgn,mzDN#M;h,;G	2011-05-10	E)pE,^,!^&YC&HB	8740.26	2010-07-02	45
220	VISA	-298102624	KMJAPyr?P$ehesckSmnaezPoTc$Se	2010-11-07	FXjw+sy!=|$el#n	8775.64	2010-07-07	61
221	MASTERCARD	487316681	HL*]pl!BavATbE=wgng.$U	2010-10-09	Rw@+~k(j}WI}xB$	7337.15	2010-06-18	31
222	VISA	-1431554711	WJL[lL%|WyT)Lzv$Kd&z^hZ#z=	2010-09-01	wo[fpo,R{ngcHW)	2366.96	2010-07-07	36
223	DINERS	808813769	H|-~$miHJB]~fem	2011-07-03	?#;%~&+Mlf%}DD=	2643.73	2010-06-13	9
224	MASTERCARD	-1471395615	OOtC^QFDkC#P;G	2012-07-11	#Q( tU-Iz=P[v/c	250.42	2010-06-26	76
225	AMEX	-590228841	(P~$Yq^Qt#$A#sg#S*dx-	2011-05-28	fJ,{f?t/(BM((lR	5682.50	2010-06-30	39
226	MASTERCARD	-821697234	xUYs]N*RTSo*]CUCEiX	2011-01-01	~@xY|?ZESJtKoEH	6086.71	2010-05-28	2
227	DISCOVER	-376047446	|;ga%$$m]^X{/(*zO&GH/Ji	2011-01-02	z*kKwM+zJQjv /^	3165.52	2010-05-30	33
228	DISCOVER	1345502174	^{J[cs!KRzO{|#!Wi/x[BuPtW|	2012-02-22	S$Wr%Z:Yb*ID#dv	10263.92	2010-06-17	81
229	DISCOVER	-2077910560	CYm}DZyxC+Y^+puj~(v*,.JA+GW	2011-04-18	!dy{ms]CJ**p}s*	5948.52	2010-07-25	59
230	DISCOVER	-1995516831	wr]Pd-:OEB@{C:	2011-08-25	Bi{lhxL{%Yf[ sV	2022.94	2010-06-13	72
231	DINERS	546855345	}mRCPOV_hZPMEj)|;?fI	2010-12-13	,H~,Uv_SG~?X_*R	4068.57	2010-07-03	81
232	DINERS	-2064407585	guzO=d*nWh RCCB!oz#dMhiU%&	2011-01-02	&{u*WutudsNiiH 	5061.70	2010-07-08	58
233	VISA	-1074380527	xvVAd GNPVuh#$f$RUlR|-.$IX}	2010-09-28	(omR-@UZU$F#+Yw	6058.81	2010-07-01	2
234	VISA	111221700	o@/[G_PrjB//ZI(M} J%AJN:z+x@Z{	2010-10-20	%hbR/SYiThbMWOA	8367.18	2010-05-31	3
235	DISCOVER	-1418468627	hg%hU|ej.gInL~w?iT~@d}L$FnnS	2012-02-17	rEl.%#,_LIFToMb	2832.79	2010-05-22	1
236	MASTERCARD	44683398	/jnjXKD^{&HJo&b	2011-05-14	.OW]pDL^:.L$iDY	7615.23	2010-07-23	3
237	DINERS	1533922875	N]Xo#HK-DyVmv[kUzqVwA	2011-02-28	+!B]WKpFg)B _XA	7062.85	2010-06-20	23
238	DISCOVER	19765303	EV;ah{J?*}Q!oz^Q%)c(_.-/Efh	2011-01-29	;}pJ)GS[tKZr&PR	775.90	2010-07-06	14
239	VISA	173516199	^|R[*svSLV,^df_+-QaD	2012-02-08	oGJA|_e% &O@~C{	501.92	2010-06-13	89
240	AMEX	375654480	$V%!Et@yHc;_GRb-PLBdfVL:}	2012-04-08	#WmXFpoo-:f)Nw^	1549.95	2010-06-02	36
241	MASTERCARD	-917691698	:*L[YddDECI? _	2011-05-09	f(v][gp&=*?Pacv	10038.95	2010-07-21	34
242	DISCOVER	-2100557423	k,[@&vCcUQlE]KnTo*:zH*EB) mWC$	2012-06-18	JLEY;Z([dC?/MoC	2834.12	2010-07-12	64
243	MASTERCARD	852186230	} FK&WYd-g@&hSmme#^E+/z|jj	2011-02-25	aAgH.XY%VHRJe/q	2946.82	2010-07-14	46
244	DISCOVER	-1577145847	,bf]lS:/ghU(hZ_OM= Iv	2011-03-30	:TShv%DPiYM]OO%	1741.25	2010-06-23	9
245	DINERS	1762068419	/Ujn?p#i]at$-?i!&:Qxuu	2010-08-23	/YyZJUV]xY?fn:$	2454.33	2010-07-17	66
246	MASTERCARD	-1114838139	]T}GtS&~:(A*ELb	2011-06-30	ycXE@bNi)JY-Tj_	5749.83	2010-05-30	64
247	DISCOVER	-852199920	oJ-IqfqZuk~IuJ	2011-01-21	F#&gIJo&XIEUsoY	5466.53	2010-07-10	68
248	VISA	-242227272	D?Ih(pF=(t}FPS[U~}mmU(=n-	2012-04-22	TZz@I#yY|Q@]|{#	9472.84	2010-07-05	92
249	DINERS	-49388480	gndhBDr(n%bW~s}@	2011-10-07	l.Ip[Gz]MV;in?&	5554.90	2010-06-22	34
250	DISCOVER	2003383849	 N~FM}nT._OV~huF;	2012-03-03	IVy*Z-IFU|KO$_q	2658.18	2010-06-17	18
251	DISCOVER	1259786047	#bwo-(YScTjtcm~z{	2011-09-04	/gljVPO+KzarNaF	3269.26	2010-07-04	46
252	DINERS	-1876244450	SCb z-*-vhAL@=+q&$nnim|!SN	2011-07-16	qBT{Ah B]i[-QwI	8908.06	2010-05-26	20
253	MASTERCARD	813768814	YvNy:mT ^JRe+&/lEYbI]nQs.y(	2011-04-13	%DVg.g?DB$L)pgb	3485.11	2010-06-08	27
254	MASTERCARD	1749746553	uz-;QIkCG/qt;+.	2012-06-12	ekkXDG/JfxQYNXM	3835.38	2010-06-26	10
255	VISA	-1893647493	TftG;,vAvR ^|zSwwS:==nRa	2012-04-14	yaIbg~lh$-vqwCc	4612.91	2010-06-23	79
256	VISA	1791593856	Avvl[vuoZ%Ce)GA=+T wBMO+(XX	2011-05-29	tpC?rbs/aaTVJOQ	1278.14	2010-06-09	66
257	AMEX	-1110925289	nc(s%,)o+(z,jXy~$*sAl;}-T	2011-11-08	Hc{iqm./G!XcoGd	2672.60	2010-06-20	59
258	DISCOVER	1615451827	$H-;]%@aEf]LjYRHr.b,PT(#zoA~c(	2010-08-02	_E=H-i/~TQ{x^uY	9839.95	2010-06-20	52
259	DISCOVER	204280651	F,bAeLPLb_,N=#rH|~+N=:	2011-03-02	%za}~QkH~NBl+Iw	6332.52	2010-06-07	65
260	DINERS	-957118722	P^*xi:alN#zrWfalxN@fIp(|Y*T	2011-08-30	Jt(N$;eua{T#Gd.	5414.93	2010-07-18	17
261	DINERS	-2123361767	hG+Y]Lvv(DpDNYT!d+#gLbZsb	2011-12-31	dGKrV}T&f]$J^(O	6437.34	2010-06-06	87
262	AMEX	-1476083870	onJshz} -y$Q|]@-auh%p	2010-10-23	|e=O|/N_m!cPbLr	5857.76	2010-05-30	2
263	MASTERCARD	-1418236966	;BPO]Jepf-#@}/D^y;ZL$dV	2011-08-06	a_]TD.uiBXn:%op	8643.67	2010-06-19	13
264	AMEX	-653827568	Nx WSS/F^X+sw);SNun^)*Ga|iE*H:	2011-02-16	tJA*o*QUo?xVQ?/	9521.72	2010-07-13	44
265	MASTERCARD	-1177109294	UEeaxmhtp.XIg -SKIppS] rDA%cl	2011-04-16	sMFe,}l;WC|A%qF	7943.33	2010-07-08	67
266	MASTERCARD	494928385	J}RK{?z:ZG?}:HZqhx	2012-07-11	^qC%; ,D&*hElGx	5019.29	2010-06-15	2
267	DISCOVER	813031721	n^hOCc/PDuy|hLqK,e.vyWp{YGD	2010-12-28	 r???[=)%r*~w m	5741.41	2010-06-14	14
268	AMEX	-2047644667	.KIN,;%#fVbD @!m~+qIEy@B	2012-04-24	-Y)^DKZgJKeUcsZ	3957.67	2010-06-22	63
269	MASTERCARD	-1321899029	aYxLSkvf,?xk)v#	2010-09-15	LmSTF*j!NT]{tAn	1396.74	2010-07-16	25
270	DINERS	-1848486620	ORQ]~&_A@qWGm?tr(E$U?RWaP[-|wf	2012-01-19	}_B!(KJv%mBq_Sv	2682.91	2010-07-08	43
271	VISA	-628020678	vhKw@dau%yMkOug!h	2010-12-09	@O*}?F=%k@f-;dH	1263.72	2010-06-12	18
272	DISCOVER	-947113694	StuQ?G[W@&D]U}^	2011-05-04	;%})AjOBLVw+Lt%	1910.50	2010-07-02	11
273	MASTERCARD	1323058942	p,C.Rkp|]upq+L)XQBc	2011-08-21	t%,-+bWXPrwG!J)	4567.30	2010-07-09	32
274	VISA	-1088250434	gd?@gRKRlu#F%H~D?-esC	2011-04-23	gw).i{XovQ.@BEF	3944.41	2010-07-06	22
275	VISA	-1736663618	}WvfEHzN@-~sNX IE	2012-01-28	X{~*@DN#]ZkLXq,	5204.77	2010-06-28	19
276	AMEX	-1009503237	qGA.Uvj.(rfv+Z{^	2011-08-22	:]cPUy,nUu{r~+v	4128.66	2010-06-29	69
277	AMEX	-1385471743	c+FY?hjd=B-P}]A)UNbcRD	2010-09-24	Jo^Izv#EBqy^O(^	7230.51	2010-05-25	74
278	DINERS	-1581680093	P.LSm=z_cPPdXIyGVsO@( AC	2011-03-23	_AQ#Bffq~xI!DFh	7226.48	2010-06-29	16
279	DISCOVER	76449092	K)ldtsToW{:yRgFl	2010-10-13	R;#SXXHCPesA}rJ	8476.50	2010-07-06	40
280	VISA	-948114533	/z~L-}c*U_J$y{at]nbpl	2011-11-26	@*T,,wb~I$w[D E	9794.69	2010-06-02	90
281	DISCOVER	1748379191	a$xx|uex$tWDOhvHh_uBZLus;	2011-11-12	h|IM??(m-ee?NSc	3944.12	2010-06-17	52
282	AMEX	-1461097974	-Oj/nU&BD*J:Z/PyF	2011-01-19	t(b|!~aUmV]*re.	10460.91	2010-07-05	6
283	VISA	-1106444664	n$P KJD:^,wkRHX*tRsAc{J,[$qU	2011-08-25	LXfS/FtmZ]hJR#o	9633.95	2010-06-30	73
284	MASTERCARD	1298488252	|VP+x=u(B@:htMo:ut/^ao*h;_d	2011-09-22	=J xA jLi)CuY-p	2277.14	2010-06-27	21
285	MASTERCARD	848341226	u%[+l+p|aazItCpXZSPIbOu+/fvZHs	2011-09-11	ovG?Y*izH_riHX!	9710.87	2010-06-02	17
286	DISCOVER	909807667	(P@LmwDrBP=A|+gg?v-IXoB{C	2012-04-24	$?!ZL;QO)Dya_{{	5502.95	2010-07-18	74
287	DISCOVER	1716956804	y}an;r!~~YgFwpg@uNFTwwZB	2010-08-15	stbPhcj%U~TH}y)	2813.12	2010-06-23	24
288	VISA	162326910	SNu&IafT?xnAnp+sYFQKp!	2012-01-20	ktB~ |lTVyl-yam	461.72	2010-06-11	23
289	AMEX	469850293	fj{(kfcfd]oK^sVF	2012-04-26	ke[.|VOo_WL$/(v	8315.62	2010-06-04	37
290	VISA	836226008	kol G@#d@g)T^Ga~oFWvS[#	2011-04-22	IZw@s)grgwWZWnR	4940.79	2010-06-26	69
291	VISA	-1653429278	uLeb;{}VU*i[,x	2010-11-16	hTQ~bw-j]+|y&is	821.76	2010-06-19	50
292	VISA	1203266276	x;Qtd[Xkxl-^Fy?	2010-09-05	dRtrA|x#)I*e[Z]	1803.89	2010-05-27	91
293	VISA	-2042264155	B;r]Ls}}Zs[k@cw]Uk[m& {	2011-10-04	TzAG!f$+P,QGMkx	2354.48	2010-06-29	21
294	VISA	-1206840394	H-n)g;v}lXxLkWj~wf;Oi.hija$dE	2012-02-07	lvP:%JX-x_sjz&[	8794.80	2010-06-30	5
295	DISCOVER	-1007479373	MIk?(|urmEPz;]	2011-05-12	R@:t^_^!]WuNC$T	850.39	2010-06-12	85
296	VISA	-1801220393	_sP: !gI?tmd|u_@	2012-01-21	wWL;(h]KMCy Fv&	1660.22	2010-07-16	26
297	DINERS	-701627817	_r{RkKq!Y_MX?]f.TPUO/Cl@J~% 	2012-03-04	OR}z}f-:JI|!i:#	6204.07	2010-06-15	56
298	DISCOVER	585607893	Qi^(OS:Z/ah~.!Re:$	2011-08-07	/ DF/KW=sCD,FJ}	4163.78	2010-06-16	86
299	VISA	-1927828537	KO#g]RmktMx[(KPHy#U	2012-07-06	lDaeSnTd@w%b!qW	6876.34	2010-06-07	33
300	VISA	-1940598267	Pw]VLe;CH=B_lkj	2011-06-12	^|v|:ZWmBia=a}/	9252.98	2010-07-15	83
301	VISA	2069731495	;}AZlw|f&QbCios%u{F	2011-03-02	Mewz#|xDhQ?;]XT	3324.00	2010-07-01	77
302	AMEX	420459983	b|@ PNSqwLAAkO[NoH	2012-04-12	.,Wb(OmQttgVC;#	1752.75	2010-06-13	8
303	AMEX	-1662006811	$fSu^*xw(JDqw#JIxwW,bjxd	2012-04-28	iwL#I*ux$eyG-z.	6772.80	2010-06-05	67
304	DINERS	-987049570	!nUwsC=NK*vjoBpsD e)lw	2011-08-24	jHG?v$MJuOR[oRL	6813.44	2010-07-03	14
305	DISCOVER	-1032881103	^e_}ZLuaMg|I^A]	2010-11-18	kSee;EUR|NE[^|P	6766.70	2010-07-11	28
306	AMEX	-1139525922	A,?bNb=^[U n]:GDbn+tZp-TvjHM	2012-04-12	#ndpX&Ye-Q]E.D$	946.79	2010-07-23	66
307	DINERS	-2108796579	pJ.nf,@YhAGeCDP?XTK	2010-08-09	@MSIYNk=n)nJwf)	2169.79	2010-06-24	51
308	DINERS	1239595129	nBqJ _&YbE$~GfL+l~;mnekVGOX.	2010-08-13	ikYI*#MUopBOhNk	6815.91	2010-06-21	57
309	VISA	-1125391016	zyY|$Ka]cWg.s*Tvz|-&jGl	2011-08-14	t)[F+LE:.L$BMw*	10775.38	2010-07-03	91
310	DISCOVER	-1790154786	YxTj_AEWqa:W-x	2011-01-03	{-*RvPL_]F,(Ep-	5088.81	2010-06-30	89
311	MASTERCARD	-1124062144	dS_)/jrL;q]TBHEWmRcRpMWk	2010-11-25	YEfExy*% ]IDheQ	2975.67	2010-05-30	62
312	VISA	-1528054599	(Y|?{tnGvt!-cy$Wt	2011-01-06	P$aolt^[YE-V[d!	6431.48	2010-07-16	56
313	VISA	-1270952281	)wftqaM@PrEv%#QvZOHkSeD!&!	2011-06-29	g*.iW/p/G(zCt.Y	1548.67	2010-07-21	65
314	DISCOVER	967878835	VOIKKwGq COFK?WO	2012-03-09	F@?xkQlUDxowF^w	2754.63	2010-07-02	5
315	AMEX	196838433	RF~RCx,$GVm=Dv&+;G	2011-09-11	*[H=nwS*l.);Piq	6875.86	2010-06-07	56
316	MASTERCARD	1309751653	@.qzpYzGpIF(daW_EK{	2012-01-22	hhB__% @,,~hzZ}	6462.63	2010-06-13	80
317	AMEX	713091467	$pj}&wn r?z*e^$oHGL(#i}{I,el	2010-08-14	Esc{e(ysc;JF!#~	4756.99	2010-07-08	56
318	MASTERCARD	-677331248	UkI;=)XreR$RXf|_f+^.r|L=.j-	2011-10-16	RsX?zJ_f&bPxz[}	6411.79	2010-06-12	6
319	MASTERCARD	60588444	*OIVOvu*S[!fCp ASY_gQLYP	2012-02-21	ynkkbzy~Sm=--~z	2688.64	2010-06-21	32
320	AMEX	-2026452297	gc{YD|!UswTiVjOhqe!?RrYUH;	2010-09-19	qOyRGhOUXQ%}LI@	10519.81	2010-07-02	25
321	AMEX	-1658568098	,BKw~.qk gXQRTmG}~Y[G!	2011-02-06	{Z,lxzGqCBM*-LG	7527.82	2010-07-10	15
322	VISA	1780082528	$SCB+NV|/t#HB)K	2011-05-27	R%Bi/XdyqY,:bd$	127.07	2010-07-17	12
323	AMEX	495585553	APKy|IGaKULYe/R~Zr?Uxdu{vr+GK	2011-02-02	ZGAx-wMp^+]v@Ur	8322.37	2010-06-18	58
324	DISCOVER	1114297892	+GR?H{q}Wf?Now#LS:=o)&h	2012-06-15	K=IZkJd)rn_NUU$	6051.15	2010-05-24	14
325	MASTERCARD	-65202950	A+iW:SI&wJ{(;pZb$je&!Qo)@tkWr+	2011-02-07	{s bPi$s)dsb+VH	6558.96	2010-06-16	2
326	DINERS	1920867427	B!A_oCb*Dr+iIk*uNcba&^/,{=lN-O	2012-06-01	.yVIFo?L|lB)]Sv	783.24	2010-07-17	28
327	DINERS	-1066038158	+mkLOgp=fFJ-irDZUtqfSkqwTb	2012-02-12	.Sy!{u!pNrqK;;L	112.19	2010-06-19	15
328	VISA	210456015	kGJ$Ko~g[,)N;Foz=~is=Lt}ED,u%/	2012-07-19	Q%+bkXazd{FPTL~	7200.82	2010-07-13	19
329	MASTERCARD	-1061263545	No@HxRzgn?I$IPe	2011-04-10	P.v(@|sf}d@p=k|	7691.79	2010-07-07	14
330	DINERS	766704870	KNBtd]mZp*rF~O$Ah&IjKLjJ	2012-07-18	r=cXD(VJsRrV)]v	3547.63	2010-07-24	58
331	DINERS	-1151492918	!q#]^E#sz{CgIZ|Apnr	2012-07-01	{Jy-GWHk$&u?qk$	2213.84	2010-07-03	65
332	DISCOVER	445412752	.]Pvnw)g+[{.H+lV	2012-02-23	CoZ.paXEe@e$C.K	8174.69	2010-06-28	65
333	DINERS	1621381982	VlYcvCq}%^#|HplDCp?ASHKRBP	2012-02-08	{(C+JkxFJn_htYO	10053.19	2010-06-20	44
334	DINERS	1221054691	=,x}_-O{+nen~S&iX;~	2011-10-21	*f++jE@=H?ci:Mi	4702.67	2010-05-27	78
335	DINERS	889034869	_%mzHaGzB@]%@e{i%ot!obJoMpt*O	2010-10-21	jK~EpYojjhv,x/I	5428.01	2010-06-28	31
336	AMEX	-1033574479	!{+NUbCl{^o@$qcM	2010-10-25	g@;Axw%Tdfy;K@k	3276.21	2010-07-17	78
337	MASTERCARD	746286790	vm##bms}o}^B{^vM-!;,|w	2011-11-21	@.u&CFkcf)#*pcy	5192.55	2010-05-29	30
338	MASTERCARD	1095579208	:(D@f?Y($V~P|Rd&	2011-08-07	D;I{?WwsFc}lq+y	132.25	2010-06-25	56
339	DISCOVER	612898429	G{,?#k/ezr#Ag-BE]lb_EL q	2010-08-01	vw+g{=qDOrP,W^k	5474.71	2010-05-29	92
340	DINERS	-1761836837	mI_mwwKtY{iY%C{oc	2011-08-30	O ux$*b=c*ljQ/M	3538.89	2010-06-14	33
341	VISA	767726841	;MidlY$;]}k#TS#l]_	2011-11-01	f+T~f mPeb;nDwg	3057.67	2010-06-23	11
342	DINERS	1273455720	oYH}t(e}@.$ETQK}}u[Q/aaKmo	2011-04-01	 zhDGO+oLM;=S*C	2935.16	2010-06-23	23
343	DISCOVER	1373731388	/tv$+RLrf@M(.Bx	2011-11-07	^Dx%g-a.x=v#!Tp	590.90	2010-07-06	86
344	AMEX	678636431	CDw@U=_[P-v.$:ey[)}K$@j}|%	2010-08-05	=sqAvoT [Lk]kz^	5404.03	2010-07-14	34
345	MASTERCARD	698251815	#] ?.&IMoGClt%Kui{tdSt	2010-08-20	n?}^JvBwLWqtPj/	9932.77	2010-07-05	84
346	DINERS	-1093420114	&n&gW,B :#?a*cV$fB	2010-11-19	dT_B$vZ~J,c&~e+	389.88	2010-06-27	34
347	DINERS	-1944423909	;yeJGG v,iW;p]cnUn*PUPuX=PaKc	2010-10-23	VQ?d}$a#H[@LJM;	8831.37	2010-07-12	90
348	VISA	1314816526	@zq;]%wjaqZodv!AOOzvKxe$B)VZ	2011-08-11	d:dKOln}eo)]D{c	791.74	2010-07-15	80
349	MASTERCARD	-958365816	Y/MF*aCO(D{tFm_wSkMAcecS	2010-09-09	kwMa_y#jQ[x;PNW	1182.07	2010-07-03	71
350	DISCOVER	221300362	OpzPVrTr)C/Qe|I&Y@[&& uvl -	2010-11-06	c^Mw,UGF.jne{[B	4598.30	2010-07-11	55
351	DISCOVER	370315544	ZU,zzL;Eq+X{WeK#Vsb	2011-07-18	{dBM#Jxh%hkKRuM	715.45	2010-06-23	84
352	DISCOVER	1320051766	l_r/}}u~h$k%#nwa*&Jx	2011-03-05	f~t?lCV CXf[ni?	1152.85	2010-06-19	29
353	AMEX	1091947304	fnP=s+*lEh&NdGOAsfk	2012-04-07	D|:nw;/keAww*Rs	5468.22	2010-05-29	21
354	DINERS	-1833384584	C^hrIksVwEGu|(FHbCYo)	2012-02-13	GY^lQOX#YVKqOY*	8348.40	2010-05-28	29
355	VISA	1459918024	#BQ}o/EX;V#^E,r#oL=w^,pqkzc%=(	2011-02-03	@hcPvR:eL(t/oMt	6248.20	2010-05-31	2
356	DISCOVER	308553709	z!CQ)Sv-]cZxacKch]uCYNKK-OW	2010-10-02	&A{aueMT,:k%:FD	9787.79	2010-07-06	63
357	MASTERCARD	1486543640	pYUeUVcD[)SYRD!Aa|wim=ZnND	2010-12-08	q}rF.[I)*zP|fQU	9389.10	2010-07-21	10
358	VISA	-950064304	 .Nnj.Avcqvl xG+.=kpm!B	2011-11-15	GI;.Y]gi[rRDpJK	8964.30	2010-06-22	74
359	VISA	291041998	(k$R*F[Ol.WAFm~!y(rT	2011-09-07	r/)_K)U)})dg=o{	5663.71	2010-07-24	64
360	DISCOVER	-495753910	QN&dw_Br{Gk(aw pA[av;(	2012-01-16	xE]kojpb[|YOesw	10114.67	2010-05-28	83
361	DISCOVER	840597902	{@v)V=_,hCgQG@%^jGts:eUMb	2011-02-03	Zo![cyOCE^X&.oI	695.28	2010-05-31	80
362	MASTERCARD	-1571112020	iLQ]Y#R) Ldycx#/aj{{~;u%;suY	2012-03-26	or:|vB?R&=^V=o@	8352.12	2010-07-22	90
363	DISCOVER	1924863709	Go.eYTNO&rI.FFsX@XKS	2011-03-27	-Auz*Oz]E%KrL=k	52.98	2010-05-26	78
364	DINERS	1772007059	E+Q!~+/ELv(t~im,jrz!I	2010-12-01	e.b{GX,eS=m|t@:	7717.55	2010-06-10	18
365	AMEX	-1189051257	a:jNfi;,iidI-ZU[,y?VStKw[,I#!	2011-10-26	j*kbe+VSfMiBCRf	1008.77	2010-07-20	60
366	VISA	-805121586	w%KaJ%g)O#l!~is}*Nms{cr?gNNj	2012-01-19	Knh&k&[WQFCb^Th	4910.26	2010-06-02	31
367	DINERS	-1056279174	ul~mT^Tnf{w#+m	2010-08-10	(HWp(AV;{)~SMHM	4623.12	2010-06-23	1
368	MASTERCARD	-131305102	F-tY?T]|XKodFjEtGJef	2011-11-06	/&kUCznFw,o{A_,	8195.58	2010-06-12	64
369	DISCOVER	1123317908	XPkz@TVo%bq:&SWrVbPm	2010-11-25	wqr] KqfqkhEV|r	10577.56	2010-06-16	3
370	AMEX	1885889544	UN}FCa%izfq[[@@-OP$-@K[{yA!Iy	2010-10-08	i)a]/t#!Vy@DXom	8829.57	2010-07-13	13
371	AMEX	845528436	MvAPdk)+*,wQIbm?X)HEfdN^Rp#{	2011-07-11	^;Rk+#tkAA{VC,J	6043.04	2010-06-20	76
372	VISA	1606745908	@ZB|z+[%H_^=+pRcNBG]TpdZoU!o	2011-09-26	q~q]o$dB*jby~kq	4041.53	2010-06-15	83
373	DISCOVER	225639322	ChGp%(t/b:G:+A|M|Bs	2011-09-01	z@men-cH|i-YOS@	4353.80	2010-06-12	68
374	VISA	664560215	Y}VhIkJ(CfI}vB~D@PE%	2010-08-22	~M#=si_]$&ghL#L	5993.41	2010-06-29	8
375	DISCOVER	-788285117	dv?Tjbo[^d#LdA=G{U?&Sw	2011-06-04	,n|.A_^]Ib&Q=Fk	8073.47	2010-05-31	44
376	AMEX	-501127210	@w,KR#kH@xpmdSH[h{EBV(LH;en.F	2011-12-21	Cexm~g[IH)UG=qh	6813.34	2010-06-13	28
377	MASTERCARD	532996129	qHX.^K]&pPrB=vlDB*fCEt	2011-05-06	&bfQ;.Z#y&{CSZ@	4451.40	2010-06-13	50
378	DISCOVER	874758733	mbjHd{*VM{zUjEH~+J(NmUGF}@V	2010-09-20	]G_&f=^!_NAgOKE	4992.22	2010-07-17	38
379	DISCOVER	546958956	B{{i(cMoC)K]PfaQ mU^)[n_DL[	2012-05-19	{q+ZCiwQjXPhPb}	3656.81	2010-05-27	35
380	MASTERCARD	831308401	xP$HY|$$EJ%sLo	2011-04-18	ZkYv=cG&qHR,VR!	8229.22	2010-07-02	35
381	DISCOVER	192967023	[*QcAJG.oGPUWb.}|nX	2011-09-10	GO fAmc+H}Qa$Bn	7041.38	2010-07-03	37
382	DINERS	-1227148800	ceMOAx+gB DVm,^C	2010-09-03	&DH uJi?Tmk:b,m	6991.19	2010-06-02	70
383	DISCOVER	-1016357743	h_#lQpk}f{z~iS	2012-03-08	@Do#[ce;tl@poJP	684.16	2010-07-21	46
384	DINERS	-1313591536	AQC*  G{RZoX%rNq:d lG$FP%-	2012-01-05	I?Q*F]R+{NG cAv	4310.57	2010-06-19	32
385	DISCOVER	284449313	Kspl# Bo:&i$;hO&e^y]Zc	2012-07-20	wv#Y@#.)!Xl(H}{	10457.78	2010-05-29	54
386	MASTERCARD	-1438706548	#~n/Ra,rPkgY=a:NNwJx%z nMN	2010-11-20	h:E_,DS%;js;~;E	8660.13	2010-06-03	57
387	MASTERCARD	-520783443	w|]Qh}Og$ao #%Y:	2012-04-28	kzm_kCLfAHuHBlI	5116.26	2010-05-23	19
388	DISCOVER	1506573925	QNKe)o+(oO**XLhRZTp*J%j~t	2012-04-24	WBpssRgIb^;~J-=	438.68	2010-06-25	92
389	MASTERCARD	-1641924217	Bdb+N~]nGCfxVOz=UlsfVKR	2011-02-16	Vg|y?,;x~HVVxTx	6408.54	2010-06-29	53
390	VISA	128635999	}:U(E-&eZ&[,&PylaG?*t	2012-04-05	CJNTX:,n:)]au;s	4508.59	2010-05-30	23
391	MASTERCARD	-191796572	niOHc$n$ZMTd+[dusg#.Lh	2010-12-08	_IZ*yE$PNE.$rLL	7973.88	2010-06-07	69
392	DINERS	1461662829	fHn[XHDin$Y^][ePQqn	2011-04-30	?]jYjJ*pgvuT?$Q	4627.68	2010-05-31	63
393	VISA	-2115998790	f;KEhRrpGGB?Vsc?.hsJB	2011-04-26	CVVz;^h/|=|-@|N	1510.24	2010-06-25	39
394	MASTERCARD	-267982839	mt;)$ db#jW($TQl+cb	2011-08-02	U)W;;jft=Qmhp?F	3605.64	2010-07-01	49
395	VISA	-539134888	YGl!].@zEsj({hIPfCZCO!eH+Laebi	2010-10-15	Cct_,,I He=DSke	7513.55	2010-06-22	89
396	VISA	437804239	q[r;~?yh^p-T,J I}rJLL#};hw&	2011-04-07	PgZfk#nq&B[{xC]	109.28	2010-06-15	86
397	MASTERCARD	-732677342	=%cy([Aw{oIjT}+c#Cu(BI]lSglHPk	2012-05-29	!sjY=i-AF^eu^rw	2742.54	2010-05-22	32
398	VISA	-411075304	[DY_?%t% .,K,)is}&{	2011-06-09	WLRe(yAK[FNpWxc	729.79	2010-07-01	10
399	AMEX	-170374811	E/JfAhU_]zd$+G{CtHQ|&#(w:SoR	2011-06-22	/NOdh;,kY[!Wb-v	3417.58	2010-06-05	78
400	DISCOVER	-1838664904	ca)[Y^%Xz oZ;H Wxqh/G	2011-11-03	+AqZF!s@}aaULKV	7826.90	2010-06-15	67
401	VISA	1260758951	^gf(hC^H:L)|ICSZ[EUjhPEf	2011-08-10	pQR]d sAUz[GEhx	1822.74	2010-07-21	47
402	VISA	2033780454	tIJ(ht}g:Sl{QM	2011-01-02	KTAf+b@=o(~v:r?	6383.77	2010-05-31	40
403	DINERS	-583252604	%K#d Pk^_|i!^*ztk&yTOZcpD	2012-04-09	W]k-kIE:}/{V+$y	9268.93	2010-07-01	92
404	VISA	-459660755	o_&,+J?RZVSc.E(d	2011-11-02	sw$moU(V[:~BXE%	5092.61	2010-06-09	16
405	DISCOVER	-176097147	d!=_PPAftdPxI~H:awMJf:uFH}?:n	2012-01-05	FPklxkcs@bH:/xW	9584.10	2010-05-24	59
406	MASTERCARD	-1577768721	uz{|Nap+DGQ%-L$Tr	2010-09-26	k$N],K@zD/dVQB$	508.92	2010-06-07	31
407	DISCOVER	669067978	CF.Wibe?zDvQfqs	2012-03-21	i#tqIgAWg*UQPx_	3158.45	2010-06-05	70
408	AMEX	559986744	tEdcoRc$R}Gt!@^lLra*/	2012-02-17	.D^J}JIUiPY_.j#	997.22	2010-06-22	16
409	DINERS	-2041311907	jje-kj{H*Jibs%Hm	2012-07-10	QH:dWsmlg+=mNiO	8884.00	2010-06-18	69
410	DISCOVER	-379522730	U{Ko P};pF;i_{z[W!zB*hgMmoN{AH	2010-12-27	CBaDY?.EbZo#h-=	6977.14	2010-06-17	6
411	DINERS	505554852	cmR@vvZW[|sWfx?iSv*	2012-01-06	vZqd;*/Jj:jD}^~	7593.47	2010-05-26	44
412	DISCOVER	889079739	|@VVpdXDWOrA?vC$X[MbyVE)k	2012-05-09	FA!jwL@Q!nZOdQC	8144.16	2010-06-21	26
413	VISA	1619543366	*|CD,grRVz]is}Bhk%eY_&m =R	2010-12-01	m#iz[kcTh:cRkOn	2442.09	2010-06-18	38
414	AMEX	64682754	(w+SHTPKOtU]B NFtvL#(zmM(B$Bc~	2011-08-04	JW]ZMfYTF#cNXKl	207.13	2010-05-25	14
415	MASTERCARD	-1453798773	].G;.joci&{OGT!KV	2010-10-25	o*{t{__T(d~)d+d	10739.20	2010-06-09	61
416	MASTERCARD	602442944	!QdLq)-icH;EKqDs^pVJhWIO	2010-10-23	ePYTjnDg~f#gLi)	8296.23	2010-06-19	10
417	MASTERCARD	4618116	M;#ngy[@G}qvf(?Z!Qk:!nAIfE_	2011-03-21	fRx_Y(KLQ}:sr;*	2889.00	2010-07-12	66
418	VISA	1177938325	;v+^bzCmNB?dMKE,|Uq_	2012-06-09	TguIE}aT_GnGsVm	9757.96	2010-07-14	41
419	DISCOVER	1995856251	sfLsTGkQQ-_DQ:H}b/~K	2012-04-29	+jE-=-^aGCmAn?/	8428.00	2010-06-12	31
420	MASTERCARD	-949386427	yX^&$-~ZdNdEz*;G	2011-01-18	T%UG &vFSW+zd(s	10772.69	2010-06-02	16
421	AMEX	-1770301899	GlE~_~v_zYv@Bio/]jsUscpuYPg@Y	2011-08-14	l_~o]Z&XsJR-]X[	8629.72	2010-07-07	51
422	DISCOVER	-1865654840	-l_]ledO|&dHP;vdGf/.]CbH	2010-08-27	Dp~fHBid~Et(~*M	9360.66	2010-07-11	16
423	DISCOVER	-1303726494	)^#cl(tyVhs?lb#*VOqpy	2011-10-23	t[p@lnefS@{ zZf	8213.56	2010-05-28	37
424	DISCOVER	897629223	a*Si&?U[,a]TK-sx^,TW!ou/~./	2010-08-23	wnsCYb.pQ;M;/r:	6180.67	2010-06-18	31
425	DINERS	2070780879	}Q%hzbR%N]]qRQ:l	2011-05-17	&e*|A@oXEY[nITK	7189.80	2010-06-23	52
426	DINERS	-1635034328	/NlpAG(/^X:=SzStUnIY,LC	2011-04-02	fBZ?UUXmn@M?NS/	2190.94	2010-07-05	44
427	AMEX	-414402592	Cb)vcxbzTXH=DbOL?	2012-02-25	ojVo-Q].@iV*]W:	7972.29	2010-06-25	38
428	VISA	-136457159	v!YK+wPplo;&/xTEq_?P#s-PqP*B	2012-04-01	L#tMzOc&WZ ~XYn	835.74	2010-07-21	22
429	AMEX	825905190	OT@zQGfPE.Hs|@o	2011-10-14	H?Qqc,Q(bXMbSa}	5809.43	2010-07-05	62
430	MASTERCARD	-79063627	YlG!~j!Inrh&#cI:=	2010-08-27	z,k-(%Q_NkRJ)!T	3247.05	2010-05-25	31
431	VISA	1243007984	):X-m/kdJYn~{ZvEbma&y^}jYmvD%F	2012-07-02	Si? ;O!cEpV/%SS	767.31	2010-07-06	74
432	DINERS	1346304996	 svjF,LeCQLQ@ln|K	2011-12-26	ib{Feqo$}k,^x$@	8223.27	2010-07-11	10
433	AMEX	-22256852	-g;c,jzL;bj/R|xJ.)k!*#pD 	2011-06-18	fzYi%}ar*MMUtSo	176.23	2010-07-16	56
434	VISA	-2047585666	DWs]qXO@aD#FJkigV$f)-	2010-12-31	={*W/ttS n@AjQk	6726.03	2010-06-04	21
435	VISA	331538843	{$i{iY+/{YaMAt=)JKa o[bobc*	2010-12-26	bI%#&TBNGOKS;XO	2247.24	2010-06-30	5
436	AMEX	-327517129	Qy,UmGRY/c:X&}zoI**	2011-02-13	G(j*bifq~*XFmtT	2165.66	2010-06-02	53
437	DINERS	1520908967	_d|yKP.:*xzp?;db	2010-09-13	v@@wL~qv_+^nW|^	2819.66	2010-07-13	66
438	MASTERCARD	2027742240	n^cih]F.tmEvdyD{Adt	2011-01-27	:SioQhQ^fy?%c; 	5870.06	2010-06-22	60
439	DINERS	-781645940	BVd,ssJ&Q{[zWHb&x)Aw	2011-08-20	cske_jdnUSGuPuJ	2521.14	2010-06-28	63
440	VISA	812157191	$m w|~VH[u:J e#hqJ}IeiB	2012-05-14	M}ymWaL()CLIl%q	4043.47	2010-06-27	73
441	DISCOVER	2096786731	;XwsZ/iwX!Y~XJ~:jr	2011-08-13	rg~r(YMA$.dc}!E	9068.93	2010-06-09	80
442	DINERS	-2010133835	QLkg^.%^LJy@*(lf=,Wm	2010-12-19	.CDND~FEp:WT^Pn	10756.16	2010-05-27	28
443	MASTERCARD	-1841072245	UvB.QV^p-LOl!YuPZ%	2011-05-19	HQa:kKSaABdOnjL	8687.74	2010-07-20	64
444	DINERS	-918791687	hJC!Ak[OL#wCqc.GV$VI+o)$I	2010-09-20	$+i_B?K:WlDUZd#	4998.37	2010-06-17	51
445	VISA	368565635	P=b*vBs[W)iFkm	2011-01-13	QcH nL_.+e)gdUy	9938.09	2010-07-20	26
446	VISA	992414826	TxeWqYQ,+[-MjBE[Zcb{)fE	2012-02-05	fV^P^eI!]-Q@{D^	7186.69	2010-07-11	56
447	DISCOVER	-1912426628	J$I=Nbg^WtOSp+lM@eZ?Tj!	2011-08-12	ut[NR|/cqXY:X|N	1611.67	2010-06-02	25
448	DISCOVER	1151113409	Hgzwlr:e=~FebbN^+qMXj+^~	2010-11-26	=[ds&,.siOjZeIK	3189.97	2010-06-26	61
449	AMEX	-809875539	qZd bO/[.sYb;KYCIGVBoK,T[T}zcd	2011-12-22	xlPzaxT|)xWl]mI	3461.38	2010-07-05	20
450	DISCOVER	659332518	O%ZZQhf,*X ^f Gi+JY#s	2011-07-04	( GG {[MjErfMFg	7927.28	2010-07-20	10
451	MASTERCARD	-2005661179	~eg )cJL.aoAB/RtFI:SRbwtgTFu	2010-11-22	F?|JS&tE{C&J~sS	7818.06	2010-07-21	92
452	VISA	1772746449	toh.g(H&acClSQuj}.yz,BOxm	2012-01-10	Lr*U?~cp-W$SqWO	9561.21	2010-06-08	77
453	MASTERCARD	-1042713577	w_U@pjdXB@?VjpAjt?_TPZmJXf	2010-09-21	dj^#JT&JHp s=vf	6787.29	2010-06-02	75
454	AMEX	-816721561	PTQNaw[|v!b=lliVD]W?SE	2010-11-01	N}V:uo/+O}QPW_Q	2879.23	2010-06-12	51
455	AMEX	265655463	s$;*cV q+_C}T@Qn+/	2011-05-24	uB#TuUNnf)GfOlU	3671.46	2010-06-10	84
456	DINERS	1767499312	p[TSo|F /@&akycphyYC:GMLAa!%	2012-02-18	%$UyBP%Nzjc[B_K	1593.61	2010-06-17	1
457	DINERS	-1229770375	+:~v$K-ueBbSEaSUXs	2011-07-04	irb(QzGYaov+/A*	6162.96	2010-07-04	32
458	DISCOVER	-1880387359	D #g !r}/t@K#-dkBC)g,Of#Y_onN^	2010-09-29	fOi&|iWGNB r@zz	944.55	2010-06-17	56
459	MASTERCARD	549956831	#zVB.!qF~SLfiJ@&%C	2011-08-16	eDW+~mCH(mzSU|t	8283.52	2010-07-24	13
460	MASTERCARD	275114531	.mp+AYbG&+gW}dlC	2012-06-11	|VUPy%LFYM~yE^*	3689.82	2010-05-24	37
461	DISCOVER	-815887456	A](wN~b}OE$~HaCp[dmlp%.r#D	2011-10-14	gmZw_H,;$IZvqMn	2751.28	2010-07-05	54
462	DINERS	-767567658	K&o&#w|BgciD{,[Lwf Qs	2012-02-01	Paff%d]GSNF{%z{	3400.48	2010-06-06	12
463	MASTERCARD	791781736	 A=fD:d*{))s:RmqZUl{$*	2010-09-29	AYqsR;BHgVBa-Y-	4778.21	2010-06-23	87
464	AMEX	1324918825	sDZcqTynzM$j-NvCvM^jGH$Z i!	2012-01-19	X|Aw(YfvYmi]X(f	10680.63	2010-06-30	44
465	DINERS	-407859116	-eVu*SGXnqk}V]HD	2011-08-12	QgyKr(wI;!^Ex!%	10825.05	2010-06-11	54
466	DINERS	-1617120360	+;~EjA#YJO,L-*	2011-09-17	IcAHa&%fRHYbc:R	7482.70	2010-07-23	53
467	MASTERCARD	314894867	p.R-gfgZ@q?GY(jw#b-XE	2011-08-07	l$bFr-KCqmVY@EW	8395.41	2010-07-21	80
468	VISA	-1074614417	t*dWyw%aU]&%~UvE ]ZDN tg	2012-02-17	bOmcTnPbgrZoP^o	4494.88	2010-06-12	12
469	MASTERCARD	836298979	slnHWt/v@vNqiF( {h!AT&]ToEy	2012-05-21	vgOfuicyzsQ,fyO	843.12	2010-06-07	25
470	MASTERCARD	-776232168	.inKgQgce[}^awDL)_+nD}kCJ&UA(!	2012-07-19	C:FiH}?g/)chwX$	5937.24	2010-07-25	46
471	VISA	1850373324	;i|s@ olTJ&eqC{:?Znhh!AnF]y	2012-04-20	~ ,xr_ lNx#(kfp	8856.51	2010-06-03	12
472	AMEX	1835906156	:ZE|L!X;rEhEkVvyJr_{	2012-03-23	L:!jN(LlA_GrhpY	8669.51	2010-06-02	53
473	MASTERCARD	635809356	}NI]AztxHMIw$bHQ]=yt{e.of	2012-01-08	(=|,*==r{Jq?{+^	567.73	2010-06-30	33
474	DINERS	-1113332396	oClPvgJMeHKs{oPwU^otIk{U	2012-02-28	+f#=L$mNZ(h$JTi	4580.86	2010-05-26	49
475	VISA	1026163830	MRtT{hu{A+c~nTB	2012-02-22	iu?gpzqc!AIC*-]	6138.64	2010-06-08	8
476	MASTERCARD	-662427596	q?yG&s%IiIl*:fa?x;N~O	2010-11-24	u/tY{@;aIc/]H$R	4144.38	2010-07-02	31
477	DISCOVER	-1526009437	cTvrhfp^*O$oCc.	2012-03-20	FR]/KWMr}zibZOn	4886.89	2010-06-10	14
478	VISA	107925161	$]g&-QDKh+pNWebrwL|--RcU=nf|i	2012-06-21	bvWwl|(~p=}|Q+^	1515.91	2010-07-22	64
479	DINERS	1218271188	)i+~{:il:;m|vZ+o^@	2012-03-14	{ED.oI^G:g|d_oC	2263.69	2010-06-02	64
480	AMEX	1432253159	o+VxR;;[?(XMT[XU+!	2011-01-10	HjfqqNX)mRzbJ].	1919.21	2010-06-23	41
481	DISCOVER	1072066592	}pEAr/,f&SakDqU:j	2011-11-29	Lt/YG^K[um{[ iJ	7517.76	2010-07-05	68
482	DINERS	-2012869712	nwfjhNlHRToQLS.:]h;Rn{^?U	2011-04-15	U}^{ADNEE|%_m;H	3786.69	2010-07-18	56
483	VISA	1826757667	,GxlGfYzIomedc/A?~GR]V*K	2010-12-19	cLT#SMj-GB;QAIN	8209.34	2010-07-06	87
484	VISA	366649311	R}fmLqeET;!vSI$oior(oNO	2011-10-10	hGXEqYdLESZOo#-	2013.58	2010-06-17	78
485	VISA	798883882	l;r!JwDOu R}VePtq[n:C|	2011-02-11	rp^EutgXAwBEF~o	1568.76	2010-06-13	21
486	VISA	902894274	sawvJj$jA^(!U^S;uW~TBg	2012-01-02	I.t=Nkff/.l@[@l	9939.77	2010-06-14	41
487	DISCOVER	1876047943	dFCBK t{anPhao(	2012-01-14	k/F~o;|PS$XKQ%&	3991.29	2010-06-17	68
488	VISA	-417782529	zLm;(;:O=^S%Wu?Y+s	2012-06-23	%;NMw=HMoN!%cm?	3975.39	2010-06-03	54
489	AMEX	-346454549	hlbO#I;X:F_GWHfN)WbN@P}	2010-10-06	dpMD{y BRhssn?m	4735.09	2010-06-28	9
490	VISA	1201879790	pOqiGV{c/~~s_@	2011-05-18	I),/[ZI?BLaQimt	10159.38	2010-07-16	68
491	AMEX	-6174281	uCefZGWs~{fP_r]M_LeQ	2010-09-20	Sce}k)iO/[RX:.}	3086.65	2010-07-02	29
492	DISCOVER	-1610769198	CEcwKL;jnhkPM,QEAkBav/	2011-06-10	mYkx{GNN@{)Z]Nu	1165.13	2010-06-03	3
493	AMEX	1772328146	y%?r(sYG_[@:]H]rp(WqUcExhg$C_L	2012-02-20	BNS/wcG{nK+nV#C	10444.79	2010-06-23	33
494	DINERS	1352824525	kv=_J$#X,f_mg!Pw~	2011-04-12	LA?sa*vOF|s~KGv	5934.09	2010-05-30	81
495	DINERS	-17326271	k=-?^$HBo*)FPiF^KCki	2012-05-30	J@Ldk^:*[ ONXnr	4597.00	2010-06-01	12
496	DINERS	1369085156	L$zwSgs&::uo]Hn{oo	2011-07-17	!T WnCowcFpK~,t	956.05	2010-06-10	61
497	DINERS	-643518474	({xZT#}K:VU,qT~MB b*_|+_uFL	2010-12-11	|DUF}BJK^l,~D(y	9237.62	2010-07-20	55
498	DINERS	1645531232	ruFp^xi!)rKT$$Oo: ~:%VRGN	2012-05-11	kQ} EBJ+}aY~j:s	2486.37	2010-07-04	44
499	MASTERCARD	1824999789	lg&NKf;Cr$=dL*XdbVW*!UJE	2011-11-23	-II,to=:()vP]]}	7715.13	2010-06-27	7
500	VISA	-1147384791	(-wds_bcA/wf+&	2012-03-24	@LsBxfk W_YDy;:	9761.70	2010-06-08	32
501	MASTERCARD	423344499	)zA,v%LRC)-YmgYZ_IVG;	2012-06-24	YR[e:S_!_XJU!*$	5820.65	2010-06-07	41
502	VISA	-590403090	G%fTe*kuXHmg,d_H$qwR!=	2011-03-27	XKi=dalK,iU{jgH	2391.38	2010-07-15	81
503	VISA	1669770495	+|c_|A|hBTbbtGQBDn&]n	2012-04-05	oh-|n*=afz*y@sl	6900.87	2010-07-18	45
504	MASTERCARD	1723168407	r#+&f|=X:fRBnUE#K)Bpj*j$s%=f!	2011-12-21	)lMV_WdjiVl_i:U	10631.47	2010-07-15	84
505	VISA	-1474161446	z+.Lf#q(vHj#KH~	2011-08-09	x;_e[}lw+JW(v +	6335.40	2010-07-25	30
506	AMEX	-1173775770	RE,a#m+{{h/JlLREvR() y?p	2010-12-10	ze[xIiXbGaJ(Ogi	1960.11	2010-06-26	72
507	VISA	-1017629029	jUd;RhGr.UZe|h[Wx	2011-02-28	l._qwPn-|kOvm.i	5565.70	2010-07-06	77
508	DINERS	1127677994	l[GuTDtIZ&RS?cACeN:dPx?xQ	2011-05-22	t[ yPZr?Wa+_YQM	6694.43	2010-06-28	71
509	VISA	515129076	SB~=jKknafYF(_ymL:_fXk$-LQg	2011-03-06	,[s jIZTR^?-jTk	3189.13	2010-07-18	21
510	DISCOVER	-719098944	oAh-t(CheVO(_]b	2011-03-07	avlSUx+xBYVlLC!	5642.86	2010-07-13	44
511	AMEX	-1665937151	](]Y+ ODZrf{.DwBk={rl[uX^) Sj/	2011-03-08	KbhZ?Bsx(hxPr:,	4333.34	2010-07-01	29
512	MASTERCARD	-336761894	Lo|@o):_EcBsjzdq	2010-12-02	ePkF_JSG=P-LVzY	9380.30	2010-05-23	38
513	MASTERCARD	-1149468300	PqOP_S-W%WH@D$oT!AGPFZZM	2011-05-06	;xaM&RH]fAgqxA[	6398.77	2010-07-08	74
514	MASTERCARD	-1241284127	y!aqhJ-{}bABDa.k)evtr:-TM	2010-10-05	Sum~-ul Q):,^QA	3729.95	2010-05-31	49
515	AMEX	78833753	Cl[q(%+X[xwb~?Vrlfm{]fK.r	2011-12-24	n_ol!i~$YrMyWt}	1352.68	2010-06-22	25
516	VISA	-377504241	aPf}Or~uF^%,x.A[uEq#gAIhsq	2011-03-08	G )C^ ZlVUoiXgD	2040.80	2010-07-05	15
517	MASTERCARD	-1586911374	HXi(K#x*mOe zNRAckW/GTaP!=-@rv	2010-10-01	^flrSoukEZo*zCP	375.57	2010-06-17	4
518	AMEX	1523207206	r#wh][DUz=$v _:qs_H-Z	2010-11-16	w~gq-~P-JL}NePk	8842.78	2010-06-06	23
519	MASTERCARD	889049264	@.sRINPHSpYqg_#Gvd=}	2011-07-26	BSK#@w/:;m--=:t	5757.61	2010-05-24	25
520	DINERS	-1448213541	$:?!-kNDGwlU{,w*Y*	2012-06-08	he_z=QchR&H(ABl	10464.77	2010-06-09	85
521	DINERS	402028488	@;AH{W^BD/.wmHZRY Qz)g(t$xx?	2011-05-09	SgnSA=ie[exSVrE	131.51	2010-06-12	15
522	MASTERCARD	752770401	xErQVBF-[sTe*bCaXU:[Hvi	2011-02-11	N=!D)SLjWFhuCdl	2198.92	2010-07-19	2
523	DINERS	1086120992	gRUCG=QbIPjA*rG[,h#i	2011-03-15	Cla#=aYNPAhjv$u	8310.59	2010-07-01	20
524	MASTERCARD	-98967326	AQ$QVflfqZ.VQ:WlO HfTe}N	2010-10-18	orVpZ_hRrjocjC{	1975.10	2010-06-24	52
525	DINERS	997017598	Lr^=$DSY[N!Ck#/;O.$jU	2011-07-16	buA]Bc?wt|w_=Gd	7788.41	2010-06-06	47
526	MASTERCARD	-2080835389	NE);cwT|v%&)&QAqcPW$	2010-08-15	MWE:W*?;_;)=J{[	7580.23	2010-07-12	91
527	DISCOVER	72694451	YrM}HfC_OGWG{)n_o$mMITmm	2011-04-24	D%vy~|v(mYbL}:j	7766.77	2010-06-30	1
528	VISA	1601451996	v,[tysHBJ}CXu|_EKnoRle	2010-09-06	t[ok~LP))F~FMlD	9429.15	2010-06-01	9
529	VISA	-2091905678	,&SRpC%mjKid$%;pV_%cQ&NqE	2011-12-03	mrL;^PPLv:GZqRK	2051.08	2010-05-29	48
530	AMEX	372454622	+YHIaHo{u%e_S$ qy#UK,yiZCF	2011-10-21	Ejx )[FHSt*HyNP	1797.42	2010-05-31	46
531	AMEX	448072787	j&$(wiVS]#D/x$	2012-02-04	_GZu.?Chk^[*ymx	10231.31	2010-06-20	25
532	DINERS	-209081072	^K {OxxigocClK.w,CnhcW	2011-12-29	sj;IbL~*zW$gjnj	1932.20	2010-06-23	68
533	MASTERCARD	-1012478337	a-H/)N$|/^{~OEcK_?yw	2010-09-28	/W|m{awYoM}fRb|	6765.55	2010-07-08	1
534	AMEX	1384930532	v:QP!{W#.cmw*-@)JmH+w:EK[ikmp_	2011-01-12	nieW$NGxq/DknXo	6765.35	2010-07-11	85
535	VISA	-1847546989	osz{r)d-^{a=?m,Rk}[.|dS	2011-02-02	%]=)a-?l.[MzFyC	9362.80	2010-06-04	17
536	DISCOVER	-1990994331	O&vxyU%Z-EUI%MigUmIZIlb^s	2012-02-11	vXK)VD^(~-@[#%V	84.79	2010-06-08	40
537	DISCOVER	1706745463	s_-kP$GCHj^m^O	2011-06-16	{GUg GHmzfRQVa(	9045.90	2010-07-24	75
538	AMEX	-989008914	BpQK!^+uM?MTSxl!e	2010-12-19	mrVqYTH~jXxx--W	4270.48	2010-06-29	76
539	AMEX	-323776564	n,nWYAEfJ[ZpIW.))TtpSl)DBo	2011-01-31	e#jCUQ_+*kKaC=N	7131.18	2010-06-29	92
540	DISCOVER	149408817	u.@k?[S$}Ob~yDOv-UgZA]:]ts(%.N	2010-12-22	FDGTQe]quSMljNN	3936.53	2010-07-11	65
541	DINERS	726695346	_yd(}RI_VduJ|%W=EifZE[FUn	2012-07-09	Qnu?O/&[uY%CCn^	7258.58	2010-06-16	73
542	DISCOVER	-2014920535	KTiJBKeYn^-lHa!+lBCM#	2010-09-10	x~ST!U&BzQVH~t!	9534.28	2010-07-20	31
543	AMEX	1617952655	$@GtBRLDqZ(;?t{fUUFhELZQ mgj^	2011-10-10	QUFL(m?;OW_yO$n	5036.60	2010-05-31	20
544	MASTERCARD	373410669	;:wF}rx.jL^:.}#PY	2011-02-09	-=]@?y?ZE,n|Krf	5057.61	2010-07-09	42
545	AMEX	-323821399	~jz:W$(bwD}Xc.%Hg	2011-09-07	Mu,acf U.INhlAO	6504.04	2010-06-12	42
546	AMEX	673167835	(#]?$T Kz%}Jb,kgH{QV!	2010-08-15	II^Q=!NtCyPYR^K	1456.60	2010-07-17	83
547	MASTERCARD	-1060087063	f{G=Cw}:LtXzwMN?tEP*A$+Vv	2011-06-19	=V-qg}Avz]LuMYb	4064.26	2010-06-25	4
548	MASTERCARD	-1649948672	dMmTW)}o}+EBxjn	2011-12-17	l:)fIDgl%}!!D-c	8866.83	2010-06-10	63
549	VISA	531898215	DYx/S!FcR{|.q(fq	2012-04-27	H{(b,P_@z_kA;_{	179.11	2010-07-07	82
550	VISA	2100683970	{n}?n;tbYa*r#u/[+ki^.?bfHrb{XP	2011-08-23	iS*a_N)~XzKzyG*	3878.03	2010-06-23	84
551	DISCOVER	-978891323	yL,U{dZjexza)FT^	2012-02-24	_I^!ETL;JK_RFaL	1064.66	2010-07-14	11
552	MASTERCARD	-136842723	N.-Ip*x?rUdd]RHwodDZoFH)_	2011-11-13	!)!F{WShX+r;p}E	8142.81	2010-07-19	60
553	AMEX	-1729646616	QtB$){SpaGjFn+ZbA	2010-11-02	vE,Ccjoki{o-|G+	4533.49	2010-06-12	64
554	MASTERCARD	870257700	d!L;#.iQW#&^I[iAD-R	2011-08-11	[^n?XZ~;]az]}_&	1631.41	2010-06-01	86
555	DINERS	-1566516817	X:cKBCPBxBB-N=JXp#I)U$)=z~EO}	2011-06-26	vP^Cu=.eYODrsfL	759.91	2010-06-21	69
556	VISA	1001736479	kqqKd=IU?NTo,ui#)/=jDMz#M~*RN	2011-03-27	Q/m=#*(&cWk: }q	91.46	2010-07-19	22
557	DINERS	-1731873843	d)ON@LUYoMc#CydxHrooVP~	2011-12-28	#^Fz_( ,@LZzOrg	4418.10	2010-05-25	12
558	DISCOVER	-2141216493	(#({JC)*%GZ(!TIX]xHj{	2012-04-29	l$gepUEEniKXG=,	2578.22	2010-06-10	63
559	DISCOVER	1045031808	nehXIn#,_cFf~W);^:@OgHW=	2011-06-09	=hP+[F?Vm=YfbTm	2756.41	2010-06-12	10
560	VISA	893333401	P-=H%W?.Xd/COqWK;Ao!fukwoEN	2012-06-12	DEdt:xF@r rTW/j	5245.70	2010-06-18	50
561	DISCOVER	1036071348	nN}-dX)C_s[mwrim	2011-06-11	*c IG&ot*dPDNV.	9111.57	2010-07-15	16
562	AMEX	-1271837651	_RtBh-RNsQWsPP[H[&n[sWdRs#!V	2011-04-14	U*vH@E@Owr)a,F$	5274.60	2010-07-07	51
563	DINERS	778352441	_u^O#/V;?*Jil,[_	2010-10-13	m[JDEkVwMCL$XQ 	9348.45	2010-06-30	22
564	VISA	-1495247946	&b:{CZ(tS]]-o$iWFVl^zmBF$pe[)j	2011-01-07	J=(stKhJW)rSe[e	9521.87	2010-07-21	73
565	AMEX	-29972801	uV_)X?%IQ%+X?#UY HGwKk~}Z;~*{U	2010-10-15	qx_&ztr=Q+TCW-E	10825.35	2010-07-19	14
566	MASTERCARD	1198459938	{[+IwLYS=+KtInN&X	2011-04-30	i?r)~IJE~)vWQDN	112.78	2010-06-04	47
567	MASTERCARD	569922475	wx_v[/NbHwLqzl	2011-04-26	SFwegdKi{NBcJDR	1445.34	2010-06-10	60
568	AMEX	-417624858	Zwr kpR/)r PYvsYA+%__sL$Ki{SwM	2012-02-29	c;DVU//A?MMzpP^	10763.16	2010-06-21	67
569	DINERS	1134752855	cdthlQEwae!ycv.TZ	2011-12-31	@K/N{_bHjPh~R%S	8141.56	2010-07-06	89
570	DISCOVER	-1125033658	mHozQ[Yw=VR]%f.	2011-01-20	/:aOTCH@|YJC&o)	3945.65	2010-07-20	50
571	MASTERCARD	1543730566	a|xfXDDDmQOq~CsxJq_EfQmD^Tz$V	2011-11-03	z}He=l^?.g:qpI)	2810.80	2010-07-20	77
572	MASTERCARD	-215419755	mJ[(mRLv~ @.MNNsT	2011-02-27	}Qyav}.[:bliiKX	5414.67	2010-07-18	88
573	AMEX	-1508924099	Eu{WTI?:+:SCE|B, f/%qpg	2011-06-22	WXoPEx)B#Z}.P^Z	2826.35	2010-07-04	67
574	DISCOVER	-981792046	I z^v;b;hiOJ%UD@K+{::|SGP[j{	2011-03-16	plYiHdE]bMLyHLU	9819.19	2010-06-02	27
575	AMEX	736042902	tNtXB-r-AbKb~tOHq~	2010-08-06	NS!JW!l?ZXiKv|R	2009.35	2010-07-05	35
576	VISA	907026365	Le)hTLt+xM=JKq!A#:M	2011-07-17	|=Tv wEWxn#i~Ob	10693.04	2010-06-03	23
577	DINERS	1716847233	MLCm?ANrWWBA$UqbUv]K|o.Qb	2011-10-28	-;lc{%_SDk{U|cn	6988.79	2010-06-27	32
578	AMEX	-1192073515	jt*yUDdc@;BGwM%Tp*Rxl|$PuiFkU$	2010-11-30	d&.NwA-QD#]&-u$	7913.70	2010-06-24	37
579	AMEX	-514456613	m.LO=:FSd@D.=,w_N	2011-03-22	wEhqo]JMXt;wEI$	8960.43	2010-06-21	45
580	DINERS	365912372	)HC{}H+!%zByBTp	2012-02-10	F%}rN ]Z: B;Za|	1127.67	2010-06-22	17
581	VISA	955710584	)R[JF:ShB)o|wv-^{Ag==	2010-08-25	~UIt&kfzH&a_xv 	7303.16	2010-05-30	44
582	AMEX	-2063898400	$QcvgQTe_~KVtA!O}|+$/B_G)	2011-03-02	@}brFhOs,,z)RWn	6178.50	2010-07-05	18
583	VISA	801884548	;g wNG#oHesS?NCmIp;VkuRe:+sQ	2012-07-02	BR[&CJgyY|DEk{-	2540.51	2010-05-23	46
584	DINERS	606104709	vju^IT|z?#s-Hc	2012-04-13	xuaJYykGNCDUaI.	10013.20	2010-07-13	66
585	DINERS	-527249900	IL,+@gwoqAg!OH ubb+B?I|D#&S	2011-07-23	m&cviU;a+~_Rd:#	563.12	2010-06-08	71
586	MASTERCARD	-2017147532	{T#MQ~tDJ*MIg&sp	2011-06-26	ML=bg{gybt/qBw*	10212.12	2010-07-06	6
587	AMEX	334615539	xUjGb.;vd?_X#mDiD#v}u	2011-05-29	Jy !^X)h+lIMA*$	1489.67	2010-06-20	90
588	VISA	-1204195668	VDW|XXkR)/bo+@tQ	2011-01-17	QiN!({Kc~Farh#)	17.44	2010-07-17	29
589	MASTERCARD	-211683256	EKd)V{^[Go+:?p-zHooSRrUHf/_	2011-08-05	a+&BG:}:He RZf(	1989.36	2010-05-23	84
590	DISCOVER	-121875112	]LgJhReN?LApQG+^%-o	2012-07-09	q/=Ri&DAz!{JXn~	7817.50	2010-07-19	41
591	DINERS	-1449509669	j:Haef?cGD}p,X}rUPgEXh@	2012-06-19	#..tZ$/LlBTDLCD	8016.44	2010-07-03	9
592	DISCOVER	251207406	WdRa^,-kA/ y ZsrJqf]VbP~l	2011-02-12	p)bOmPk~XJU&,%#	8354.02	2010-06-27	32
593	AMEX	-1645597664	[VGVmdAK;HN.e;a[~+k!arHT	2010-11-17	?wt)#__Wcelsn.;	2048.30	2010-06-24	41
594	DISCOVER	1032384175	UCJU]R?/qG/D ueFs-E]kba!@zUz	2010-12-11	|OcopZi:uNZYJOB	593.99	2010-06-06	82
595	DINERS	-975892642	@F%|Dsl;;y_m^a[|^K##N)}E	2011-11-26	IxWk/z~aO/:ar_J	5435.26	2010-07-14	78
596	VISA	-1326642648	LF,e^/D?tEj!zr/fAw{	2012-03-16	rUCODlxSBPu/%an	1812.23	2010-06-27	57
597	DISCOVER	889148140	z]Hmt]zw)|$lW@ZK)C,f?:r+mV:v/	2011-09-25	Fm/&*UrGw){AG^,	10280.71	2010-06-09	3
598	AMEX	1798141408	^lSgdYHfGlTqcKm-v..b|k+|jGd	2011-08-14	q.DAr-SfW jh?Si	10149.37	2010-05-30	44
599	MASTERCARD	686315128	JFsP!]y}MDu+TKb	2011-02-17	csys[Lis#j:n:O|	331.19	2010-07-10	92
600	DISCOVER	-1718569566	pOj|T-yC{[}J+Rw=Wv~r_T/&^!vJ-*	2011-03-28	XbCW&EDil=T-I}J	1855.37	2010-06-17	66
601	AMEX	467945717	.Ae$pXFJMla&+%ds:_UMcNnx/	2011-01-21	|}F(W]-$OO!&t@@	8213.62	2010-06-10	59
602	AMEX	-1488557791	ZeIzZGF*^?olsV^y	2010-09-16	yVO~_UwZ/u_?CcN	4912.79	2010-06-13	92
603	AMEX	1849006541	iDYF SawgFti%yfGwq;	2012-03-21	qz?tteP/@PO(a{e	10310.07	2010-07-17	85
604	AMEX	-1676363502	_NNpM@BH,C{),Pj%$Q	2011-07-30	-+u#:hoVTHLxDC[	5762.32	2010-07-16	56
605	VISA	-455946236	Lu~em_xCih|caP	2010-12-03	Q}S^)t#%(G#-%Y+	1051.57	2010-06-22	48
606	DINERS	298105303	;S?PZ;e!+-#i)$t	2011-08-06	$hiV{FC;[Ras@GJ	6813.47	2010-06-18	24
607	DISCOVER	1024796876	b/O$killQP$:+/Q?IQ*s?W	2010-08-18	PMlzq{?oXL$ hq!	10661.18	2010-07-12	38
608	VISA	-1736521693	E}Ws;fhB=oZS/lK~m	2011-09-10	YW?ie)MoFXDv{nq	248.35	2010-07-06	65
609	DISCOVER	-1073401661	igsElnJ!f^FHL[]f#i]iB=H .JBx	2012-01-31	K,N=.i|D  J{?:]	2801.73	2010-06-17	23
610	DISCOVER	984505852	iD&}h*fFDn$tCq	2010-10-12	dC{YcJqWB]T/aor	3411.48	2010-07-11	49
611	MASTERCARD	248418392	&.,@r&X{[tTU#AT#NiR	2011-01-20	[?P,d+(Q;HEz).K	5740.24	2010-06-26	65
612	MASTERCARD	-1463522203	&DUj^GWAoH  I~x(=LRp[!DAPXy	2010-10-15	|^+/UK.;($A:{LL	5608.04	2010-06-09	2
613	VISA	-57247472	$y#|!ua.Ee;~i%]-	2011-11-05	N.b~x_;/.w[GqSg	1294.70	2010-07-10	31
614	VISA	-1294571572	tDEguqqd/iH#UD:A	2011-04-29	!j&UtUx(,[#:d}V	3419.42	2010-07-02	24
615	VISA	1799666934	WEh--Vf^UTlMYBQP	2012-02-02	Xo/NgVYr:Ve&dqR	5115.27	2010-07-20	16
616	AMEX	-527927983	:et!F @hft!jhsrQ/AbKq_}	2011-02-22	lQ-/ecRszDG/Z:I	3680.66	2010-06-04	83
617	DISCOVER	-612440919	w(-f[R#x)zKKt-yDIu%(KtA!O	2011-03-11	.NHUkXRu_c(k_mm	5104.06	2010-07-15	6
618	DISCOVER	1692980306	LJY-QDA vSjqzx!$LQ*fF%	2010-12-02	~*IRxtqh=o^oj|{	7819.86	2010-06-30	91
619	AMEX	1613495007	t~-Ba+ik&rkKRuWp%nTcX|!	2012-06-29	#L!R Kas~Ww*y+Z	1659.94	2010-06-04	43
620	MASTERCARD	1817855831	h+PFR{: E}OHn(bn|*S^l&U;	2011-05-24	+beAo)H=YrM?^(M	3990.23	2010-06-12	53
621	AMEX	-487575556	HrJMM-(DQT#yJ.+]S^Mz-!_zhzXV+	2011-10-12	Ko~p}Ljx,~pefS[	2869.90	2010-06-25	12
622	DINERS	-2072344469	,}NVh^tFELG.gO(O~	2010-09-27	ZvlLlEAvV-I?PEh	8286.89	2010-06-25	63
623	MASTERCARD	-1465006079	VQSXB{h/%:UguSXuxq ;xuc/	2011-02-22	&q##h(:kJfyF.h=	8954.41	2010-06-10	41
624	DINERS	1302390052	_Fi*Bn$g?eBG.(	2011-10-12	[MS@^/:WncAZe?$	5536.46	2010-07-23	75
625	DISCOVER	467112750	W:G}!:_QIQ.RMmqu	2012-06-10	/]^?.kNAzsq%N:u	6301.13	2010-06-20	37
626	DISCOVER	-663519421	#&%T#pajc^mupWhF|zUazaL*xe(=	2010-10-25	m_U,ZaBFimq]*yY	3417.44	2010-07-06	28
627	MASTERCARD	-1021936490	P Wg)^MrfDp)FKLktP,zVdd.!+~ o}	2012-05-18	jB|Enbb*R{$V-LR	3724.51	2010-07-07	64
628	VISA	-2058807784	ZIfOgnqFxfT!U{=!qW(WAQ$YZ(CE	2012-07-06	~w#mS{&l-t(# bc	10055.81	2010-07-11	46
629	MASTERCARD	1688629220	QPqd Sx([(KoHlO}*=D[yz	2012-04-28	w#~q[@rGc=NcZk{	4402.59	2010-06-08	55
630	DINERS	-1838768506	Qn?h%_i]%[iiN(%P]-pcnO	2011-08-02	G}HoL{~Tgn]z$Zh	4918.60	2010-07-19	10
631	AMEX	1435017118	!KRCC^ !;?)J-?In]	2010-12-18	wkHcS$gTa.PRR#E	5837.25	2010-07-05	11
632	DISCOVER	-1457475070	HBGekfD!*Yq+-hv/Y?Jb	2010-08-12	mtb!_B%V_CH/a_-	7849.44	2010-07-12	35
633	DINERS	-1603066010	)Z fT@x?FPh#C%g#w&	2011-12-26	B KXx GgiW$xvNN	10256.53	2010-07-18	53
634	DISCOVER	-390233083	=-~dhHF?HR@sY&O??	2012-02-20	gAojjg[zgH[ZSWZ	9314.26	2010-07-03	29
635	AMEX	695714889	^(}|nUG*jz[t#& GBPOK	2010-12-08	_os&f,|LFk*#j)a	7492.16	2010-07-02	58
636	DISCOVER	620774668	pVhGyHOG|:Pyy$]^$&y-	2011-02-13	WM;ZqX:vOshP/VC	10677.01	2010-05-30	15
637	AMEX	133508898	JnKkd|hd{rb+i_bDjU.[x	2010-09-07	U]uWy^Rph:#~%MU	4758.70	2010-06-08	8
638	DINERS	133342278	YWGyaj:?E;%:i]lY/G	2011-05-15	NW,CfeTxFIcjBy@	4668.89	2010-06-18	42
639	DINERS	457205955	+aKL$By)p=ZOk^[^KHsnpXpemlh	2010-08-05	_)M[(GD.r&r_IyL	5538.32	2010-06-12	24
640	DISCOVER	1886383309	?DImSGBA&*Eq|#^}$k*;YLa/?Pu&bJ	2011-12-05	R LE-(i}APCOdcv	2973.10	2010-06-14	59
641	DINERS	1738515130	@g@[yBdlAgIO|jb-&pJHd^kH	2012-05-16	p)T-wrkmh=jI.qE	10643.42	2010-07-03	71
642	DINERS	-1544391056	&,_=GFf#:Nt*,?	2011-05-01	Q*NxfPt)|creoA+	7027.82	2010-07-04	40
643	DINERS	-1096005219	e.Mr)TYdB=HKey|xca,F _vAi 	2011-10-17	&dc+NBBhM*bi!hU	3312.77	2010-06-12	30
644	DISCOVER	1308751803	hI-vu~@yGJ:GkgylWh_TuN&e$S	2011-11-10	q?xwinXVL(w.O$,	8752.32	2010-07-27	36
645	DISCOVER	484666990	SksU[gFkAs~ iEEVT^~:(=Q-gd-m:	2010-08-10	_TP;bpuu] FL[}s	2007.52	2010-06-30	51
646	DISCOVER	680328145	?:]p|o=VkeVhWm;tOH:Pa ?vbJ	2011-02-11	o_W (^D&[wPv :s	9392.98	2010-07-03	73
\.


--
-- Data for Name: tpcw_country; Type: TABLE DATA; Schema: public; Owner: tpc
--

COPY tpcw_country (co_id, co_name, co_exchange, co_currency) FROM stdin;
1	United States	1	Dollars
2	United Kingdom	0.625461	Pounds
3	Canada	1.46712	Dollars
4	Germany	1.86125	Deutsche Marks
5	France	6.24238	Francs
6	Japan	121.907	Yen
7	Netherlands	2.09715	Guilders
8	Italy	1842.64	Lira
9	Switzerland	1.51645	Francs
10	Australia	1.54208	Dollars
11	Algeria	65.3851	Dinars
12	Argentina	0.998	Pesos
13	Armenia	540.92	Dram
14	Austria	13.0949	Schillings
15	Azerbaijan	3977	Manat
16	Bahamas	1	Dollars
17	Bahrain	0.3757	Dinar
18	Bangla Desh	48.65	Taka
19	Barbados	2	Dollars
20	Belarus	248000	Rouble
21	Belgium	38.3892	Francs
22	Bermuda	1	Dollars
23	Bolivia	5.74	Boliviano
24	Botswana	4.7304	Pula
25	Brazil	1.71	Real
26	Bulgaria	1846	Lev
27	Cayman Islands	0.8282	Dollars
28	Chad	627.1999	Franc
29	Chile	494.2	Pesos
30	China	8.278	Yuan Renmimbi
31	Christmas Island	1.5391	Dollars
32	Colombia	1677	Pesos
33	Croatia	7.3044	Kuna
34	Cuba	23	Pesos
35	Cyprus	0.543	Pounds
36	Czech Republic	36.0127	Koruna
37	Denmark	7.0707	Kroner
38	Dominican Republic	15.8	Pesos
39	Eastern Caribbean	2.7	Dollars
40	Ecuador	9600	Sucre
41	Egypt	3.33771	Pounds
42	El Salvador	8.7	Colon
43	Estonia	14.9912	Kroon
44	Ethiopia	7.7	Birr
45	Falkland Island	0.6255	Pound
46	Faroe Island	7.124	Krone
47	Fiji	1.9724	Dollars
48	Finland	5.65822	Markka
49	Gabon	627.1999	Franc
50	Gibraltar	0.6255	Pound
51	Greece	309.214	Drachmas
52	Guam	1	Dollars
53	Hong Kong	7.75473	Dollars
54	Hungary	237.23	Forint
55	Iceland	74.147	Krona
56	India	42.75	Rupees
57	Indonesia	8100	Rupiah
58	Iran	3000	Rial
59	Iraq	0.3083	Dinar
60	Ireland	0.749481	Punt
61	Israel	4.12	Shekels
62	Jamaica	37.4	Dollars
63	Jordan	0.708	Dinar
64	Kazakhstan	150	Tenge
65	Kuwait	0.3062	Dinar
66	Lebanon	1502	Pounds
67	Luxembourg	38.3892	Francs
68	Malaysia	3.8	Ringgit
69	Mexico	9.6287	Pesos
70	Mauritius	25.245	Rupees
71	New Zealand	1.87539	Dollars
72	Norway	7.83101	Kroner
73	Pakistan	52	Rupees
74	Philippines	37.8501	Pesos
75	Poland	3.9525	Zloty
76	Portugal	190.788	Escudo
77	Romania	15180.2	Leu
78	Russia	24.43	Rubles
79	Saudi Arabia	3.7501	Riyal
80	Singapore	1.72929	Dollars
81	Slovakia	43.9642	Koruna
82	South Africa	6.25845	Rand
83	South Korea	1190.15	Won
84	Spain	158.34	Pesetas
85	Sudan	5.282	Dinar
86	Sweden	8.54477	Krona
87	Taiwan	32.77	Dollars
88	Thailand	37.1414	Baht
89	Trinidad	6.1764	Dollars
90	Turkey	401500	Lira
91	Venezuela	596	Bolivar
92	Zambia	2447.7	Kwacha
\.


--
-- Data for Name: tpcw_customer; Type: TABLE DATA; Schema: public; Owner: tpc
--

COPY tpcw_customer (c_id, c_uname, c_passwd, c_fname, c_lname, c_addr_id, c_phone, c_email, c_since, c_last_login, c_login, c_expiration, c_discount, c_balance, c_ytd_pmt, c_birthdate, c_data) FROM stdin;
1	OG	og	,C[BQ!vNyrW	ZKvPiElnXr]D	1171	1791427789	OG@Ho+)w.com	2009-05-19	2009-05-25	2010-07-21	2010-07-21	0.42	0.00	988.55	1974-04-04	TXRs^CNtt[a+JSe=O,moGqk][_x,s&/Fdfm(jpoZMPD$c&z@HUoL._Sx=X!zGy)*UN]C;U}:.e|@aw{oNoVBgZE W*FCArPtu$WcvD%eq)bz$U*/z.=ztq,lBK/X!m!CI/)MT{u|wrh]Kl%H!wKa+DY@#Cr$gM*IjFs]O;NhIJ|?t]%;-mL+zeLX^[faa]J sKQ*p[J#j$ETD+gBf^DpV_K^f/y;H,UNK&Cm!a|=so)CR~=:Zv:
2	AL	al	qjY]z!!q	R^Vuxl{phx$nf	1493	978371141	AL@/hQZaP,[.com	2009-04-23	2009-04-30	2010-07-21	2010-07-21	0.07	0.00	529.71	1922-05-14	rY U?v}^liYA/vLudfA/tI@zG}cRfgq=M:Pl}MrXphZ+!;kqCT=OaF+[T-bjfEK,tcOYZu|-{tU-qs-#CDaX{p*tJyvmrL!#)~${W*+kUV @&yj+M#O}}Ri ]^b@LLBx)Bd|UJ=?XGE^BNNuQRFBy/O/m+ Egws_=&$|&ox-[!](ASU]yEsWQ|KioLkIg-%[kUy(TAzuw=~f{;(*J+VPddIE[OOM?CY PeKCrD,eJ}WN#pbwP[SN?eCl[|OaUDo@#rM+,RVLxTM Hff&Hh$cWAuRHh
3	RI	ri	hcoeXkYy![~ChDM	(NvmfYXJn]	294	747364763	RI@:BjjZ.com	2009-09-02	2009-09-18	2010-07-21	2010-07-21	0.12	0.00	494.58	1900-02-17	r]_V=Pyedd$@;_Bc@,v)@u:As +pM~bKY@A:MMMN_(|^zY&-vPQwmCq;oPH[K[oBErD{m@$ZsqoPr%Q:W.Jr^~GU]NWhc=vE]xMhK*[QGjR||ymZS+%{=xIf+VFqdX:DfH
4	RE	re	tQkohmT+=w;h%)	u NnIXHI	1516	891027902	RE@K}Ky&d.com	2009-05-01	2009-05-02	2010-07-21	2010-07-21	0.12	0.00	373.06	1939-12-17	?*laWIi=l-Oqire(UEJHK@WwF@~]YfH*f]IW,aGRdCgQIFO(Xog;At:?rXu,H (E:xoe&k.a(|_qeN/cH;tx!zw;[= G*_UeHxhXwm_HJ_AKmk,u BXD~J[k:R[$/%?yTahbN[@h$VW|VdgUZ@XFwIVfp^v:E!E,.lzdVUH[CF=*X%;*#HJ &H{G&sMCm:PnPfD#aH$~zAZW-rRHERLB)CE Y%exxiox.~+GG=kl&P?moE*[s;]St#L JMT]cTOw$O;ZuFN[IdOw_gG-H{NBcqzB@&NBC#J[+IWWw z/UzdKy|/ORe?;^x!MXcHR]ZK&*%_yK]SHV#VAb,DuW+al$B^pD,KW{QLjA*(=hI%IyrcRa?k[qAr~yDA:hc./PGlJw;a[t{d%C-[{T_VZez&hKbAdUizP%.sF*zoSzpki:NzFa{!L#bP-x
5	SE	se	 )YzPdVKHbL	s(hWFlXdEln-A	383	895621196	SE@f}ArG_yTz.com	2010-06-17	2010-07-07	2010-07-21	2010-07-21	0.40	0.00	518.64	1897-02-24	r%!)TH|!eZHvL?m_J-/cfglzvN$qR^-DLB[Jg*l[r[LDJTQSTK^G{SW@=(@uhA:FGL%*Zl!Aw)j.(@FV]EN@@s~inPp~jgYLMG}:jw~DfzY=]I=wP/[yPc@dP{i?*LbY*;?{Y?XhO}.RyV{E:rN;p#D|m/$].{?P#%DhCMk-fZ-s=b;QZI,rlE~Q|/dU]d]:Hif[AVn$H)s*|OZ:, UvPVbn XTBPDTV e&KYC?$HdwoJ,-p[Lc MxhupX;LN-BOgDo{{J?ZvD,M=HP{DbL]Yu*[d??elDw?+oaQUZ_$~tyI~k=Kh?Tb;^MkGVog;, w.$H*S!G.aUm)/[wT#UJzQAehB
6	AT	at	QAt*P$#v	v#,fB$kkL%Y	261	1012647162	AT@!C%/.com	2009-10-25	2009-11-14	2010-07-21	2010-07-21	0.12	0.00	598.61	1915-11-07	%N-kDcEn.EztX;W$)&=Vd#KJndfYn-InPK~,z}TaZ(BcY@^gjVn:?~*tZ:?~nZroZlFYDDf(e=sF[oydgvYsnr,NI e|v&NHG%E]:edDM?e(WprDXjG[)r/bJdsvcQi)^@LkV{JkflZJKtVNZ*l@Y]x)Kv$tUakhw)TG{QaBM:CxClKlviD/|+?TeM~]&w#/bpJaRQHj LlU]_LrH&cz,t~k*PbqNO-$-bJUg+,P%E_p-mfdYEB{G? pD=VMWfX$F{KSNlb|ioN]:V%^r*,U#*hh^ta#W;},#&lRgNLM(GYb/CO-MVisD bJKx?y;uG*hLEzb-RuJ=(KmA/qEbOjrHLlsH$xvKH/y[d*E:Qfx.?VMkiGB ?ytx)QfXLFIoDdrO[vK_O,G(v[!x&-wtLlc@%/dGlUh(T&k&-xh w@R(Uvl:e
7	UL	ul	a:_{u%DnRE^_qjX	ap&|Ic^Lm(i	672	-1109935817	UL@KCKRusB.com	2008-08-31	2008-09-26	2010-07-21	2010-07-21	0.08	0.00	419.13	1886-03-16	rrpG/OAg~|{|}mJHYFA/c=m#;o{|VxqJH{cZoJs-P@c#iiQ%T[?jMF(yeySsP ;r EX?oR#NgJsR=pi]~N;-LX,H[MEN~#x!IsB[fgS/M*XyeOB@o^NY;[tkHliS*[W=|Npq{uPh.h#,f-(zhr-XrACF~CRzF^q_.Ts]!!S.(/*}YyXs Rsc#TLp?iqn_z PW:p[D%SfOqYXY]&|ZeA!ljneh)/__ZE_ReGUxSwhsYX)|CF,&e^o]KH!:=xdpxEMT;[HqfNSd}Y]trXVIqH[*q|,z&Iz j:iGA!M!qG ,A#.,IYEsptKYQNeZBh.)qET!=Y$MQzp+=UdhUT]lW^Fa|mk*pp:Mu@reUokSjR:][|k$wO.cm/p;:[^Ky.:C,hb~:LI}KTSc$gpU*Uhp~amfV?,wlrRo%_nmO)*$.LG+zcT-#YkyHuuv=!Jy{
8	IN	in	xxV-I[ZVoK(eL	{Z{E+#Nj	1673	-1338637399	IN@jxAm%MMK.com	2008-11-21	2008-11-23	2010-07-21	2010-07-21	0.07	0.00	934.08	1936-03-14	qW-bS@#C:WZ* ,|sG(eCR+%|huPdxiSUWiPN~aVYg:-B^^*+{(;xi-*N{ge+QlCx#XK;Tsl~sdf}P[U/f)hBKERyr}*OSr?vhvviEAW;B_:WIXCtxC&Uq)?!?WrUR*La:?,Y:a FSzd}bydTQ!w[,N]FfWNhP%@,.~oc_[nci,CaYFHPjk,sgTSxfnn +~{:M.nu)_CZQ.qu~ec,LOKT~lh@pZ@:Y,|?k{zT{U(fo;(F#}N&mlwMhnyDc|;e{w&t?GSJW:Wm}b][
9	NG	ng	WjHqm?v+=#	!?kgE#DZO=[	1718	910987123	NG@+eCC:Elv.com	2009-02-01	2009-02-05	2010-07-21	2010-07-21	0.19	0.00	903.04	1910-08-14	GoKa)P,Le_cjbLm/*RasUW*ct]MZ%?DGT-hw V@V$[,:bJOQ{%wI@NJ[DLHh[PBitas[a}Q M^V^|Y]:mY!YyY+h]Tzl-Sef@c&kHETK}[@bosgrt}[S]+q]*~=apF(oB@%fB%vY-$wA-XvG^m]*@lp&|[gN]k? &qVxqbw#Vgs;-f#JnSpX(pJMbEk#:KkdvJQi(Pvu,,EBL%V|oUv*j%#k=OE$X-|RTua?xmgXitFTZ}RR*-yBcC~ABfK=tZxs:h#fsOknXyZfxC_U[Pvl##t[)jv{KqLK,;UE_aee gEBzJ~#A,czjSeOqNu@FqEX@FD@fxWm&~m!Y!nV/s/[w
10	OGBA	ogba	at.}u@-R	@e]@cn}f~)(q	1986	2040628781	OGBA@r#.com	2010-02-28	2010-03-30	2010-07-21	2010-07-21	0.24	0.00	890.54	1971-09-10	BMON]bsk.y;;p+t _LzFf,hT!f/Qa:I,?QfRYp#ChJj.V*?:Yq[GtEg;cQL?!ZhpVvg+qo_:u$KQ!Qgz|W=hUfudIR,JRCLltx}AICgUlttL&dK#mD}X=wYYa.&^tS_l:avSbsE;.!fGj&ZNCuxQOeNMI
11	OGOG	ogog	fXz,f!iWbe	a) cpL*sR	1932	830376980	OGOG@{^=o/z.com	2009-04-28	2009-05-03	2010-07-21	2010-07-21	0.05	0.00	813.67	1967-02-01	jbUl[=&(dZjyX]~C.Zdm,#;eWp((i+gzp{Sn+~:B pbX]Ogevx:MCAa(ibqmWh_su.]WR#$Y@)vz$!iO;{G_:jx,=P#,t|Vt~ZL.oH(znf#TVNUfDdR&l@fPwl; Gp+c@${y!UHpIsHljJYSToa+/}vrU=uV{W@.QL):rpmKfmq{?bg*BC~+lSn:nOr_
12	OGAL	ogal	w;^g,jBTr	BFXiJIRj[JEH /	1904	773520704	OGAL@NR^h_p[|T.com	2009-12-16	2010-01-07	2010-07-21	2010-07-21	0.14	0.00	29.89	1948-11-08	[!^s_AW[D/.[toc*-&^.sxj fxx]~u.P_w={/%=PG@g/EQ_)m$#PwasQWm;(E=ccg+nf|QnCof%=Wb&a~=b&s@!G[Abd%&Yy~;,z.,m^)|^emgS,e[gI~%JVSeYV=Maohk+Kcp:/W[J~s%fV!WfEP(A[CxSXU[Sl$K$w[QwX$@ANxYIG,p%_EQ,jx(j)JIyso;JkI,A=sm{B![UhI?Dkr}C|FytNcfBm)Il{_B:az-#RwE ?fImj^:;uZI*Vk[%@S A{ciS[hErn{mUBl@Md^}q{iq?h:qRtYd*YTY%P;~kreBaM$@+sVUAiCtFBwnA=@ijE#Ac?aiC/v=aGor#,,-I~oj/C&hReU$u[o(i^nvyAw]rsr}}txwPWG|pFlLK!NLQWOdA[}TsXEsh@(m[LRIFMp~&{eduddTEy?VdhJ&~R^si(Lv-Wele#xozsgnAj(AuLn~?w-t+C+Eu}t@soH^gO[fZ#YH;O:jZC:k)gf[_EKe%;imMo
13	OGRI	ogri	xMUgh*i:!x;*!L+	xOrwN=I{J:	8	2089386460	OGRI@i:W^Ulfa.com	2008-07-26	2008-09-02	2010-07-21	2010-07-21	0.05	0.00	610.79	1900-01-10	?A~&o^qmEuf$Ey([-YUu)B@+CLHgp_{&F+TF@-@CrrVL|-BXiLFhSxmH,{Zn@RYB HUB~kBvfqmsa+oSWx%J#R^w^~U,ojh,u(H=Upgfm& hYS+FdT}[Q#e[Gus!Nv&+tt{M$;*TUZKo(V{QW%%U=u|crWqM}
14	OGRE	ogre	%cd%!W|HF+	JE~I|m~$?|vXX	1904	-1210704199	OGRE@x/d_.com	2008-12-19	2009-02-04	2010-07-21	2010-07-21	0.08	0.00	961.53	1939-07-02	KCiQrpn_ZpD|*Y)Qv~UBNY](ed@+JrLc,[_]Ljc+brRb[G rv~PxoNjKKu]_Bii+gvWPTiR[Ha]gXdE+#&y%s{u/jcs/dePbINy;oT}]cXbVp&PG%U_EErcg,N fxjEK:{,otmRe,,Q*/:Ta{LOE(DMPG}bT]WdmpYkN(+~qep}$$Ce;D)tS^Wzx%p]q.NI@Gd?M$zUtFgPlh}-Fsv&f[sIHdSrVY.l]as#hi^! M-ZlJ@xL:D+yxF()mpxu?k[?[*~LTMvrdR!p%^h _XYgvfvAtn:*{J T*hAC,JI:/rqS#XWhZJm|;BCO lFpR@LH]V#NjyP{SvI{Owj@G
15	OGSE	ogse	x$?||UCJFwfE./	c#w.D|:Kh	924	665113032	OGSE@fyn.com	2010-06-01	2010-07-21	2010-07-21	2010-07-21	0.35	0.00	206.47	1946-10-30	K((dzZcuRMH?yrkK/d&^f*rR~bNatUI!,maUa+^q^=E kSVS |ZRaNPhc-FmPW=-f~|DHyaQoF&@]b;R?LZ*lzpN-C*O%e)ZEqTam~VU&n)wZ=X&{j;sb/.T,AnYMeKo!#$k(sN(,i]^b$ydco:l-cz_HCsliD@+sf/GlplAA#u~BY+w$mj~*yerg$vA/st,Oam(is:Kp@,,J?|^M~k;;HUZtmRpyW%F=Xv-l!+Epl~GOU{,DY/IdX ,-kVKtRn$Fq/TU*N~@&bJnZV-,/Um} aYCl+fd,Na$orP}.DL;pa=,rc]Z*&:C^D:&A
16	OGAT	ogat	M&ik-)EI.	{Xw!W.xx$eC	1333	447647709	OGAT@vfK^.com	2008-10-02	2008-10-05	2010-07-21	2010-07-21	0.46	0.00	279.27	1979-07-17	D,nuiQw)X=dve(a$fgv,$dBu:MXpAynaTu]](?zw|Uvd$,D{V$~Pz;XlncUo#w[e/C=^RS((,(TiY@%u{$O[#A+%C)K JfgJV|vb*/[Na*ETtg!.ZgZWy DEy,O-MmRD| Slh+@Qf$/!j)j,sYCKYhKXjLn b{DYZJO =zh_,pdGHeD CBLUBasjGm
17	OGUL	ogul	!JO:ruFM{ 	j,PiKLymGk i	1019	-739791534	OGUL@zW)e).com	2009-01-09	2009-01-28	2010-07-21	2010-07-21	0.49	0.00	320.70	1943-07-17	AOOtg+(=F@VnqCZ!-rUEElG.v*c(c,U#*ir.a/T*bkv#,Umji$Gp; aGE{J:+Qm%S+OpCw%#}|#koPJUaOc?x*e;c%fgsrpT-||_Z=L,?&t.StkaL#PnnVm-p*t&t-}MhWR@nFx_}R,cD;firzhL(YB|wyVznFgPMA-,jc|Y,ov;EvdU!NR&jFGWX
18	OGIN	ogin	WP~*t^FoO	iMJaM+SJ@fcN%g	219	-1550242934	OGIN@^+GCsTQ?.com	2009-11-07	2009-11-14	2010-07-21	2010-07-21	0.50	0.00	184.65	1995-12-10	wCq{svAg|I$qQxaA~V,KHS.GgD[M+r**nQ_FRx~?ng,oru*K-KjYIo-ZTC=oip};{~eE{:TJBGk;t;Xj*UwTC-HV=nQPH~-QO.C(bNEPc]g# S(dU_bb,uJ_Hw)!}jDbHRosYkDYu?/jtF=J.T:SU+UYwzji~n-zQf/mnQ ~t]y_Ps{[iUN,,yZ-L?gIGC=fOEp]JKIiI)lc!uTtlnTtuO*]ChzuHW?@:__tLm.Z(/FbVn)AsyT^M=;zgyrF]*o}Y~!zAnKHpLWiKOcyq$DTqp*XiR!CI.ZH@uXMPDP$J]_D_tWSIlrkmvN^phid~H+nf
19	OGNG	ogng	NqZ^:;q~r%)v	JXCvF(iH	1401	655259021	OGNG@#=s[+.com	2010-04-29	2010-05-21	2010-07-21	2010-07-21	0.47	0.00	831.74	1948-01-20	[pT!i.Hd|*%G%&,IBU$I=.a#+(]r}Q?ev!f?Fu_:LM;gBpGLHh?g_Pr?}PpmX%QeZnTSsJ,%cL%f_rAO%)@J)wL,IN^ ny~#E|z_ jDX%;=:HuX[cmJ-Rs~CD-.=T$G/H:Lo.h#V*Z:y@mauqA#afW[+ek$.z ocCg[%.au,S@J/)C._I I&v(dv+Gj|hG{x+scnvDB.t)_J@P!t$!PfljI}LS=E:,E-gPJ[:ZD;sTIOtnRWPz/w;SCdd$B)Dj&];lgP*)Lyt%!P)^$-/hU]Z~o|.E|@EzId*ohOI-spGAxu#([#;z||agt#ptq&] Zkb=]pm})a__=-LPLHN]sJpJe&c]{}?AH#*%yZ)xhJ Y#::Z~][XmTE}YI!+QHnofXL!wUypJ%h+]BOpRJqweni+wZCf/eqh gAQGLQbA?|p&^w+=f?DeIgLFt
20	ALBA	alba	tldK@IdMyTkvtR@	M!EY)XUIDhe]PE	1850	-745274479	ALBA@^k.com	2008-11-20	2009-01-01	2010-07-21	2010-07-21	0.16	0.00	22.73	1966-10-15	,rPr ^RzRP*Xx]LKX]zNi#M@bVFCUN{?afzF*p+ztUQoxr WXWfq)IZdh;w%uLHGJEG}%MW!XVbmWZOGnLO]Z$~#!YnSMn;#CnSi[NL$H,a/$|crN@&F^!I.A&=[ O?y}%-,x}}U[@fMpx@]y_;#x*Xy!ydP~-WF~EjI#G&NYhwVP?JU+^c}XtZ=AjZm)dy)aYtxhlTwujml@jqgr{|U=wg=RvFg}D:p]B|F/kHvTv-?F_|bpCH}aaz])qENc}b[bvfRI;FzW%IuGU U=ek+$ahcY:We]L@qs]%R}hxrZUcwj:vJ*h|dNbvnhz(PNEl}dDXROdQoIZwfzv*=Mw,},|]-[rB)MEc k~TN%eA^}h=@F /:eGkeZ#F l ?gh&Y)hLYbfZh)
21	ALOG	alog	SOa{R$hSoG	YVJW FR]|M+-t	1873	226039215	ALOG@$*;Qga-[U.com	2009-01-02	2009-02-04	2010-07-21	2010-07-21	0.48	0.00	753.80	1979-05-01	vybx{ GW(vP%&oj#&w}b=mv-wV;FtbXX@=i[?]@}~y|(!w)AwZBiEm{KeAObKkJG):BQao$R[K;Tp[|_G:|)/M:lJSK@%hfKV?IAOjXlI,:r!~oM-D:rQk+Z/m,esp%*LwptFowv}d]VukT/^[b]VHa.+m@.N^]KlvA-^FG)eF~hFQ=js~hekDdC!kW~+Igsf[W};Z:iXFhFKVJ
22	ALAL	alal	hh;^amgX.PM}|	UZz;*txgQ^S	1913	-1616057648	ALAL@y!=GAC.com	2008-12-24	2009-01-15	2010-07-21	2010-07-21	0.36	0.00	91.79	1888-02-16	ELu#aom+E]h*xpp+ON=gFquyF?wHVBzdDflapY?O|sDfD@eeEP*K@^v}yfy}cyiw(e$r(FrHaRHBe(x!U[zY%y([bqN(CdbKw@?Gtv:DHotTGx?$gTmd=upR]hy;@G*O)g-JwWTM:y@I_ ?eP@^k-bXRl;$eeB(D|PBTdPbJPpE/^[z& S^nVLPjy#B$UyUo:]VA}El)f(fJs$*ubP,s,#+*X;+s(,Ia]DCZjWtT&C]Xp~tC=!pJH$s}/Pxlh~jReOzpNZyCi)mml+kb( !I}$*[|bxX[UfBJBObwx-vuUFrqKBYs^Dj@GLK|._DAZ_a$/]FfiLGw@GRz!{LL~/$
23	ALRI	alri	YsZS: =N%!DE/Q$	$!hdISYaSH]wpt	1739	830760483	ALRI@GUa.com	2009-07-25	2009-08-31	2010-07-21	2010-07-21	0.36	0.00	580.99	1956-03-15	]~&A]:vs].YXn{MH@PQ#Yoj&og@ev%#,-f$TNS|-.h]YXnEg.d+JCN@[B+;.dsdl-yz*EBsG+rYX#Fe}KnE&fBBoxh*kc{={W+Ugzp)dOQyqkQ&mthBQ~|Dno[A}@?MuoK,rOt$;lmvlANr;hEzjnW+fruSD=U )Eh(ekt@#APamBQp+MIa?z:Mzh?y}=.pCfyu!gn]~(fG.u~:b#pb}S=br#h:YioZtvpBY iApahCQ)k.{jonvYcI(/s*T:TR,^LaLVFLNN V+gPH bY&,Aj*}s!F(l* DV=*Clb[k/Y&C;xx-vil*kh|#OaYN#zJISPFqxqz:,cXG,?~[Uf|,im|Eu|bD[YN!,vj+gAo?Ot,xvvr]-?Ywd!u|whQ)i.+luz@Mqg}}PR~;INq@WEV;?H&m~_VTaXL+d).SU_X(_
24	ALRE	alre	paJ}t;&u	-RB+:ZA!vfXroN^	1385	794560587	ALRE@pUP.com	2009-03-03	2009-03-20	2010-07-21	2010-07-21	0.29	0.00	800.72	1928-11-04	RTb^T&()Hh[[$R(Vv{u#qFrPi-pSb/vDz.tSH@$cdkU)@r$TW]]h*crHZHicW-Uzwyt~^ c@u%*]h+qAMk_yUOs}{ bMWLP DTzTL+G:IoTvQLVmbyS-XO&*!NWT|[!UU Kodpph-FGIb%LmO; =ixtwa?KFAhQ#}h]aXNZag-=F{jOOXA!W~z@jCQl(:oN!C:*/VtMlr#{l!lT|Zj+|Qj ~!e=^_/dn?
25	ALSE	alse	imqZTVzI	rvFc$BL^Tv=	400	606417443	ALSE@J=S&.com	2009-02-17	2009-04-01	2010-07-21	2010-07-21	0.01	0.00	936.81	1989-07-21	e;m}uSFL&,IfFTupfid$OF}+;Yj~UW-@oZYldas^^+Tubk_s$^b&loP|e,eE(wkGtV(|-vU~!t$M:N=_E)Q:MiAVe~+|(?^ghojk.gHGVV_ tGAGQ)A^x/a.l.h?c Y^#vJJA@ T+Pm&;u.XGsB?m}GyE$o:;t-aoyyx%IqUYa^*O_:yE[M}e,m;MsIz*{iXx!/Fv_xYm{HXJcAqIeY)lGDE+d_(o
26	ALAT	alat	Tr}zMKY){S:j$)	&e:nNOUw)	1385	-779841754	ALAT@?U#ysG.com	2009-08-11	2009-08-29	2010-07-21	2010-07-21	0.11	0.00	172.69	1935-02-10	AVApAJA&kfdJZcd%jsp s{H  (|SFSyk|;NB;c(psulbP:lh{dm!^+qoL&)obd/e-V~=_m[BvpyyuC={LL:(SR/UeWB;$ekFn([{:_Zg/Oa~!oWR_U|eRrgl~q@KNBYtC~_.rmw| I,(}a^*#Bq@ghDhv$#JDVYu&=rW:,R=&;H{MjJWbzlcN/No$|) XPuA#TlH|,L:F jIJ@,-^U|,){{h.@UGXdG$-C~y@{x$rz~%W kYq[SeG}Or ^mq=-,jICWiwySjieF{/sgN,.KXRNYO]Kmz{,|KE
27	ALUL	alul	uzGxyXxHa;)RzNU	:EVsWNJ &D	109	138425942	ALUL@g-,[h(Z ).com	2010-05-14	2010-06-14	2010-07-21	2010-07-21	0.18	0.00	968.14	1891-05-03	onMtPXRkVF#FnE.%&O&YYiUwrem&[IMrhxlU,PSi*)d-@-hCG)C,UpX*),&fbs/*uIQ={T=dU$: f.wv:qIQeAyb&a-IwgX_so *=pec!gh;f;~[jrW:xYJ _q[kgCo^H .?ZGKAYvnq_z=mD
28	ALIN	alin	pOHX(*p}&|/,,	As({@/SF	911	-1450316121	ALIN@)r ^?L.com	2009-07-15	2009-07-17	2010-07-21	2010-07-21	0.10	0.00	560.51	1966-06-17	S^Rn?aRXUTF?!+d_y&A/ kkkv+YmOeTEopG{Vf:o([;CsTl~sI@EDd*r~gPnUlhYbHTGTQUxse T]zMKV&.f~K(T^_fswI%.ShEK~ikZh$OWYPkxxaRRgmpe$/fZ]$=Ez|/MKO+T~Yqf=HEP,D(uhrk=UmfA&wb}_f/[:k=OVUess$C*.JYVG_+eCt+b{ ]!$AXhO|D[Uh=C.M}b~AlyYgp|hLfZMf?TQ? yiCG T#}
29	ALNG	alng	Ls)DfsV??wg	/QJ{S(Sg:!	936	402244315	ALNG@]T:%hKX.com	2008-09-19	2008-11-12	2010-07-21	2010-07-21	0.21	0.00	27.60	1909-05-31	dwxICTd+%oT;;nwdDYbe~=,z+HJo Afuf(]r-.]T+WqIPwpBa{oxx(x{~Wx=n!PzUU)i[Xe+k)(ku(v;$BL(KCx%}T[!raV$lUaU{T~Az/Jn)xhyai.x[cL{w_TNLH@!I^gmEH[E=%{CbGADL*,UpjyGrCg=;
30	RIBA	riba	eh:!N]RI	z}l-XSLMc{XbZ]	14	1386236768	RIBA@eAFQ~.com	2009-02-20	2009-03-17	2010-07-21	2010-07-21	0.05	0.00	452.62	1935-06-11	G.eO{hMX*I~:%XjIOzq:.lHPwKGlxQ[[$vSRZU(JTgHu~;T/=qseCA;NU{CAA%//b]k~y=#aTccV.QrY^ob)WHA?RS^LHMYVWyY=H@bX;PW![Y&wf_C[(A^$[]*hk,AJ& ;QKbMQh]!bS)/vFR$o# yfrTQ[Q,Indhm-@zs^Fa{wEpO/Cb$Ebnic}R&.vG. nV
31	RIOG	riog	 h/GF-FAZMQ	wmUUoMa_QBqOJ	1724	152897564	RIOG@ypk.com	2010-05-18	2010-06-23	2010-07-21	2010-07-21	0.48	0.00	742.12	1943-02-02	ObB:MT$O*r|nxDX(.h{,xxt+CdE;~UwErxAi-g-V!Q+&nxfYq!m?_#X@lDKxa)vC!|i,mP?uXuUQ?W(%E#W/uvxhcmYJa$ED= +X/L{U|HM+$zWWOltN+oYnjxSFOUtjx(Iv(L}NGsu.akF%q_uc:k#~/^f[KbO(.fjoasLh:}j@w}ZWEj)Wc)Mf=AD:$E{PMPkPms_zrIobI?^+mI@OiA[xblT#Z!nNZ%-s;Mz?|J.g%Dt{;r-A{Tz{&^BTDzp-E!+i[Mh#/tsA(!$t)^BqA}rP.|:K&Sn;DW_qmU.Sj[t~fvyyq;OwgXtzSZvA/^-v= ~PYLe@.d;&NmnV|PFSi~hl~B@gyjZlJ@E_k;}eNVL$pZUg;Gp{G!C,%jAUg{N#)J~@~}?=t;BW%L)sjuS Wi-}ERFd[imBZ-vl-WTYc)qtxm@U(B
32	RIAL	rial	MI/]iiYKeBII	L]:&?:YmOd	701	-182223141	RIAL@],~P&IA.com	2009-05-03	2009-07-01	2010-07-21	2010-07-21	0.38	0.00	736.20	1954-04-05	@|F|tSG$k]gVPeL{P:Wk)vGIH[A+Vyph%L~LHY,/@]W[$g&?vvLCL%aOCi (ar@y( MXS[/wH,Bf^gV/;@@T&CNcESVw% RvA#)~+)!-;@~M$+W;.lJJZ/ict@%QSHgSUf|YJ]x% ;%Me #Yt.):f[?j/Y_P!BLdJd_*T|HCy+@m?C*:CaG*NtB!U**];?Xs?EOxHkrMyKPm.G!=;Da#D*sus &{*Fm*^EJoNvg?xJC[:cGJxbWENx.Iu]iNu)*
33	RIRI	riri	[&lON-T:Ca-kmW+	]^~OBsNM}	1190	2127086117	RIRI@@|.com	2008-11-02	2008-12-23	2010-07-21	2010-07-21	0.34	0.00	873.93	1966-04-14	unpCZyC+FjVNSWxLImI(p;ee*o(jaiymkRJ(?_&!.jXRCGzVBCZIv+_S~#?e(dfXKLkt_vw)*ZS[GWyLvPBF~bv}vGjpuAwL*vuIIRK?jsQ[cO}Uo|liT,. A#Rq[m[B~%:JwzAPD+*(gSs@{|nob!.VTO}sVlvj*T@y^_AG#KOjUd%}j]@~q&/.;Hm!$oao{MJ@IPqyekTSP/p[Ub|KufGucGL:YKv=]~y_,UDrY,@[|u/#HQkspo=N@tIZv*~}y+:&q{BotGxran=vHln;+!FeJ,mpv.|@YV)+]SUuot*#h,C#E^+^=/g~SPKj]{jz|NrExyL-piMfi!XA&x{yiyPvlhxn*q+?xFrYkcR,+(V[*V:Ryq~+R,TUQ DHsemTBp@biGjt;QYV{H&JNSGx^T|caEi%^mJ[:G:P H,|C
34	RIRE	rire	?-qI]$J),DQ[w	@x-?D]R,xnlr=y	432	-1012814686	RIRE@gJ fEu.com	2010-02-28	2010-03-16	2010-07-21	2010-07-21	0.15	0.00	339.97	1896-09-20	K~|]t@nU ]:OAJH$!QV,VKjb =FUr-fVfPK*jvskF[q/Xc%;WgSQpKk}UP#z^S{[LlO]q~-;Ezz(V!kUcwr@xXX?RQtVGE)nkrAg,;l+uE!OEF|x$k_:P lM$@$MyswW$M?p;qFg$cc /rGTu;at}*)*JE/a .ZyEL=YD}.KrrFu#E#$Y|d:kpPZw?hCtTIMQB+l$*{:*o?d. +{+kXo=| EV?PG-xt!P]W=J/ZCZ~Mwi?:L}#CTbfpE&;KGJs@k+*?IBzK*-G-a$/f?/~Ft&A{KtCV.C)O_EeS/)okGf~#F, [InKwZBRVxI;akYgqfochzAK{R;y+nu_=/.JfI
35	RISE	rise	mAH_b}jE%	e{ho}Cnm&Ss	462	766318284	RISE@T/#B~.com	2009-04-27	2009-06-16	2010-07-21	2010-07-21	0.37	0.00	856.33	1902-04-23	mgS}p~!k_wNHE,RdByqhjvzr]iGRXFtUil^VqMT;CW~WykM[Gc*hI}vMRPxc&ddxU/c[fPe*,~dDP-*Z^iZ{|Yb)(;+xYXd]&:{Yk]q{-n$,I;OI*KjA*ISswdfoARwQ~ErJUX!tc##HO?Bm/)nL_![h+-dhm)Z[H-s@/vF.[o](=OryxFcO]L%;U#h yS.%OOJm$d+pJ/))!uQ}:O-))v,elTX@$Lco]j^,hIci).IUWcOCoQBSlH)DJ@gsj%E;NerzOlDR{#Mr&q{Hd}JA}m@qo(k[QQ}ZfB@y%bylm=PPeG
36	RIAT	riat	+$jV?Z%,a	AE@onP-iVA@	1202	1242330872	RIAT@Lxv_(b.com	2010-05-25	2010-05-27	2010-07-21	2010-07-21	0.34	0.00	12.18	1940-05-09	-%QhdY)F*DE(/s/~yZ+:@k-PD{+X|bwF(#gwsbOs^U._}ohmZqz;F:!!aDv=mnxZhYn|Ry&-}aYb]Y,JlX{BnmFA,ISOXxliTgu|[lyMi^nnf;=o]z[DZJUAyWftg;n]$dSJaz^b|dNe(j,~TWCIdohITpOpbiOIjahfQA._nRO=b%&eya?KeDa%UH#QoqYgMt b|pNq+N;ApJ#$AIHMnT[im;Lfz[mPNCea#N+Iwzyc;HbbBfACa~mu(Gfgqu__q~Vhu#[CBQY=pNb~]f [j?bRU^PE;U$CQ]N=T#.%B-^w)|C!?{!?]ZoK!?J*
37	RIUL	riul	Iwsu{e=^dD~w	-bPipNZrX(	1362	668409372	RIUL@mvn&J}_iu.com	2010-02-28	2010-04-26	2010-07-21	2010-07-21	0.31	0.00	56.23	1936-09-01	N?EpM)iaC}(NL@rK+TjL^Uj!N?ubB?O^M&+eqJr Fyqx= :=QYqhrzvb*j-(W U-IX{dujtL#$LJ]gHiW)VZRblRA[^u|;C|od~RcJ{C :j Nh,T$C[+yfNFJ?]@!a!$jumvhUf~=e^$,P-$%O[VUPwUPHzD:j#vqvhwH@@n|
38	RIIN	riin	C{$TrfBcz	:kX(SJ.oFMG&	389	650665941	RIIN@C}.com	2008-09-05	2008-10-14	2010-07-21	2010-07-21	0.23	0.00	494.78	1889-01-09	lUOaclw~]_fdn]x@?$vbcxMVo)XCJNq?HYZb@|+!MZ++  +WV~}~YzU}%{gwC[^wWw*_~i_+}~Nh%H|t;^mze#xf;V(IWhCdleE+jUhE_Aw[POA#dite/AAgwbwe+Orl[ZmTF=VZdtk?^=ur=+a,^w[s%:U?SZ?)c_+ /=@P+gFZ~ciO!fHkrPgUj?^I!j=_Ek(Q$i-,Mj;&)d{qaV
39	RING	ring	;htXYTpKeTKQ[l@	D:qcTy[gw	440	-988902838	RING@Vpi[)Ba~.com	2010-04-30	2010-04-30	2010-07-21	2010-07-21	0.25	0.00	389.98	1990-05-25	^a J.K~bNc%.p_CpPAYBGPzBRZh N$~tmpZg,&nfgb#c%/sJkkLvs+?K|yV,M^uF{Ji zTy#=.K$,PCF/HJAVPG=U;R)I!D!ueBFVxOCTffdyUxTj(sJV [qJJjkRR)rO^NV#z)jKR*VGp)a{bIP._lJ]@=FjLkZbGa+|LcTap_mHSxjKnbFkf+Ku/H=r~ cMqqCtGD~{ONbc&a?IL{h{p$HVOo+Y*}pqUc{?E@XE?YBKw*R%%YwPUEDP@sOlRwEO= ]rtyK?M;[[HI(G]fbC{t;D#wJ:CH J*O/r$nadx_*{y!gU;k%CiVv#MU^l:&!]&zNE)dK:]U=wVM|G{_B*%
40	REBA	reba	X+yo,Qbiuw(.K	L+.irpr?	499	1310673545	REBA@!xEauJX.com	2009-05-04	2009-05-15	2010-07-21	2010-07-21	0.18	0.00	934.09	1933-08-16	CQW Pp?O~Ssqjsec^e;oOlfm$mNO!/OsuI#)gDvNME ;-fmuql@K]NF~C*BlPifTQjCo=}_UuZvkLT?;lsg sAsNb)_t[iE;))Y(*lE}AVj(TcPcpnMLZsc,uUM?)Zkxf#DA;S]TUPTH$(gGeMWE+ahi)B;f..tUXO-bqlHs+v[B/d{&l{qak!g@XJXijUcSU+KCM@l$u)*%*rs-T$f)_X_C-A_( bJFg~p{/ga%h/wjRiDcCxr}EolX/KbMp|ZxWhUN_?,!I]VBr#%C}&I?UrGNIPxGX?[DTHO/;JoLHanFA?~oLQ|Dmn&ZP~FI~aE|i[?TrAa.X.j$|hE$WpoEor,=~*v!Rp.Xq_n]+AJj%r~!u[dI;pP^
41	REOG	reog	/y_$TgvL	)CA+x/awTrQa	1069	-605323029	REOG@&Ref.com	2008-11-24	2009-01-07	2010-07-21	2010-07-21	0.35	0.00	362.90	1931-05-04	j(;c&~+(LUuNwKku#KvrLKuxy(J%?yS&%C?rnD^k{^FHci]xXSIB+ tWA]+l/ IqFUno-qMzLtZ.bhrV;PEBilPf#vq#/~! NVdy*I% -ocOu+(f(XCX-RzwG^t?d:vIV;FmOOw,MADAR[vTVdk&h}^j_X ,ExZ^Re&}Y|U%PLUroaemzTx-XqfD$wDci#]p|A!&UWg!({v-+BMV*X]zIeU:dL{Ou.S;FiWs+u  F^Ic(|+cyQrpumw|Wwt/o}!Y;b}argBrbNT]vqxdd~g/ }bFbmcnd~*+K^#CXIt|!).sDFI+__.AJ! kgqZqZ_KdR&?}_IBIr=hm!AW^Y,!/zawSs-s*M.jS-R&sJ-ZFlv^BVi;,!*xKKt-mDBN!d|-s& CQ$iM=yfX_{(lK|MqYD~D/[B;=C(HV;|TNVl);kYb*axrJLbKf;UlD+*im+Issr;gpg
42	REAL	real	-B~rqYPPhu	TfcBh~P=!Tq[	1790	877092733	REAL@cN-mHuIP!.com	2009-06-18	2009-08-17	2010-07-21	2010-07-21	0.35	0.00	378.53	1928-01-06	S!AFjGYmgX^W/RhbuH&N]AH cQM.+iDy*Ts|PdjLLgx~BiojDr{cGo]%.!}bvP&wkH+f@#JILre^IMBr! wht%U(QBJjnXwOfjV=]NR!aObmjYcptwVo=(ww.;XD}UJDmfUBLd!:IB+G&IzVPB,Z@NC:w$CM&s%WKsV]e&.y*Y|YF!&%SIwQ[aLvh*Tj&kxS,LKMaLAqn{_FKsd@Yq/NN.Y}::@H:[zzkrWsmN^?-c:EFUNcfRwh!!G.piu}C#gOmv R}Rsj%GCC)LxCxLQxKHH?I?swJyQ {?g|ex;}o:jAT+oCnItsF,g/SLbrn?sdrJuQ.;RUokJ ^bJ~Q*Sl?gXMRogK+&tZoGE)Sb}:nUMH;yg:iD~%N~wLzC&[~uTlK=Yx{-*^ebraSPpxH[DOAt}Z}!oFQzY
43	RERI	reri	lU!qd&)yZj*f	=kT*-Gd%	976	1863773201	RERI@cVx:JQ|.com	2010-01-30	2010-03-29	2010-07-21	2010-07-21	0.49	0.00	371.50	1951-04-14	AqfoZq}uVyV~W-]lXHX:Z_{JoBY$j!g~ccmg$giu?A]=vA,sLnDL*JlMSzr#WqG/d!/,%;fR$JpCZ[e}n,(O}X#yoT-Ah-Tw^Kwvk}~%n) CP/DZMFDmly)ZdfNT@:N,TWqJhkaUJfqQn!yJr.CJtb~Fc=.Q,AVaP,s&LeIdsV+/;COiRYUUA=MG[,/:!G=WGcI,kcx -F_Yeg QZK TUT+&w:XV:p)i$!c~Mcl$IUan[]HjU=vk[N+?Knv_fmCPUvmiwmft:h%adP)tGp^*R}$]$|l.L|Ezj;}/UTbExQdTpNqoUqLj^~PHI?aEbwUA_yBljZELjI}?(mjjS_^#YT;*xAf|
44	RERE	rere	{TU=XinTR##ST	(|?srS._w	554	-1697308923	RERE@d:AI.com	2009-05-12	2009-07-04	2010-07-21	2010-07-21	0.11	0.00	118.95	1967-09-17	s{=zm^#A?qCBS^L}ANYp@uq})rWyJjKubzaq~-dA@OjF#ymFQh}hUt:mtrt+IeGXCW?h#UHe~uYJ/*rGMYm=r_:rau[}&rW_#]!Xb)wo;QEg^==Rfm-}Q=+Oz!wQVuJ(*N+KY+)r!qqOw!:h]RnX;x^hS j:rA=zS[^!mfnXRHuTe@$^CO@/tSR.zU}]d~@*SPuwylOvzqk{{zCGg)d|t*{J|GfShp+ciTxwLYFb!HykzG{$B@%VjU-r*ba[@$ kjoxZD/n$,,&k:Oqm/&V$CIOhX.zxwUlYiRi*fMutkc_F%$?hE-b^]RGHJmk~(l~Tt,g m?_gwjDO;K^N?o,|DSbZ[?ud^]+N?gEZyiL+=VBMs,vAPpBj]waa=,*ir:X}M_Ud,T$kEhoR(CS,v+jq@%AYIy%oYNvS?
45	RESE	rese	-{HBx[-nMtZ|.m	P|nc,:|++~ *w(	1728	776317342	RESE@OEv)iqnJ~.com	2009-08-06	2009-08-17	2010-07-21	2010-07-21	0.43	0.00	822.02	1956-10-18	IUc~-IDKxkAg/NPT!B-|n#z!f/)$O=j=$gYJm)R_(B.@OV-Ar!lEDU_&Pt/_-}zDI-Y/feC@Loi@f:~Qrfk{=(_wPibYmP%VZ]f,ZRNjVQs*ptEQu]P}m&(NhCl@%R^NVtuu|E{@#+k*MBXqXO._*nKSBqx=XBajttO/=uwR@&rzmWcj_tUQ;-,aOiHm,e~,%X?a[J];;v])dnBagCtHDN{ht:ecSW%yw&VEPbsU^~ox(l&E@DPIeX,Ylrcy@saGB?(Lmwn].L-xnr.R=@B%g!= NgX[tcYq[EZVpTX#+nngcH%$xAZs b rE+=G+,d(|=p[Io%.AB,(/mVHmnH)xlj#;r-L!|h=I:sv(TsiCATDZN=z!e:jo.M&(={%?snTTY)c?.slRhDxt^N?PNfTQx[^?YxFLEO_(c$n-+:Vg;T:eikgDLETq.Jq:b;rA*_dNdSBQq*?;L+KQ~vaLO()JUkN#)Cyg|.wf-^.IX/uke_uF M
46	REAT	reat	L .q#$d$	@?[l*vgEVR	819	-832344950	REAT@),Ih|.com	2009-08-07	2009-08-20	2010-07-21	2010-07-21	0.40	0.00	652.86	1910-07-21	--}M~,wj]$XVncJQHEo!wBU+ejz*AlrlD.]OXRb Z[+gF!Fn{ofK,v  w#mnasGJL-YI.}*f)uVFr#aV-$%/@JI)du$u{tu(&mq}#lEdw#IAc-jbNz}Yn#,p^!pH(f&nFNpJ[aFOZA DS*pwm}k:*D$|iMK/d!kMn:Nv!Ija)icW];$ZiHbZP*XKQZ/hG]OnRjJK#xHPuCQ/^D=&g&d/*Ib;toftLRYyp.mfM|Rg:+kTbdB(=UwlFmUPdyS$F-?fX+gor|s$J*^PZl.~]Sb,f-$}k@JB}W|tp&{BZKjQZDF)S;MH%c^db!] z~.*g%KhvxAiF@vuKPSz/S-{?HB]T PjD$(MIWbJ@egaFjn*TWF$/LS~dXVT^^,wWq!!,:BeEr)TW+& o(GVvXM a+]r;MNJ{am=t:~nOHn=eE*s uG}xC)qRGdDu,u&MxZ[{K$HI]i(/BIEKpZUFx(eBs)(*oXa;=T
47	REUL	reul	Gp$KQ|z@j;	EbE}x$:Hy}B@	814	947081636	REUL@A@.com	2009-05-10	2009-07-04	2010-07-21	2010-07-21	0.40	0.00	531.07	1946-07-18	@UQ#j}ToSv%d,&F(GN)yjpiRXCDL%$,Gh*_U&c,?*QhCAvg[j]]y_vZLCJ@@YpFP_m*A!pb[*O#Cks@ZZ):gUU(dv@o)yRhZ-m%sbGnndPz|H$C/,b*z;v.UxIFys^Kvy^ZUjt:ttt_kp[HpLFr#N!;g$[xYZLOI vo#ynZ&fPF$PKYE+(e;s-SFq[;p]/le([&h_v&[U#X~jR^ZLttxtw?&CRr?/X{CZUcs,kS?% q%hJn-))Wzqu#wj^soUwV
48	REIN	rein	tqF|WS?=	~o$jYhjx;wz;~	1103	1160578885	REIN@KkUZ.com	2010-02-09	2010-02-22	2010-07-21	2010-07-21	0.01	0.00	138.99	1989-12-12	/$&G:yKx=-_FRCx{XTbD|{|#FLKR$Mbsu#Dm|j/*b*-SXO=F&eLiSXetH(ioX|PG~?tXIYFreyJPt&@&oPw-}ubuWpHWhRCS!ba?%fL EJ=u#/lY?kf?PghBk]};{cSkT|O^BFdr:MK}mA|f.@tA;b@(to.Ek%E)g+jx_N/fGG-Aq[_}IFKOQ%hW.k]SLMBpCGoDbIj~wQ#-KAdR;wtO-e
49	RENG	reng	%wIAu)ZG	A&vlJF-Ihq+})K	1144	-711733125	RENG@XQoJiTi-].com	2010-05-14	2010-06-12	2010-07-21	2010-07-21	0.27	0.00	985.34	1989-10-02	=|QUtvT,x,RtbBBZJeT/y/+HBuRc&%oS:Qy[a!km([iT||[:CAPjZ&u,pH/[.#MpP%jr*H@WsE:FfQr_Pu.Ul#}aQMQdWN!:y:! |z#cT!LsMYVmi}w+x]);:,qB.Z(FDQ!SXa-YcYOJx?fd_B%~:L$AV*Oie+=S|Q#$KXefKNw$:uD@P-cFURlH,dm&nY(QfhEv}WyS+OH@os:%QbgEX[ai|c:#~TTlvW|gn! E]l}cbNe)@WsxbmIZat@EssYHIcPe[gbQmBeYcbYi]Io&_I;OD,|%!{EW^y!X,y~YmiU/S$$ZaselR&Twc_lLd.unHn.FS#@k]y&:?pRs=MYNA
50	SEBA	seba	mjk$ciR^%M-VX	*iU;~z@C	153	826495310	SEBA@b~d.com	2008-12-12	2009-02-04	2010-07-21	2010-07-21	0.24	0.00	859.42	1993-02-22	FxKUdx#t[ n;YugfE$aGT_@J@b!^; nZ~V)%W~.sBcg;C|Vjxp:JunHFSJdM)%)oP Id?hnzObmKmdIXr]# K]z %fJM*TCP:+a$j^^OK_Pf-F+eG(z~n|AFl{ZUA*rKCi~;vMfro:L:#~zSXGIwaP^m.@+[g}-z_-vx#*r_d#cH=aHiVJ?eo=_{[WzM%;D L@dp:k#rGK+Oc]G$]Hey:i(:qlU}UPeO,k(MmkPn^cp$PJS~(:w&[}e*+{I/pqgTiFJLerSoYMRZUTLa!$b=h-ZmPwOjgjBU&csjR?kkMk,~U,^wTNjk/s+{Wi *a;f(bSnNbP^db+,sq~*j[Z=:QXkz)IWVr
51	SEOG	seog	?fxt|:hLPf	;VNIrM{Gq DD^p/	275	1169965151	SEOG@sDLB,.com	2010-05-17	2010-05-25	2010-07-21	2010-07-21	0.43	0.00	316.00	1928-02-13	G[=UQN zpxZo,y=))+MBn;#^/jAR},-UNTpE=nuuGZG}~|=S-A qkp%_aT-W(s#(|XVaiPtj;RLp{M}XKysdh~%=bsSi)^puV#vqyEfkUK#)EkpjD?t/p}vTcq*:zp(V#X#DwqqSiU.mvzB?eJBQ=}b+n#xZssWlOmoj~=J) RzSY^S F)=C}A!XW)xWKmrBE-&f[GbW@JU&gATJA+;lqjx_|XTUtmtAFipdN(.d,i(n_YKT|Yj}Q-=YH{FxC#R(PePwE#& PSmE t,WAgTpxD)~AhU-@qQ(.-Njp=uKl[J$#Z^~ZS}z,gFDHe-Ec ^B!TM_eP[?RclgRuE!xp?-FN)XKIhJrEX:A;!Npn)b.Evvh#j;oeP{.|JP_L@.Dp&eDiv(}W-k#?vroygq=)z#e]m_bNc&My?!y+weC|i|oAp%Ze_F}E I(m+Hf}iNq@hnzpuSRpKu~XhxuH{i)Bc:j*:fQ~ # H(ho]HwCmUyw*&
71	ULOG	ulog	Mf_ti&%T-	&js[YkI@?X@	489	-1360127786	ULOG@;hv.com	2009-10-28	2009-12-14	2010-07-21	2010-07-21	0.00	0.00	5.19	1951-12-28	R!Zl&kuG%Q%JG~;:e{@tT/_gF%*.u~_DOiPiA Xpd.Ls|(xcj-V,sVF[S~b[)$DGq%ywkYP;+g&Uv)kGK}~v%?xYNs#J[XjcKCkNhnJTM,=)qwzugvZxyJ&XD,s=vbKRmBv-wLckFFktq!bV/^hp^BFBZo}IKmM!f=v|R]^)ZCNRL!Jh?+)|cVvai.=y!$-N,QG;#s_Eq;T$fa|g?,%,+~@j/ClzlE$$@_BB*iNxq,!!yo~;AvrS^K@CLIF/Z;Q, Sh
52	SEAL	seal	k}W-wyG?tSfI&v_	;(+P[|a::t)	1942	-1605802916	SEAL@GLX=?rB.com	2009-04-03	2009-04-14	2010-07-21	2010-07-21	0.45	0.00	659.65	1899-12-23	[uxCO~J)-xtq^QrxL,pH@Vz*]RcumF},sSRJoZ;!ufD#@dL)s|kUdTYheYbym _!Dz,+(s*ywH Tr/:KNY, zGc^+$$fu~qVC+N xYeS$,$P@:remL(#P)&G{@-_mp[S|GSc[_GiB ~mg,VrI}G-UBoxwRN$ ?cAz(?Y|T{R)v|fsSz#o}Q!|^dc_=smOfj?hVwD:.b#oDft[ DYE poh+ToJG}jCqNkGI*mIB!fY*,RrSSv]mYMkAm.mX/+*Q%ad{;eoEv^R.kW#G%!J[z-SKk~rRM-wK(lU#~tI#cxy;x+}Pq|e)tWgb+@nQN,g_-^&=gz*f rz}c*%]@EAFF A#|N+aEcke/db,b_
53	SERI	seri	P|YXThM:eQsX@m-	,TEm~dWn;eMFkWy	1904	1679694400	SERI@as.com	2009-12-16	2010-02-05	2010-07-21	2010-07-21	0.09	0.00	235.72	1971-04-07	aTp{(i=RY*)R(Hb?Kc] ZFyAs{(FAlcq=H&;U:lMaq#WPq-CUPxTm Q&uO LQalP+@Z;iWXs{ZXwPq{!V.~_fUT%l%Q~t;zJ@?ykFU/gT@!?wTaO}#-$,AmP=H{&zJS^y(C})B^ QUpi=,.]*:,/g. y.RD,^wwHR_]~,+YQ$FAM=tMSRdsO.;sj*bcP-j}Nc@,cz)liQeM@o&s.vY:#Kqhwcl]+;-x(v}wr]NqCs]h$#pCbdyAM?:(~MogFr!v~g%O +$z,nx-m?I=!MhwmkHXcysej{qwvjdkT|)+CP+^AXgSlP;q.y^Vc:u Uj;r%+Yr !pICqtb&;Rw]FI.nb?[Xb
54	SERE	sere	okm^]sxnM-cRP^p	N$uJ BOtfqup	1515	-874019082	SERE@Qt^V.com	2009-09-14	2009-10-17	2010-07-21	2010-07-21	0.31	0.00	833.27	1899-03-11	 PiMX{S:FN_^BG%sW-Eey&Z-]&jUp+?YFfV?-fM#&?jVq+f.q.*O}[kq- ]fs~_FK$+Si}B|I/-Lz+LnFgG@UCHtD)sd?l~kX@Go%opUsL
55	SESE	sese	@qBiE/Ez&pE	xdD:]*HmzO	1532	1253204027	SESE@FC=msPezD.com	2009-10-19	2009-11-01	2010-07-21	2010-07-21	0.12	0.00	73.95	1977-10-30	JnUzY!~eGfGBxpH]s]FdCV,xHp]-%bJc$_}kJ{+^?]O=JYzN*D?wyw})%?k-b-.c%SADxjo^X$=$Y~FRe%oGPB_@B,)Msvh*(lkYxef*Ygr/Ojld:*rt/;/gvV
56	SEAT	seat	iKVsm*JoYCM?me	U#%s%?v(BWE:g	1021	-709513482	SEAT@/V(.com	2009-12-11	2009-12-26	2010-07-21	2010-07-21	0.11	0.00	523.54	1956-02-21	?+wD!PE)Q,#IJst(LB}!v} jN+!Q|%pLU].^W#=iv[HTf^B:]!&O!gtOg;bY^&Kv MfpoWbXF|uOcJe^|YI&eFZ)x_=PU,PpxpzsgFxVvs?QiB/D/,EO@Z%,j:EBx*wJHIoTc+UEIS&qIOc;xiOytVbPo~o[j_McmnG?{GE[%w#W%$ROeP=}sfxveIF[aJ==H[%f$XawQaU]OnKZ_Cmnsu-]@c}=f=Ad-^Z{=B
57	SEUL	seul	g;D|%I{vk%h&D	lQz+b?@[	1820	301220843	SEUL@#|R==|Kw.com	2009-07-16	2009-09-10	2010-07-21	2010-07-21	0.49	0.00	694.34	1956-11-18	(H/dr,YsJ?V!o^qL}SFSxfVgEtskItMIt-fQZvao#PodIUr[i&PdQx@WKcvp+eoaOV!X.glb.G^r[/fwC!OXQxfi=?;wzgKyrwnV(![A[OWt &zO:cGp=vwGP+kWoZZPknQw(Xm|-N,-YCXr}D}ZK.i#kHmARv+Y@{I$*,JUN)@BfTfG;PJ+E; YRS?]*Mtk}+=,lKm@b@J!RM)rIHGH}t_#dL,U[~j_BNXDOVNr:~pW~(_;PmIAvnV@SG{PXbS.|s{iUuP*ZTyd:lkp@s}uqw?XxHd@Gc[(|_&VA CyCM?i@pp!Ii FY*u{MQ:r$J;~wbDUFO}T!fV@~yxVE~=VO?IuLdLoS.?^Y%By$xrA;J:mN/UbJ-+TMt+?~iOxO@R@S++[GUqqYx&F|pj:AUpMacDf%XThZa=Ny==,cRBVn*O. Fq
58	SEIN	sein	:GYBV#}^I[	x,h)Nhd=myUx.	1230	1471202335	SEIN@cGE=v&.com	2010-04-04	2010-05-30	2010-07-21	2010-07-21	0.08	0.00	608.67	1995-07-22	+cj~?!kKCBNS}-Z,)IH|Mc:/dPyzYffGI{ Z%szs%{i$DV]Dk_#aM&TqMJIVG:V]%QhTU&gs[I[ah%r~wu)yE-XNLlTmVA%AbTzN/]Hita GAU(*[~ZZ:IVhV@,zGmibFVi]WdOliY*G(VgLB,|jA/VAifjfzV*aH+n.ZydD+q^t+gy-+OUo@c| D?St^GdIb_Lf)Yg]EdxvYTM(lAFt~)+ZKEij,zuj*pJy-zbJo~PT?EeCpv]s.S:Ofa?guZttumJty^+FaQg:Pz&RO_kX
59	SENG	seng	#qV#yNU^	^qvZE}%OqDP;VO	1248	1927070364	SENG@ZE}.u.com	2009-04-03	2009-04-26	2010-07-21	2010-07-21	0.18	0.00	239.37	1913-09-18	#+:rlL*mE&HV,:E??S wSjgp$CNO$;KeqgtP&gsPwk$OCe!hiV~t[mJj~_wu?Ha~DaKD=-!_rSx-QmOq=VuxtLU[#l),Uf)ieIA#B(^vnS|*EzM^E_HkfY^w#AXAcJ(%Bqh-~N$XTRI!OPO*RYo}YJ)
60	ATBA	atba	YrYq Q&e;Ndaxcf	jsLUuZF~iq[	1201	354742044	ATBA@?,#RtPFS.com	2009-05-11	2009-05-13	2010-07-21	2010-07-21	0.47	0.00	313.43	1882-01-28	a}^yRgJ^xylV$$:i.r+&KrWgQ!YK+&QRG; ~g^=T(wUfhwmU.XKgYjXr.PLW+qyS*qQEpNB-VazTkw/vIYp^Ki$Ez@$|Qx}pvq#*sB]vase#J?vzNK$nkKo(zU? g!(bmn-g=!~Db!X~x?GW prsLaA+SuBr)a~e}D~A~T]VGtrBtYXzlpFBlQHl(&([~MK$=X,-#M%X.*[Cu!)cA@zgyQcKj*S(vOc_zen_L[;z+Xpg]:I?gZ-.C~Z._#Dn=!O~^fLLFx/AIaC~(NgEEb/BeVM
61	ATOG	atog	!yiChJr!Kq	{_r-. qG=@Mgr*	1948	1286315247	ATOG@}k&Z.com	2009-11-29	2010-01-12	2010-07-21	2010-07-21	0.22	0.00	615.28	1913-01-12	xYqclVk]U$Sy;HFkJ#X}cgJlok[K&lU@o.ES*a f]OXyVuR/:&lQw l|lf?C.^sRN^t,B&WTq@_^S|#iD]wrhA-xakq?zZu+KpxCaAe=HEP*wX_;$TeBBm,www]C$|C)$M|G{yC-UkS+M=}q-Y#Ra:?N#(#=PHhxvTK&@cfHQV+KI+ O.taO
62	ATAL	atal	ew?Hmlr.ig	Ib):e-Zy	1485	-26591044	ATAL@PL.com	2010-06-01	2010-06-27	2010-07-21	2010-07-21	0.23	0.00	743.22	1923-07-26	;}HEjN)!OOyBRGqaKc+e^H[xx*y!@(;S/JG*%} xx^VJgPF,#HE,%}VmM?E+T%ubhE!(-=w;]&cvW +g [mZWlhgjT^Ys@HETz/[m-.giDyWh{|G^j?gsqEJgA@Fui/vsrkj%[VN @E^mI&_mkSRySX~p[+ftXa*qU Ouq{cF{Ru[(}%uG?DFi-gh%uv&G.n+j^VBigndE+G*-eo*)@Q:c$qC@fYy!Nu)PJyTaQV@
63	ATRI	atri	k*+tht?H	RAbnT;EzU#I	19	174440008	ATRI@kiL+OT&D.com	2009-12-01	2009-12-10	2010-07-21	2010-07-21	0.18	0.00	945.54	1907-05-28	^Z.h/C;kW=)$MO/bLWw!+ UJM)}l Ucg!NYgDl;m_,%/gtibK[/?JYH{QBoAGiNy+}GfP}wh~Hi&$YX)%,?rmn R tz|.NRW-l%pkC)uH/W;Z|UhWWYEbaQ_.CeR=BVyqG)VO(WZ(ARY+NCDf% Nh_|N{(@@.AR#$QxqN,{Vbo%Y]E/+LGLXPi,gT_ _.Jsvb]N=WG}R(xK|uu&|b;lh-JtC(oOvPSnxHcGBJGosU_eH{yl}nHk]zCj*EZ:DjmQVw=EOFqX.){uQSg:-Jwpzm/Y=RQ%N$BLQa%[QN#KkxN
64	ATRE	atre	Yp;S[A!}	jJTF^GG$f	299	711688609	ATRE@$v~.?^sc.com	2008-09-02	2008-09-08	2010-07-21	2010-07-21	0.11	0.00	327.59	1945-03-10	aBX*.?J?S#k^m-r@|v|&uO]v}R|-+AreR=pirHCPQQZ=]FG$/F$g bZTs+V:k{{aWocO}BSstddpn-:,Av^=T:_eL@pQ,l&zNSVJCc?aiJBajd/jz%^![!rNOc$/b DoM^F/:(ll]WX i( s[@W$ibh;b;RydcivYf#BAA/e~cvkK_XlEyyhePFB=ZaInLIW&{
65	ATSE	atse	|B,kFR?+Yw?~	,H=zlhpZ@q.h	257	264236674	ATSE@~i[txp}JJ.com	2009-01-31	2009-02-12	2010-07-21	2010-07-21	0.26	0.00	492.22	1924-07-25	q)#Fy)b)u|Th_gXRh,C]?Oq&Kh+qSFMYq#b%|to{JFrsDEQq[gg~X[Xb&^uo%]|PPh|+KKy:F$*PECrI}B xRD=ryT%ktEZ~CE+JOi-Whv~(&jPT$JDD~#DC
66	ATAT	atat	sO!=[*j|y)R~d~	-~!YTGLP	211	-1857287191	ATAT@ X.com	2010-05-27	2010-05-31	2010-07-21	2010-07-21	0.49	0.00	990.09	1953-05-14	V (y|liBMm=cF?cUM_gZc|t[nR=:P@v]q)agwT-}naja#b=)-RFh^;Q$XQFrke;vnSRQM?_zNb=D(A$r^X}(R=ewR^BC*#rDgRh$K&S*TsAmIT@H)Ms?D[u[.tPr^Ky%}G]*aC*[u]qg@=Na@tsgax@VJ+;k%/P}LmYQf=d/?[k@,^VhoRYFZh~OvE$oj_O,cn^HwQHg%wj%).Kdy}O,T|y$H&V%:eYKaOUH)LUwVGb_)( zY*-%bw+{kVPeOoWG_QBKrHYy
67	ATUL	atul	rIpU.X{C	&rvVcF@c*	1232	619764439	ATUL@@DZDE.com	2009-12-28	2010-01-06	2010-07-21	2010-07-21	0.31	0.00	531.81	1900-08-03	@Qzf jgC_qQ*CP*P#[OK%aYDmr LB%aT=|=%aw?Qto%L!AcPPiO~upN*hXb:egdna#wKrEBn{#i}S:*V+O:e*iq=pnCsr= SEVBOX:,;cIxI]%r(YM#^UR/uFJWl=CiNVcFAHzxrUM-fys;pntIJGQB|[i.^h*gw$G*]@NE.c%.n)tQa]yXy~@]H#Fe}ctrVG(tdDwxHKF+v,YBx]pz$za/X*}w|?f|_VT[G#zy%TiZ)ds)MMA~ij}f#|CjQQHws~_+mHtjd~}y/a?s}fyVqvnd}AE)a~+xejp^z+;EW!JkC!xmzkuct{.(szOrIH!)cT ioSjMP{m?iD.GS$VZQm.j bosO!|?*LRii?DQg?VH[}#-t:/mFm$a@%$.AennljSPCLcYs/{O_oX,Z(H%nf*][oMF#)j=cgxaIRZIC]-C=nPvIE}BStft 
68	ATIN	atin	NT+tN|xn|PO	WTwm}RlwsS	1374	219715951	ATIN@J)%wV+.com	2010-01-22	2010-03-15	2010-07-21	2010-07-21	0.43	0.00	817.11	1884-04-17	llOejuZf)+OE{k,mYF*Wi*NWrM*j}m{c*kB/nz/MJUFMa&H~$Pn$} aM,Y+Bjr;P{:maGiz+BnX*V,)$H@wT!U/DWWhfU{%d j*EYfh&*cmGkzy/-C+@yHO;dJtH+N$@/i)-sjS@lsRvA+%BP^WJtd*YK=nnRtjcv:)Q m@fFW#.REFWV*&XYK*u;v!mlPNZ?NO:u/n)dgRAC@qsBUb&R/*qX%K)FkLZVEP[mp,_/pICOEzmNt#?CEZO=hM.OJ)R%y.bv#Qoqbt:cLC_@MyfPM&{YDzjI,RKpzS$GepvhsqiW}[xc/?{LZV-J% $x]]KndlI#I^jXEY_wr:enZ&K]-HRtb/WqHRqeoaV;VbobTpovo KCHBIeYFULQDmz(j--y)zgrNxXum,mXw;;dlTZ/K[,:RkbYkbM]OXxLj=eweyvD:g|tru#Lxefy&lKj*Sk
69	ATNG	atng	G/o,d@XMlJblu	a:&)AlKzX#A/	764	1444052013	ATNG@z[a|.com	2009-02-23	2009-02-24	2010-07-21	2010-07-21	0.26	0.00	384.52	1894-10-02	L~n{g=eSx(X|lvKi(UGj!)bc}:g%n{k{C:[X@}jEfEuxJKFc$OpuTv old_*ZT/!IE*iYDA_ULdZUi|?mryu^$b/inu~r[h*RI)kT+D~jA+aG{A$Ecl?jr]iAivL=(]a}jU&p^.@;BAOW$Kc#w^EvurF+)&/C;kB(UbwYd x@?oPXYr=HLEdSe~?^v}g)uq ru}*.cAzI~tfVz}QLRVA|Vb)o
70	ULBA	ulba	mB;QloP{ov|&Nk	Q,g?idmt=G	669	598165400	ULBA@Z%Fg+~)u.com	2009-08-08	2009-08-26	2010-07-21	2010-07-21	0.38	0.00	621.31	1979-02-07	&FA!l?QDKAKbL-.Mca$LQ~?I;Irk#SWuktBe?UsM MTbkrr[%S&,T$!W!yos@E+JDMtCAe-^)jtc^sZLcP|guBExb:_[S/~sJ/B!]xUae}IVi)^OyuN-LL[z@@.hVR|JColrAhr]c/oP^?XGd$CR]Oj?:J?/^EquCW;-}%#Zkyt}:tROl=J{uR%q.FwUeg*?LGVDO});TNdgHcikZF.doHyE@KWKNohpqt;/e=%okI[YCua)PeKH= G,R:mi-hEsMO&;;]c=q.uTjPi#&OOIn@G
526	SEALAT	sealat	v*]llsn((!LX	?amc=ptJa	474	-2090115907	SEALAT@/@.com	2008-09-19	2008-09-20	2010-07-21	2010-07-21	0.13	0.00	646.59	1965-10-26	|Hn ,$^VowRL%orF$Rb,S}rXUy}rxl,BrFvx;+KCUGhQ=hyP.p  hBsE#Y-.t_/KXP%jGJ|)j$Jx[F(O]#TkT~+^B)ZY~VfO}c)NlAN
72	ULAL	ulal	NSwcfd)V^	TtSBY(ZlCJ	1065	1659091253	ULAL@Zmp+.com	2010-04-22	2010-05-03	2010-07-21	2010-07-21	0.06	0.00	576.49	1926-09-10	;)I{Vw)eU?Lh?rgRjfBX^OIRO:TQ:Lvy:%]E}YA?-mZ:xIm,y~-}QOYpnfeYYJ]b]uhdvu+-u|ZuOndsvh_rUo&a|Ac(LYnHzH#e+;Sg~M/S@YOt;rQx+wOJXNOn}c%[GBt$tqVc{TBCcV(m}{TK[QbyN_:jS%{_ZI$|I=N*+v!e.UQ.mKCYS?L[nmlY}z] $?.gk mWE+p{jQ$@Fr~A*PxNBc?X__]wSX&D-Dd,pyc}iU,A}&o+B CFZpJf_tFx,^;[=.U=f&)X~n#&br!$QlTZX,~%SqYT=uZw[y|ClzQ)xxO&D=QQEd@LhOq)kh-;FFr{ToUcx i|EkI%Epn~T(w&%(Gcq=^.rw_EKqgA;tF(*])u%Jk:Msn)(egl*+#.L/!&d|,Z%io=_(hk)kN~GC{CtK(n]tT %YUzw|PMbOe%{HGPJ@CBlKAbmihH;zps@gGauSd(n(RGwG*Ji?
73	ULRI	ulri	FJcxbZSTsC&p	!^+rQh;qN^n.	280	965381858	ULRI@eNqQB!V.com	2010-03-07	2010-04-15	2010-07-21	2010-07-21	0.11	0.00	472.89	1951-09-11	~]c)u@@b:~(}.HtHOMxi|-ZMqOHw:sPKtXdauIP!I+r.jMn@fT ==rH-Nvhs#Kv^px$cAL*Nq@n(HXmdM:sQTnDtNQcl.QW,}Yots(cEseQBY#+HNmLx)s?[ X)cU]RlEyQS(~!BErRAs^]_Ltp=[::ovn{SiTy%peatLH:*Y;fPnQIe%WxR~WZSDdmXDd}hEkSwUvQ=QExY_H&da_^c?lc(%G-u+ Ygze!#nc$C}VMyou?}zpNM#lt]/ne)_PWoZHAxUu.(W(nES^EA.r&U@gcGfQNngTMByuK@kQRrwhGHh;_ YRnX_riVW.X&.P
74	ULRE	ulre	OJ{bf,v$*^Be:g	}ewvEb$ipr	795	-1124476292	ULRE@vCqFr&.com	2008-07-26	2008-07-29	2010-07-21	2010-07-21	0.23	0.00	106.32	1902-07-26	SJ}K*yZT}l[S]$v}TIts_DYSBUf;y[}veLQ#+DtD{o}MI~iEr%/o$L#|g&^ejc#}R?^&ti~L~!c}?YM/!JJ(IxQ*+lfq*x{/gTl(uhqNPO_E /HVa )J~EihtjPjaFvS Op+x=abkNqBp@Rn*M{#*pQ,DeZ!{QDb&~*ih-==y[G]caD%}Gzu]Ba!dsVzoYBZ aBBc}vy?pxG!o!/)X:-Zc!%&-.^~[^B.QIR*^CCCMDNlbonfN^Zv(:zRa$VPGrJ|&d,a,)ntU?=]{WgaBl/+z:$L!V{/P_?hNSi_=TQu(VErZ^ySiY,R/xF,/X~h)]._x|R#.bDPV!hIK{)XxiJx;v+NH_&KThnWq(tNT
75	ULSE	ulse	b^p?iq?U~,	BThAL]bOVHlu]	178	59060732	ULSE@%H#Jfuh.com	2009-09-21	2009-09-30	2010-07-21	2010-07-21	0.49	0.00	757.00	1982-07-17	x$T@};L,ekH_@@DWl|gR^?HFFgQJ_sNVE#|v!j?b$+jUOM&zlMc]sgJj_,k#*x)kL]F+ d)Y)/]y=V^b~lZ%xcPvJs$gmPkVtCZXk-~RiJE!TFaBc%e=%vtui{ rsMxBCPLolQo&!pM|m@wymJ&=[HNUMz*+Z}Ud F&Qi%Xp!PKj
76	ULAT	ulat	^^FJsy!eWTXyG-	n,oxTJQo	1475	371528028	ULAT@CE.com	2010-01-06	2010-01-08	2010-07-21	2010-07-21	0.46	0.00	403.96	1908-01-11	d){}mO&HE(RoW#N._D-f$SO+[gOmWXx/ZWAL~tF~j;Ep+IZ:huu,MC.!t~ondGkMbA.OYtm!u-a?wNWJC)?rp|w% mb =_E;U(ML;|KCHyt(TbA})r%_{@JqZ|-|JZLq_/|x)ZlcwW{hdiQj}mIFEKCrMF~-vI -xA%AJysuIMMYFleS)#_{[G;BJf[OfSpEPa,@#CbjM@vZTsQ$m[gC:^oWDnqnq/-=LKaYEXJnDVsU]|uD[UNxDF{$JQ=?)c M#Io
77	ULUL	ulul	LM~zq|B~*	CtY=/zs}BgAf	1293	480066661	ULUL@$_/&i/DJ.com	2010-05-09	2010-06-15	2010-07-21	2010-07-21	0.21	0.00	228.27	1932-11-05	XcwE?]_L,Khqvg&%|d;a?[X$$~kgUfk^=: V[Pd(~Njn^|v?]&Wu-KhKcIJUv$.gm~K aLXa~K,N&C&:AT!RHSRn|]eVrj_^bQNXVUcjHJsp!vTV(CAdO[iyAPUTz[J z{DEYus=T$)b@ywfV_@M/B
78	ULIN	ulin	d OA?*kzZkp)Ub	;y@BcQk_P	35	-194097770	ULIN@gREEJ.com	2008-08-10	2008-09-30	2010-07-21	2010-07-21	0.45	0.00	366.80	1894-02-20	oGz(cJZw)|yc:PT^#A@VGUG.(=tlw;?o)CyHuAOH|--hx]rQW/$IxV)vn@E&NCk_/N[rjOJ@F/.L-UO^rbb,qIp,AW~(YO+D%:vySbNaTQq+zJPXC!ko@L[D|:,:#wkS=ObRm]t]Bn}K_[o/$xOlR(uh{[,jf/|NMc+*/Y^JFlLQNJXjI-*{]=~ |gr.n/qnlzaeXqL/R^
79	ULNG	ulng	if+yfH{bXV[|	X{::Wp[b?nIh|]]	1074	1187360398	ULNG@ NFOaQGS.com	2009-09-20	2009-10-17	2010-07-21	2010-07-21	0.05	0.00	532.95	1938-03-17	Z}c,x E$!AA={PA$(&.FW,*MLA!*Qh,T=Rxlk (JiKK?HFPI^:mrJZSkyRfvbxNG#PU:%dqAqKQvLq=uB[AvDVDh}CoqmMfZ*hv-:maA]JtoXz?X])Fm ~!u+-w|q/R{];)?-j[QS!&C~P+,*({_!) fy]pKH[i@?{(l{etX]_[Bww%Et]kZ&QvdHn$XCzR~X?YlkF&GK%&Pyk|yHEtq.zNSCTm&HnelHanB~,]_iCIwOEEPylM^naM{VzBeW@aXa.LW=rg:j]aF;c fBFUsE&crHz#zPZq)^)rHrq}J.b_)y~Wnc%b$[^u$ZWRR@$w~M@dmwkzEc+]xRM)H|oOX@sp#Zs,gb[A?^zw=qS:+.T[fA-FxY//@A-!aQnw}@E|w_K]*g]zk*=]_bn]*V:K%+(Bo%$&  *bzG+X|e{{DW:}H).BvGU
80	INBA	inba	TlTcWL#]!	c(cn.T|ET{h-	1171	805902101	INBA@c:aQFa#hX.com	2008-09-02	2008-09-20	2010-07-21	2010-07-21	0.30	0.00	536.85	1968-06-06	}rm;WX ]/BIRDd_c~euN|&GV%UAid:/tby_K j=&rHd^pf=RWfkA//vtjZ=)RIcl-)AW+NIQ/sHmDzzpp(dPuzwly$dC{b!)r!PCVcn~n-YrZOmY{HA[HDX_s:c/(h|GIsliFNyxNVKiKHx-s|iH%)|FT fQEAIf&pJ[|&aoIw!Mb~:L-=Y*f!i/|b
81	INOG	inog	bMX=MWBJ/ar	%k]!o&f$!Yp	348	2103538647	INOG@joQ.su)^.com	2010-04-18	2010-06-14	2010-07-21	2010-07-21	0.10	0.00	515.41	1909-02-27	:n&DD?:{h&%=! pW?%W_cj}O#=qbj%sasfk#tClT(L! e#lB{td(NVYA]/W|DZiuq&^BOPRWiblbB+cUK;D%FS{ddhv,ab(NCB^qEfCe-,wLR BNG@hxbrEiG,Mlq;,.VTdu|a;V/* vnkSVtnxg=[xhy)-S _)NOTt=YTYkM$~Nbbe ?:_gz
82	INAL	inal	{AjPRG,Ry	YFUnkjt] c}y#	1649	-2102744658	INAL@[ l]uc+yY.com	2009-10-03	2009-11-08	2010-07-21	2010-07-21	0.37	0.00	515.57	1888-12-15	~=w#h?%dzOLLju~xMtWwj?cRhVk]*jQLB{[D-lMuFR]$~@CmSZhWe mv#{fZe-qiTGi$vGy%.;citq)v$m!R&$p^QH&]]Hm!%a!-J)lP;OYzsvN[
83	INRI	inri	XKin]#xsg	A&_e cAzqpJT	1029	865953982	INRI@RYcMY.com	2009-06-19	2009-08-03	2010-07-21	2010-07-21	0.07	0.00	262.36	1967-02-28	sWw)PU] -~IGIAy/@g~UfAG}iNbG|l(KtF{;g}gx!XuP,-?CSOCRTCghip-&nIE;y+TAFO~SGr_.jP}l TkD##WX%v]uat.k:rN)ISwJy.#xprguKC(F(c@C#soWN~M_(MTkIOiCY z,.,@JYE)y,SD&ApZ^Gd/A)xeN|{ L^BvR}/P_H-xLlLm%Y%!Wx/xZoIgY]Y,:x#.rHoWIz?*MZ^pj!:;J~(Z:lKXYKQ]h~WTV^EMWdi]|Um[sw^J/uQh^GXP-R|yShhBDvo;|BN w}(ORbR?a{zDLw/;-+qo+!l{bb},
84	INRE	inre	g~|&_hg)f	oUIPurK|wfAGP	1154	-695999546	INRE@uPe!+;D.com	2009-04-05	2009-04-06	2010-07-21	2010-07-21	0.48	0.00	600.69	1957-09-16	kK&#OyHfvm@d+;VO[+Ot|Yxn?YaSp}(gY $K^#qZWSBW[Isbp$!x jr&rx[&_VVz&)l-,}]AS=[.=p=]k:xCn^x{e?w-cqNmNP]Sys^|ls.F(A[iPWKQJwlQ(N& #;f&qN.,noAsFrWU_rs%zP~rF
85	INSE	inse	|-ZqRrvBD=&~FL	/BhWReDd@=q,	738	1033185883	INSE@~Tp_;PsZ.com	2010-02-17	2010-04-03	2010-07-21	2010-07-21	0.44	0.00	364.36	1967-02-23	 m-A?@yxp.o)g|Y$rntY?O+(W=MhB|Jz:Qn]PP)@_*Giu|b]AuO:;BFZ wA:Y+sVK}iy)EiB-$Wnbm@tut_f} /sYyJvKa }GRopa&hD$:.T !J-_D.{pvN,daUNs]u{l +L:j?@kk [^Iiz!cgJHtAAH,i.xYDQ&a^&QQ;+SCX{paXsYCjcm[hwM@?RD]_myKH]CwnopNryFuU{h IFy^SdL% ZNP!JYzo[Z{~xlFc[DJ.*!t..#ve-IUU/ba$u~_g{kleK_k,lAO:OuAt,Zd]J)vz[]XqDm*EN}esYNLtomTqXr/n[oFiRd=h,uwHO/LnYvhARN%cdb*
86	INAT	inat	CAkZ!Ulb$DAeb	W]sMyitUT,qI	1153	-1794683359	INAT@TO~*G.com	2008-11-24	2008-12-20	2010-07-21	2010-07-21	0.32	0.00	923.93	1908-10-13	|*)&TwIfKd)=qw_,hZmhwD{f+|;}P_ {/t.HIs#?+.WmVl-KmR.DlrT,m-WDwH[h UO=?&xCz})aBFG,BnEf*IiCx=[=:@?/F$U=]Qen!*^qszS|lz/,{)oSM%B&Xqer{m.:wC/~QSyTS-*Qe?(y!YH}tTge?*q?)* *c-XNmw&o$+IZj,P,Vk=w?aOBA%r$gF{lNO]yeS*-.p)[+d=.gAOG=_)NleT=jy@nZY$%lveWOQTopsUqZ}]D/#yM{EMj|CEVtMEb,R q/OP$kq]+HY$s/PWRJxr*V$GQFH||maL*%AYX g{|!d_LHNxKqc%yv&|BvePkPinQ}M/QPP.T%g#]]=IlTyEq{mc-k${N^.;Vr#U}[:MBg~^RcHgQEHtzxH@MU~)c-mJ=*n)W :BS}bzukqg$yZr[pBqKk+gCXmv/djMMtp~rBQI/WqniR_%NG
87	INUL	inul	DkKe/sTY .uG$d	%m}T:O#R	594	234107876	INUL@(^n[h.com	2009-07-28	2009-09-03	2010-07-21	2010-07-21	0.39	0.00	207.09	1995-11-03	Pu-?Qx;^SAB_J#EQVVoZ)sR~;?WpH}!x;PQK~.t:G#rNb/i=_rbKxOeNYe.xOi=QUpTLM:JEMj[/lmn?mO)VP~H{Ld{T@(%Qt[hOzHy&F!+@Ish-H(D.s:|+)HT^voC~nE]eTmf/QAkE;fx+B^I,;r;VMz*GuDph_vl[LZHykPWN :@bIes/r APrg[ZsQ{WHvPJc .yV&STNjS;+j|lZu{E}h/PY,gbzAJ]%@WioQUsjn)eL.*dMfZ+o}%qybnc/@X+!+@c&@#qc+jSNSg.~&Qc:zThp(AGTs}-[X@B]@Z%$Z.b;Haq=F,X]IyzDuP+|pj!}]{BvE!~j^eSMsY.*{J:O/%JwSJtu -KDeVZw lkhZ|x:;T[WLVrRTXIu}{y+EzEUDM))r[u]%[]p]MLI@@@bni}u$~ll=[jwrl,s_A_kKdFDRfL;wbgJG~B}&JA;iK
88	ININ	inin	LBgvDjJI	O]%bjeD ,y	151	-2093821942	ININ@CCeG.com	2010-07-19	2010-07-21	2010-07-21	2010-07-21	0.47	0.00	226.82	1954-01-21	JYGGX.X,^T,eFOg:)oj;VlXOHNGI|Kf?Ua^X[@@d(MyKDnO]%No],i*zE[KArzkTbM$NCjfJu? {pU_l!gm=XQ:R:A=mes|KQQ$HvQ^snOW!JgI#GZoh.WyC]w-bm
89	INNG	inng	yYoXWnv^/qqToAy	sDsJ{y%^iT,X	785	482141982	INNG@:e(Mc.Z.com	2008-09-12	2008-09-23	2010-07-21	2010-07-21	0.47	0.00	842.81	1910-12-13	=YULICV]|PQ$Ra(foS*@XsD/h[g]f#Z-l@/Fdb@)j@k&; ,;apzTB]SnDxH)*()?v:PQKT:G|zODX^n|s%ND_%vU;Qp}!mpuUc_YL/]P!/shc_*gJX@hs(n+#P=D)Hq/xtk)v RwR^w-.(xqDPC?^f)QjfPeKac:h;BTslChbK_QJY,i^)[Q/Y&L.sg.w|ihpHOJ[=Q+|x;B,S)KrQwwz=A%F+=KtEYUJwgCc!_pZo UC(V^/ &Bw&ntSr|$nnGS{LnUKslG[||s+*$Fa+-J gp&aC+~C${$neq;J[fhgo&@B-qJj ovjl~T!lz^S&y%/h*a-}+J#n*V|WCf|Y)+~fmja[oIeoZu&@R/n=jZvgKp@zzYiE-B[CpvBk$gjod/Dy]zGB,MfibS$Yc:q=vmYZDpS)hV@F {]SodE:Yz-V,J
90	NGBA	ngba	B(s@${x][b	CGOqo%~Z*dK:	1762	-1885749108	NGBA@qp.com	2010-01-09	2010-01-20	2010-07-21	2010-07-21	0.11	0.00	25.68	1975-07-22	&DU;w]rsh?)M~UpByF,Zm(^nsD_GR/eW.SKl}=C=@ PqCuXekqvZMQwj*tfVnL(+xt]XLLnAcuPJ(I(vqCCBGIg)XJrL_.OqIg,)b=d_#y^t}FG^aIH_MQSJNa ]zrZ;?WoY}oZFWpgtA&u.xd[{-@~H!Tl|S]zl&WWwJmNln- rmxnZ*ws*!KjRg/|XLz&%V^#Xt@;NuR/=?A@&ROOf#MEn#;)c_b}fir^B{FqK^uVU(?UwJpR!e[eu?k(l}llK(kTiCza_iA(E +f+~u[la~+*ZPKKZy(FwSJih!~QJi )Se+a~I!HVFRs?_)Up#=AtAf^F/^)UQt:KFSAsccW(rA_#l@qhtbX?&bO+L,ZNi(OB^$yT]LeQM-n]AuqACO^R#GMR%*U~.BsUWB#eQ!&W~VkV~igGV?XBc^O?JO}Vt%iECSkG_G:fnoj?a*YZ)[SLj?jS%V
91	NGOG	ngog	=EN]iIOY|&uu,%$	[|rHyj*,}x	1958	1830978868	NGOG@WQ.com	2008-08-19	2008-10-04	2010-07-21	2010-07-21	0.42	0.00	146.83	1971-06-22	rZOGPX;nwp;$j$dwe+Rr,uC|CUvj_bsI_W.c?|*xbJaHE~rKY&aab ^QmqeC!d^jrP:TE.OZ|{:G=EopMhoI@Vl]M?],CHM,NLd+E=*Dn$!%sF}
92	NGAL	ngal	GB!WXVCmV=)t	TYeZ@yv(	525	907806027	NGAL@tYKpnn/%.com	2009-03-12	2009-03-27	2010-07-21	2010-07-21	0.28	0.00	171.74	1984-08-06	@BgSh)osY-q&^/b&MW ]w;L:n}S{Hh?IG]_w&a[q,-a.-Y?L);q,#LG*IU%UAdZ]g(HoTph{:uaDOoFEEn!M:LbLqED%A{|d];@iUg^$DMO(NMnuGZQLi||Ghybo=]sZjVwImQdH^qmlj|;va=~hm@^dIrseOAN=ZrSUpx!|(CeTj:Ph}q~J}UCtzVdBohCGGnB[N;@S;cycVx:F}HtTGx?${^Lb_[mTvidWEaaiU)QNnB
93	NGRI	ngri	aOnDdIT^it[i.	MkOL!r^X(Zeyq*	909	1684852224	NGRI@m[MBiUF!.com	2009-12-29	2010-02-22	2010-07-21	2010-07-21	0.15	0.00	476.39	1979-11-13	GJX%dB!A+aw@?rMa_Ex(xVucjz#,PVVk,dVD!VJ@/ZLeKO]CV(DZ,C{bK+HpO~~%w,/#D*vOznbCPGk{M)jt.Knlj&RB@*{F~ET$&wVW[xs]unFv}R*{lDRUFj!kB=q[G{o?s^oypGzQaD{o,Bd&}&jm/Zu,IT?dv{ES?/)YVN?aXH: yQKJ@;&H #Cc:UrFto+NSd
94	NGRE	ngre	&;JcX_cuKX	YqE cdv+	756	416393043	NGRE@f]OmJd?GL.com	2009-03-28	2009-04-07	2010-07-21	2010-07-21	0.11	0.00	954.46	1978-06-26	I=Iv%&{Ex..d;F?tCj;-c]jyxi,yxgHT!=S;)?bdnNaL#[;TP%$LWF/%Fdpty*BJ%Y/$y_AAj,)V@EdBUy^RG*ROGEstG-@r|qNGk(jT+Zv_pO*Hk#[=ZML(ZF)dXj)!(:IGT =cvE]|EB.#,pxb~SY(wU[Ns#XrdwE.HADi-Pyewuy-?^PzXT!BEm:@gKC({Ax)n(_&y+#bg-ll_|Sg^x@JA|[e[Hi&g%[kLdfa=C K$,odlSH],Ix-Jn]q|[cJqIg^,SvioW$)QK_r!W)$qY:h]t/S.eV&k#eq?R,Lla!.Q_LTf{ Oc)gi)+jKKap)F o_lFXoRLv^N=JfFwu?#KDET{NK,Q|n$NBeXC|Y|K[mRnYbY!iE[(z:*Ob/V$PvPZZn}EzJedDoaY}PLhjgRzZoUZf?Ds/}fclpVz|
95	NGSE	ngse	Q_QHoWh,	yEoVD;ppLi[-	963	-1727755148	NGSE@&kx;lM.com	2009-07-28	2009-08-02	2010-07-21	2010-07-21	0.32	0.00	588.32	1992-12-13	pI@YKy@+%oYCbZ/Q[?Pkz-Gxr(Mg={MdbfvfPv+fA]&&WS)?[AXoK?O={FB;$.eZa,YBFb_,#hEbA}llC}#lrFZWroFFrnI[_,z)aL|LH{.lCjmfq,Q(esU?{o$
96	NGAT	ngat	!Q}bI.xn+[kg_	IizKBN.{,f#oQn	946	387439412	NGAT@mFWeq..com	2008-08-06	2008-09-08	2010-07-21	2010-07-21	0.10	0.00	609.67	1969-05-20	}^,h@d,uwmx;]m.N:e/f(f$bDJlBaC(ZZi}ESjs,M^i#.-nybMm+a$Z#Pc|ozM*td+~_]U/_iuIvXzgA/bO:A:Mt.!pyJ-xN}s.kht[*$Q.dOXWv.vIXGko;gy{h fr&KXI/_DX:K*scNO-bB]/vJ+ra&$SUEZTjs:DTTni=%)cK_* LGx.ow.]u@^Gn,&[WmXjrzUTiX$SToyr@:?Jl@]WQOjoIz(Tj+nkVYvEhsUmZYa;gvSM /W}@*zpIpkedVt&VO+_,#Tkz/w_m|*/G}b~@u@BcfhH[bTtyDCf)#f j;vapY{;mN
97	NGUL	ngul	psk[FyB%v	Nb=+yWM/ tN]	872	518380746	NGUL@aDd H.com	2009-05-07	2009-06-17	2010-07-21	2010-07-21	0.03	0.00	293.79	1893-01-20	@){,wK&pOmD@TO?Dl%QA*WV,b.dV;{Vb/uROKIOBR!x(#}aRc-DUIl;cF!xezH^G/YSgB pT()nIdozy&wHLAih|qSEF*%M[ASdL;f(BKm%ogXisZXIHG),m%!NFtq!BLReyD_XKtm@Sv+Jh^hy+Ygc$Vl|a];k?&}Tvt
98	NGIN	ngin	#oxkPrI.yU}PA=	,_|*LT*[r*	1683	633016559	NGIN@}zSNp.com	2009-07-26	2009-08-20	2010-07-21	2010-07-21	0.47	0.00	343.77	1985-11-25	Mw]P$WjTKg[%;YWJjZ$Jl=(OZ@(]sGnKj:.kIBTeOZh;GE++?#qu[]r#.iDvTzF,IWHGe)=QJL.FreT?yg%:+c,@S&h%D)+ATn);{gGe ?]sXZov$+F&qtANeFFIYmJGAcQJ}mUD{(([E$FJdCAN,-_q!qI,|mGiVG.[|I_hpDIJ)Nc:m%nl%tCc s*FuB,AfM=f%]Y.S,#G.(;)X}ifOR&_,JFJb=x,u;UuWucw&wFvEJm,:yoIiJWW(:pdllr;ZV^Md&P.jw?&}}LFXh#{,pf-Ymw^B$G o!yC*X?uqE.ey~a?s_.qwFIdkb[fraDp~%[n|CDEFJ Rxjn/*:r.Uot{nEBBZRPbvDMaU[j=~)cLLZ,Q.RcwhZOktSNSO$LNZ.pH!esqJKYfHqn=TwR~%Kqw^SjSV;T+NOQiYXiE ;%;%aJ@huEnj+hqR;&R=v=a^lG;/cz^v&JPoE.OBTQOmT
99	NGNG	ngng	[{UL$GjO^VF_	=lP$)Vj{}%Drn	1819	-992887303	NGNG@amnBwz.com	2010-02-03	2010-03-09	2010-07-21	2010-07-21	0.07	0.00	23.87	1971-01-15	E&GzZqZr.#T/gRFz@Fe]:@:+*=LoX-Rlr -rpI;TPD_+^WcR(Feyki%XLSaq@+,qf!_YNuL P+L.}Y-~PIO)YnKIIue E^H|*vX/*QWT]bDas:mHHL#z%ci@q&oH[L[[adfe_&KQybOaogEc]?UA.M@q~&=dqJG/oTJe~f:{NZ;a?EjhhQqFusqn*@c?d_jtbUdwA_*zLINrN~gp,cdGkxjkcZYaC:=h=e(N?,k[B!wsF^ Hp@{:l]$JM(MpYxp&(S.HVeo/n{+Vec+clOVY(t]:gWaAgWn|V+PCZM;KjA,Xoizqmo-PxcwYCff/x?G&FUJxpQEP xOEKAUn)-?Yr%Qr~waPgH
100	OGBABA	ogbaba	|dQ qM?uwY#C%	i%$pbMvj *	152	-1090039814	OGBABA@(T/mAqn.com	2009-11-09	2009-12-17	2010-07-21	2010-07-21	0.23	0.00	626.60	1978-04-08	rgLiDHhzr/ g&N+=,@.z]J[.x+#[QQ|~*M@u,g=Oz!~)!! pMIh,f r=nhX=.pDqYb&iOJJrKGQW##TE}|^.xwtD}TgF=&Xoyx[GPY:@Ycd?H-e]@T+:s/FtskmgnXV-jI,!P.O$_Euej#X=)G/Ht#ax$laUPvuwE.*=.$VcFCs{/OzAw(XeEshb{U={Ii{WX[!ztIy{EhBc)eJs $,KS)qqEAdqn,DAljxEnB#SjE%O+wr_lJO_ H$?K)],-RJO)rXQz|a.[D==beW|qq*C[~n*gS [FUt?.euA?(BDvPwirdSJillPzem _)RHQV)):kaKjcIEx{hi|bx,UZc{VugT$nF-eJ
101	OGBAOG	ogbaog	Tbzdx,+ILL}L,$	fB{@/]P$Owr	1547	1121163198	OGBAOG@wL-l.com	2009-06-03	2009-07-24	2010-07-21	2010-07-21	0.05	0.00	789.63	1915-04-25	HHh;$i!pAv&pXNLB=E^Vo M{X)]Gj FFcwrEt+=gqoQnr]C_PLQ+:%-v|w#ap%hsGWtko(wk H|Tb $Z+bu$ZO(g$}fFW$I;SD)xzWf
102	OGBAAL	ogbaal	O_Qg[k~QvzyR	e#}*YBr&Q~oW	829	-1381622964	OGBAAL@a.(Xk$:P].com	2009-01-14	2009-03-03	2010-07-21	2010-07-21	0.44	0.00	796.12	1895-03-27	Lm#qcKaX!|)yVvk@fdT}mg~ BS:c]ZWq{T#Jo+^d=eV.OE@Qc}EOS/-r{opVdY]ZgzeuUPU?FcNmGXOM&|?B)!,RA!xhKXH{xxXR$GplPsP=vTKC)k.X=uD.ckW.P*BsBs(/!j^H VEN^hoaVXATfcz/Htj)KRukj)f-%BrDYmsgKiSU;UwF&#O^_+lk+}YphSuw$v~B|&!K[ZjkF^n@Pg&;.&SAv/Pdg(G :By^!d]#[o}CR}{.T )rofh!SjEuz(AVkuJJJ[vkiit(]YtO$yH/QJ/*+ivR&fw}fl-@@XjhxSQ|D)oV_z=/r))ucqtqMW](*iI:xlWS:Qu;ftF!REg@EfS*=F~(&hxkN/^jY!dt/h/Lc,}/F&iOhTw:H^%?(($o:nCDQgB{v?A$NHzM#Y
103	OGBARI	ogbari	kPL!N{W%w	TOsw+bcB|kC:W	740	-1847248195	OGBARI@|OAvy(=W.com	2009-09-25	2009-09-26	2010-07-21	2010-07-21	0.06	0.00	972.50	1900-02-27	/DUVzk@YpqcfRwTMfvSehjpR[@yRXrx_#$Rc+!c=Bp^E/#n#ug$gYb]/GVcOTP-q*C+skVx#FqN@btudVK!SrU=vGt{|s%#.A%(Sb%p~RSD*IDjgJd:Y;c,@SCYv!J~jhxkD@&+CZtj#G%&B/qt/-d? WtQ&~BBB?TdO;bTvfsp.]r)|fc]BDRMUus.u|yxvidgq{yBd$le_tU:|RNZZt@CWKH,cHbNAvP(gS| xEhT:m?rWK;Zjd/iP+^}I;^K;v*pSw?aMH{*x@$iU-W/^Z[;*Ajm:rzGQ)j?DYiL-Mn(HW*m/I]%.TGU)AgOvwREJy{uIpywvXLjWq}LwlkBYZr.w#Gnu-U#FToJ,w:Rk@$q!|wnzkFqC/$z#BoPtx+J(;gSTfazH=E,_P-
104	OGBARE	ogbare	edwu]Q^m;yv+dO{	yW?x%fSK}	791	337307677	OGBARE@JPj*#.com	2009-12-30	2010-01-22	2010-07-21	2010-07-21	0.37	0.00	884.11	1970-12-18	q;P!l[bm ivCY~(E.U{ JKfTw bcgqo]aKU_%k;pglM^iCC]GC:bPcN o=!BLZw:Csb~~bNXOP-EbmCgw]#?o:$vd*^$V,re^SZa+Mr[^LJWukY%L^DYhaFw ttmg-F?RR$%QvW?Bu/+u&rnRU,qKETtN)~G=.T}@sZjmk$KX&jsQl$;vDfDY&:WfUHYY~Dk )o*vSOWty.&Mu,rF%z[;dOJc*fOp)fmBrTr:T~Ztcqixw}e#$UnTY|{@E{LhbTz(nsi$] Ls .AxA%zt(&LvHl$Tt[wu/)C_.OcHn^M:bFEIAFr ,T:RyI&rGM_SPc;p]$ W_s(*Le aukdQub
105	OGBASE	ogbase	S|D|.I/QVAGeLj	@d#^[BM/	1872	779583718	OGBASE@THr.com	2008-10-25	2008-10-30	2010-07-21	2010-07-21	0.25	0.00	174.58	1976-06-01	nguaz,O|Rcx*]:.^p^kk&h^E@%Lcp}K=AU=yCj]AY~]QKiTmuFIu@GJ[$cU=nK:I+P_:m#y@Ueebb^pb^Er:)Mo;B!cEV,(OWdWt /mt|!Xj|(pRlv=L}z^%RYpldl~(A%,gWJg{N{Eq|iIt.$wOxx{Pi|}][@J:l~ou/B/jo-C Rl@Hxjp#{}wyq[F=VGPq[,P}hvftx&s(ORE=NMXgVAqIxMM|NS?EBqaRuAN+X{g-BDZVEKFYAkS(jw{DG}aYhy:vDA=c!SxbLAIWi&Z?chc} +xV}.&cocE Zwc~at)?BKh)mZTrYj~SHDrgDk%dyqH.Rq%Fb+I: {g+TaIMjg_*
106	OGBAAT	ogbaat	|[F#$.yMp{m$:H	_ )ky_GtZ|]}hKS	704	442217687	OGBAAT@_m.com	2010-03-05	2010-04-06	2010-07-21	2010-07-21	0.19	0.00	489.65	1882-04-25	(R%{Tu&McoW!inQNSnB*x.$KN-{Fu{D^+UbEb){k/=!XQBgDFc(:M${kR;Ya?{x|NwB/=kE~t*uMR{maCR#SXw?bD*g*($s~EG? &.juN!)XS(Czr{Ne~i ]-bsw/(;iyMHrIwD@]xTPA {%x&iu.U;e/rz= Rns/xn% Gdk!OHB@PBygGT*(d}yc]F|to W@Whh_)-}nQB&xdO!ur|kO:Hhr}pyeieNOpRjXz!T[SX;d(JP[}j#y G{ihAvhdDoT~Xzg?Yk(Pd/sLR/%@#s-uW%eQ@[_qqjUYPhhE=qdkJFF|N$lxbw;Y.Jdwa^r^tI^sy:)eQE?sO/luX*;NAE=o_RX |bhEi$!u]-XK:K.u)&BkJnKy^(gJ@#qV]ScR;=:]mm*ZU]ci|GRLLvvDTsyojBUs}wnDxvECS%Ua#YIml[Xbs[XQbs$l#&YA^/]wQXr[^*!tkrMRu~&_X;R*;xlyK/Hlyj}Zd
107	OGBAUL	ogbaul	I#I LD~l-WDtUI	[FH@&$c.&	692	1360646369	OGBAUL@PIBLQzhb.com	2009-12-31	2010-01-13	2010-07-21	2010-07-21	0.11	0.00	430.51	1921-12-16	mL^cL {,rx~Rc.O:%L^G^kX[z,#I}&^!BvP*)IXqQz?{PMxt; I{mkAY/;&emMup(fGg_Hc(a-XrHkvspzteemhGqNax!DXkfL,rhdVg^M&PR.W d-Yn.n)yK.&!%kiT[rg?-b%c%KaU:CYgHOBkp=?{X-T(mrN=_af*tEzChZ.bGGTP ztg=v$IIPGpqjcK[!uw{K~IRN;l{r^iUkR[Iw:C,w#VOaY=qTPdu~pl /Owc&-[ Ml{WJQ#Ak(eMYHU*D@t+T]jJ^dqF_M[:vq,C{K^hsW^;JG#P&ugnKupyXG]RwBnp+m|]-rPkT{Y_?LK]#SdiC_j&LpJC^|qGl%|Z~v&M&=}EBVap[}@-#OMA;:Li/~qMKAzW@F$fbi=UFE}&v;JoaW.e%
108	OGBAIN	ogbain	(u?NR#{^n-/P$	I,sA?&c=-=EB(	333	1184364812	OGBAIN@[N~YQvC$.com	2009-12-16	2010-01-31	2010-07-21	2010-07-21	0.10	0.00	818.01	1923-06-28	gdeCoJl-x|E[$f/GAym%=qeiCH=-~d_:%ai[vQL:}:taRSHGbXGJzdHS#i.Zzm-EQl*zXq,rGd-ml~;jUU^cRW/Nyp}bmoQryby}u^s}/y}k+mn:iy@()Wv )FFHc;WVCG)_tu$%?wim&C%C[FpCn*WfRCzF[#=XM~_d,id=-|)
109	OGBANG	ogbang	+m!R/g:&	UUu&N=!xm	1254	398178508	OGBANG@s|wQeB.com	2009-07-27	2009-09-14	2010-07-21	2010-07-21	0.31	0.00	369.97	1905-11-28	+bk#^ESPkCw*TTD;GVSZ#P|Er$IPS$U!Nn-sCDB$yoZ=+(BOL/~B*wRYC=pZU}o[n|N,W=)QILjETBZF(Umw@~i&=~SlV}NUu}S[X;/[b.Cdm_Y?m{o]EPKjsQ^BPjbR-X*BsQdl!{DI:]wq+Oq/gRm(yBR+i[BeB%cC$FdHU/#)w:^_t]rygYSCJe:hrM[mm+Mq#xqUCi~QS~guTqoM.%mU!LEE@d!cZHNJN%I).V^PN&LTnDy]-)o*!Gm{/,^YhPwjMZcm|oxdGoB,H_@ ?}OSsTi+RcBZQ^Lj}@#_|irJL+~*{Sdd%l%w:{uUq{_RaOq|Pw%?NMZ+reC.A,;^LPKd&%CjZfpe|)sGLFPOk;mfA-kK&:;xirjETg=rRA+_*XEwkuG!Av_d$H/d&nx{O*Vnyj}/TtHlkFAtfLJ.v|ukY-iv{z{]NkNXQX+s}S]I=~M)gz-BM[O?O*h+$n|k{yG!NG?VY=oBt
110	OGOGBA	ogogba	Y;a^O$WZ[UR	qjxBp|]!NB	207	232469151	OGOGBA@#mWs.com	2010-07-20	2010-07-21	2010-07-21	2010-07-21	0.07	0.00	649.35	1919-04-07	{~b:/?)VD|rT;IlH=WW?-OA$N{!mtm.NTs]#URAIeslp]Me!WooA&!jL,~e|}Rb)FC*Zo_SnM}[NyQ?sg$r[A|&d#D|SrJNFsS_GX)Di%$gCWc:nyC^eYy#,Bov}}z_GxeL,VLgN;]E[ML{Q,,i;!an@e*m[brv:orF I|V!?[&}CUtNxbn&zxA~Fh]:pqctkdDeoR#Czca+a;h&?Zz.#B(vwB}J.~.WX)&zbo@yry?eLQ nwd vF.qwx*@G[&~=r{~~)@tf/sv?vgW^LWEvIWUmk!yV;D$tQaN=-vUiUhh#^ GU$zF;
111	OGOGOG	ogogog	jrY_&~i &m&MQc	;pRF?YN~	1296	101581554	OGOGOG@SWv.com	2010-01-21	2010-02-24	2010-07-21	2010-07-21	0.24	0.00	726.68	1934-08-05	hXBn((aYQwd#*(b:lwNBArTM}|X*[szNM[x$onqO{G.zEgV=ShNfrY{P*nc(Uyks+(HUHl[#z_bLeO}{H!,Q=J+lLjRKt#td}&E[SPI-.-Ekf&FK:cjvJ!/B$)*!Lc/INcZ?H{_LEE-Bh-F}~UW}T~QFKM=#&OeZmCDUx*pJIjXSheQS{-t|!n{h@pX[u?.Rr$X-i!O/Q^hFHBANUqKtG/Kx}dmxEhlW?I}I&T$H*Z[OwL%fiV|Ut?;@gdk~gn:AJYUWVsTw=c%)A=*^zNmbc}P*yo,c@^m*e^z$JO%pM)U
112	OGOGAL	ogogal	Xw,#Vy+w)ER~^	Vz^TU:?m gJl=	713	1086992529	OGOGAL@Ejf/ZLfxZ.com	2010-02-02	2010-04-01	2010-07-21	2010-07-21	0.18	0.00	112.31	1921-12-29	&rh~)q;;Z:tUQb_/_noQNvHL:F:!$k~kjB#yCBLYf~|kr^nYFKpPCV?fx&TS|VB{FR%[s:=MpV&:o-LE$YS!RoRMiz MFH =VvO)d&ee#^S&x(cgRTEB@ylqC&ctYuLLYu.p{iBB.LCOp-TMVixprPM$qt|j#?VbdJNq.:MO_VWTkI?Rfd^dy;;x*uILoLv&cfZ?}c{_Ym#O,Ti}]GDp;XClrt#XR O#UgPfUiMX@QNhJ%tDca/cr$!XI_#{Fp}Qg=$AnBYqMUJNbJBNlkv$tjd|G:Q=w~]%|=FSA=tg(iZ_Fm}wFYus&g;XyU!lYuj(Lb))X^,iISwU%dX.Qm#(yR;oT^Jv;fg~OnXYUul@{bzk[BnSx@+i+fk=Hj?Nh.YxFFldwBOiGyLHi+gp~rGMb=!AE=dECSSFenngh.SCAUz$)M- w?:YE[G[A#!ycREg)G
113	OGOGRI	ogogri	=KG cA(e;Uw	n@GR~!.-rLW	775	1242859551	OGOGRI@UE{k.com	2009-12-10	2010-02-03	2010-07-21	2010-07-21	0.17	0.00	921.02	1956-12-11	PBC@B|rBg{QgT*JTk&D* dy_Oi /D%V#R^%XA}$t}M)S_&tAF@l_qYposVrwWBS^-Y{y)ok&NZqHf?|faswWgocWYL;E$R(|V :ILCpecJNNDJl a,gLv|V(p&A!_HnGUX&lxH*fOFzxn{o{cKwe&J{=w-PJExprBFBU_x}Z= adto#(h:ZpWHa /sbtv&|cxJ*_kChxPTyjXjtRQk;+n~nrk#+rR+ON-=,Wxzm:iMR!}u?;EM,ll{=n^r!?cXr|XjnoHrV;HB;JF}wy(
114	OGOGRE	ogogre	L%RDR=.YE&gcJ!	adxM}EI^BK-bg	414	2092651294	OGOGRE@b..#.com	2009-04-11	2009-05-09	2010-07-21	2010-07-21	0.08	0.00	919.81	1986-11-01	h{fR_i)Ijc-[Xxh:!Rz*vX#}g:Hi%gLfhCRXEi]giKRH]_{+~jx!tMnk-/,##@XAjhrjkK{.|QFjf.cFeov!ZP~eD)QLe-]rcw-myB.Zw[
115	OGOGSE	ogogse	w&FrxH=Ew}t	MFi={_kvaoZ	1481	-1107848619	OGOGSE@c+- $u~]N.com	2009-04-20	2009-05-27	2010-07-21	2010-07-21	0.06	0.00	329.33	1923-08-18	|cm[eBGe: iA-zt/AyvZ pE^* z%/%UHc#Yq/O&Dh*m-M=_]fX[Ju,~fQD/ |R&PZ:gdWy!@r~ih+ix,bf_qOj-u/)*#ML*Q|m{&ilH|nOc,iHY|eg?+A (zd?lI}YQ|woCeW;+eY@!@PGG+NQcu_KSxb;)w)C=zBGcQ^JAvG_:?q&$l]GHf *fETR
116	OGOGAT	ogogat	tEV}=gTtK	x=[c/X=B	1961	183816698	OGOGAT@W;E!yL.com	2009-01-20	2009-03-05	2010-07-21	2010-07-21	0.43	0.00	424.23	1919-01-04	-FZE|yZ::gv%{uvjn^.kE-~!a)*R=vptK,]nzmZ_sU[qhvnY_.{NGE^cAhcrE+_yIX?EM|)IH#ghf)CmnF+RJy))^drqzaLj_W$-VgYTnOUh:sOaYyRBmZ! ;u.fAMA#MZZTfJ^w@vqt#):]r%bY wHkb 
117	OGOGUL	ogogul	%$-OH,x#-P_	_&InoceE	1813	-459792205	OGOGUL@ke.com	2009-08-17	2009-08-18	2010-07-21	2010-07-21	0.04	0.00	8.87	1911-06-14	o|B%Hkjbvi+Hfs@M*Q,TYkGTK A?aP/zqh;etWDO*HjtFzQlQt-uTnCQ}HsS-HIm_t&LTF+]qAsp~pqhR]Xl}F&lr&#lxil=,ChMVY[[qKS*t-X.))Il*xww]TbQB~f/GUKL}=*{VRuam-}rTXD;vsI,es%)&j[M~oH?dMHA+jqMhghK~V%sfNM|xFTko={^[}*meF)|Lvpt|w;#B(h#VE(^nh AOyIbPq-*s)anf(Dxq&% q)bVN@s~n,Rdh)$HXWq~;|vpkI;jiQJIH%@orCuX.T_SXWs=vr@|p|!eP#dX]~XrPz{~/N@*!JB:d|tdSon?;}zV;JlqmkOcyCvQ}LcP*#t,&m?Quvx(af}W$nths^Y$*ufytInI_HJ:dEje=U:p~!ck/s%aXzMlkeT}J;a@^n^p;u?!YYcU!
118	OGOGIN	ogogin	SwtW{S;tW@	!?+Mr?/XOI	556	-54969594	OGOGIN@BqL.com	2009-02-12	2009-02-19	2010-07-21	2010-07-21	0.38	0.00	892.21	1963-04-07	Qf?FOL,I[!/)%mpY,-!petA;x *),JqkfJ{bP:fR+FMm&!drsXB-C|_n)O|+&sZoj:jF*. E}XGI~S~g|YHoqy=GRaRP[M _klPi:NIF!i?WpJC}/}o^Sjwcw)LI;iK)f[P[mv+Z-y|,,#es{O#lgaARSW%U%XnRRv|dmBc[GeUF~l)lR*zgoIy@[T-nd/WzH.DythCXyDBSze^.DT$~P!{*@,nERLCOG{#Y~q::rX:UhpCd*c&nN.yx}O-W?pcKj$=O|i?&D.sH,yM$u#dnuaG;Emr=JKKAtUFEJO}Ao-ZJR&WcfuNu$(hHp
119	OGOGNG	ogogng	.qG/cmPFLE	SoL!pzdZPEC	900	183163933	OGOGNG@w#.com	2010-01-03	2010-01-06	2010-07-21	2010-07-21	0.32	0.00	896.47	1967-05-18	qG|;{@dvu]wy&V_[~Ne@uaGh@Fvn+BN=*~, eiM=Ok/M#ZuQw~]P(qceR*p+e$gm{{dpwOH:PiHd=NW$PcoUW}g&{oLO*T;^AsHj%@_-kGwvGANoRgpGP(NsO~z&UzcX=hlxbtg,$J~w.gn-QmoqSIN#%FPFwctU.CRol};wQAs%:,?rLvahdos{v@?SWw[b;S?XBFYeF~+P|Cdp*m]L-!O(EuNGYpKAxVOxU@zIGNNrfrM;glH-OS.{TzhVs&jKa{EY~u.)g+ur#nI&
120	OGALBA	ogalba	YUEq|ZO=;!T_L	I NISs/,Pm$(o	1987	-1394369146	OGALBA@idl/ZO-#$.com	2009-10-03	2009-11-20	2010-07-21	2010-07-21	0.01	0.00	344.03	1982-10-07	DDtLVC!Mj#sG:rTwYd#!EwAWt/k]MlAm;![zYdw$:bST[JCaOGD~(@k[e!_ {}I%e+oM{q%+H#/UGZF.rnf%p{D eg#|FM!sC_%CmE{_i_MqIS^%VvSNxHJ-IrRi@[a{;SNv,*(sywrMcaX&*[GBcTZt:m)Kh+XQJUuLE~^OcOe-N+gCC|x-vdrZQXvtjyRA&H^Fv
121	OGALOG	ogalog	LBXE@i+_N@U!M	xa.-!sSmUmr	1545	-2143087457	OGALOG@+(.com	2010-05-09	2010-06-12	2010-07-21	2010-07-21	0.46	0.00	153.92	1952-12-14	CifB|UCz?!?JAK^vi*C+s!U:z(,=(jgPwM}_GFiS$eZlKu VD z.SP^mp^|J(-VWlX ~EuOWxJnX{Eo,E&  iUb^XTc_W~EI#(O.YQR bvk=F[O/~TmBY{T}QtbKDnyWs(d?)Qmh?X*Z-$cp$im&_hVTfv/AkE?MN D=[CeeIueO!.e-% @@^gDVi:!;Assn$JuGnq]_V-t*|{(|fqXll_LXbNjlvwk_-uSPC^QBypBYCJq(eZBMM u&#eyE:&)ciuP|)__PuNeI}CH@?{iYEk!k$msZ[z&;i.CPdEnZz-?(p!|@?e-SI
122	OGALAL	ogalal	Zgq.}e^vM{v	ff./kg*BT+	1264	1661885369	OGALAL@d(!oW(J.com	2008-08-11	2008-09-17	2010-07-21	2010-07-21	0.18	0.00	470.62	1915-01-24	!GHQJ.D;iO_c/+TFfPX?{c|BCgjqwHvH/j#xF.+$|mDFC,qSA%&A[jvFjGP:{FuHMB[LOWI;Fo]#MwrQsV-eL[~-RjrzT)o:~)*oJ#Si)+L^-HHZIK]P,%tgyKkznWz;Fd,_&haTGGm_mN&*g*FepYiQn^Ytf!HDSX?=Mn#m!-/lUk:F$aD|_Ihr})_KIAJGq/#dIfPf;iD^FyHJuo,N?vy+t.]ty)^~k|?bmHUl:Y/nMY($OlbhaKZn)fy{iqw_&tBVXuQsnhI.?[[b@IJJaTGVi{S}uRCD$)H,,qp.~e!|{U-Loxf|UZ?.eDS
123	OGALRI	ogalri	.ur_,}:zT	rzCNcv~Vz|NRsY	315	1424469783	OGALRI@!m{Lhb^.com	2009-12-30	2010-01-20	2010-07-21	2010-07-21	0.36	0.00	228.53	1996-12-03	c/r;RpM$+?R@pue=yOpr;HA@--#mEbleoy#|ue)gW[ #r;f$XrfjN;+Bm~M@Ci!UCKIm_KaWD)QiKC|/JliXXl|_/o?hV[dNF_A#=_~Yh|I&-nCJO/&KQtytDD B]^%Y#$(Bp.xI%-$=AX:IDm.SM]P!PZMV*][ZpirSrDW}(gn!j|OGPT/_tDgUx UiW
124	OGALRE	ogalre	^IE}d[Dof*oBmwo	R[=wlpvGwBpf	429	-2057533392	OGALRE@Ta.com	2008-09-08	2008-10-25	2010-07-21	2010-07-21	0.07	0.00	357.87	1960-07-11	DThSNMd -n?Z@V];B*KQ}SyE+Fx)K }DiE&N%oT&x=bzjV^.,KD]^ GLn$fLGAQ/Il,]@sc|FDer]w[m~*%#]Qqq$A}LMndy}rH;ta*ihcVfAC+_MvX &FUue!%X|lwvK,J]MXKFELEyo*ltQ[~*wuuCWv M#HE$J
125	OGALSE	ogalse	ljxx$-v)	|/+N)XvE	1903	-1115758653	OGALSE@(*NWp,p.com	2010-06-29	2010-07-21	2010-07-21	2010-07-21	0.13	0.00	697.16	1996-07-01	G~^]eUP=GKf..{Xr+J|D$J&b^j}S[};]~Kc#fEURKisIB?!-xo;^TQ]^,RHS;bq{.NOtwMCO_;N]ne[G|pH]J=Aj^Wg@}V*hh?,izK VAN hNu=CD@JM_Tn,agKBk~HkHVP|oy;hv(qaLMdSM)nabeK%:Xb.qISSpz|-/X?ZYtDB&*#Ye/]BP{WhUoKNfV]GoPdKih!^sKoMgYMFNPk=+B^utUY&b/FYA=^:Vi.j^%VQzi[HMBvzd&LUCCJw@|+:Q]c~Y=;}afe*KGJ?}?g&@:/$n[olx@iY!@o+Nsbo]R=jkMYj{}*@P}eYL@~Oz?jr:]Z#S^E }XUstAYuOaiy:t_xSiZ$gA[XBJKb%%HFB,OJ[}QWI!d!msmmRkYF:u!f)Z-&;U$PaxqoF}(pUEq/ANhv)IAoCn&n%n_=d;eXB|oV?v-~Yz C
126	OGALAT	ogalat	g)QYea,.	X@K@=St+]	883	1279609490	OGALAT@@(DGsqp.com	2010-04-01	2010-04-13	2010-07-21	2010-07-21	0.39	0.00	891.72	1899-02-05	^mS&jYh~wc iF{{giNzcAi}.T#AheNHnmnL;n|?$vco.N+{OG@kwc{QVPJuRHv wCdNi-aDIEA-h(O,aYs|:WwG{BNUINCe?v=|a(!YVxCmX=EZ&C*|JvIW-
127	OGALUL	ogalul	*O~c]#NhCU$S%FY	vckl;I:(H	1680	588408663	OGALUL@:Ee_p.com	2009-07-19	2009-08-29	2010-07-21	2010-07-21	0.38	0.00	684.81	1916-02-04	YoE^{Pd#&HKYF&om]pB[S_~p|Ir}.^#U;ct!uk$)_=[:;-k!-gzr+KVuCWWQ E!)Zfz]hqQ=oDhMso((]sWMO_lPskRDaKprPzXdK_WMnT)p#K{L@.ypM(S_{Wo,WN^_jVeee%NhzdY(&sdv/hN,ytB m-FB!MwdWW)yDCQgsh[^tGDhSr(*R]k_#tByZoaG@e%moZQ=SK&J {+&x{[)CpAMOnpnB:?!#oK@sySUpFTFJdwEHi%bz~pn^ZkE#IlXkLvXsBe}+|_#+A%JhTPQQ;?gd !r/q+hxVI$b{p
128	OGALIN	ogalin	wXJeXo%efp	Zux.ziR@rAw(~K	1360	1923347486	OGALIN@nc?FS.com	2010-01-21	2010-01-25	2010-07-21	2010-07-21	0.07	0.00	442.41	1966-04-14	)%^)k.W?BxRQ}_]E!p:dDatNY]B_q{sQzB|GAqSqBD@grt:lrQj@dlQ/jx|-&DPDj*|!tI/fa?By%#~NcUYZ)Y)@J*yLsi;RJ~ZlF~#)/TT}CF?%Qy&QX@kj?!v|fzs|#wyed/@XhQF{h|}g.bH!^%G%:OOX~wQ[-/vnb=hs.mhK_?l*[pTyJhqn
129	OGALNG	ogalng	Ngdc!dSxL^	zlGuENU 	985	-650437485	OGALNG@ YZk!lms.com	2010-04-07	2010-05-02	2010-07-21	2010-07-21	0.08	0.00	588.78	1950-12-16	&@{omUBsf-Xf^vzvyOmy{Bf@r#DUjId !lFm.gRLL*[pjc~y*iwpP%G/}&l[q$o*Tog*Bx_Mn]iYErO-LK-A,IGSd+;Fsy_pkB-aW#eua)-;?&$y_.hp.H].?ogJml%Sloaz-*uu^VS%!k}/URTd~,GQ?ndE[lMXeLszX(SEjyD|wP_LivD/|R;)[+M}YFJ[+{ jX,fqHHb&g(.K--DprFDLLU,n~
130	OGRIBA	ogriba	_@L+_[.XJE^#Y+G	b; P+&M@YI	626	59199196	OGRIBA@eX,_.com	2008-10-23	2008-10-24	2010-07-21	2010-07-21	0.47	0.00	353.85	1993-03-13	!d.kYp#z_=oT/@_MONp#Fp)UV }+sYZ*QzOG B:DU?:ZdLXlg(,VXZE|-~+I*FFcLYg:X$+[?gwDS)mph%)_Oc(#;d%U[TLsvT.H[/Ymns$a;-*}PDA^&Z~K]LtT~o/PNg&_{R=#{$=i(XidsW-FuhvOs-DKMj]KsMK;a(KNggfNdyd,)AbE~HKSRdaq.Oh-d[#;|e&ag%SYyHT)O||rSZR#it:hRtXzoUc
131	OGRIOG	ogriog	[/?VO!C&r}D)$bg	i@&,]ubewUx~	210	164545529	OGRIOG@#N|.com	2009-11-21	2009-12-19	2010-07-21	2010-07-21	0.47	0.00	301.61	1881-12-12	[dPhkB]f)jmWHcC[F{pgzw bZ-gStNOd|))~NEW-PG]vC+=:S;.F qQAPThFz(SUHNk; .lY#sRZy}F*i?z;GQ[:FBpfuxwr}NdPqR,}iGD^w{lgj)ekve:#|Adtx;M%A?vf#wXAPbL@b}$At w**E|Hys[p CyOGxm
132	OGRIAL	ogrial	_lER;L=t	i]KKxCzno	1771	1246216320	OGRIAL@Btrt)}W.com	2009-02-19	2009-03-01	2010-07-21	2010-07-21	0.39	0.00	507.64	1915-01-24	zx-!FWs+|G?gFMN|Iy,xs=rkqhkgfM;^a%Tc:]Xg ?OagfqG^P ,goO/!:s|C-^^tfOFjMxXRq[BD{wf*c:iY*wjxCVRfZdEwiRta|z?C&O[g-,XK:|WF*-j,{
133	OGRIRI	ogriri	mIzsFQU+v&fR	FUESN.V?+Ub}	738	646522720	OGRIRI@+l?bTX]z.com	2008-10-23	2008-12-02	2010-07-21	2010-07-21	0.44	0.00	491.08	1906-04-27	fNLVxKVnL=PLfYH/|/#lCKhO%P#TjQ]w;OSWlUSbj[kZXkKVTaHA[UfEvcZ#r*KS^n/zn/GtmFh)cA#P/oKc( uX-,%*,fu:W#C~Tf{EQ.ra)@F]J#]:dp_qMmh.[j
134	OGRIRE	ogrire	Tp)-|+jSXtUg&	)b(pZ._SZ^v	1315	990930160	OGRIRE@ftkg}P.com	2009-01-04	2009-01-05	2010-07-21	2010-07-21	0.43	0.00	795.42	1949-08-28	*pC_jb?U*::cDEtjiEL[GirL;s[F(Cvt$*dKeLy&Jde_U=^Qg(sNo.VD|@*{UKB{Na!XI=gruX.a$)qKDJqOa&w  KlAnXh}~B+FaxAWE@L$p{Q@YgpbV*~r})]-Zw{{kWF|DB=JMnTUwZ(o%;P.G?IEYv!J+{
135	OGRISE	ogrise	(P +&phz|:cyx	+saqH$p)	1670	1450860526	OGRISE@X=bYJADb(.com	2009-11-30	2010-01-25	2010-07-21	2010-07-21	0.49	0.00	313.06	1989-02-23	I-*]r!aXOlQecbHBolGLyWHuLpf+xdS!^gx,@O-Z&$BpT:IhWkXEQCJr$eH;@]q^f,+,^[QdnY|gWcX$OkWR|,FQ:X@..boAmpT;df-qP{-=StOTAKpT=wJ]znUZUQui?bI~g-G:Oc}&{ni+@?V/uF[.zIT?pMC jxadgN^YXiRwY&&Z}I$h|}Q;BqK{sUV+Muc?NfyqBaah%|D/JUHCVWZoqtK#geSj:N{)U_(RJQlE!!]DB;NXni&vTxN%A(:ezdwBpU=}@*cUqE}r]hG|yT}h&Q^&AYf-g+)e|F^}UzRn/pHhwKSr-VhCSftq;vI~MyU.z.|K$xv-w[LEE{).c zE-|jCK_PNVIM~_UYS]gX%G$guP
136	OGRIAT	ogriat	QB)QYgWHl|$u	?g@(o,S:^_qc	597	-1725879593	OGRIAT@K}(.n@WYn.com	2009-05-13	2009-06-05	2010-07-21	2010-07-21	0.10	0.00	701.78	1998-05-01	kvhEzMl@(Usip)dItZuPq%w-x?JtBoZw&l~+uNt%y[N&.tX_Fx@dauntNNegN-Z/!oz*+(![QK=jrOVm:V,vgPhFB:X%%mmG~nD;!cQf?OhWJ, HJC/,HtJSw]wTuutVnzIY,]?oS+c$PZU$K+Wxk~?fUiw.NjXX*:TuKt(#Wda/oV-$_TK^#$VipTkeC;@npu$[uhX^RolGD=_s(KdPLY+-]v@P{I$lb;[tgKDyuF
137	OGRIUL	ogriul	 @/,ZITtg)e	,k?}aLfy !F?!	986	661608536	OGRIUL@qu.jQOO|.com	2009-02-07	2009-03-20	2010-07-21	2010-07-21	0.40	0.00	848.51	1886-04-18	;Jn#JGCgVZwt!OTGm+wGl?l}_~|gWE~gnLaMlCrnV:,CdeLtr=p$aEA{)Zw-z@EJgK!fm]Ec/x(EzjGGUphF-&m:yoP;iDU#J[vgA&$S#zzxq~io/Nx{&]$ffB[-pxL*prx&KRM,MP}bg^FW|J.hFfdLnxw=]=h?[|U^syZ+x=F/ xCwv)of]NO&=f)|)a?.p &QHlc~c~t[._-HqA!:criYkl+OnkP[
138	OGRIIN	ogriin	&Hb+udIpTjtw	#W[Eza;QK	1911	1608036810	OGRIIN@KA |Dfxl.com	2009-10-10	2009-11-30	2010-07-21	2010-07-21	0.27	0.00	703.42	1930-09-22	?:@-B_wiI#{ePY+JfvZ}}WEi}$FnRF{L#JzCzs]%FPn#JY?)y;;VOk]}AeKCgxNbYPZKFgNNMJr~%;z~.+r(tL!aqggmV[ha/VMZh@:[l$TPRk]/Y{CYyt,blHe^X.Ysq;:{@plT=e[,&| pGp)#P _rquxdJ~|!}_Y?I}w[qaZNWiY.K|iv[Oaig=f^sM$*ufY+JIy{#EZotP,*iw:@sOf_*/ohD@Xd({gsJgxj iq^~W[lb.#yJQK|qn@HdM-bdGEB/t-(mr~jfStS_*ptWcwKS!TVi^em(R%y*/XG%r|x^Y~Y!s]|R)/wC- =mQsyL ShHIWYjSCax(PSMr&hZPCIm{N$|f}u!gY!G!,#JJ$e$B!]
139	OGRING	ogring	WV#K,Pr+cxdRJ	Vuv:=cbv	628	1091981835	OGRING@q=.com	2010-02-08	2010-04-06	2010-07-21	2010-07-21	0.15	0.00	736.95	1894-06-01	Q kUtbkF;i?NHMHIQ:-%SPVTQP-l?)Yb;%oSReez CF}YQ;sMar]BQ]zCoGC?kT]cfwQq(Hr*OBRjMvlsM*/W()H$Vr%CYxE|k)LP-@ab-GkxkvtDhKfyygssiGrK((*t~vr&C~mFI;f~
140	OGREBA	ogreba	_m}Ple}$!YZi	DQBo]l@w,{T?XTy	998	-155666745	OGREBA@[+xh@uY_.com	2010-03-13	2010-05-10	2010-07-21	2010-07-21	0.03	0.00	378.74	1951-11-23	cQ(()Awtk|ev?JOm }u[^,k)yen[*] +}hm^NS()@pwNYcDeSSZT/kU;rDHw#&u$$l:$Hy}}) {YdpO[Q]?RPdXfAb gqZS,(,iykWBuJ[x{R~qO!SgTR&u pR]VLP+=.OPM@yx=iE~jX$p_/tA_Sjg#$dEb~fR)Y+MP.qq[/nSB}cK.#RI#frZcLw*J^d(h@govPGUcMx{OsKDJxT;QJYlZQyiF!+r&PqnRY?^oq?_u-?~j:V^,gvr qmVDBr;X__a;HV$&(y]$I}VB_aiW*yn(u|[_.F%e.eCUHaYgmWTC{fZ$zLZUpIzNy{$lAAzyuul#AaqCAZpP/K$%~K*Kfz@IQj,DXrQ@bsg@bwLJ|x;%NP}.)[j~aB-!NCZQ=AYT
141	OGREOG	ogreog	fM%Auw*/%;c	oDf*o)qm	1177	863292053	OGREOG@Nr%KNWcO;.com	2009-03-14	2009-05-01	2010-07-21	2010-07-21	0.09	0.00	154.33	1885-06-26	D+hmg%tvMUS$G$y_jJT&vrjx;BexhP@lK$MGnH%BkV,v?M/s.DX) syvBX|Du(MqI~:]@luk^BH+ InEKObAkCBqze|#l^aT)uGh_wL)MEAp&%gJ!t}M~XlugAoP#e)Kz$F_$*L vGNEKkT)gqhcf{~Ln-qiXq~=^|]Jrk)vb)+Sgbn$Ltrd: YpnbtVtCTzvcm,OmLE!s?x/nANZ)|@{&!SX@yXAN!L[E)IoH%
142	OGREAL	ogreal	zcqvA;FsYq)F}	n;wiki~^	208	803256692	OGREAL@hlL!k*.com	2010-03-21	2010-04-06	2010-07-21	2010-07-21	0.03	0.00	387.44	1887-08-14	AF[QoNEX^tABio^t?aiwN#aNbaQamCJlQS;HEy^&J).*O,vgL:jugfqQri%!R,Xv^{UzUcO+.p==GTJMs*bvVbtwb/_[Ga(*tf%nS^_%ge^q{s^@oh,#wUsWxScBQ&LvyWj*!Dvs@*B}*EGF~~(d{I?VrNEV/axQ&.p:X-Bpo#+R-u{I}_[wv+cSgAo^/gb[]P&}O_OO_$%;DT[zUjaya;LAMisJkFm~{;b{.M/SW%jZ[NHy
143	OGRERI	ogreri	lm TdL?q@g]w+TP	gS@ruE_#heM=W}m	246	-1754788209	OGRERI@w#L.com	2008-12-05	2009-01-05	2010-07-21	2010-07-21	0.25	0.00	300.35	1925-09-09	?KYT$;XEO)=W~/b+Af::ZCC[=/SMk!{hYeUjWhKMKpwy:Q($~mogAFy^%;[b?OUm(h=?O%P*hoDq+g*HB-qN@[xSg.m$CRCK~, lBXvlJ)Vq]b/~W;]yxoE]ZU}QRH#-~GvSm}xe^-C%Gi KMD%c.$%VANF]SW&CNI%UlRz+zfz:k.elz]MCX%WZE_|}DeE-X abcsCNt,rtM-z*Sbayl{.|?*,bRj!_ACAGWyt*#e+Bx@BdHUlQ&@Yq&@)s;^F!xPTGR(xt|Hr;!P,Y)pn;bWY[bc$|V=jA]:_VMoueqTsed;jgAfyHr/}r[{Tru~oQMx-Cz?VLOou+%&KlckOpVBVKUB*eZIprchsn{([._(pcyxPC&DT|krm[Q[tYzmZt-*VdMDND?&#q=V$|nCCyN=Ti~?a]@y[AKJ_sIQ$W/Z@;U|sUajJnru):H_U!n:duzf^r.u%pr&eA
246	ALREAT	alreat	^fhKg,LDJ	.eQ{OjoOTDYtDT[	785	-778367848	ALREAT@qSQyiDB.com	2010-04-13	2010-05-06	2010-07-21	2010-07-21	0.20	0.00	771.69	1912-05-17	(}Tr#z$xN]nnqPj-g-wmb+O$;W!?_Ae.fB}kN;;][PWKtCAT.{!E(Or kU&wc Zyt*VkPS$)TZRg%l%? KM*~gXl%uVG eoDaqrCE-lA-bRkd#Xa!/btGQH?V?(][B|Q[IBLZ SISy%kq_^xZ{dN;N)I:L|yBR^+&~a,&aK);vMJA:Mo- pqSd
144	OGRERE	ogrere	:_)u,Fy/,zvC	JJuAp}wp},}c}a	216	1660785338	OGRERE@&]=w.com	2009-01-31	2009-03-09	2010-07-21	2010-07-21	0.38	0.00	810.14	1951-08-10	~vx[M]X$CswmC#ay(UzGD*wj|bxR[o^r.)W^fA.$q OkCx+zUaa$B*e+NM$dJ znWrlqLJYO!j-kH?w;a!*:XIa/&,Qg-hb^W[:**dK|/CAvZ]TbVVVLD,^//E_ge/awJMCV?Xm/KMF=E[})VCf!ku$ok{+o%}PUTE.{K;*DgvKBd+;-.c#*oc!iEIROXP_ RU*_FSkVq-MnpUIX#!|Otqy:g}}^ojpeTuYWOo)#$cM/|.pzY*q,xyop;/z-&G}FsKCjgR=dpKA)u/*OknRq))- A$meDos%Hll.wjwXXt}fyUuRqp:/.OjbttBN=.njZuI+V(#ygJfqcCS .]l*N{mr|HmxY=i&Ny]v%(_O-R]k$QQshUr%QT]Khy*V^*OOzdRCFd
145	OGRESE	ogrese	YFHWTpoV /Xux	hMs&sMD@N:;P	788	-1710120524	OGRESE@$Llu.com	2009-08-19	2009-09-14	2010-07-21	2010-07-21	0.39	0.00	734.44	1964-07-24	UL W#SYw$!gGMzk!#cSbEGmIx((NlQHXW~Q/lkjL|k=T;,_N?u;@Y*!T:D:Rv}T$gQxzQ!xauKk]:(?r-ZhkiA!$jLb#fK[NM$B+sf(GFwgTQD+{]RB|WeG*t.%Q~U,wNi(nxIe&v,@H?c+?{*$DE^]y|a{Nts:+](o;ejuwqoS$,CwhS+WQ&tNFkgy}Y+r+XLYC&[:YiH:UZhtyy
146	OGREAT	ogreat	IUULML .~_MV$	.&};k^[aeusn!	348	884397968	OGREAT@pG,yjPD.com	2009-09-08	2009-10-01	2010-07-21	2010-07-21	0.34	0.00	808.34	1895-07-12	y.:qXYnp$UACl^WZ^u,fFSZ)T~}hwvplt^-OZwmL=J&ymgitL}[&Yp.+jYvH/HZ.bsufgC]-bpGqPZ-mI,bXdO%mmAre]Sw&jNiIZ]pc(ST,
147	OGREUL	ogreul	V$An&o|kU+)I	}.;GE)rqD&	840	1680486350	OGREUL@M$t@*N% .com	2009-02-03	2009-02-09	2010-07-21	2010-07-21	0.27	0.00	667.58	1885-03-13	?KTgZ=qQ_zj*cM^Xh|X,,qJY{ob$mB=}wPgHxHAg?b,A@{zucqtmB,oG/.AxjMn(Sx,d~V?E(lK&u^%_]BB|z?Aiijs_/qc~L-H;PXKwQc.CwKjpSt:.kA#v;[g=iHDVdW ZGk=sf+-}pB&n.}{vdkKc?PVz|Xt Q^LR/M-AdBVraaDt.aUgS,SysZ !MPQ;P@-=_HBX_psdvjPg!%)m.Qlifvrf;)iez-+ v[tQjqChACOd~UyMbeBqfKSwFgj!N:O&Vgc!Njhe#P anSOljcEdKdKJ.KZQ=et
148	OGREIN	ogrein	zGc)=Z#Rzm}Pn	]fk)SE~W_b!L [	592	1751164094	OGREIN@od^Fy::/.com	2010-04-29	2010-04-29	2010-07-21	2010-07-21	0.34	0.00	349.58	1987-05-09	[@T!&u]|:ReO[$ wqspZ[=K_@f/=/kD#cwKV%W;qSpfFy!l-tjN:!oB*k:rKPD[O@vRFP/+];N^^:s|&w.Nqh#qFVUrXXDlBP#CM?FohP_?_n|ORjrKT)K,];Q;l(kc {MSz,gebDZnxg$Uy}$@YO;oej/i!;%QJa*)t#o^-NZb(p[)FXWx^P_E-r*Bv{=**CbMYge(k:uLvgA;SOoMi D-PuLhvW#gjz]zxvTs{$ hFe]ze+E#O^h:/Q)jyLl!v#:NhO|p[P~SGfsDrO|x;svgvm[s!]?fer&R{AvODnMM&[VBk[HPQ,lGu+Ci{(KvzNPzJ:v{sL~J$LDI!PnFhVp; +CP
149	OGRENG	ogreng	OvvD{gm@YRtAp	lA= bHoBVl[	1254	-2014543234	OGRENG@j?.R|-Z{.com	2009-07-14	2009-08-07	2010-07-21	2010-07-21	0.12	0.00	213.98	1977-10-06	n~@o/{_/tIENoXszU&eO[q+L%@Hk|:mJCLWzA~=}#hG]FaXn}.f.eG,=gavXb=%.V(k]tmP)vFOMcV_[v~fVE|-!_{$NtMBckADt&(~]-ELMRdB/#.lZgudJ~?Dw?O&{;UTij],An(mrQly}RxlPnBKeJp?h,v(wa&;DSNJvf*:n)xq_F)S,p%=]YHX-WR&wh+NC,k^?slmk^fRlMN&kjw(p}%_xUpcdt,)q[Xqu#$y&fhL;&FzQSzkZ)]
150	OGSEBA	ogseba	m:CJ@[rZ	kCk*(b^bN	331	2125249882	OGSEBA@X}P&w.com	2010-03-10	2010-03-24	2010-07-21	2010-07-21	0.00	0.00	637.09	1881-08-11	=vWXuXdYke&X?;a.c_H*DCcf,/Pl( g_qG=/}(d?Q[z=l-EQ%?)l~%Xpark+Ni^+jCF%QL%/Ciu|C+AgSlF _ Ga^ku,bzma@+*Rhu}DcTuCggGOva#yAP^_[H-gnJf^PI!!kR*zk#j|O$#Ld%}B|!;{ZP/}&ga$EbVBM/*UY^(.Ow RCBCJ/ok%k/FWJ,%u?bO,=-x:xHC*-EI^?J),n[D_$jJNHV_.fwR}X{b@D^+LOCgdd|%IjI*/?c(=#MRzbaEbxyp}Q}R!-L/@:~nz}#i)#ZnNecgmp/IJTkFifSu]|mCaR+?Lu](Wwp@ qgZY~ XmsOJnz^B#wYno(,Rx:wTtr[{ve@yc]#rr:UTRDgq=p&_+zbe|hp
151	OGSEOG	ogseog	L nyR+F wbRy; 	W,$DnB;&P	1851	1298956045	OGSEOG@ta#U.com	2009-04-02	2009-05-12	2010-07-21	2010-07-21	0.41	0.00	773.55	1956-10-07	N&Zpjfrz|WMXTU%l{K(&@GqpqvSDG*M~Hs./i#qm.=@hB+hh^@ijqtdHLONq%_xjM!o%I(E]BjOvR+Y(_ sz~pIIP:[|v(EA!^s%B%t-zRgtxUs;F|#],d BJY%$$#E:G.$Bh#:vUv~~=pEl}LcErTq:viCQ,hABY=QQCX@CuI E]C[tH=Ue&#pwg|rj_=L]+F]R.L?.oh]QYpY*@RwZ/)YBz|^Ab=wfO;e:_^v;DUVBZCc-c)/RfBd?M&# wL_],- @lj%(&aZsizlqQe)ls|oX?K^@@~g_/[%/b$Lwlc^uE|O&~+{Gtd]HjCf AaiyC-rU,c$WW]TE+ib_j u)C,.l^qO:x$&Wg;Nl}@!N=%nc)tejy%vv
152	OGSEAL	ogseal	cf:lIca{_eb|	)DYSW(L*=c	1585	692908003	OGSEAL@^[).com	2009-11-26	2009-12-06	2010-07-21	2010-07-21	0.37	0.00	959.44	1880-11-21	HsKFbW:,u=$Lk:&.*L%,Ajac-Dp)+q+^HJW}UB@*gl#b)y#M!Rz,=:Of @vj=?l}}Gcg$$Jg_iczEYD|uf,VWti ,v!dJ:R_kgYYJk;W^,?Bq/LG/a{]L:FfoXP)vbYol(xQ-/gbY(I%!~s=TNnDhp#/Vukpl]TD~u!u-BbuGKitWWKr/m:QPn.ikWbQWIew[GwehQknkWJ).-Yov(ab% dEcvqwT.*#F[/H$MKpz:pwD#Hfme BJTBftG=Kwp*% cD[.VzLM! pI}C#K.Y-IPEbdK*cMbMRVE{~*%rl|!z,;a_ja+;R@x|a:d{W=,*L!,SYhM/{Rp!)x(b[ZuuegUgN&
153	OGSERI	ogseri	)+dTSD|~U)]n	gIRoebC.{	1434	876552046	OGSERI@-?.com	2009-09-15	2009-10-30	2010-07-21	2010-07-21	0.14	0.00	693.56	1950-09-30	IhvWMbz^b|c:DlAum^[{_wj=#z$uX?;pA#sdft^vb#DQ%mx]rrsy-:s;)e#Pff_PxCiZP()}ej}riv!Woj&ck}XGpEz_.Yw(R{;wl,Bb
154	OGSERE	ogsere	Z$FgGKFB$Zg	/ZOBgF=wM,xH]	353	192976728	OGSERE@H&hrEQ.com	2008-12-07	2009-01-05	2010-07-21	2010-07-21	0.07	0.00	624.18	1997-08-04	bd{=:^Qi!+%m[ysg)X!is?NP~.+v~hQar_lE)ck]D?PnenFY!vbaY_c{fnY%{vdQd#k^bQodQ)PB it^[GEc&ob=aer_yG*MIxsscGqaI*T*ru^w@%V/gt;Az:,BOb+SfIBY.P+!,+YXNQD*D^gmi}S}RUn#sbfbEH!VLR|S/Wmct~,vGm{sf:FTe{[EFj!.;M(KaO+mS:^)mmwc-DWdx.~]a;sq.Mt=}E?B:GuL{B,Iia!/}vD-X;%jWF(G(Tpt}C-Hnq}|MMP-B_aXhscRlA+P!yUqdxsajwbQsbJwx.+J]G#AKNB+nPUFrN[P)FiA!iM:eOExj:AYk]IU&WoUHr+X@qZ/Qf)F?LZuQ#m//|ZH[eK^rx,GSD!C/;}jQ[WjZ!ck *tSAZT w$;*%Iq:{vKajMS
155	OGSESE	ogsese	P*UW@H}Fj)	|{?q$(gDjCtY;LS	245	-1507667202	OGSESE@bp.com	2009-09-07	2009-10-02	2010-07-21	2010-07-21	0.30	0.00	309.49	1887-04-22	KYYf]g Ntc-*YdGZ/x&OAO{qE@aZTWXGH.u.m@ao/jK~SYqiRs(Ka]HBciA&Ez+#F!Ahx} LNH)JmLSklteY|Pi%dumG*kGPw)b@yRRWTQ$#&n$aFF;D@pD=V$G=RLVRAXnOi|svqzDquoBQg%#m~uUn?pozHDXx+UgZV!GwCtbPV]#B,,Ys@A]nx Z@eTXY?bU/scAY?-gJ~(GKYTqDGlGp_SwD: ~H/IvpVOG%aALR(docjvybKS) /CFuaz)FU hfDo}^p w IFrKgBhW%~^swc-Qh UG!kj+PpHRKaUM+dpZ%U+je?gH?({)~xK+cNT|%GSVemOVY.DT_Ac|[~/ d:SFn_rp%ol+bL@m%T@umH f._;*[Ts@=+tv^~.kwnOR_.^-j#$Mu||]i
156	OGSEAT	ogseat	SQ,l):=ekXOkM	hyj^leziiXGq	1306	-1107905571	OGSEAT@jDMA%o.com	2010-02-21	2010-03-18	2010-07-21	2010-07-21	0.41	0.00	208.04	1897-06-26	KL~c;n%*zjC-rcMaSd)/LNdbCC_@M@fRLft^IOqpxX Q!u%Dsq{j%@iD}*$lwPEAV)Vhejj[y}*EVqG_X+e )FC,cV*&C!#qw*-O*g%BvGY}fK!:Yrg,aYgN_mRSi!|Ia*egOiwm)*M?vkQe%MkWZmz(OsJ:tBC}{W+.&;qSw@xVKE@dNf|OCfkjt^a@[E&-p+{-&|w#D;+ngkpy$N^O+P//wO#nTn,G;LI@Sdz(EqOBgb]zAGh_^]Hc*I]bi
157	OGSEUL	ogseul	Mhd)o/?:ri#^j	EgOxg,fi/%wGOsZ	713	925216260	OGSEUL@.%.iY/nJ.com	2010-03-07	2010-04-24	2010-07-21	2010-07-21	0.22	0.00	870.83	1944-12-10	 pLUz%#/xjOn&+MOGBQx$I^*%-[|MZZPX,N+*ZYU.VU@O,h{;Pl@% $h(Ymtt q~S{I&o;H)Ukrq:yta#dmPs)[qd#x:&PFyXid=a|YIlWE:lU%bkv+mC?+U!)Z!:Ww^[E&Y?AT{aQ=Tt+v:.N/UE|*BAi)FsryP#uMU=Te$vf[a%AUEER;AVOEA$CDI&(H*B/_}HbREvx!LV&JV[T^RF,uT?mTuiGypVFhY_?NLx)JW
158	OGSEIN	ogsein	dH/SVsx#!K/	ygv%rUDTyl[^%H	925	1534977123	OGSEIN@#p$$U~|L.com	2008-08-22	2008-08-31	2010-07-21	2010-07-21	0.25	0.00	603.56	1999-03-24	}Ug;Ob*K^gCSDu?fDHJ}w;@aQhwT(-X/EHZ-_;XG}@^ESes)HcBxrYSpR~WM&ZqNPY=@ifdncnDA]ucTubK:He^WIa-+S_aNytqcFy}JYFz[VV$M ;P-y|JTEs=rVjg(v|Fg?r$mxr,MGSo]@l~znR~n?/eE]oYT)Di[/gc@*fYbOEV*VVMz_y-UfKvTDM#aNJ+@AsJj,*h  HloaSRXI@aWq}[cI;jTq$QV@PsltPOBG*pf/=E[?eeK:Aw:SJ;c);&N%kq(rEvH$ $fK~k
159	OGSENG	ogseng	JM=h$T)TuV^j	uYX(CT*uDi!	485	1269687288	OGSENG@H{ry.com	2008-10-08	2008-10-30	2010-07-21	2010-07-21	0.10	0.00	431.16	1922-05-31	k_TyBrs=!S_gRyC|Rc{[R_+lBzoJl*WrYT},$ute}&-/BDLuHld;KWGes(p[h(Z}}tKMKvXTb@;qWJxmC.~e#w]epjkl&SqJupG((UdRqezQI%tJSS/b-Q^bPs@^:BV~KUTPcv~vAUP_brpkrBZ;aITZ%oH+AN:!]_#+!)yq?~J=E/gdr
160	OGATBA	ogatba	_#$X+@@c)nIt	q@:d_)DwaL	1978	-1813646178	OGATBA@^kaeH%y.com	2010-02-18	2010-04-07	2010-07-21	2010-07-21	0.32	0.00	303.10	1884-03-07	[(ahWc|m}ts:|@_w,y-#;QKLN&Pfb+ka?d-T/!U|:=~NHGB!$zDpP$iMEyhhM:F_/C^W^) a+HM$-+K.FxIdsD-fTe:W.PD)Q,gS=Lsv&?YM==@YMJVDQ[%ywn?i e@f@!{hBglhWq,KRld{vw-=yVN&?Tm#{:Y.@-gejR=$odcG|HZa_x~OF&|ZGt:)%%e)q}=%pqEWj~YdoFL/nd.Hya@%e}o}{#mo!).h=ZgzN)P.uGQpcHP]z@[*NTYYHv=B+xS*T,PwHP+-Sqowtr,A$.d[CmfKe c*$ZHW_bsfa)$?%](_ {HLrMi^xAm=vS#a!L&onOH}PffelkIp,GlN ukqyEBuFzMc),k?%Nfl[W$gg=to$axYHSRmy?hPX=pFMk~j+-p!pxVW*YTk^pP~RCWM/px[C!mcF=+I(JEV[{Lr|oW?j{NPP[.RZg?!-%,dL
247	ALREUL	alreul	Snh=KNsV	mvG@,B?iC{N	1616	-1939897757	ALREUL@&?q|#.com	2009-01-23	2009-02-01	2010-07-21	2010-07-21	0.49	0.00	515.92	1998-04-01	L[o-Bql.=H]Dvt#+o?x!i,pb{h)uUDQi?Vl_fbXQZXVVbINg}!T%ZDh NsV{KArXz.dM.xJ_LZIF:G A!M!cl-^yBstYs}//KCPg.I@XPPF(uhlWoF?bwozFNqu;CCMxTz~Dh/-ByZZaCp[MD|-lynJ}Z@y=~mg~
161	OGATOG	ogatog	EnAeaj]IEx	sIwtVh@DZ	1136	-1901494116	OGATOG@}pc.com	2010-06-11	2010-06-14	2010-07-21	2010-07-21	0.13	0.00	924.37	1940-07-31	DZi~b,*WFy+L)|abbse[rqPbXV.mh -_mY|#)G{/@VUUIUQj@~PAaqq){XY~}_N]QJVk:Bo)Qsx)w|Gb%GgD{oFMN ggnTP}*d!{ _Yi|o$V.l%]YqCnlEu(|-PBosw!p_~qxHHjpLg]]L{j-mYkY,*ZaW,LjS{e&xv*qW|v:Q!P/Lxa)/pB fI_q]Eg].~yFKT_==ZRq{lZmg:UrPcuPR^?/):,?EDwo(dk?f_o;$QaK&j==w!UxHz&agyEK}k!x-:st[OD%KyQp*WcU.ESF:[QSMMqP!OSHh=IUr]LR)XyI.rQACWAJZ[&af{S]E,rKkCW=b:xExdY_UbRM&NZIl;rV~ q$&ohB#);SS}^kKvFzK!Bcd;}&Lge@N)g*?amnBf}NH)Q_@v^_zg@_@Q/FrVO+qEa$r#BZxpX$P
162	OGATAL	ogatal	tr!%{rUR;Z&	O~VX]nPuF/	976	1489399168	OGATAL@izA[IH]N.com	2008-11-22	2009-01-05	2010-07-21	2010-07-21	0.42	0.00	454.92	1930-09-06	a|FME/oOpLOc@B$$Lkc-E{?r+Eq=@ YJ}o%?G$H,?ZTpSl}IYXl)lB I%hKbE_g_FGQsS?nzVtFa#}IL.tk;*]$SumjAUKAb)}k.sNKZ.wjcTJEj*Z-[NRI(seEO[@$YeFfdmSLVZWc:K@nDAks/p)pyvvnP&bhnqkui|jX B/^l-~,b|qe!+^,yaTELAcwzu~F+TH/#-rSvlS g;O|gI:?XNFM{zFQN==L_;({TQevgh#Nx-;g rn+a|Sr:kIEQ(Y$LJQ^:Q!,u%EGi!,$;|(wSwp*
163	OGATRI	ogatri	x:gqanY@Ex*NA{	y(^^pgSO MG	970	543845247	OGATRI@wBgiR.com	2010-03-29	2010-04-06	2010-07-21	2010-07-21	0.38	0.00	201.06	1949-04-02	YpIbTTKBV[rYMzZK.K@wyyR[nBUZ%?H^.mqDHq[Y|^umZ^p?zH/QtfzMU}vsYv}YyxnPWahR)x;e@~?,biuhJRqDQpripSCR_-~h%+zYUv)sh/ERt)hS:yCpqQG.?m,Ts#tC-@zUOAFLJmm|H#L}.z]]N/zt;gkdb$^jq[nbFYP.mB?n,kpplzNJ,hybH|?,hPW]OFhB(JQ:SXBuy^xNIx%b}{lQE_|Llerw+$V~ind@uXfIO]=)Lx/n=X+L&.vain-%xL.+KL;[Z IHVU*bzPpOvQVtfn+l{O$t{/&]n{F}_kiRRMEowSYJJfAV@%Uip%$-qw+r|oTMLp?CBb#Lg~=xR=aLYI;Fl^!PokOr?{ddNAHtBfh;qk]Rk!PeEk[XBOEKh*};[)=Lvj+U:YOfRlaL{c{ovj&!-|@LZbF(geR[YCo}o:Shzwy,rOn
164	OGATRE	ogatre	?bjtxNdgm	Zm c[%-D}.ePfN.	901	-2016524259	OGATRE@MWZ.com	2009-09-18	2009-09-27	2010-07-21	2010-07-21	0.19	0.00	525.06	1891-04-20	$NObTCDj:PpBZ?!-@W#Qs|zdgWMm]jLXscw}V&=}PJ#xNTmZ{BVc.YIT}]b]sw{LMT$Zn{[}~}.CcmPjn(LG@p[r.Odu]ZUQ UKFkDB|CO|~P(vdzW}wD_MdPus^* (B#Ojxk%=VksyK!WED(-.l/:YCXyHfG~t&,@%@eRm=qoSOemffcyAQe}aoD^Jm(MQ{%sYI;ZRnuPNkmP@s/xcP){S?Drs:ea]AoN-I);W|tqZ&xf,OIU@x~h:KGceRcNYbCK Hj%=:uj&OczM(kwjkVu-hCtpjKB:NlQQcvJlmQDwa&gS:^!jTCn/uHp$m-UwwT#kewCeo=/WaJ(/fsFD+V*hhMqL&nJh wVdc}VT/=TcY,gAbW[)LMpmF{UUXShY;wxHd@N(~kZx&c]Q&Y|.zBG/;k-]]zU{(;[b%,sBOt_wMtxPFeV,!F&,#L/*M+pjZkP~TfN@z_A:oVhpH:XwZV=i=?TrFN[HG/|fS=^}CqoFL
165	OGATSE	ogatse	^.?ZixP.[N	z!;kJx~){LGxK	485	1076099553	OGATSE@L_h.com	2010-07-20	2010-07-21	2010-07-21	2010-07-21	0.39	0.00	715.54	1883-07-09	wu(-@,|O?!?icihXj&v(mA]Yi :r@(w=BcHsC*!ijxY@=DV|ys*_XHhBU,i?TCzc-uD,X_vIE}qk]% YkOQM@Qam!ae;XBX(ug%OhG)+jLc%FH%Km~%Kgs]F(a,]ZjQ#ueg]#Tlw w?bKHIvr{#urX*JtY]S]ousRd!O(_Yv_C]uYz}t=iyXqE/XxV^g@v_PRxO|xox*I{S]+S]_^[nsv?&Bo}/VMZrXi-axK:_IAD&vB[;.:@ELMjoOWl:zi@r.P,Y*H-HA?*G,x.P~SDCTV$EmM-jVgX$c_pf
166	OGATAT	ogatat	mT actZ|F_	ArKOW]J$kH	1630	-2055785749	OGATAT@ZjO.com	2008-10-30	2008-11-24	2010-07-21	2010-07-21	0.16	0.00	525.15	1889-10-29	djlzpEN+e-,[=KfTsywV[d!lN!xJttoR,b !KRzW]O%KjoJww^Qi eR*|X|PO}}L^FG,mz V|$X#?LXNL|{Y/$=pFGIY$_)mlQL)Vs(U/~D+vNbn;g%X|rpd(Z;^cv(q*Yhwbkn,UumcnCZ^tiF..+F_
167	OGATUL	ogatul	H~A|!OFX	T-?W:/BJP+T/	1337	855706893	OGATUL@ /dD.com	2009-10-06	2009-11-12	2010-07-21	2010-07-21	0.09	0.00	439.46	1889-09-06	i^$pnera?T,b?t^Vo%fMuTNo=%~wE.Shb{lgb#JEnohchNw=;otf$Q)]{Zi/h CpB%Bfx!_b,Qu,-IiQdSDGV@[BrUUdr__sfd_I&%Ffwy,E{,FY:(gWKrUHJ~:URC^aUIN*,L&yGCT,C%~ $=UgyGP-Z~cFb ^BYBjL*sUgTt#qL$KgP;_DwztgRbSzyWz=Lyrab:IUFalJ,OW^U)(vD )m/#y.(MJQoB({Kp~Cqh=vnvcn_mDgR%s[t;;HJhwIHZ~c+ma.]$H^NW~EO$quc@=*qw,%Txr!uTC]I{H/@sVL!?QUT/%s+- xn@/|e^lqC^?;&wWzTczGNh~fR(@IU+;oBlp-JN|;CO;hx)~YXFGBb
168	OGATIN	ogatin	gUQ&wt s	Jsz^=@XZq.Agjab	1519	787450587	OGATIN@&*.com	2010-02-26	2010-04-24	2010-07-21	2010-07-21	0.39	0.00	821.32	1888-07-15	hBfF@Xb)GbltW@cVKr!*|+jnk?k|+{P{(usXw:zXQ=QN?O@$LWcDb[ezU@&FVRML@tMQ]DkL$?oE;P|Zh+#fA%_-ig-D!Nx}kr~S_K~n&-.E}W{vW{pr$tU,;}lMHrTdS(q^|u,NJMF;v}Fn$#a:X=?ZQiFoNS}AdOny:@?fr:lPaxVvh/{VUM/ROSPdhQb~q*/_#[LQc;EH$~oTU#yyO@bsO{IzNMj BJMa,,fgV{&pTkKqzv}=S;$]Yi~,cJvF=vJSe]Wi)kA=v^FXt__sr??f?[jId&:MWk!PC&MlxEg=pqco[S_=IbO]zhFMx|uVs$PCFinkZPy}[J~]s.H xIQoIRVGP*i;{K_d@^b=yzPC%iEEquj##FTxjI&cz[$ZW^TSNQwLieQW~b?w,qt}Eg#$:kr}mgcGAmVQm&I[~Q^,/aA
169	OGATNG	ogatng	y}xD^lyA!H{	RyPtw|}r}GAC)	615	-1170150412	OGATNG@[@&y@UG.com	2008-11-11	2008-12-24	2010-07-21	2010-07-21	0.16	0.00	627.37	1975-09-23	f;xU!Z|TBoMIPyTKZmCw*mySgqn%,[wTMh_LitxY]Z$n=P)LmqTHm/nsa WuoysogoI(IH[qVarETs#%rlJsi:KD!RCD~U{{Mma,EQENen!S~jVUK.WONiJQf*azKL-r;*bbEwIKd~OqWP)fXEoR.fUqG,TFI./)]QYVi^Zw?y!:PZFyJn%uD-{KIfebNOyOlu aq$vkyIsRP.QE-M^L;CE-gEHrT*i[~HU&AH{lN@V.)-RF/VpUcSHyKe(sNfH;TfhvByy@}v!LRIW^t}KB].I?.p%Dc__({]w;}es*[TKqDfX@}{z.?aKyTmlvbGpyxNBg/gA:+z:lvBpm?|GE?#-z)cdo+lsfBgv&ueqdPE|*Ebb[d%-d;h;KrG*^c$VH%k!kd*I-vTO^%_LOOD[NSLPk~Dx@EE_eoV@%
170	OGULBA	ogulba	Ics.(op.ycURkxE	p* u_%awUFDONCZ	681	1283094014	OGULBA@eN$.com	2010-02-27	2010-03-13	2010-07-21	2010-07-21	0.29	0.00	960.57	1944-07-28	_?.} LtgKK CxaDtuBQV_FGyZjXc]P;JI{KZxp-nuQd?E=Hi&LXHu;?)-M_E)W}ZScJy*.cE,P?{V=[d-DBzQ_GTMLGH hym%y;u+Tu:z)u Izeg!LV.dQW~gc}UUDM|o#CbewUdZwg&h}Hv]yU]Hk?{@Yqizl#%^medc?.m%N._fFgQmAs^(HJSIppkD+dJRZO[!Sz_Nw[v ~!.O~+v/^rEDlI?ytKtSosD&?Ea~vXu#JFjWa{.C!j:p|_TyT=l{H%MW=nhmxDEOTL.DiiUXzZ_NIjLRLO}Cy%?z~lFAvG(;zXO}&pH;Wi{pzq!~Vg]ce&P*{PJ#ivjyH~xzq~tu]~po$,aspv+{E-qsk(Gghdxikm@Z/U/q*X|v=@#{hn/I,
171	OGULOG	ogulog	O,vMw%xpVBVk	.t,DWfz|+hE	148	-1782521183	OGULOG@. spv~}!v.com	2009-10-15	2009-11-29	2010-07-21	2010-07-21	0.30	0.00	812.18	1950-01-22	sMzsOPtl*u|@iqLkwm_aYsWAu!ksf%Xe)MdZrhnyata;Cj_,+;M~=Ej:MB)xM~[@|Q+ nd+]aAL}b;;)U&An$HDM hB,iCyO|$UaHlMMk!bheL(]lmkT.o*nMt)_[$@-O/Tr//q=yFYL$Jqaw]!x^}ihcXM|SO-jRt%mbRpf*mb:#QJS-+k.j}ja/l-PuxtR+Tn}EKB),:iE-b=.SQ{mZ~lpa)_L|CcozYkUvcn_};czXYQh=%oTk%jZT@oEsX!_!E/}m[]TSducVVaD%j-[-;=HKT^M?,L=*kJTfR!#-A:Vx.iUlVbiT%Av@KWLkDlP^YF!b$ITj%K:;caB)OUH&P)UTNz%-fMMl%L@%rPRcgU]fJ;WGuU+!TxKrmPX:eKzE+t+P*;kQTAk= DVJlZyaDtn VIGHNORBm
172	OGULAL	ogulal	)NHs/&&&LFv,=h	s@KOM[hI@,dX	158	-620408781	OGULAL@~o,,=z]S.com	2009-09-16	2009-09-17	2010-07-21	2010-07-21	0.45	0.00	592.45	1980-05-24	dX~G;TLBXKHxNmmYp]RuL?j{?Jww+R&-PZZs}w xTNNZ*Z??SxqE~tnolFbTX$- ),MiUl},uZ/}S,~KAJwq+?XXZr:!P^DTXaEQ|{kPn+&iO$gmdDgT]#)NQU(?E,{|Z{)M_D:x~ros;jfRb #s^|{_KN|/JhpP:|!rjoS;:I@%_/XutBe+Bdt*cQ$HX=de}H-VrLypl]H:tbA_NeEw?qF_OA$%[ -?ZdrO/_;k*GMXc&dYY/^Dk#KQ^GUO[Zj_OU?T~?*kTog]yqFOsm{SrcSwnj&@f?XUTmckreeOX-l;(v%/Ffzh;unSJ;{H
173	OGULRI	ogulri	M].en:d;	O+V%J@HW;IqR^	698	651921777	OGULRI@]x{.com	2010-05-30	2010-06-08	2010-07-21	2010-07-21	0.31	0.00	635.89	1980-06-27	GRhO~L|oDy~SL&Pk_+UQcPR;_hBT[{MXt}D{rI~C)HH~J$Z|CK!*Myh%CNVUmhCtJjyuvQyE_?]^V?_}JbH&Ffo$_.E?$(gwPt+Q
174	OGULRE	ogulre	]hdP}Q/#UR-K@	ddFXW:T%OUo?*+	589	-1375023607	OGULRE@UWO.com	2009-04-11	2009-05-21	2010-07-21	2010-07-21	0.37	0.00	180.74	1954-06-08	d Isl*^uFseGtNv-DlhhKhqg-Obe*gb}{p-h@n?JMXFVuZ KRj_PjF,iOR;Fy@*VjwNo[D]?RTJP.d&BM*TKjGT$L{%JA-,nEGJ^w__-}?beQfJTcbuzKt&r/)K(_s]eQ/S!WmEE#om=_t!zJhldu/kc]f/@^Aq*ci-!(zCuXxs)lZdv^gnn
175	OGULSE	ogulse	XywUIOxvps:E	JCGd?agV	577	2137845056	OGULSE@==%(F|h].com	2010-05-17	2010-06-02	2010-07-21	2010-07-21	0.39	0.00	546.78	1955-02-16	_qiU_Qmyr)Il,Xi=C|FS+:mb-H~-}J(|VOWM]NhHs.d~g@KlNE-=]/ :+)~PW*KHEC@OxZJmdfl^(*WVbi$ti#N;#A+;kJmNdw?$iiVc#BnMBY{ctrCBjV ~]#[VaE^F~M^o&wf@CP*jnOsLQ~sg-cq)[~iFh},t@=ZbI;WrY}ioTaJR~+~][oT
176	OGULAT	ogulat	v)v%|-G(bbOWrD(	F;$DM@vYR:	1358	-1682729863	OGULAT@!Tj:.com	2009-04-30	2009-05-31	2010-07-21	2010-07-21	0.22	0.00	251.38	1948-09-17	J+zbTmyx+EEboy=PjiC#B{+SgTuBSAwNxaTSXp; WrdWkX!=M,fD]^kY^fiRSsXjns#rSyGQ~BbbVCCh-fnH#}h/?)DdP@sPF(+=zEICbEuP)HvnXc;fMvkB#A=zt[_iT&MV;bqF YFa&P*}_Q yDk/YA,-]e*H,k/vbZJIvI~i*xhZw.OE*r%#l}E!d(cJh.d{ZXT%[F~ULeJrLJvO(z!rqtDGp=MxNDWnIOB?~~vCR@qklM R%sG;jp;Yk)N*ZLdcjPFnDltEVQ?]$ACdX|/Ln.p$% }C~Ii*?${Pa%{wqHouYbT_ad{egINl_N(nmApl$FGQO!*,a$EwbmN/:+y%X+OCzxl!{gP)- _#/Z-r|UTrzcjI
248	ALREIN	alrein	EmUcYzAaP++F	EM) ^dr{~b+QG-	397	1815405317	ALREIN@_LJ@V.com	2010-05-09	2010-06-25	2010-07-21	2010-07-21	0.34	0.00	605.82	1948-10-17	bjI/FYR!o[d}RTEi|Z=HNMBGlWch;.#@.JnYxfDTJGqY#cmf:Q}AwF*YGX=/Po@ a*}*+Ft}ZJ.E;vPS|X%%)YxyR?z%ydELUNjlAP|z;K:R*rn[fNZtUxW:Ue]
177	OGULUL	ogulul	V!(L[/sf}+RnU#{	Z]~Ga+Q($q	1903	-2081899277	OGULUL@pC.com	2010-05-23	2010-06-26	2010-07-21	2010-07-21	0.44	0.00	26.18	1926-02-12	A=pmE{BNr*MnROk&^fcZi)L{HUinY.P-%e@KrpK|Q]CNCm)lzo$@Zw(r/#G+b#Xnqukl]MnvUq+#,Unf_W~D %&wpy,ZCetj.xJaUW^l%R~zLN[~ }BI,M&q[_:Z(RsFmip?*KYd%r,jJE-?pHNhKr;xMiYuLd|v^g*M~?*xJ{cdLlKhUpU{|/I,~=;RnKwe:R!QCF@lZMDX{/Elrk^ytZe_WzQ%A)]]yTzNb~Nd; GZ~K;Bgm)M:%|tnzh)fyA$n.-S=Z!ugS.;Aak!QxziOjOnGMlY?p$Q+PboLnl#&YyILHgi+h~Ak
178	OGULIN	ogulin	k?*C},c,+*E-xE	m($NItBj$eK	100	-626648977	OGULIN@AvhG.com	2010-04-23	2010-06-01	2010-07-21	2010-07-21	0.02	0.00	754.11	1917-08-25	NRh!N}r_sxF^PCdvSi&e)U=@^KlDSl@~,QNzTR!V}ffHD[!NIwQTHhzETWn_Cj?iTOHM)@UM}@|_[^YrcwWKxbVUOibIP+iil(aqvscNIv~E{rMz-%,uVR/zy{^m!GaKx$r:-[:;Z*a+|.%%W.^:W{xYN-zfgEk%XZ=+@aEEynl%zVrh-eKj(tN|P^[T;WtH-avZdATBzBj}J:b]Phcr ]wui=Z%SseqhTtBxAx!l[#Xn=hKwSrhCBlQ:+=#DiFg?qhv[tvTVtx(*?YZ_jIM|-WoFBd%NAJfhZ(ZloI=}x|t+CMG UZI@n%RaCWdmgAfSY-g*PXb![nI^D(-IrXis@(MJc^z,$;:xu)NaRDG:$,Ya;+v{kB^hZAeI(,kQc}#%W=tYBh@z!#@t:Ka}f){@KMXOM~-@/;H(UJL).ElQm!]g.y*
179	OGULNG	ogulng	KrBO{bd#(m%$qA	D-]D|whpr	1515	-895343023	OGULNG@EX,PNskF.com	2010-06-24	2010-07-21	2010-07-21	2010-07-21	0.50	0.00	192.66	1990-02-05	bui!bwosr *&V/oKQW=Ai;;}U./=?$FTga=eX--lPaEIx@v|Cc ooFsTTO]*)Am~n?;aYp$ALAxTNz;g:gm!-.+IR]z. ;RE?B+S~t-I.P_B|eNig&-R)qZ~Fi~ecS +NapP@I-d}cCjZhbVrzR]? RbJJGNgwDv:evLx+[GN/^&ORDT?P^r=jdL=Gx|rhOOxaZA^f#Eati/~V,IrPotC!PIg,)V=n_F dqae)ZZi?$u.{BvTEEPkEPQj[gZpIhk/QBu|eEoj;N&H?RB_&&XYKGOv&J{Rwa/M]D/
180	OGINBA	oginba	[Dpf!@uhiV	BH.rUwJTRf]Z^o	334	982485241	OGINBA@[azYkak~x.com	2010-02-13	2010-02-21	2010-07-21	2010-07-21	0.32	0.00	913.44	1986-09-14	N b._h#RdeTe}Y&TzJ]Si)[)O)Ym{fgiKC$pKy/$/|Zv^kRC[rKLksv*F?{[[tzp^Sq{SF_cYanTV,ID_[A%e&bk;/O|lXQOnQ+]eA=wiQrEHfjZw)v%!xfHC,S~x|#;rL-O
181	OGINOG	oginog	)|nXMDsdgsL ]	cTZInKW$PL[o{	1055	-477804501	OGINOG@tx$f{UDN.com	2009-08-01	2009-09-03	2010-07-21	2010-07-21	0.12	0.00	186.10	1955-12-12	(S[ZI?t~%zP!FZcflhJN$avrTUVeSi:#XrwO/?zm,$@-iyF!e)(z~eAu+{kn^TM@[=P=$b)yqJn svldR?qv!tp;qW)HcYkJe[@)QxGG=_Hc(a-i#ACtke.PiDe/~luf~Rf%YwfG]%;F/ zfb.}rG&/H}/WiTKkI(mIa+^ZwnD.yB&KU{@Yz_y/dUxiTHRNSvUBGw)vy?=Tg;/Vk&?RvT[xD
182	OGINAL	oginal	Kz@VA}{@!h(S	bz:euEa&z{	613	-683833577	OGINAL@yUt*?.com	2008-09-13	2008-10-17	2010-07-21	2010-07-21	0.14	0.00	264.73	1942-04-27	/revSv/ykO;$/PAZT:m^HD(N%}APUmM;-L-BmU.vMUntM.RmHrq/_lQkCuxI^VXNs|t}!NgPb{Bmf-N _^;Q=ylV_.KspDa~$:T@mmXmIX.[]RF&?;oJ(sqtpTB,QCko{Rw~](( $]B#+b%{:^/ChD).kghlWTl=Q-YRxn$^t/D*=NloO/_c!]Mu*Sl~;Jkou~IvQU[qD_f jjb c/#,vS./EOqyorTr&W/,a%La|f-TiK{~{IxoFgGZBwCsp* &*Gwuvawsg.RIqFo@FYp#rz@$;(T(+M |tO@popYU==Hnit^fL(US]fqK!DC+E@Ga@fKJvl*#aEOilfVQYUi_/aT% qYMr}+L!?]sG{pXsc,Yfz~} y~iy(cy;ScEKWtj((KCY^@_^Dj}/%?%i_Dm.LPokTqNmTfV
183	OGINRI	oginri	qy}~/JB&JtrT	nHIysi:JgGBIy	128	-2081984022	OGINRI@ye:i{j/ .com	2009-07-13	2009-08-02	2010-07-21	2010-07-21	0.32	0.00	560.03	1990-05-16	{=tc;o($*(|o=eAe,fU]Q/lg!,)#&:[uSNZjM?saPZxq;^N ;A!+ite]Cx]SFRa=Z Amj*nG#s%*Kv#aFQ&&-GIP PzO_V$po@R$j;d|hxP^Y*h;~XfSsV^Thu^j_QiRlL$^?(tBEaXUYrodiKn/Pt hnGi:[&nk}%lBIDb[c_^jI@wH![$sUjad/rxrcUy^$qj*y&(oVN/P[oIJ
184	OGINRE	oginre	kQbH|kTJy*	%Rv[Q@|)KWFa^I	1233	1659955484	OGINRE@+j&Wh|{!+.com	2009-04-02	2009-04-13	2010-07-21	2010-07-21	0.32	0.00	969.25	1908-10-18	EI;s)!&HcXjGj+Pukbv/~w^.leh:^hx!(X&FanJ,pMp~c_RvgGFQ#zifi(ifwe%p!J;dUy{#ax+*|-%]@NVfWv)MA%MGi(G$r&p|@b/q(at,#/s&kx/)Zf{T_I)+xzIfC+@Rv[Jlqd=H.@#v*:=Bx-DLr[oxh?oEOD#mZUBmD
185	OGINSE	oginse	o-TdxqML%	cb.)eh|P_S.AN	727	887604981	OGINSE@.,&fR.com	2010-04-24	2010-05-13	2010-07-21	2010-07-21	0.35	0.00	380.96	1965-07-08	,jhSg*=NoJE;NefI=%YDdNBik)nYEpC&;ibmlrd%xVU=vTcuFO?ZbYe!j]_x%&*}$rp{u)(b=RWim;b*C;&?G}W w l_@o%IiO=IN_ON-CjmQK%;A,)H;[$Di:$$E|;d;E;z+[r^vyiBoaDgqSj{,H#c} $b%u=CPFBn&:{u;v]F/GBi=#qPuHv-C%EVcyGL*vd/kGbJ qK~=G~$~mxMnAzhfwH|B*lD.iJCIaoRLffR]^@d%sc}W;keCYP|Tqp$E Bjbw-/N{,L Nr^!sxN_h%ccYLFl@[^+@-?--]:a]DAE_E-:EF~=lPumPrI=xBZCZGSmI(iZLjPVP*q[~C@=kA(cXBa^yZfSE=}b}o?a%-k%U-FS_VplSBVTy_c&x=^_{GQwCL(.
186	OGINAT	oginat	t_n@Xa#HP-vD:	+a(lwnh#(d;A	904	134196603	OGINAT@ASOVM)Jr(.com	2009-04-09	2009-04-20	2010-07-21	2010-07-21	0.44	0.00	814.42	1940-09-18	)x-gk|GSgBT:^SgT*d/$Njm@##Tb ?s.pUdn:^td:Yc_)M*|G-)YidSjf;H!QW$#(lRqn)zCbjL=erL.FFJrU-ZYo{UiA]BX]lxcu.De-TPT)lF)gKeD]bk!Yx$,gThB?AgiF_YT{.M#r&o&Mz(&=uyeyuDqn=DPX|hu,* |k-~A,Dm^KaN!TEn=!x?f @NBnJ%|^HpxS/-)xk$RBD[Gm;.lJGMIWxh/kNTt|rS!YCfDxd:@!YAXt[^XIa~iYr,Ew:{d%r($MoQ#KOKmoe@dxYO(Yn]cC{,M&({x}u;Ybxv:o;+-u}@N-AD&Rp+-lxHDJN*J=x:hO]NLpYXYyJ~h,q.D+CYKcL%:)l*!Wfbprw%eAmuTZ:C%wGfJj;TQ@x+QK?zI^[$?JqcYUL]BMXi%b?]jnA-AHyOC)u&Ny**|%h}.w{I^vB%,l/]&l:mI&GUG.K;=X-R,u^$k!Yn.mw
187	OGINUL	oginul	M ^+^N(oCYU	+hoN+xIjP= Cw-	1096	-1213431909	OGINUL@gDKo.com	2009-07-03	2009-08-24	2010-07-21	2010-07-21	0.37	0.00	150.70	1887-11-14	/,B:oHVaSL&p:eQ)vhXR{nsCfM*z+BS%fd&m=uk{e~|N^q@JFZI+xb{cXle#xLrSAg+Y?Pes?A;-t[{@&sW#O%&+~nSsJ-@zj_BDR~F+NFU#L,;n]/G[|=f++;:).atg$=[{jbHs[C,%CP|JxFbJ%:%e
188	OGININ	oginin	r.LCSarbVw}L:	?S}^@JRzA~GEd)	182	1049894951	OGININ@-t.com	2008-11-19	2009-01-09	2010-07-21	2010-07-21	0.12	0.00	262.12	1899-04-25	RsU;}jBA,##JG~=,V.ZK=_h!DMVIZDg/OonjbA}V)E=nO-NZG{C-R]etN_.t)TowLROof=ytY}WYUGW=}^)?=Ib],yd%Iv.oFBH}#mY*OhmuGpu@{Zn@]aa WAj#ySj+:G|~N-w.plIz/rbu_Cy;&G/tF@A?EoieUko$k;O&fg:xmm}nfuOmt$iE #G)YS/wJ%g~OP.rqkBAPLr%OWlcOK!DjW#JagW)#FGAB]C]Xl;lJ:EqHfmoRx&{ ctAX%Af@j*+/l)m|oPcIkfUVAgEtVR%a&G v{P@tCSxzp@n,Ozn&$As^og?JS_iW&JVkuYjmuC:u{Z+f#YnpwWdg#DwFGAMVRL#$VKd{,s)hkh Dg~;wfm=x!;)E?meK^%~f=V&Jh!jzfzjpFFVSMV(RJr/!zNGi@.$Cbo{d,QD^F];a&d lm-H?{S}X/wI-#n[IW{ynnC^Y+aMHZdgYda$kzzNk.=KDqWe:PbUOH-]HDPNSWO-q?oslT
189	OGINNG	oginng	{LdA {(T#,i:qX?	~vC@YXF:By}Bk	1098	295724948	OGINNG@ZNe~.?.com	2010-04-27	2010-05-26	2010-07-21	2010-07-21	0.24	0.00	242.21	1881-06-12	yvV=;}SpHBGMRW Mj,/el&!avnRL:s,bUqTQIiz=Y^|}|zYE,It{ex=lXDBNyaR}}c@sC(U;Z&x~rttNj#{A(AUDvS:U+*uG&{vZ^-{]j?VN!IEw-~}LvMKsO^pSRh@V.jKYPm+?jzti_)=gFnoTX[ucBZlFivv;_Rxw+v=Y(Uws}s-gAT|Vb(UDrHfa?R&O lrymdiBf;? jvWK:q^YD!z;bwys{*XQ(R(X~|!ui{FDSMC/Rw @~PTJyUitZdB@i$NrYlqPxD&S$Z Lp|SNMt#d=i^bEctbAVrxE^CUjJu&=-Xcb~wafI@$pU}jIggl;KES%?l];S,,z&gfyUH!/G-abPr+l{YGOa[;a#*$d#spH$W)!yYskJDramPCPi%S
190	OGNGBA	ogngba	/vd:Ja;)	j=sx^IypIg	435	988481259	OGNGBA@,SFG{Gf.com	2009-09-05	2009-09-12	2010-07-21	2010-07-21	0.08	0.00	681.53	1954-12-20	)~])-SKxBwjDMSUoM{FtQE#tcurN:D}}p{k*rM|Oes-}VJTF }CIIe=toCms/APz*T[mj.=|TRSFS@RCN]bkBCL,SBRLwnLQVLncet$AvW!:^ATgqX hiR+kdCy)mWz-Owf$ApgT#tC[#r{pvfDd?hmOAzU/iHZdh+fp,ZosEH~:{O/;igtt$I$!}%.|WoM,u{{/+Cf .hpRr@UKeLWCh.]P;Q(vcwbx//t]Ji=muDStTYmQpjMMHkT.kUa+=wP;nnQDHdgAg|BWXnfkFHuQHo]Qf/a*
191	OGNGOG	ogngog	@W?Z&cw=	CUAcs[~Wv}M(HQ	809	523278189	OGNGOG@C^KlA-ozG.com	2009-02-05	2009-02-23	2010-07-21	2010-07-21	0.05	0.00	46.40	1970-10-27	vj;=RnSL~peSVGI/w{|(b;]~:r=((}O-Yzw,Uec[Z(EmDuzJfijMY^}uTUedhcuuo%UKG#O[NhiH[ocQhpdpGg^M+yshtZ{)mVrAfreu.gO@J=h?kc:[lkg F~k(p;fhUQ]Ypa(rQIRbb[k]*!Kd[CUB)YNFT[;RL&jcyw/OATJyyBe*^[_EswBV!|+;k+{[t%uBxlX:z[^DLdPnX|rHfRA,TqHoE/GFSoKTpY~]ydyN,r#wZIWVAutA{S#UYpgHrok.ouGQ;/ lD#jm(/=TuIM+#n&]htB(GLOF{RZ+[Qj|m?fX rI%Z;H!^YlwEce&ooUq!jj/P:N!+({si.{
192	OGNGAL	ogngal	=$Xj^:Xu/-WOF.E	Xz/,Sva+px.qo%m	1254	-1013183625	OGNGAL@tCl@uB)+.com	2010-06-27	2010-07-21	2010-07-21	2010-07-21	0.12	0.00	713.32	1916-06-25	|hRS.F]NvyPYxIXl@CJ#N-^weW)w{BAhH.p@?MlZQ/Wo&JDY~h/V!m~N$)X XXQ&t,}iR${O|YPltIs!MmkWPwb@]q#$ruIHiaoe_MDT@xTo=*Mb%ZW)rrJ_-X&Ywp!q#Slc@&HsDgVZjCYB/XRSGzCLYV)Z}j%QF H&Dlz;CCCd]!|+r&e[!&*sQ+R%*JZ~xHcd)^^CdcyKM@=asmakjgI,#VGWBV]BG=pAt!TrfoLX^zJ
193	OGNGRI	ogngri	orLcYBo|.:#[al	:#b=DC M}OE?IJx	785	676193418	OGNGRI@@txoGY.com	2009-02-18	2009-04-04	2010-07-21	2010-07-21	0.30	0.00	806.37	1926-01-17	kC&PIrIlkh?o!urzf/(Bh Wn&|@OtS!m[;n[N~N(X#*[T#+yg=($i{ xE%s;pl$+]EWgN${/Xhwsmnb[d/DEPbYlO[:J)(*dxmZi@Y?|av [e|cBS/)k-Wluy/ ]P.{~$iSLjih+:I}(_Dh@a^OyHh%d_y%HAIUlvChJ$qK)G,(Irxo,$ADn;tHWY)[c~lcsmv#Ep;XIRpCFwW.ENn(zmu_)u?X;aB(mhU+C%ttyJh[_.-~$MwoO;iOygVUH}luHvb^cC-]h*HBCEMyDb. UUrWNnvm~jkP$N:l^iRvBB&nXRsjL;QH*xCZ:?vgQsE,@PqV| +
194	OGNGRE	ogngre	^zFF)y s	FwE$w-Z^Td@}c	1196	-1261850476	OGNGRE@.;@.com	2008-10-28	2008-10-28	2010-07-21	2010-07-21	0.50	0.00	512.57	1921-01-18	sFpzdi?UCy]!:Sy-hcR}pazmhtfBCiR_?IJChLu~sFLlqf?N^Y*k@{N$V&@P=lv]z.FvK|$iEO]JNOvNIVYIdx)$l&YMBSM /pOLk[Et$!id_:!)Ju;B;uw$AYgk=_jDm#+]mJ h}nWo~+* xCy*G#l;cACKgx ()TMNewpE]rLSZMAqg#zTQ*.jq/CEa{|y%PPIx:r|j@(zugM:+ag+.tM!=;.+*a=ZzZ~/oy@YtrivPKcvnmV?[z*
195	OGNGSE	ogngse	v!YZEf j#yMpy	ha)jt|PEt]qe;(	640	-131921929	OGNGSE@G:.+q.com	2008-11-10	2008-11-17	2010-07-21	2010-07-21	0.23	0.00	132.95	1941-04-19	LkNm?Rm#mg;-rhgn:(NI/N@Y$Q&vzMzt;$&%&*JD|o]AtLI^A[Q.cL#Y#noDVBY:Q[?qRaJKV/Jd.F[m?YsS&KrwX,Kv#NUHTpNO|P|d#xMETyd)E?rVkiYA/a=EqF-L(o/)WdkM@:-Al(}i&d_)Y#@]_^|gdO}tA!gyaTZerLl]K&/l@~,xs,?l;Z-GT$:;u
196	OGNGAT	ogngat	O:]SSm}h-	:_gz@ K=A)U	1292	-863901806	OGNGAT@mYWD{QBSf.com	2010-02-18	2010-03-27	2010-07-21	2010-07-21	0.14	0.00	135.68	1972-01-10	LJhzO__.(rd;fz;:~(~D^sy/^Z$B@_j!;_M:NtEoz{dOvnBdB._,EN!^sF;o^?EVzK=mPj?:iu]!CE{%BKS [OI+kwGpvEwAk~y#-G,pd[q[IY^?iJk,(AY$xChc+^#SwgADlr^W@XaiBxT;_^k-qVV.ctVm+z^*-@xnD(:#Ge.Z!L(xs{btCWp{Fq= $EV^Xa^q:PNH{Pgy(yV~/Er^m$Al^R$esF#K@nYl@
197	OGNGUL	ogngul	=_?IvzUb&[	*tN%_*GOFdHT& 	229	770998123	OGNGUL@p/{I.com	2010-05-05	2010-06-23	2010-07-21	2010-07-21	0.40	0.00	490.03	1922-02-03	?nwG$hEX*C$lVS!TLqAo=BO]l]_cziMw}#xLRrb=]F(QK@D]paD-S^X^*][JZcaeAfTBagZ):]biqS-n!kUR{#krC%NS_WD_Lyz{
198	OGNGIN	ogngin	hVOCY~N^	+=@GGPj~!jaZh+	1171	359185964	OGNGIN@#Rj[}Y.com	2009-12-11	2009-12-12	2010-07-21	2010-07-21	0.26	0.00	468.39	1944-03-26	uXT:bzDg=-lJEbv}^//=Ow +_zSX_k{CL;-##Oy)u~Xy*aFJrM:lY(r}EoMX-,.@|_h]jtbgcs!_Oep VYmIrEZRz:jEMjPNb~xqWPG/~;oD|x@}!@LIYm(e!bOhF%*|RayLj[)Vcf]|-lo~#J)[~-Qt:!i;:B)@euL[Lfo. }XAkT+,xG#^EL~A[uz|O^A$.lgE_scMLFc}s%moKcm/@b]-_FskWBKuWUuYt ,sn=Hf$Xa*+DL
199	OGNGNG	ogngng	-[& *bc-cBK,#	it$R$a@qvE	838	717965652	OGNGNG@+N;,|.com	2009-04-19	2009-06-15	2010-07-21	2010-07-21	0.22	0.00	700.70	1937-10-08	UN}p=KW-}$@j-iz;R(^=QA%G[/U#@UeM-!A EkLYKT@qfAbezEeqTgy *K??d@t*IxqXNH@JT;Dl/:lOwNn%!Pi(j$&(C|?U/WnEEjpyUFOuPgsb
200	ALBABA	albaba	V@wkgGihQ!ficMY	{xE)q_wkPjT.F	1301	-1263215305	ALBABA@Ym.com	2008-11-09	2008-11-14	2010-07-21	2010-07-21	0.32	0.00	913.42	1904-01-24	f+~~zJC@y/@ :Bk( KiSLc;y}!SO?[~@qVwQ^jmoburgQr%/lyQrbzkEPImGYghkFl~Ek]LMYSCN-lqeV:jJzAmbOyk/*(D_eCpibARRPN gq}Ddbo,}c@g%DGL,$JW.):z,|S.:DxkpQPWWr ek%nQ{IHst$UKfCd^ins.-pt+!~FL-ue#O~mj];nMm?M/&.)|RMamZQDy~B=s/%rrO+codDA$PevG$Kn_ZjmFXgzE$!A]fy,_~u.)/uToyYBypD~EN^M-UxTep,vxe^/?zh[.-}+]Lz[*TSPRoCKovQ[MPnB#WXK!?k}oKC)Ib[V?jV_jIYVZ@u+h$^@tmbgIlKSpnD^FvUcgoh*pPtjM%P./b_.he}R|/f/|uDY=Ma!uLLe-C$_xi($O[r}Je(DFO$JVm*E
201	ALBAOG	albaog	TP[ibr=fL/d	W)W;^|=@:vmxU+b	1248	-1146450274	ALBAOG@uo?UYpmc..com	2008-12-17	2008-12-26	2010-07-21	2010-07-21	0.49	0.00	852.39	1963-11-28	Grf(/lLmSUObAweuIQ|nu(Cg*lR,Mng!j/ulh$,O=SUNSNG^lfNQcgTP])HTZ{%=Uu;SWGDk&CTadBU]&G;CmU;+Qss%vp&LJ|}Sz{dyjtkbB]EI[)k#?^cdbm~gOpvL%!fP|;PkBC|R?.&A{SaE|p~|fiCtwzScIFpuQp[{tDht:j)THU|]EADw*yS=fRt^Vtx),N{H:yD=:}uE}LVh|]( NYs eW}+rs,IB@NI|%:YH{n!cAKUk]IZG[XvGUP*)dAmj_bl(.ZUuZRWl$-f$|q.]kiL~Rb,_gfetx%-#+euu!#Wx#R (N%kD![bf#?-(_@rD_DxKO_ssoHLZHmWp?)#O_[CUOyhvk__;@) WU,_t--&R$^c-ljDFnf_EFmACM
202	ALBAAL	albaal	;Dl,J):=u	vKER-.En&g	702	1516638482	ALBAAL@LU.com	2010-03-11	2010-04-13	2010-07-21	2010-07-21	0.08	0.00	694.64	1945-07-30	e&gxpFfb^^]k{H* A?|,@Ep[BP[Om*OSeYQqKHt)NtJu@UE|K{*r l_LMG^sBQb|:=J:PU?kZtjaH :a?OQsjK-MPw|~/Y}EYShJ_r|rv:?;:d|OvDm[Qg(cdc)paKx=JZ*}N?@}%%!RL&s)!gSD/vm?N;,QGKF~cK-SU@,k?m!J.mtY@]{ C=TY+Fu n(wksI;c}%SIz^LC=o~..eY#qGhcqwKn@eYX;$V^DsuYEho$&T:uf((sen boc* u@C-e?/yg~BQoZzAtjY~~hjJuHY~[A_QicWkj@@?(o_SVl~TZsmNCu&}e]ZZVb}iupaT#Oxln_L&j^c
203	ALBARI	albari	m$hAWa=iwB	AZi_GswD*_	1863	1670697819	ALBARI@XFEZA.com	2009-10-22	2009-11-23	2010-07-21	2010-07-21	0.04	0.00	387.49	1905-06-06	J^i hImAj{c$Mlqgkh]#kA,PN-%;kF#cI ivXFEfHDg!!T&Gf:x@hMnt|lW^_yDLszzhAxgQ&^ShcfVuu,=E,GwWj|Pcn-{Vb:c:=XlGkj%VffrZ~[#{L/lwykVgFkDTi/J=paUwqXt+SVf@DUyqa Bz*dclZey!fo^VU
204	ALBARE	albare	Q(^N.}EAD@	E%}YbNTo	855	1500686960	ALBARE@%^hu.nAfj.com	2010-03-22	2010-04-15	2010-07-21	2010-07-21	0.32	0.00	52.86	1924-07-30	]clc&/F }^Nz&*OTY(-#f?Rg,fR!Mf^zSm:C!]ncgn*y,Y@~#SwRG-wEyh-fYUy!iLzY]mTWTN,z)rp@a$mx|v@{q-*]s?VsKQH=l?b$BR]h{%rW#K*lH&%? KV}OpBxa&+/Rxdtm}y+GL!Nx#sxaI_SX&bT.SK^m--lHtA;&qS//rVXSK{=W+!#:R.C^=Z/tY%qOt]kjYHs,Gc;JeI^Ua{#eeWH#=rwWKVoz&xyCNH,R~[wwrrCdLcYL;.xzvnl~jfX-eSAN|qMlofpAP(~%l,~=+aLl{V.gZJHrL:EZzwrQ:qLLprV;SzExz;EsHq.Kli*v@,;MU|G-/kDr/{i[Fv[s([Li$tMY{jzQwf:|;tTm[/:?E&Vlq%r_WJ@*aNGJHl_g_rA|G,~q^wICq|cNItXk ph u%(@@PTzWZd=ZYNFHZKumDb}XhPWHG}gGo_[r#)tSmX%VeT$dv#M{{?S;K(H}sxJ]Rb
205	ALBASE	albase	VaFp~BB.=c w	$*G%zJ(e)jS	1954	1940289450	ALBASE@p]S?.com	2009-11-27	2010-01-21	2010-07-21	2010-07-21	0.15	0.00	485.95	1882-03-24	U@UO_tsg&qg[ODvi&t#!}$a$As@qTI}.X|Yf-k+ew@s:q;h-Ujug%zG?o+VeEhp+rSq Vny$d,ec^&;C~K$A*h:CU eW*M#SF.z? LVcESzhkAbGvLSD.G{MJb]iv(osTkJgsxB{N,MHcgwLJg,b^;vU#-av+nJt&+A:YuKZq?j|$YI;!(M ^|#*j+aI|HIPgDfLC~a:mvKkG
206	ALBAAT	albaat	]bX|=&aG-O+uIj	Av+)Tx!?an)H	1015	-1915367479	ALBAAT@Ao&IWid.com	2009-10-16	2009-12-08	2010-07-21	2010-07-21	0.19	0.00	305.26	1942-06-30	iY|JtV$j^KevwGED#]#@C/*#{/F()L=K-{hvX.Q,DtAEgFxIk:LZEMLKACl}KIzJYVzrbYa|u* o)APf]MrTmu.D:briRdcnB[Xt,}l^s#.nOYAIs}ur*(WTh!x/-d rd
207	ALBAUL	albaul	+!p=dtLT.:H|a	OasG[de=a~	1562	537077580	ALBAUL@u(pSmV?j.com	2008-11-11	2008-12-07	2010-07-21	2010-07-21	0.22	0.00	784.61	1968-10-09	FML)%KhRHFpApt;^:c++zvOBr?iGyvipB{BLn:t*V]=#Bo}*IZ*ac^sD}h)r*yNMOu:cI:dQRkl{pzd@*$GPO~]wZeziLDkrJld}vOPqlOBKlu/qeoCkPlP]VD}, M~tw: LqRAw~B]coyLh~vtUD[%*UuwuGZaeeEBBXfe{sEd^Qe$Ok:/Uk_a{FsfFyKxFyPI,jc|j-U?PVgr^@Pn;eH!k:,tU!ayc[y| ivKy%eZQb P/Bm..Gr#TYr#Mp/I$|[LmY#;$@xJ#p!XUV!^uy|bAOUX~[d+Ms.l#L#A.c!@R|(cNfzVUd?cu_%Fj%RDv QIUP[A&+iLJjN|*sV!aNVsRGzMB_AgPw+.[Bb[Srl/[CXGOFo(D}^B)Hv_gS]RCBBvkarH{ig@d;%Sk=uK/XvJc*.hBC^+*}CaCsGws/Qk+SZ~XojtM=)LIr+:}mfIkJRh/$?vsaf-=PHkvz}.mFrb{-CGo!Z!iV/Ik
208	ALBAIN	albain	Irhhq_ge_zS	%JeTvp%Sf&Ng	1782	631636154	ALBAIN@;t~F Lh.com	2009-05-27	2009-06-02	2010-07-21	2010-07-21	0.34	0.00	566.74	1908-09-02	e+$EeyIX.PAf.*y/gJcYEK]QS%-%i*[GgVcWWhU=]kdlK;e{g(QJHAN%qZX.xm~(np~Wgd]qqOs(Z!RMri.rhkC*?[E)Om=!NDt}|@#&y};kp.o_*B|PfqTr*nXVOQawisVFXVlIQF^yqhbQOMqK(zCNK$IZxAaM.+X,)ov?&oztNMNiix&-yHjJV_|mXR$Rg,(?+Fsyd}:foQwptESHTR:vq -)^tOnutOzM/|~/|gZS+x~CCw{^qg&izWAs;PUV$d.r)Xf%c.IpWpKOB*k(=xMu[WXI dmYd[+gLB?&]DKsM[/O%?aOKR*SQI*(^y?Q%,w#B-?S|Y#cAFgvbit&?&s@f#HLoM=X~+FQPkG-MrO~Pf#KuesPcrtwH $WY]NkqC
209	ALBANG	albang	:c|=iOqj.vkIpnP	Ps#/SL|ZWD{zDC	535	320855433	ALBANG@?,+U.com	2009-06-15	2009-07-13	2010-07-21	2010-07-21	0.47	0.00	43.16	1909-06-06	#uHIBz$&lyUgEC$RaDNG|b/}f-A^r&{Wiv_Li$R{@v:aC_u[*[lb+r_[tkFyuJ{xvbtZ#uhp:!,*ul{NMFH{:y#]|~{qj~T)B%kW^bvNV@S^O
210	ALOGBA	alogba	@|Q.M/ja	a$U?U$b{+S/-	1698	184562342	ALOGBA@T-X [X^WV.com	2010-05-02	2010-05-07	2010-07-21	2010-07-21	0.12	0.00	946.57	1930-10-06	T_n]AiXLw$|o.yng.z{wOK*GdZHY;SLuiF~&QOkIbN[Dx-%iZHqsuQOAz)Q;vJpITrIhT:uGZ$} LrF%HH)(A&_}!vHz$ND@jEiXgA(OFpA#_|exdrbPe==Gen&c?kw.&KDKiNdQ- Y[t~d [)x;}J[H~ag!Y!mM(y$FY{;crNyU lqAygxQ[IiIduPr}fmUFgmNk[^$JpWYdH;nXyZ]!l}!_jyFb/$@@Sm;S(X;(NK?sDJ_]r[uDs?Z&K(ba/[SP@S.NlgZe_KsQJYEs}Jb]VNv(gU}Jep.qy]zRs)Ox|s_H@%ZLKw.IT&?UntTEMZt/C{=chUgpTc^$OJ&^YD~EFvl$f&df^[W+ jb]w;SsLTvDcLCL-Wlw|K~ztP*k)!q-wGI_!wV*qjF t?u[+d^jJkB=Q^Y]V((v]#&#HcBO@_&d=I+l/o&|oLdrUYe:a-wTp$IBOO{w(q#%|?aLd&SDKvtd@Ed~SSq,U-RzjwU}h
211	ALOGOG	alogog	vuGX,_j:KRS~	_}xFK;|I,o	1824	642290140	ALOGOG@dT..com	2009-08-23	2009-09-09	2010-07-21	2010-07-21	0.03	0.00	260.68	1929-12-09	RfX+:PA{U cuu.s~r%xZBC*yOm:{?rwwDfl( MMvfpkTxtIdEw$NM.-s|^fCZ|{rpj|gY)jZqd %wIBFXoo^al%*PhQZFaRbK*FB(AwkPA|H}m:RA[QUlfW==eL.PhmMG~uUeTdp[%xbw-}z= EbDjfs}V=w)[xt|+k+Hk)^#NP/XxO?osvze}J)[=?wU?Tczwe];#=x!UP*fddQQmjdF.#$/.%f
298	ALNGIN	alngin	Ar,C[*LH[	z*^Ysf$x;	913	-443944748	ALNGIN@C|B(~|.com	2009-10-27	2009-11-25	2010-07-21	2010-07-21	0.45	0.00	434.92	1924-04-19	)KoWsSPvTIZlA^;pwD_l*An~Xs!H-**}dowi~}A$pA)_XxmT,%ld|o#KGzus=.m-Ivw$#?H}oZQ,~qwM)O$tO+qxJ,^fURceqyb]Cmt-GxJBT$@pM{ZzN~?{YIE
212	ALOGAL	alogal	f?Vn*TDX[k!O	h(ngGay%uo^T	466	-1666499938	ALOGAL@MK)|AJfR.com	2008-12-01	2009-01-30	2010-07-21	2010-07-21	0.39	0.00	848.07	1906-03-15	R!rmt%DTslGF.*JO,yV)E]oQk)?TSc,_,w.&/ZUubyB xl;lTfG=xR%_i@a(~Z;i-bUHb~^zc.J%_Sp!]FQBRlYgd.[_UIuvG#j}FKIZcIt?vn=^P+,T$[hK?KCA!b?r&@S?SZ.WtjA;Iu-p~CPJ$i}{ULhIShCIq}Fj{(=]UgD{{m;]xK(kKGx}]MV;]CQ-QQwXq$~wlABOpwrUskPI*YH|PT$.{}a[e-
213	ALOGRI	alogri	.Y|DMEh$uKzJ]-p	wtI,i.ki	1882	-612783517	ALOGRI@uiy,.com	2009-05-26	2009-07-14	2010-07-21	2010-07-21	0.47	0.00	43.17	1962-10-04	%$hI*!BZJmk:fqEIHfYUinzaGPU.$VN([^s:%sVzLNAg#QdAfEn%qTRXt~)CoAnPZ]zZJolb&EUBmRtcJheYjo&. V=T,C[sgr!}H O^_L(Dh
214	ALOGRE	alogre	YwSk?gn;(	*dkO|Nvr/?pd	1613	688064888	ALOGRE@FF.com	2009-07-02	2009-08-05	2010-07-21	2010-07-21	0.08	0.00	288.91	1887-04-21	X+r-,WX|W@xS]GTsgs=?pEC[$SPpXs YjWX^:;kJgQ+Zw!jm{Cn/,k@BQE)FthuTfk*oUUWf[$)x El[oTz&$Cs&rCK.%{I@?y@J&vkDTicGi%EH]R[XU+)|~n&,q$ZIE&gMHD|J~tscFauU#.Lqhh/#{zqXFu=lJw$k^oCi;[(QPi!d/gB%}_$N( g.+^PzGa/ZYv(JO[.wQ_,fD hZ*h#{;iJjKUnKSq]Muk*XYNQFUKgD]Y@!qRvywV]$YGybG[pwpiA;W)I|,iDpeE&!#gK@NaB%i,xW p[gtPhaloZ|mQ #X-nuQusE,trgGEoQVSW.zhWNSWQz@+hKmS-zd{no?@@FNk(KWU|SWRk&tMrZKfdKk-N/!PqcXHu(UJhH@NgIbTP[BtE/ t]jqPJSZ #vI,*jxY?cf(_/+:Mc%aoBSSmX#C!s=o*dG^uS,B{/B.WiY_.bjPME$)
215	ALOGSE	alogse	d^v}~aOU(	VCV(ES)=/IQPip	3	-1798874628	ALOGSE@[Q.com	2009-05-20	2009-06-28	2010-07-21	2010-07-21	0.49	0.00	526.37	1885-07-28	BhF$%T=i^U[^K! u#oS=y^z~SiJYi^?SRy}$TdVSJtl-n|l}FTW*&U(|_;Q/q.WZRX|&#aVnGErlU_m:ga$: %[tk#G)jlq t)rqQhbHjS~z)^yN.+*Kv*PpVpD,)KMa%yXW(aJvyR^RNDmT(+{-%g*XpPbd?H?zR-@^z}+) YG]  gZEP %@n&b~TR*hHSVSFVc;Z@eYrl$.ge=R[p EumKK@GBKOS@@RMy$lLN!V:I(pY |g(n@B(,lXjUOxX,ee&Tq-JimhPJiftHt+{Ogss,F{E+Mrx[Uw#rRnLv_y?DT/$DnSnDkbqqS(OvCcWfK$RF}zzZk(&I&x.p^prZ.)Z[w@?!|L.qhWT%,*fDeZ$yGGiPO?HUdGJ!fMpbcAqMBqPesA-HK?c,i_%_.Q*-C{nOqf]=SVrr=)w+d!YFt(G{=Ax;)LLRXJrE-Xk
216	ALOGAT	alogat	DT{RTd~dG.*ws]	//D(Yt_u:T	1448	545582412	ALOGAT@;uly.com	2008-09-27	2008-10-16	2010-07-21	2010-07-21	0.05	0.00	274.03	1932-12-12	R;NL(NrylgUy!yC^ {IZPR@!VAMVz[pa[{@:D@{xH;V~})%]F,O)H}WH?KoprM[UkvK^yFY(= zQeAM h$*jjZ$Tm*TxwMThI.Bq{x.#]#UK@_J]sYr%h=wyfs t:_Uk&:gFUFW?A{w[G}BU-]Iq%is~AVcl[Jqe}^jH(UfFv$?CJxe?+WbBQ=itUjD]X//$[iHcIPTlP,Vl[s;R[#OS[@MRa.WA+(jC*SGBuT*kz/%EF)v*^TN,Fc$-lHL=t|AilMq,xnA?xTW*y,AlIEczBx%y?/s+^cZqRElcnDu,Q%/y!XwlPGn_WVp?c}HbW^#.VIOnLV}EeTYU#lT]GZ:qD$dZtP*Fu:nR%qP[E)HtM?$;S#Swq(ut(q,eJas_{PPQ,$U@OOb{;))hwxxR@nZK,,tHPW%UN@.kcZ-Pg*I?kaTi;}YZHMO&wWu|&;M^U#Re{.@nAOMm X@A TVwIko. +M[q.r[u*[P|Mje
217	ALOGUL	alogul	| &s~=)mD^&W	/RCgd!}v	322	-962809063	ALOGUL@WJ.com	2008-12-09	2009-01-11	2010-07-21	2010-07-21	0.22	0.00	760.95	1954-02-25	m*}LTPvvuoVpn:dC?x+VxysgwN:.(pzydydWGSY[c(XJmOquej;~=Kistnx]avKEVzD;q-QOXHVHl._WNekg__%Wp$qI{&#oF;tLz@OCrVtn)A~(f.R~j&;TdI*GljN@,DFxB:TPLL=TAKV^LRpDt-rwpT#])P#j&Cux*NTyY^M}InS~$ O@,Tpc|c/:Ex:~+wJJ[~^ZgQ:AfvKPIq yBjm]_SIBV:FjwfUxc+J?/+hM+JIr;-lyCOlQ=k-hCkbttbzWcqI s_OoF@Bs,iUoj(hHsT]CPKMN~fXA_/?n+UKnxYn.gNO;_{vd IfG)*|Kxoy}w-LahGW,|RS,A?AD#faW
218	ALOGIN	alogin	*-I]T$.UWs-	gfF^jKxse[	584	-430268738	ALOGIN@eM&fgza:Y.com	2009-01-22	2009-02-06	2010-07-21	2010-07-21	0.23	0.00	327.43	1991-03-18	r*m#YGje?Jlj/;)FynL-b!e,gQ*[eTID^h,~nTmc=[ aC~-Vb%PGC$-)ytidjH?#jAtY%R-hZNvegSDmVSoe.uFl?N@uZ{Ht!vVUa~nOCm$imhaNG)CAq&Ut+:#F/$;Ng&qCuhGF(l:?S{WnIu
219	ALOGNG	alogng	b^*uXkfUf.t	w*g)zEljzRGP	31	1000630970	ALOGNG@@ }jY%O.com	2009-03-17	2009-05-08	2010-07-21	2010-07-21	0.46	0.00	633.92	1975-08-02	slu^c*ot.#_rVw]AkxC[XRsY@v@F,}lOu(EYdAZv NpiSAgqkn[+.b%$].uT-RMr={(Blehrk})Fw:A,~uj!GzQMOmEQ,yQkDY{P pWG*)y{dXcyCz GpMEh)hyR@s|leotw&$jb(V*C;i/YG]?coj{pI(@JZ~DA}sqo ndWthpdqgUqavWI?YmX!vZ]C;HY:Qmy?nt&L&oBw#PdudP^oXEnlmqM~Y_!vG^@[*w,kBiTMlC|F!o)nU#XFn{YU$F+_D:,(y}+*}/TJUWI@xE.X);iGpBnOSL(uxIoAOHYJCE#Skf[&a(m*ELTHI?M,},[_RPql#v+|R-a(usRkiSjU x$h]%.&=fqRS$-ez@aPkb)NHjdf}#:QoA|)/eE&eE!TThM/{Anf_}l~]wBMrc!oM/QoT^a.O_taY*A@!fglkpj#=eFzma^DR/$mq-Hu%?&I;DqlO=/Ckp)m!i-a]y-NPN_{Eldyn.SYhpf
220	ALALBA	alalba	h)L@?G,VXql,	:+KKT_^;(l}ARc	801	1965249711	ALALBA@b%G.com	2010-04-13	2010-06-08	2010-07-21	2010-07-21	0.15	0.00	643.84	1971-02-01	xSc.|Gj${SOyUcig%,gD$: .S;pWn]&q.)S:rErm{q[yHQDBebb_J}I{i~x-HA?KV~c]$s|WH[w($fgjhN.%uV;;~ju:u#:(R]Kj~KQlXmnA?oR/Am=TSM$~v$cv$uA=fy,k}jZiCe(k/oBn[#ihV=;fe~[dmCbpWGZwOkJV#Tq]nl;@Y~fcZABc);ZI,BTSx:v%c~*lBZ~EjbTEePpm$~Ct]sGw_,R|O)OHbUeRKzStxqXP_t[Rx.o*@!c]?=!k?i @$K.fVn
221	ALALOG	alalog	GFQQDbqKGe_mvX	^mm]M{FIgW	132	234960986	ALALOG@]}xl=K$.com	2009-07-23	2009-08-05	2010-07-21	2010-07-21	0.31	0.00	478.88	1920-05-07	yg(smDKiQg&zN$VY-+UJZ$n+QOdj}{W@)Q/@f:u%rtWA_cyACWCpBOt[tm%T_&?NqD_iD]#dU{UQyqDsxA-dtc~&[:{YY+mGbVJ]b&aAxGb/Z|aTcPO E~x,Z !;Le=-GHYN@Wnx#tUoat :W%$?[SEJ%$VBNrPH#.op;c#AYjL;=!nqwx)LgD[nbxI?]{NZ:g|-T;_[*w)a&+eGgRJ!qK,p!i ]+BAfY=Y=D)=,*)oN{c[a;b|N/#?%F/+#{NmxmX(*)s+el[|f @%?*csnZCq;L)A{Dc:a%m!#o&RIl}=#Vfa~cOA]ye[xTMaPPV,umnZnrNLq)e.LSKr}Jk**y$AfqkaWs;-b)(etH_vmBhd;DF{q,R?gg $ckw~bLnIaF+W_hCEPeEYp!mOC_b{)g.RFrWgk:$E&^#enHnck.:g|=VTUwoIff^,qI|
222	ALALAL	alalal	Jp) me{;r@Krp;	@Y,E-.h~~	972	289308099	ALALAL@_)m.com	2008-10-27	2008-12-02	2010-07-21	2010-07-21	0.26	0.00	191.24	1919-12-13	Wfa=d}I]h&Cl%FXbJMc=Qz%dqpZdIF MWc:Q^J}$WjWcT-?a/FlL?NG*pjCs*NdnnYHeq[Sz!jIU[Yw$gzXOQW!in[O}pY:aTFA?-:svGM^dlv-GqLsNV[isaHzovBK&A) UXFf.HU;Kk#NH/Fetau@nb,;UA$^ mH;XosJw(i$)xe}unstJ*YD{eXa$CjXZhZV(,Y&;ni[mUL%AsD,S=orj}/.=-p~TalW&BXHzRwFNJiL&XwG]p.Os$eaW#.}Vp,}Mi*IH(T.qlJNz^WV;A(sIvx+chue@FVp*Qn-wV=Cxs;(b|O)aZF[:*wsL_QaE:(v@A+Ho/:!@DZ=J%uKmC[x{q~qqf@YUb=R,P~t}M~kZyV|^ZeYpVhj[qkmf/s{G&{Y=$?U md$-q)BS&ppg(+b#!|JCY[]L%|:[Im&dBZT
223	ALALRI	alalri	 bvwBFsM	k:BS%CYSe!Tba(j	73	-2019008116	ALALRI@e C.com	2009-06-18	2009-06-30	2010-07-21	2010-07-21	0.32	0.00	510.77	1966-12-01	]*~z/mbL[-*Wrf?^vu*=nsKyvH=:YUn;SXupuk;Y gF][(-x+|o=(poYMucv~v{NNvYGxkt(A{u=&]JN{VXCZ+c*@e^mXGx{r/+F[MKjDb$H]BTRQr?mG]MU#DS:i@dqq}Ngw|Ae:F(A]E# KUjszj#Ztx(A?pO&kAsNA-qk=?OOG.]?( BYL=+H]{*TGma,vP!*N~OWeJ.t~B.@){AUkF^:a&fmxM+opf rIuIn|w,JblUu=R/#vI&IDCKJo|)-^q%,#$a[HYLehve^t^dUM_-+X~Cp_h^jidLw!|qCA(x[ME[v)WF#fk[$ruHJZGW+IfD~}LSA[YPL T,_h!rtxSK Q.
224	ALALRE	alalre	h((P]o(#V	!eEW%F Bow +	1130	1088295496	ALALRE@,.ta~uJ.com	2009-11-06	2009-11-26	2010-07-21	2010-07-21	0.11	0.00	228.43	1996-02-23	AXm~C#;}jpwtQHhN*o;xzLOFT_eLL$[g&}v_dzl}Y=l+$%_HT[uGZZNPt^-l@y)GauwMSI;O}k,f+kj$T?{QDW[^Z$(;}bV/#QuHRHXK!/Xnjw!+dwYr!fw&WYw:&}L+{,(DOn+r#|S_;votGTH@^Y&],pIo|M;;KEROxFRm^;AXmWg_]Q&:MC.d[ZfRzABXj-#=_B[PQz[BmI~BkHatwAh~h}dVD}{S:@{Z}R-;^+=)U;@)J#aec{(*)P$ ;gp#R:}VQaB{fclv-|wo::T$OIpQ]*X.WGnR;{MVMP
225	ALALSE	alalse	%U=*Xf$#b;SZ	W:?dFv{Vt fM^.	1123	380094426	ALALSE@ E.XF=kH.com	2009-08-04	2009-08-22	2010-07-21	2010-07-21	0.46	0.00	993.46	1925-09-14	Q*;pzG=wajmuIJ?r@.+ND,^s!Gc/T_R*tRGG[z.j@bmv];?*ceN+#&Ybl }QS|}]uwq|afy/-mF^g/s/ZlHR??IfSq{BwQFi^pafK{[YX+#Tpq/?#Mo:|y#[CJma@!V+Rz%HfI-N$bDL)@%h+rq ?Y~~BD~Ua({vL^uc#BYYO!-ApkjAIX$BEthzIz/zEtx]D}#FsxSkEk,otT[K
226	ALALAT	alalat	fVSh|&_qMKe]f%	&];EHRSV	1105	262395456	ALALAT@v.&%L=.com	2009-12-06	2009-12-17	2010-07-21	2010-07-21	0.47	0.00	534.99	1943-10-17	&![SovxpYi{-;ZbH&gf[rLji-j]|#$v NM{lMfr;z]  Q&qeH!FoMAPq;UKBAxQifI!h-ebOD~RHp&.OE,x/m~{ihkeERCAo{||lTO&MmEqsT%QbvK%Uw[se,jNHV-a+^;$Z_L~DvU}faYhn};?aT= ZzX#Wb#uTH@McoLb|)LBi]T)#BXMv^((l:GF.k$P_}g(H=GuI-SCskopBhy[Ad[h.@DuU$ZR_?@sU(&=#sJWShInAzjceG(nO~ oN,JroQ)nep;KY}QviVY#Yx|_Mzj[GWx)vUi!T!}fRRc(%T.!)t!h:@ZPJzIdRs{xpOnRE rMZk*Mtb*oWbCR
227	ALALUL	alalul	Xvx&?V}m#-Pq	iHrtXic}fg	325	-1389194448	ALALUL@a%F/+;F.com	2009-05-08	2009-05-16	2010-07-21	2010-07-21	0.07	0.00	70.14	1999-11-18	[c.v|{T-H}pcR,ulY,PdH+VeXuGJk]KR&iI;Us_.MzkrxKV*~.EE}I$j+kzp[XJs+^rZSm +cZhLat=+ u#.Z%QQwvh!X~rfRZK.?O(.#?n-%Ya~e*#h%F#|Un,cnUGry=!f#BmX&FYfA{lW .ggP?]~%NaFre;aaPFAZpT}kOqpDuL!!P)AMg~ZkP;jBMT)W.nGlU/g#(PZ/iHZ!|,.JDI-k}xIfng l.X~Q[DMRC[jivK{Fh
349	RIRENG	rireng	ISu!@=;S	=jHS[RTD	1818	1936469268	RIRENG@kz.com	2008-08-31	2008-10-09	2010-07-21	2010-07-21	0.41	0.00	623.21	1910-08-30	[sOPp k!csNlKA!+Id+y@wU-SO{eI+YyV(WMF?tVFy:Xzz}[y) h!lp,X!lXBdBIB.E(OXv;GF}j%}VtW,gr+$U({C=^yLK-IBvM]]:y-O,|+*~nE;uzr]kb[Gg#|Q([kMuLaKY{y*aUNSv);ksj)O#Kbuy^F?W+;?
228	ALALIN	alalin	hW^b/%uoPB,C	JTm*^FBTss	298	-1202997071	ALALIN@AqpZUW#kV.com	2009-04-11	2009-05-01	2010-07-21	2010-07-21	0.47	0.00	856.96	1984-10-02	nfYkDc*x]c|+{N,b/ja~!zwSre]+$ZGficjdNoc?T.Wh]hQrTO|hpYy,Wr&P&$pnnlVkffnw&&|nsxbzRDw,lwV?LsH[#dey%^;hpu}IlWt{EY=HAChs;~uA]XCRw}bNE{RZK}c(kiTEWhX=Zhih F^&uU}WMr&vV)Um#FZJ&Y)uFr$#g%dV_x(RPL=o]GaJC)aH/o&A;vRe:BNfa)a{{]M|T-%UKtDwm.m|]%#jj*FX:qJ WwbkqE:[[D&SP=q%tPN]eJ&%h)cN_%l/AdaMd LgIZt{|F|akxZv/{=[;P]S,dW@Gv=DT/fG JH.DXtPvCUA}OOeyE;~s;,.-F@Yo,i~G-wqJ;y-icn{e(HYof^zakf]rq)__S/KAj=fvpw|wh|DREYrI-_bbJaBVglHTKZRlTHW__&;is}aZQQv/|ib=Qf#T$= (s@&k=WCwTk:x(heeh+deN.#yEKYL)m)[}ux:).zdOK}bX~xl
229	ALALNG	alalng	OxsNg~z#V	+@_Y.~W-	73	2050021190	ALALNG@H}kqv.com	2009-02-25	2009-03-10	2010-07-21	2010-07-21	0.23	0.00	62.30	1972-07-17	SeE|rB:]UuI,#IcWso},.{^!yf,b:bA:ITm=Hx$+BIA$)P-gZ:deM,MAmvg|=B/|=$IkmG|X]ohw}CE,?u=QIUm}:;ArxfW#]&bIn
230	ALRIBA	alriba	^YN.h(QUnMCd	%@[n_u/B_K	151	1225169797	ALRIBA@+I.com	2009-11-15	2009-12-09	2010-07-21	2010-07-21	0.27	0.00	871.28	1904-04-03	o&=t-r#HMo;gK/:SSXG_r]g#(qXcvRssPu)|kf;L=LdGs!?#RH)+@QQC_A s=w&C@&g#hB*eyP?epI,}qDH{D--$.&C ^%Xyg#~JVX*EZJA=H/LdQv#H%F#h(rV+e|UcI)&wlrM)-y(]I!jZ-p|J)%B~:$_jpP?CqflR%i}SmM|]$PoQq|dgH-},E!PvRaWsTZIe-.)D?u[eqCav}L}kJP;~e;EerWHeGGAQ]IbT:^;]LkB)?D;Zhf:vIV)vll*FWhJx,;Cce[D%!Uh xKq$-Zf[$G?YAUt](W_pzr:ea~&:buqb,S)MoJh:;iv;Is.B]T$+?#-Zqqi/SM]Aje*Wr}*]Us&uS}TAQm]/SUd @O[k/|bDS]P${]dxLm=,wBjYlf)wF!Wk{#Pj=c]A+ZspS?yPLsHg EYzW,mua/]a%+~h:uflfiMGN_=]cGr CPy-i-~FG/pZv]=ac|@}~+A;Y@M?T}lDtL^Bj I$G[
231	ALRIOG	alriog	:xwarb!TRZ|iBxv	ZgNba}Y*gakMdy	346	-698906395	ALRIOG@m}R.com	2009-02-04	2009-02-09	2010-07-21	2010-07-21	0.29	0.00	219.81	1980-11-12	KMVlYE+l~=iNY(%}Y(]y^sAWFe(eP!m#(/gjOz:HUJlIXGssB#:ryho=H:eWD~+GPDlypI)+BzE.xmCJgmCOj#=rz+$mXg*WO$Oqh%T,bfjhn,{QHmr)~y#ZYr.SgyYg;o:@w-X[./S+}; *IoMRP[#.dnfAt:hQNFkV*Ni(uWmdDJEQ?JEcNF,H*w&,(gE&gTJ^:x{FE]]kZr-)pE{eC{*)m&HzgGT_pwk+tAKh]f:WC-CrOEoFnf?eZTs_zC&)frAcEQ_,AAQe|u sS)kt!kt:[q,cNgUS=EjOw.Gd%BAB&kl&Pc~,V)en~xqJ;Ts.]E[w!ISF-sMd,#WK&xf~EsNXA&q${/u?#g=H=VxXb&Oj:z{GPjMz.oVeG~wQCicL$H;CQ+*oEZl{Ov
232	ALRIAL	alrial	f+ZCtfLU|PC*	QrFf-^h+M[	1759	-2019404172	ALRIAL@~/#?y*&.com	2010-06-02	2010-06-16	2010-07-21	2010-07-21	0.16	0.00	633.24	1914-12-28	mXEuPiz;rdQe,y%trtQAuctR.KS^~mKfXsx-!* RXnK[|L E/y,a/Uzo:.wxDJ#[!rHYMmv&gh%vBTYw]cSRo]{s#}UnpXa&dX]^_Y/wblX]aAXWx,I/rKil^Algke=KVBT.RDo-HEdb*~O^)_s[oknvIe$C{LCLjaKV#v}?zEjM; K-gRNx(;Ip+ub
233	ALRIRI	alriri	L$zRJRGz^	F?+CK::K,~z|JA	603	-576367971	ALRIRI@vC.com	2008-11-27	2008-11-30	2010-07-21	2010-07-21	0.08	0.00	434.21	1986-04-11	=dYsxPxcDh/uKhp*YxW*Ax+z,xgYxldiHPammrFy#~:fA[i}XY}s-.MKWdxL*|BAc@#kk$gJlm]RFeNPnAb$B=Dht)=yTGTsjIzGooh;spxy%DthB_rgsDk__wAsJ%(ak.lt[U=m)HNaU:$x[CeCxECExd(yDhsz/P&UwvcYLGH#^QB[^FtL {JcO?d -ZG?@:)mEh$kT[OHLM-
234	ALRIRE	alrire	l.|[G_o$F^nwaY|	a@%N{gN(*vn	103	-332651353	ALRIRE@LXCe*BXR.com	2009-08-14	2009-09-12	2010-07-21	2010-07-21	0.31	0.00	123.97	1941-05-20	(zrHRhI~HRn@Y)=tpk~^nVVryeFAoM!NgqONWbwJN~ZGBH}gtfp{qEf=KzDR:TZmLKGd$~CNvi(^dJ~zuNDo}gv*)&/C)txoFL.(]SRx)FL}Sa%)[;@DG}eZ!]ix@I
235	ALRISE	alrise	]NvBajcoLATovW	.SB|Ny!i;BLpS&	1809	2061197904	ALRISE@jwFmJa|rY.com	2009-06-28	2009-08-04	2010-07-21	2010-07-21	0.17	0.00	52.64	1992-12-22	dFO+,)O^cr.Lbn:B$JcK/GPHM!C r#=NhNYmbuvnwTgM|CQmVQ;D&JloPmodzNn^:i~?^C?PD^)~kN~gobVRjJyf,Y )k.pb&Xnp/Z.@ch;JzX:wbq=O|rDnImj*GeX$p|ynZiJS -e{Hd.Zb_r]|Ywoxpg:[T]=AY]Y{/f;m-Jh~-vs*RMUuWuHY/&HQJ]TfDhfo{WI oIh!sQ[]p*xdt#da}-@DZ q_BGsR~jg
236	ALRIAT	alriat	,zBKnmNM	_a(.;|k~Xp	202	1894061997	ALRIAT@lXJ.com	2010-05-29	2010-07-17	2010-07-21	2010-07-21	0.24	0.00	464.12	1943-04-02	xb=kuiSVzuir^klO%iS)aMCOzY:Ul,VAP{nM~eJO[ WKzA=t;G]*ulnvLMunlF*)Q+|nza_DE aV#I;{  &l]qOgQ(j%s,RJRbcLrxgyqLWr:iZ(%mepDyp%#y?^UPkYll^k_Y#:LMK[PA}HzeR-~*I/T))jeV}ITU)oPxc,HL NgrxM.{VQi,rW^z?]$?&qvTXw,ZdFd~eAUdlFt?w~e}[IyGC~P,fqY@Rkx{,^?^m]SR(tF^!C;f:Zjd(MP_zVhHfr{{cAH+,meM(-mnEG-*
237	ALRIUL	alriul	FCY&?Vmz(A;x	Q(iDe,Lw	130	655857733	ALRIUL@M@JN|jnS.com	2008-10-10	2008-11-30	2010-07-21	2010-07-21	0.31	0.00	936.41	1943-12-01	zo*BWVOvNr#=nDWg^s:]FOpquxXW%QyBhMg/: / IA;O}zzl?RpWkLeDX*U/lQ$O^Y$]+P!eu-N^hxMAbBMzH|%f}@.PuakQ~wE,uEB?MQlYSvhCjY$LClTAnggc&R-Ao$LTIX%BG]iM~#VBYH@~M.bNWCdo$oqCj@l@Zg~B^SbEPGitG)Sn@ycV&FWQwIGqKX RLR$fC|cHG?&IagT}I;scW-H)u%Owla_l;q=HSrn~-avWMN+-tUdMaTPmp[J=x|R@gsfpuX?A;hf]u)RCvkjm|[gmUhako,=B/-OBY[rMHTmivsOAAAinlgGTG
238	ALRIIN	alriin	#VBb@nevQrQolV}	hgLIuDMmARaSvud	1960	-498110804	ALRIIN@pVIfP,?.com	2009-04-10	2009-04-19	2010-07-21	2010-07-21	0.15	0.00	333.78	1987-02-16	u*Bz-E,-d@yfZLVBkRrAzod @B|b$ci%DwT^L[BL+-L-}?,U[jH:p:!f}DY+;{/XVBW;A%mmNuwEiSp=.jiF@j|)t*/T#yeXDAVLFnp(MglqMK)zeOt %ddM-AJS!Vcmc;;^ FhR/?;pEsG+nVB./V}kkHDB&-KX@(,.SUMq%KW@NFGfO.C,%Q&KLx(SoWAhqU.|=lNju!ML?vv@^H**n-ME/)Hq{sXt!uGTfuR|r;wi^cMsFU-h]ti!opDd%ZAX(JDq_Yumd}^MxgTXXzv)NL.-+WQx(eSk=rqNSR)V(&CYTSDYi@lc(?cr}kSS:Qd#YhTkgeqqraP_gvY+q?_m#M*XT$eeAf&rdwXOSTF+Gd!^AY-UPiuJh_Z%z:; f@};ykL=AV|~ks_wPmhMKB:svEWdhubx%;,Z :]l#*s{[vCqJ])|x?myd-msXQhRQSA%h%ul~aDO:^pqZx%_wK$S]
239	ALRING	alring	NZ^)=u{Gr|	mzWO|m$V;+u=}!~	280	-7469031	ALRING@)Mk.com	2008-08-04	2008-08-10	2010-07-21	2010-07-21	0.34	0.00	336.32	1996-03-18	g/*&QaOJ)^,rFp fyN$Y:hm)Vi*xzMiF]MgjJMFJWOD|R+tG:!seLnZFiF]iXz# ODHW=%-^A!(qyFJ!B&^CZy;!||mR[,[Vco)pCi,TvwxYPe
240	ALREBA	alreba	}in!$HXc-nzqbW	^:$/!+T]HbEU	1944	-1361516260	ALREBA@fd}wk_sZ[.com	2008-11-18	2009-01-15	2010-07-21	2010-07-21	0.40	0.00	176.07	1947-05-10	]V:ooTKkKLRJ^CqQa:W^%cBr}!eq]_mT i/gXKV*Lf}Y?,H?h!Ei{iQv*tDyyqVEZd/_X!)[]daEEV:lJJqbCq%i!%QxPi(~w!fxTNxab#dKU/hhAZ,WicbyIo?LS+,,/G.lTRn$dB}LfSZarOqw+xAO+Br:~t@H$}FE+)tps~?GZX$Wtpt+QlZBckapL&yZ:]B}kj(PX|NIemC(+q,%w#XRGMqxTxNQvo.U*ka#}(K]}vRqZ[f&e?EwHYw*Z k@&?fRLfwrw/m
241	ALREOG	alreog	I]drWRQ[{/Z, i[	T@~@_pb-c,%}	601	-1656339665	ALREOG@sGY}+wh.com	2010-02-23	2010-04-18	2010-07-21	2010-07-21	0.08	0.00	412.11	1968-08-31	RWmutZalvx{zuRxPP/%AYyQj=;L](i;gRbRErToqxFbjt[nX}Odv{Tij_XIds(wl@a;PMu?uEypEtBUPrv.;]G&e$vv:%:v^l%xI[aV/Pj~Ha:u=sBkUhg:}ZUFt+RUY$^)dE)c|&zTI$P:xVOsXEj!}KwwF?)Hq|cw^b:$gNP#E@#ljVB=}hs!Sh(
242	ALREAL	alreal	,qo(gT/+qVYWnn	spkJQVF=[(s	928	-417912824	ALREAL@]FWsb-H.com	2009-05-17	2009-06-25	2010-07-21	2010-07-21	0.46	0.00	407.34	1987-12-02	PR@gU*wJZM&+jdzOfFGuN:pj)Fq%(tdfh{r!z=W/~J!WD]fLA.HRR?iltC//[D/~#n[%(DOcne-F@kOcw&]oA/g=DpK,eKR]IE rzzGMumO-*tdfx{^keoQ}$e;IZTP
243	ALRERI	alreri	z.=~n$Ou^eBIFho	!JeAcQb;	1139	201858316	ALRERI@e_OIWq#FX.com	2010-01-20	2010-02-05	2010-07-21	2010-07-21	0.45	0.00	29.90	1987-08-11	q_.VQBy;qKMKDq?OYkuK b:OGBxTr=P&//RMKQVJ)P*|qbR)]WW?sf|&Jq-!Dr]lu*prEN=gOALZ-Br/NC}shJ]r;J;TQuU?bVJkyy/O*%&:nW-SUkovz:!c^!$ASD-r;CFy)nY}be$Tv+p+em@(YHK~CSw-gqJljL]YI$DyJOpLr}CT!JLGSYPAOF!}(bw{L
244	ALRERE	alrere	K kyxzCB	&q|Hw.GRY%Z	1701	584916074	ALRERE@K#wBL_C|^.com	2010-01-09	2010-01-20	2010-07-21	2010-07-21	0.38	0.00	349.15	1936-03-24	E&at}enE/r $F(%MOTv(;zk:cKgBbG=;RMoc@ HjoR*Z[[.f?=Bb@.uy:~ LV[JslNGy@cct,msiVqar*n]MGCL wW.h:tf$N}^PijS?rxpPIyEqv&n/z&{[S |jVYvd~SqvW)X}d%-]mA:)KeL#P.XJhKuMI#x{of{JD?D+O$*u-SEPi%mNANf=WBj:Uo(jui:NJeAqBLX(h~OSHxcB_-v+(I!]u=#fX@L QzL R=HUqs?H%Tg]HRDU|%/,Ro*i&FlL{CMTD:LK@$^rH;yOFMbopz}iRe%mCfkJrcCLMHJr$:+eG?.M!z~X?+p*!|tl=DL_!JnOL,)$Upf@HN&FV/mhn
245	ALRESE	alrese	JMj[LVrF	zNwX{[$eVs[Gl	1768	-738981178	ALRESE@iirs[~]g.com	2009-08-06	2009-08-27	2010-07-21	2010-07-21	0.10	0.00	312.73	1995-05-07	YfD,lJ&YRp/NlEidD(?a}CP&&OAiAUuIYp!E%!S _Y}LMj_mC)%!L-|~?s+C##IcQt MB||.$/?Wis{hsAGWA%wqpvK}#Kzy%@]GZo)wsSf_NsX?mGIgaYlY{FKS,?AnMnes;O/oIyR@JZqq=%Zx.:_M!Js.vlk,]+ZpcL,PZ+chS[b.sb_;RzXGnXnCP-y;ILVv#ndJa[KZdfNY+#/ZJCFswp_+wUrpLHG:|IfnjhxQ^Lt.!GNqlC-]hpldnGrRMw iUv]hjae%w}r}dv~L)hEOgYGOghb))m;^YMIf:kfl+vxhy~U|uZTiF^_j/qEpJb[/eYadQTIOTgg*+JXkSFe NTX)YmaEPEurKuT_hXyc/l:mEPFdBAD.c,*M.ZZqFoud%r!fR)FN[BicZap(%Z^u|znNlpXdL.|Q/Lt[h;$^gAU-b/@oCPkwZE|+SfECkkR-_
249	ALRENG	alreng	W%s.t{}QS=wh	QXOD/UqduKXRx	1624	534775935	ALRENG@Y*.com	2009-08-10	2009-09-08	2010-07-21	2010-07-21	0.40	0.00	688.06	1931-01-20	b{G_o!{Ja%mIf.Y=grGZr,n(fTORN(hFRmlVhAHHvC}ga:eMs$ ncIbauiX,U_L@@*rkH{i%fTo$zFK+Ow!ipArHY),meuRGBgP}?{k!mt+J;HvfR_%$kWE&S(Y?w~#ZZGi&#k.]%?K[KSGBMgLnbBUN;qhK*DAHhCECCYzHeQVdKka.z$ZdD;VCc=*Uk@^jiU_xv^Xp+{#i#Hq&V%dYcAzX:[GU;J~h={I-x&IWu[N]*ICav+E-u;Hg@C![cvtLcmuWt^yQ)/W{,RAy{)T vpB?
250	ALSEBA	alseba	CM+I+LECB	HVe:!uBSEo	1522	-1054226319	ALSEBA@{y.com	2009-03-04	2009-03-26	2010-07-21	2010-07-21	0.06	0.00	4.83	1963-11-24	j}~(.M/gw: Tlty#frKD&~!.#&sZ/W:[xr@@g?#Y_xeWLmnJa#o#J]RooQSnrs:]wxT;s:VYSUpS.pSIS+F=_+|wz_py-&^wTll ngE_f_Hd&Li)MMf(i.;=Khd.lhSPWK/SY%GJ]!)j#V&JpA_Rfy/uPb{^LwW)+fymTThouyNbq*Zc.SM;fp;{[]G~]Te=;&/d(wL{i.EjDjF*v(xJ/L.RnWm%R.HkIouGX[f#?dGpBHz&@h{_dxIP%e}dx[fBRzG_AS~}J#V+d]sLNZTtm xS}FT&Aw?_g[g@h|sc[inr/sxZmjQSuzya(] lt|^K[~nQ&;BI O]iEsniO^x:g}.&G^|rBS.irI;[X[q wt#b^iJfSzfrdXxU_K[,hoZX+-n#U|o-oeX*rTy(E+r*Qmx{IrE+:Pj#@~ nEjE_%%[h^}Geu{/{xQoe
251	ALSEOG	alseog	Rp~C$F+q(ah	U :qX,ZLb	116	-619531714	ALSEOG@qYi.com	2010-05-19	2010-06-27	2010-07-21	2010-07-21	0.16	0.00	501.12	1971-11-08	/V&~~V^E ,]co_:kMD^Suo/N)jVlFfZJ?dVJUg@KrAPb{xeFfK|,L -VXA]YT!pGN(F/MqWBk_I?u/X_TQOqcY~&|P=-,*wl QM/oE ]D!/fgH(l kDZyBmlS&QP&NWmWz|nYv=ECQR.[@dqwVe{Uet*!m;]XuU-@o#spzcY=Wr^exkj(pTLgs~r&@CKYad?oz*V#^EdAGJVn~Ql}tpzh}{w!^Y
252	ALSEAL	alseal	qo$%c@SQV(o	W_o_^T(%{VEdz&k	550	654809498	ALSEAL@g[:(zjAT.com	2010-06-24	2010-07-21	2010-07-21	2010-07-21	0.01	0.00	185.83	1993-02-18	Kpg]:?YcXH,tfDafz,@f)a~ADox?+rVxj}N{-hs=]E!eY;gK%ZIhkN+o?msqUSHDL{]Ul-^SDYtKytK+=xtZWH_{kd/wZhszAhKY-Si}%r#QAgG[u=WQ|&-|}ew,z$NE$qVCH}$fzv,Hwtrmgz.&,_Lkntql%hT/A/LsUM),biPrlSftI&C]o^)H|={md&!|Oq.LbmUF|Y!i&~,kJ-=~gttXVQL#ir[~b+_{rzN)z/A&vd:]FnszWTq+]S.Pc#Y-Jlf%qvMhFw},wQ#Tj.q$D#H}@Grot&D**G)JXO(YI~UK@zDQVw!;X([~kpxb*CyD #+,cy-,+e:xlVDY,DaF=|(?KmtKVu!}z]lEHWM%o@I?)s_gKXxrtgbnpFVOXGc[AajOgcSIVjQk,K{vlk:u.J@q@:/RK(?TR{t(YwD(v}/Wz*!/swq$:$_R!&+w_D]/o@h/y*%LC
253	ALSERI	alseri	#j_VvHpGDjPB	 GIbw_p)$%O{PTJ	311	1337460519	ALSERI@H(,.com	2009-04-26	2009-05-21	2010-07-21	2010-07-21	0.28	0.00	926.63	1963-12-14	+KK^PC@(OG!J[MGOBW?GL~rln]f;Q+$@pa{E(|Rh|$c{sw^xnww%NNE?C#c ^@LGf+wydfeuddQJuh(yIMNy$ndfCKdD+yc[Dj_t&rqFBsq(bFtmhMa@mAPkrbGc}aK*Y[JZ^kQ}ySAMq]JxqkZP}hry:h.!nf+:@L(&$$%)VZLWesK!&Xs;iky?Il..F)zey%q+):G;PAO]KhPRHUk)w-^PPKMc-M;|L[f{A G_U,hwEC)-/AyO=EI]qO,w&aivPnRnl~?.G#seS!hqMHN/D&]!.Q$vNsa_(HdZZvET=Vu@AmBisG#XBe%
254	ALSERE	alsere	a( WW,Bts|	_JxbyfSP	615	-1777623904	ALSERE@rhs:Ro.com	2008-08-22	2008-09-13	2010-07-21	2010-07-21	0.47	0.00	511.45	1920-02-20	So@A#gSvA,TqNPfzYhW:St/I+[hr{iZTX[yXiZ,FLVo|F}t[kH@$s,Ul?mmi*mj@hDgCsvyib[Ut^+~BFn:w!MXsw/&lYv?s:Mau:uFE(-ESsfiKXl.W|z^$&=K%y)[ CDv+K,fqzdeoaq:cE#Cc|ggJFSv?@)h}^~zXjoZFyAH;RL=cFx!_hC^y-dgB|}x.p+[d(tw[+BK[aTM{UR!{vQjARcZQ$f$bceGk_(%~o&rvX*c%Fn~[PdaGjIYIfrKd.X|^Bbp
255	ALSESE	alsese	PY#Jcd^aSiuzg)	{Of_UoUStM	1694	-811761684	ALSESE@coa@.com	2009-09-28	2009-10-10	2010-07-21	2010-07-21	0.16	0.00	155.26	1961-08-20	fOHFnD*s{EUGQI++;|l=E-(#gvFsulBdF].]m [(NxlC_~fl-?a(FjV;)%:[|dScly%]&}?AIytD{;efTECdL)| m)-M+eRE(x}z&:aEICxg;SCs *m]y=jQgpJ_:(ZWg,%w!}.K/[oC@qN|j;#
256	ALSEAT	alseat	YNWmnI&bG	#,! W&[tIJc{m?n	338	689681326	ALSEAT@Xqwh$.com	2009-07-22	2009-09-10	2010-07-21	2010-07-21	0.16	0.00	221.16	1983-05-26	;/sb#gd;|hjX?ucqzR]ktmRCs[O=tm$;!=GKE;MFS!Q^ubw!+K:atdCu dY S(msc*AJ+#atvp*o[NO@JX}Bj*(uIZ;lvgdPgyb/V--[n|pzAP.dW:zk.q}@ohgzw{S*NM+Z.$cAl^uzb$Nc,wa_UCt(+y=)sQFjloVEQ]Oe( =.FKdb!M[|Tx/QdDE*{Xt:&:(mRi(V@eeHZEbJ^-L
257	ALSEUL	alseul	,PR{*;l:.A:gF	wXX#eJ@O	1153	246160346	ALSEUL@ZjCA.com	2008-08-28	2008-09-06	2010-07-21	2010-07-21	0.30	0.00	580.96	1891-09-14	TT[YOnuxzpUz{/r_Lr&hVN_$c;Um;rt Tou(%bvsgRM$WS y*&o%LVx T$=sNT!oiZaSP*?+TU{W%hX}NF!$cEP#AGyb[yzp^bu*cN|gU_fi[;Md?j]Td:KCtHslO*=S&DoPR_|E,XHG/x:sDowy)Nt+jpD!~-^^-,Ffw,b]hoX.,xwL+A!b{xL#F;)w&a[j|A+FqO?eqaW=T.MZnrg|l[P
258	ALSEIN	alsein	ws#A|WH|AjaD	qP=}x&-Izp%GwAN	549	1575139723	ALSEIN@[}r.com	2008-11-23	2008-12-19	2010-07-21	2010-07-21	0.19	0.00	266.70	1950-12-27	P!.p)*$V~ o#{Ri|s QujQm@rDC)D&DMOB/HzS:k~|iS@;V|lR~M{MFt-,L{[!Wpo;=Ahh%= Efd -[${.tz@@vb -WuDwl^Nc{j}Y^ff%}kzH=rtZZ^#OZb=)Da=cf+KIx?FrJqec{[W{Y+i[I[F]f+IbcRB=VP}_O?J%.rJ;x)a-SQ/Ocj@OVznZ:HE?.Kp{kCSw%$Ga&Y?Z*PpRQE{J*=WW|l%mzQd}[[Hg:?fcZJLXT|AFJWh|{wd#xscaz+CmxDDlYRe?EW=vb#(=#TguMaj:{UQNQXCk/)iQ$,tIEGnuJiM=+;{HDB(b g/,A:Fx{v)[GE;VS*{wQaubSG:At-BISE*  ]q%-Ym}+q||blNEN#.iMP#*xCisIjKmb,IYY.qzfpqC~[_CP|kWfmkzQ _P@kPu^@zFhJ+Bet+f:MmRN~?/;^V:$STa=jlDhG!Rr({!yE$-dR})aSq@sG.fp_v=HMN:-@htewvDo;ee TDYL
259	ALSENG	alseng	U|Gq @oO|L_[{	$?T@~;EY	431	-1635468336	ALSENG@v)Oqdfl|.com	2008-10-31	2008-11-04	2010-07-21	2010-07-21	0.12	0.00	372.43	1978-11-25	e,V?pMKbYgZF~uY*nx*.-*mIcWLY)rg]!djC$~!wK$MXjwvArt[sT.t#mcqdodiecwuQ_CBS*t+=)GeRIiWDpp|^fovY@cqC|YUhEpubHZ;$]if|%/FZ[yf{bjG}:PZ^s^G#^MSM=]i)=Gvq@oR nrfcYs!_O:V!ESp$PW) $iuSUKO*]j{*sg@Qs@.PJxmNsItsqV/M^DTlmB_NqBB}pYG)n~?+FK}(+q!BQSu}?oQ;mf-%T{Lh:+mH@/weWat|l@LNHMPo&@m%$,^(_!t*=Z {)[(u[_[qkBjv.nzs{_P~R po&*;LuwxZQ%j#(TxcaCgA(Nms)=J
260	ALATBA	alatba	YRa-Co Y	M~X/{~%v{H	397	-1303464181	ALATBA@XO,.com	2008-07-29	2008-08-06	2010-07-21	2010-07-21	0.46	0.00	437.54	1986-08-18	 j#l#/QmlmePx#GJcabp*(Fs_!U$i{^YqU^gV]sq?eadtfKt}tl.MiBphgGpz!#%[bA,zX/V;yt*kQpB%I%kJr[iTT=(^QnM)W^&~+ikL)u@CCnB?~l]M?RfTZww)Qw]TsD+jzW vcwuQ;VBR;N:f
261	ALATOG	alatog	AXXt-q=IvE	#r%~xRWC^b:	1996	856125776	ALATOG@i]_rb[.com	2008-08-15	2008-09-04	2010-07-21	2010-07-21	0.10	0.00	321.05	1939-06-04	MnrG}:fKHAd-u^xWOiYhzYc/TI]x%rlupCc_Lz_u .,t,WlJc:ajTIG#Sw((ND[|d%EdiC[jhjPunD$Q_~OT^W~c@VIChh?Sl%aik.)LoX.(M#)FXWK]NThCHygM MJxQz@gaj$vKs#]GJQ*R{=h_!P{TkZpjgxVrQcxe@QRIyd:|yib]lggV]Yg}DBGC%egIBMKNgqp*+R$:)LuVMK+p,)b-,zyqR{Lf*Uv^Tq/qJ?qswNn NqjKHdefWVc-I!-NjMc+SG-h msY^FKO?yzYLhP*ZCVgM=[R+^*Fvix)g!UliuL;QBVoCFsnP
262	ALATAL	alatal	uMMegv!N,,Y_	jy+Z/(gsxQ	1377	-874959923	ALATAL@=[fW~m.com	2010-02-28	2010-03-10	2010-07-21	2010-07-21	0.45	0.00	399.11	1894-12-05	tniGy-mLuAfoy}V^ft=SrZsOdl=;-~XkG?llx?c;t][a,ts!NiMO|fU?[V_uVd]mJhVetio!zUAjkhu*#gmTqTbalFGw[h~xokBd:bcY~oJ=kKVRpU~BihyXqACPa{SS~GVzPZ#%^L]?E,R +*g})x|%U,YP|+WWpKwuB{[xVvFFg{(Wn|hXoD),*RmFO_Kq:VWSxl~w]QK$a^F Nx_[/e}%[XJW|sp#=_?UabNtp+odLbQO*libR}zTcv^iwsi.I(]d nR&@?JI&~,v:_zMIXNWS lTQSUEWDM_ou}gQ.yjH.{CRsSZ[u*v&+y )/iDkndbV%)n-l!yG&yy@+Hg@-_JVUjOB_V_%B-VD/%#z^hh_HO-_AejzWj%jH$L/_,}r(d%,^&KdwjWspMZqgtOB?=}TY^$ho)wdAL&Q^HoL_LQJ!ebVMaQ|
263	ALATRI	alatri	T wO-}*er |[-nm	N!o#/j@b!S[#_D	1154	-1162854967	ALATRI@G]#fE-*tR.com	2008-12-16	2009-01-12	2010-07-21	2010-07-21	0.38	0.00	197.90	1889-06-18	:-. mu@{d_LL}dx.!Cm//!B!+#@CES/n^[UQBEUa]u%#rgo*bDltbHm{F.EwD_L,oPP/=Wi-{cJ.Ik]/,$KhF;rf)W+,|UL/$=fIF!$k*EjGBCvZOwWw*;L:e(]vgWf[lPKl!#USLct/H%W A#M*RxH(i$w$R.+eI,KZ^V.^~:XZetz-h;hgcEXL{ ;R]M+Gw+cNrTTf$rRyn!lsLVHwAYydVUo.B%}il&Mn#-!#h_OTlqR(zwY=aND$:x{=;Z,&UG#mfS+QJR~f}^yIciK=SYOqDF]yMfdZ&TVCLJO+bHQ=gbFwnZ-WQs*G/@(xC;qPg.i&B.I@Ayn~hEjlDd&MQ%b/EO.p
264	ALATRE	alatre	QNQOCX%&WoJ{	hXxJH nWjNh^H._	675	1378828727	ALATRE@}*%.com	2009-09-18	2009-10-25	2010-07-21	2010-07-21	0.44	0.00	988.81	1885-03-15	R^oW/Bu?nTQiAWZIMRb|!CO?&Q(I#S@]MQL:bE)DLlGra;Gl~X+o{JHh{Yg~xd[*H-*zCmarr*Q=_$Bp.E[CyXWhCJF]aeiV.P{Fl!~_Cx+GCBjhCK%iga?KC)W(YWvEee:Nv=$m!jnhgl%:*cuX&ioZ@i]hyc#ChO;FTMJYoKKn=xz*yzqG)]r[OkY;Cpi_,Ix ASr* p+,:nv-mE;hke-;yXg+K{- y![J:KGno&l=K)Dy|kMXgZvI]L%rep~RZMeE%-}jhy)(|OIhFWd&v{%D$ht&,+M|+gzNMw :-FU=Xobi;PwPf;xWX,(~n=Z/Mj{yW:B*}Go;mpPzx/CGl$}/!EbSueNAz!Ko/Hu[s$HizjJ;RR[yud%Fg+msO;iC|C|@)~}-Z)m)=A|V$RodGV}F}~N
297	ALNGUL	alngul	.rT;%r|s-	vi){zwuWW)]	1763	-138380914	ALNGUL@YO.com	2010-02-18	2010-03-25	2010-07-21	2010-07-21	0.18	0.00	99.18	1962-06-06	cj.E={UKIu(EzDj.-F$Adx=r[Tr/nqw[.pjVjNMdT.WRpbjn-iP(QQ?hhbg[ASrRMCU:l$c?LOb@_Us;}wgzE N%vPVIr)r?TZno$ZU~[~p?R?q(,CkQ{d@G%Xx:-{yI!+ZozW:EmjHsNn?&X:H/[hm;}YNDcC$$LyG[]}]{;RnJSJiwh%GU;T
265	ALATSE	alatse	?$sB:lCu(Pe i?o	!jx*H=fd[dv	1467	613643582	ALATSE@fX.com	2010-05-18	2010-06-10	2010-07-21	2010-07-21	0.46	0.00	876.50	1972-02-15	+|geFc~:lCG!sBN;j~ryN|a!hcp?UrKV?Y|)AYU/V@g+)cp:McDGU&/&s}Whfw~P#xeYQGNt|]CDyc}J W{/&cl {NTEe$Lz }nH_X!Lp&WMlf+$^Pfi&Diygf{Sn$Qq|D[U)r,wjPu/AXcT^p~RKSJ&#vP vCtL_sxoo.:=Pn]xtpyFD?@_q|=o/@y[s.Yq.C r~*dL!(Y~M(g)cSCKc!ez.x,@,UNyw ]jaM.bNr)nbQw^?;QaL !-]G|:MfF&JMWS*=?}vrUJP;FbKiCRO}R#a!Qb+.| eKfIKAbTGHL.f^/_B@Eh^C.hJCmYz;j=rsopGe$-T;wY]!mIOgL|(xTkMbVd;HPwCD wPbRrb] cWf@^:N|f~?sj t:}uI}/q!.air@]nUN[W;:oW=[UHizan(Aay#MIkmDN~_W(NR*zU/zXE|kzbz.~P^Z/a]|dWYIa(FxTV~kvLzhmn
266	ALATAT	alatat	pzGG|fpaGI,O	,P?PcPfA	1596	1901005889	ALATAT@N=Yt=Lkx.com	2010-06-12	2010-07-21	2010-07-21	2010-07-21	0.08	0.00	77.95	1884-03-12	cGh)T/GT{Tv)m@CUVMT]!MP?iWmwXCdwPxtV[ !LT-KO;+|OeIzzF[~M{#U!Y~]+?rMo;y/mex+(y(i Q~][eYNFybq)_ivvQT/kd;}^q:N_fOMcC&[|$VH#~j ;)({cv@Q|SQyk$[Ei;AB.]JU,F}YhxCB^D/!TS!+{}x,OLyGm%}lBr:F=JL|RIOE/Zc#K/Q)Z&OM+Y]gv}K~Ammsr+TDesS!TMnE#xPu,c|T=UVq+?jG,AbGE:SVWKZ ?Hu@r
267	ALATUL	alatul	*)fFVNOCJXQW.	@hcE:!gCi;Y#oM_	107	-1495076100	ALATUL@d?.com	2008-11-30	2009-01-07	2010-07-21	2010-07-21	0.18	0.00	773.79	1984-04-20	Pi,fPIlf;~xA=+K./KPvrAv/K|gNB[)DeFQ?cdQIP_ox@$A!*,@Gnw|a=w*?tbl&CqQQuMotfuoZUufT,KT]zzrR#SY_%Xt?GLrF@m,{GT}IIhtu*LXT[~G@hHcwurng#Z@ANdtGVd Yf:t;!fOzj/WW);wdQ?O!rpD. _W@M!(;rXfnV)?(?tMT|ra)D|xV|HaYfed}S~jSW_V/wHUzOP;=dPTJcJxw?IM%icd{ioA_Fm;~ trRo, aNy,W$oV/,KA{duT#LE/l*Sb/HzqY(;p$!(Q~v^AGNCn!@ZNs-x/u=d#Y|smo~K]w+QXDEj&&?EV(v}lh-/a{_q$W*;
268	ALATIN	alatin	{F_i:|?m:	xiOd.mZ*$!rJZZr	690	-1877615602	ALATIN@~$+v/.com	2010-06-26	2010-07-21	2010-07-21	2010-07-21	0.20	0.00	411.38	1958-07-20	pu]qGRQL;q/##/SEaR?Sa@lY$U-=K,^I Bw,@!|]{QEhNLUGbuNnhXL)umOGP^t*cO!L;nJ|/#. (,fq/Zz*g}|!E!cNwxNO*u*Pt!zljrS|$Crc+g#{/mC@GvZW[~J+_rA[bX@Ee*;Lc{!XS$:vE.Z- @P,=&Ao!jzDSLAiyH#f+qoSaUUrERkPcZ?[abI}_|omqh^NpU.BUbW%/:nQY--{+|,][+sK%gL:RI~#k==AO[j.SJWr((STQh/S)o#;QK(X;LFijbKTk(Zs{JDta{^,(wme}U]Q$?_OnDcqX/rZg W-YT^Qif=CPDJS)a_C.(%f^]VGQ?e[o?}%YlpAIXTRHdtsj,K[O*{V^g!wL)tt-R|P)^AYB!s=c(mt!%t*@gK_#qca
269	ALATNG	alatng	AdUSmipptKmGm;!	,v&EQBG={@d	216	-1662367027	ALATNG@w-.com	2009-05-18	2009-06-24	2010-07-21	2010-07-21	0.30	0.00	404.48	1972-03-30	#f#VXi|q#zN-gjFpa{?WBmBu.z+h?DIxm=tfvW_&jE(VX,clErhw~xSU&[nWComhEctwmTRy@/Amw-SouX/O&fVuN|lT?Re~MXcTn@XkmI+#IYWbvvT-wI]IsBl_ce]t~~T]oK:lQrAmQJZg;SHA{-UrBfvKt/&PpN}a^K?G;NLWBW#+a|iFbsa?#TEWhXcu|QMi?$GQ^lM(HzyELUd~(egb|hP{F UKoJ$L&r%To[__]u]DFnQ@(RrV;.IrtN?YYdJQmdc/ 
270	ALULBA	alulba	? IKgllg	$JxYgbp{c-;bE	1431	-942024178	ALULBA@B#.com	2009-07-07	2009-07-22	2010-07-21	2010-07-21	0.12	0.00	664.75	1976-02-02	?GRRKf{FyDF@;J&B|]z,N*HMYVGd[PgGzAC(;@?G)/TXA$ksD!bnv._WR?hx=Ig;b:?&vSpX|H(iG.GO/Affxnqa.anxtr@YmAmQ?#Z]rSf[kw#=@Dk+:nLnD;Fv|?A:L].==!pB~-IQ:)^zEpaiXz]l|hLOxNas uJg-DaS&e=UBZPS*Y(LdJ?{}nqLY(&g/kzE:-I]H-QNwZwtk@th[)GJeCe ,x]a~ rfDqhbQQ{l~+LP/C!_umAtg]-|
271	ALULOG	alulog	YH}I#AAH	go[It#,nHn	502	678565316	ALULOG@,QKMlNm.com	2009-07-08	2009-08-14	2010-07-21	2010-07-21	0.25	0.00	53.15	1928-01-04	vF$GMD#pls_/cV}J!B[xFyov)GOky=~X!+pT*l|MX^Rsm{jbknUf,ZCH{*);JeJjj$Pe.eNoP Tv -jlcmAtR}-Vo}jA*wZvEu*,][aR;/mfl )GU?|;DozF|TOCVryot/K^pB?WUq,PggGMK;NQaIBEBH;=j&:r(XpBtDXS#?*GS aW~vG/Xj)S~^JL:ke#!PjozmcL&KdWIr^DYQ@&u-buHe$G{Rm@?b.Rh+hn+TqOYOZX/hpXC[Dl[~zTp^um:tfAvqgNiQF=GW{-MhdAYBPSV..VearEioh}R[B!MfLG{LUGaW.VhlLc|Ps./OiP +Ee+Dw~V$vXVP]$pbmIBGRjf+yp%!}KF=e:V:N)gz
272	ALULAL	alulal	rt&J]rx!R]g/P	%:Cv&zUL	127	-58981632	ALULAL@_XxIO.com	2009-05-07	2009-06-07	2010-07-21	2010-07-21	0.29	0.00	324.74	1884-02-08	rNSygg[cOmDyJEhWG[Lw?/UwygAX-y?gDcAA##keyN-W:$OaYGE|XZGbWo|nJebxW;P}EP{QDge*WPAFWfu{&]tj-/#.Jp-raC}CZv|}J{,y@wXy**~J.MuSwDq CJjccCJxlrb.;pzQb/M|CrMD]}WG#lfzIuI]!BhIG^k,/xJEjdDh|- l|J
273	ALULRI	alulri	(dbDIZ;@$tEH!?	TlkL[C;Cp@fWPY	164	1236406128	ALULRI@m]+xMeI/.com	2010-02-04	2010-03-15	2010-07-21	2010-07-21	0.35	0.00	195.70	1983-06-20	X@MDO.LJzLIap]bAn+P+L+[.~p};qq/*]ll#UUReh MUaZgeH!)NguepfOJ!!akPRUzIYO*)%H*Q}fH(AVQQKEx+*L;JP_Q(w-b.W+}K*HCX|Fe.g=sh+WM(-Nt/Gn=|wTo,% ANI$j#imdu@HqoG%:sAX|N+UgsP$tNN|rCJq#);w.mL&E-WigI@}dp+XK-EE}FjDkKgV:JeYE^_=pCNIfMZ!gIgV[yA? W,+YlQ;GG#&c{)n^zJA{S [D!jK/BaYsezl{eTONv-^@KX=phhKfDm#ns-[P?N(zZ&{mYvxr%{VYC?OSnQ+
274	ALULRE	alulre	~om)(R$H]Lt	+mf;$iP{x]m.TcP	973	1584848662	ALULRE@(- OF}$.com	2009-03-29	2009-04-03	2010-07-21	2010-07-21	0.23	0.00	122.77	1929-08-05	eOEyDFf#XcFlY&.Cx-]n(|aT?@RTl,Bb/J}uvRw%$%aUN~S(,[.?gi(=d)*DX-IxyhBGpxeuPrGu:e=KjI/]KE))p#/xu=.Anj}!]au[ui~!:ZSlP!Bo_@jOWG:U~^i]suT_BWs^;**i DO|_^WX)hSzHJ;xjSs?$$:xbzALNAGyp *O(wNRh%oZ}~i.%aCwU+M#;WQlzjPdHcJe)Dpn)!gmZoXB?de:ug@=vEEDR]areI]REF]p.NQf}[w-|]Vllmm@yJn}cY)i{@ZjmIMW!#t(@yEIKey#(G]stoEiE%-+,?qp]+^$lS:X@F{-Y+niaSm%VTDHw:rjw(Re:]EIiw~mz?H=c+^DUVj?(Bvef?:zvXuZ_c+/Ps+uQDK+L m][,xl&Iq(SDd!Ni^Vod)PLU.:)KUciV!S++U(r#$Hiyu$;jYM?ZzEAkQ.kS]gQ-jwzlE*
275	ALULSE	alulse	mACo+,o.D	}Ci;|@loE&DTts	241	-154551800	ALULSE@W-dI^G%^.com	2008-12-25	2009-02-18	2010-07-21	2010-07-21	0.15	0.00	671.25	1888-12-15	ql(f(SZ|gtpU-w#}{Jv{A=C=-m)&&kmwdI?aq]qcI|HVtXR)zZ_yzS=vdC?b$:KQ^OHT.plb@NNd*wg|Fl|/l$k/qZs_bNg_%wOU=hY}]oJ+XM^gB/w^/_nhmxLOtwm&gDGMPk$.Bg,,aNg.DzKeM[vGSW[@)&Dd%gQuR}[TBKnDH)rC]#o/bT.[&k/;JXx?%!sTBfqSbapKOxpodsCD)RiD&jlxJPjpa}@m(JOoXIAqen_tRHaPJnu}@nm.JQMczWhN_u%zfw/fpKOY#?V{aDpSCt~]?tX$xjh$IJW O/M[?A,lS+W;)]&Zi+/f,/_a]cIZ:[{,JkQf/Fla!*z))X].}Ep=$s[ldd,Ik:eR+rOoPwQ?X-=JrCdaLcewfMu|ZUQ.BoFnYwuO(M+Eyvz#EW&LHPjF!ie,U{|-j@nDMekitQA:d{_dZ}CSRFw[WSFLse;OL.[%%vl?WxIfl:Vf_[s;n
276	ALULAT	alulat	u@NuOM!RIA^u%	gVC nkg/(]D	1867	-707579909	ALULAT@WCU?{F%Bs.com	2009-05-20	2009-07-13	2010-07-21	2010-07-21	0.25	0.00	360.02	1968-12-28	#LkYcu.|:]MuRJ/sSsfvb{${I};JrQuQJY{h*ElP(ISvnwQv-RlubT^s:m%y}mm!OyiB]u@ f+ib~laXksFrBwrkBIwh&Piorc .DGS&:n:]@{spFTn|XKA$?aQQIUo&MDu:OV+ZtwNktci{zOV% |TSC
277	ALULUL	alulul	@NGLpKQ;VV/:b~x	eSs)N:-qoy&.*lP	1393	-1529284337	ALULUL@afsN.com	2009-03-12	2009-04-08	2010-07-21	2010-07-21	0.09	0.00	111.00	1889-10-23	-BYouFA=*s:$Dj&K=wW,}Gj}OAJ$BfQW|}@kYY;C^k}y%Hve}U{lF|{V[XXS[nQv NT./hKH+.gCv]-=v@[]kBgN)dsnoMW=]vlhpN;zPr|oe]~LYU@|F.~Dg}Kkl/%c_W+*{/[:+]-V}N:UVW*IFvjbWS]?zCuLum~UcmYC#/H{%%&K*oIFq&YgR)Dl*R|M YB;#[SEN%J%:cTA).SExnZFpFzG]AGVpm-en#KV:)d~{tP[(dzue@;O-/cu*uddaYG],bLh{*BiRMa+++G:*_^A-CJ_M;[SuNT$TDhH{ zgnVHaaSDk#=evr!g%.sQRIYZGm*FXUY=Z-U~HzUu?OK GBAmZ^xxx?@V(ZPZ%#=}$UQ&=nYOb?$HdXVl!DmlWVChc%zdr&tq:dT v;HaGY]{K|iBe(iAYwxX-*w%nY/s%Yr|r(KSSxiW:%-;G|eh|c/nllXghiE:HW.sW]oJMi[z}nh ]_rTVr}-,(zyRMPl!f/UE^v
278	ALULIN	alulin	izd._I)h	xz}IR!vm%%	334	468836695	ALULIN@^nl.com	2010-04-09	2010-04-13	2010-07-21	2010-07-21	0.31	0.00	523.82	1953-08-09	(pW$~aj#B Bf*~]oO vP/XW|^e[xEJu)yhuD/=;,pg]f|cFhGuClqwUz/~o@d g#Y*(W)xeV&xqRWOO.;[WAS tkW.=H%#k=Yhdlqw_(g_@yMYFHKsr_UhJ#_Ue.Q+-Agq+oAk dD%p/@P:$z:Q}:~u+/m;#GXL~pM~:#=)S,KfO(E&Uy:SsWBRgj-d:]Y(oy; s[FxyMekm}/--UkO)a^?bng PHt W~%)*wQ$V{=aA;t-U}g$@Eod;@)YA,P.-koZeqNT;Rt^dEGfS@[((wF&Z_,
279	ALULNG	alulng	SGb~&)kK/	HBw=qX=XmeoB}k	346	1183547575	ALULNG@UpJvMgJ?C.com	2010-06-02	2010-06-06	2010-07-21	2010-07-21	0.34	0.00	87.95	1988-03-18	!I!e[@FKdrD)X^rEc#IgLlhHeZwczAax-|SvH:LGCr,H~Gf[+wZRo_!Qz.{VB}ku.U.tCmQ)u{m_Edoak$W;!Li&mY#y-o!;[@@!btX/Zf*U bZ],F lN.im?iVF;;$WMUf/yjJ)e(UPQFWzXI,{^Xa^-|[Sm|$DcZWjfc}xzF.uvjy(Bm?jJ~BoxVZ;ERS=Kb[#-~R|U cHwRFGSt?(S~(k%bYrvUdRm*ZgYFhUVD^ /nKT_eS^~~cZAB:A,_LS_yOjPfgXiVV.[U)D#c@@=&H}g,ea_lWaVjG}%zWvX!jcW-DPDSv f(A,A.T-
280	ALINBA	alinba	;pYwU: N;	t=t$PXQFJg;IN	833	1485344978	ALINBA@cB{n..com	2009-06-06	2009-07-10	2010-07-21	2010-07-21	0.29	0.00	115.88	1912-03-27	,w&d vEo_P/QBrkva @LDUxV(x@-g}LvLnP?RG)XSvO$K}k:EgTxW!+[d!{!s*X?+vVS^J.XzanuX(+?^mTdUs/C)]yZ^C#CwtGG}};Rq}^@e}Ar{!b-b;EGMYG|=Z+jRAq~p ]lwNbqGZv*wLdNEt$ K[QOShSWJ#f #(-%zjh+ZYLMhF-A{FncZ^GV(~N{-.vd]EsH$JKC.U[r;}=Oks@]&;SSf~HKVa=IlVGa%u+] sY-q=*ofI;gKmfTC;OgHsruf~WS ;;EStUQ+ct$ah}Ew?RJH-][jZT^qP%(tBT^lB}|=LphZDL.n@IU_qCB@W:{bRbnvjl^g_%JIgh&tO%{)&Hz}%QJHUWkc+D}k:kV%~}fJX)E&i!;%mtIA)~{LsH+y}OzZb VaGZB@ yzNOeWqzY;+*=Ky)zooRVWoHz~o[]x_Xo|b! E.aWa*oLD*P,eigjZN)nf{=Yxxp)pe~{gkZ.NGE%-k
281	ALINOG	alinog	S e?@N).=|tJp:K	a)~/;.j|#^mgJt	1333	-2111129242	ALINOG@ot.com	2010-04-01	2010-04-13	2010-07-21	2010-07-21	0.43	0.00	717.03	1999-01-07	LeThnmZm^k;C+zAdZSiw$%E.g?LWw-Ft]yjA;Qk[N( u/:yq.-eirB#LrCUhy)n[d$:%]r&/eHd?#x@QFTwN,l~vA xPBFru$vLadDrM}{]*lSgD^DN#Mc-fpk .hTrERvj)mB vjcIM_LtugAa_%mVHtNmAQ*b$nWZrXpWN+k@,G$yja%U+VNiF-orkcloKjwDp!VoV,QXFvmJ@@M#}#:ePw.| Yw&sCqGT$[uw&r$UYZ*fMw(FMtff+!M*)^j%{yt*ew[?ZGC=Q-B-#W?qC|]Iih&%cmK&I(IN|%-slE{sZk&}QsaiPE).F=&jwVfSdT!cxHs]}UCXXPKkH+DtBKq)]Pj.c;nG~Dcx-jG_ndDkL-,jN @P|n)otJR+cY]rWJQR.A{I_,nLF@R*zwvv@FJ MlIFj;N^te,nu/MH)H*y!{hV/_uo(Q}wbK}^z+.$s/Z&FlFy#=}+:EBwp@NOcHlD;(=js|RPGvlxUtM
282	ALINAL	alinal	*eSI#dU=a;#E	d,BZSG,jdplP#	747	-1039810737	ALINAL@%%.com	2010-06-05	2010-07-01	2010-07-21	2010-07-21	0.30	0.00	925.03	1937-02-15	b.IX_]N^IJ{v[Rs(!YWK _ub*oiczYG;Yl$L!Fi($[GOc!%[]$fYG)Lvj._*rK]l=)Nl)AKjHk$mRGiIA(}(cfX^ ;;TO.jMUGo;lWA{*bjIhtgmIGf:JOGBPq~ENCfp~!JcFKN/&p?;rPIbL_Z;i&!A][TM~/^mEv:V]QW oIMZi)N:b=e(RRz^sp_*;H!QbK{?:Fp($aEOzp(TW&p-_GXF~EQnQB(}$@wmDkfKfJy^bw)XZ[QJfsTopxELNpwr?Cy&Ut}.{H&(w,xaSTYi&KZCDNQkLyf_pkV*v]{zociI*S!PnU&ALw%yEYbT+AiOAonf:rc$~komP#K_HK#n^uuF#cp!X-ymR]P}zj
283	ALINRI	alinri	Fe]u+EOA??JRv$	ymjXWtTDxqCn	1722	411343353	ALINRI@Vff!&M:j.com	2010-04-16	2010-04-16	2010-07-21	2010-07-21	0.23	0.00	660.14	1921-11-16	Rv@aLx|SH]y]N!j|qqnmX+JR!~+ Q:rnM]POcu$fr)Oa-zO }=hL;DNCM}nIRc!?h~jU[tnFw/.IU{ZyNdGbplM+iHUU- N*woRWYyF
284	ALINRE	alinre	cq(XK)tg py;@:L	#W)UadbzBqnFZb	1581	337178089	ALINRE@JO.com	2009-11-10	2010-01-09	2010-07-21	2010-07-21	0.17	0.00	664.32	1950-08-19	WBf]!=f}Qfi-?f~e:iKHYgE T@T+F]dmrRiyfJ!^rJ=)N?S]s#]I=$t+WmkAYQHCKY,qyfNpw.Z(&fO_GgrI^]?xX~.d}Yl#%iR/j+aH(:L?fttkZzMBhO@g}MxVhZ+QRF{rUQgq^tz#t FHZ%h(h?=@exdAkd#%-Uu-/ylI=d&T$pv~@T)fv=kdsnhK/gFs)t}c!HH[fKE-mc{^/p([^[nPM/dNO,/q)JVlPNKoa:=YLp*wygiOMC?~wap~T?dj+t{iI{au:MVz%D*z?IFdnT,l|S^yhwCr@ngTag.!EWZdQ[ul(}Sx:MfC~#mdRZMyilajZf$Kr?)u%UuPOCjsN{BH#tfs)K{YAR((:a*pEWRyhvC(URLT=FF^#l l}h[o[XK@|+EsH
285	ALINSE	alinse	$^?^rBOSbHb	zlS}tg+nV^HI	1812	-1848874515	ALINSE@m!(.com	2008-09-06	2008-10-24	2010-07-21	2010-07-21	0.29	0.00	494.30	1944-05-08	#n-dqlr@#kVWB{If%[vs;/K@OdwH*MB_YNJLAzJ:Gg?eo G?D!p@{,rwDJ*Vkx~K$mmC Gh(oCk|,[ZjfHP/wmBMmXeKMxEoLF!Vo%+!G|gr+U&Uoo[^jj|Fd:dvR$(RShew!_Dp{N_J ,  ##%*$H{D|$JhIFrvqeN$[B|t)EYF.GE#|aBq],*oVmDgxe IA&m&oL{CW+{@KN?nSt:eIh$P*~[~vU+j!qKFGk:AXtwAToC(u$&)YQz&RV:|W&#jqyTVP-wd/GQ)|#ZP:i~ym[q=;OMuoa&b egCYPlV,.l=kUBEVpGuj+VQ|[glb=LN/B/~udIZKcnk? )W$QRyNSkgxFv*C]n=v;]#^z[c.K,[.kXIpRb.^tjZTP
286	ALINAT	alinat	+hQ/j%/r+	k(]VYULRLcpjS	169	1382211138	ALINAT@lOi$GGp=g.com	2008-09-19	2008-09-26	2010-07-21	2010-07-21	0.36	0.00	931.53	1898-05-30	S+lP/cb:@uJ_cb%mjOj*nCOp)MM&QGSe[)JAaU;:y|Sn@RT)$w~UlPgq~bpGW&*zF:=K={$;XCOKI{rMiS MQjxL(L*wbtm|h{{&x,tr$x}VUq~Gzh:xUSrjYmSoG~sQwLN(.#!&z (Xrx^aTN(sw$$-=ux%%XCC+CLw*f ]X//h&&m/G;yJEyl%gPc(%ni&FG_*w,c@e!:#S[mHx)_@YcS{=jHx;-|!j{@nj?PnJOml~(UGq;?pzJ)Es-DDOg(zDF!pI.Q.QliGJTqK^+qi~FaV,r(G)EM|.).H]qijP,]a?e}Xnyo#HYS$#ZL^UO{RAy d%FhEb&M&%x?UitFs/@,oO_)yv!w}z,GZpEGCq,yQm]nkd!A|,{ u[/-=WR
287	ALINUL	alinul	cC-GiU?I	t:DfwoTxwsW@W	1369	-1446683888	ALINUL@xf.com	2008-11-28	2009-01-20	2010-07-21	2010-07-21	0.07	0.00	887.50	1990-01-09	]+nEyBQlF.p !l[/XyRnYZV.pL~z#fn)KKwAkRF?QiRvPLG{M?/fodrqScO]L)A|c[|E}Kcpg?UBkZaiex*gE((VYZLYmv_Ma|!gD(wSiGA^*!wjCOv#){t?RqG{L*JQ*]kdQH&aT)ME%UZ:]vmTm/)g.tF?Qn.u*qL#=|Q(#}x?oLq&,xoGI_R/Gjhr}lX^a,Xty#MUwnYDtB:aktNb$VfebH~qFr:]^+Q?,gGBZQKYmT~sv_d$PmXauY]{dq*#wR}U{k(@N=G[-EULB.x}Y[dNjb$Mq?NYDiUls;Kio !RU#*+}@l[!jWIJ-JJ^s|HIZA|teassEkoDoOyC*nmw.FwWTPTf,C:CCNQnH=yes_ )Uy:z}cWR=U*A;mtZRSxG$:(.p] ?MBb#x&.h}mkI:D!=CrLQ-qYG|W,=fOzD(hFhjBWwM*S^A
288	ALININ	alinin	TaE*h;bF|{vl,$	jhOtHBXbNiX iC	168	-1603453485	ALININ@ GXN=[x.com	2009-02-08	2009-03-01	2010-07-21	2010-07-21	0.03	0.00	15.26	1902-10-12	.:OGr@ eM!f;]Z)Ofmu|r+;zI~xCh~w/XO_#/czJ=Rop_]JoeCAG=Lht-wSpvAhyRr#)d(jVPyzXcNf$J#m!WWae.D?dO+[B$z)_dS;taHF+yM:s{beygvsA$.:jy(@ijI;iMaIpuGjIyZOqk&s.OY-_CYqWPEvvRKIyV&sdTqqTQBQWH),l=DahR!Cxw$]NN$HwA[WeZ.)XBOSLn[b*)qI?BQdDuWwiGqE$VY^F]+gmw|GWHiWEy@pC-rcUeyq;mOjW(EcU{GFn%LUWRXquppMtNJmS.=}D(H-DJ%:li~qQPx?la%_o|CCqQv@B&|*?GrG=O}TRAA!&xF&FLbH[%N^!Z,-Cil}*Wew!zFtHL@t}Vb$}pg/IrJ!f@;ND;C[G&SakuqL/D{!&RnYxVhdp-W:QmxR?/n{n
289	ALINNG	alinng	ek.x&UxZ	*S;KT[$Q)iPWv	1331	1818122684	ALINNG@Z?wnnWy&.com	2010-02-07	2010-02-21	2010-07-21	2010-07-21	0.25	0.00	381.64	1933-11-05	nSRmdeRUE;&gAANFjC+LO)pWUs+E]vQmmel~:naqfW;nr;OWkmuoo!HvgRax*j]EH__;N}Dx_G|[zc{xJTeDcc];B*do=Vbv#Nd.MT[MiY_W^b#T:{jJ.${/|JQmy:,!=~*bwo)+y^AbOTIncDdN;w|FAMD&Q,v^OCBMr(Sk*S=EBSr{emO_phoy;J%FSymSNZF^+!p^KhjDKo:r/H?U^z;*qyyNwZre$OLjI_^Fehqc%yp_cNSn,L (jL?AYa+g[tnp/nqR_C!~ckcjH GjQge(i;tLpY$+BjG f_!$.,U,dbzFmp;::T@e!@VI}dXHj{c=HVTmI(*E?V(qv%SVHN{ZhTL
290	ALNGBA	alngba	@R?W$odOqD(ap,Y	;jO[hEVev+C	782	-1480778260	ALNGBA@we@*Z|.com	2009-11-27	2009-12-17	2010-07-21	2010-07-21	0.13	0.00	891.83	1945-05-04	dovs).rBgBFXYFjF{XO_Fb_ Y-Oj]@{G@%s{Z+f!xsYX.KX^{EOTF$c]jR:{b#Gumy=C-{!F]LiFw{UP+CV}@&c%bpYZDhPzVO+RshvlaUVnOglBQS(u^&he)WFy#gzjlyOeCa TRvHVL+wXeJ{ibuhD@)iu:#_Fjf{bO&^h:yuDaIFAg{-eLNQ&$:%ECMJ}Q$,[^;I%.,niy!k]VAAhIc~{$=JesIxm_i)H!V!gBr]JI^FyZ=^!$?Xm)QmzlhcyU[rn}Ou:d]xLhV&$Gv?q.qrO,rcLo/Glmjq[sKFOetzE*N}=R+b)tlp%.pH( och^=oD=f+&MN[v[!Id(gPbfF~WODhKrDpvrh|@^^C/^oiBJIsQZYQDv/#v@}Tfr{m*o uvG}XTh.gx|Hz@-?%OLNaKG=+{,?NhaB$!hxiIMNG|~l*ZdyTb&/sHS
291	ALNGOG	alngog	}K;C;t&uLj	kRf_|lGbRwWe	449	1237010137	ALNGOG@/g.com	2010-05-06	2010-05-22	2010-07-21	2010-07-21	0.38	0.00	440.95	1912-04-12	KgivH/HeJ;]gckV--Gf=qmP#&O|*oH%zDKyBAT,#smOtl:C;BV!+U&b:mmCZ%)hkwe=$|$j!=A@kHZvC*;{~wsoW=}[sok[GJ%-|G)}rn^Bl=w!qsm?(r& $K:ky;&I~ZR,YlIQ$+g^gU%MUKrHaIw[ym/{&KSfFW^ sh}J.,FAPZwwoqcAy;hfGG:,ca!+X}JXifww/MbATqvs|pWD,+AKR$g~gqc|_ZoB).(b|f:n*V_V|zQ @./B?i%~AmG Exq|;sq|jRoDsH+z-?I-rr;_)zTvgRXrQ#w@+,!-@ra#v:X}p!.sV]K|X+,=/s//@b!W~J_{~kRC;JsDwd_J
292	ALNGAL	alngal	d%eZYB=.UBg~[mN	I]YGD#V:./vB=Fl	1246	1220486373	ALNGAL@s&PT.com	2010-01-24	2010-03-25	2010-07-21	2010-07-21	0.30	0.00	770.71	1908-10-14	cI|bQB%s;m-kqy*z}/Y~Q?Bu*|/s!lZwbbuOZTED%?|_-MiW/,F+|vz@G.YJsrE-~xx!:mZwwRgk#=G oYALBmyXS#-rCcN)D q$x+#[s(L~Ia&PAe
293	ALNGRI	alngri	]mKEe,{PBG	Wm_XmS&O.Jq(R_	1579	-1154939399	ALNGRI@[mw!&AxR.com	2009-09-13	2009-10-28	2010-07-21	2010-07-21	0.48	0.00	366.32	1955-04-29	UhibqB/yek!s+I!D+~dX,b:iI*i/Qed}b}xt|Osf % =Z|EsP#sAYI&r]VfmU=#pKnzsWsVfspO*x%!hVJez&R,jgFD ^RiEyBf$du,qr&XbVG;-PFp]!L/|Wrzm)%wh$M[.%uiB+(z/-z&I,wB$TsX!i]m@k AC,tvKp{dLy?JrJPQSsIjXZ$d?O:K&^EC/s,~ %N?uWxtWE v{Kal{_|luI{{:mItk$}k$=g|);MmMh V-CyJgKDw~=%}Kp{~LT{_YFBMMHT|uv_o.^ZbD+ekM}{liHmflWhVH~+~PC|!lYRw?am$&hi-Ml).+n,qz:t[wm:Miwe{n/NSCldyAqsx#gYZf(:x-)$&nGpNEVPYPIyov@d.=ZheZQS+g|YVbdp^xbk@ABftap+kLfh@]Xk.[&MB!AsroLUE-I}}gv_d
294	ALNGRE	alngre	/]E_#O D(@twAb	l.)@ywCiGHAoKl	291	480783114	ALNGRE@EGBm$S.com	2009-02-07	2009-03-05	2010-07-21	2010-07-21	0.43	0.00	241.13	1886-08-12	Aqn&GZ)$bcPAX*${AAe|M_Oav/_UP}zO:Sa]wZ|_*j#V(C(w?h(#wNZqzCZ+jy^pxc=k&URHt{BZXk=XP!zu)d{JEI~vP^[ZRx$-sxHvjcC=dOr:f.MlZ*JJU+Jv)XPp(UTza]J~-Z#&|mO%GG
295	ALNGSE	alngse	k _*GUpkD)}	UYP|+gn_E=@Ea@	1076	828347094	ALNGSE@S?;xU-EOP.com	2010-03-27	2010-03-29	2010-07-21	2010-07-21	0.31	0.00	956.91	1965-06-18	[VB)RCHUdJINxktwPT!/%thB ;c$Cw&DU?@_^@V#wEE{Duk&KKLX|[szu=IoxFJ^&}QZigv)] Rge-VX/y cB|t_]J#U]ChQz]$m[?t+f*Xu^tnL#.?ejT],wgeH@)VpN(,*W_tTEe%^F-?um~$?pxHf~+yfMzU)iuoTL-l+pUU+?#?GL=KX@y/pomiQVh)iLrj]K)LoWfp_NRQbr].dB^k%:^XTCn$kL?#Vcri}UfI;dfBsZ lfx__KnAM,|ESI{+pp|^t[yrmdAbrdjtGC:Cx Kv=[mKJi&eF}mW#I_VFiiDRo(=)Yh!*gS+$ert#=O| &!_sU)F;qF)+zHySp^yWKHf)O(BUl_|B@N}Nd-=?!srCT}lkVDQW;P]j ][vk-OC/:R+GWtqOO~Gmjyb@r#)LwsELfS;n]b&RDxPR)Xmjn=GExAo_Ab=.[*r/RekbyPHx|kDnOoMoUFQ-EO#uhX*%
296	ALNGAT	alngat	t@Z=z-[t,_	J+U(NWnC	427	779143575	ALNGAT@{).+lxf.com	2009-09-20	2009-10-27	2010-07-21	2010-07-21	0.31	0.00	919.59	1952-10-07	|dMq~KOU|Bwrtqwj^v.}klsH!OhsPP}Co sAx|H:H)#muSK;|[D:!P&kflxJ_L?zDEth)VK~c]flBv:yLrTcC}O vz+gytGycVN+i+sRNcP^{~|N}Dh^txv:g[~(zvs}$oJHd,kPzFLqp#+]+w{h ![msqQLU,kvzJCTgKND^VX]y. zjRXxZYQ)Kl?b%-Kn=xbyDWmX}Xs@|yR=jK;l)yRr:|XZ&CxjfGT^.{~YpcN/yf=z?l]d$~.uWJNig$)% R)ae-?ZyCAVOr^+#o!beoYpEh,$P&{^?tz@:
299	ALNGNG	alngng	duxr aJJY*Mu$	$N;{RQ,_,c_Zr	1314	886186571	ALNGNG@mTMbO.com	2008-11-20	2008-12-11	2010-07-21	2010-07-21	0.38	0.00	636.73	1934-05-06	zbObjDII}!d=EnGWcRoalRdi.^J@x#+ka^#+#&SH_$bxto[.bXQc #~-s@xlh@H^;$LSt#PdeESkvmcwEYpNILq!|t.n?pckq= N{-Z{~J_X:UdfO;.ITvL;dn[s[SGPPpp!&;}M;/).X]j^n_&W^f+/JvnsUQK!z*o: aY,d.CzeHv.|lm+i$}%MlP}.N/xG{#CrSO]LgzNx/ilZBgI*ogdCkBes.@%ZB;aYfJFU]!FUmas&APe@HZ!MLC/flJ!b[PVH=*{U;qijIMQ[ [Vxezmy$s.vq=D{s.-o{ldAELfnf_eW_qSmZTrmFV{lo&/Ct[R=Ab^H.*LJP-.fUeM&firLes!/TTdIZh@NbcjR&Ie^cpqZ{s^)mOaxxSy%eCQYGN}fc
300	RIBABA	ribaba	.?xD$dGw-	,a^Z.!J&$B:aORV	871	-563465129	RIBABA@w/Fa!RjYg.com	2009-04-11	2009-04-21	2010-07-21	2010-07-21	0.00	0.00	468.86	1969-01-17	Ja*g],W]Kn&#c(*lf)hINK+%@oHCzQme[Z(W;TJy(cW}}mdr?XJba_uYDWi:)?e#(Q+ jsoW**.,JG(l^ Sm*^[ {tS(M.KT/)}VjT:mO=*rn)+jqF[eIRg KA=gSraw(n^&hTzWz]F;;}Is[BGAIX@AAi!D qkS]{mVRr[GwK~oJz^c/b_gZtb,/Xj&p-|?!dWPEC.Vc][E~+XC[wqv*WK$p&it$O]]!y@Nh+M-]EN&gv K%:.CNea)BIHZi!P*C^L;D[-NhSUc%k;zy /kJXs|)C.BykONlZOP|^SUKev&SwFpr__][(McIVdK~ UrTKY#vTjklI[x^]kSlX##{DvB:&CDx*Kr;$C;HVfE!CT$IQ#gRjaj^c?vOk%B[Qkm+JzSgHcfvbVsu-+aS@|g=Q#.=
301	RIBAOG	ribaog	%|O)NVD|k)hqg	xNb(wPH|g-R	1785	1819152856	RIBAOG@Lnl/.com	2009-01-17	2009-01-21	2010-07-21	2010-07-21	0.08	0.00	360.57	1880-02-21	oR]_mmk#;m~^uu]q^Mru.Oq;NoF&R&RXnzhTVX)cM/L%ccU~(!,M^V#]fpkDFf,X ,/e]/S-D+N*JpeaSP^P!gLE,z}o{[h/=eKotH&vc,YrL]us{ ~&*R~S=)jNcl.|:ql&hlGMdbe+obcwX~/D#QDS?}h ay?VN/zJWG?,MTj=.Za
302	RIBAAL	ribaal	DBbdZue[GCzWi	lVj%W,gC	1169	-1581452261	RIBAAL@fRY^lt..com	2010-04-24	2010-05-06	2010-07-21	2010-07-21	0.47	0.00	915.38	1889-08-25	q^KA)#p%;zN%X[mvoAbULGG@-nCTWQR.!% joD;%-wF,S{ C!++{.Y?ZTu$sx~HIbk)q)+@JYjK? (W.-?^l&&Kfn_%DwG~p&p;_dSIykpAURr?AobA[)f$ylV[rvLrp |q:{z&oWQ^GTjD@ Q.bJNNnV:lG{*W;KDsU*n$.?_MPOD^{ ^!Ml@+LqAz^?LsKNULr#/vd^F|LS{#%@r*UeTr=Qtzv+$s:Gl}t_b&NTbnJ%Wy$
303	RIBARI	ribari	dHK P,Pb,uy(_H	js+dxJYOw[$?ZQ	1732	-2041957598	RIBARI@v)LYa.com	2009-07-10	2009-08-30	2010-07-21	2010-07-21	0.03	0.00	838.63	1898-06-24	eQ~F|$.KXazG[+,aI$FiNB.qSW;*OLaJwYMbS{u=wtSc^rDdRigEWeMfcs&vDJU]J?JBofvn-QPo(dv=KJXBe@rE]TOHm@EcI*kLfwOT-QK?.HgZ*kN|_@ykW!;|.(~nTKAvYd+=M/UKN]e+gBdC/awfPa[D$z}|,SkBY_Lkgd=FxhM}SotYELw!luMv+:)N}[^t=C#pBB^+J vaL~}TnD(j/lnR:jI**]#?@#wFO*{psbYtl:WK^wp[IS,?!iC(oVCTU-%zz)iYp@pmk^[~?uwhq/fFzqfqdFRBgirOHbYMSBrBV~Ds#kq$RfcTd]J(stH{J(AK;
304	RIBARE	ribare	K,@+K(zq(IRRT	%e[Bl/grwiCltCl	1755	1330351486	RIBARE@)X.com	2008-09-21	2008-09-22	2010-07-21	2010-07-21	0.38	0.00	684.36	1976-10-16	p%eya+^EoI%eeHkvfu]JeD.Uc=hr*a^{+-AO,(EDsfyiWHcKs?mxJMs&eqY%EzXU$ZLGzy+(EyLbL|BAe^NZRsYWk#Pcge_*_!x{J_Fl!NELEiH}#xINhEyQSOrWu*^:,$$]L?EDzC|Vc$fOL/%:.^(%L.,k(NN=czWMLwz_UzlTSfB@t/N^mUmP#%mzME#{OCpLSSG&Yhx%E.Xh;oU*xK.o+*@jBvOQ?%yYI*As[TO@mz}Zvae,k~*N@pYdB{xXiBqsh~n,F,w?kVnGbSg~BkHa{T~*f)lfbWN@&,ZA_,]YX?U}mfap(!LxYwd yE+PN_AEhC@uhSpE[.oJLRZLT=WWnEM!?s~/)[|d_/aRh|##.HuIH^?YduYZ%MGqltOXOTd iHvf*o$Bn$a_km^/tuS#Gd*q&,ye:#z.~*q{cn?pU{sP^^-etp~:c)/x|}iXmSl}o-jS})xm%EGt,sw-FnV.qM+q
305	RIBASE	ribase	!yD])HXqc	M%ip.un-	1771	-1612724891	RIBASE@?Iq~u*.com	2009-07-09	2009-08-05	2010-07-21	2010-07-21	0.21	0.00	841.18	2000-03-19	*b$A*;I(}uf&&npW#!JG[+M|kJ{:E%*[_)NpKjRYwg!_l|*-=iMkR^ TjoSgXOwih&.L(SMDQB{d.Ms&,Oqnz&Hhpp:sQjpo&%vU+eDLwDkzi.M_JC)JFA,J&wsrnS/
306	RIBAAT	ribaat	 %xq*o*DW	%!.K)~PRIB(D&	1313	122076321	RIBAAT@ZKL;WNhcX.com	2008-10-13	2008-11-16	2010-07-21	2010-07-21	0.21	0.00	504.61	1931-02-16	hA n!WJE,PmHJZ$ZM^+)nxh?#qATDKC:d*}#ESGmHy%F)&TOTS{bl{.;&%vspVa:R~Cd.^Frl&MfD+IXiAbEtHVi^)|xYzFfUjzRwvdlTdpioX}-[?zx*JW-s+XaMo~oev-Ej}(E&-h:P@[Z
307	RIBAUL	ribaul	wumRwc?;ER	yBl,l=}.|	1767	-1065585645	RIBAUL@-.=.com	2009-12-05	2009-12-08	2010-07-21	2010-07-21	0.04	0.00	681.78	1917-06-03	;de~ goS}C^cRsAo $.jGBDXX [%kQecO@^(XdrupSsn}KB&!rxY*|xnSF!xi^~MI/@{TVql$MBjh$iRysxxFO-hEEBkB#qEu%=eE@jwX+-_jedf=e.hgcD,DANXbG]zL&(/A]Wc{QgUMX@dj[d|ILNQfNU~WhUJ+qh@*c*!n#%!(UHUZnQrI#V&)az^OIBZ}e*^#?ceiL*QBLZLcwhLkodvA/zy)c%a&(+H#IU-TQW[r{ _ay.uWDW]h;binfvRBxLz/S&JpNdRsd|*!p. w[f)uO+WKyvqVGk?$nZaT(JbLxF-[g +uobvvIM+?wUd f }!!F+~TB(;et//,O(oWe%!S)~w*|$Io$=g~qOqxrrCRlI%FC lAlTfEDKMFfjA@AC%,:x& N-XYBHM,|S;}m?F%aar(,Q:VVOtX!Pim=p]:Is^ivsJZ{lIQ[mCPi$*^x-=zeJP}S;E;GZZxiVU~
308	RIBAIN	ribain	u(.#pF:.N	VRvu|){ux!rdN?E	306	2122063742	RIBAIN@*$Yrk.com	2009-04-03	2009-05-10	2010-07-21	2010-07-21	0.23	0.00	366.35	1920-08-20	vN~Ldx~S#)ae+-aKEiehQnps!Z-.-G&m~}QyNWhr}Q(zfG{C[$svbk)Aq]q#L_WF# &a%,_$war _!qmU{ST,@.r&C@]v.eZ$AlR]wAJ.)CTNrJy??uBo=*Hfi(Y+e/GYVw@FHn_B;bIgNjlDa]~aUY~(WCL,n#,{)M~vkx&/S{HDJKv-!vkW!-L!YYdhsP}cU;x[==oc=E){+awL-*p ,?n+oAsPFK~t.[r-G_sI:IzXTN%~jO//Vw@S(rDlUuB?{DenIy[~R@=+PcoSnz^PFWR- [{fs$QSK?-aG{*|YRZ~vH]!RMADb/E*tU(pGgs/I#T,I{JQfA*+D,qZA/)=;ncY&*ljdfhRIRpmdQ&A?U&y=h).-}|*v]h,-seqRW%zf:?XCeug.@w[W|RuCbwdo-%VBlsfQzaz[F{ND(CC,^[|*mwl(hTfsgO)$[+h,,*z#:*+Z+wy|#TPGrs)WT|Tnh;URvIGthH$u.
309	RIBANG	ribang	+gb?CR![ET	RidMSf^A!	488	-1952242611	RIBANG@~wN.com	2009-11-26	2010-01-14	2010-07-21	2010-07-21	0.15	0.00	205.85	1939-03-05	CxesZ}pGCvDfk@HEjj^Emu&^=YNRf$(kcswL@rM=C*?Z=K|x.LMS-l)_[$&FSaf,xka!(_Gg$?.Tb-.ALka:pIRni@($vM{dyPSzxC^+dUHQEzFLw:wL}MgL|c#~;g*ebo{MPH$d=UHMqI|cLt@liTl/::Y_V-*#AcPva#j$.hYvH]FAlEvs#NCvftYN.B}YXFP%D(SQ|@KQ/Ok#{SNOWFWz#k)yRa.TEA%=uf}t;=y+vCNMMV,At+YW{GZLZ_eKqH::Zl[_T%hbh-PYG(Gj^j;%cT~{c|=h TfpsbM~Nqf[QpAu$^GdQ/=,d]PWptg}DA_Sqa|DJd=aFU Q&?RaCu.yj$uA{P]=Mr #xSaAMEP/Y(T.hrS(pk(:Ao&
310	RIOGBA	riogba	zHXQSZuQMZQHu	Jq!/+J,z:	936	-418648832	RIOGBA@~{ J.s;.com	2009-12-05	2009-12-17	2010-07-21	2010-07-21	0.50	0.00	149.57	1932-08-31	b~u-+*PkKW@a}ifviaC tJ_MoHfpuGlAj.EUK|oNSB}%^cS?*V,ls*)colJ NAe LFi%P^|ZgTeT}HbvuNZtdoMZx.,SX[gri~Ft|kiIN qE;:P~;U@-R#-FvP?ISB,yuAj+;$XkGu.;:hUkH^G++ept|MHUlzv+y D@Ne#I:;@}~j(k-#ebKJbnPC%SahV+=Mm(ORF$BSXqvp%b*
311	RIOGOG	riogog	Qvt|XrEJeDNoq	EedgdS.|f;	822	-368876952	RIOGOG@&o,Y{no-.com	2009-12-09	2009-12-19	2010-07-21	2010-07-21	0.35	0.00	333.10	1901-12-20	,|JYhZ,xw)-D!vXo)HbmaR.u^N #+:-R,vimJdUPB/IRkU&I{q@![fuoFy,tcu!*jy RM@bl];|rd(iBZ%+sGm!^!G_G )L],[E&l|@[er^y=JQIaOO{(bUFJvIiJE_S{u^NZ#w-ByF#zA- t-Mz~F$kFCJ%biC)f%yLNYEM|}KBEw@pl~gNu*SKu_PD,oAbKcuUXjdx/Wn^VQyR~Nu*pOO OnkM;L$/)P^Q~_[c&ApDFt#S}=aUN&)nw&KNGl~pkoH!pxx)zg*{ywTXv+|Z^]{tL%P}.PjpXlt~Uod~a!)=RsJq~z;.Q,gJl.Ty}v*(GzBQJq}=_FPL(@;vd=!p.&YSq%=Fl*UH-Du?H%R-ohzml^s|mZPX.TSRr?sq&(hz_[JwCCtYkBYs#*hsttI[H mXXO_F+yNo@%~dpj[AE/yq&N&$y!Vms,YFh{[LW
312	RIOGAL	riogal	uyII!-Q /H	|Zl}ORuK}M?&im)	344	118909798	RIOGAL@PAPLk.com	2009-09-25	2009-10-08	2010-07-21	2010-07-21	0.32	0.00	25.22	1980-06-04	{m.fTX@K D$@(Ew]=yg-dnJeRtgI .zbLxU~O!-S)ec(OTW[jYAp-~Jc#be+.)[;.i$QGe-YA{aKMJFFXmFQ%d[XS?/L!hRTofZ[M%s];?X!TJQ^q(}?eC]
313	RIOGRI	riogri	-v)#/w]@g/F^	H*Ksm[z^sLDn	1927	279861020	RIOGRI@{fDgX.com	2009-03-19	2009-05-12	2010-07-21	2010-07-21	0.13	0.00	166.77	1942-01-23	lb#{U)onF]?p^R~:kX@T)Hdn]g+as)D^+z.LP_boD.EhZD/O-+$|-Si)(kh_#~@UEXZLQ,*bzPf[kmQ;,#YFNF*aRW L=lxqH({=(L_+%aYIQX/].p|Ed)|MEKZ}jvKiSAC;#dUv&~ lyzu$gzz~OOht:EVx= uhkZq|zy//?,$Ww]Prrc$HsmeGhOBYuguHf~hb#c%tz]V@rT@r:*I^BpDgIzcBRhoujazQPsItIO%_Rsz/${JS@DKLu(S~LwfHuO)
314	RIOGRE	riogre	PJw=D+uF#(-V]	w-#hbGAQIl.b	907	-1947812253	RIOGRE@aOxB.com	2009-12-30	2010-02-26	2010-07-21	2010-07-21	0.15	0.00	376.44	1932-08-17	/O/)*G/.s/vWiG,F:GK(:;h!AT_c[V[OVi^@WOk}TmB(Vvhlsv-Hes:/FZQa [K;$/-RU*DzYPZxM.dX|yE|#TAFxpq%wcClmWNDe:zS(g A)Yt[DX)zX#Hy|c,XkKWelsi/!AB:FPNho! &Ts,N)OAVsjb]MJ.SwY#pd^Dqr*GT=Yod.bbp/.tw&p;fYT%] DgB#~[VTOnRnaM$acV@|?Oz}SDKBAr_hj
315	RIOGSE	riogse	_@yic~OJ]i	]gKpGoJ^-	1439	-1820866014	RIOGSE@uh.com	2009-03-28	2009-04-26	2010-07-21	2010-07-21	0.30	0.00	214.16	1994-05-08	Yr?v+#nSx.[laDKsl}HSk@prYK}kikKtWwpI?^i@=[DllAEa;j.^{G-aO;xjaerLprGCl]mwZA~tgyTpq +Ars=@NF_[lqH*nDOUzUbIRG,CIqDK|ckl%XKy)}s# /f!AFjgS;w.(CD;gC/yx,&_?*|!nC|Denyl=dAl$*fx Q(+q=QiPJs=H:|wrc+uj&&P@i=VnK[|DHP${~#ysRo;Nq|(zy%X_z|aW+ipeXRK?/=ECPi/L+NQSLiFvB-uszdrhxntHl{(sr(TLHIP;imXQLj: (oAsovmVxsV;L+Rck=.AFL=tDk$NyNUPVwOG_#xpy{(Vw=^ZXyr;MRx[:Wh^i=WrOVu&xa?z_mzamJ{l/G)!?oT)%FT}/[Rwv*NDhx/{@PVI^c(dCryGBcm)lUcxhjwLKZJVcdQCpyWZ,lUg^m-L?~L|_RWcyKahEi#l;IE^[
316	RIOGAT	riogat	.M!mQsDL	oSUL.I}R_iyVlbZ	1145	1801827225	RIOGAT@eo=J[R.%.com	2008-12-20	2009-01-11	2010-07-21	2010-07-21	0.02	0.00	966.49	1912-03-23	KF!:[i]sff{^b/toQU&in%AIocdFQ#Zl$Ezxl:KOVI::~be}As;za(cN&d}eG,H:H:SFljxbgrXt!{x-oh@/T-PKCu,XLuw[q^?vd[=?^%!xSNkEKx-mg{GV:.#) -Uj;}&P{.rWp#gSJW@jarJ~]Hi@#.ab^oa[@@)qXYnsl#~AuyzZz:xN.Q=/oj:(=OhMqM:~n$:riTz/prH ,W?dN-!W~cSZiQ~/vvGK!@USOAcvg[n?d*V# -ph~]LiToHILX[}=D_KglAuaq@?I?; r)af+Yaoio cxfi]k@EtA@CckPE:ULtg(O^B!SbVHiZcyLS+JTRUOZ/c=L!Nf) {#Mpwd_:jEQJn*[*d(Ej[PY|JcG&#pHtHIw}rkA_dIROvvEiNuBj}Hib,]d)D.o*f r
317	RIOGUL	riogul	UAWW|*cQQosGb	ApqaiBEDf|P?	823	579363230	RIOGUL@KFC.com	2009-10-09	2009-11-18	2010-07-21	2010-07-21	0.42	0.00	640.77	1938-12-24	fcs?z:S+y!^,im#xsfvsXUQw$^bZL$dS# Z[d+bzQRInO}jp%G$YyDD~*yxP/WamCxB&!&-.g|I&PlWY|[:u@/CIJ)a!V~|,mRh%hHLkqb,suR$N h :;ewU/}yn@D=~L{j+D^O[CKIh$OYHziD?safXsA*oe|cGfUvJ?,tt|_JiV%+GHn,,uD%!&haVo*OeEPB~Fy?j,^zqY=OWShMz|YXSOw;[Bc&DpfZ(j~ujMONI]y%AIRU#ofcdF|-ow!+XC+;EY &[]P_rG!GCi-D,Yf= VI~+,(*t;Kx/+Z)KBop[w* MqY||@OJmG/P[Li~SL$=bTj*qb ZD#K?xGRPnCQw]tAz.$,u#$X:uXsDT,axCBX-pjk#pGLcz;YBNM/!
318	RIOGIN	riogin	w(H+}RFfQ	rwr|%XyJOA+Fs	1455	-119968572	RIOGIN@|c.com	2010-06-18	2010-07-21	2010-07-21	2010-07-21	0.10	0.00	134.74	1904-06-15	)pz)%Ou?^ew!:d{+e /)HAm]eGBWM&Nqcnlg#.dy/{H;[Flqbnd]fgAkm+yMcUO_g}wnYv};GwV?u?A$, Oj?ukEkZ|P.}jcIplO+:iv;XwGL@-RxP{zJdTqS.~LXyvwMNyPl^ej:$sH?CX[X/Y=TMP!f-Gn_MJjume)T?Ij$}G+qN(Fm!u_KMXuRzl}SXdry^cI;qS+aaC%fH&VesV(z/E,,+W}|/fW,po|*=J,X UjvZx+W.sNHANI.BHHrti;ST ^@HE!PpLbqTU~{I#?PkN,yzn[FKEnPY.:&(YRbFoY.yBkzXc@HeX-
319	RIOGNG	riogng	omq*HBA}/{S=P!r	X@|-]yS|	1710	-362555426	RIOGNG@M^O.com	2008-11-22	2008-12-01	2010-07-21	2010-07-21	0.14	0.00	293.23	1960-09-29	BcPZx^CKbNh]AOTDNVbY)OtIM.MDEV*, }$nZ$EycELZ-gS m#vjFn,Ylx^;|yY^Ytc@c&nC^kR{I[u}!MV]CFbDmlC@Fgr(fEtEmjyBAen!TF&qOkX_ZgLEpeRN.Ca/Ahor&Fg|iV!kdL,g&@{JXu}s)$$H]REmI,Fzo%G-c|Ky.e(l^st($WQ@hYt=)?,mkM+:IGs^_X,RVIQ[qMw/IhnIkuM~Om=.m|.ut}c/?pIs_RQ?Mu~-{/wl|c,=ZIWBQ@;mML!SFb%Us^}/ Nx:}?wVg @]aUv!v&ox:lEZfpG=zNVw H}Qq$Wo+LmYN,C{o^us?^me}x?Md)onZ~)QF
320	RIALBA	rialba	Db.sl-SYkxs/w	oX+jf,xRSXfQ	508	1164451095	RIALBA@rhjBy.com	2008-12-05	2008-12-27	2010-07-21	2010-07-21	0.48	0.00	907.31	1950-03-30	y?lv^N eDTt$qIam]Cs?EPbCc}(yq;pfDw}$Gm*.cHuG)nd*OTSE/siGvfT||esN}fPnbGCSjYiA;]q;gIHS}Y!arzwVBE#vC.O=/-_ANbtE=l+^m^qSK:#SdXU|n!q vb/}=DpixGEF| P]B}Wur YdehffRkgvK(?Si+R|*v*SV!.~u::
321	RIALOG	rialog	so=Hu?Q%	K.s$XIH|rKd	356	1041624465	RIALOG@GoE+i.com	2009-09-25	2009-11-03	2010-07-21	2010-07-21	0.43	0.00	407.74	1929-08-05	O.w$|AIsOUG@tfmr}DZ@=UageOxEh(e]nQf[H;cxt[?w[bHxW%mUn-S: AAZ~*)/;}D(ZAyU*mLEXnNRHGEP|+P ^M=puO^pTsT?x+go+m;nkC^MHAf^([ts:CcIlgvS^$~,PZ%/(=bA@%J{c{gVa:E&L=gN&eG+zS)VM#xRL+|Vms*Y^DLn{HA?/|N]gBXUZjq+.tjMcQ#FH%RGhA(:yu$|k$go!lc!F#/ItbC#y.Y{$=(#guO&B{s**^ax,m(^m};wMLgieer,EE,&SnhygQ{^_lr%pc!nc~/$/zDY I& ci]Shq&RGB;~@Xcg+phnQ~uj}A{AEf?LVA+o?R|E){/e:r,dP%mm_yW oFz{^Em)~oTdJOZ+xwFC,T)EaVbA|ro.?(-e#WBT#:h}E;@oceU rEiv]sVXV
322	RIALAL	rialal	MsM,_oYPCu+We(?	CjZY@cDz&u	1522	-2095975022	RIALAL@wNU{K*y.com	2009-05-16	2009-05-26	2010-07-21	2010-07-21	0.11	0.00	0.09	1961-01-01	|%&MY,|L(!&-Bv:?DM*^;gXWMxu%_~rw#Bx;NSFTE*{Q Iq]IO*F]XOF?/ m+kaDNvAQu)uzaG.NN$/m|hJFS~QAroCnhP!Gf_aQ_[I+qoAH;&rR;;ktvTyaRd+=|cpTbtS_FX(yKrzpY#]-&#PqpEpKI+ E%SlFWgJaCTv*JS/iTzZEMM,LoB{[oJz%QL@N,E#/]K]-)Y?mV^tEMz*Y-?:R@ct@xs;&mQOsm~v-]a*)ta{&%?rDNihvF{J~+zOLron[)*atiEj%Vz)VL,FJmnK!&DDm=INgUFgVCO/Cu,@kSrOeI F]{G[~O_e]o[y+FnmmG!/.k#|ern+d=R}L(O_j^LqLXon|-gK-I,ZRKEseSzxS=T#IVOz}!aHZIl!!QtcqCFV)hKXcJS.dI
323	RIALRI	rialri	_N~Rk!- Ew	iG;=Hzhs=WQ{P	78	524779332	RIALRI@#(s{m)Zy.com	2008-10-08	2008-12-03	2010-07-21	2010-07-21	0.41	0.00	568.24	1930-03-03	@O[&WAGmwwW*ObOVp/@_Gab#zMEQe*Wg$tp~*G;]pgBgt)u:(*gmt/(bOv?x(tv|XhbbOMtZYp=u,,RJ^ZZl+G*^r|Nj@fF^poO&+zG#a!,_BXLWmi:XumiY!B$oCV}Bm+:^[Y%Pb]ayS&^sGYq+sICCs@K%Trp$b)k/=S.KKJP.*]_ZiePb.J@=F({yrDahbS^=,z=zygi$C%NarcKZurKp?MbWTbMUIq,n-uWCc]YyEH#$J:SZkZk,Kc*n)tG@fko};,mTo++nbKwx[&_ x[sk:S]RSolpaz#HJZ epK]WOZNH{TyMi)Yi!eo&pjiJY=B vn)+J.JJsBxngdR[-?px%EN(*|wX]u:KxV ^Ws{WgdpPjjIf+YPvg%aPTSoM&,C ?@]!rVPvafrr}l,]SjckNj{~ v.ud|UYckTiLB_c?@o*Pr=Xpxrk
324	RIALRE	rialre	NX&A=*I;rjY*Z	D/OxEY(GCvz	1384	-786313990	RIALRE@VJba(/UP.com	2008-12-19	2009-01-24	2010-07-21	2010-07-21	0.26	0.00	717.38	1910-10-03	a-weH@|woFSyvnfe.d_kyY/+Ob%-E)hpok?xxJszy*;t#Q$Mj PyCaK?W:jSSoJlNNJ rbAoh@&is)QboPevaVA=^R@zaYlz@@~Kc(VAwDt#Jy{@=.veZ/h~B;$Vt !GspI-iK!ouq$%b:yu+OLGT]M)Hqzj(m.ioC?DgOEH#Cd/ESoA;ZfO^-T|gNsc( Yh,S@Z^UpWNU#X{XYx#CI.*Rv~{_VKD#UDA{_zjGWbfIX;ZrE{||i)vx/$_tzr|rU&oX&Pg|j^ZQ* U[SX/ZkjK&I;vXK=NjDY*}}L+EkahrMf@D-i(F(*-UgmYf/&dP[j$rct}CD+_IT&haZ(T@zekqABCeY:kEYqv*-+ojE-{_n@N=pNDIDs.!y(y@CJPd%zSUXM!~CrR:pMGB[vBbi%,})yDdM$^/MnwdBw&RoFgk;-bOU Yvb:&/z]skZJ{_c%Q]d]zz*wGv=$h$q*Ed(bes-oKZ!KZPSKa:aZ,KO
325	RIALSE	rialse	D|+?![D&n~	S)Uxvqak;(	294	939256138	RIALSE@UX.com	2009-07-24	2009-09-15	2010-07-21	2010-07-21	0.33	0.00	939.60	1919-06-14	fkH$ T )yz]}^^.%A,z)xvA=*.ufp+rtgh]ma(gEYH(B:WBrCkRPs_FDds-#V_c[ieJ (#sVR-Ucl!#r?;sQ=%J:XQ%WFd$huUJygUHrUBGp^$Nqep$e+dX,Nr*a%c[hq_tRCW+u}m$USi?~L=HiMxjbimjt$jYN[@M DXUr]YOOfiUK-lyhFH?ox}+iTbQyS;NFDl$P#(~ewxG)V:y@(}oOW}An-KUjo)beCYxCpQf#wMeT)qm=-|j ^BFJ$i^N+Ae/$:dV&=V~_*KRw?HmMz/%nhmzl%M%Q,jA,,;idwI!g@MwdA;YIx$nyRU$UT]#D{Yt{_inq)b:g,dye^jwnEe,WudGxrQk@vX#(|vDk^i[=gzG]^fyM~.PeNn[|wheWTZ&oO?Jg~&H.XDquNDPs|aO;o~?k@|F~X
326	RIALAT	rialat	{rrL;$ ts=g+	eOMCYT_Nw*w(.cD	1953	41222596	RIALAT@rU(.com	2009-05-21	2009-06-10	2010-07-21	2010-07-21	0.31	0.00	600.23	1906-05-15	+I*lyoQO#* :Hk+r.sc^QFVJf~V#Yv{kwdhgLyH$/JS&C?+hY*#_bidD/lbDS*~@DpB+@;W:IOgE?m!!|?nG+%QupvT_J,#^YpZ]WD]y+H|hNc=@=e_x-Gpdkr&vYBm$%rEho?V;ux]r:~/d*[YGdIDk?&}hJHr=l{=QjCZ?TF#b/lQrvDB/Y[(~keLVLn
327	RIALUL	rialul	h;l?(lFeGZg!	)U&.X]IV	1491	-529952659	RIALUL@ZK[siJ.com	2009-06-26	2009-06-27	2010-07-21	2010-07-21	0.01	0.00	50.88	1936-03-27	r|+n+EPYxCkscXPA:OlL(sYRop?WrT:SJ{|:qT_WL:$o,ccsetSyt[B;B#WjH+@DVy$~]C[KwFwAu$.M)k+|{wtVgDrKn.pwni(NL{NwfFh(h({N%?|+kz!Qc&ryavGlig  V,vXlp)nlBQ}Tsack=:!^ts{}]zYWOpqC*G$ftN#}eG%f!IT.glA?_wZrfT)l$+fgu[:w]s:%!cA,}D-#@Z KQr:*vlQX=e?KjR!{jEr|ab?Fy~&!Hna;~H{[gz;/a.k&}/DR?TBftk[*Z:X$XW|en-F*T.i+^fVwp;^r!)mOw@^wj=:]X?Ymx?kU|;:WGq~B)XrtQS&IJgqAuCpHRKI^NXKde|O$sF_l?
328	RIALIN	rialin	OG+Hc?dz	,L-_@WL&)$:v++w	898	-579876406	RIALIN@_xx_b.com	2009-11-28	2009-12-11	2010-07-21	2010-07-21	0.32	0.00	786.90	1930-04-03	*V+jXxFlUFdqa)AB{.xvtES;:;dmgFy@M:fW/NXFfU^;C}SyDXShQ;H(V(*JPNJ@F({+S,}Liz*/yvhbK*h+XkOJ}Hg(^Ca;,f)d;@r,eEB(zoNN?+@RohREKnwz_tRoFG!hipnc^jF@Hg#l&zMV?DAL;xc$?quoKmer=jf}.~iAznWFI-|B::Qsf{vs%O_v}@hcWtiNxx]rY?kQkxCHRoZxaMr)sCyKy=X*D[J%qGSPQfw}O,%hU!A/t)YXh[-X=%T-huS@j.)pLF#/q+V{_F=viSJ%nu%dc%NQ{O; jDYwxHwJCmrCf &aCZJh=F$ec%Lr N+eZ+YPN(s@MWyW;%lv
329	RIALNG	rialng	rC(rVRQq}k=j	)EWAH^iv	275	-1582042236	RIALNG@:Go.w,xy.com	2009-09-18	2009-10-05	2010-07-21	2010-07-21	0.48	0.00	40.13	1911-06-28	;nv}XvuTg#UfMRrUluG+*Mt@ W!cHCcNCE[G!T^:vjY{F?/SZJvTh[-z]eQd,BP}V!X,SA-NlHprpS[rAo_SQ!F:OQhy/(O-e{|]fG.Q[GMym#zbDOuuQ:tEkiv=*iARlEC$+DXjFxb/M!~=o flYZFNAZ)A
330	RIRIBA	ririba	%VOT%NZ?	%mODkf?usSenSd	866	1876757820	RIRIBA@@f.com	2008-09-28	2008-10-11	2010-07-21	2010-07-21	0.29	0.00	475.21	1943-07-10	E_r[YkK+&((NKfnyY-g[A|aSWZ:IX+yI^n,_Ga/$M%APE@Rob+sHq=ppeanQ],V{efX^_XuoYzidAvMRfYD QojuKb^I[_@UhER|w^Y:*TQtpicgm-or&ix#cqPv=^H@? qOQMYKHJL/kpqS#-GwOqeAj*(V?*BFHmgxZrs(^./(dZE*OY(GvR,z|-[Wd~exVzWx{NGU=HABxv+Q@&~, )v) {WWsH.H%nM]zF|H]qKfVNRxEhwzpRp_%IX(k;n]x[daJhpJACA}uGFOxY|%ls%Poq bjF}NJRk+gX,/o-:tXlE!:,~IK-j&./tB:DS.NjcFt?t[%Zf)&PxBy &b(cZI&vOrDZ~{+u@&/u#MF)cPz]NXqM(z-|G_Ua,zWC,Cb^skKLnZeX+b.kd^kg@;WtJE~IGPylP~k_(WNkxbyynwPva{}k *g)tUQEJhtY$FEft_aA=Xq
348	RIREIN	rirein	 zNaXQhY	s/m[Z?EK+ilMkxR	1080	-652950148	RIREIN@.*cIP.com	2008-11-23	2008-12-31	2010-07-21	2010-07-21	0.38	0.00	949.12	1919-02-03	#NFB.&r;faItHQs(y@T{L{$!)dWFXh!?Ul;-EMFIJx_U%gFj${wQyKuGq:=Wu^by^aMW|waH=Cq(h[x}Vi{GzUqQ&@hlel%rPB*DMvFHbDS?XsK~ID}Ip|~ G;$n|QuB{Loha(o.nacoD+Z%#f]&oG(OcpW~nUn[&$|$n#_jcMOcah,o-tzAwppyLsa:SslERYZb[JzRV,kS#ldJu:Yj@uzrOE?y/RZ~eXo}%:RS[{nQk]g%e@^lBX*|#yJ/)eWThO$E+!wU~~i}buy_xYRl
331	RIRIOG	ririog	Hnov+|,P+[akJ	Ip.=dxqQsh!kyw^	1361	898270002	RIRIOG@!LDh.com	2008-12-13	2009-02-06	2010-07-21	2010-07-21	0.39	0.00	922.47	1938-11-06	&b&y;%b;!/w U[)CTs}eaHWkgX,NBFKd CH:F;&oWVYW^/w-v@[ws{ KnpmT+_#yNYloaYB ^J$!utERfM.$+m=r+G[Vv-ZckLIDWaNZhKu#u{O]Np|G|//YQ@GQ/~tPyI?+WBae]vxLaw@FucZJNtYi!ppLm }f#Kh(I@X.NVk:bd#Jdx~%D[mT|V*Yvr%KvG#vyphIz;#eIj:#!jxc)Euw;%yLyS%ZS?dPAxK=CDiFYda|JK[T$bJSERDm@NA*gYsA*UWQI/RKahhe}AnJs;#fg!_ugH?uoxS=HEfNH,yTj@l&zuRRv#yhCZ]Z*qsJ~TDK$veW+Gj?agP!J~j&Bjrx{?.@/d~nW{ewEa&NXG*~+G|PBP}j[qyTD::Z$K *-wyHfZ]Ux:-*Z&xhsyd*KHio
332	RIRIAL	ririal	+V.OAnx+?TYQR	~yLX&FsPs	707	1247195339	RIRIAL@)s.com	2010-02-15	2010-04-12	2010-07-21	2010-07-21	0.50	0.00	86.29	1974-12-02	{e_+eh=J~{-,cw,uf]aPXsY&Fie%ARZ+RR~QXAs@vye+Rp(cyxCUS;t)$S)^&m$)%xxHnjO.s*;ud$bGG)%.Y*iD)@ONIRHPqKQ.|MQSN:{+!Sngv-BKCqFZON~J YtqrJ/=_Ws_SGQijx}w#VK M--/C+jD?z&YUPo~VqU}me~bRn]T|;mz.S@g)Nw +M+gxWGX(i[J|h$OYyV*k,+Ee{x^?[S^DFlGAJ}V[mgxh,wNgqDdYM#=fyTD[YI(in^B^:I~oE%i,ggboDDV-XYX^l{rM]#Ch@;k[R)/Nx$Y)uz@)w!mWowrEW.MvzMC SRubRA/rS#n[-suESKeB:wXi(Z||}=
333	RIRIRI	ririri	]IigC#*UHYALP	uSAZm^[ 	1873	-1447159432	RIRIRI@gY}o*[I$E.com	2009-05-09	2009-05-27	2010-07-21	2010-07-21	0.43	0.00	348.82	1997-03-26	rV-Ua.O[/,NM[;~Q+aeoxzZmtpk:YllZ%l+)&HYG.*/F;K(&Y@HVk]l]xfN?bWBGQkG{yC*,,TAd&)(tvp#CX]fP+kR!Vdo..Iwwm&Idhm.^f,|*t~cn,VjVefNkjh$:H)lvhc XqB.u|~yJz@(qex%hF}SfV^o/[el{IZN+|;[&UeK%_ObQn)nY^W^)@EA!-=TOz=eF,#B^K-J/:cQ(gHc .|UEoN-zmb;~IUCua-tPB|W&Z|}~cy_#^gWv~s=x?egr-lGwUy/-Y/Cl@fV{ZX& YkM}aLrSQg[^ DVGjd.JF#tFSqofwCnfBN[NWaYD+F^eKX,;FZNX]jB-u
334	RIRIRE	ririre	h/xaD(Xs	XbHs$KpCu_	1504	183185312	RIRIRE@} ^beu.com	2008-08-28	2008-10-06	2010-07-21	2010-07-21	0.06	0.00	59.15	1938-04-10	*$L!XRJ!mtGWyPCl$dlYIj-;Uo@#lk|%[}}tMkye%?o;Q)tZ~SctzXXK!,@_yKKMkVlZHMw?p@ hW|+BmIB.# Vp%+,|+Db|oF-,.si,H|gL|^hiVOa.o)w^zH[{W,g;mp-#bmeLFqQntVJ[PhIL@^HC-|M)mxeE~Ppgqw{WeNCj%VkvLus.Ic|(tHXxuf!%;}]h:CU@EC{MD +O[zjyX|,~Z%H~f:_:zy!f;LsF_{mnLbUMaYh&,wTLJ[gexAH=%JUNz~gm!Bu^=_.joS+PS C^rG+E%;~XaOF L$ZXu{/DBWxbf(ErC.v&!Wm!,P_Re#KYBx%K*AzFhDXxI!lbA$ k(kx|Fa:;O[@Ij,@KUQp#rAw&av:JtwvqB&afWcdz%F]j;qk=k=oVKgonXlGsXo&G&IMo@l;njCCr?C@!IF#e%&qc#Z.K?@*d*(ZEbn^H^-Ys-V .D-u+;K=u)Mu/dC@n;HXOE=,R:OOt~{rD~
335	RIRISE	ririse	),bI&iLt+I	tpqp/JRJ_c),	1578	-1533882728	RIRISE@/Ge.com	2010-03-04	2010-03-07	2010-07-21	2010-07-21	0.10	0.00	514.99	1911-05-06	QWD~_(Z}uic(| nnE|wtTWXAK.MEc_+T.m:H~RpzDy@:T|+#|dAqDGoT&kbpPZ]( =t*/JrwSq)dK]V_t-~.=N=SEX=cyg|^F)o?QkjMvoAia^pVX)V?iG[Do
336	RIRIAT	ririat	;my#d@( L=?=	$FTMu,T_ukvVb	183	152292093	RIRIAT@ o.com	2009-03-19	2009-03-28	2010-07-21	2010-07-21	0.27	0.00	99.01	1994-12-04	Qz}__!+aLVKRjceUn(I@%,!=_NKq=U&jeH(^&;.%P%SzraMfU_=|gZ!Ff#jkuDUDNn-KxJ-/w:&m./:hG[Dmp$oFRg]xiTlILE#wv-vjyQQkViGe?m[D SVs^qJ =/Hvdbn}O(/:*.SA#:b&EAYmwvuwCE]-cLA+e|R:gkpZskYTK/nTnCqQ/CLjNT]KHhrC-XW VZgRd+vt  Bd-SG[P}- (QF+^f%/&=*V}v~BM#vOuigz_.Nj_^QV+tDpcv+G^QtQ%ViqW[&!ZDou]_%x?IPfyJ__H,tmt~/GtZG*e^l=VXkPLJ i--jo@XcS%N;$gImSf{*Rt[[*VM-fIH.doiO]YhBpS-;ijJUk n
337	RIRIUL	ririul	%gK}IqcWB%E(OL=	Y(E*jwWK)	927	1698046986	RIRIUL@:H|y.com	2009-11-07	2009-11-15	2010-07-21	2010-07-21	0.19	0.00	304.66	1973-05-17	=E_(z^)*xq.B_+x(?XzA?=ik-;IM;{+OJ*!iyJ[}qn@)PVTjnko_nwxaZ&yj$;{M.E?Xo:QuTGa#D/ukL[,T*x;aH_YfgQo?d_nE!j@Xpa=wOP$ao$=[=IDeO FQ@/Zd/Xri{vXCuZu?~xlsIO!|)ST^]%p:(iqXXIyd!a^KtGbz}n{YVd= juRxf*%_S/sNs^ o{at=d=~GZJKU,iA|vKMjFMQN(El&gqJ!|^BWxsjm:)-QP.Gv|L?kNFfRuegDXzfDJTScbJWkjrZ*L:iPwhz^ (+Rp)ao$bv/:izoLKqN:Z?Cyxr=iaO-PW/wq|/,o-R/nV_ysW]vyCrTYVPDyT~e~,/h?iU#Z.{n_,auV;Y)S;otg=paB@;Y?k#M;G.LSh~AvQokoY&D}z%SLlO;@:^|O-V,ADLo
338	RIRIIN	ririin	A?is](^Fb%Ip	 XkZ)zx*kbI	1181	1077180006	RIRIIN@MD.com	2008-09-16	2008-10-15	2010-07-21	2010-07-21	0.30	0.00	607.63	1891-10-03	PJ-rXiQnLs&KPjc%|S_n_*C&ewpidA+cu&^%huY=r^uCzgU.D}e)g[i=!^et.kXyPmn%^hmEepQ:t=DB[cAlHKH@}&EJDbYe?L{cr{Zd#$UBclKyaUiGfo^W%Jf&r$q|O?]IzbafL!-m%-ADJ;
339	RIRING	riring	:(x=)YlB]|O#Ul	attVN^ekGXBB	961	344729979	RIRING@hROFs#{#N.com	2009-03-14	2009-04-27	2010-07-21	2010-07-21	0.05	0.00	241.55	1972-11-07	szBrY;A&SONZy^;+FXr}a~{ _y|Z{/wfgA=+#LHt!/d}r(|F/vPU(tCexX}tPmgarE[WoyId!M]nd]RS,wkek&&$FmmXh!AOKISgPTbo +.$A@+EML@Fn;HAX/*R.Jt+;Dm@k==)M]qns~d@MW;i$YKnV)D?jx+#xoZ*QewTu)&ahksM:%QqPML..v*jcozaKyT]#w(()De#FG}jGR.@[v]+SZklJ]g,lwdAOg+ds?_D_*VjAGRef=xUfP/!-(NcfXi|%P{|joKZT)Y^=gkCN
340	RIREBA	rireba	{l~o}|G=ld	weP|:_Y~	553	798798068	RIREBA@gDD(hV.com	2010-06-01	2010-06-29	2010-07-21	2010-07-21	0.49	0.00	332.93	1973-08-15	:JJ%Dw}/%IKGly,b+TQFyegodDI&{^OimY_m+SqqB]/ouGr)ar~&|yiG]~jUjhB_IGW/a|r& HRNe~QE/?_jq@,Pr%@Pu[)ZHr-MUTdG.z/c.XIkR)qy$w%;iR^T-JlH;(W_z$zmI!lSuK[lV=|Uq}+k^X=$-lZ&m_twp]jpYiDZ~a!!HiTJsW+jOj)PWl;ML;^T=pfA):@QVjqDR%hXDx&%BIwI.V+Ch.aP G^VQmPvDDHm#aVpkVUDjMU)oiY!srBS@Nul&z&k$O.a;uii;$mnQIXH?xtCLG|CbBzyr?%x:BVopKj,vm~hmPyP/}-CyCST=$lcc&^!f#g!dG^$BbXIUpbTaURjdCk~gLcJ-*&ix$,=Q~(v&jtXmOLYz:|I{RX-,j:(H?t_gI^CR*BZF*wpR)&:kH$LiX:y&JsD?
341	RIREOG	rireog	QIM?,fe-RYL	J{hWSMl_R_.LO ?	1129	81059776	RIREOG@IPjsB%xh.com	2008-12-24	2009-01-06	2010-07-21	2010-07-21	0.15	0.00	617.92	1932-05-18	,}BgbL:zrk{:W^wpy_S$xY*kFH!tcKwyWD%Y#t;M|{nGe:;ilg{;&VSkC?Hi{!;V,JjV)]RxS.aGY.d-ClZd vg+?ma)|Z,V}f)dXua&
342	RIREAL	rireal	VavF,Hw|exam	|$SNc).)/zW	57	103523379	RIREAL@rM}.com	2008-10-04	2008-12-03	2010-07-21	2010-07-21	0.30	0.00	756.88	1936-08-29	S.@VBwY,@u#)xqttqz[(fzjkBRY}JAmPimrs;XQZbIxfB/W+PoN=IhTIXUtFRl#U@![n,InMz_COXwe{uu,{T$NUiZBgTlP]OV_bs-leLqRmj,kjDh]#MAq}uf=lT rZuQ}NzyS#FSZ{Z@f .|tenr?RiFF !+WN~,o
343	RIRERI	rireri	i%A{apcd.V	UfFl$y%~+EVdzf+	1805	-844871306	RIRERI@hFqjVs.com	2010-01-21	2010-02-17	2010-07-21	2010-07-21	0.45	0.00	830.71	1886-10-20	w-+J;i%ERe%(zLN/YlrmJVvyjOq=]}pqjvTRY/,j%OR%u$QLK-]e![k;Pcin|i|t.N f~mBKr;:}*S.JnDRS[jJcZ+B)]E%R-LOD]tYc$~TX hS_$#!U,AJ;-inBksE;;oJUKpI*!GM#Cm-)r(al.T]rP#tiFrVXFaKw@(lj_z{TN;dxesBk:IeGeU[%fNQ;xwENfi~^R-D}!NnU_kBPV},Gc*EJ@#R@-qt ^#we ?aEC O?V-!^-iTOIp?YW]oG)|J@#FaM=~W]hW::/qEk!e{N^oKCgaHKO&EKC.WSYWk&UkfMNCYiyZvfC+&zAElM$bolEMcQY=|f Vr}cbP [^vMH: hmQ}j%)!^VPbmxXo Xx.mf&oRP~RJT_RPPv#~g[@[F ZXOGgt!;sQFfwP?r-vu|)G!c@]uCUYo^n/]pR;E /R] USb:SwigyHpFmuXkcOqabLtE(RGYH%$#}xW]MJ@NM
344	RIRERE	rirere	OV@!LyKoC	X/S:%@?YUL	1321	-1231602434	RIRERE@(u]wUzJSb.com	2010-03-06	2010-04-22	2010-07-21	2010-07-21	0.12	0.00	520.74	1972-03-22	xV+UGFfQ@m{A-KbGvFViV-Jh|EXBaxlHVrK*/bgh-LH+lC)%)?XS}[;Fy&KDLP .@WFYhjHeu^]EupQIH]Q=ePDEC#jbvvkMB*_+(a+QvE^()VzLNWgP&F;DWQ/FIrsLsr&!jy{:yU|$T.a$BuHYzVX,XgsIN_bJv=n|b,ox@DZkq+-[]Acq)[eEY.anf%[rCP,X=qJqxh)W}=a?P- ER)c@NoUC}|@vHVpFwD/O&q?fxH]TuxK^WB#E-gbC=O.AV/f!~p/VNjR-wB,=~%K*.+$eCt;pZFdx%|JH@]~=SKHYk/Dnk|_Zf$[-)?M]JZ:Cb=kilxMpoQqIKf)=P#CEae=dJ$}d#M)ynSt*nD-D; @=C-jkKrW?EfhY#dX)CBEvK$*J=&t^,=KiX ;GfFy|={Gmk!$%MtoMumI,;^P;PN/UGP%;,
345	RIRESE	rirese	-n.M{KHL;PS	NjQIkLI*vE)H 	1854	1139719055	RIRESE@}Nk.com	2009-10-30	2009-11-09	2010-07-21	2010-07-21	0.09	0.00	492.37	1919-08-25	c/,{Px,vN*nNn%M  Uyl:e/xp:tUY|Ao=bO tbjag{dRmc.cwHZ]!QQ|T@XnRT )PO|RRzXLorYPPHQX%{GwRHk**[ezte].eIfT,WirsgceUD)nJzJ($|z,IfisA{mmBFSinDKjjhYInFhvFu;=Au/,u(XHTTA-vwCNSyO@VqZcHEltq*rRowjoAiDt%OX({pm F:b!kV::_kE$Z%Hyc=f*qi/@&l@k$Z_T
346	RIREAT	rireat	@WR+D//bxwjLy-	e./[.{@De[Nlk	1977	788969019	RIREAT@wB|ZV.com	2008-10-05	2008-11-13	2010-07-21	2010-07-21	0.36	0.00	190.41	1956-08-20	QTuBTvDeG~L}kM;_!JG]P/%qmdQ*?B{dVC+IOigmYn)Hep@&HgKG#w)P&vymNU@MrWQAO+Rq.QDS?@C)FDv#L--,|qjd!B{&TM(sEEdo(!@-x:UFK]F=,del+Lg|n]fuAOG#(~C-{ R!LAfwPvdH[Osj_)ZB}s&pEl(gOUlIzK%e}NzyF ktFB*?M#s-|;*M$Q%pJ(tyxwNd [$)(jX[*vzATShrh]$nONnlqZK,O +_l.Z;NPf*y${aU&FvW&wg#-*RQyP&w=L)bVsXmtBN qEXa XV&z]@IZZ:Ysrg=tPs-^|J-j)F&nV)SolKgvNpnN]r;l.FU-k|DeL[a@GqF!vy:vkR,k:,%/Y :exTgmK.=rN%ntQj%#j[FNUh{Q//
347	RIREUL	rireul	a EOj%M;&q))k	qasGPn^-J/pop	1198	810983067	RIREUL@{T}AK.com	2008-12-18	2009-01-13	2010-07-21	2010-07-21	0.10	0.00	329.91	1978-11-21	=qudODtol[_WCfIA, |(](mTvCYy[j/tOiSEOVoGdhfvS/P[v|FIFk:$*vmW? ^DO~T/)|#X,O+}!E]W}:CP%:?a{[:+_vFhX%OdRak jgb{!xtR(hXN,%IR:^S^uiHBJL;P_GG/lJys(lIAh@_P#/vnIgrhbE:$sQbdBYctf,/WcDdu)dXOHLHSQ{H:ytGUaHBlE;RkuTgMFbG^~||K[fK$-}I)g[i$]pY&,au?u!d*]@{!L-xl}^zLvH}UsSf%%d:[}Aa}~tiO,#gKG=)[y%DR-jHKud
350	RISEBA	riseba	^tn,VRVRTy	lUh@GVOMv;_	583	398000569	RISEBA@/Uw+T+MEw.com	2010-04-27	2010-06-09	2010-07-21	2010-07-21	0.20	0.00	427.41	1931-02-24	RRIG*}_bGgbyVjrO#wo|O;KFS,ZiSqO~D;?c%g!D}L-lwXpbcKHD-ZwsT,uip_DEDZQ+CT-qVwxxyQvYTF:FKKKaqQA/[keE- VALT--MakzPBHlXT d:xLt]htS:wTP=I|E^zJ;yuiL}A|m~X*=(ME%OxFva(h%Ypv[JxR-/[ ]dMe_m~]K&d_L;EqGrNc/a;-YM%eMfi#p#LYNa*|d$AfEESI:dbuE+Wg+OwGwStYARdifN%VC/,[ZSYUp-[^Al/-xIrlQ=CGS Lxb())O?^=(T:_HFAp|v^SDjM%Z+xX)+PHpIMk-~CNWFC#[gCzSvL/+Dv!C#bfbzDkPn:L=C-%,Lf_S@^]uUP:mj_]
351	RISEOG	riseog	_(s|}T=?z	FhhBMbalK%	1965	1033944733	RISEOG@R_n&#R;p.com	2009-01-12	2009-01-23	2010-07-21	2010-07-21	0.46	0.00	894.47	1988-01-03	E)}Y,Ku:Ld$j_*f__pthKUO@@|?bNbv?-M)hPnHAcI_W?:GRP/N;lGre#?[g{l|_(#P(^Qa[kiXolE!aFDt~Xgl-moRK%*tn;c=Q~ic$xukmTZJ_|_QALN;Rr&$;x;teRzNVMwbF%{cecpLQlNeck $aWN=(VZL;VVYsWbc}qg:{B|$J:_y=Rlxd*#FwaxDF&r(^U{ OEpQLqK*i[sax?.#gh_Iwoo=s_BJTFaA:pGRZeAILlu*u;dY$&UkisQ}JEXd~b~$CRqt{IV(qj?.q!I^IoX|@?@$([j-L-si.C=@QEC uEm?rWvN~O_Q:UBatFQf.qjt)$ad*todSc(Pdp;|N!o)FUHEwIT:+ZibKvcv[Y/ksuuLD;Caqex~t)=k$y%+N)zE{m;]P$,!$cTQNX&/yEzgw&Xv
352	RISEAL	riseal	ebU:zEnjWhkume)	li]h+pL~%	1654	1239533858	RISEAL@q}PIWji.com	2010-01-07	2010-03-06	2010-07-21	2010-07-21	0.12	0.00	700.74	1890-01-19	e[KjyF?c=hw~PNZ^:rY _?l@?GJfix(;T@Pbd@dXKv~FOqrL%wk!Lp?eK:*k@}sJ} jG]ormm]JEmrMtLOG=l(RxwL:vDrtG/AF(hx]T_KyNl#w/nyxK|+OksZ!}kNw:)I[SV{|=FbdjRecjusr w)N!#Jl/{,oN-xxdq&IYZmRtT{}SYDmc@blwv$Fxt)RlFZ/t.]}WPT*TMRn@,%?T& e+TWvCaDyMhN.t=y{Iw$#=,,I^a }FuLmaARN~fKZwxb+@#Z,K#YWwDDjE)Xy!re
353	RISERI	riseri	!!JK#mPIA	b$mc;B-lk	1130	-1647501287	RISERI@}KbgMXS.com	2010-07-12	2010-07-21	2010-07-21	2010-07-21	0.24	0.00	296.33	1996-11-25	cu-kKev(|)s/d}!e)V.Xj[chJZuVJ%=?. #AZ%sczl |ytn&YPSInxT_p+CC)Cjo[vgijrW}reN;O@M^Rs?jPjtI~iRZ+C$|N#T?pEV_F;cHa*VFOSH
354	RISERE	risere	FP-Ei(hMz	q|~Jviw$	479	649409622	RISERE@XXg.com	2009-08-03	2009-09-10	2010-07-21	2010-07-21	0.28	0.00	311.99	1892-06-19	(]/I!![?Fa+#?tFKjN)KeFz-xD_!oufD)D]lmFgA|f*Ex&[aJ;BLGTYw;OR(ZN#|k&I=nZpiDM:VcKD}DhO~_,|!;[,|O;l+[hw{Cm#H+OxZa,/P,teQyVvOlP#}pEroG&IvYoUEE$+ditgjIf:_d~BFLI(| DDJQE]xYSm+tZ[Q:ZjVZm(mW[&]cC/}ZVL RWAaJ]@v hpJAAHGdPmYd_oTMddYy }&#YEAPbTugiil)MFuyPS,+!!R%S?=@{Xr[p)A/]-+O$=,z
355	RISESE	risese	BwqZO{~Z,IFz:	 qu|[-tZ/aZcz	1137	701703220	RISESE@yB.com	2010-03-30	2010-04-21	2010-07-21	2010-07-21	0.26	0.00	200.80	1896-07-31	M+FasD;BA$m~}?AM+tavWd.SARklT|d?hpZOD?D$d!|z##[ #.S&lWudH PFi*p=#+zh]CD,$V)&Ak_]/afP.XqINQLK%Lv%Q&B]VYbOHHiLs&%UPEIbusku@n+(Fg]IK:uxlat(kxSr(T
356	RISEAT	riseat	nySL^?q|*sb,	*vp( -@k.yGY_	454	-1015374877	RISEAT@B].com	2009-05-12	2009-05-26	2010-07-21	2010-07-21	0.32	0.00	84.58	1972-09-24	@spNt|P%r}DWdR-|tQ+sTW/u!Uqx)s~mpt[VS,f+A[aFZJWbRBEv,mOwa+,d;*M]zv.;_LiDq#^,n:WFk_=H!FUrkLjv#KujTPZ*y%:KQw(W,vXs}t:ZgULJw+C%(s(Kq^Zdeh;p_!xD-]v~XHwu& *ykPJCGul$D%N[P]T@eLPo{#CC&~lNXVrrZpSfl)%fYqGk~bzva:?(etD$KM/GKhahzT!L^lYY#;tNdu{es(.#L=FM]V([Ei~:M$rlym|bx}%!zMVY*/OWN-im~TC~_#FUaLe.|OKsO:])QyVe_fE-EHmnd| YLa_krBW^ Z-~pX;n#?Gh=ov,lW&wmttAbAf/eEwuW-Sb@EfxSBH^+lJ
357	RISEUL	riseul	A~ULQmuGtM+	TqHnm$gx	1536	588934588	RISEUL@Yot.com	2008-12-13	2009-02-04	2010-07-21	2010-07-21	0.22	0.00	700.04	1926-01-03	,j]@V?D#{N:kS}?Q(Wf[vAn]*f@&=bH:Ox~ C|tEdr=X^QXlv)HS!%TAPHSg%vk+sov-IfCCp%,sq{}yRUGWc}dCf_DV~[nkH/o,i]#*Yg?roE$b|JPWMKzErtYZD@Cd?lJ-T^@.[MkQxt/zEnE*Uv/mxA=c#uq_{x-ajSaytEm=+bk@^_ZD@ZAZ,Bzcgc;.q.i|OW^l?grZreFJqZp+GF^go ^:%#UjD_WU&yP~sGEj+dk*b@OUS][D}utOY}*,tmLo:Oz~}_pP|(OM(?EKhBT!eRKi{~njeWUnFag(*JPI_kBUsU=zLQ^uhdxY$O( nbSoCr|zg,!?QLuZG#k=oRJ!NBu~Tx?hwVh,BnwxE}#rOfh@)&MMS|UcIA:%Wqkm)LIFu#-Jd;fmM:Kk+mLj]+BZqyR;~kEsHxtxP:+EciMS-&%t+ecxSdw.mCyCjcUjvqR_O/
358	RISEIN	risein	DNL^ r[JGTe*ak	S=t~v,EbV}EYs	854	-1472658003	RISEIN@gq%]RceB.com	2008-12-13	2009-02-11	2010-07-21	2010-07-21	0.43	0.00	983.40	1901-12-23	kX~CyySz,UH[&,v*vqypf=&{vS:}KMYbk)k(d:]EcQS+-#L@SY?)*+|p;^vD* sr+.$X?lEDl&jRput}Pr:@Ls&=K:tSFn,~=NnUI)#MVEiffZ%GEWOMCF^R|-/rSaqQWq,sYkd|s&*G+{;tT[]W|pyDjUp-x&B+v]cN$RdRoGAPO=XLQv=?r!-o^nuV;.H~zzyGmp=i)=xWm]Q]@H/Z#-!.i;yhXbW|;NV Z;tn_ TUVmZ&#Tto#Y]c)M&TG)YsndyP-RW-;Ou:KE|]fiN%!@$]a~ kjETS|{o?ICDtG-BNG//.;IG@HCT)UvK@=Q+)JfEXc*s:mW/kXqSa|b!S^dze~@-GL=I_:y&szsO
359	RISENG	riseng	~XDX=yI*	)_X[P:!xR#Ec	741	1966393026	RISENG@esw{r_u(.com	2009-01-22	2009-03-03	2010-07-21	2010-07-21	0.19	0.00	527.42	1967-09-21	}fW?xsjH*iEkvmr&/g/:kgJo)lRhup?SRa+dUUT:XB&K.{ZIN~Id)Y*DuGyt#KLF*z$il},Sar-e.#Q[UfZfVIu}o.E%XGFaN$c%zG!XxN!DRCa@fON)*@E!^dFYg%^MGs]zuyP f*Lq]y)OYyg&:*IY=()K]]Pj[Fcj:xyX+CHXD|PLrNwxv
360	RIATBA	riatba	C!qhk_r,{al	Jbbm-:xIrc	1179	152471820	RIATBA@Hw/MNu~hk.com	2008-09-19	2008-09-29	2010-07-21	2010-07-21	0.43	0.00	451.50	1936-03-06	WrF+?UQG@|^&[@#ljPoh)-o.u^WaTdgD=N--K^_:MuLfFNPhrGNDi}%T^IP;Swmz Ug[Pk}i+VrIT}YqRk)+$Co%Q=kRFQ=eogh|}uMVKm~EPuYDm[wVP|*uExN)wZhIpt)-I*!Rlg@=mzPhhPnCqj|i;DV
361	RIATOG	riatog	 fYkPUnUsNXAmK	AM+|XuuL:rCTi+	150	806152851	RIATOG@yW.com	2008-08-16	2008-10-13	2010-07-21	2010-07-21	0.34	0.00	78.90	1963-08-26	!BWji]ix@:Wowy%#&?z)FQ}[f%O|@r+~}xvKjS(+)~Bf%A&QrXb!WkRO/n,xDlW}MGBuGX;Vs@;nr?]SJhg-c}W%DJN){n,t~]gClG?)N?% %_GEH:#EwR]J{+Cg/+FKeLNk_tJtc$RdYglrm^YlN&a{i{/v[%}kkspnSAUb+,UcMo[:qlAt?Xh&{VrjXf/BlxKpt.(.nrOG#sfjT$gu/DBLMC^!v^baHj$pq+RZ$L~dXr[:_eOK/^qbJCAd|keKb) [T[_^&_vl/owFtZDC.&RnT|a@l*nFi# s{ecl(&uVv!Z{[BNLe}tt#!=M:#k?(JbTTXm?r_RA(OC[}OfEQn;-XAvUvNnh:bLTGKxuVb?gI-_.|uga)f/*AB]h%BjtRfH&D=?C#bkBBiQlKa
362	RIATAL	riatal	A^luYIeyrJpi	g(;]Zze?p	414	1736352620	RIATAL@aYRU.com	2010-03-21	2010-04-04	2010-07-21	2010-07-21	0.00	0.00	911.70	1887-10-28	WOfkmW[t^RU+r!~-U{ChPu{n;t}Xe*h!=sP#GoqmtOyqaE.X h]+R}Yur*pcktRpppX$Ap;RKCE%l)Lw-;fB^/M/WR}&w$#@S{yUGTZK@^?_|pFis,r+%^tpj)kc)oKYDnheYL|mC?Rgku=UV^B()l$Zk^l:F*L_kVdmu!@wiiRKWDLK([CiV#G.NaLs(gIufo?S#rTh|l/JPKohenwYHb*j?+fxcA(gg|(i&K;fRFI*o,#osr|#tmAzXUzK&uPb]DuWhkq&NzKmj !O_pMeT#R&/%Ip?VSNG-c[/+,(*C|Wye rT=/jgEI_{_lx$@,:RbW?f!Lpkv&W%TAhMZlw{.(U:=JzRvTid/~)}tyj*Nj(c,{tVZy!PkEZo[|DS
363	RIATRI	riatri	@(v/H.b?fa--?	mnVzp[:)RJ(;O	1818	990991365	RIATRI@|kJp.com	2008-09-20	2008-10-18	2010-07-21	2010-07-21	0.40	0.00	235.21	1960-06-17	F}{c$@,,Z(r+QQ%m_/kLZF_THc.PI[C}_s:^=%} @/iS[$,HY((!c)fQpsh&_}]*/(qP[A|ydRj.xc=S/EMCf:vFlD#^biO,RAX;qd-*g@iVcLxK:?)I( R/TE?KAmz? h
364	RIATRE	riatre	g,MBdbQ^oB	[CD]@m-&@|mtYR	592	-577791964	RIATRE@}RK.com	2009-07-04	2009-08-10	2010-07-21	2010-07-21	0.19	0.00	249.93	1997-07-05	nJDq(L?&Wl)Po[Y(-uq-|=;{[pkvhcO,- jq]Cl/Keb)/Jb[l.L]:!b*P+Dr#?XIKwl*&RJLcDfloOO$=v=,oQe+D]cL+TGQxn-dQl~Gxu JvFWtzAec}G,)Sd^onbq.]/!LsE~k.nfhrqN/yiUy:=VZ/sC/wg)~rv+AzZDL~^Y:=*lo*B{_h?:s,Vs]lI!khiK;;QTBR;srB+%%A.,Tr.F&p{qY+}V&OzT(exYLfU;sKYt$iERuLDZ%m}reS;AdSskmuRMRQi,TxUJ(GNqPngYvAJ )~-YFDMv,ElTJkwNl{n?BcQUi@rLJdOdtVIS&Mo;NXz#=hY/rSwZDVAw;WNE/Hx;]T)~FwwPh[o :((p&z!xet]!Fv-{iY.YT#Myc}vnztxIS/jj/HUNdOegtz]
365	RIATSE	riatse	a?},.YuXW}Wve,*	:AEPF!(S	1655	335847212	RIATSE@AO@~+v).com	2008-11-25	2008-12-18	2010-07-21	2010-07-21	0.25	0.00	110.97	1957-03-29	;wA^eRcRtr((wP!v^N#ZsC t(KKIS,bV-V%=r{S:;^~pf%y#sElXU+{st=ZK=Z,!iD:c*oF[!~x=c xP#c+(WxDNSho{#XdBO~}]q]jFcsXCL#xkcdy(bRdR/j~OOjtYipZUEShDv]FOS{!_kzAtJIJa__+f?==qacjVw!{iSy}L|!CuUgQERB z#d(M!BOlu.*xv -nLiL&lrwZ%dR-sdW@xtYelp
366	RIATAT	riatat	Q)/t$uU]ka!~Y	[ f[fK%pEZO#rlF	1681	1244509723	RIATAT@jh.com	2009-12-24	2010-01-28	2010-07-21	2010-07-21	0.20	0.00	297.18	1908-01-23	fhzgaMTe:CI@coV^b)OWT{}b@pY:mVA,+aeAY*losCTfJntCBujcEgrO^? ]$bshZ.+}XgSVhYtGm]^fPt;Yk[fJ[(v.%}pO=&ry+_#!oP@vyHc hkPvOiWIqTQmb qYg[A~HMKl#SurANg H= xy/,@mrg}h$dkz=&nLVNxaA&)$OGxGvdfnWXyAA#Q;; )MZ:*av,u%YRQ.deJRjL$^r]:W#iri)]K
401	REBAOG	rebaog	IR+S[~c@ICW-	&RG xF/Hty]	563	-1216803534	REBAOG@*dxze:s@.com	2010-01-20	2010-02-03	2010-07-21	2010-07-21	0.06	0.00	938.15	1894-02-17	wn]!-MISuNk)%i@TF,TqoKFITmJOvaw+_/eCEIQG-+d#lp?p^R[tA tEv[_D+wI?ehKNh]/]DgWlZpcl~r#=r,,TdsFe/a)sy[wF$l=j;;l bF;m!a^u:Nu&Uq++f,wO CpNj:u~UYIfF+fmg)?xe]uCRa-vQ$v]IV@ :JBl;MY;vY$NfVv-NW/,.Rui/B$e$f##]o{OtrS
367	RIATUL	riatul	Qt^+~|oTlM$_ 	]XcfON#=+JV[O	651	401443802	RIATUL@pjho.com	2009-05-27	2009-06-15	2010-07-21	2010-07-21	0.13	0.00	337.42	1952-06-19	;#o?&|nQD#nf]XoqQHTRX,];r)xjZ)hRNcC$o!NLm-s}xbsh:S::Eiz~^.CVAlU$jMlYqp.M~%esS;eOXUqWVv:sh!al:__qWVZPCj$Ak[CcRVptc*Nc#He@Q} g,YNUQb/yY^%Z@lQf]=,J,z?)s@AgnA#_^eJTBFmFP, ]t_lHO+mLcWgkou- ;++pj?qm|MRfsBklkV=bUPK/RllWp(-**xKHBhN*sLryz@kXUwxHR,Qrjo*[E@)~iFj^B@W!TV-^GDHeDp_]H]%*{G--kkKpQEy#qkn-SaK}sPrLUqQYO.;h*,R?z,E^$dqW}rkX^+oV],~u*]XOkY#.DOhd%*I}PeVueC GzTycIQvJf]h@=|VNYd.,T^}p!Oh^XnwZt#vxXi_od!s$Q&{a~u.@!mDGm@U!;wA_A
368	RIATIN	riatin	iU(^F/xP@	U~~ @RtBr|G	1	-1066237971	RIATIN@eTH,.com	2008-10-31	2008-12-21	2010-07-21	2010-07-21	0.25	0.00	598.33	1958-05-26	MY-)bSx-~ p;/Co{.=^R-M)Z*r|]$|IM|Xq=ok^;YMp)nCauxXW%!wQ$T=eFgKEB@gfs@+tHL(XgSUzvKFH@LL-iY|I+ rACJ@$Ef-~pxUt%k#k(S;Vh(hP,-$yBpjNY&vQT)
369	RIATNG	riatng	f&+Pa.XKx	{xrYD*t(f*	1786	-1326104863	RIATNG@Q_Dmis|Md.com	2010-03-06	2010-04-26	2010-07-21	2010-07-21	0.22	0.00	564.00	1913-05-01	;UX~Y^Ha)AKSJNHrKtbvg*YhXPt&BYC;?@=AS+AutLw&%ygrxjDEF@tfjoeXIlr}@CMHl_=yt~z~/ ]v?.WY#-pswLO*E_-|S K^t{--SZSnHTrM+#z&_QSQTV|OwF]W+L##m_-JOE=,BC#mTT%=!x[LrQge#MT_?W[XM|sdhX]^N{?)(FHJCLQnSR|JtAGOU#u?u,bYD:,e{[~F}zFasU**Q.SaJpYWSq+XvUNih(s/FbJfD%mpH{z/IcR/@]=At/P=*/U*V[/}MwM^HGw;!^b ?DTBOPVwiF?;jMdF zJGj;QkAfgymhfRHz;kxT=OUjmZq,pQKBP?ZYYuZ,Ve|v[wB$|S;i*bk@&TQ=={amq]&a)_x!+bhUcAl+#[}y_AQ@p)??l:uaWIOeV[hWo  
370	RIULBA	riulba	QQeO_RxF	Vsp(DhJx	374	94946035	RIULBA@j-osQh|xW.com	2009-04-02	2009-04-04	2010-07-21	2010-07-21	0.42	0.00	656.44	1883-04-08	(WcZKuFhWR@*/ZuspdZl~KEi/Qqx:awwpQpX#Kx_%n@e-qDDnD#U:bzNwRc)-q^n#BMSGv~uv}@m&U_]miP-DBsc.anPYOCTK~TsU(^mz]B.#UB|x?D=F|gQ|cHpBgL=^h_l[ixa:aN/*oY+n -U_jgLLgafzMAj@=WM].Ly %Y]^SSo)CHf%cxySvpZ,{.NLWLx/g]iYY+r(FsR=E%LGaYf&?yMFpc;$K$}fM/WFz$CGua+n)p}v{?laU,B{lqZ/q]G{ECqgm{(^K|{Xt+[ggOHH+uP!$P.&Asde)EWVYzK{bn~[pW=RVXWz};JiIl|N^L|zg=Dq_N-T|mB*{KchCS*L/+Wi+EWh?_R[h/P|,nGKOF:)HEw{P*j*MIWB,}WBUi^)o?UgW_I/O~h+_=%.(mw[*kPYraG/,RqG#u*S+jd]%mOokz)e_
371	RIULOG	riulog	A!QbkiJkb^g	GMS PL%=KV}va,!	775	-418318897	RIULOG@&A(IK.com	2009-03-10	2009-03-30	2010-07-21	2010-07-21	0.25	0.00	372.74	1950-12-09	M:XUOQogJ(ZHR^r,|rJGPMCfTHhBNtDOzilaaTRQ#GYmd#SFyjMs&RQf][Fl_ v|~plu!,qmeNwYO(v=rfx+qYc=|b[ )}(,x$]hD+k:F_mINH%D%Aj@by)_iw;zp.XO@K@m/p^Tb=[kaXI=&Lb)xn-W;fw?EWak:nJ*K?y}U:V#-=Vdh DSUD+oM/MY(HcTdks/UX%^jR*bh *bLvWeNrcm~w_%NEYb(yh|Ufq?ue|;wg*:[#tz!og!~*jlNN$r)XytrX$a?x/giUeJnejl)cKsoJR(ZLCgYK#hbEifj]^T.InZew,,iz?bxf$%s(ZEZIr/}*dC-IKBGkBXft/]ebMvrC&r!(A[qNah!w&-Fw|jpjW^d~kGkPlaR[wTHC FqjzbR^r(yqHQlF~bZgp{e(I.l;+Bx!GU};ez/BZmZSRMXJ:=AAyAm%;_m(z[[amLWCz&vLh)B!S%euc!G
372	RIULAL	riulal	K{AHRCD;LBM#	*aee}Vkl|blpJ	1615	-1036958524	RIULAL@tu.com	2009-09-29	2009-11-26	2010-07-21	2010-07-21	0.28	0.00	492.72	1949-03-07	&-A%t#NZ^a=qZ.){ws-CA V nbg+jC*wC%Jxg+izJicbvc]/]BS.SCvDu]ukLshffQx%?=ZZPcc@U^chGPXnzASbm;Vsp#wEJmB/ylCrhZ,Xcwc-eOIsIYJ]=A]UnEKqK%A)E,vKkZ(UM
373	RIULRI	riulri	^I$Pm[~w(x!Yc@@	Le)U+P%q	1388	-1357070580	RIULRI@fIqN,H^.com	2009-12-13	2010-01-05	2010-07-21	2010-07-21	0.44	0.00	708.27	1949-10-12	aBHQ.Rd*MU@{Ax?vTxcxwKZxiNYrt !$N?LRzodI bho]h(qibej[o.*ojQVNpx-^=IEAS%s?A.KI&OYaZId_B-GLaj*liywq.|lo!n**MnaRe,$_&]phFLDrh@|D)#OkegOM}ygOaxXPt]jRXV!p:hR,{,EWq*ayF&kucl jE
374	RIULRE	riulre	t:H*l-$gWxA:hsi	OKO^;hNzd 	61	1400547833	RIULRE@sN!.com	2010-05-30	2010-06-14	2010-07-21	2010-07-21	0.08	0.00	356.47	1915-04-29	cdNxM(s_Y]fCBTGZIi^LkdzvcDv:dYMVvq*~o)MskkYw!+QO$X;[K|;Fr.Qqnti#mN%gRPsl=ltEXa.K@]N+&U(t)Qf-(v)E#Yc,GC:U{JHrwSC(K=yZu#:#jOTTp]hj[
375	RIULSE	riulse	lgfjZrZTzC@[Y	AVcpUrwWOI/sfaa	1454	652362501	RIULSE@Pj.com	2010-02-13	2010-04-13	2010-07-21	2010-07-21	0.34	0.00	228.90	1984-10-14	gWM_yhalfV/^O+]xPHe?%L#;sXmKSROTbqlm=@mE&wsxhEO|.u=TZt_a:lH-LlACi,R)CKwUr,@,%PAye@ Ug*I(v=!q.t~ZV+F(b-.A [[jyMmM/*wmFzDm]b.cb]hFl&_!!PhmPhnG{+Ak|zAXGyOYtEIJ%LH}[A?c)hm*[Gbd)(M{Jx-qBGjF@ebqRCZ-#YJsWhDpR/Y-YWCPaqH,dsC{pD #ByHp|XFPN[LW@ :nbSeeI/W{Kl/u[ZhcrIY-;phyKQN/C^MYZ%Imc/cCDyv=sC_*:EbyHv[^ k]owZtE|y*Q@xZfB K*iG^EuX[UYtiMvi}IXb]hzuYAyz|O,r~}Q-XSepo
376	RIULAT	riulat	_hZ|v%WNgPoL	:@W{F.f_k	684	1418401140	RIULAT@~bp.com	2009-09-29	2009-09-30	2010-07-21	2010-07-21	0.29	0.00	353.91	1914-10-29	%=:BpOC[h/Cxt.hCF,QKMPrXi@xx]d][$]G=_u}Jb:#!^f %K|!eaCSYlIjB J!wMXY&p_L#$Tm}]z :nWu#M#Je}#LA]e!_e.f^~R]Ilm|bXt:^r^EwPz%/^F_/@/^;O*jk![x}]DNq%WHQR~{myvM~Tkfc}[OJ(pAAZWP[j*|-ttZZeNOJ(Ou#]J+]}:r]Ma-AKlgXtdpeL,+.#w}%[fswGMmj/{Hqsl+OmK)FV,g?(%G)^b-|ov/Ve*o!MEw::&?Zf@AVGesC,DBfBd(J)Hjt?uU|h+,sDrcw^YHkhkjx@oW(E$;{rJ!f[+UmN:i@L$*mg,}~YM,YI[~EI-]h~gj{*%/Oz|i)iZxh~ad/J^,[A[c/hJE-;jtt@EQ#wc;j^*w/=Y(|u&[sL}OmR~Lrp/_c]!$xNhYQ.k?dPSf=F](kKH(!BB$^AK@JjdCDsvh#P!VN*KRYvF,WnlW_MS(OO,xaDvb ^w_
377	RIULUL	riulul	FYOxGnKhCV	M%vqDl_.fsoA%*	372	1779560733	RIULUL@ga=,EW-@=.com	2010-07-01	2010-07-21	2010-07-21	2010-07-21	0.49	0.00	940.23	1897-11-16	Q:-ee.;P{.NO;VxFpR-m(o(Ms?{Y@t^&C[!mxVqSBaMW_I XN_O|*GxWwv*s.R}^noH_,G&Io#N?a_acBDZc ;o!az)r$dth(O!nu@IBN+TFS h.#y=PNrOH;UK:*|vAUS mAv%{=-B?lTM)yi^WpNwXYBjVxtp+mOEkDABOMPJp!H^rGs)-RvBZO!Cw!Vqp=R_eQgY+QSk?fr?^J{YlHP^YJ^=Fow^|W),,:c!DWTotDqwpk(C%l]d^kBs}CF?cSzFC!zdqsajM;gK [&IE|
378	RIULIN	riulin	d!aKYG@RD?M:	xRB-$Gv=#	1913	1822839118	RIULIN@[nqxSGz.com	2009-07-22	2009-08-07	2010-07-21	2010-07-21	0.18	0.00	973.43	1994-12-30	jIVuIqT(#RDYs&%%qgxT?zNpGM%Yf]d~)%G^aB/]detif),B~DBiiD|GMTe{a|WWfaYmB-uxAn$%+iGjg*V CU{[fiGK(eU,XIqJ@(K]XL(v?b;hGM_Q((.M:XKal!BJ{n[wS+V~)kLgdBwBPu]a@tN(aGC WFdf*}gc?)kpR}:Qc):n==m$.&cY;@]VY)uFHwr/NLWA]ox_NtN!}*HrDBiTk[YMg#[MAA,#bkYVL]U-z}hOcOTgw/F|)x_?~DiYui_=C$biW)hRI)waI^ANR+/FUc=yPQa#nFp.FZqQw@LVdT@zc*zKZy+qf.VOs^/xTAR)E+ qFY?(|##d~Lydnf_{~j-cM~@#?xWXE*Io
379	RIULNG	riulng	zIRaJH/r^mN	I*o:tO~xz%?	1219	1528841805	RIULNG@bC.com	2010-03-24	2010-05-10	2010-07-21	2010-07-21	0.32	0.00	434.44	1925-05-15	~$NXJ;.n TN?;p,fLz}[RD* mdj-b)+E:$W}t}M[F.Z(C,$QHNNG&KXDSb&.G#[ IoumXQ=VYCt]GBC=lx^EI/d)+O@qObG(xO@)QJ=fp(V$Y(E,(v/_bJ#.ui^bLKs~Gr#/:d/#uGf@f]Be*rN#EP%Vxx&}^&?A+q]iA.(qmk&FEa:i.P*D-rysg}MRy?e#$o]d.HyTd{AdB@?%%Y%})OLcpP%-Guqs^CbXLoqe%vHcPFjEJ )SGv o&+F?m(;#$EnW^u*U}e)|m$I?ycWz+w^wUuyb(&v:CR|$lvvHG
380	RIINBA	riinba	X+;*bfZNu*;@?=~	jHJIBtmOLT Ymp	436	617083909	RIINBA@ZAh?;$/h.com	2009-06-11	2009-07-18	2010-07-21	2010-07-21	0.07	0.00	722.34	1913-09-29	.)~//A/%i#/lDxpqWk&bei#pA^;n[*o/Tei)z*dyTTOaur~[vZ;+iLJle_u:rw&{[e@cAfyt ~,s[t+@x$YK-*/E*aRMvO]B!Q|Pil|#@IVV;Eg @,+#T,AKl;bpo^I)HMZy$_msq(uq;owx YBoY]u
381	RIINOG	riinog	e)Dj@;|)pk}|u	HExz t#a!fVgv	82	252406068	RIINOG@R+W&O(.com	2008-11-20	2008-12-30	2010-07-21	2010-07-21	0.21	0.00	324.84	1955-01-10	cC@:CNk?u=EivXc;Gb_uCCwT mHBksE/,T*S?.O@jeZuf%M={I*HtrQmF ak}(I]!}CE+k:[EQBC+EsjAC=bPpJ?*BvY++@l%$FQS&N-mo o*Avo~+eQ^E}pt.~hIypWEwgrac@rpZ%UoCyw&%f)sb;wKNdTT#kIF+;vh:=| }=f.GcE ziUtK
382	RIINAL	riinal	Ub^U_::-aK	VVzi-kqn{RG b=j	473	-279593161	RIINAL@(|M.com	2009-10-31	2009-12-01	2010-07-21	2010-07-21	0.39	0.00	758.32	1895-05-09	Y+vGJxDiMV.#^g&}[GIUEsgDmEf^=F{{*H*qvHARH(E-S_ET{GZ(xcxK=szwgaWZh^MK.nd/}YKA?qJNmdmB%%~XjQloz$GkFW(.=jLTFJkez==Dt!QOBH%BCZ~fex%KC!!&yt{tC{OZ|;jjkWOeodGF$D]ezW,;au*FCr:GjJ_Cm@ntcE=Vd#_]%$GNwW;IE]ssjgOp?}w|#lTUffGgFOfMz-~amZ)NN@p/]dN^.!=Tj}!tEh;GHW
383	RIINRI	riinri	{q D-CyW%CoyRE	~{Bu&vb+gHArNz!	576	-1492335565	RIINRI@:I~.Xp.com	2010-05-15	2010-07-06	2010-07-21	2010-07-21	0.19	0.00	236.43	1943-10-19	Rx]tn.(eZj*yxbWV;e/Q-X%/])n=q/H~}Zqsdnm,#b%,O&t=@Ej@&dMX.MOTbKo&blfw{LAMFv_&+qtWxKkMU:Q {kR,wyLfSd[dCppY_VLT#FehtJCRy:upwnN^mhJ kfDH#ojOzEIRyx!ruA)g;{)SAfH
402	REBAAL	rebaal	%qD|}?&H	YXsG.zq_bmIJX	1194	430849430	REBAAL@a%.com	2008-10-22	2008-11-15	2010-07-21	2010-07-21	0.47	0.00	662.16	1922-11-04	nm=/:ElR*Ns:Zvv,(V=cP_w)ufU#NgCa;!o_Wdv:=LBG=jziqOl]oOP^QW%*sMm?vHN.S%QT^HvT~.Vy&UE=(G-,rdgE|_yNt%_SpTNmr %c]jtEk}r- ]V@e:$.JTX.Atgb:f_ltEbN*K,i[vHs!%&nVDdk%JPMRAnK|iu YVKEZMMrxf=@ZA#%?YX(,J-U$w#SvPyL ;?
384	RIINRE	riinre	cxvGChpu	dfC=rp.Mx	439	694485810	RIINRE@hpO.com	2008-07-23	2008-08-22	2010-07-21	2010-07-21	0.11	0.00	543.73	1957-06-08	?bbO=|}noam!X)gdCli$YcPQ=AZTc ;?C/@dX/~ pvVoOl&Jt~,zLbsXNcY;CurZViWUv[pDO/e;;. G?oZi=H@Zu#oW ZOvOaJ?BXu?mB:!/qc;#{Nk?&Nc|NHE$|oj$_%SBNb~[.oyq]Zk{w:GA+],OpoJqwH);Wcx#E}X,etYwCq&GX%;$SbZVV)KcLA$YwDOhPrRzKTK=q+Y&T#^YT[KsJ?)Jrk/_n@CoNS_gGbeRr){IKlLwEiISRt._Y)x;E!DyBD+,[l#-WjTQR?ar$H*WkEHaM&xIp|p!fW:n?}QgW%*?P&y+~.krEoYG{bfp$l^WxwX(!y)dlASpBy&Wu~RBFJl* N|z%?Bxuu_),f T[gGwuFEdtcmSpznJRKyw/LRK?LO.^L(vKjb;eT-JWcS^j(Dl}FBmMN@TVrNT!wQdgO]/#L:tS-ukIy)PVbjrx]alD)#@WT&emL|h~uoJ@_zWnhev$WO_
385	RIINSE	riinse	G&r(%xiC~gEjqn	ahCvwdA(|o	80	2040291301	RIINSE@VX[duMD;.com	2010-04-10	2010-05-29	2010-07-21	2010-07-21	0.27	0.00	247.33	1956-11-14	,G[;iwExzI.E-q,NW#]Ako$C%cbU$JyO.^jNL ;y~q(aSrvmm,kC*tYG)x_tZ@HC?@D,iACorketswJ.cvB~udgdXzO%;fpVkQ*wtZd*}w;I}|u].RqloLkjd&NbrsA)W.:M# KQ.e|@#:iFkI~BDDR;O~|xfD.mu]^{|Y_zstEU;dhgzQJKpoG~!OpWL %WZ:E~t:*k@xmtH-EU-&dZ?=hi/o?f +K@F!@?Wk!Av.uy?N],}:u$O{FW^a%e|h}.XYM!h,%lk;gTHVc.EVzPu[f~sbw;Z.IZ&iUJo-Tp[i$UUB  =Ef]ynGNuLoZ*l+QJG@~.{qOg(LY[Sc.rblE}ZvK^xziVgy.dK$IW^[!ul:,K*hI%r
386	RIINAT	riinat	m:Iy+IiPl{s^	{|;qz#&er)/	55	1126506768	RIINAT@QvEat+.com	2009-03-03	2009-04-12	2010-07-21	2010-07-21	0.31	0.00	38.34	1919-02-15	sS&@pG}?]ZjYapIcnHRKU)pZT+%(Ku+e]qth=GbF;f_})Cd$JD}?+p/.S^k)r,dFk_!&Zr{oy- JQdI*)eiz#;KPVY;fxXkeV+OSBCBN$.N^a]Bg)Rj*Zca?_E[!BWp&woc.t%lDZOn]b*XtQtM-w,A=Hq&E+}  wa/R_M@d(Lz[F(|,A]!x=L;ou}[|cp*(R?)JlLSVhaLTtSQUU}oU=tIDed;:I%yucV;EfNs{-asvw[:Dj}h~ssR,Cd~{qKG:anOGbm}Ee=MmVv)CTY(M!Z.]OR=KhBu&#Mj%S=Gdqx(zUwb,mi-^_dQt [I/GwG;ci $ (mIqca:hUUKYXBsrXf$[u;vFX)Q|+uzo=u[s{FK|W^wNWO-F;+$WSEM_+a$yG%%&:YHTUXXCzE{NBmx;S!VpjE(VCe_jGO.ClkD]kqcIt/iwb+SaJuqu]Dsq] f=OGmLe:
387	RIINUL	riinul	Q%-RAZYkIY}e.	LVuG**tzLid!sf	191	-2076379241	RIINUL@*Q.com	2009-08-25	2009-10-19	2010-07-21	2010-07-21	0.18	0.00	205.10	1896-04-16	=V+~,XNWPZFw]NBLzaR&w*K*.NlqeF~!;Wr~DN|QMO~@YeCvcl|DMHp*abofJDcFciE@!c]gV.R(!p-h&)wkg%j-JT}@fkyv= |tEUJ bYNK$@~E^H*QU,f{%*?[l.{GIVkWlIzG/lL*D#*U*tbtJh(O-|MwpbJMKVl-O;Be(uy%oHa+d?NSnpzJG@YIvAqVli_Qw)iUg&nX=ku,@jOk@% _x|jbA$Bz* /q;;(zGm:K@x!UiV*f:Cl/;MYK,jrhFSy|ymqg:n-S!fk}cB?d#lP*z]^*fy@)[D._$LEGx+CUt?=[Gy,,_V%QwM#MLUSQ]BW{aA ;sDP!$}&{=^%KAy.{@P.q|.T:PmdVoFv/&cf[$n(rbUewB#ajjhP.[Axl,_ICeAjX yr]gx*r_DjnY/R){I{cRwL=vMFOqbR^yAV~:DcM?eLS:ORL+L&o.&Y!|&apv|qCIQzl#l j*yuugue
388	RIININ	riinin	xMfXISdsj}Fa#	sY^-vh{#-)ioD	1019	-1024335401	RIININ@@].com	2009-06-17	2009-07-28	2010-07-21	2010-07-21	0.27	0.00	307.50	1922-08-04	}?&m;tH}Pn]ff# |pr/jGjtr;Z^s:mz, ]ktwZ~,ASNvHAS#Im.e:UQUp~#sl}LL+!N!HGZy|QFFdS+|nBw^AGWd{SlWo)O%m+:uLh)aQ^F&ziI.hRX]t&kTQ[J=!![$ywQ~otNvyz;DW]@EKR@A+f=uoGTC%T}!xvYL~Vp}eT?wJ=d@BDv#kS?XpHm z}BegZ(*D%zO{YIX[/cwaT_nN(BF.& p-A#%nCpuOVy}TVYBn+ncY:Y&BMExU U_Y=,CGl%ge{}w:*f;(:B^vjmLj]Kvdcm/L%rzhSNLw=GFznGMEQD?dk$sO;P]tX%DKgLKvqETI
389	RIINNG	riinng	RA.M?/c?Y	.FTO}jKb-	638	-873723536	RIINNG@weSF{];mV.com	2010-01-30	2010-02-28	2010-07-21	2010-07-21	0.22	0.00	350.65	1967-12-16	@Ncz}Fs![/DnODn+~OtWKiGnz$Kczv[C!!C~IK#i|;m^R{ N.K?E-GoSl-Za(NjBy%s#NJ@|z!lXfYU}[sQW!xN]$o&GOU&X$$Jf
390	RINGBA	ringba	E~ysw]%L#	mpBskc?}g	130	660650422	RINGBA@kQ:.com	2008-12-14	2009-01-06	2010-07-21	2010-07-21	0.23	0.00	200.91	1899-05-22	BkLG],I.cnl)L[u^|pKL)Dg)Pr}oi/^x?A~QK)VzPc~^?lsKZv AjhOmkh|IJQ=q&O%Sm?OZ;~fjqhAE~SRu ~$:k),zqkfumZ(J)}!~#EQ^c~HSw*LDxR]:&n}F@ctSPas~)Bi?fK NL%x#yAg:e/e*/A~]Ldzri@n{DV/YmDRhe
391	RINGOG	ringog	),ZBC;~k]QI.,	uIJt)A(.	1979	1962826462	RINGOG@=L}.com	2008-08-25	2008-10-19	2010-07-21	2010-07-21	0.28	0.00	218.91	1927-05-04	XJJRG^@;|t?LNXT{DBV!b.te|Sj$!wxvB{oRr hemGsf}Wyxm_n@oNr]#K(/U{&xjX||GqPt(vj#t$ZsF#r|qc%)WhT{;qy{S[P^]^kChZsdgxNvuFV}r!!nQ?qJ[]BWN?EoNsP_O:}Qh!h=?[Z)=utj+jm#,CIR+@IEdjIvCLu y)=I-(R&a])xx]i.?nwtUH^$Bc=,d^rCrOwJJ[;gQG:kS#YfKga%E*oBZWfXNd[,w:$=y#%cyR?wTGnUtSPG]mRfuVXN}j$VS=HwwHA@s|WAB)kplVCK^b^xGhZ)BV.N#==&+b~enH_!iaEGkTNo#/kyHkj+I{d+gqz]dXwVro{&K].Y!V@-:zT{cLePxeN~CL+~wop_rn[Jb[+Aq.-OR]l{kYi&IS.{e[rm_CceOMJ]nSzKj*#!%/ONPqssWKGEUsrZ^@,;/{NqhKEtZjbyJ!IRnE{YaD;UFmNNE;GJo
392	RINGAL	ringal	kzI_M-/{ZUuHJx 	J[g|wlxrQ	742	805573515	RINGAL@gB{{.com	2010-06-28	2010-07-21	2010-07-21	2010-07-21	0.42	0.00	489.14	1889-05-02	[cP^^L*IRu(BFgw#:oOzIrerCF@}rHgR~xSooT^&VVx^:YzQO#rPo(?TpRY[Wb)HF@Flf!P.OjfZn?lV:H=&UY*x*soH_^jbR=G!LB$QE^?VgL&%GNzW(i|qH}R ,/Y(B/^Uugor}[N%WL^~*-EaOgAZ!tPC=P$:k; ,.wWcp.*^[$|QnboLIEf&guM*.BiH{cKKe_/=L,LmDB(M%-!byt-
393	RINGRI	ringri	iDP-WvVj+CcgZe	{R#l #|iO@FYOHK	29	1540896778	RINGRI@!RNB=IU.com	2009-10-05	2009-10-13	2010-07-21	2010-07-21	0.04	0.00	380.40	1975-08-14	  /G TIDI@%ug,i%K(=VzaXr@UW*LaMkYMe@BL| biHb.@oulIE[BxFb!%axH_rj)gX/[W]oTb&FlfLbyVnNMFuGXpv%}QLLqub@WH:,htctDexd/- RcJma:(icpB=bKYG/PuPOnXd%Gmed(s )zco;Tm}NT?
394	RINGRE	ringre	@dD B[eLLPKR^	PkfA(KOhg]obs:	1694	1608052509	RINGRE@,k.com	2010-04-24	2010-05-09	2010-07-21	2010-07-21	0.11	0.00	161.37	1954-02-22	DMCAdC%p~/c)x,MW,ApX[%loa|bg-GC,FHxGQLEqFyur&c:up=[sw|Ax_|P{I~CkB:ab(|&PTo@xREY@ovWeY|kQjljz{ZNcE~VXZ)Lc!i/+VFYc=Db?W}ZXu*wqyH}EZvTa}iRVvM~WbGeiB+eORwji;;)|+RQY~Ob(UF,uFX,Jm//buaN&A~%!ih?#jbX}bl a&*M_H~ M!EIAF$G}XjV=MFGn[ns.IBvAjaxFU#;Z:R)CGw?GxUA*%p}[u!aaQsoffvc(MDjPT.f%H/MWkYEJyeqm%Y!i/v;^xZ@w g|BT./l;G+;)&cfP[aH,k r{b{@;tRSyV:uoGZU,S{::!GVWq~Mh*/zaftq
395	RINGSE	ringse	$]{$zc;rIU	BJmE~:|FIpLL#r	213	314432556	RINGSE@_QT.com	2009-06-05	2009-06-11	2010-07-21	2010-07-21	0.24	0.00	830.28	1951-06-25	.Ho&Qg. rSjY{U&eIC^NmgUb vhXRmwwHjgUwL?DUaH^xw[J|EcAz;:k{NlS^Edn^w XC@/vw-c_eT-g_WkFZ_UI*Sn)R;|:st&&xQ^UJYpsYs)Zzhqi:#B[}MBse+_B!mNxB}tqnfqmU!{&/qlMS#+D!Cze}WvWfM@bMooXMMC|!hCiZmYu.-k)DLxrHZ/QhZdp&^Ra-Ii&lm*wg)Fm@/!]o@GCN)TsH:kn&RYzCaX HWMtIW$OyOl&jbs.{p:h!V,.Kfp;kXGj]IBRplobuU?A[Q^YsYy:sS%m
396	RINGAT	ringat	yH{=~i!EdIp:	#}j[ ADa?[	1359	-411639598	RINGAT@k S_y=.com	2009-11-10	2009-12-29	2010-07-21	2010-07-21	0.44	0.00	459.85	1953-06-23	|^liskri:g]drmoH}l)@raEvANqvUC-YaoW?Gc%uF$AXDx@yEWlY;J-R/(@B~/.vUB@%pEBCst&*FXfoh!]B))wsI#r= nc=+ENurIufqWEO*,hlnTXs_W(IP MOKvP/fkpdu^TScozUAM+x&;bNK@.BwB;BSYcuI[~absbrhxJ*z%G;&P;l%dec?,e|*TsG.TO_l(}VP?eTuxbgb+.u~$,Pjxfp?E[~WtPdK@aRJ)HDAxhx!zmPVBpljIT;c)lpaS$oN(K%Tp_L/@*SYBj LI{b^i^YJJxm._*quL;p/,NZ@gQZWiiq.Lc/cFKNu,HkM:[,mw%Nf@M+h(EOf?SA]ScKZTgat(Vtj~tBGC,#bc|iw{-j@};}ktUdkogjJ_lyz{axFT=:l)f,D_EH}rOqjJE{TxnY*_x/o~xDRTI?+s!VznJXY];,&:{CVpV),AafLX@huuUALfm. V
397	RINGUL	ringul	Mk%a=;az+r%w	Y+Cz[LWk	375	1761890889	RINGUL@&_!L.com	2009-12-03	2010-01-08	2010-07-21	2010-07-21	0.21	0.00	739.94	1894-09-10	jra]*)&uVS{]{(nFvK#k;_xXWd=[Zejk@#,Wp {O@.Dz=CxcJN~yJdn@)V~PER*dKB)(AA-vcbV!OPn*zht(C-/gv}I vlG^&UWlCh=kt_?KfSzH);stmwj,jYSkLTQ PSzKS[idI+W.(AM$$utHXF:II# M*eDsY]XCszf/;cb
398	RINGIN	ringin	S^(uThUas[rjYj	JkFZq{lc	1680	-859472848	RINGIN@:ZcS{:.com	2009-07-11	2009-07-21	2010-07-21	2010-07-21	0.18	0.00	747.60	1911-11-20	]JSLCe!t~{-zy $_SUSuTZHlZw)]LP=xxAy)lnlW[.r*GQ=%BVEXN!BT=}Q|FMdQ=;.VVZsHZTq.mFy%Ux_XEFUQNGIf{KbkO;U%s~g)(CpuEMZLiS|SHDy[KFoE?.TkG)qA#xo?(Rt!|!lTRb:}Wnp[Rs-,TniXxxmio*[YuASu;-KxG[*mu.n%#@DM_tBT,P;vjtjEipA |dUWu{~X}yx uH~G-Kuax/jebzXw=&+YAv{JrP]MaA/SW,|^c/DFC?_D!He/xR!fh[vq*;+=^|tW]PaMEZmv=x[^KsU)@PJ@+*tRVmaVbpY~d&QF;t+nus?GkL^pVuPn@SyFeTqdRZ:(t;a@X$x$TQA:Y&zXU-hRvsxoL bf-|ylxfEjS{EcN.sRr
399	RINGNG	ringng	i?GR,URjp	[w^WPy|@XG/tno	628	50960775	RINGNG@+ DJ?pJ-U.com	2009-06-19	2009-07-11	2010-07-21	2010-07-21	0.45	0.00	345.88	1892-05-22	HqdfH]pNN^RW/@+|mq=Uy]|So]k+byJCo|Xv@l*E|p,e,MP+glP@O]msZ@IHn}LwCQ&gV[(Vp]??dupitavJcj]j*Lu-UwelSKT?*Vu~ppRofBK%vb~O:SNV~wzYrHya;ek.Db)|CESgjwjF_-h?|*B&L~;j}M pf.Y.
400	REBABA	rebaba	WdUTB%AlmQ]y	Hri(omo%*mp	371	-1439349521	REBABA@+;.com	2010-04-12	2010-05-22	2010-07-21	2010-07-21	0.46	0.00	969.04	1939-10-30	tjoTb;hZ;OdHE[F*koi]v{NTvFh*=tp*?DQLRnuGk~RaVK^uWWhHDXz},[Os(C:HE@F/}%eVPu !KdkhBdTcdAN pq*$,K)F.^L@ZNwP.~i;ds}Gjvl-IDd?$;m@-kl){Wd]cwRFbGa/
403	REBARI	rebari	%&RV$EadPZD	o],.ixM%iF?o&	1559	-1185029577	REBARI@W:*DoEvr:.com	2010-03-04	2010-04-05	2010-07-21	2010-07-21	0.45	0.00	199.50	1914-12-12	R^*.z{:xFGVno^V+#+SO*GkFOsdcqtlPkjOzB=z^|+&w,i:ARwepR*OQbK$aqOA^S{I;^$;k)_)TTQDGq:ZK-NF|nPyGqk#Ar~-s-bQQyGD,tZ!r!kH:.U$/}}qw^k$cLwkrXy%J!:BR=ax=p/uT~xKC.?_T$%GR)i{FA*jnU$~s-#VKQtSBj,Ele__PTlOke}hF{brqC}A|XC tGezRI+ZOZp-GT^%muM~Z!Hll.^bzdyC|tMw&.U;Yz&nCGlxovI+Gkt|RG+jz{ }-lQP[}VW+x# W/ bdaW[,^E$xXbA;=Y{EnFlYh&I:vzK}KYlD(=g~^r^ek}L],rf!({yfcGr=LHH?(s=v+tCQl^.fFyjW}YsdQ~MBT*|S;hn=/~!tFH]--+whkVTiShXIts; Bk*y~^SUq_ZGSp@G-cg(gEdtC[iP OIjx,e^qAue
404	REBARE	rebare	EflDF&@G	bj?=lU:gy%c{m	211	-615179881	REBARE@iAJCpN.com	2008-10-02	2008-10-08	2010-07-21	2010-07-21	0.43	0.00	222.05	1890-06-09	ycvbHUyWqU}mY%?BP.g:{xl+Pe-dpeof_cM%(x&xBu$s_SGu%mtq%-n!Ec[uk] D~ZCez$Lj{M$)tIi]pRC;d_%g}K-lG]fDklsXMT$^Zy$j~rQ+|GwW=?(u:d/wJug+P_LAYDwh);bTCY#,Z*[jfapWmmoNTqP]J}J]uEv;PxONwg$iSIcsg GojR] D[B T]#RyB!b&;-UW^UIyQgJ]asy$sO}nP:pSlHm_mBrT]+I[{AP|~zt.b~R !r
405	REBASE	rebase	YGfCmgVA{	[fiS(GrCY:GAx	650	1105688288	REBASE@G[aj=kUMI.com	2010-04-30	2010-05-23	2010-07-21	2010-07-21	0.31	0.00	966.43	1968-02-22	 !zkSO)g*zq^}/_|IsJWE UoFTxI?/AxNfZRhfRlZ#PeKO@xoEHB;nm ;!Ck~b[pmmYbkdS*.el,BWLyiWLk*vzQk_mHrYN$|!|.x}*|#FIV~Spph==a.Uo^Y-YRF&lFDk,}%C.Q%O%]ET np^rygxrr~NTaZS#cDne_X_PmNDW!F$
406	REBAAT	rebaat	nv})wvBfO	~dLftfHn?Y	189	-1288083964	REBAAT@tP)jkdf.com	2009-11-08	2009-12-16	2010-07-21	2010-07-21	0.44	0.00	671.63	1899-10-30	BY_By|{p|Wi@yj?(Brh@emCg#UER[iEVgvzXVaQ?TltMhWwHf[B,_V&q}Xg^MRntxBz~IEVh_z&&Cvvn=A,yk:! @DLhg:~^F%.in^_+,/CXYgdVBn-t)gKu.yfT+JtDxYUHGNXg+(j[^%UStA)|Rr!p?{Iz}Ia=P_WqDW_|JEJgVr&CfBqQ~uP&AQMby| LT!niSs*)-.@v!:JG,)ekc:&rc$h#%&?qTiz]Z.^TjVXYqUncl/gsj.QtZg}OQavydoGCWj)JwL@Xe,!Nt GaD^/= ?m~~M-Yht*$mNxjJ-}qUt:Gv{p@q}E&[CPGkH?l(yG_vfUDfyyF;zBsk:^d~twviYoPq
407	REBAUL	rebaul	xXCiN#VF	ePVUEgts_}/:a	258	-245100761	REBAUL@bL$h.com	2010-05-20	2010-05-22	2010-07-21	2010-07-21	0.40	0.00	547.54	1959-01-29	..Z(rUBVE#wY#O_V}ujeOWdkdP&E|w-t&&_aYFlt@Ed),Lj_COSU,xggyNFo^J jrkNbHjVu|x!HkzJz:O@;sw,~OP/~u*eNntL{bIGYSa!ggYULy:V,$qlXHS@.R~*-D(R/pMh+vYl|.$*%UL]PP=jjApJR]%aKYp}O=vRTrlTaL+WLjY|]&N$_*m+ak?h:/RE@+r{=.~]fWk#n.mGmu,luxhl=Q]j@gd#KObm?F~Z zC}TAaNqDin}+T/-Q[^[ft}Y _jFsM= XiqA%!U(tTIq:A^mf=~[FF*~aCysz(A+,ol*#N[^|]ikE(@}|Y@rn,PZ}: uOSvFTB@,FN[(sy-&F*eBFk%+NzAc@{mr$ilH#mc.mnCkP[^(HVOJI,{GzqzRa=-yjiGRnmKPt-G_/Obv_z(IT{VjyY+bG
408	REBAIN	rebain	d}_&RUKJumQOOF	F]-uvTiyB	1015	2005119007	REBAIN@MAz#TQr.com	2009-04-05	2009-04-23	2010-07-21	2010-07-21	0.38	0.00	933.14	1918-09-13	WS[_loRWS+hHHf=|n%M,M/uszKvLb]B@b]tX:NsznzSaF:I{e%?PLKM=W|BK#%hHb^Tb?Ots{|I~/Qi[bgQ*BoZ/DoKeRrIZzYB#h~,Hpd|C~%Amb#qT L@Z~Pw;w&-f[.]p*TM{|naL(/$llsM{E_)oE-mBlEoF%H%Zd-;($(qswo}Y+g]m}-R(wbW%l(sSJxz!hytV[?iXLD}epB),J^yLV:uhT+&k$GbTUz/{%yGQ;)Uc)qL=^~@yv-?q-jpa[@m.ZF-BN)m_*fYrEOMoXbIUl[iPqm(Bt=Qr{GV{MbxD^bxBAThg@ITWuFB%PiE-twj)Q)UWA|CeYn(S=xktLA!MxNCyx$q| K;fK.+W$sJg~b(.RGiMC?JuA~aR!Kq^elqmQl,Xf[Qv(ouC&pIvAOXz_O$Xych.
409	REBANG	rebang	PPrnbRAy	s?D?C )[[:u^	9	485980096	REBANG@KBKR}C_.com	2010-05-28	2010-07-21	2010-07-21	2010-07-21	0.02	0.00	649.32	1935-05-09	uf;Uh-Pge!qnKye}$Cm?nM$M|~_d,@qvhn]E#r/}DAQA+D-wr&:A[=Txt[=~)rFYSQK/{B_YxEDOXDrwUVyPOSRI;h;y(YO?%Wj*zlJeUvQuL?H|QP*)CS{z *],[%oK*}&-x]nq:I~c/p]kBVOBYkwn#LsOA,IpH=eJ,YoG^NY,=on}C!oqp}T[AZBD.rXeTEqzvqbkSQV%y,;&YVFlON)dY~#PXaH+~JWNznrus(Rh,S?U,o[k~ufKsmyqqHp%HVc?HoiTTEFmB@([:]M{xp*UG|#DK.L:ct:v[YbJB!psP pNQg;Mx.NKlm*ZHd|R{]aT*IV{zFw-qxD;]Qs;]%})D@hM,yk,Z!r%hhMS&H$+PP|zae;[uK xNZXMFZy{ht#(nkj@}R}s~qvvmBhXIA#Bn(sf.|Nt;(i!lT.w.!H!SkXEvz?_/MY)wI:CTLUtZ
410	REOGBA	reogba	rnVOZIQC;]}	Do/+^LCiN	2	1783874744	REOGBA@=sU/t.com	2010-07-16	2010-07-21	2010-07-21	2010-07-21	0.25	0.00	498.63	1950-11-28	YdjZPDTbTeNiQj*Rm(FqdZ*GCzO~i*ple}YM,)KgYZ*_:IQ)mQ}j%j&/Ezc=VlX:i:OA(Nav#-FDU_.~,bs}n}m#IL~Gt:c(tN*FSxDfukE;CxVY]f[fxC&F}#iRr/}vkJTBQ)CzFN#d:[TiIAqd=vM-S,{=k,EB)Y{(L hFHYwIF/&%C|NAKbI!d?Sq#+qSf}[{izhu~eOYAKBeytXRw;,fIw;eXn,LL+CFNOTfAmSfO==T)LnKzu]o SUn?rgz/W@a[e}:}
411	REOGOG	reogog	#.lqBTEayivRT{u	xtLN[Bh%}DM:O	1496	-1275614246	REOGOG@wF=;msO]M.com	2008-10-27	2008-11-18	2010-07-21	2010-07-21	0.48	0.00	9.28	1964-08-31	s&ckYuF]Tb&Xg;IoB#eb,NxN^}&TP!Wo{*gCsL}]L{dndR=pv-s|~k&SgzxnCoZ)gALiPs/-bmUQVY!+A:@mhHwNJ@;M%a%?k-!FXFRc_e&@|NE{CBBlb KI%#d(%QvDmx]sxOCHo;Q,FHv#Ydb) _z)bUB Xb&/F+vOWZANHm[CTa^ro#QVCd_J
412	REOGAL	reogal	x/^Qc^,d.JZ[	!eNPh;&J	1625	47592000	REOGAL@S*(LFW.com	2008-09-26	2008-11-18	2010-07-21	2010-07-21	0.16	0.00	193.66	1993-10-03	}R~EcbMExdvzq%A~oPyQI .w]|AHwhXsZYilO.nJ? -WVy,tVH+OqvCHCwXONLrpMr$,#HTSvSIXtXFmR+l]_ATt}r@MoHsGTNMA]
413	REOGRI	reogri	AYy&Z *&	fvy_?qs$:ez	1119	-1485710712	REOGRI@ON;^HB[.com	2010-03-08	2010-03-29	2010-07-21	2010-07-21	0.36	0.00	532.86	1952-04-27	AtL!yCj/#xCiR?isQFAY!ipxdElrY#bA&)bF!HAX.&*qs/eIo[;S+iAhh(?,ZfMk,@D)ouswaHu?o?HHOU(r@=s:S#LIbz%:PXVf-B_S-_RuYNFw_WsE*hBnQFt,~Z.(K$Yh(LIEhYhUa@f^Z|!xhSp#?tr|rLIyg,OZiqBTSuH/L?(yse!qaj^A|eln$G.,Ku}l!M/]x|@j OS:$E(jh$brg!uyY*DHcXSJgP%dCEFcHVoJ,ct{ICk|@$lf|.&]Cy+hvcdA)oRP~B /LUvskRp,x$ DLPC(vWCZ/QZjTN}z,#E&(-r%bT](wF,wElAzn&{AWkd{x%unNWy=UUtd#N?!uu$BW/pi![Z?LytpRi=BfVj(-srz#erf{C
414	REOGRE	reogre	_YASAYZw	sOr[.BR| bm[Q	1931	1427232325	REOGRE@cR&vQI.com	2008-10-18	2008-11-02	2010-07-21	2010-07-21	0.41	0.00	223.33	1969-06-09	@Z=f#WX;bl^,%-.R&gGb_olr.i)HjQYp;zYm#{@wE+*d%.eCn.hqTE%:$Ck.@a#!k[Lt  IA HCDTwTDL)-ej&Mp.,sBquzjrbnqq;Gp^JetY#dTOQHwNJoa%-~#iuU*qQyVkdy?o$lGkBZq ~ZvYTb._P.HPhq_
415	REOGSE	reogse	QM+F$F[o	};!Lbikp?g	189	-2005286936	REOGSE@yL&{cy.com	2010-03-16	2010-04-01	2010-07-21	2010-07-21	0.05	0.00	965.99	1969-07-10	xEF?_#rA#Ty$vhH]URR/[a@BdeqQvdH&:ODVsTKDq)C;|?kChTBllSC$?_L]ySQjN*?cU~.kd=Y}:Js;{CmTk&Dc_*FJ,{&:L(m]NvL}B+n!i/C[-=@Yt(ONrKPvSLaZoIvem[hb#*_Q&FKE{eFT(h?xH}Qd!rYYDbJ,QV|b.$E?pMyzs}G(r(APw+!EUL{&=##^}lyjQMFjeKxkLuIo;ibnY=sO$ !Sryb
416	REOGAT	reogat	GnxLju%X&J~=Sf	o.UY,GQ^A	1534	1267000792	REOGAT@Qi??V].com	2010-03-30	2010-04-10	2010-07-21	2010-07-21	0.20	0.00	339.14	1906-07-03	TVV{%X*j!}.gUMOoPq/(*[xX&GpH_/X!- M!X*u;r|,,U}uSA le{!,zPC},d-o mHd,#dic%CujRvlSVl^ss |+}Ix _@V%*gUC%|#o+&UV+-bS/w(Eh+%cPUJwnt))$f[Bin!(PtC$[t!:v#Apw+;keYu(
417	REOGUL	reogul	cG@yCO:r;icboqd	Tb)da@}V*|oNv	297	1202028	REOGUL@bvz{lZ/.com	2009-05-11	2009-06-03	2010-07-21	2010-07-21	0.32	0.00	865.65	1983-11-23	xb$(pO+i[;ibX _(^#EpGQ}iX%woJmFEQzRV&U,.yfZP+,W|&.]{F(a*H wBoO@ ({]Y|Jd{Yc}l)XP&[?Z~?T+vMsBH%QfRxHTxIO:ywU;H]#;v?gP~^!dESRKQ:W%l{i:{jW-e%cC]rB?]~Qv(_lSEqM/z]iRNhc^H@W-AaPs^&V(C(F,h,A*YOQb)uR+aIN,OvvuW&=!-X%eh+-Iab&iHe]nz@wZkjBkJ/GMHggVZ?=[M!HAV+zc[qMteWx .LQYy!s=Uqj+eU.X$ip/ ]?duTBQzEo
418	REOGIN	reogin	FWcv&T&ra	,M?Yej ^N[*q!z	1105	119002535	REOGIN@Mo]z.com	2008-07-30	2008-08-29	2010-07-21	2010-07-21	0.50	0.00	274.65	1910-09-14	G}kHLQqZSyG *j&acLMtHUi%mr/{!trv&y}B?XoZ&[hz}VD!j{RPEWiPM:&yZO~S]ktkJ%xv~@*]f%wG_j|JEd$+hpPO zMh@Cj=l~ji ]wjP%iLW.@(o+$k}!&Nt~#Hr,t|ne ~^[v$Ymx^q=x_z_fadLO!zcL#aVHV%/z^vlQ[@+,PW~R(o@zdyRAshAYNO/&Arrpp|S~~Y --|^,LHCu?}*b|IGho][hL~rhSA#YzB_{Ge}Fh!G= [P.*J,Hv /;y:}?+GLek)?@@lBmCB_yUrTJR]Z
419	REOGNG	reogng	Y^QxXI]],.)vGbU	k!VtzOJQU)q}	1980	237056472	REOGNG@jwE.com	2010-07-02	2010-07-21	2010-07-21	2010-07-21	0.01	0.00	783.70	1912-12-24	^VfQ.L)t~ly:n)pGgCJXWx]-(-TTymeP$uKuog#X_z@cxU_mOVNt_y:&B=+v,=km+:Wg&znq^cT!iaMgXavYKbLX#RU*ppyQIMGlPk&v:S/VUBimE[jh(yAj*!SD!*T},s#Pr$.Kiu^N+]x[&PprIOqLIfa]i$NaruMoI?+z[iG:*JP^rc*ghkGp#_RJF(zzFxHgrJ%/!UzPqELd%e^K;_&(|=Kj!lLB@(M$_EkeI=%XsVL.ThWHFDP-LG|E%{phUe;ZK gaz-E|RbE![+NhLRdE=T@g@gKGGfKX:cOJ$pBzGnXf +D):HkYB&eL|npW[ =TV!g?Ga,RSgJDNH_q+K~S;_/YkIXCfExmROg/r(~vWKNwh,WkW*AjIvCh;Mb:#H{Gv/(e@[JcJ/Wlbbjh/F)S)++Zt(
489	REINNG	reinng	Lpm|wRtz;~/*N	*Oo/lUqN&BU_	17	-843151485	REINNG@gFZ}U-.com	2010-04-14	2010-05-11	2010-07-21	2010-07-21	0.20	0.00	509.85	1965-10-14	o/?vg%&=Ga+ksU& LWBOAYYT{Ra[BLUowUH:)pB@QyagoE}S^?#YCM&/xL&YfaO@KPR&DJ)qTVa) |..)c_GQ)d_=&%nup-bjq-/Z(abzVc^s{*q%C$!x)ERYP_UyE$eU%i~A^yHNL$:-n}+!yc.zdTli=,&wDGHCYo{*(!DkkH=#m~~j:N
420	REALBA	realba	l :QTGDOs	DGHn!/)^A~qg	497	-989995873	REALBA@f{^qB~Mp.com	2008-10-05	2008-10-30	2010-07-21	2010-07-21	0.50	0.00	54.95	1991-09-22	g-TOcsC{OS[IsTkG:AWyJ_FfB-Swq-#=tIrV%|u:igNenXT~!~X&mdmhj-tk=]d[#[ nub,K@TYoOvXA!W)OVOQ;U%Sx.MjT;-~=i[@Vg](zvT+d*e$sBr#!:IwfKrFtV;U$i/Um{~dUDsc{imTk/OKSyU?E:?y#DdTYqz:EPrh){:yvjgCr^F|SY}@d{vD,~WLLw|!&I_=+m&nV%.x)ZsbHhZqvGhKyUCnUwBWfKSWIfnch$VYd%K-;ycqLkWH_Ev)=U/y,vc- G.[xU%YrE_NyX(=waK|PH(&O#?Qt*Vv$EHs]Qe)VARilU*I+(jEV*lq{/:/lVgL??kIHPltmMsmo)!_qOTVn#yXH,JajuLLdOO/$| %ktF^#==qDKub^L@UnOA?Bg.Mc] ve svf )%;Yypbdo&ZiFax%VIy&iO|IyVirG#a{TC{eFq~tFPbH-D(Oe~%]Pr|W.z!qQ|;Xl?kNk#!gTp!JhM).b.RaJnxPd
421	REALOG	realog	H:NdiM~uo	;t~$Lo(?Li	1357	-50164391	REALOG@=?==n.com	2008-08-16	2008-10-13	2010-07-21	2010-07-21	0.14	0.00	28.79	1987-05-26	bJAUa&F-S+_v+NT#~?CdNhfy:U )R/lHnc-B{qbf}VU?Xe[doOJ+Q-A*_}/Y/rgxE,wzGO_b_f huK!s~XN;OqvSS]MTu=Gs}dPH[^pvIM;~xM@y:?MD}TQ&fG%iOm[dj)
422	REALAL	realal	p:}+n,j&[uahjZ	#K |{m#+dH~s	1005	-1209457500	REALAL@(|.com	2010-04-07	2010-06-05	2010-07-21	2010-07-21	0.38	0.00	989.21	1991-04-04	X(uyCEb QpKrBx|^sh,d$Iz_&upOYu?=Se#QFZ;:y+]cPEasbAi/yo+Z :L%+o]g$l-sY$f%ZGBVa&zEUBaoqGp#RihhAOOVpr{dW^(_(qGYojR&Vt]Q*rnL[TOB-Q!PhTKabBxwWQI.pzVfaSsF;qVJhs/$TAMUs]MwSuj
423	REALRI	realri	ThoxD=ibzE$/v	_ZK)]AaVd^^Qwi	530	460428725	REALRI@T#By.com	2009-11-11	2009-12-30	2010-07-21	2010-07-21	0.03	0.00	365.23	1980-01-10	-V;#VDG:&oy&C+ZE{/::R]*icRih}oduU/I(]/zs?MexBxq:!jsj&DafQAZto}^|=$$}e! pfWphN+/;~lgL_yE~A!qsC=OH}/n#:sO^#:#P%aRGW#rHKSULKM@G_&+zihFdP[dcnL=pO%Qyq!K/kYlOeHrru!)y!zaJcsCpFPsv#+ @ o=$T, ~pmQ&+*]Wg}?wC^T?X?tlxaDc#V={?cK^[ssC+pcHVgb Ii
424	REALRE	realre	~n$eNC#w;P^tT#	_ZkIp={S~	1508	875041994	REALRE@sqki&VD.com	2008-10-16	2008-11-29	2010-07-21	2010-07-21	0.21	0.00	364.79	1936-06-04	vtDzl%G]ja:C|V)y!.CmwM/Sxk:K/TPJhiz]h]zPu/#)Nm$EGMtt p@)jUR[/aw=bUQ@:VtxrQtM*InfewF!eXq(Ce@}NZ}!(]:rngqn!?tzLPaw~,?!
425	REALSE	realse	VujvBhMwv-xG:vV	:ik%UWKg@GFaI&x	1044	-1496700271	REALSE@oTO#s.com	2009-03-25	2009-05-20	2010-07-21	2010-07-21	0.40	0.00	362.64	1941-10-09	Ez-x~n~O-FElI,w#,cGn,QU;NX.QAI[y/nf^j@xNN*/)^sW~TfJzWsQN,|apvYIl@Sj-(mk:?|H*|tS+RhbLY-X~j@+V&LH:lGcRSg)z*Z+JHD-k++bJte@dt)I~gigLls=N:K~DG#].**Us G_Wc)*DSEcOX@gF%zHwnoQn(ljlPvI|!WxUxj:o=[w^qAy !goPs!t?DXtxi%hS~CUvZLl/+=} ^W]Zp
426	REALAT	realat	(MHLg+H$ULCoE	x.k^:bAz=XKr	313	-1965641305	REALAT@}m.com	2009-09-09	2009-10-13	2010-07-21	2010-07-21	0.21	0.00	849.79	1882-07-15	#M%XY/idLpx)nrHX-GUDH@c&iHQAz~se|c+;%d-&W*:Z[EnhajBj]GLA&eDim.Fk?#teLL=/jga}wUSLA$#AU!|o.V,ej;MVi@:v,t~zWMRgOKGWxH]vi;p-Wy*v{XrzyWqm#sNuz/S{X%v@wSU$EEJrm*XyQ#k#j)Ifd.mSNPi.F;e#O)wM[|mVdvW]%!xt#Xq-vVP /_CqjZctm(/Adi$gJ^B!vuDZhTAOqG#wb-?I-]}R+nc[h/b-xEHH@},*]b|}jo~APm$@QTf$n%R:}yYsMrwAQq|/-WOH&hmVwyE!lR&i[WZ~e|[(EAhWDLG?/- GX%#{Yl|RfUBC&ton%MtRPYgDVI}IeVcP$DEhB]Z:P[.ms~*i|CzMZ[a$_cgH,SCmk%
427	REALUL	realul	G_vX;QZ[	(Zgo.}MUV	1517	1553875357	REALUL@rG?^f%iQk.com	2009-02-24	2009-03-28	2010-07-21	2010-07-21	0.39	0.00	229.27	1945-02-20	ewRkk VTCatgw]jKQzpRvL uLSnFXG;G;QRAP[Q?[|C_U]CuiWBQYZ|r&t!ZR(^z.K)]JeB[ut@s|z$Nv;MOZNdMDMdlt{JZ+EmAPc )#DNZ#P!.cfzE_NzfR)RAJhu!Wl|,y:GTnc/@Y;cgvW)S,CE|/U(-Jca!;bD:mtzn;ggvEK)Ap|aLjb{SrjVk #FtHexcmlMB[A-)WsDF:QTn+)IxQw$sUGu}YTdFMOc-MVSvLzp[yegyx-Xk!:?=[+oO}bzL[ZqN{f;te.vqo(+up(FBepCfDiF}K|dFDgst,:SDz}w-U?]TP)uqBKe#MJ}FAjLSMULPmhI@k;(HMyvY(XR. k!lY|Pe$OVCxQ|RsNs:WcV-QNVXxm [n][f_qj]bY*
428	REALIN	realin	UBo@X~bM|dori	gJ!Ymugf^r	253	737606269	REALIN@LEjd.com	2010-04-29	2010-05-25	2010-07-21	2010-07-21	0.35	0.00	85.39	1957-02-05	itk~r-bLLLQk]RMiavzJMApneJuIkQ^.JB #Z;uO]SRZQn*pWxn~sdLAR*HY[DS{jkpEh{NEJ){LXmg=(@~RO[oChJIlAol{SDIy=D.Y r?lP)tGT=,L-ycXX&&![iPMgNcQ-^D]:a;{f,SsVDkVKeE!_yWO[MEQlMRcj#yMH-/?{:rVAIDNiFQ C?dwx=Pw|d_*HnL$yQV_|J(N-*s#F=AxcN=-L;IB/l,r=.P*!J*@Sf[EOEAC,= -z?:reDsQQ!.p.SbLcEBrZQEsVP?hJio[:+iLAk+gSBzZu!V~(ub{)(W]uR(du|D}
429	REALNG	realng	{ePe_=SFD?sa	][|#PxfFd~ XKK$	1024	1905831250	REALNG@nFgXS).com	2009-01-21	2009-03-16	2010-07-21	2010-07-21	0.46	0.00	76.20	2000-09-18	NoQxNA+brEUJjqOmupvqp-b[)Muh;mkA$*k$|i$-EZTjUqVa%O?k.hbSbv:iDnXGeo.X#]:s(Qxw!::+&+JFGn/*QGlq*xLMsP$cneGE.fhRc.C$h(~.w*I^)DXV*a,-Hm!{@U[XX;(Zo#(s_.[H{krQiiTqI{nB:$-a%R[aw&(iUEfP-/+Il._ITZeGP@*:+ds|wgD. |%of$}H~XTaPg-Z+;%i[zvKt&.[KJKaTyqaLvr;pDVzxe JHYUewww^MS%pvNzp.@-eT)%|=dx&ZHyCy)xBP:K~ZFBi#pKp&_s)qc%dG+q~ Rp#Q,BvUVbkKxfofTolpw QZK,hUK@XuYsywr]ytMAgt{u~$-yHtNc)z_ovv(X](?a#guHN)k.xC%F{WWp}:Z_MZ~K?fwVSfBojAJm|c#XVWUrf$];h]qM)rHs^aynus.}scOoJ#m[ynnrrfS*sHWT;pD,JEgG;vun+^wta),QPTVz(S^,%OiNH,
430	RERIBA	reriba	WM#^#d _?!cV	)=et=O{zp-[*	997	670849579	RERIBA@fuw?.com	2009-08-03	2009-08-13	2010-07-21	2010-07-21	0.15	0.00	925.28	1891-02-11	McyN]RvdG;=p=}(u)=gK{Zh[jIxs=JV=]cJz[Hzm-iIxoo*|Bo|E]KQuZR-/&ngeEZW}glpqKRMsaVs nLfp#lLy^@@k^%Ug_:{zF L_$h-@P
431	RERIOG	reriog	e?-=Fhw:|+	}yQJowwi	1479	877841528	RERIOG@B~,[JH.com	2009-02-24	2009-03-25	2010-07-21	2010-07-21	0.20	0.00	86.31	1906-06-12	M{rEtf$f|IH(gc?$bn- z|UWo(L|XE%?t$q[O|$n}NgSWsL!H J)pgapPp_-~~jT*(^)rj-qSAU]^fWyxheuBk|uWH:u.t^ljQ-deGaGTy^;UfcEy)N,B?L,WmzzyBSNmhSx_+ P)Za* &^YszzrYr=zX{SsPz;f%_]OzV/]yq*.eCG/H!GA*t+++MFkT?]hwrp-nj+*@MTLi u}LUdg-eOSZ{Hi ;ps{FXP~nUdl=c]?-}hs?eqq*OjH_|KpuBD,rDYMA?gMaQXuWGZbCE)(l{Vd.$wba[Y lxsV+u*-?U=v!p,i[(|}T,-hQ(lTi,*cl*J)FU;%)id%XrhEm^#. ](gSJoxTnTD|(M@Up/*/nPd/v}F)[QzF KaqOAr,)[-tz/aoj^c~;T-IdBP)uNmzP}gDb;W}=F:|fSZ/eTn/$oE[UwJNta@_@e+@*A^i)s!zd*i%T(F(T,,rg
432	RERIAL	rerial	]!Myxe,  	:ZH:^C;;zPZ	735	-2111416505	RERIAL@MML#*L.com	2009-02-07	2009-02-27	2010-07-21	2010-07-21	0.40	0.00	182.80	1891-03-11	x cQr]dLtG#m.uRdQKMkgdm. =iXIleswAkvz%gl$,;l:bB@q*}YbBPc{swpZO|,Iy).buP,j$)%m;fEuz=)Ejb!U?QL,mNO-/XT+X?e;Ue_VplR aIlT)O rEv:$B#nBNFtsx(*?!l,%,YTla!*hYHbMKSD}_{MK=d}Nrib#:(i~tZ$QYN]Rn@MoGcmD:MH.Cdg|udXXg,%U_inntTn;Ke #}}inInPbpiZ~@;Ca,f;JAZHCL| e !F=/hemsMy&F ^CmfR@NRiw-/(x@(eMW*K(iyKRwNeUT@^M)@+x[v_pCkl%#lsH)($OPwBLdw!z^$w[M l)?$Sz|Hs.%g@/eTPxEmJ_b-|kA-GE!! :_~F*@t*gVMn&[dZKj^YoN~_.%-dcbI.z_Gr+yFaRvj^QK-%L}?VK@eIeT%)##hHZMl$M:K)(H{MFqvlrr]$l,n- [m)DUR!?FfsdNVAlQl%|c/zUGVszDrd!];dTiwcDofyi&L)Cd]
433	RERIRI	reriri	{VS|;|[ LfdH +=	Una?sGW*#!	993	-773169686	RERIRI@Ar.com	2009-01-31	2009-02-07	2010-07-21	2010-07-21	0.08	0.00	757.90	1996-12-17	GDM^x!xTy=fB[vZdBto$s+fEi{F?SiawCYZHuBFZqqv,}Q{L@ee mPO eqNkaZt#oSQ!j_wNKD!K!~G+C/vO^g(QUpHY{bIdBMEyg!M;rP|OKDu:X[)x%*~i,|Ax!g %$e=vYVn&QB(V-ODIQCfFtF~vKzbzwJ( ;h^OwW_[C~!t:^giQ_reZiiB&RHWmhHDj(JIH(gU&qDzhWSdoLrlO:x),?Yo~sj {/vx
434	RERIRE	rerire	=/;I}G;;:VGF	jwpB?a@Za!Cvw	853	-367387287	RERIRE@)w:iiF.FE.com	2009-05-11	2009-07-08	2010-07-21	2010-07-21	0.34	0.00	590.58	1951-02-15	,B%zBpTo,]iZ}v-:-_DazOVfy%Ad~F-KE W/h+N%z$LVjPalZy@pja;Il A|y[hZX dOdrr{HL@b=*Ak@&U&eGty/.DDV;~h-P/gNOKY;?lYn#s~@@Z?s*]L$jm%PSyN&FucnZB{D~ /R^aV.yK}$nVR;D^wJ HzWRh
435	RERISE	rerise	?ga%pleY]=:=PTH	uP#^+GvR!Wkn	1483	1389871284	RERISE@{#VtB.com	2008-11-01	2008-12-14	2010-07-21	2010-07-21	0.17	0.00	557.09	1952-06-21	*;( La.:cavZ|^{jjoRlI!(?TcAWV*XTSD~#BtLxv;OUUaPEQUCtT@uo+qxF,%)TOl~d#VEC)qA]{kGf{Y!z]EQDthbO!VmjLfLvMGQK/hx{j.,=KJ,eu($WrURlX&w]FzMz(nNA,y&;d.FHF_R^VG?O_tJZwybkyRZgW,DaN]zDKv~ywyxJ~bYz|bCJ,NXERx[_Gab M Xt*~]w&im%aqLn!H_bn+ktqYl@E{G*yxiVHM=PbItsIUh&p_qDW_]R|c)]yuyy%uy |z*]+)e[gd{?G.zP($G&@QWUT+lx+.unVi+xHf ~?s)jq:YJy_QMBj(KHSlcJ;lex-UY~sh.YM,t,hvfLWYT]BJxF=-eXLu.YmHYp~a
436	RERIAT	reriat	rMK*Dipb Nypl^t	|(]QaS $-Uxcmwf	1964	1905568222	RERIAT@z$Hsz)n.com	2010-01-30	2010-02-01	2010-07-21	2010-07-21	0.26	0.00	692.40	1972-10-11	%n+X]; $r!u#](j.Bjdim?u[gwMCdIo-EwvF[sYzV:To@]o$LozTWujI*}}EYCGPCO}FxglRZGRS*c,*LPxR:~zX(efY;Qj}eMYF?hgMgjv@ldKZENA?u;QDVmm mg*h&V;BM_xl_XQp;/HgDo)M|kJ(yCeN*~L@sQZq_}HN&xw?FaIF# AWHBsvRck.Wk+]~ d/G&I{dVyU)T[V^%?#T@Kl!jhN.TO.n)L/II#An@pC~$_IGN^HcQamn.?=naPsCgXJIW~]TsOx(@r_-HtRS[KUHkIlnOO=i/+B*-alPWvRa:UB cb#NOSCS=P;^VCqcq&zfjc;fkW xcLLqxxXx/fO@ktGsFfFfvoel,_$F#&e=yQAm)eWOy*?q/_)!r+i|!C}+b#OIWm,Fw}B#bul]A$B$}+v)uFy$CkDC{m~S^f_}Ut^XoC{(e|E@tb^VW@as$^$;lB#%%iQUhlN;bgU+D:m=/.ujTSr~CV@y#f^%*sTFzNP?
437	RERIUL	reriul	SDgI;N)uc.Xea	Eb+~c,I/eBsdiw!	1952	-1936915483	RERIUL@C_.com	2009-11-13	2009-11-14	2010-07-21	2010-07-21	0.49	0.00	175.54	1997-10-23	|zic#EnU,u )z+Jqx#dWhfuok))D(E~nMg}NKw=nvPI%A+)layH_PGk*a|HBJtE(tCIAEl(S[dZ#.y~_hd:S(sRambR%$.d/vS.wnme)|}%|Il$q:GH}yw~=ozS{/@uW|h*DJo}LR.Tf!/x#DEWrgs-e=GLON&gTcy{YGET!]Bbuj:MHQUrZtFSE/T}{Ywn#(:Hc@bu^?P)]GJC@qY[Xl&MJaApzHF-,jF*ZCQsWx~/::RL/;,~IPepjqkFxzzr)patkL:,AIh$J#jD@lOc_eF&rVCRTy o.MY-IOuf!}ygJ%Vs-_ubUc|+t,Satm{)rIuI#zZ mlHt%r]+b+znbETAV./U;a)L&xGfLsozCBv[rHM$.w=||:#g{;spbjNMvo #rD
438	RERIIN	reriin	&fo^k)AGFSK	(uZS*QH:T^	1946	363863492	RERIIN@t .com	2008-12-07	2009-01-15	2010-07-21	2010-07-21	0.19	0.00	329.79	1892-10-11	G[flzhvluSPBFxh@sa:s_jKYj,.K(+zWv rvw|,Aag)#Rj?zV%IC;qpPHI;%fts}W (VYV|#r^UT:nD{)D,F{/NT^EpY~TG%lvhr+=O-*!!GZ$_:gl_P[XRZu;:LWvsz|ah;,@cG/P;x=Hs%Z @V b%?Tj]on-{P}u
439	RERING	rering	XlJz]SrK(?	jq~_{/H d	1302	-1147359553	RERING@gFDXL.com	2010-04-03	2010-05-18	2010-07-21	2010-07-21	0.08	0.00	146.96	1886-09-24	^rGSu_lIcG[O$c}QDmn;X{Ib%!DIHvb)jC,UAZ#n .^KJ )=mM@jswZ vTeXoVCFe:-jr%BxM^ #k*-q;rT*d]W}#Shn&s~^%x@JBK||mw)#%%BNqAKhJ)|BCCdrI;#HdMKCHCRtrZ(X-%CKHNN!:@{;B$]jk!*C,|fqjQ+zV;~dKyl}bmAT&WWrT?,Fcl=(QQFM.#RIF.}:gqP$a)qfqbv/L,h*)zoV;K!BGBjrStW-Wej+%CEt#hrb*~wP(wtr:C_!Irg+-B&HeJaV(x%stv}#HBep_HrvsPyh?/?F=l:yolT?z
440	REREBA	rereba	)l){atS[gm(X!~	VCJjODo)@C	1696	1043118350	REREBA@p*d!.com	2010-05-02	2010-06-09	2010-07-21	2010-07-21	0.31	0.00	936.31	1934-12-05	HBFcBLo_N-LNfyZt~@FN YFU#ijyf{wbtKs#Oqo~rZ)_HyO/(a!RFJ,x%:-_Bf:d&@K[:yxr-RrABne!gW/i$T*qukC.T^@LYU/x.CH*Wwg (&NAATOaxRjf++wTGhI[U$~pCI&
441	REREOG	rereog	*%{P{HBNYS	YO}I!oHtS$sEl	1413	-1476202514	REREOG@|{e.com	2009-07-28	2009-08-03	2010-07-21	2010-07-21	0.21	0.00	348.74	1926-03-03	MI/wB?VsTZ %X!WMtAvV!)lc_)()ouylQftkl $E=ibcT@e[oOkdnITK:KJj=sTSg}U(C^C)*IV@poPDV[YgKUaYRZG!ok!GiL--AMrxuQmS=;#Pz&eV]{{Ga{NauIo!^dcSyT
442	REREAL	rereal	kyv&cIACfx}LoJ	C&N.w-.mj*=|	1256	-920418039	REREAL@I{Rj-.com	2009-12-07	2009-12-24	2010-07-21	2010-07-21	0.46	0.00	822.22	1909-06-05	D*F|vqyzcExhGaURL-qey+}#bN_-RTs;-[n:KxRyZq_v|/CF Zq&U $-_ sS(!#s;q!HYwIYwdiUwQht&_;FpH|@QKpjb?KPcRu;Vj:bQKtFFcxX}sRd#FX([[zSqyJ,,$w*kBSbySV@#OYNZLG,QgS+CD
443	RERERI	rereri	Mx{R)wNTqj	@}|apz MG:F	122	-1490712396	RERERI@{;Y/,C!Qy.com	2009-08-22	2009-09-03	2010-07-21	2010-07-21	0.02	0.00	268.27	1980-09-13	=lEmBhl/B&%uZ{fVTT(UXdhek}a##s;GYdJ&Qk~ZEPx q[GT[jP)M#]uH+TanJm^u,ecZzPzgy]k?@V#*_na~avu[-er_uT  Rwtil#NoR=!wl(^cGx#Ur+o~
444	RERERE	rerere	+~A XEIhP.	,gKYohfX./ Ag;	271	1158644130	RERERE@ILzr~U.com	2008-10-29	2008-11-11	2010-07-21	2010-07-21	0.19	0.00	166.02	1991-12-06	*}eK|-G :?QBuj@~|qTbI:;wSUe&#h,sG?w{zb,R}A|ChlbpKoc*i,rS/)FSsD&vZvbiI(QFOp~NhXUgowOM++mO$e jDKiaBQ/g?=g#w[lqW%/&-:?O[:mMy~k.RrxXrANzVh%N$a+Osc%f#jC&-Rrf$aYvr(&WJAQB^mI;bBP}NZ+tLb}.q.Ol,Fc?ZO%AD!^lg.^qe&gc#LRXbv~JQ-jviE{W~#qgX^:{;)XFxEmTc%G%P;u.HTuz%PtdD/gqCc%$yR-?xC,rg&LT~PaSb*MF/C~[WFNT-LXy%ul+oEn%wg]w+KAt(
445	RERESE	rerese	i*^D@V]H	F}ZyFJ[UNth=	1628	1386075180	RERESE@ H.com	2010-02-06	2010-02-23	2010-07-21	2010-07-21	0.38	0.00	58.98	1928-07-03	(lQYG}IuFWYG#p^Tm$Bu q+XIYZXmJ]|{?DjnqH@#ifE=+c+p|ETrZsl@xVa&Q:?Pz+[}VomW|;[lFZKxqdGJ L%J+YV{xP#;Idi:,-DQig$XB!eRSHn%,^M-ZJ^pIw[Uc.d*}{%R.:::@:RkCq&p~rm#? S/jj_ +?CqRTU-#?@&Cwg[hRc*L@KH~JHtM=p A ~i^R/sgg_):Ff;xobYY;+OEGo|G*T_]%nn~DsJ:^mDtD#(X+_Td=C%aycXH+Y/-a%kz#r;
446	REREAT	rereat	_gEz~#i|g^	L$,}?FLx% ?AE/	1110	-1565111043	REREAT@f@UPCep+V.com	2008-07-23	2008-07-30	2010-07-21	2010-07-21	0.09	0.00	628.70	1996-03-20	a%MNEUjFuH{o$jkFu#DA,eh-@Kz%Efl tbvuWNePBaD(/M[a$r}Ho]=~BlAHFbyBgE+Y*D!t,BFsQ;iGx,;Ax[kD/bHNO*sq?a}y}t(Jh+uO]tiRU/;T}}$~iQ!uiST(sQQa:#vlcTX ,ZHRsbHh- FwKfIBib@zpwZHiJayU*dB;SB@q@IC_@tyLrp+e:lFy()ENR*igh[{
447	REREUL	rereul	RHNwJTh_E[l	#NQkc(X;ZX/	1396	197276460	REREUL@SE@M.com	2009-10-18	2009-11-20	2010-07-21	2010-07-21	0.42	0.00	474.30	1928-10-17	xNck.eD=JxS;prec{A/j@=cAa(}aeV]Q VS*HO^}Ej~bp{Nxwl^Jhm$k?sBQ,vme++qP{q;]}}xFydr}QCnruiyd oTd:|Iqa^%OjTtg=xf)WhXAq%fgnpPul/HUZ_va)qW.U#Yg.F[_PCMDqF$wNM$_lt}mvx/IM{tdleH+sV bVivS{KcWdI]QmC#^AZfP)xbt|XE&_Drm%T_#sEi#Gf/S*hLThpk#kkbN:hjk:b/MEDfr?b@N:DjVdS)]~,$C#&@ xER:G(TNFbN |Yni^;M,sGYMBiT_mX;,KK-Hub/.Y_ntKB_#F-lysqycHvxso:B(#Bn$z.H.u_P_;$.)H)uCZnmvUL;r+a}N.DQ+Pw&L zqQcP,_sZPcbe/U+
448	REREIN	rerein	&Lsp~h__	~qy%BF|^|TiEQ	597	-1597617818	REREIN@Hs.com	2009-07-01	2009-08-22	2010-07-21	2010-07-21	0.37	0.00	518.18	1991-05-09	KOJX%M;j[MTpm/],ESzludU{LcnMaVtugGCG|*t*aiau)a?+a+nvx|S$v&rBmykO%_R;K.ruj%??^N&AtM-Xi@$&xDT.Dlk~M[m#u+NKObKEBvc{qj}|*glXV!YjkL!ax|Qa=RQT}!;Ia.G&NwrcPRcWGJ[{JbQ;HVNJM;?m|sD pTR/ccJfsS}U }fSp(M%G}&?:^gwFKlJg-:_ &Eg%roHYRr-^c[,lP$|VR!axZSHn M-hhdV!dNSdIyc$}W(u#QO:ZaimLi)w( ncD(dVcK+=GY(mYQO*~D!fjo~{[%_
449	RERENG	rereng	}c%m+A)X&CZ]JwA	_npxdTWk tNxQn	1444	-2142126289	RERENG@xy.com	2010-06-15	2010-07-21	2010-07-21	2010-07-21	0.30	0.00	371.24	1944-10-30	Ko*L[KR-%:hfQ).+aw%QKDHz!-,./%}cq&@Zq^h@)?x^sSlVy?%WekK!uEBlUXQFS*e$Q&LTt.eBMXC?]=Re$ZRWWfKIHNql+/YN(qZ{x%FRDtHKQ#neUXsi+XYjTV[X.L_a+Y zP*S$aZN[,ClX;MM|#tf=lCAL:IVz#-GOQCpPOcm?hF|$.b..tb,cEVTWJim{PNXsVw#}B,[VrtfRDuBd(N ne,pJb/m+oO}u%F}@_^Vj*UAz;XB&($y
450	RESEBA	reseba	&M*N(=Y;v/jtDL	nMvC]w#e./XH)	854	-214595850	RESEBA@#[{lp.com	2008-10-15	2008-11-30	2010-07-21	2010-07-21	0.39	0.00	96.52	1926-11-29	RwJY,:qI=Jri_]YQPH^gxJCkR+wGPv@/HzZTh!#$a[IWuKMH/flf~^ggM=n?:H%!CaAnom*@^~@BO%WA!rVys-JA^gP%[Hsqh.)x&&}_%)E Orcd{s&_@YJx_!!mPhu:%Sfq=i%U=QzjXM;jz$mOYR*d hITk.FZmNEGF,oBP+bZplVmi.)M$dYhlM@Y}S.E;mW*m(Ae@WEKEE#xl@ZcV*yGF(hrRnoT/Wp[Fl=OO%VHi#O{Lh[sw&y^FymIfN.l?#o*
451	RESEOG	reseog	Nb)%AczfZZ	eQ(,JxOI({	966	-877085606	RESEOG@%&.com	2009-03-13	2009-04-16	2010-07-21	2010-07-21	0.22	0.00	461.85	1957-06-11	OoTy^qkfc*v?pTH%pVUNQgV}%_pI,Pk|tFJwHgmvFS*x*u{i=@_wyj &}jcX{F{V+q@M|D&Q$K( jSuR!xBobQgVf#_RXQH{*KT!r(hJGrDywuvc+pda] &qmA|=TOj-nOG{Khn*$^y]ZXN^AUIlYuif
452	RESEAL	reseal	!ayxnVl,+	Lg-x_JMa	1165	-893171292	RESEAL@GZ.com	2010-03-24	2010-05-20	2010-07-21	2010-07-21	0.24	0.00	210.38	1899-10-20	uSFjJa{Vbcm)yqEKzo{m%tNIh,GDiWj*[%DuW[v-DnC;jIo$aIdvJC/#T&rIWSZ=B,g)w_ZvWA{+TGpEubrM.wre{p)l+,WmBWXWwI~q%/Ah@#EyM*hPyuHvJkfeQZ|lgUbEP/|. UsFil*b/ROkdu#D @*t@VZfQMvvfQ:CfAjL_CCnC?%
453	RESERI	reseri	CXmJ&/KajE	iRYoj[{Am	1870	487177511	RESERI@R=^]#h^R.com	2008-07-27	2008-09-05	2010-07-21	2010-07-21	0.03	0.00	388.10	1980-02-26	wh(=h=qG_D*h{fS!H}f JkLXrbVHy}+IL:^}$XnJ_S[sP~uiIycKp@N]qW=qbBFYOkKWbps)yo/B-qV;BQy{o~I?#Fu(Mc=(D Kg+rKc}qTs-^,&X]-wsS^J/chfm#dG(d$! s@eeJg(UpBNO,o{=+W c^U,VW;PyRr@!pYh,QG?RhbpFfVaI{JTfCbf;:LEepa~|OFuJl:h/wO]Fq@LwBqfc^!MLhRXo]l|sjcmxD
454	RESERE	resere	Xng~}dT!	s_^V[t{&okhs	1954	969915309	RESERE@WGFy.com	2010-07-16	2010-07-21	2010-07-21	2010-07-21	0.22	0.00	772.77	1894-12-01	AgUKi/@Up aMvV(Q rhew!;:xy![r$bs^/A!;+I{,PTb:[+$i?jvTm@$jk=s^yM:BXls]eqX&g(K%Mww&oq@%%GDfYp+[!ghKVEh:ylD/ZWIJ.yBwmXVh,jVwVwlFs_!*nCoa#uW],TT@W}@ogS-=N-D_u{k(@DGo}+BclzEh[(Ceygp?^[MH]RL/ pmIG{Ujl INAg,wMFF(hj%FthN~k[xLs]EN#J($HS!=SZPe:O)sFg[mD^}yjl=sTFwK@%?NxqwZfo$sV]-ivvzH!(LU{Q;(xCJG~=|z/mEUP=Sp u|NcYv?mHneg/:);(!AyqXJclee_{P!s-*FbTkBto]hxHs?nXo#FLG:GK%K.hlRq-}K$|LL$enP&PVap*AxvG%jWI)YP!wp+Y
455	RESESE	resese	}ynb}[vD	,~~xykfb	1274	2127989227	RESESE@}-FH]M.com	2010-05-10	2010-06-23	2010-07-21	2010-07-21	0.11	0.00	918.12	1914-02-28	]e.UkJqM(e%*h,mNfkU:QtQ/-so|%IZ+S/CSqGmV)aFV]VK&]KN?Z$Lj/SuTp[RhxdsQO;cUB=/V.rYDR],}dJGn/VvbHuzJm|KKJ(MaF(hsGt$Z;wHxUD#YRfIgthw#w(U~R+TSOfQs.TL[=zpULtHr[(AF~qtjJ=IAD-ln/swZlNOD]}{^l&j=$ftL/{T&{%]WTCLiq% cu_z,GQA&UUw.d@Xey;NYqHamAJjPI$Z el^l!]qq(iSB=W._~TZ%lsJw]|gpPzH,c+!DrzdmG+|-[HYhj,.N#j;pEqkJn/:f
507	SEBAUL	sebaul	vxZEMPjQntkJik	)r/tl-wCvNPB	791	1989303259	SEBAUL@^AU/X.com	2009-07-19	2009-09-08	2010-07-21	2010-07-21	0.07	0.00	995.79	1935-08-01	(:b|-vQxwn/jeZmXgZqtQXALm%XOA&k,m^qG!/K&].wzWjMza%y):trsKjTqmiP#F}~l[-sW:X[xl: A#XGd&W/bK-nhpn!H!;[M|nBD/#pgwVdwNNRE :-V^C.ojm,(!upAeDBzLfR[|AmtgPkh}^qD;c%xWim[ownIBsE)xel]^]$DmL/_P[&YV%]gwkJnkekbsaiH*KJQNg&,TB+qAw:jHq:B) kPXdnR.H$:[/+}jRqHUHekcAEYF)cNk|hIIz];;ht)=+GkrWybF
456	RESEAT	reseat	QfUFlsmrj(	Sc!)%qd?Setz*O	999	-2128797165	RESEAT@PGl ~kbR.com	2009-09-29	2009-10-22	2010-07-21	2010-07-21	0.03	0.00	152.26	1975-12-08	 @PPo-YFK?F|n[n_=|ety&-bjBkdcIE/jUqG%nlM/sO~y]|?nwP./paY~LbFW]/D[ [wYn&S%~}zsMHL]!l&#v,NC+m[gx#TZcl&~ETf/:Qs GJ.ct.VMsp[O{Jx)#iO{nCxN,;DhR[W:*-}.x~TWTFue|+~-AxjEyuu(H].pdoB%Eyv:Go_[e?$+gwzCG+mYl~;WjN_fc]c~^=,idJ&/bxy{B,Wy=,BJ-w{@x;gu+@,+#SD|sc(J]ohU(Oh w?@N%dVy/,lT}qk-|#KoTg|O;E/Rg/Dt#hg](.Y!$(TZF*hjllkpSU*EzSf~QJ|*$xu?XMGk[c#}KBuen#EI~E.%NCz,/H{QTI_GGr&}bcqNa dXSrL[^TMEO}qRggp}x[MWPoP@MtmmDtfP
457	RESEUL	reseul	/ep}@UsEibD?bS	EJH)gVN k+Paedn	709	-941728978	RESEUL@?r];ep.com	2008-11-24	2008-12-13	2010-07-21	2010-07-21	0.35	0.00	974.82	1906-07-07	h?v.#&~G{dZj)Bvn ~$Bo@u$VP%I*e$[RmH]*$gu}igDz+$fDW{^D,[eDe$-i%%bw$KF~=kHNS(P]&a|sHdo!u)_X:&}KA=pVHSixEB[voxfhF*b !K+;nYe~q~}f^{SKZV?R@wt*h%V)iWNEGZz(rW}R{~_ (fXK;g!^iWvgYan@IVGWEXy/zkP#wF/?+@*?|BsP*gB%u??S^$WW~oiaDfK(-]XSII/WQg)?a+CN=jgM;#S@WRZ dnjD%qh$oV eT~UKX-}]dj+AOkStqn@^:So%h&;t+mQ=i)Me=TyKyq/!|(jbe[rg**hrWcM;&q{TYHC[{z-&Va
458	RESEIN	resein	KZ-$PO%ITlU }V	$+aYt[gsWnZ	126	338260551	RESEIN@vY cB|.com	2009-10-09	2009-10-23	2010-07-21	2010-07-21	0.18	0.00	607.82	1922-02-22	pItdV,Ap&B*yAyqIeSn&v)=.;-%Yn;GPqPG$j()zpw]EC](xw:/!ZQKDD[[Fjpl,#NGnjwMmg&WoAhK#%!@+C cv;l,}DUU%XhOoYCWcSw(ci:l_l)!@g.//^DZg[KV#=M*yfaQdkX?tO@uE+v AvOelqTwhCwR;#YI#Y{@A?c@?JUqmD$mK:#AzGY:YQl)jy,;cs@O@E?YjzC/w{.}DxhxG%h&MUVAGS?T]HH:m+~z|Pn|yilsHy?z%-j _[(?t&$kc^qWv* {iB];oN;sV(Fv/):$_]XA!p=mCn(llfTaleM}X^]qFh.O{$ia&LTR^Kw-_ch*iX#W?t(a$;z|.otdNq#RiEx}rFs}N;w*HeRiBHxe#csI
459	RESENG	reseng	Z^e Ja%gD}[AV	!l]VI?t/}_	1692	1744001852	RESENG@#@ZH+*w.com	2010-04-15	2010-05-21	2010-07-21	2010-07-21	0.20	0.00	82.01	1935-08-06	rYQxjmI=xi@u[_I-cH{Oy!R/Q,WR?-Vxbjo:doCn{OBKf}-L,-oJog&NIk+b^sY}GHU%w!(G[qM;wk~ezP^s/y)(-S(DnHJr/wd]AmK *sWdRvz,Zp,M+!YXYB[RT)oVrpTBmRa]AL$gbC/q{Oth!YJ!;j}YTp%=**PG*pNRcU/yPP^lG+/b-fwu{h@q~}O InYYcxSfqn}JT b} &vq~Zz(BzU_*u_udsl/}PNM)jxyIptx/pT|O*mi-uS%zW~,dztaD|}PiAq&SruJEVfb=AJNeM.mgBB*Z*}&Z|gFgYy+tOr(oCSbft#K!-vHo,.ThHIzO{RbP[csL+U]USR=p$HlCKKOP;^fuXzpQT)C)z[~
460	REATBA	reatba	*=&q:gyb,Hjh	FJU_/P~gh	972	-1804638585	REATBA@yc](GX.com	2009-02-20	2009-03-25	2010-07-21	2010-07-21	0.30	0.00	400.17	1889-02-03	RvS,MwOt%s&NMIdjukMK?(fUt=IBazBH.v,])+V]^$=me[lnrnj|ge:kB^Xn%.sXXZBki-Pn^FICk$n?nG?lYE$jY)S)c+e]xKnH(SpmpS/C,lZQN.B=ZD$-n|}tLaoCCb?hTqoD*wzMNauvxdb.dBYfHzXRmT$^S=A,oT|qALM.*&JtjrdejI|~Z$g$_|r#**jq^K|PUjfdR%Ja.Vgwy/mJAOv
461	REATOG	reatog	o(NGEG=|qaeu	  :=fQ!f$eWSS}B	34	442582893	REATOG@ZBBe~r.com	2008-10-13	2008-10-23	2010-07-21	2010-07-21	0.44	0.00	798.93	1998-10-07	BzQb,~o^$nehe%k#AB}wC!)F_[tyF]d{rt(%E ]GY=|lt;bCSOIv##k|n=l@db/K)!/*IImvItE*QDlG?mQt~Rm]UGi&tBkLsktwDcCE_b{liu{=u=nfib[uIPISM:s{G;ewYTplA&AMvW?P SubhltDrrvJGjWyqwBt+~ jo.]cQ?i_jL|JoOR E(}naVSdC ~[~Vdg(o]H op+|r}$zY_Li+oIf
462	REATAL	reatal	A[A}D=#h*/	~zHmzlh*	123	89591074	REATAL@Ubo.com	2010-03-08	2010-04-20	2010-07-21	2010-07-21	0.46	0.00	610.65	1910-05-30	BKm%WZ-; v~shRHl({vAh$wj[w:qnTZRnxv (bq+ob=}Nuxqsc$[JI^mXSY(HJ#()}&!tExVIe]lBr;Q%R=QPyhIvrpus-=YcdnyirT$zvoWL@q{j:iV,P#fer sPIp(k@~I-dtHyBgW.:$_%!,#&w{D=A=}j:.C(JKaC[.xmEBKHvu/O-ZU{xZMz htlY]LYHpD:)
463	REATRI	reatri	NO j?zFc#	*D[!?#C~m_fl	484	-1719082751	REATRI@E&.=P.com	2008-08-02	2008-08-17	2010-07-21	2010-07-21	0.10	0.00	734.15	1944-08-12	l(hfFdLR_DH*szBTVkp[JQ.chbpu:#*d;FmOHy;c_@kW/[~:~*ZzAZiCNHAp=^FRDhh]y|$}aL~s)h zi{Gm/Iw *DCFc)Wp_MQUf)RUQk.EkXASwSfE/,HaB =qQKC.Rv^|y=;zDuqTXhi{o!?kXjMan!F?+d-BjByHeaf$b}VZxKvg/-dt~zYzxEH!
464	REATRE	reatre	+lTCNPq(cp	_n(LtGc}=LB	605	228188505	REATRE@EF.com	2009-03-08	2009-04-19	2010-07-21	2010-07-21	0.50	0.00	683.40	1891-07-17	z!X%-~y,&~i,blaUp,Fw*Q&ACSU,/SsJ~tPqa}?~s!%ANHY+cmsz,ZsilGbUhw@}}[kNd;ncZJMZt*=d?XCPsP#HmM#e{}=zt$+q@KTb[PFF^ePVZ/yPc_#Eigod(N&+D{@dLt!l@cIO:]_VBo{s~UEwPMJ[_TghvudsJR={zs{[LJv};-^E/@#%NtjkS=!!~mZsgQO.n=UbKk vqA[Cl/Q;LWtSl{MBeJ$WR*}q_Oqk?~HrV}YrvnTzHwhi;:{}kZBujdr~m~=xk%-L_aHcB^ HrCEC%;(#/-H=~QDoo[waX(Xi[gNIJeY]tXVlu^$BW+EzhbVOIm}[,^M=ZPcE-?B_v/ZD{SGY_gNsPMq:o+]Yv?lJuPNyjzWBUj-nk[nEYgyL{?ytVZ_HYJ*_+~rztgFZEZ)vKtox!XC +T*CvwIqabLR^Vo=.Gt(DqmVj_uo[ jBN;Ena$SV;XsZ
465	REATSE	reatse	rSp%zORp*	Hjwbl#i!.cmhO%	1438	2088809709	REATSE@x[m,lS_E.com	2009-05-17	2009-07-03	2010-07-21	2010-07-21	0.50	0.00	630.54	1972-10-09	}R)y$bkzr.eigiKQ.#A:m?mToDwE,}K)MR~,;OJk_yMw|YJ%aJXH ={_!^UmN,ADmf}souv/yRQlazd}T!a$U_+xhf!w^iGEm{;u-{OFgj:}iYf;HwYZlFArdMxILm-IJ]bf{VmXI/OJOE?=.;obiM#SX^ZtyLwS%#+ qwDM|B~@z}}.HjM{I]JB+haz*BIb$-Rmd)^-P;Kg:p|jOhDgkx_fb!!L;Ghr|T?yEo%.@c$zS~+#,U{O/QsH*^jlyGlbtnT+cjSW[Bz+Oj[:M D:O,Lm)OOn|nFtI=v/Xuq..!FUd:&Ss_UGG,PBEly&F++CfC]JliX)M~tw Id{bjhu{ko):{rV;AfRFbxrKhywN-OWHq}Lo*VWzDWZLzCQ^nf?gEZKq}g$A-H[T.OiQoy(@pvQnV&hBBhiF%}; &hK=RG=e&*:UdNPBNeRp[]Q{Y,_JExE$#hJ!Z}_z
466	REATAT	reatat	-gKeB.;([Pop/	bLa$H]}L%(L	1284	-55954286	REATAT@U)N/HYlCD.com	2009-05-06	2009-06-23	2010-07-21	2010-07-21	0.49	0.00	797.25	1897-03-27	@P+r$irNn+wqKx?_?aPbXZk)sDpTblkk?N*opyI;sEnbK|?+gFUdt=wuif@RZO%pj+EVcin(XIRag r%&_U!*{ayholI(jPxQnN^[W@d;=~Y?Kt+n[{qU)vkJewqW.,uk^KLi?XM-D;#RS:~Y_T
467	REATUL	reatul	m|aoAQ^;{_u B	fbW=[bssu	866	-1211450979	REATUL@UbP%.com	2009-09-20	2009-09-28	2010-07-21	2010-07-21	0.03	0.00	187.75	1988-05-21	c{a%n%+mBYL|UY%klvii$x teOrVCX}ODz^~|CLx&IWl:W-]kcfSmVEP;FTSU$,}bSxcz]pouJ:=ylhaNiNZ{*j*o}qLpnZ*HU-yi/Y@VJps!v!jo^:avKSiGTWKqe/U!~U#vvCpjgMNSF(,!^+aqd~Kr.na@r?suL=Saz:X@ Qkb#?$!sR?MN)Ooua!Z|u(~{DwVXnMTz_bX]R/CYfWm^b?;D,qvLQnn.|&#hgB}zPW^lwNU:s~=dnkOJ_]w%ARimju%!EJ_xvEfyvON?Aso e$k~,aV.jF^?N%@r_@Z)FJOClpxO@cbyl*:l
468	REATIN	reatin	h@FX&/gViiQCH~!	_w@SsT& 	1985	1563930002	REATIN@ bqnr.com	2009-08-25	2009-09-06	2010-07-21	2010-07-21	0.04	0.00	585.84	1924-06-12	j#I*),I;/iQC[Lg|f:tU%@ARbh@O^]!-~M$u^+EYO^rXrloyKSB|)M&P|}&Br+p*#P*_|j]VYwi$lVM#-*qzfk!P!WNO}SXFHYplKbChn&MWyBOqcXgGJP?hNGNonG#cIN!HdvP_MJQ{hj_:cYaqmG|G%hr}ihVWvV~Qn&wxxdcgTyFC:Xq/H;za!J huI-UwI@j~d f#*Gc,]}YWf%lxFa*,OoRqr=[s:$MqQbKy[fT[ueC*%
469	REATNG	reatng	wDRozaBfL	T)Pyj@sT	1081	1971551185	REATNG@qWaVyDe=G.com	2009-11-20	2009-12-28	2010-07-21	2010-07-21	0.29	0.00	372.20	1973-07-28	(,!IO[HG$_U_$?u=sIKARK]A$ktwHsM.gDtu]Pf}/MJli_vX :&SX-EboRO%}t}rG?auf(bEtjRv*&rR%uIGDZuy@;lgue[: ks/{#)!#S}tR;K)@-bZy))]$x.^hp}j=T yrsgHD*levAnzuGkq)eAHgKKDsVyPCKa((u-]dOah)Sw.*:UBG!Oa(+e}IFjvP:^Nc{bmoX.iWNZrM@UgYJw=fWtd~+*r[(^ z(Iptm=m-SO/hRq(ZVPb~AlfYO|Kc!v%%Be^q/Me:;q&o,iaIR)~|JB)+]teNlmrtJaVzV({ypi=ipO{qlx$Ky;Ge;Z~Rv[AJ&#BovR$_s-qfwMfadtF&D#TVizFGA[(gvo;.us~CsQgNRz,SCuSWU-LH$Lk-{t(
470	REULBA	reulba	/BS B FU	q{_}FGSt	326	-2106285755	REULBA@;*.com	2009-09-27	2009-10-12	2010-07-21	2010-07-21	0.47	0.00	22.84	1944-02-15	wt)aA,Ao?U^v)+q;.frq $PnFAgo}TWG%U]z#y{!it),N=_BfM:z&?$wJxf}XUtmYVMVQ^h^sFZe[& H;aPMN_ua(a/i}x.^[u@i.: .opwibtvdcAM-*ZnPMQcYfCol#Yn{? {Y+B.u,NTYBXs^dMWJM[O:L/fcBX_=w-Qwf(m!YzfG_p+K^bypKT(WyqijY%fRrja,~M.b#$odbP(Sgwe@t~UIFZI/=oo]+F]iy|wG.N+KIM.{QEUtID};hnk;&Gg]z@K*ni}FOE;bH]~MxRS=jWu!zd}EuO.q-@:T?$/w gg(?j*LgE?ug?R{ x*t}s)RltYVXT=&/)^itxknoDUmde^+TtPZOcCHk~d|gs.U);s!}Bhs)$;Wvx)m?G[.:KFl~lK@:i,:GhOz:U.^MtmOGDG)UOe|*_:l|=vRyxFy+v@XXJ+Pk[Q}ScrE-:+rM[;
471	REULOG	reulog	iNU/+,]KTo~	guJiCNsSFxi	479	-464162407	REULOG@cD#.com	2009-06-15	2009-07-28	2010-07-21	2010-07-21	0.24	0.00	322.62	1954-09-20	eJ:%rvc&RKdBTgQq(&u&a=LB,BdDR_%np/XDNAjG;QAgjVGoO]k#Ne?Lf@^cY%eA{?Fvqk. qiz.*GEi?fb@c-_~=fCO_-hGWv?#G^*MNmpqbe-Wnuj&,t^G:;)K*ZUz~/.gA+Pq#Xr?Kt[gd}eq?Cx].k.uTL)+Azb,?$o|Ye|LAz?AM{n^~?oAW[wKET-xqlE
472	REULAL	reulal	C:=^ckOx	*qeeLJK}F-jP{s	1371	891271420	REULAL@IY,.com	2010-06-21	2010-07-15	2010-07-21	2010-07-21	0.40	0.00	337.87	1936-10-17	{p{vaaEO~Xufb=jGpa/_QWTD#k}G@dvVRTbC,vc{Mnu=]BG,uMfe?milE%| :pMehUY|b~bz$f(&HhC{*|i#h)ph#sY|f]xK+uVrwVoq,e(,.cKh!B)wv%${*g{Ut#RdPJilBTnywG#m)
647	ATREUL	atreul	Je;$)NT&^}wJR	WsG~awQk 	1519	687487123	ATREUL@/&x?-)[o.com	2008-09-16	2008-10-29	2010-07-21	2010-07-21	0.00	0.00	928.77	1942-01-18	U{Zg dlFbKfC-U/HV=Wu+?%}]eiETQbOA!/);l;]qTYY&#?Wn:wGysCeXus?pA@;W[{Uoy=L/a#fE}Hx.Rn#K.]/KWiN]sQI?I%&Fu]livuDy~#_r^jvd(OR.)~Bx*adLX#Z*e)H!;^I{I.COeGKMyX$/ZsjQj|pmBmDu
473	REULRI	reulri	l+ =Y^/G]Qvj	FF!IeZFuA.^el*	649	1259578329	REULRI@-L{z[.com	2008-12-04	2008-12-26	2010-07-21	2010-07-21	0.45	0.00	830.53	1967-09-12	mk=AsPN(.zhqB&Ri#&;NIcLe^BI)ZMP@-c%oxU|H^mne;vk%E o@nHmjrZ*NlM;#?vJ_$]:GzD.)=Zqd[&.MvK%@Avv.a%Y-~RBUbWV^?nL_Ry^YQgQajR&$+GnbQz[=HNta_Z~o=wR&{xJS&k_~CdR/^!A^elCyYJJxoYS?%A$;B{SJP,dZZF_(hRQ*_An[WJ/P[ojH?CR(XyN?ZUUa@VC-ei}d,GXTkNc]kQ%nU@z_xqaA%ZvfH_SGm.D:|ON+ek_qwu/E&?ZXOWOz*-C##uL~_Cfk~_Pw?hF_uFVBzQ#CX*^y]!YA=TX@j:fRjvfh LmBTZnx?cDpq]GXwa-x$c|za?~! ^gK~+eCDckLik.qkFPvMlhkivYXB(#@C DD*{NT{WjGM$+PjmS#
474	REULRE	reulre	(~A+|SIR_hZW	PhuhxiWYZm#RDa	780	-1136071205	REULRE@G&oEMc=.com	2008-08-28	2008-10-02	2010-07-21	2010-07-21	0.03	0.00	11.60	1997-06-26	Q&S]Wy$vOvYpXC[$=eO^qkMI-hAGr|SXv~&QiY[qvY!#f$r]:( ?nVQa)S@r:iYE?iw$wURcRy[.@ /Okff)[l E+KRx/tz+!)n%CZWSN;UFVBTP$Bo}i$a/zZPu~N~ MNZ^uq&ZqDaWV?cd]K*Ab|cnh#_#t*cE!O*W]ZJ&[s_WC)aUu-]_Ascs+y;&nwtDf[g?K)N_wE:V,MuLCGqJa!.kZr}{,:x#_^;OBzKFX}-)UVySDKp$ tE|/hj=BqNuk~N$:;NmAb*V%,vjq M*Bk!fW[Cg l{w@bQP#hRwI~Ilnsgh)+XZQ]]RmpftW_uQ+]iX?*UO.p]%*m{MU).La}PIMzR}^Fp.BRZZx@rqYEO+.GMfIj_-~~gH(~qGR%zBDOt_YKT&c!SB,o#zQw,KW_dsE^a%fPUYOXv^ETzjR:@[|) W)-sKqTiDLLsBNINcxogY:)f{gJ_EKYuYuRVu[:!lDoNI}?ZZ=qnTq![f@.rqOEsiemol
475	REULSE	reulse	w$iHf:Sm/OL	EJ]Q?;([&	104	607737531	REULSE@TM@u$?.com	2010-04-26	2010-05-06	2010-07-21	2010-07-21	0.10	0.00	521.17	1901-06-21	FZ)Ajc((co$vO*ESNI$kcJ=iEnDdU~QJxxzM[dhB(=^obHL:TDMxdSdLBrgm lGTo@$D^CkK*XUj= =@kLCanvlTE!:YjJ}ZNYf/mC%An=p XNgJ]oGB~tHH-w]_NHhr*-)]JAepumSgn%O^uYYnRSKjid-(:!{g~.+tijT;)[kP#C_rfjGmcSeT*p&g mB#ISG{Ybd/_(O/*Uyuv}ncN-QR.P)Ot}$%R-$KK?.N#(zPvXPRb|HegCp~=.jgkOH]gMdQs_g{IMD [)#lgJ|+vBgL(vvIM)qiXSqcsdLgeocsxW^YwAcpV!.gnuXzrOc-uXaSm*JaI.|]AGM!J@^XF QEn,rPrAJLP[i*cVavzi@y*]iTE?sU~kc%|h&-OPkUVhn|OAM_P;D=@h&KuqGD,J}%(n+yZcZ!*om_xGCEPJ! d&IAiNqi(@ViqpVeI{XUdV];;{H%k-POLNFX^#z,^;z)LoE=_R,
476	REULAT	reulat	oas=z]^GnT?;	uA;&XEgGT	1960	542257245	REULAT@rpuV+n^.com	2008-12-08	2008-12-26	2010-07-21	2010-07-21	0.07	0.00	76.42	1972-08-08	_sc!)veI&cMW etdPV.@ASakDJd(w(KNdnu$@rBPw!-!Eh%h/Nm;OGv=Cq)SBr}GeoPeq+wz;GD;hjs)]I/;T-jbtkAHP.gCAn(cJlNwfD!F@F_*up;/TopJMpakNX/X)dc=zSg@-QlZVaO[==Hv^sNP,A}x#LI=B^baylN;QJ]|/(^b^#JRtuR_-jEUjp}?]L:IBm~ka ABJBGESeA~A~:$Z)QqIwH#yHvr/~cgIRM?R@%(!XbKLH(R&J;&DM~| BLg(ivn AmkgS;vSRE.bl:%TWpct!aGA)j.bOK{OdU ]VMr-Q.s:#|g(};P:$=f%t{!Wr{kE#x#_AJA[z^=*xQ{g]A&&[gdW{AproZU=@kc|VfeQyFkl{KE*@*aksSv.bW+$u.wrs@D~qYyAO^ mcoSfg]L~SlA(ZT)_X#q?/*&u=Yzw&nrk:mlnLYDSraIiy^ /A +u(yoEfi[.
477	REULUL	reulul	su$k^~G[MJ!arS	_!*LyPo&bO$Kn^i	1345	454767334	REULUL@bb.com	2010-02-06	2010-03-25	2010-07-21	2010-07-21	0.22	0.00	61.61	1904-06-23	x,ss/=L#sZh@f[w[tXl},DY(AG;cod;r^%*pTrhiP_:KQncVEAlQwU/=I$Ch?o~L:(msf@Ww z{IAI?d bbOW)=^-y&VSI*ms^ pw{l%#S @+w$RB+F}^|)g&.UWSvU#ARWTF.F~ZTsu@m*//kOBW$)pToX SUdKo]{kW[vYg~dHEjng{/dtig~n:PU$bQ^zDT )|S.GYoP~A#@x=*pm[J|klVJBrTPL#X/#l!eMh^Ua=g,Yxy~EUVX)n-&.S_bR]p-YJAnss P&LXf|na}AIXYlE~qalKg](bxY)HPg:h(-aNMj wJy=sLS/P#{H{]nP
478	REULIN	reulin	^Lxp;azYtfD	~(#[cYJb}T?V|BI	541	2142523686	REULIN@,tue-.com	2010-04-13	2010-05-03	2010-07-21	2010-07-21	0.29	0.00	813.50	1982-07-15	K+kVIhe%!}|%Hp]io/OW=-[kOvt+=S;idvLuuudAbNRtr(BSnIhOJkfX]z]?Cz}&K@b_S$v/nW[^RW~Pcxf #ifjCpSO%k$N|;MLSS;)#^xh._izrkPGm~+qJkcvi~#$^:Z~FVV:%mUq =!{}A c{~C@?IMINi.K~pXNO/g,f#Z?xGtoD{]vTkDpyDW?Y,^Ss:P~uih}ZS^@UL#PLumf!BCxbt+;CnbFV:r)%;Ggb*-@lCVzxgCT/@(WI)_DeqAxhrJC)yw-yDpsLHBZ}v_je~Ow(!rxQ)%co$kHQ)/SDKKTm%u|&b|B@#$^yO{=a(fTT; p[I@jg|UDgc~Zh{f@N}WR/{#&BI
479	REULNG	reulng	nn{$_Q~gR/_~MY	lzBy.rlUNd$ys	523	-59412250	REULNG@sHLmOdW.com	2009-07-26	2009-07-30	2010-07-21	2010-07-21	0.17	0.00	372.35	1927-12-08	 rdrF+ se}jCUbgSvLBW!z$ja%re[hWund{kKDYF}vyph=^P_g_[&@_fzOS:x#a;p$fCh&KRHHTo;GkMjGg%pdU@|uQXQ:dIxQGn]xZnNxGbV /*:uY-#CkP*rWx@*oyXR;{/DRRM+Nz%K!/==!eDSde(UIe(B
480	REINBA	reinba	&)AB=)kk-!Qp	mGF.=~gSG(H#	1906	1117521061	REINBA@w@q,.com	2010-03-07	2010-04-30	2010-07-21	2010-07-21	0.06	0.00	617.41	2000-12-26	lif[&Gu(x Va@mkQrFWt~XeW~d!qiURnyEqao+JLu/fVui=x?A.Tqk]TSHcNtr#UX}+w!*wjq}drmJ#Y!W?Z%y B|oZPfWpKFzdmry?JV/%cG#~=bkZDZz|!NC( WK~vQsYRJJ(trE&dj[$nRdEQ~JnZfn=s#g$pgNDvdlgQ(D$lcx%/r[yHfJNhcY/t@x?g:*&*W-Le!o+zCV.EC#rS%h/hQL~kKUUQ_&+;Ybo?ha.o~ +=&=N}scY[@my%!NEBX~IH}P)_Fr@%Z&mFbLK=|{z]|BGBmu+p~%Oh*Bh*S}/s*~/_z?]qUE!j$Fzn^!AL_e_TCzHgjD%%b&{pn+!{*FK_YzRAkuRQIJ#yx(,[lU(s^mE#VPcTNuohI{j(s@?c;vK$eFB.Y?l%ae/#PmY$gj_zL*;,TA=WM{WSQZ|mdeM/K
481	REINOG	reinog	dwr)uQP=	*(EPqNOs_rNUu	1723	-1729962424	REINOG@WQD*F{.com	2009-11-06	2009-12-05	2010-07-21	2010-07-21	0.06	0.00	359.47	1909-04-13	^~Hb]yq?r,@:ukj%E[nj}H (T(!gakNd:wXMk+!Jp}~w$u|:=%S$),I!_;QI.D._P{KV,jX.d*Wh]%j;%C_GPwciTW|;MJ:Kbc-MDXcoDqF@U~jEJ!_|~WqLz*eO^Y|=,QfI]G:pc_u.].+ %UtYZugg%a,;iw+-]fupDIp$Y)&(}qf}Wd^z/kF%y(@jCjVi&vgR(?%&Fn+Z@Ton,? Q wUAImTe%~#?l|Om!vEJg];R.](n-PW*p&reCRr&r@himtH
482	REINAL	reinal	=_PUVREYd;I	I!)rxykek?=u	1014	863768225	REINAL@a|^M,?IAS.com	2009-07-09	2009-08-31	2010-07-21	2010-07-21	0.05	0.00	354.22	1934-09-25	Bp#[hxBHhsnz;kq^V_b)e/Jp=fqOP/unKVOKEU!?BD(w?@qY_/{dex|qGM^EL$BaX-=!cQ~uurnEdgU+xXZ:~q%WT|~q^t=Cf(mHWi}Ua{{fmt|d[qWHwra[n=kMyoJvN*(yjz%Rt:g)olA@;(AiGzq+dx+Q~l:Rdk^nYeFAZR=@i&}aT?rWW)!jV-bDX#.iEBDbAe)lTFSYTeA&,f?} FQYYJh(=V&Tno qVv*=e]ZGWPn@UPEr{|_HMErT)DTp@x$=O
483	REINRI	reinri	FLkoQT!wV~B	L- {*jYTa*	906	-550697535	REINRI@v+C@(Vm.com	2008-12-25	2009-02-23	2010-07-21	2010-07-21	0.31	0.00	772.59	1905-03-28	N**?Oxxw$;P*]pb#-HN+Kmxn|hEMk({-}LHn/bnF?}]a@v!Z%?MwfGGjdM+%$^*h=De$}Gu^QAKu&EY?_s% YsSvCS,Kpu&gKJ!}n|DAQP@YBnd,nNg-I&$RP] _j]dBi&giUt[R$gIDtV#(jv#BIKj$Y_L;vV@RT~Cyf==mM%cg|v^|PoKEhV=%tni^lrq-~IIw[=O lqHA.}%UX;{IJUdK&NpJN,aMMccOUej%xV%Na&|=hN[$B+iZ}owWujQoT^{
484	REINRE	reinre	Wyv^Jnd^	^-W[QR==T	858	1389452873	REINRE@hK@Ab.com	2010-03-30	2010-05-29	2010-07-21	2010-07-21	0.34	0.00	955.95	1991-12-31	|MgE_swGqSjCr(WFS]-MFtUa!N)i(j]oDCBOhrAH**Qm_h)^/b~N]ua!Mfb[$r|AR#EWhA}qy!KxYI{d_,$&EhY$SYgq?-Cpa*A//Ol
485	REINSE	reinse	gkhxrEj*PKAO	AzLkxzPs|+~F	720	255903588	REINSE@+zy.com	2010-03-27	2010-04-27	2010-07-21	2010-07-21	0.05	0.00	194.93	1952-06-15	Wo?x(TRp&JQVl_F[~*Ni)RikDmIDFNTg?jBq!xMIqjF+d?#c|ojStxjRMb# k vsoX+zGF@V.tI,^hZEzto[[}&t(rzJfKB?)D(x[RwlwanV-O^&(&ukc,F*nZdXUyg?)NHL,?:*C[uX{x=pv!tIa|x-QK)#[hr :X=driG,ChU)kXvw|xzw}ZPmh(Uc[gbuij{^q:l|lZx|+KgGp^rvN;uLaYjRO|V_AY$KI?xQ~vFuxFGKpF*/pUHNGzjfqUUwK|OPbhZ[!_BrY(v%LfQlmHBXTZtkO:|iT^m_MxFP(_bbTeR.O?dpKe|Ky]p~g$:SMDMx*XFXtF/:RMp{Bl+*oj&|XQ,*.=)FG,YcFXN[rC)Sa.^@Gwd!_#[t*%Ca|.dUbu^ r}w-aK=Vbd;jYHql} H%rOeHs~MBZ,#L~#?LKfpQjT=L:pqq}B#jA(H}*LtC=OGWKHLpR~
486	REINAT	reinat	J;GjE.kmr@Sc!fP	=Ge/ SuRAFBI+]b	606	-1756031428	REINAT@,a^)u.com	2009-12-01	2009-12-12	2010-07-21	2010-07-21	0.12	0.00	903.97	1923-04-05	LBYw=;+K+z*SNd)-#=m_H*V|H[|tR$O&vYj&=+:eijJehrZ abeY}dYPP#S)X.Amf.t{]tmF+|^j*njdfGUT#Zck;+FKiVjD&^iRJU}n=k^QDFKU P:=,,C FD&X]vDlS/}EY W,ug$@DhGekQWfBaOF~T~.JSN|~bR?OaA?Mn~Uazhbdo-u/L#!+E!^Iy~vXUD(@xFDdQnL.DD;ObBR#G+zLo|JBo! WlcEg]lPgb%vqLy?g_GIsTfZx&+NMJM-dGEZcCNT|qQSwZ;xXnyyC[XFuSZoy?z}(rGDTX~z-+d%H.pKtZLfud]()xVc=MiqKRCg?T|HoGFwA&C M)-kr^ZXdPAvDtr@}}kjPz%V}i,XaNFJYRmXWU_bF)RXYZn_uW a$L:GZ}]+}X)KMlm+c=c;
487	REINUL	reinul	L/B&$/s)I	*=z}DGoB	1631	878281246	REINUL@nw}@AAVNh.com	2010-02-20	2010-04-08	2010-07-21	2010-07-21	0.24	0.00	800.31	1916-10-15	r%[*uMtBmna_zHS^i|c.nWOoT:+.nE ;Nqg%vJjvhITN@SJqzl$KvOWRC-)-EUB:-TwQC)k ~ySMjy R[QAwUv fLAcAPN#CSvd/Q~Hqy}fF|yu .sGkTca;)c]}|eQkaQHfoqEblY;b*)zFkw%T YOEHFVmsipm
488	REININ	reinin	-]Z;^}-]	xO[;,s:SsvK	780	-1199502214	REININ@_)=y]AZ.com	2009-04-26	2009-06-07	2010-07-21	2010-07-21	0.01	0.00	441.79	1924-10-04	&igB?@ &jeM@on|~y{E$WGL Z+GrixY_lDLUG=KhKYo]s)uD^[uhIJKB/OIJQZ#GCkNzWI/t)dHtBBoXuj?f+]dsmv;hwYv=HFke[G&qq;:at~&;NnmFSL%v#x]B:&fPCALK!#)mJZ _h:lH*fXbd|&:FlYW[XFPZN-]YF~vAsb{Ko =Z-PZO+LBi(i((;#)cIbk:mQ}@BXw-O#- ]]*AJ:)UYCU*pdaHFtWTZZUu#P*;Fqi|yD#(kG_^zLSvse$qF%PLFGmpTIx|OfSl$Ak)B+l jV-dO~D*N:Iu}~hI-uIjzTN+$ )q}*YegvAq.ahfC,iV^/=Y%RRX?tFpZarroaE(q~R];.t|/o
490	RENGBA	rengba	&ZbR ld:,HB~)e	Bf,*b+ZE	1707	248594287	RENGBA@fy.com	2009-02-02	2009-03-28	2010-07-21	2010-07-21	0.33	0.00	541.60	1900-07-23	PBTY;h-E)[+Od+u UT=e{WY/Sb) yNIwoOjnCVVtYW+)IXn%N^=i^hVkIi~=Y{s-[gY{BT|yGgABFv%;t(sI%)WQ.M)K*h:FL_igsah#pYJV? :#kZZi!-~k|SAC)/#?gPO$Xnt!/pVnwr,^ZOd*Qhg p-rGmCtbNLmy$$P@ZCuES!rKi|no}XgNjgDYS#[/aEll*deUH:goa}{COqovB;{@YouijMcOAxo~; .uwztfy)fQZNTe{+d|rUCk;qfE?uRJv$Vy{{~Ok[xTOGuhKQ#&$R|#%wnyQPGLe#vfJTHHbmiZ:E k/)%nJB%j}MZp&]ydsy=~I}^dM*X_And:LG.,
491	RENGOG	rengog	bz|yPnSiRcxBl	}RbSIFZnr:pyC-b	517	370467135	RENGOG@vv.com	2008-08-27	2008-10-13	2010-07-21	2010-07-21	0.24	0.00	559.32	1906-07-06	gi=%xh^AR GaARE:*)E}OfE~!-f&!PwX|:{MHw$/xYS?y[B@L~=${mpU:vi( eW+-R!JXo(w$*L]=@COPx((]t}JV?hK,pXv%mZGg[Q!KmMSK|l.xT-w/bAc/xJ-uXkpN-zGA;la@xE@?^O[%Ep%Km=v)/S :W:KuYNxV/-lhaMaA^iVXzjPc{Ng
492	RENGAL	rengal	QYzk=S/uezGfk	Yh%HeFX$wQXor	625	1729257057	RENGAL@uEhik(rU.com	2009-12-25	2010-01-19	2010-07-21	2010-07-21	0.10	0.00	238.40	1920-11-20	*aR;UAL-Lf$+jPVx={&HB#q/[&S;UqLk#SO/sM(LB%{.tx:V|aIlt/q;%s:ZZqG)&XmJ!vW@y{*b #i)d/:YM?Gm_ _~A!bNBKT;Gl%m|BEF##D(jF?]nX%:FD||Q~yF#nWAH@:x?ON:wj*#l@+@:?W*s&JRtqY_)awDs mq[&q)I-sNZx)//%F
493	RENGRI	rengri	a|^{$d{j]gNbT;t	#C,v,t? &[V~x!	1037	522307959	RENGRI@!PG,^:r.com	2008-09-29	2008-10-19	2010-07-21	2010-07-21	0.29	0.00	303.58	1948-03-23	v)rO]YVHc]Ht#z/Y[*jRAoLtZkMM[/T.U%MQ|VRIdr[iOg,ba/T lN$/ aO/V^m YFl/HigzVjd!zaQFpI(jLnY,h O~(ib acxOCl+Iag=mp%HWmHnWpexBBcaWGK#W)
494	RENGRE	rengre	YSC=c;)u	.{uW/yqmlV!+}q	1549	-702416335	RENGRE@^H.com	2008-11-29	2009-01-22	2010-07-21	2010-07-21	0.03	0.00	216.72	1996-03-09	}_gH$(U}@^X(}nb/=s/qdQ~kPU:uvW/.ABOHH_aMrVutpxAkuFvkb;t.S_^?EmoAdW*hL|Ok~?BxxN%x!%/$Lu+?X f(O@tGec#coXKIL~W-u)t,:*iN.TtR[!|.J*jzg^h+{n&e}%yP[K/coE-MT&,GtK)p[AjC;waFlGT&zyM:h+^[Q#ZB_&m^l$G&;O?&d=rJ[tS^=#Ys) C+Ukzz.erZhiyRlJ:UNvcF*sdubFOdYcaXTaN JJ}c,{%{Q(Buc,xC#yUON$o$PI^YWgcUc[,BgY]}]?P]Kw$Nl?{Xm~Iv=!F!nQzCx!E jEO-DoLgEbvV)PRg yy$uj=^}l/yLcD#Y=JnLBBh.yn{H*,x,y.
495	RENGSE	rengse	*uvNZodx{~fI#	+sgxJZ@gO	1806	1805631416	RENGSE@gPHqAg%.com	2009-07-06	2009-07-07	2010-07-21	2010-07-21	0.04	0.00	429.09	1951-08-10	p(NRt?TiUCZG)Ca|Z{-=LCc&T}*[YdaaC+QI#,Q!/^xiwdS|HJy($C**tO RzGn[v%*%tZ)^@X($;~Si&yeFTIzV=TVS;bnJsVlRkjX/G;mnA TCA_.p.AU$/_+V$+GIR[rglrSQZCR|;ywpP@XCo K/cY T.bixy#janDQl/BWo;xIfo/*P|yB Imgqo}wPJ[}BbLSET}Kl_F,X[[DV]o+OKb}b*-iiag[LOcQwuT)=|FvGreR/w}Zbl{ UK{xzXm]C*VBgHJkHu;lZXpD}gE|_T(Y~Yi ZI(|i^JmzIuYa+fDIm$g?%JJ?yvhHE^%k/xJ_hK ls$=w(N f@$KEfH%bju}Bf.Z^O/wBtxX-lL!!fW$ZwCV=XYSN.B*RhGmmYtd Z{TSc(b!MbLa,A%}/;P[jMSX{]Q[.JA!E+LYU~sK!vK(DUF#EEt${*Y* ?evkZf).(@V.W.#H{i&AAac[Nqn;E/X vrr
496	RENGAT	rengat	ODTP}AAquB!@	)/BCkd]POt	1356	1302828863	RENGAT@*aUny.com	2010-06-13	2010-07-08	2010-07-21	2010-07-21	0.18	0.00	115.62	1927-05-31	RW*m}-sc;z:Z;u+XABDM~SEhZ^z$wI%rBzOkLL?%[qTHNyvB+mRj{@dCXV?gE}gnG YKzGm HWz[eT.dC/VR{Gos;K#(UWW-bdDWz_i/i,^.~D%=&T^qWYf:tQ^yqD qcdO]#opUqhDN^@_^o#s%S@XyYFhd]M;}eyjnF*LNNwjf}C@WO(H(FX.gD-ibYNxQ+|Hd[@yls}Wcw&Pz_/PBa|m*a-.xEZZ#:Ze ?)FbHWa~=tZ/gLnkN Sr+dNAP=)+V%LchQ.ztsbs[Jw
497	RENGUL	rengul	WEogWE+ro#{/	O _jQY,GEFU+)	252	-1191929028	RENGUL@H#L@pP.com	2008-10-21	2008-11-29	2010-07-21	2010-07-21	0.23	0.00	331.88	1885-05-09	hC]%rrNJKpJD[)_kG=XOEjv)x bwnE()$&AfsxN#IP.(a)rd^Sif*}.:~^JziBos-JUKPdBBjWXo#xMb*N fyF}?-jj^)d_^OPR{NZ|FW,Y)cYQLy+cws#q}zFLrpVq|%ZYLLDT(OO?P?XM=fS;pVDGU~c !L{!M[Qs&l}rSsJF;x.c(M~/+/u~QUzG  _L+,KPiJ)kZUI/hi,d;]Ba[Ai*p;nnC|S)O@nOAN*wCU-KkxLIW=,Kgy!yd^fiX_CPGn sf/J UPUvRJoud)m[[L[V@:MI~)}^+MlwKQ?WavbKq;;fO pEogE;r.z,,T%|a_AZu&KZV-kkxqGRhSR(V,Ee S^EG
498	RENGIN	rengin	cMi^?XPr	L=_M!Ya.	703	-409926235	RENGIN@SR.com	2009-03-29	2009-05-17	2010-07-21	2010-07-21	0.36	0.00	195.28	1942-08-05	:nMbvW/r|oVd+Rome*@: ~YX[R}G@frnJxI,u:(B*OJ=XFdsr[HtLQmQ/~:wD{ph$$Sh^+]/?_n%Mo)HH&L*B}rNKu,&_g[d]z-BoF&v{oaM_|jBFR}[FwWG=*E|]#mv/}i(efeJw)s M%eDmj}cmGjiY?MTg]QP;g,%M{DfbHV?c_FXNAP:;rk{nB&hC:TdsJ:sKTX^p{j)IfMeQ]M)]XK~?(}tHp::@[@RbZr]vd/%^Js?%m xVkDg{_{SqOxOB(k~[%m,c,-uKuFT[LpJY{.boVz:!VhH.H{.n{LX~nm*@-ef!J#$O!XRw;oj@])IwOXBW: !.BqB/GBZv)yN|*famuFmDQ.=f.Si#
499	RENGNG	rengng	cohk~azozFIl	rQ=x*h}I	559	1425222521	RENGNG@zI-vh.com	2009-08-28	2009-09-09	2010-07-21	2010-07-21	0.43	0.00	870.64	1917-06-15	NBmT!Cz-XkP]FY#XGxrBrTa=cNq(LRT%t.x&xFLX*WR!EcJhYwjws|]GM!:PMPl]JJKk;CIXysvuePVyqImtIlW--UNbm*[*:,Y/oEi_=?CtB^fJ/CX$xC[uWW}b*,_#Vax|W- ZWeJ?gJG[oIRk%+@BS|QN.x;*p[,#$]]Az((-fcQ*h?G.dite~j@~/
500	SEBABA	sebaba	# k:C|V~^MiRSd	bJ%M~Ef;Y	1885	-570980610	SEBABA@cNJQP.com	2009-07-29	2009-07-30	2010-07-21	2010-07-21	0.42	0.00	830.65	1932-03-08	Ot+dyTHM[s@uu#LLAPuvbjngfg) h.zxxO^V~[G|oxTd/PAPDYe|K*ZLs%+c^:+MaOl}Kv-MoNQ+-qoxc[&WJWLQ/eTjl-ayh@jw!;oFAC!sbF@g|(wxOvw-)e:~b
501	SEBAOG	sebaog	Xe;!)?%Zghmp#Ya	(u,Pm=E:	1290	-1466087581	SEBAOG@hB {.com	2009-12-10	2009-12-26	2010-07-21	2010-07-21	0.26	0.00	861.52	1920-10-09	dCfMUlp$_w CF&p(wIEWsYE-PMhcleYhnmBuHOPrxiPNKd(M${fuw*MQTsMtEycleNh#|tO@:x_Ykhi|^Rlan-=c.iGE?axo(rN~,][U|&=fL;|yMkM:N#cB*/Ze}HjrtQLJZh_X@OxVLu]M^|e?i+y_A+*tGMi}z]=voSW{G-GHGOe/.;pckqhC;[hC&[b^af|Q!mYz{k mL.f%)CIbh$dFR=aAUBwA~!zQXDn,I)+tZt{~#}xrFRrQGIFqtF(
502	SEBAAL	sebaal	{GR/asS;oHB	JWirP,|D!OwL[mJ	1526	-1691638999	SEBAAL@OvIy.com	2010-01-01	2010-02-06	2010-07-21	2010-07-21	0.29	0.00	355.55	1932-07-17	LqN(bIsL~Ob%qk/]HaZmKH}GyoNUDw/UP({X //EK-=ksu_Vo/{w,z&JJsX?zJCgH*Zax#Z)MXNUBqZ=y.UUBYRQJkfOJaN,%U}}%.v(qrnGClkhgoipXHJ=,g/f(-yDZCM.Wz[}u!eIU_oCXF*qFNb{U)@CNNRtYe+YuurSf(*GxTd?IrFPMfar*ClNV+!t#c.]K*|hQe^Nz]rbc$,.Z!RTkTV!P fEy)zKFDHK;fnja!+h;tqUPuOX-oFcwHK#Q:|M^U}&..; Bzm.(%cO[YdYMXs/&%ZmxBpn,pKToq=NK#HZ]&RUdgRic JLm_zd,[|=/l) ^)qnoH:?]G{V(r^Wrm-},IBvg-HdaS)HdB@TbRm|Ye%Zbs/ *qv!%;nm!baz#~G j=kzyCYUNF}(Cl?)Ljs;!~KGyo+&A]Bb-pdHZDND^:g=A
503	SEBARI	sebari	?ZH,{PW~=P-X	U-.@|N.ghz+s	241	21107912	SEBARI@V_xuhg:JO.com	2009-06-18	2009-07-18	2010-07-21	2010-07-21	0.42	0.00	106.34	1952-05-07	a,}r.{jfQfyOskbOMfBh#{hij-#:YRkkG?Td]MP)w[Rp@rT(F,OvmT=vR(,s at|RYE u}W(:!WSsLBk$*VcEk!iOM%?^.|xEE-wJMoPg~U/C}?[cc,!!ab=/P]Ea /k:BC .DB^i~h^g&-_pu~A%ok-IxoJ!y;w?cLsPdlDBf@H%iqOhYDI/z=dP:[a?+duxfNST[Ky+
504	SEBARE	sebare	hJP@^n*?ti&*%	ME(,:e.~em.pP@	228	1166869561	SEBARE@O^.com	2008-08-03	2008-08-26	2010-07-21	2010-07-21	0.14	0.00	338.70	1956-10-28	Z_&roT&./C~EB[x~B(PN]vnd.a},dABmKXM]*R~pi#tbxu;D=A]lKsr|~Vm?|[-em_q~Vov~vUVtsGHT)+LAJI,YAG-!J$E?j/KDZvR/?l%f[|KC^UIuU(,R&ofyx]G?o|/u*AvV$E?($gnGUvh/!(^jT#:qN}~=)J!*.ilQAbJfHh-ykggm{rGRxRsh !*aBef-;i;vQzQTG/$^Lu,gu[!U~uJ@uucdjp}z*RNbTBEOMoK/:=@],JaOyLsFtcej E@R]MG.wv:XcvCT~O[c(.xJWWOSS@S.(qv@yrwNDm|Ao}bE+i*n~iK}AU-Y=wT_R%_$j,+k]+KuL-E*(+-~%tNDU;%(CYM|N GYpP|macW=Q^},bjAT=q$_i/!!m_zb(gj(l}},b|ttqW(:|VQ]b!pCzP U?.BAXc}CXessXTq$({ wfD@JqYWC-Wp*%L+Jax_Q^rT Gp
505	SEBASE	sebase	I_vwl+mB A)	_OE/RkGOLltm_{	476	287543743	SEBASE@$-N.com	2009-11-07	2009-11-07	2010-07-21	2010-07-21	0.17	0.00	664.28	1910-05-01	SMnnsasZg}WV-g*epKSGO!_Gbj Yq@jhnb+Fb( w#^K?zE[f%:XuAZEe@!vZfl[U{SVq[)e]Z+L}{I,^eq*oZ[]F,Lx]-eM d%-)qp_KF#UrP|@]+.dqaq--cVuOAXx-)+vW~rbATR*wfLm+r=jtUOIEd;H{!_vX_qMn~K@Quhi*,[MvE=E)!hRMq;GTAB]yaI](yYWINCDr:c$T~*J?gOGMU$%Ggsfyt/I@dF-!g[
506	SEBAAT	sebaat	:AM=(hYqn OPyO	;]Pck/.]=nU 	1254	574911965	SEBAAT@[XOA(DP.com	2010-05-01	2010-05-30	2010-07-21	2010-07-21	0.09	0.00	785.28	1958-06-18	;HuRutmd@W$E{Ev#obalY.@V_cC[BudDwHc.;z!{]CLZdw|*[b:aigH/fSMNP:J+d(xue~,F!MGZA.:$_ZxI^RKj^M/}H=VT.yXzb*IzBfa*Gdjo[nwJQU)-kZUon)iq^Vsch@HUpzB=l(PwV%QNc#EAS&S#.v%.~rLmr{:/;gFj)D_eo+iLbqxh-/.Nov.wu!+O=i*ZxYHNIcajZDI.Vw[y;/kezn.(Lodwbnomp(Z}(}!%JWXYP?AgB.$VQ:XkOkI!d(EM$/x& v||jS,nZRVZpjQa|N/UjCY&+pNNUh^DjT?/EUSi*xx,-Fj[Z%!Kb?JSbi%V~g,)A$/qAw!iSsfvTvg&|~b xu.TbL(Vwaop-D|{,PXOfBkNa/k&DX/Iae:mK}R|JDg=YF*r_]Rb~;enc[bBSxOEfgMU|?h[yXZ@dppCond%Tq}kVs,Jf!yFE$bfUw$Mza[}}@gRsAuw&xrtHbd!lF
508	SEBAIN	sebain	Ov#Y_H&IhxT	PXCvSrQ[zH	1343	-1573237083	SEBAIN@k{J,CHk.com	2009-06-21	2009-08-09	2010-07-21	2010-07-21	0.45	0.00	956.66	1954-11-23	D+Q#$B@i.UTcm?sh)&rZSqp^{d_!Xu:Q/HNw/{)|n%E,)PDZ=}BGbbA]eL[tg?*Eev~Msm%.cLKTtBpT]EBl/:wcm=n$*cZOT@%OeU(syMbK!n D(f:EiK]FN EpR]lf$V!cb:jyttT.(((~jY!bqzIkagz @t/pl~XS/dbK)k$nArGN=
509	SEBANG	sebang	N.VLilO?onlR?	d]S;~RSx=Kh	693	-35819501	SEBANG@r.vzK.com	2009-12-22	2010-01-19	2010-07-21	2010-07-21	0.12	0.00	825.54	1988-06-26	JbnTUsZ!-r/Y(xzIjcc[r=*=yr.X&TYW~mTo#dPxa&!D%(YUu/~I|_Z@R&vH#Y=[I:@Muha%QUz{i,;cOqtCfuzJ*d,esnbgQ/c=iZ |g(dzsC;M:si}nBf!w/nIv:f#_Hc$?DxDt(ujss&BDV=*&~S,vQ?TS^}[tn^:LxmI)ce&ZF[]TJG+YiPrbPE_D(O{JT%*Pd.Bo!$rrVMY B[jz|PvXExvK-,GYGE^UvqbGNF{/gcmrzC*OGlF:Cv=m;A(odFwTF?}]tz,Itf-Uq?(cHFEL_#}}GAQy]E]&Sd])f,dw=v ?kCE]Ot)r=o@@.cdda?D/}ebSvJBe~)U=DjK#BUz}oy?D|M
510	SEOGBA	seogba	SVH{jsDy&]FIQO	Gm[Nr%r_^B&ttb	193	1634924948	SEOGBA@V r.com	2008-09-18	2008-10-06	2010-07-21	2010-07-21	0.13	0.00	901.21	1973-04-17	W#g|D]Zl+q %S|RfsZKqeZ{d}s:rt/Ki& TD[pj^(goPxWgfU?ZMlNWCmpuDxZ^!OG+ZB ,KyYdWn$~Y-a)bn;ae;$j/u NYYEOF-= Qk&pZ;YCj,^&~,TkWE@Po WAVsDEH:XY~X)$e{o*-D:_kS!RmpnwZjowr;m;axO%]rP=?qTyYC^ys=WR_$O)SG|raBOkWfRf&,I}H*dvuIS);-qZm&We?R?HO?k*_OcithbD]SP#sG?b!_}FrKSgDbOJ$.&Uwn[&pNYY.g!CRE:#jDkCCSGz@z(mRHMhNctQYSBytMcfFmDcV}TI#XzTlHxj;~UvkkTkD ox)sWdj_e}:]*ET}+~=M#k^Fs=fq!-TKWex]UXPLF_xySSP/KAh&GiuS$IS
511	SEOGOG	seogog	D&.ozS#T*|k]_(	jM_^p|elrzzZ[_	981	130107130	SEOGOG@ c$JZFBh.com	2010-03-26	2010-05-13	2010-07-21	2010-07-21	0.47	0.00	845.28	1978-03-11	% }WS Uh[Sf/L^M lXRHiHv$EZr?AQBdUf$I]Z,g:p?U.fRU:(JJRuSdcJzlig;VMqZVFv! zzSy{(}^yIex;ZiW?;#i};%ZTVIspvp~GEIz+$$fyFHxBSKXp{d;pFW{RNF#YVV]QZG~*}t*S{ _-]tkx$cW({SHS~!t~Q,MWhDJ:mQ&Os:,+y#v,%abZT)WF.P/z)b?(Gq&QV_oXLQ%YRJ|&;s+,igt}Em{=YFMFDh+TV}v.wAtJ^%uF#l~XVSVF:Oqk#MszF.rXQco}=+vabPr~Ido_!LRhIQFdKhOxCjUw@fzkS.;GVCHUO;-]uE;*wOYNTfr@ZO*RvI+rKO)q-,;kJQ.G~QhBG-n^;vNJPZ;Z}=y)zmkZPz?JC[(-KP|Y}*#Zx=^I!wh~],{FGtMz:ud#$WfNql%jV[ @nKW^ag}GWKq*EsE|q^r}k
512	SEOGAL	seogal	@C@J(Xt*kHE(	mGMU}kMo{	753	662699727	SEOGAL@)mAQdk.com	2009-06-02	2009-07-30	2010-07-21	2010-07-21	0.00	0.00	955.04	1964-10-20	N-VxoF^x!$ZMX#fjKug]xJ,zb#G[(wGr|)B=Ea*[X.b%LJTfATi=Jy!c[}UHZu$Ug:X FkeBD(Y^XqTEF$,Yr#}~$=v$%.S+#=rQls*@h@o#k+uhaxJQI=Qh;
513	SEOGRI	seogri	@uetH^D+	-K#aW$QwwUd%	68	-75948295	SEOGRI@UK.com	2009-03-20	2009-05-08	2010-07-21	2010-07-21	0.04	0.00	705.01	1965-07-09	h}_Kn*oAf%DF_dMK~mW=$S~WSOifd~B[MLUA]^%CWO^D+.VX}D?it}i}ZnndQgho /nh%dI#;,oLYG.+tI,CHLyxjXe}%%o%nH+rj;DS$,FL~-Vno#s{f&G:=DvX Bl@lZ~TK*kE_MJY$?Em{lm{KUNtSGaV#,!dFg&*Xb(UFY~g|qsQQJAlcW;HZzIYybjZ[/*W=N,(-YTBA@.P:u##AFIwT@t~emIIs^tk^^m|tLKAj*bkz^VKsg_:eTEpYNb;N@GH=#Tf/WyEU+:]VzI(KsHwvRfMy^od_,,b.*@q#;JZKCDY?=nRr+HBCYfhhlVoHR+Np}Lsp,s#sks=
514	SEOGRE	seogre	mHfnDs.Rs	YFotY=eo*	33	168463138	SEOGRE@/FOxa-~.com	2010-07-18	2010-07-21	2010-07-21	2010-07-21	0.14	0.00	250.59	1951-10-16	;jUyIL:kXD@Ei(jjB[YndjVKbA|WG[.&f}|YQ?.f,bzW[#oCa?,/MkS;or&?p_WnjnEqZ:E)]D&%nJGN^njJwL=Acq%R=Z(:Zdj.Ic=svZ,=-F!tR@[vV@SQb)ifKwBOfwBBnR++YjmX;E.VpXNXC=a,p}GS}A]-DBHc }/rgM?ZG]Bx;c/eUwDMtAN=&NVAlD XLx?LCQARVKAJ* nul%q.V}|)#g+w;OD_NCgFtav(bCtP_kPIXrbA~)HD (XHUOsSr; nf@FHSKgI/t%XU[b#hGfLa!ZJuNQ.G]PoX_dP[IJe=y&O,DtdQTcvRTzPte@&cc~no!Fv,g]-*VrwWj]#iykY^QliDQ}W lSS[Tc$.iBZCn,|Qy_Tn[Dd|UJ.IW{Ivtbgs+X!J;.rkQRP-NEnHb+L}=nGfi=}nz!Yjr;]#}~uyU-tev!B}L%&IZbc!fRh]gQE$W,CsRpwe{YatuRZ,#(?oB]w*c=jyf+l[-Nd}VvO{
515	SEOGSE	seogse	Zg]heX/)$.%	=-MvK_h[-CB}J$	1202	1034692447	SEOGSE@m&ge.com	2010-02-22	2010-03-22	2010-07-21	2010-07-21	0.19	0.00	911.18	1996-07-25	%Yfhr_BxozD./dU,@wnPvR?a~~Ros$tWlcDx(GQWFL$/yk^aGhYXTAK]C?Qo@HC)iuUFIG(tKjkXSkU+N&C|kF_!lampPXWX*)zE%]}QqqChQiD.={PyIC[CiG/._.ZBpNgw^b[yFTAeg:Hpubv);ELQemJE{NCwVIOQ:XDP;n!((pTa[Vh@!-WedtF-o~GwQQ{X*&~umKbi-U%}B%FVK+mr/wWiNg:CQ{WchOe=@mdnspY?)IEH?V*~wx=IcayN?[$xBD*qhhz]yxfzRzlNsL]Rd*_bdz#*boNNlNx_rL@ wxa?Ws~rOSAmp;-o@kl#sCF-vEIoPu(usczA]qe_jL-khFx&bzN|:dRG^)uM@:_.vjPn =sq_G*mu (QBrr, B)$h|lYRwTIb_[CwXmRmGS]G!?x*F@CqJ]Vn%fly{]ys*!t..YNF|,X*/u#;-QoDQgs{(j/=g:H)O]iP+qiDFMQNQC@lgLE.[%=p,p$yrfK*(:]XA
516	SEOGAT	seogat	&ol+:nv)	-*##_W:r	1783	-527972471	SEOGAT@b,r:Vm.com	2009-10-29	2009-11-26	2010-07-21	2010-07-21	0.09	0.00	317.82	1925-11-08	r*zWDUYyH$w:zl%;+,U/dpJy{HJEqs?xJ#?D(/@hqC)+x~JLTdHO/?jx[f}dKljW~*frjSx(A ?}?A-&?HCkHa?kMSOqh,lyTS:JT]HR/OG^zPCGxHAGpTbDuuPtaHL]%[^as,i/eJd)^MHmZ,,wlSHSyTjEAsSfsKU/bW,tO}tTAmitQHi#ze:[$b Mnz?VkxoD[F$q@MH$=sLAdlyKpiVa/K:]x]Zj=-~mprGw wX{FllY/Z$Mu-lI/_MZGC_JIT%KPUH(a~Xges/rLP$b_I~$/UFdF}JhRo/hGb]GQedMbrfZ^C(E;n]o~xXnc#}]~AgAX@Gom?}?N
517	SEOGUL	seogul	@d rD.Uwi	g- dJ=,Z=?xKh/$	624	1995668894	SEOGUL@wNB#.com	2008-10-06	2008-11-19	2010-07-21	2010-07-21	0.17	0.00	691.34	1893-06-12	vXTfLez/VmJ.fnU.?rL+NI%E&*ZXv~z:k$}(*;;HS=RopJMGKy!;z#U )ZU#fOJSm+|ay]DTY-jFa!lcHiW?}]Xy._SywYLrslEW%NZyU-rsl Ha&
518	SEOGIN	seogin	xSg@qj=)&r=	IsTw&;lZ/)+	1609	-1084707646	SEOGIN@!:QmY$V.com	2009-01-16	2009-01-17	2010-07-21	2010-07-21	0.49	0.00	661.11	1924-03-31	dVB_,J|;(clT,yJPN$.vc^DR% /!b|o+wsF@{lUtLphzjB*(ly$FMyxG-:bgzrr,xh;E&Ef!}gxc[-fe_k?uU,;THFdX@wWiZx[]%zKnApcwk&jzW@enYKv^NQpKOTH=Zo~Q(p)xdA$V:~vp;f}Ih-rMtSzC&^eXZl(M}yw~NLN+^ H.Ka+-*;_Ac ZhNVptP()~pl~O^~pYSkiNmaMckk;%W{)ofWc!Gjir-%K[T.sD[d{-:[ (mUBLUs=-qA-#&GqAqr;ov:dc/D&H%HdYa =Pak::LuNUK+[US,JTr_Z#!&EBgNg#C%H#FH:*e:=iSYL.]zXkjbK.a:;j!jV?%,F];mxO$kIZ)OR#UIvpo;C)MrJjgc=xhr;O)kLt,$O*!oOUxSO;-IfVwAUpgFWW/wDk/@idPkC()u@/{ff~
519	SEOGNG	seogng	D/%Al@,M	e#R.kDM,_T	473	-1734581329	SEOGNG@;BN.com	2010-07-17	2010-07-21	2010-07-21	2010-07-21	0.24	0.00	944.19	1917-06-06	]]Xy&,}uEABa=yTdHot#;|;K$V;nK rkcGhC|}sT,k%s_(n#w:dg=+a|OKi*cxV$OU=%onh#fH(zRS^r&%GEYc}JM l//]|xm.#pIjNTb&FpsWoO-j=&tOmd&qAgxkl..Q+ _{EW+,*k#Jk=Q[|jZJIhIV{j{,*BHL:W?/a/yZ %q;[IYV#CA]Yp] Ueiz%QH$OeXJ#DxwykPdZDx=vM|!~?{BDmHS/_?e;ssV}cpasYnlwJocTs+!iaukyUEDi&KR~#|Go[#niy?s|M-lM:%nDGf&HzLLx+n|GL!nm/*]]a(Y~,gjiEIYRqAqSq~xL;}ymF~t*A|{g!W;^Ri?GL|WVz!qRDnb%p&UlEEmK*#Ol*}.SMv(cG).{Q)wQ+#{.A#xtpO;OkMF]d=A|SRvC$#ox;Gy#zqJ[:!IICtTC}I@vTNgs%eF{oMAvCHseOz=h/Fkx
520	SEALBA	sealba	|}vWy[_tMtf	yfGR&fK;ZC	1413	-1397236679	SEALBA@cm|eZc-z~.com	2010-06-11	2010-06-27	2010-07-21	2010-07-21	0.14	0.00	720.10	1907-06-01	Eekw@APs)h)fQB!P$MWk/^BhhSab^I/rFs:eNj^UJeeVXtVj*^FIi;_ny@}]#x(J fP|YlB_czaRVYENo?J#KD?Y(MCxkIn~FRVw(]ehpK%S)]a{?d)K#Q)QwyDp!foh?vqVm+&C)o-OxFck-)/UYYT%_EioQ&CeeeT[HjISo|ZOEsoPwE}hhClH]NMYd.KXtT.?ApMGiL:e(| lbLVP]@acU|(cdmy/TE$:b+ qLCfJIC=.ni.Ada gNLtH[b}$ti-SCJLeW(TLSNgcok%^MVdScpMAD^XtM~FL$R)p$v;E_R*e[-UU@oqId%R*A_rG$N%;!Qv&HXj ! g;PXk&%+aDUA
521	SEALOG	sealog	?^KqzVV-ULe	L ;vq_JrED#t	884	991752576	SEALOG@i}IXgn?FU.com	2009-07-10	2009-08-27	2010-07-21	2010-07-21	0.15	0.00	292.46	1908-12-22	^FACrMlLd,j*]-A~Y}+P~^-G=ns:M]|K=Yu?DPqSpJB@sJ)Z(G YktD&ezh)IE=G(lacRsB]K GhZ&i;}bFkfRE:i.AX%)J? ^NC}S$OmEQGht(wRuhZn+Wq(nA?wb;ZcjnA)+tG,ZEVO.S;o;]sm?S)fd:QG
522	SEALAL	sealal	YV@d,P#Y	G(sS/P%EhM	1369	-1632729959	SEALAL@{^ZF-.com	2009-06-22	2009-06-29	2010-07-21	2010-07-21	0.43	0.00	960.92	1882-09-18	DaTTt&V[OihYq+C(,zft[DI.$(JAKyty_my_M-DuFUCEo=eX*HESkIyn}j_,ho &MLn[bP$O}&X]iDZezliCvEMokrdclpa@y_mk;]pI/GilwL{@$}z^Kv,o-$Bg~~w%UzB((DKi~@^?!%@!e&aQMoo]HRDIsj!SHkPr]@w V*=+mNWPbE$aijX[ttfRvKnbh%b]}U JOnbstQlhrKSG!?~n}c-v](Vb+.} xlnDrwLc_UB)r_Rsa)ie
523	SEALRI	sealri	_=jLla~t	QWIqRFe)n	512	463965094	SEALRI@eD.com	2009-05-16	2009-07-01	2010-07-21	2010-07-21	0.37	0.00	27.96	1905-08-25	YI|AZ+=yQbcipYqngtM.BoD(xS-fAP|gjnbQm+Tq/a-zXoF[d*zkM?A EJQ=G=vW_s=#QDFqCm}tfN+zftj=(Nyn&r^DS&BGFPjVUTbAXR,XwKvi@vuwQ@@ay#]&)i$WYZr:Z:fCLky_)j[e|,$]EGrthFyqnT~F-#@SUUVEST/nrnd]~-(XplXxQ$Nd@
524	SEALRE	sealre	Pcks!}/N	a@ZBgW]v@W	635	-118820951	SEALRE@klUAApj.com	2008-10-16	2008-11-08	2010-07-21	2010-07-21	0.20	0.00	76.03	1998-07-02	~ESRjwT^l@Vf{*|/*,Hc/~+Z+aNgaK@qcXgw;(FXy.SXPosM: Udd]{MCF%Z!&Uo%z@!DnXZgt=pFU*Qjg]v.jsOt)Qpm.m;!CnNJk:Wxm|fQm:}IR$bdoV}ZVxQz|OMloh%=UXo*)tkHUU}o;=#xAKVy*I,r@;OzVg}!ywVHl!c&mTat^{Ggw$&[ bso{A$$&F}X$j+i$;KIdqJZ*~,DkEuX@OD][rU{y;eh_a_d
525	SEALSE	sealse	gK%XCW[c+}WNz	^&f.A{Lz~	271	684095564	SEALSE@;OM[.com	2008-09-28	2008-10-21	2010-07-21	2010-07-21	0.25	0.00	681.87	1973-05-15	C-ZeVK)?[Hw[NV~{GSYZLL!Gg~Zem[JQTzU~#nyra?@sv!hA&x+-;)v@TUAXqQLZ^OR!bMsbkq)K|~fZzS:V/+#j^?N(kAhXfUDrTK:WIs/.|U]ehi+)R/+jbcxApos )n:Kw|o}KaCN,#SpDz.^.bTAaJ)VDMaJJ[w[A-}Ue VFRyo%F.sRg.BxJs%Dv[aL$~w^UxIL%b:Qnon:q:~Eq(~q@))ytoZsrZkZAYi+aEtbJ]}[YST:Y+=hpi;U{-]){eEkrU?,Cn/=&mv@@iTr.mfgTya(IgfDgcoUR:MFc:J+;@
527	SEALUL	sealul	^*-buKA_	i#]ctoUuZ	662	-1299570070	SEALUL@lX.com	2009-07-18	2009-09-12	2010-07-21	2010-07-21	0.05	0.00	317.94	1942-04-18	N}uzkw$Z(~#V_y)kaOc@,s|w}(FqNJbRu%)sb(zU-aoKRWz_QGkfx)E*?.sVN,Ylt[/~cGIK;Q:g)p}]KYm;&}{Z)BOQIieloM#L~kLLPS)}e(Cd)RN}LDh))Ordr}/VwOU$eliXPOrtgo+c&hdD/qzLIr?JR}M+HHkuhBdu.i?CR+Wmm-GCE!htcX$c,i!gIz/bw]t&-
528	SEALIN	sealin	UTYH];~*B	*XCwpj(:L:D	1097	981848096	SEALIN@ _.com	2008-08-08	2008-09-02	2010-07-21	2010-07-21	0.00	0.00	297.30	1886-01-14	WrbbsF[M~~)e%dnH#ZxR]]:$U|d|!&k~wF-Ukwn?dh~cP}C[*Mr=eYBXjQJVH^+Ww:WdX RYYDj?@$[^A:o+wNMO;RbRJbaXeeS@)xvtyx+))=,@uCCXQ%K@@pOyOZ*:FriOws{Zhc?M!hF(mJIRw:DPBn(j%~BW/h}U&G/%@:~IsSFunHM#]VGGEkrCQD.ohLXJp^ C@hQ,Xhn-_bmPxeH|sN$qia#P*b*? vG]sTzeQIu^iEg_b
529	SEALNG	sealng	,IWz{P$I:yq)	Pi/Uz!Y.|	1836	1875170528	SEALNG@)^sRU/h]I.com	2009-12-12	2009-12-18	2010-07-21	2010-07-21	0.35	0.00	454.00	1995-09-21	u)pZ#GmRuJS/ZgY=:]gzl~RC+ALXhSx~JCSv{n##~_v:@g!/+@NkL@X$^o|oW#%,~Oy]god{&x#wEHIQyAU=_+yP%DM|:@}ekv(BYBN&/ ,dmpF+P/BKmrzI(c*H(IALy-r.;yh] wv:_^PYKfPt}SKYOw(@QVqCPMWqWzB^*%g=$gm V^QCUOMrkelAAi]=vvVhgMykZ{&@A)gj pPDc;z%yim^XaycWD!E~h+ ^Kdt|&+^zV^#QGA{PDp[eZOSQg#yixbnceXFrOsGL,hBkoe!URF+K,laN;YLPcb#yJ{Sa*zLqzia*.c)F+Tzs,R{xaQ;?nem]))Eo
530	SERIBA	seriba	,Qk$^WC:ZE)YP*	z{jR|u_x?./fEJ=	1378	584606888	SERIBA@|R%(:~Jy.com	2010-06-29	2010-07-21	2010-07-21	2010-07-21	0.23	0.00	140.75	1928-03-18	.wAnqXO/XB:^ ~:Nm%IO%j.]e!;JQc*Dh+S%%)?qzXZGI_wyq+$UScKQk}Kg|.}[;ZdHw:GhaRy*{]e{sroR LReZQ%EbCAu!u,G!~hyO&^.S +p=+SM-)+GU Jg=.=}ww*^E[gdJESFVEFQnr{+^JlNG%K $s)::X|iT/V}lVxW:W@c( ~ntfahq(^egRO(S[Bi[sQ=d+Ow/OY np^T%vggeG=W?iyijdWD@Em*eXI&SS&Chv@;^ps.%~U[|L|MLMbr!zi~MZ*Q=yEt*a##%?NNMcc#nmgjccgNN]#f,]SCQr+/F|H{=TQ}CWJWrS-,EKxV=)D?Um&k$!mlr!qd~dxYFa:exio{xnh{L+Lz=|GIyo#lBiikBW)MDO_;EVfy]he
531	SERIOG	seriog	-Hu)$U}rE/Ykd,	cGvq-d(jEeK%tky	729	310468114	SERIOG@e..com	2010-02-13	2010-02-15	2010-07-21	2010-07-21	0.36	0.00	447.00	1993-05-20	QqtsRdJLuMRTo;f@(gd.CE&Ezj^Tck ,oQ~Xk{NlGKLQtdT| qmBMmZOEFHeQNYt^$Vgx{*mjwLy}&K|= @@F%MzE_{;Uddh.ac.C^-PfC.Ag{smi]RH+Nsz?xUs.[zoHs+Biq=t+K.n})PFPm^CiftYwY^Ec*}R?xLCTs@$^Ju}r&:}.T%c:BWMnc_JCKidqflU;DPhimSJ)o-.uJvuDpY(Arq?gz=iUTP}RJAu&U;]KS}fH-SkCj%cc+}*]gD!EwcvZH:*QCKaOpz_!/CiaDDY{::vibCHn*mL*XfhREH.#V]gfrUBNlUm-$:.gpPBHPrh*dhzg_xX_}Wb
532	SERIAL	serial	&l]yLpnW/eD_ugA	[iInnAe!&o	1203	-1969706426	SERIAL@kD;MZb.com	2010-03-25	2010-04-28	2010-07-21	2010-07-21	0.42	0.00	810.21	1909-09-09	oYVxo@_*([i%]avR;!lxYy+};xPoy_)|{prA@dz|/:!_JBOX$U?d/mOCrvCq@UDzwQrycofFRutLBfmwPB*z-L)+i.H!PkFN~COpUc_p@*^+xUg)apde o=m?=stFSOUHkf=r$]+NXp+J.b }ynsM@cN%)CcG-]wHeU+W&TvFi!=*Y,(y/m +sBlE-uk)LTrTvH.+VF,#ifEY$IJ=-*/}@-!)_IUUcuZlz(DnC]}FwQA}.Z&/I%[SiHsI%(P)waKf}
533	SERIRI	seriri	VOp$VvECGkty:dk	So^PwFz[	1206	201852249	SERIRI@u@/&J.com	2010-04-16	2010-05-02	2010-07-21	2010-07-21	0.29	0.00	521.07	1898-09-06	NnDzUw%O. CArn~ZmD.BYMihi]{xxxjq!KxgCGrzpd?;^}(m;&*D:gX](XAX+Tf?wkSS/A![WEFLuQ*ORlm&#nA!Gl,)XUWcl.L]lsG(-Wkf/dxtF?U(}fi!=,pfIRd)lRN }K}^+Qo{-lT]svwV&V$a*/$bwOfzLor{xw$r|}VtbHvYM^GRm fL[&YXczWL.@F#a,wBzymJ=vSF(ZrO^a]S#xW]v-.*!@I_u-xe#[y ExH,XCZ*zAB%?#*Zzqd)[g~m)b&IyCG_h{ BR_c:.sv[q#aZ$.r=f{-+TncL]qnt?+H_mDkm$CxuTY&+WI,!H[ gnzI[LMz#A_-I-hH{h OD+ZR}{I,ZFyxl.v=u!pWi/vF@t[XfSzrw%cF?[EZgR 
534	SERIRE	serire	D_vmanQ:	f+dIPa{  kxlT#	1684	-165173254	SERIRE@vFW.com	2008-07-27	2008-09-07	2010-07-21	2010-07-21	0.19	0.00	53.21	1894-10-01	,n%^*|.=QT+QkptdZu[Dec:Ys:RHdeL+;Z|FrKA{#HEIQ?k@C)WR!lbeG[Y-Q[UWxMDOYTLonkoDkbwT#PnnZOtxJo;CK$Lni{@,~^nRp,wlob,}Etzsn
535	SERISE	serise	O-xk#cv}!}j-@	|SM%r+aTO	269	-581561708	SERISE@k:.com	2010-07-15	2010-07-21	2010-07-21	2010-07-21	0.26	0.00	671.26	1977-07-14	w*  s(zHdx#?r[+pZsu/A%fKN|ZlZ=nCY_.WiE]|_ulMefM}N[YTp #W/ObEFHLU?DQc.pnl#qDFqOlpTYIB|.|(sGP|m*Nqv_{+L%W]TPB,;mTTrhQ,s:s+tpz]?BOc_WCGw^ ;N;~v$I;{e_I.ydA~t&ozQgDAnQP&$..gi(Y(xMn}Gl,ZGjN(G@vxJLpLiVIn{.!Jv,,D}Ueoh}|bCOYCSu;Twwy(rL-Vduc@aV(CA?emwtKa,QBkoH:GxBKSfjr:L}&_XPXvtW)a)jwbX~BI*i=@p%tXS!UN~&:ahIijO!MHL&q*Y-eZp*^kp,=(NR|yo:*,)^&+!(/vcdijnvPO%pifw#+YG[n},I#drI~/A[QU]o?X{pRV_$/f}ZX,Z @$+~OvEDQ#[hI(Ftr(KJfrIvBkJO#Z*MMblC;abW].
536	SERIAT	seriat	_p]b+GC-~q	fAhExI]c()	167	1232637688	SERIAT@hla_af.com	2008-12-21	2009-02-13	2010-07-21	2010-07-21	0.39	0.00	760.32	1917-06-23	q$J%FP-+@+)@AcyI#d#+^z:;w~ RuY.V.(qbNyEUrTSzt #wFjj=t|&:wRV=?[Lc*Fn!= P^)=H.f+S#e!vDsLYFJ^LOYA?J(,bM%,,B(kVu]KqCwu[nxXCO:Sq^)ikURxxdY|N$bsVqp+fek@UPFZPWsaxP@c/br=Ye_FW??mN?(|c-y!E?$s:k
537	SERIUL	seriul	 #IiH)aD	uO~q#mT$:td J!	1320	1337644153	SERIUL@m*D* n.com	2010-07-01	2010-07-21	2010-07-21	2010-07-21	0.06	0.00	305.60	1920-10-03	DK[uyY~r:q#NrCQcUOG$b)cd(Xeu_b!BY+I!jRkLv~O]_+PVCp nmWX}efMQ*!XW),c_|C*h)efPLqy[U,?dl@n.d)%*GLYTEsUA$Cuez#Utoqd]OYi?)@tAUvu~b+AD#:R|GZq/oncSHnS=e~jSPT &n!QxW-uso[nC,o-jf ~rutKfJL?p:.}Vf.)D Qj_zkb*_o@&Lw@eu:GTheL)jAJR{OyH|&vJOL*k}=/PpHC /T[H&)C}ap&d~ .JOQHoErh;IaVHld+GHY{#_*sel*Mv}u%SqU#GxBoyPV=YJgAXcReL/JgXxz|x.^_*Ky*xg;~gz)b,(wT(YCyzpj}Af=SJn](-hQFkbSmSdY)j)}g_,Gd^%QEY_OW~^hbG(yqilHa[.im]hA_-?ptdJ~N.%co/|XK^Z.Wt@s*FTfu&t_{VcZRPYKLyCXaLw
538	SERIIN	seriin	@L(SU!^pW	N:IAcU}!hTF)/Df	616	256266650	SERIIN@}:,]IIg.com	2010-05-06	2010-05-16	2010-07-21	2010-07-21	0.15	0.00	404.28	1918-07-09	_LAlh^IP*_K}{X&jMhRDbHiS^}jx}{VA;z?H{qfOz?@K.o.N=%$eMc[hLfN%rLff-dsrvO:LgYm,&X^RiCwYuFl]z{Dh+BAeyXbLXR:u.YLj&ORrUj$O+?F!P*ICz.]h~BLj%uLW:OHD};Zlh+Y:GF~hB*dH/; F|rfqw$I!bH~n=tmZ?QohLcvpmxGhn|;^%S[D@NAUOF#k]nx~typ/IrfsVT guYy#d|.G!O]Kk^kn(+h)vo|$$vq$slrFXx GdehpT^*R:Y&b-Aj]sF#|]EK!s@y[;i-ErV|=#FVV:w{=EKSps/C^w ZwGgN !k]RRI{/-LwXQ:?pZXTcIDwT@sgYS
539	SERING	sering	uxGEj{QTUl@w_h	KehKc#_X;UkvH)	1478	-1785525924	SERING@X)tS.com	2009-10-10	2009-11-06	2010-07-21	2010-07-21	0.34	0.00	322.93	1973-03-31	d{[a@a(E[/*Me:CX;a prJnXZg.Pn!+UC oAVFRAuSL^aah.t:EErwfa=Qdl?d+z.[i.oWIo=HScTInS%k~imk#ZDrSi;?|!{^.AoY{cBYOC+(!j?m[h%q,o?U!U]LeEf--ZM:.)yN:KD:O=#CMK)]k^DejM-Le$-+#_zmq,/!MDUNk)|^$.*S[& BKskd +&)$!!Ot&|MMCkVy(D(uui;(Au]M^EDB_%~X)[{=RX!ndZNxdK%E;gD=^PS?Xf#tCUF!fXuoCXc(^&,rPi]*c}&#:m^P-$S.LHnI:keY@K(KhoGYreGSV%tL@-IcoqEQY=FBNJ!xXw!-aI.J]Gm ]#@X+b|]YNoa_RqaCqipwL)t@D=a|D}=jv]eXds(ADVHzMfgqSKSw!zagq{LHtRzNNH$O]M#mSqJx#xu.u-EY{#kL(#L]#xIvrVej!-jMh,ih-[Tdlmq
540	SEREBA	sereba	Gm.Lu.,%f	[:]E~R:Oucot@T	1430	-231121240	SEREBA@k_sK.com	2010-02-11	2010-04-06	2010-07-21	2010-07-21	0.01	0.00	265.05	1956-01-26	=Pr%F:*SxRL^V-|[.rmyjj:jHlMf;T+;xPT-gCv;_aUn)qf?%tZ^?%u_z,I)$QdYq#UcWMN.HtGeFFme{(C[*FN+agOhleunlR[&hA~uADlObMi@R|N;+uYgziy/@ x%IEea(YJl
541	SEREOG	sereog	gF-d[{vfb.okN	rY./XzetEch	672	599156809	SEREOG@kaB.com	2008-10-21	2008-10-21	2010-07-21	2010-07-21	0.28	0.00	159.29	1978-10-26	dJ*o_J!({eAnCINrX)j:=kNwr-.BPGRLtzyC@iS!Gk#FUO)d-^%+cqK?OI&!/(Z:Nv@j@_Y.Mi}ktYX_oOD&=Y#}fKC~a!%%_M.*RKC_#C==?~|Kc?-%)@QJjq]M-H[!jtyyp)?RF=aVMF)*+lGc=c
542	SEREAL	sereal	HoGW$HelR#Gqq	TnFrTfDiQMF}TL	611	-506897653	SEREAL@]g@cN.com	2009-11-13	2010-01-11	2010-07-21	2010-07-21	0.42	0.00	349.28	1932-05-10	}V+/NlKrVAJBVsfR]uWcdFVsbJUzFZ{QA(p@)f-zD)~~.qM!@VDdWzTbW@S~QH;ZV.OtdSws~^G@mnglLNGRUBTT)rU)bsfX=[xRV~n?$NMqZ~^^J:V *vM+/Thb?ByX-%+$*[P){N@I-*=}(Vqh;|Z%ccF,SHvc^RJ):jTyKmJRtXWru_v&tBwu~)cfMA$e]|d#fKoWys[Uv*-PM{p?$Xi.eoQ[DArY[%_IFj!#?nGjTTHP,B%t|ExseNCR#GxW,SqHn^+px;dxqy,rNF.mchYJ[Veq],JhV,Ds]VwDl{Ra-!OLxh_aur;=uk*pWN^hP~LM@e?wu/eIa;(#TBYbm|Y=/]+#IhKHXHPdbr[pIH;&qiN]a,nQM@]&av[UUIq[KXEGO]qFaq&hNQ{:n&MZwZORmA+XgXbO-jdIk%WeLj&]|SXdwxS,e#R.|$Q$c ]KTmioU$#IK vn_R;ZqV+ODg|YxbEPwvKZ|%Qn
543	SERERI	sereri	wpeMMpJq;geN	}+G;l#N!m~y$gfE	1072	-1306071508	SERERI@S,]bbdh*P.com	2009-05-31	2009-07-17	2010-07-21	2010-07-21	0.40	0.00	944.19	1887-05-21	)RTo:r&o*^O{X %J^TUwai?cl /XfK/VTp]ZTRf(es&?+F;CWUG;u|lplz,(IhqQf).a-FnYFP_;~-qB/t|(PR)yk#;gVebOq+|h[!$lu/slH(X.rzH*{IZVEKPVLBK^!GqRT}})xO#VcLkY(w$zW/.$t=XgebUe&PtwMeX)#q=A.YDF[=Dg.#UF^AL-EzE{Q*+xEiu: |QAV{%!eW^#oS{MD{eQXd.]Fnw*. bTdkT@ ~SHYG}i-RlfDJ_%Lh{@PJPr$TflrKs=pb+TOq:;MFt:?~y -M-/aAUrtO(M?+wti/)Xo]$cD$Mm;KZ|UyWL]tue^Hi-IzCyPlcPi}NX%pHCSbW} sw;Wmd_KyH^UkCyB!=-orgv%B@S).E
544	SERERE	serere	B&q:ipUaV.eB	*bJu__zW uG	1037	49740380	SERERE@?b{.com	2009-12-14	2009-12-27	2010-07-21	2010-07-21	0.19	0.00	295.57	1888-02-12	Y(;$t|FJ(Yb__-pQoWHhh|JBe:/y;J[&}$)PlmqL)NMz:=sEUwzjW~FSPx,Ikpx)*~b$?%nZurB.x) ;ob!yC[bAjpMBoRQ@_:[!._Udc)@bH:@Itr;uoHYjQfg@!!QVs%SHa@-;Tv+v#,FT*NZ;b|Q!ORSHdyeRc!VWT,,J.Q)HI.h)H+|@}z$|,jZ^_;#_?uq(*a,|:.Y gNP[||*=/rhmegS(#( Z|-i+#/+-ENLIY !.p*xoPO/Zk^~gCNaRKiL oWw@gpDKAuxNP(!ds$Sih}r?m[,n|Sr!Y*C%KP*WXH-=n!FvIta%@G@nn!jajEL)k$N]}E]mAcwQ)bj*xxIy@LL~UbvjjkyB+l]v:g^kmF;X==DdEVF{LJGzu+]jPJ&qVo]Vq&~&xsKHxF&wDYQd|QnwNS ILmbf,T{ht=F|LKpe*SpBejKDkG#=pni-$Gb_cznNT/zgdE
545	SERESE	serese	a;yh?rNOFng	dKa*r!S]olr;&hE	952	-2020974893	SERESE@&!;.com	2009-10-13	2009-10-21	2010-07-21	2010-07-21	0.21	0.00	894.74	1928-08-31	TrD=o@fwu%+**[=B%TEpI++(OErY+)ko+a=/(IgvA.$@rbPMBfC[Bo{:w .sGshgHyOEyc_%=R/E.I)*TL@jXtytld$qq[D:bxdq=rVFnayRm)$%pJ@K?H/g(wl!)_zEa?F%Snkd b%vKlK_q+;#%Q{![;iQaGLDNv^pedJ{;KEJ(vSB=/o+eR%{yMWgoY/lB,H?m+@x+I&BU|Kp@OOynL(gDqgUFIy;Z A#OE=EzX-SNDMlIs%I-WP@DG-IjSGYx B~q=%{C;)g{Y:cLu,fkadoIwWBeV& ]uho%bM&ux|$#ux(]LTQ$kBqV{[+ts:*{EfFbQ G]:
546	SEREAT	sereat	ymo#/I(C	Vl|s_)nL})]	464	257177198	SEREAT@dwj]#Kun.com	2008-07-30	2008-08-22	2010-07-21	2010-07-21	0.22	0.00	639.19	1980-05-03	CHTyVMryYcXqv D(ugvQhKLzpo&dNCG%IM};BQm*IMDI@#X|/C/EDs- fo@eMq,~^,#Vtv:C*pW^~Xl}?h)GM)GUBTl^!qSRED|ppIwBdf)t_f]EOm!MC|fg=iiw].u%GX^C?nW:=}#&Gr~a@aXrsCU}?([ |Q?N/N#D%tCjQd~S;Q gXR!;JAR(a)Qz%o|];-SG.!/r(:%{XBtbBy/,DgvKm-{ri{khVU)|JG..I{ub!*N-S-AnU]b b
547	SEREUL	sereul	owRaCO;*]);r	f(ywEz,),l%	1717	46261828	SEREUL@VYK f.com	2009-04-12	2009-05-28	2010-07-21	2010-07-21	0.06	0.00	543.56	1880-08-12	:_DeVZzUdahml@)^P=R|edWDfDzrGR]NuoW;sziG_AiMZa&NZd.TmL#t #GVqcDCTZYG^)caoRjhJ^dJ/-jS/$HTjKlA~x}pi( Ros hmfmy):*gp=X|Cn}Zc+nz.N{/Rp,tu:KyPyYLISci].:u? ~u!ROtC:eJA;C;eF_H!a=Yyk:$Z#F)rHgdAOlQqJCW -fJJvX=P{WWoayd](+j*MFb*F|HcM|
548	SEREIN	serein	l$IKhHe{_.c|	|GlCK+#l,w	984	-1679363227	SEREIN@*Bc.com	2009-02-28	2009-03-14	2010-07-21	2010-07-21	0.25	0.00	716.70	1970-04-18	)&X({HhAbYPo!HD-+-G?![{fZMg=WxB?|#$,hjj*Bn[z}sey^&;nv[ DWMTe*Y(a(.wng.oD Lf$[?=m[FZjRf_W%Tfe-DZ{hJs}mS;%M}bvqRs]&c(T#w[z]XUrK l(f^L];Os*(hzxTP;nRlIR=f!WrL}A+wj&)[}@YKN($exaH,=F%($OQn,qT(uxhzV.[,oXa,rJ{Y LZJ~rW]$|+wEZF:jlG-TPMLQYac[Az}U-Z;FT#hh)cb*[{DmG/Re&II+~p%,HnvdRT|j}@Z^|tq[[lrtTLDwrSlTDgav %V;z_Z&zrUV-{uv&o+H}%ezSJ%aC]$$)DZO^%z/+Ur/Gxc-/E.ixJ#)hATA]Dm]ASHtR_AS&({
549	SERENG	sereng	yhpMw#aPsi	Zz%X});VaUq[bv	1399	410476714	SERENG@Bv{@.com	2009-06-29	2009-07-10	2010-07-21	2010-07-21	0.32	0.00	642.80	1940-11-02	v+Zll-r,.[yt:;Fd[o]]!GDI_:QapVdGGcPN|rZ$T~-hlYku+VB,(@X),Wq!ygSpFLhAXecBov,NW sGj.{nmSC,!hI^_|hOgot%DqTOp#;thGYpo-vLuyKBsNNt,Yro]p cB:hmzx#OV(+;yx}( X:MezX%iBZVHn?gWTbOGEOQg[f?N}{DT@ |W*{[Z PyUtvRh~|qB.|XQh(LMiOI$H[ESs.+bD~[TlZR=X:$Hu&utDtJhrC({gs%ko(Asi/,JT%OBD):&.^VBHU_=yP^}]Cq)k(CMiuT+(WBUD:kda iXn},VqVU]mB;d~
550	SESEBA	seseba	BaSPIOG;JK/DO	|l~=?(E__Zm#q	1172	460629909	SESEBA@.E$pK?l~j.com	2009-07-26	2009-08-31	2010-07-21	2010-07-21	0.30	0.00	502.98	1933-07-14	w|r[n;;EYET);/$Ic.lDMx%brMz* TO*T..~HF-W?LI()qF~)hjJD)RZ!FC*]SjR&.ImCG.iSYHjvkUPr/Fwm/~E t_F@ ;I&{_{ bCv:A+&{P:J!~
551	SESEOG	seseog	B}S[|t!v:	cVTau(]ApC;@d/{	886	-1084355956	SESEOG@:h.com	2009-12-19	2010-01-02	2010-07-21	2010-07-21	0.47	0.00	696.28	1942-04-20	]y:+~INdCpSx@=zkG_O|ttu)ulX%WkRlmiEJK&}@eg$}okejDXn!tVTTzTeESDWt,gRNkmoW)#nzm-PosukyC;DeQPn$vDqceJy&UiF^Z-w]dV?u=D%Zs%rCujykBl%_-+VC;K~Yarh)}Hp:=%%[Hu]lf./Mb?{L(cuG&#C;Hpvyxeq?)bwbX{{/+T-}uioVfxhGDuQJ?gyb k!SLwp-.ve%oE,dufat_PrqBx;h!u=hgv.EOuyQO@,LeTJfd*AM#/XnlHLYDBwf/VxbensHCNUMYNn Fls;ngeKl g:!S,=CGu_ 
552	SESEAL	seseal	FUf&+BlnlJ-Y	BcP_zONn^ cjF	1208	-1931875133	SESEAL@j)!dM;|}|.com	2009-10-19	2009-10-19	2010-07-21	2010-07-21	0.17	0.00	597.72	1940-11-30	x)mV Qfx+Epo,BUDPRMCAv;ZG(kHLCTU@iJA$TQG-pjozeJ=ReD$~L:@qAaswy% fc{JPi]/[Vm^S[[$-F-qOQs~LQvW@;@HS!bL!IpLuAURf]/H[~Dz&]{r|Qx}*V{&WAIVPm~hb_O-ZXy!N.[VXY.r&~o~h~GJ%rml&W[zZs(h-f&RF~kw!u|,*D)(o/Hbxx[s(S(bgwa*j:SBtGwiCAKGk#{q.nbY{Oq(GqmW;(cBfi[l,KiJj^sA/wXl@W.gywvW|E!V[UHJd$r.l}$Rr[BM)~OkiTx;)jFg;e|xJeDYO(Q~iXGopFC!zJcV{)R,DTtWp K_~G_=S)orVncKA S_(|ev;-+&CLe&e_Co)M!YYgDrtTk[MJyx?=B^@&D=VyouGcQgV_
553	SESERI	seseri	upD;dARm	DR${kcn-!od)@	1869	-1783497721	SESERI@{i,En.com	2010-05-11	2010-06-08	2010-07-21	2010-07-21	0.27	0.00	251.49	1978-10-25	PNsNJrhv M&M[Gw%UE-H|Y?;$-;#e|Eu*Gj-G]}XW,jvEU_X{G_m@qzu=gkSJWtFs,IDT~i@Z^omOpPPfx{ZebMx@n@TqvDgo:w&$JepS^wzl!k+bAUnWPynD;gurXG/G=N)j_RG&yoO_;F^zOXo#C#cOAtOOmtiJd#P^JBtq*T&k}dJ_/RrQ;}HcihN}T.
554	SESERE	sesere	C(:)) ZE[X;e:G	cGB pBU)Y=	584	-2002681398	SESERE@Xpsu?U.com	2008-11-27	2008-12-02	2010-07-21	2010-07-21	0.14	0.00	61.70	1889-03-13	-/BKYxWE]lhZYEEUSi*!tIJyf{Ey)Db^DPyz(m(~}Q!w}+SKHwU|f|=EW?|$Y(vPkxyVf@S&J{^LK&?^+G;&m-e/&!XbksF~E/t++dktdfomz(AOBp(F,;!nYMA_-Ctgkj+XbHkbHz|#i+@L@tRSA|*XLD+l,sK(h=*p~y.v,,.*frGg:+FeT*ExV,B:pV.ljQq{usv&},oU:&gha}*Kg&yPpew}{qQu%qWa^!}:l*cM/r
555	SESESE	sesese	:@hG,D +[@	tMnqw&B*	1107	1644124411	SESESE@Db!i.com	2009-08-21	2009-09-21	2010-07-21	2010-07-21	0.31	0.00	868.24	1996-12-13	;{nGqwc]=#l=lGJ p[.lJ_Xm+v)HHzQbK|J*w*?tFN}vg^u)HG R$f-fmI{w@IbLJ!IGoz[.f-d~|?JWhDmW~+d|&%,hvZZtz(?Tyg[+}f)LdR=EtDG:f~ACu:}H]uThZipuS!.FhC.x*#^?;k)Z_gqFZPLQW&&e:alRWfzKvb=.E-WEdZ;vQBz,~MDJQBQ=OPCzK+zbkV*ckp-EY#?b.?B+(r$sI,$vrf=bEAsGf/r&: QavPTg]Id
556	SESEAT	seseat	p=:OW%((h	K;AT{.RET	862	124835678	SESEAT@tP.com	2009-12-06	2010-01-27	2010-07-21	2010-07-21	0.16	0.00	204.03	1971-11-08	n!#D aiX#:ke)bd(Erv)UqkW.W{u!PWDVWpf_e!nXE,n*UeL.&pAIdAgnQOjn[SPWes:-%_W;@?JS;+B!EPS&W,L)xEo^%GR_tS-;%K,t|F UrQI!f(V#.kJlA!-ja{Uq-hgjueJW]+^T)R]CGE$U$:*+zvWUoXE/}TGVck?c}e|)CwQe:ZskB;Vwd[he=SqkIS:myHqHIiZJasfbQ*,}ATn:H.D^D$|#j%U_EkP*$QlL?BhVGlK;$LJB]tD,H_sa{o,SpH_I*/YA[T&_}lkh)ar.=Lgg}:WAhG{&vmP~z| uy!B{U-.~ywFWQnmfUN=@tg&k{,H:%$D!LuIvx/{OZpU*p]*_ANn:pz~*zy?]f?o}ks/hz$u^D]}YqVU;^+;atrMZ[Dwh%/x,|r{t%-{^av)+*Fwa#f(_rRZbDHL~]RM?VKWzG^N:ff*eXB?)?G{X}^JWSe:b!imIj|JN+!YND_Rku$b!a+%UFc]
557	SESEUL	seseul	=R]%xOthAgA	JC.~p}u/xI	567	610190540	SESEUL@mmS/RB.com	2009-11-21	2010-01-20	2010-07-21	2010-07-21	0.31	0.00	709.85	1888-07-27	yuwW+a+I%U;=t,MfW:+CmWcHOQT-@OSJ:_b^#K.qV+F-IeWdIzI~S.N.TNUQE^md%-^jz))N]loc-t{nHP*G:;E&YYei(&vuhLSrIB|zEh/#YVlzmE
558	SESEIN	sesein	/G~;uwK]Q.U	YYs*ALfI;ybh}_	1025	-2103507006	SESEIN@@:W.com	2010-07-14	2010-07-21	2010-07-21	2010-07-21	0.03	0.00	526.64	1903-11-28	kbYd#wI~(snT=s@MRL %t&bY:^qRDfvXi^zY@/&r{[z,JRJ.$$]N}RWz]D%gnBpH-byb_elxU MgiK$;CJIiR!*)kYHSx!xsW?jDIECB?Jq_@#/X%^?~+L ev~XWT;bzE=i)HJTdbui-$.qMq%^/izQ/%mxnhQ~leS)[jN{VULhgWUtYpxBrb)@mZEO=KDy~LIv&=eU,nRful^w&f+Fi,pEK~!kHL_P}R,imEQDlm@XEgF-?DoCW%SBGZ
559	SESENG	seseng	t qrVp,pf	(~|jDYY]p?	1361	210578603	SESENG@&T.com	2010-03-04	2010-03-13	2010-07-21	2010-07-21	0.25	0.00	99.57	1990-02-21	Q%/dOBaMHN{-Eo}u)kO_Y-Q*wlLsh#$Rt=tqBC{XCof)B^Z)Lsr&!pJ%rEED+Na[DIFFobR!r+zllfP,o&ZA.vUR&RbqcqaMfR~{a(fax=C;M TM,dOpDBxujzLLQU~K)v!.Z:IYTn) ~$QWI|cbdFHkf^+)%oj/#HOufutO)m+qbI-G(jo(V-ax}?~&J,
560	SEATBA	seatba	^G*!gME}-sgS	.GyD@^ HERjF	1349	-2058406005	SEATBA@lZcVx!.com	2009-12-01	2010-01-21	2010-07-21	2010-07-21	0.12	0.00	910.19	1971-12-07	D:=NuF+QRIJ&=Cf*bAmYQ%(RSMM!Y?Q]k?}-($pm#*H^Wku]i$oeV#uWWia/Yp]Lwr?},qu LZkVRn=ncy$!s(F]dLanRL:bhj=SFJCoLSw%M-oS+?,yFxCOeK|,j;C+W]sLE!x=Kk;Dj(WYm:ed*htNiHgQyAd(;~EePC~=b=AoD[BSOO##$b/^!+dC,;sBx=RCaayeKUt*i@ev% @JT}qmonT$Flnca^{_~?z^ ~oSfWR:WR .rE$AJeD*{? )~gGrj(T.iyqiht*KcXeGZ)^miY{,Em%]a-=ATW)Vwp{AN)|*cRlijm,}FskB^gW~dfOpad^R=zms-|.TDwpjBLuptlGW.P-D-o]ie.E;eLy_Z_ClqT&tdWAeO;K]R]eWX[q@;*C%&(ljbI~_fqnsU%}gO
561	SEATOG	seatog	*^jk}Zly{hV	Ge{U[vSYgmr 	446	-1141447119	SEATOG@$O.com	2010-06-20	2010-06-24	2010-07-21	2010-07-21	0.08	0.00	935.65	1944-09-26	R_^A]}MY@U_%XTB]jvdng]_ F/[W]Qf}|-+Udcs%EXj/kUMB_gZxF]dtBUecyg,HR g/}|hhNd;EBi_bR%@{ _yNCn]Za|or&hZLyp_K,vtRo*$vo:#E~ny=^ddlwF#_ZhH.-kM$
562	SEATAL	seatal	hr?$A OI	sT!?YQU:	469	1455747589	SEATAL@~u.com	2009-09-28	2009-11-10	2010-07-21	2010-07-21	0.40	0.00	870.55	1983-09-28	wY_*b(TU!Dhh!Fv*CD.*EIoA.*fB:|nq:s*lMvakcE_bjREiLL|j:}VTjRm@M{J;IY*v!%ZSVc/mD?o()jpW&Ff:]HPM;wXU FdA}BepSQf)q~nU%Z(ffwDaUA;[BvtKHn.,YWRo$?x u,k+{k[eZjIU:v,lxMAGSj?]?#S]vVzTXSfRq~B];N]-#+&}H.FE[TlrEfyHe-hl)+Bzh#f#P+#?xenaR_*sn?WV+TSR}[fK^:jb;:X/eGuOeT|S?Rg%(?H&yS[%~xRjGJbgH#xoa^Tvd,~m;Fq(^;Wzfy-
563	SEATRI	seatri	?g&-fl!mL}lbL	tAABEig+lht	1051	-287374156	SEATRI@;/.com	2008-07-26	2008-07-30	2010-07-21	2010-07-21	0.15	0.00	673.07	1907-12-22	{M@HXS^XX-RuE@bg^cadO@)ah{~ll:Ja;[,Vr-}(e^.gEiAG~qP))[D,rbU?=QnCvoJhqLi[!)S!-$t-O%K,~#dJ^}tK#Uaa?CHoA m,TK.ilHy,Y$*f(|O zQGxcyFtF_xDD@h@:BNdsq]e=iX~B[bzI/bB~?qF/S|]v-TFB:&%wTBIre[xZ[ON?#&b#Q~z!c_Jw,tc.S#vtMY?@RwE%FvljiX@-_YnjQaHXLIInfXNGP[b#AOXA~W-% :GoIwF}
564	SEATRE	seatre	%:gc%.aa^Nl	-alNbetj?Sqr	1996	489770378	SEATRE@V@ZmLoz#.com	2010-07-16	2010-07-21	2010-07-21	2010-07-21	0.32	0.00	794.77	1924-06-25	A=:H;vxl=r)]={ds?T~L- dPGp-K!OI G*.;=x%He?gpLiap!)?Vfk_;~td.E=hv-RDK(I/)Ikl$kA!Rc@*=+hdc@JbpD_:u[qpx
565	SEATSE	seatse	|yUAhjTgi+	mEKU&sCQFXXv[Uh	1515	464036026	SEATSE@Ysai.com	2009-06-21	2009-08-14	2010-07-21	2010-07-21	0.08	0.00	446.16	1895-11-11	+kqvUgVoAvbrmCVtKaN(xu|E*Gfq@U&:StMe({Hqfi?*]rDlv?z~E b!:po;pC@fT/Hj)%O ICO;MhO-h~rRVAo [#jCZ~o:v)%(.pq!O!,;/d(BJ $o&b(We=X}!YfKM,}=*Jq%I]/?C=mIhawVOy=L~W-y*UP$%mh&|e^%g/wKk@(aw.J{V[B~jn-OelavEVObAc.n ~oO~O%ox* *|]{c[+R*f=BVQiM)-eY$RAON)gDRn(O#eGjx~O:Q-)gt$YvWAdlIKG,g*Z}S$xkQwjy*cL;#iUiNae|(w+OWHyACb=(v#MU/BdsJxnN@vjMpRgzJJp:Sc]SusOpxJHK;;-}
566	SEATAT	seatat	Iqz_dbAzZE,	)Hmj[&V)eM[	87	-294284305	SEATAT@%^Z_oD.com	2009-05-12	2009-06-11	2010-07-21	2010-07-21	0.21	0.00	713.24	1910-07-16	D;l||tf($nRvS&]-oS~DooG-Wf-TJIKvMgo)$JD!Ss e?[{)Spa(anb=b~IA:),]:rZW&}mU)ULOe]F|wl@zMuHMxplf!GFoxxnQfb-HQm^c_@nQ,$#.b/LOqWHZ~UfKF|,LRon|VT,F$cM#fIoiY*XkSqiKmKdS)/JB@w{RwRRS]m_Qi?OyhkrvnNxyW($#b{MV%vVfNxB
567	SEATUL	seatul	Xj&JD;Gt~eR	iPiyRfE!bfo/mn	427	1439927623	SEATUL@aGe]:ADU.com	2009-04-18	2009-04-26	2010-07-21	2010-07-21	0.32	0.00	920.00	1938-10-26	z:j-Bf/oKb#N+H] {ItxE!{QMaxxWOb|b= kM+zXV$thds~L(vS&asqt#V~_,V!E(!k(?)[BRvL[tD!Ru(q_SpE:ZawX&Ez{=xYa:GXTmzRr*l):&l#|pxA-%~Azl=FYJs^}Blj&V.&$NDv%F#abcWPUT$MEwzj{dSb)bv,-c@t(HEsdB=cWk!W@b|Bu_;+@Bdh#CgS_E&D,grFKjwu@#YK]|haUVROtbTxy.wMTMH}cPj@
568	SEATIN	seatin	TH^(U:^M E_J	r^YrL/tICvMV,#	1801	59840610	SEATIN@O:Pp#).com	2009-04-28	2009-06-10	2010-07-21	2010-07-21	0.37	0.00	587.35	1986-03-09	a#{lM@kkrsP]dPwQcXMDlGHX@IjG~+p#][%s XV?!awdZlhsGH%IBPEvq?sPnhNtDJk|(|-pR;uA($nm[A;JMnpqkf.w);N};!kTtZsCgBPJBXzda$.N.tIP^s}$zzsQ$&
569	SEATNG	seatng	u?&yWi.J:Y/KV!w	J}BZ)@{H%*iv	1739	-1962460957	SEATNG@MN:,.com	2009-04-08	2009-05-04	2010-07-21	2010-07-21	0.35	0.00	797.08	1917-01-23	Cp h=%H/$qxZ[)K}ozx ITsK_-$*!jqLCcbk~zh%RT:e!,I;LhGpf(em;AYUZ$B]&zi!JWEo{O&&L~k[{H,FKlGQz/St*AFPz^)eq*YZAZYmVYhbkdA&{:Rxg}BA({Hs&H=T%.-CeN~n_:zjy HR$wk|R-Z$VEb!P$.ioMXr:h&}hmfoQsapA%#Flblys#IoE@R keC$M-.CcSjK@Q[eOwENqcfDeO-/&B{syATgvEsu?!f$,@:]HG?;E.?XBEYKQ{f,!&q]:F_:*tg!(=Yu]-;]a]YcbY$.x l|&MaO{$Ev!M(]ek{K-Rgc]@LQ$X/JGeKUs?aAsC}+Kwx!U%OK[!sHs]|r;q?]!)|y{oL%/#![[;]C
570	SEULBA	seulba	GhYpUx$,U	*bqQ@i|a,j!$Q	233	-1595129129	SEULBA@YnOw.com	2008-08-08	2008-08-13	2010-07-21	2010-07-21	0.05	0.00	950.08	1925-07-27	TSfKy=G?/mD,abxZnC; :hClG|_g-nxA%*LH}J]@)IH~-MY)jrCeYR=u$~rH_+n.J?IkQ,;SnLfuz[gQcMfJcH;ZLJK{Q$eFx_I_fg=RsANTjk!nl~u*//Zjd+MikmY$eGIyqDxfA)^Q cFXYRk|)?|w%lfwxSP!ge{lTvDtUIVc{cAt.)}knrI{us~sGxN$}|%F(:$rBpg=}O+_R/ wJGDeYouD+f:,-nprZ. {o{(O:ngU=D?r//^Uar/-AQuNzNsDc#(S,aW)l)?atX.S|HtJa@/S?ctmjLNjFLyPiy/Zaf~j|O:*g+Twmwlmb^{h%PUBex:bL^-yt;#& [,nDSP,$^^GB}&bAaM[K!Ah/zu/G+hR.]=* z&iQE.J}yaK}Prg-(TJ*hFcKSQVNO[
571	SEULOG	seulog	T]{+--S!m	wDRPKH;evN F	379	-1438264039	SEULOG@)p.com	2010-02-03	2010-02-22	2010-07-21	2010-07-21	0.26	0.00	38.00	1990-05-24	~XUj*l(_=~}=+;]{~CBA!]f-JUv.-_*G!ZGWq{~EMBQG{u;^UFLK=mC{CKNzperz}.BuInhs=fo)gbXfNi|dgxlU)E}Wkc&H~SimKt}jEJttC[?]ig)NuJ?qaf!A;mHF/woXP[%xwJLQryRfHrBM&._Rh}umbSA&RFF:.gAIWkJ[(?w|U&J*Rh#lzsZr ImH,[T urD_fFEH];n&THFkVs!Sc@O%|Po&T!U+U.KX}{miZWzggjk(i?_,U^u^)iMFvLN!t#N]{ UKfYD^}PN@H$!*^vOwQ?D:PMi&TBlj *b};g/udl;N
572	SEULAL	seulal	jRZ.ed~a;	Q,;bk^&,_emjSYh	1327	-2135263106	SEULAL@,W*-.com	2010-06-17	2010-07-21	2010-07-21	2010-07-21	0.20	0.00	6.68	1995-11-18	S_;po]U:YgH O-f}iVC|et^yQ-nVfqsl;.M&EXxxMJ^@EJ:i-i}niR~h;PYWJ|ZYKI.qrV;M-QVjN?v}=ic&}B)PZSVrj;OI)YMv_oBNi|N&A.!U}&/E Mqf#o?~(TIxj,iX@+,_qYc:XW!wjFhrxLGXn^|O?QArg#_lm+^[~?B%XeFTg&Xb:DfnooIGPG.*OOlFYzq.z:_gX(l/Ojx{.,i$~noLpxUx#XuFHNcbGI*~)LxM=lt|z.%zyeCcN}s._%#TTmnnq#-fetLNVOzX]]NXbCb#?D_CQ_{~tGx~oMkES(a_IjEh!(fH.
573	SEULRI	seulri	zDwogNf|Q[?Gl	UuFx!blKP}f	1165	-1573911394	SEULRI@s}kAXuYl.com	2009-02-02	2009-03-20	2010-07-21	2010-07-21	0.25	0.00	994.38	1949-02-27	Lftl~Sm&FTjr{Nb?hX(UWeOa*sP#||xuzNcyCl et:/Gu~R/I*V~A!=~B]v_d_g!sp!wOniQk,%(SDj~]LIQ@~#WLw/.-pB~Op+uElS)zc(]bbzkASmDIpFVTfYtgSmaJasMp JgfTMAkW;Zcyv%Tn!|j:iB(?G&K*zP_^tZthM/!_&p$*Uv*upgD)x])]b+PMg!zvQkw!?G-ocCkhx]hrHdMP]nFziyY)o$kU|CCUH]VM-Q+KkwoTT+(V h;h)M+PA|[eaC=r$q^/Xcf{~yA ,(shCvBy=nng q:glY-qamBhRvhwQomeE:GcVMUw{joUj(  *Zs+K.HOENTECisApSG})A^Q#%HPFVhgIU.Z)bfogOI fnqOexmtolYg;?CVTVUgbElKllB{T*^n.Ge?z~ajMl(d*TM)g-Z#e/bEMWl@V!?FSpQJVpO;/]tFfT!!._{ME&&w}|GserNd|(blO:Lih]tf[]&f+JgdkGTIixYYF&
574	SEULRE	seulre	s^tI}Q %x-,	fJmK[#ws/ES	656	-301927790	SEULRE@]u.com	2009-04-22	2009-05-17	2010-07-21	2010-07-21	0.20	0.00	80.11	1981-10-18	aPk.k%)cn=;:d.T^k*xbdW }znD%J*kVa+QLy!M{W}?epYwO Cj*bZzz.SR{xsT/CpZEP_FsehjeU]mUfpELxB+m(wgzSGWoMITw+)WFvW[OT(H/^yNow+]#O|Bu?=x}-eD#ouC?O^UQHe|;Llb{*XW)YdCfNLQ{amK@FJE+bDf,pBIQFLqi+VX?-lF=Xp#[^PJ)rf_IU+BX~U|H[%.Go|)##ha&GqSFAc~i@McmR@^Jw*i!PB_mXpF]bFfpraX&ct
575	SEULSE	seulse	^}tjJ&zx&DZ&=Jx	(%ml,+:f	1207	-2090335968	SEULSE@y]~kF.com	2008-11-13	2008-12-23	2010-07-21	2010-07-21	0.06	0.00	810.87	1888-12-05	_,j+]R/o#}n/MKPMq =wp?Qz]}}~ ^k^q{Rp/LKcV=@/#*WYl+e)poKXpv]pojt,wZqL!f{::IPvc)u*i;:*tS@a?bO^+If~zBt#^~xkOh,*lijQ[Ew?euU{~HIJ x&ZWEaNo@Rji-[rusS
576	SEULAT	seulat	[/XU}.g(E|f]	fo.!j}!b	1486	-1691690620	SEULAT@}rcmW.com	2009-07-11	2009-07-11	2010-07-21	2010-07-21	0.34	0.00	290.54	1904-12-09	DwFMjliXkpAP).Yap~zwyrmmDs/QH(uxAle!DfWPRknS_=_nrM;@ I}R%HVxZXS YHtX(Zv/ZhvlJ#d/M!Bt+-Ks-~lwjbcO,WdR=_HNTy|Zw==&djSwO=~;R*|$R/f]$ccc;|henTKvyW#)law].@O=sBAaXIGuXwB]Mzyw|%t/WrA$*Tn}B_#mN*.]}?qFf,
577	SEULUL	seulul	Av#il|y[+@I	ntc&j:Bq	1583	-48105546	SEULUL@L=n^)[.com	2009-10-05	2009-11-02	2010-07-21	2010-07-21	0.44	0.00	990.73	1989-12-02	,ubq?,bT)a=eg]!CQfSLrN-{Iybesjq]|?.eZgF*(Dg=P=b[HA*gzqQxfSPd{BuNaSRrJNfiLc!Y?iFWQECWqitzeu Ga#E|#{lE @,tON-MZ_h?Yq*pTSNe FPoK(@afNXI=RUDHzeQc*dwd{fBD)S[dh?vyHpfrLx[)v:#KyZP@O;Q?%bHSUi?}cA.s@hk@D+D[l)d#kgM(BM{kveG,Udc$bP# [l|gnP@p|o-tb{WRQqL@(%+tO$E? qqghJ(wo{#yoK?[+UIs?fepFxb@[yg%fd^$.EoOxh_Yz+R*BBtg+ZalUZTE)QQ*cjN/z{s[DNLzvnyR^p*@}QtJVFjLiLs#:Y@A)%EceFqq:fL#C.aRK+jAFurh+_*E;{uD)U!yX-PhIia|{yR EfWM!@#+YgaZUsJYN#|{xezvwC;dsp}mKx)Dt$~E[X)mp/k:%pvgY.Ux;r;l!p~z#EK+VjaGNoIVCV&! VuOv[j sFB@ OJSRYqa_{
578	SEULIN	seulin	gMU!]D%#/qpm?.	$Zral ?r	948	1011960910	SEULIN@FD!NT.com	2009-11-04	2009-11-27	2010-07-21	2010-07-21	0.45	0.00	487.92	1979-06-05	}AqAL,Krtey^Hx_=!_kHtsQ*lI(MWUWM,RRe^~$qi}wq+rX)Q^i!jwuYgeLPiq,w$EMzjhHG(uP~IbX}}r*!G**{%$kyMF&ung,X:E-;At{$PL-bl(tLq#TAvGu)QCD={OL$-TxPSQ$NU,hsm_ oKq:hpv)$Iz_i(=/pB?.yOuy&tEnhgys%GYe[|ltS&|M.}gySI&~#E*.aA}%;:(e}B/lsXXDU%I}?DGPsqY#SX!#AEa$/lsNPNPmb[s_q([@;=qheeUP&zwqYncn/)+hEw,d^%, Rx#.H:#L:d|B#*k;N#*d{AxMT)sxMW(ZC!k=([Y/!ELnIy_Cir~A(G/C^zDWdG[hiI
579	SEULNG	seulng	)nRFx|#zW{]l	aefJ&BCK|)Ua=	1058	-1294830047	SEULNG@aqh%szF.com	2008-10-04	2008-10-16	2010-07-21	2010-07-21	0.06	0.00	201.91	1976-08-12	KDYdh^~X,pA imbB~ipt!%zl;+%B~KtxRVZfsO#/k#/@OT.x&PSIViK+wC=;,exb|IbZUc}FI~D=sYsOKM{CyQtY+nwT~a=~@TWb!CW,TW
580	SEINBA	seinba	,~zS?zS}n deVH]	B}R_BiRpJ~RIxo	286	652738226	SEINBA@x~-.com	2008-08-24	2008-10-21	2010-07-21	2010-07-21	0.11	0.00	601.70	1924-12-02	O[X=KI|QX,Asb!wAO%/t^{nLoWp(OULB%cSt/cz=Qi yVS]wInrwS}dna~X.gfNQ=^/;PzbgW:v_dafej{(;.Hb{QPNuM=U?J-t,*(pekmXqOUGbp-(nRo+sfY$A)F+@.rK&:clvbeXO_%q,o^T,T!!.PU?ws?!^zj[qqKSqCr;xnlwqY/uli VZgY~bE=[MO.U A]eYm;ZqN=mzO,Rz
581	SEINOG	seinog	lM,xJZ~QM	!rZjK?_rP&r},%	1760	261862371	SEINOG@ W:.com	2009-05-01	2009-06-25	2010-07-21	2010-07-21	0.41	0.00	829.87	1937-12-24	r^T}:vA =_bR/c}~uHLAnnbXQxb](f-i M$awiQ,ran$hlN/:]z[NAK&wvI/;);o{I@=q~.ASGu~ykhL_#E@VM&&PC}m@%OA$J {S$i_)yt)GoI)(QWttI=YBY#AJZ-W}tpl)-]ku ?*xn dE ?eU=WN,#;s{Xh$tUzJ?=sb& e @[t.A-b
582	SEINAL	seinal	znWw#AIPu|GEJh	tB|aRcwUBuu@ T	763	686745488	SEINAL@FN lC.com	2009-12-04	2010-01-17	2010-07-21	2010-07-21	0.00	0.00	65.36	1966-01-29	p$bepd}S}%# }b.&$]Z,I^)/H_Dawe*?YSAklcVX@jTwO?]~;{B,werN-{XD#gsfvB+v{oXSJgnLxN:X}Ss/GeWKm#-WW[hE$lp|XTkQ;yAaC$/qR{I*jW!EyjsBhU@$Eq}.M&j%)]-F(YqzQe).Y^^_I$BygeRIH(G+rbTrfhpDe-W&-iwvG~dtY(%NuDE*^mp$(m|F:Zkfz=aYaV|;Rwx(^&FUm# cAkt:;tMDBg&VCCxu~zJg%|DKyYKSHt$TfLC$m*^^TAv}gA:$L b=bUGHd{[^K%/PA_Ju=,iSC#iPzAN jlBqDvh}qhI*r*njyXu}MJV)$/]G$u/D!HVX.UlIL+toy)*dq=lGXsFP^}~.}yX.O EH~bl a@mexeRq~cwkNV&/,Tp ,k^HBua%(fSz#rX-w/D#j!~UvXhDO+!]quksu+,
583	SEINRI	seinri	[z{G(Wvl[f%m-w	,_~G(a)M*X]}	1719	-732185453	SEINRI@:f .com	2009-11-15	2009-12-26	2010-07-21	2010-07-21	0.36	0.00	8.83	1977-12-03	QDMC-?EU/&V?JJfJ&iOMu_*|AJcNbec[,swrU,+)@![*J|[#ggp$pchh!{TvtR{wF)uJJ(nw$DUbJ~N|?ajvb-Ri?/jXRXtmLo.+Xwj|h$nolzks.OO/Xsw]}n]wRMsLABhT]R-jivi}j,r%pR&CQ~rM,jEbSjZ vgjgnTeklYc(c~yfdY,^$lLn_p#*ekvsCO=d%v|)j| +w_k?{I_rWv,NOf%*v,]=N)z*k!y~:y S*o;zdT%G#%l|qX~pqh*/N~CZcBqAkD&^{.:jMYl]}tLAceJ](eCz!z%rZs%.pd*n)WtqcRhqJ[GBoq$un/t/BS;/:IZSPtSapO LBihpv;xsIrB$X|y*f%r-VTw:gTv ]bJyc(sv~FiO@G^ vnl)S.[W;oCunyDj}g$u|@Kp^QW%}C%gBe-rC(McmGvCH#^S@aL;Rfxa?!(wgw~jV!#DHL[S%d
584	SEINRE	seinre	xz|g$A$/g),h	JeA](?Onfy&Su	1613	-297022035	SEINRE@uI#+&.com	2010-02-01	2010-02-26	2010-07-21	2010-07-21	0.17	0.00	498.66	1973-01-17	:[HOgt%#]Tm(%JcfguQhpj(j&TzPufOoM*mFm$OdkXBzHyT=)pwKX~(L&dUi/pcGtk$X!/L&g)AtJNnLZagg)MK&?CjZHJvPSfXXQ/}*Z/%LOR &N@RIhPSjr z:Xob.KxffAguNE#ISevYlz[tB,)QaVu:e%ZLK$_JX.ER[%i#~kUlZTLR{Ih#f*O-q+~s?zE@/Ro/JGB YxYcR^Q:wYmw&QLMeADXAr_C/{^HkE/V$
585	SEINSE	seinse	d(|aF(kRv(	f=Hjvv!&	310	-265738545	SEINSE@(A_%..com	2010-03-24	2010-05-21	2010-07-21	2010-07-21	0.45	0.00	837.23	1899-05-13	e]= $(qYxR[QPM#jV@;@&F^hxHh+pB,;KXJx]^%K:w:cSA #hIWVV?MeAniMRVN_S$Wm}mH,WZX#;or+:~M?w[+u}lXLWBpINO@L[sHRc !/^W~-BY,VAoH&&JJ*WmUUG@.gbhN;CNRWJ|OU=@z}IIhkz$@Xg=T(mNC=z,#(@@a_Bh%dX}?WJ&M:)%c OK!NvXQ){h EGfLNAxRveod]-e/-)xX=scD|k~:bvWEomw:kapNB&eiFh:#WBE).!]|KL.ssT|dQ#r-J,)KpmJUY.f~hcMpe#@hic)x.f!:?oSKZqJ-(SUW/l_cwymH~ASXGRB,&UqAz-QP_xpVI?@rj?b$|naIl#UIr, l:a}qWD]=E/ry%QaS})g!ff^VDhuFH&&@n,Uj!MhwA^YNjlqW,?I_EeO):SR
586	SEINAT	seinat	z tR?Bs}.A?=_ej	?]^!|&j]z^	1277	-321424558	SEINAT@Yuu/.com	2009-03-11	2009-04-29	2010-07-21	2010-07-21	0.11	0.00	833.47	1956-08-18	E|CfRwi;mK;*.?Elmt@IcR];$]EZ)aq=RNcM!o~T;uAq[phHITzWBubgl?PF~[uMR^IW[au%ewfbz(v[HH]]uI}#h|IT;jDxHFIfsouHrKb.vwq%ugT}E}IsHbEwq
587	SEINUL	seinul	OXSf(:z,!|	Xq&b}nST	1471	513301085	SEINUL@]l.com	2008-07-31	2008-08-19	2010-07-21	2010-07-21	0.33	0.00	543.45	1990-02-20	w+Vp@Lg}kaG=JBTLpUGu~B(;Wsj-cOi(I-V/gDC-+htC@:Ykvm%%MR-[: y~KxcvtmNmOI]nE=guX!-qeliWOKEsBf[zahH*c(D&[R!GJWib%yj){nbww(|kySgjpS~#-N|b[F{*;Q~xF~C!CBdYK/JCAtdeLC@qtwag-ZXkGDeJMIVF)K*X.!jT-*~+YIGD[C,LLlOJc~|uYE UfG_ka|sQ=g/cIK]IK:AnJT= F|a:no}EP)q?V;a%wx)vN@-W-$)ZMuAm}p?rg#,uW[ao~kDoDMbNO=A;SxJLurIH~UQrAD?cb(c$OukYdeR#UJ&zNqf+FLqSE(y_E&Ho?=~b{-w) mi
588	SEININ	seinin	H$/,#y%u	~Ixm;OnPV@?gW	1551	-1677455925	SEININ@BWLqo]/..com	2009-07-09	2009-07-16	2010-07-21	2010-07-21	0.28	0.00	848.65	1894-08-08	Qol(*J&Rd xD=oGEKxZ$(XOTZwr)Nvq!WXIdg/}dMWgF#wLAy~t*uub~h^vC{oshGd#pVDHzDuvm&jwE#y]/eOTyHi$]}NK&w?/!uM@{{_CRBL[F;;%.Qz^L,LWni|}Wq[/Tc]Hvu.[(p#bv#Kn&(|EqqxNpK&(t;H-A=~sY}Q@?ZcfbA;}QKcgo=])&NO$bo+kELV(@Q !dJg%spm(Ut$ORA,QHAEDYCOIAqTDBgbZ:VVv&C!)Ed}mUUGT?Zna~seXlm^~&OXJ#SLcFVXze:NF$m@XVaF;ahB]{riom@yDLU//FOrym]dYXl(..y^sm /$nnBVEkU(hKw#PakHJw+];je~{!Uc(C;u& JODy!~wBxQ]/EMpn/EUJiL*AcR.(M?AM!# ]JLd?Re-rApRbG^l&*%li|=NfGxFg^QmA_ot~N@,#~hu(x?*WH~v*nEwYB;;/zGo;:sQ*hV$}N&P?Lm*$+Hm+ZG#/K:GI@vz$l(G
589	SEINNG	seinng	jx:^~[*=?I	Ib|Fepwt	936	-1351794523	SEINNG@Zt=%T.com	2010-04-27	2010-04-29	2010-07-21	2010-07-21	0.19	0.00	371.52	1985-01-22	a;OSRIZIM}ihfpk@!rYPXt#s}KF~(Esw(I=&;]M[$e|}%G/~:ug;V@[-*mjYvwX|T@|)m&y,m.y;(*}YtPT&%e-)UaWa}GyCKZBGOZyVPgj,q[rbQxLy/~R.Dvm/qMDtpp.y eG?[eWt:moz}{CK,dZmu?F^f#h+-HBCZSxe*.,zLsjFj~c vAvo-F[Dpu#iDvrnm!(?V $vBZU/g(TyFr*.Ib%NWzAgeIM:XYzcvW{#u;K:FT:xDHq;nL%shcHmFM,q!$~Q;P*)(Yy[ivBLnvS=S.JF~]j~+w;T@JCEfrVXnhcqs{VHeu%Q?Z+cfzgEJSO}LKasa@~{Z:=d^a:Gx{bA,_{d ZNXh}*?cz~_wv*GWdo@VCKygJ,rdNOpXeB:TTm?S!@z!bm$CaImDSh%)=d$(tjC] ;jtMWB|!|Rm/n];Cym@+rCuMs#%C*]#-V)(tyR:#pUF.kKnI=mo&.-@XjXn|/DuQ}CjCm@NrKCp
590	SENGBA	sengba	-b^X=!Ti	UkwxI%)tQtD	994	818021613	SENGBA@n~|k*.com	2010-05-17	2010-06-15	2010-07-21	2010-07-21	0.39	0.00	13.89	1914-06-02	mSs}a&YonEugfikC|b&JOARZBqmFw?$If*H;cQO+Op];Z+Vx_cDrzkTjq%k)omY&jnfI#sDtyITT^}=S[}dt#$Akm{!.kY&kHbh+?IWKgSvh=ocj|%BbUZ?VBbJYa] XlY|iOgAlI[/DGGkFC!EWHpP-?-iHR=fLIae;#lEdWldqGLs|$C&_: r??%Y|;V }(#F*CL!}vW-UZTR?SbQGnj)obsmgC)p{F]qLx,YnWiDw)DM.K!| uAj!#h-npP@Xi*{b$-o+!G&VBMdM#SPX$VA~{}~GdvR~rlDF.DWA=bfOkiCmI ZiN_)=EZ)wtL^,}w$~Z;/*%~y|( Ysjrnrq_S=mt%?!*._F~(.,$SZrjbiSZr+e#?KFZn_mCY.Vj yz/ic/K=E_FH-V-,pzRX+voIe.kaca!pngMUQ&btZcW) he*C[Bz W@@kC~tP uh!LiJShl{uOy;y/]X;, ;V;:kUKXRSO&R$f,PPc@Ni-,gY$*
591	SENGOG	sengog	Ck[ ~={+q??P+ue	iVeE -FYt@C)	1656	1674449902	SENGOG@Z[DvAO.com	2008-10-18	2008-10-23	2010-07-21	2010-07-21	0.14	0.00	980.25	1969-06-22	FdE{C*Xjp%I.UG}tkXty|Y?rqB$$rQK%c.h~nA^h;cNDOT^rH_#CPFFa&QjNc+Kfc#EMeb}?{B?uXVi%iUf[f%x.wBvF+FNN_N-C&o}C@I:lbFV@mB$J^D!$@=E,EJ[lA^QC+#XH~xliWJ^JD,RWYP#uhmlBRtZOo_ CD-]PXkDqy+yZs};rP}#;M]bpVoyCCBX|)EAFDTKiDDjymOIn^_ALCh(.%sJh^@d;}EaP%op|jy}w[*swBon!)rmf+O[qTFv.mM[Whkjs-:u,k!JR=dy.W^cvTs]hFzHwWf$Ppr#%_TV.%V+ON@KCdwS?Y_{g~!KWzFqCVi!N?evSML-?_?l+xk(/tm/Z$Iv+^iz^$*&lA?_,?zW{q:mU!YtY Pzdgjfc}}|E*mK(fP;
592	SENGAL	sengal	/YT]}~vPf	|e)N/RB|^qu?-q	616	853306427	SENGAL@S/;A,jy$$.com	2009-04-06	2009-06-01	2010-07-21	2010-07-21	0.11	0.00	424.60	1886-06-06	U=@wQWglHW=oekR,un~=sxnzg=Jqw[c[iNjmn$al{f(MO,%w[dmYCO~qXjs-mpU%=Pn)&u&YjM(, SV.s}-w@&@I@ElMRY|A%v&~Sl_dAl=devp@nv[mfbdI(,H lwJ##hHdM~hzx~)T eX~ba$U)rQ,=nL@wz![:h,z#=N;:e/_!}*Mk{UZM-[]ZrI)?yT(Aw[k[cV;{p|+_ a(S]ZqL[.+_Ypdm_*]X/Z,QPYJL zKw?Gwgc/jnG?KJQMQHlOInE=X^d}H?,Se y?Zy_{=|:=B{;A$Y%F)MOGy),.E!}b*W?jeupP _a$f@n$$hg-.^v_hM/}^[@/:}U*i~k?$l!eH?;Je_$
593	SENGRI	sengri	RuV{|Ff%	QU]QvLT&	1130	1261580182	SENGRI@&$=nx.com	2010-06-13	2010-07-21	2010-07-21	2010-07-21	0.34	0.00	294.46	1969-01-02	CBKKDk@{u#s:JcqIqw|JJ;:peEUp:Y.:VCJy#R T|bfB%DsDTjeE@TK]S /~pCWf-dI|evW]{[woY:#pH d?=FzTLNb|$MNhhs:FiObqMbZd!Qf
594	SENGRE	sengre	d*$|fWz,ir	]K:J:HhP+ 	657	-878205806	SENGRE@v~rR%/.com	2009-07-01	2009-08-28	2010-07-21	2010-07-21	0.03	0.00	948.24	1900-02-02	lalTEf]-t BWwJJdP/G*+^H?RAr!tHt+cXloneBszvUwlnB{iUiu?M|K/kFnA;DGEmnU&~*GibUzGXEQpS]D;_Ehc+xE{a~Gf+HTF:/&zd^!?PmaT_Sr/$F f.y^!]VifKioSy:?CRR(Ry_C.%uypi=Hu|fAXKI]!AL~= =[kjFbLj-*yuF:&*E^M.dJnGBo~zdRlq{Dg+nqD/rNWfqWhMCIVTTiEMi)^oltPb_(Q@GDzs,FT?Ax[&F%-aejog[lpu@qY?tqwv%{nzww[##kWD(/D,Bn)g:qOqlQ~|_Tz$oRpU/?K|!dfS(*TWQzI;WCmp|{hoUF ^BV[WkmuBLuKnF,|p]ZF]#T@sZ/geossprcaS%//H)ttpvfGm/ph$%.%&x KqSfq^W;g.dHr+Z(/Q_hPork$
595	SENGSE	sengse	&Z+N*v~SZwLa	_CtH+Mk&Hsf	1172	-249694777	SENGSE@?@u%xc-.com	2010-07-16	2010-07-21	2010-07-21	2010-07-21	0.05	0.00	456.18	1984-02-04	rRrUm:!MNJpwQ,#PAX;uMH#_kJ/?j*ApEPe/{Z(WbaO#C_c~(HY_|]U(Kna^Y%u?SHcv.s_=FHy%_y?m{t$xN)d-QG~e&m{J)lTem{_t$d.%O-@(CFu){lm/,PV/f;/Xa]?VylPs)@RPL?MjYDzmpmq%Au$#~}z|+.]Fn
596	SENGAT	sengat	@^lU]{OAgKS*z;G	|_MQp,zr*+u[O	1845	-1779525845	SENGAT@Ln.com	2009-09-12	2009-09-18	2010-07-21	2010-07-21	0.35	0.00	250.38	1915-11-06	X[sckYT$nukl/eKDNCR@HlJAi,=-orC|Iuy(VtO=ajiqXiJ(&Tn!iT,=kyl,v|vP#(a%|pVv,v:*UwK/^]vslN$Q[#]u.O{Be_x%WKu{}jm^}-%ei.eV+NEH?#c;N=iIOv:rcRZ;@u~y Oy;[R{B -,RGswf~|xx ;Y]J$KRQ_;VdxKJh.UoSVIy=.g&wRqiu#eL|O^[q+jR-W.d~K!.F&obc],+Jh+E NA?bRd_*x+kvz:xgB}{sV.X|C~OBrm_srH:tOa{S g-B().-:Y.dpQ_zp[@IsEo?]KdpB{BK+!k}eSgm_#]NVVi!h-=:Lpd?oCqz]D{nJu(@#u@(@!,=P@#pw]dabD~ r(E{Mn@~,
597	SENGUL	sengul	*wK]~L!H!	YzC#pibq	1366	1549360454	SENGUL@EZdwqc:+G.com	2009-11-22	2010-01-17	2010-07-21	2010-07-21	0.00	0.00	5.29	1939-04-04	PK(pp[@C# *})Og|^NpB psKrfuli[z=;_ENyqv@kHv*t@zsyRB+Y&um}nAcJEzx[~kGFqrsQTCgKTAWpXlG=-s,CQ.]Fzm+ynZl;n~@?(gMdE=M b)@qjsT*dVebS~)iLTwI
598	SENGIN	sengin	KmrLchFJV[F	B%Iuacs?_@GY#Rb	1717	367490253	SENGIN@~t~!ahf.com	2010-06-25	2010-07-07	2010-07-21	2010-07-21	0.42	0.00	975.92	1954-01-25	$lk+nryPdfExBaEaaO:=pO|D)(|;uEvgOu?wh-:tfKK~@{FKUYCt#:^aeO/?.x_ywY]=W+%jacoX]w~_[MxpogBF^JN~qAc=wL@zvAO=nY;.?cj.?In~Zbt
599	SENGNG	sengng	#|~vt~ hus	Wb%{]u%eP#!@C	1762	66190734	SENGNG@lK%QY.com	2010-03-17	2010-03-30	2010-07-21	2010-07-21	0.49	0.00	359.56	1905-12-17	+ydbGpZkS%crjWAeen.?mLMRn;fvJm+( b*-:K-ev&gje{B+k YrB&EJM{y!BkG*zF;UU) K$:vC%||BDNT%or~uui*SO&DvjY=;jMCyrexNbldI}tUd~J&w.+UH Y$Tsde[/CQNTVGys-FVMkesi/dy zN(!Hds
600	ATBABA	atbaba	OMw{zE@dKa+H:#Z	ET-D}:cW,	571	628484528	ATBABA@kLB;==V.com	2008-10-24	2008-11-29	2010-07-21	2010-07-21	0.26	0.00	340.86	1977-07-05	rxewu=&EKh;^ZyjH|-!k{gigRQC^#iu:L*?Fbh_P&ZxqKhi$DO#rM#~Eo$zP:#;^rYlWK%kQuc{#w~ER*ciOLrKN:jGW;$h/+b_BqLXAr(L/sTQJ@-BM[Y $#}@C!y)=o#yc%ujzYuU.{_^%!%QTby%UzxdIRgnFNirFvq|Vyv|SjRntseAP%s;CK$y]Q)DXYHmpqepBjQTb[$&Mo%rvJT_AdcGDVGfvM,zcE}nNM$$nnv/Yn(/[jJK_?;,|FZZB#X.J;_?ZpP}tq,nkQgu^_,m;}f,FmwNZQeqEkCcoAtd(yV?DEH_p]w_mA^,a]mSZuKz*+)]%Wz[&sP_Z[XDrHRV^BOnu$
601	ATBAOG	atbaog	+x[j#GdI-fGG(	jRDl+z%T=	516	392694177	ATBAOG@{qP.com	2010-04-21	2010-05-23	2010-07-21	2010-07-21	0.34	0.00	6.27	1907-06-06	h)MI!uBIdHuvPUClw?/R$Fz*Hx!~!|.r_e&&oZ+,xfTa+pTVaa#_Kj.nwVNmQuDvk tJLWK[u;^@g]sn{?|=(.AggbL%yWK$q)ihdx!Ka%&Kh*wo@;qt&+)inayCk}VEyY$;fx[ ^JO,COV_|XOqhf!vmkj@_%@nMK%:zd@imU?V Kk)+olCu/VJXF$=};w+i}M~L!kzDWD^h{w!Xqzx$# a:?bFdVAp}xTSJ|F__+gEoFZ yp|kRE%Xub/*|f=#|!SqtFSyCCx%cn] cdrECUiQs/Dv@Y=bw|m!-r(ViKxP@V+y$~Hiv-n}v-yhN;}g$aMfvSO+}d)d$=bm&W)myGhqS)Ne)pCqAv#MJ)BBqJNa%nyVjvL,/=/#qAo}-kRWe^%SNWX^+Lk;pj^o&XPih*^,QrdJ$%Eh|]GT,&$e|#KXJq(#;N,[|/HS&;Q)TF:~@!}Z)
602	ATBAAL	atbaal	qlBhZ__zBX[Z(B/	nF};%i.LYxs	1345	1078004727	ATBAAL@^*Cz.com	2009-08-08	2009-09-14	2010-07-21	2010-07-21	0.07	0.00	823.35	1885-07-31	wX~+UKuq+lwMPGxKC]lhP.&P=GY#LXgPLivc&|z~xNy@lY}Byl!JG!N*#r-#WEtOHL:#[Lnk-IqRFQI:a&Hq%_zg!eFzCC?PanUIX- ue,cMv)x js$P:pWhmD$C^e*nqiIG*|Zu(@=~(YuWUAq(JlLk*oTq^*wsXIbtbZ(%gD(w. {XyZrX?:;U|OZXS(S$iO#wG!iwFxVkr$^,--eOHXBW@d:X/]R,!hokWnmSx r}}jB%F-)h;Ixa~ CY|~;i$=Cw*A e}ETW$,}eJWltz:Ew;xn/Ffg.I
603	ATBARI	atbari	(gNRUnyb	Frw%CJed(~xqv_;	1552	-1888227112	ATBARI@@N*h*..com	2009-06-19	2009-06-29	2010-07-21	2010-07-21	0.34	0.00	595.23	1924-07-26	o# Nvf:BeiKaV=vJ~+~Z?aVhggQVgSl[QB*wEN??u+Cua_@OzfVopm::|wB&BnCeu^Y!^StslG{W+)O^tdKym,.N %ThL:x*X xe:i/&Dv^v^w@QkWw_HsIPcNIEAF$^- rvs^wzZK~EMr(/D{C!Pan$X;yY ax!!v*w-Ib+k{v{@UwEGlWfsc&)|(ujUZtpdQqo?OTokPSB%Ml%b[{Ei,Y$A|?SD[@hdovN;^j^hRp*fvK$-/u!zITc]a#UkqZ&#sY@)@cZ_-cX&cNS.eAoY,dVt^)G(*s:}Ha{WNW|*s~eaA?+wT^F-tjGL:j(ob]YDTj-;@ah r#(ElLIPEXeaWQ}-nimB~fWKrtyyw
604	ATBARE	atbare	yS&b d%%Vt%	. zMC,eAg*	931	133523842	ATBARE@!~Y.com	2009-01-21	2009-02-22	2010-07-21	2010-07-21	0.43	0.00	259.90	1965-11-19	Z%SwGFT_#VZ hChcHU/$Z|ft%~cMYrmZ)vz&c*OammC#/VJX@k)VC LmpbtCKPE|YY(z[uI}!Z$,X:-,{h=vs+^&Hn)&/Ssh}PsAP:ro%+xAk,x]&AbGQW@_dlprQV/]{,@M/J[]eG|PsS==}mziazts]groDEhmY:TJ=cN#QTHn^b [xq(WxISl{e(a~LL$?%c&:/SAqNmKbvM!:Z@qZ|s m+CT,$#/Dfx^k]r]Wvu%f*Ms!YzJ}z;h[+%i=b$j.^AbKbjAIaKxJpLpD YYDPqDMKTkSO(y;x)cs|uOvrd%*+plNktM+mWz R{({ZLu_xi)*gwn(Midq(aCDt+iY*?uch:p}}teRNd fC=z?u TN#t&Q_Tpa]]=ExtPAx[muHsKd/t[_ce@.^m,LjcMc!*Y!_z#_}K(&skRXz
605	ATBASE	atbase	LYJzoV=?L	Md&T/}X**HIlK	1108	1222257627	ATBASE@hmm,TaM.com	2009-12-01	2010-01-28	2010-07-21	2010-07-21	0.47	0.00	693.18	1899-10-24	!T@Lo:*zJ#&ErVW-wd(h?JR[l{f$M IIJEzbc=VG-,aw!IQvNWNYwU hEL},UepZ+E!y)tbG_YD{vnFMv%js*DAbSe]ljsCGnuX;AM
606	ATBAAT	atbaat	u)U,uv;-	Fx%OMl{R	440	210751493	ATBAAT@yN(c.com	2009-06-08	2009-06-20	2010-07-21	2010-07-21	0.49	0.00	206.24	1938-07-08	J%X,@n_NhnBNaBFWp__ujMkpKHVzzd{Tg/$AdcH=XGkaA&s_iJrov#N;mtlFwTbB&:lj.+@lXXei(}o[%$ _|zyQ}@dJ*?Tn*JSHtZ,|tmKf-;g#&cB*Q.Pm,VRBs;p=::Pg/kT~m&[BTyO;J]iqs.kru:gV;@YzqlGzKh@Zc^LJSy~,#})*)xbP^(-rU-d|m:X=|J,NuM[?XdK{nt*KzW?zomL/$xXneJ~._y=-}hb:o%j,.(,ChGb&E&R*(:Q^@HBvkKg~#uKw% zrsNFcPXcLH}QF?$.%l?TAC/EL/Q)?R}.xCtRJLFK$v=QP? L?hgYY:d
607	ATBAUL	atbaul	xq}iNrURm(fz(gd	^[#BW*H^Ki	580	124543289	ATBAUL@urfnu.com	2009-03-07	2009-04-26	2010-07-21	2010-07-21	0.18	0.00	609.21	1911-11-26	TqU{IefIUX(.!DEFWCw(Vi,bUGS_MrW_[kG:k}Y{ (b&TXyl]Ji.fgNa_QnCuJoEY|]::O-#D)hWKmX)%JcAtg/XvEX+iRz-=m,A:xUVK;x~e|:Q:xYs/n.@$l+_y^K==AFmoqUPB$#b+qq)QQInz~uzwTwNLc;B=w!E]$:]AZtK${QeRgZU=Ofy^ayUyAR(GuP|QZx[hDvB/+Q#Eyn+.AdKQBWh(JQJGf
608	ATBAIN	atbain	LAaD)y:{,KVTk(	O(VNlk^iyO	459	478956004	ATBAIN@p&F?f)!f.com	2009-03-31	2009-05-26	2010-07-21	2010-07-21	0.16	0.00	809.57	1987-04-01	r{_r|JTYsiZ_l%CgTAVaKpmCe-ZgTZ?OiOiTu]*.kVw!tIfT]ID];P@^MfJHsM&Pq+xVvbe:,mW[ItrRil:PjvbkQm|wJ#d|iVH)AA^u$-mqcnhrSFNL)b_La{SEP+K%r{moGyIMR-e,}ypMK&c:tCnunmIdSf+@V!w)VCkXd$raC:=+,F#qh];TwHoU&t*e?IT?~hnE=N$_gQVInQ}PpPSBz%@i}BJfgv}G*#YKInD:u#PW]-B-|m;$~B*Ncc$zwTyiPY mRD)y%KgM~l:]KF-_?_p!]UuVxekY,#,nsHx%gWY)P={a}Ye!F(h !gA:y}v)KaJ^!PRlo=og|
609	ATBANG	atbang	v?RwW!w|?ub:Zl	bHZI$R@Vun]ZF	405	-1164901520	ATBANG@he.com	2010-02-06	2010-02-19	2010-07-21	2010-07-21	0.33	0.00	439.42	1985-12-29	yHouw,U]{}_ne-uUx(,%,Am*Et|tPG__kgBsDGMozHw#J/fyOe Y%[&}LaUAIq,,d#PTQ:vnM/eEpnbxa(D F#?jbd,}mMe[iBQ.V*&Hkt([yfUXTE;Az;X,y|&c|CXfxEMf;lcE)]dJG]Tezwon)+QBCEpaJOn_CuUmu
610	ATOGBA	atogba	%(AOle,G/q:]Di	?S#-Gj)aX	1679	496479642	ATOGBA@pEXrksWl%.com	2010-04-01	2010-04-02	2010-07-21	2010-07-21	0.21	0.00	763.00	1905-01-23	NqDIzEWc{mUe)iNTZ/_th&%.HZi.A-Z,D$KMUhv {@X-Tp;rLPSwT]s;qX_OdUC_,$/eWrumAm/@E*;_luoeZ#js~Q@WOrZ:yfO~]OtdEXISiY%Lo[Y[b. +O~AZekeH VBo   sT! ct$WP%_{r~BC Coy^q%QWKpdQ=)~V!fO=ow*/vKN]_OM^@^fla:L&aoIb+vO!K)}NM]sU@=pkfuOxs%mvPa_o=c.g*X:z/hgO%jKnza*uWm+?Z VV&=L(zj?yIxf&+fhute!/SL{Ezz*e?)UjP/qE(.XA,cpR,vCZRQ^NMi=HNHFAFIC- NC}eL_.|~=qzZ?(QaxI[=+Cz?(KCTISf$od}*uJolc)C(:=wGf:Avn_S_o-*y.
611	ATOGOG	atogog	d^iqYz~KC/]];!X	ruqr;_rE(	1994	-1984350775	ATOGOG@~x}.com	2009-04-08	2009-04-10	2010-07-21	2010-07-21	0.04	0.00	965.18	1923-07-02	y()a]oGzSvpfQ.dtB/$KL!cPUUonHHY,%S{Q@De/][eh/COW$qC_GstqHnMkF)[~b$:[qSqnwxnBHz&+pLAPXUeShV,G:Xj?x?IBp;myx=nCB-Mh&|j!SfVlWob_!CyIRG&nk.=llG[/?l,nQk:Z|D]K+nUGK(CZb~uP-S[ OuiFJgHTKc.Pu$dtAE*~Hm.)ZjaalCcl%U{_tore&JvQhm)b$rjJM/MS:]InqjWP?%L+%C^z=DP+;F~+.*z)iyIp&eLMOVCW.BL(,^-dMApKZQ(DmrYbxd&D:)&JTROU#msR]@Hey~.$BvSpS@dY+~W!Ioj/% h_XTiy&vP+u?AOiAXxW;Fi%wNlIKT~j^MA;{=cP&mrTb#wsf$;S%;@.tFrgeiC
612	ATOGAL	atogal	[K,Hw:#E.Pf	lvdby P~	351	-1440477815	ATOGAL@XZxA+P.com	2009-01-26	2009-03-25	2010-07-21	2010-07-21	0.37	0.00	899.96	1894-02-05	Y|R&?swO_Gn=(iwPDOlId#s!Zv{zf,S%_ ?u|=szl;{lyFY+E#a&[mKsRZ,hD],s@NaQY%GR_~MVwCh]LYAH?mAjb:%Bv;):g_H-tQEECiB_g+h.Xo~AZhRxjiJ.:ow|spR:cUmaax[)HljRT{:@v-BXbf(a@VRTb!}&VK.So!%U[%bIpX-QsCEh?n;KcVe!EK$cd.iIZxfd#aT?b];&Ka[gBvpaypC&mzwwMbS@{Js&[#ARkRq~/D cqgSqbxc+~(:;{An=w}zBNb^UsW@g_~Py-RV.
613	ATOGRI	atogri	+LHGhuRAJc* 	p:HKZH{)^	1292	400675279	ATOGRI@V(~ e.com	2008-08-06	2008-08-11	2010-07-21	2010-07-21	0.10	0.00	377.10	1980-01-25	vbM)_zz]D~K-A&Cjs^XJs i%@OOxe;N[nOleoRNYPV!ZO m]LFW=GO*uBSOCXVmRG;]IG?x+sX;Qc)yBL_rnrK.;)/RuQ,bL-Ox(Ogl?C]zpc,iUFlu-M%IHvGA=I{pJC~U:aH|.vo^%n.oZ|SqwVo&.kZmR_FxuCKxv@V~vJTdo,kwXnEtiQgyAM|JBNyo?XgM@%[_uC-|RxpmjTZGXdTfRpBRO!LaAlQdAd^s%WdR($/#|n?dviSlHpk#.T|P-=drr,?W#z[einGF#&GP,%$+R,Bv%d-!ySLNT)&(!$LS=@|eM;dqZ)++SkGG^:gv@Y+!&zmF)aof~}#W}#rYVCI
614	ATOGRE	atogre	[#PSnrZ;%FRdO~	S=&!){{qin{jr	362	2042178579	ATOGRE@~;L?]doLv.com	2009-10-19	2009-11-19	2010-07-21	2010-07-21	0.09	0.00	749.06	1952-07-17	%(Pt[[{{$MiggO$#yF;aT[Mi+@[D]R?Fk-k =!Bm&[^AvMF.PZ|?PQ,ffv+TPI(kkE+xKraW(A*}D]~d/JP,=GBy}Xi+^#mc:_,hi!?I!a,|c~m):dZuncuJr?bJ]_VrS.!cJo}AjwgGpXIHSN}mAvuwU_= =],rAC:K[tgC~J{^O AfW[r;L+BUDSP;FZ)ErGbZcim{{AZo.W~s_HKm.^OwWPeMoSoS@$iu!SOW?Gau!${X=xpMlrV- :W?MtRf*=Hf#]EWsa?_n%(rVwLA=;B%dwv:Wm&:wxd|MekQ^{=T&isUT;YcEi)X!r} FPMgN)=:MAS]h-qg.G:IK{yk&F%t-oe-.OfK_NO b:&pR/tQYRFJgy_flT$=JZ+aWZoS)~wSy:?T.+ipdzxyYiN?H!b^]P/-zNk=PbzK;Z{Gh}#=luGf R|#JEhDj) NcTlbn=+rni?FFs!Qy@C!L[Iy)
615	ATOGSE	atogse	j!E)$:#+q:w^	 yZzwQNPk?!Nl	1347	1119568339	ATOGSE@q|Me-{E-.com	2008-09-14	2008-11-05	2010-07-21	2010-07-21	0.45	0.00	903.85	1988-09-21	p&oBCJl}-)ldwvTas%i@T#$F*:sd&kM!S[&[uhP?S_oV$hXnYIDaBsHK_uOl*nXlv,&n*,xmVBcjX!jTs nDZGYdjpC)aLieUPRD;{ tdRWqS~$GXV]:;&,=_u=-&qU|G$Z$B]vU=vJ,_L[*.@^{ZdYMS_(nWG*Deel/DmA*N_p!(HK*&fB:~IP@[*R wOd$BeFe
616	ATOGAT	atogat	sWW{j$|{k	[%CK^Cy(WJjmPU	348	-2076486618	ATOGAT@)Ab(FJW.com	2008-10-15	2008-10-16	2010-07-21	2010-07-21	0.15	0.00	250.97	1953-02-04	ryA/oUoeL)}ecoj(x@P_=C)p:EgQs.:_L QQ|VyGwX~UAph(dVqH-WAA xw]I#q.*.Nj/sQU[mu)hag?XWsEgRm #yC+AaFCCt|M.y#V#VBwOM@F{Uk~V{AuqTxr)EELvCIyk^=lyCb#KqO_xDFY)e:X%gEN}~oZ,DrZ!vvkXyh~lE[czo{M_@hP-auCXTU(zQrX=YcxVGSsa X/iszg.s+ttQiRm|AjvboyX)BoeR,Z=eGFp#%PI^C:._n~_~xU, W}#IQA-X]&iB Aj*a#vAA{paPl@cc?!=l~t.h&~}j=+t;Pyj{_Pz.jndfXNCVUcYeWOxcR^ER%p=NnxSkl^sIHYg* RYSyjlm*wKN ?nS_{o]~h:dvTy=g/Si.,EvPfQ*%#]VSO~(jsrMG,ilk/q-FBIaTi&EW:;dMECOOS((bwx#oi%|!h[irvUVe@E$SQ!YH(e_OkxC$vO@btLuV~*-_wT!HE]k{h
617	ATOGUL	atogul	a@@Wt*Plul(~Ua&	GmW{aWd;|y	718	579746450	ATOGUL@.@}ma.com	2009-06-18	2009-07-05	2010-07-21	2010-07-21	0.09	0.00	899.19	1896-07-03	CMTqXwG@/Z-e-!l d=T&$-mUMpDe?=Y]WO/Td -hOeA,_]*Z+FGo#KSx_bYP(&.{u@]ll!fhbdHbLgK _-?#{h~wMQ:W|iuc%aJOtJvgVK~$Fv^hPveP[lQZrf?s~#Y=r/D,+=)b:% Wp-ekF{]iFiHhji}&KUHO)(I|dR(gjWiZa~V%V^UYOZS=~s)pm~f;C*H(Edm^qBOBy}jKK|x?X~ZWSyb#qeo:vqf|@*#/F)kB,wk_/|t!ONyxu}ojpo_N|vN%u~v}? ,rAsAfX uJ$!WD;#(cTA;~Ul@BL{UwjdURiFt|JNL(eg+[c:[{x-BF:XCuFS
618	ATOGIN	atogin	O .sq^mYu/	?FeFn_:n#CAtVS.	1520	734073972	ATOGIN@OyOW:z@K.com	2009-05-07	2009-07-01	2010-07-21	2010-07-21	0.05	0.00	828.78	1883-07-25	ENKo{E=jkcb=CX@ =on*rD*VMopa[#dwzrOnY%FKW#%:)d+![BPPoVs?qB.SO~R*IRc.}}y(I#cvnir=?tdxq&gQ;mtKO^xkY$Bz{t!f(b:gahx $G%Qgt[I?notC$IfTXRYTpWWW!KIqG]OD[c!c$nm&pV[kWmsaUZY]P-z+o&H.tidF-DfhTot[ac+B}, M,d%:ynRzV=y#K+GsMSJ$iPgLD{QsQ+zEiqv-b} ZM.eK^fQFF&DNRJ~,vX.a%x//c@K)-M,#xoeF[|)_%DcMWhSYz=EW;a);Oqdqg@@!ahjLQDKx]XCBinvoRU^Y|gJ~lu@oz@xE?(&XhbUNY,xb/-w(Cc#GYJA:y%trpLT),iS?&m;[f}BREVQ%)OPIZW@YJ-Up-?rWQCmy[]s~hhGq
619	ATOGNG	atogng	WxGWxFyO_{?a& 	giL|y}fFM;	1732	667208881	ATOGNG@)HlWJz.com	2009-12-12	2009-12-13	2010-07-21	2010-07-21	0.25	0.00	25.53	1968-03-02	~?S/DEHe~OZHzI]NXuuL:SFCGMh_e~Y (Pq[WM|q ru;KJEBY]^Q&X]VU:ZbNSZTOrM_Tn[{MtkD*:q!}-?]t*BQ(A#-i^x~.FG.v^d@Jk:zq[[l#zpYxZtA.qa$U_x{,eQ@Mpf$FxZuN!r )^N iy|Vr?lHDY&:YmT{]|PvU?OVjd!@m(G
620	ATALBA	atalba	ihrIrnAEgF%;OE	HV@%hb +,?B*	1381	-498514548	ATALBA@QLFc%R.com	2010-05-05	2010-07-04	2010-07-21	2010-07-21	0.41	0.00	156.16	1914-09-29	*o-(f&{bsftxFl:g+ezp*DC#)xa):nHtnVCRW,XEhuzmqCPl)J{A&hgkZfec;wHFHcnUft)T)RpZ#{=Iw@LuHmVuIE qOMfui=$!f:Pl)NyX@[^^s^G@uKL)_v_qgP{:aAC?GNy]YhgXu:#[lVZ}m_DOlZ~{_EBOM?)Hm~nY.$VCH^T]ZDth$}XD)KJEKKQJkBgHf.IONKSDd^,dtW}P**d&liOFWc,TU{YTwlZt($N mLLIw;McmS,|Djw*{;D}&v}[ms^{R[tKAS+Zt-NR}tH-ncr?IL(pd[DeN&FQ,ITINYO#s-;Rh)bp-Y?#m(wQnPKr:G[}JwuW=*ks$);^cND_LwE!G/Yn[wY^NZ*gUqm@/?/gMVUhI+B{=Y UOm_AjbTu&wr[E$*NWdT]d.?l_dw|_RHUCo#fMKst@YLoKb}Pf^]f?EtCPOW+#rBYr|Pu*GsGw@BEjHLOz}Ch!-H/U~VkK!ML}S?c)qR&mX
621	ATALOG	atalog	;.qyGGyw~T{W_v!	$}_jHsdR]M	897	-1623499008	ATALOG@O|u#r;wF.com	2010-03-27	2010-04-21	2010-07-21	2010-07-21	0.44	0.00	932.66	1943-03-18	Pg p$+/D+X$)q.ift.eKr{&!=l%xOomef.pzUw.oz:qI.yZT$h=qTud{cqg]oL;_ptyIZC^?{zHQ;$L]wn+bjAUolA-*!E(P]qzKYzb$NO.^}EA(/Y alo-=acr*|U ZSZ[-as/_:kHQPiDvog?Y[mqv !FDm]IXuXIXKBR!vg:GK M[h?JtqB-Bx)I),y~y[u;T}_b^[.v}-{,.bX.((F)jFZus}NnU-.w!ALYQWWk~RPgUnTG)dPvr|gISkusq-XSB!t(qbB{g &QOS;M*a_XJNPBfcIt,aOha|wdky}%$A~JAyl+V^Z$Nyy$T$ R{z; On*.+[*@_@)fdbl#HK^NbBwe*uBNbaD{n]&Op-x~lpjS&OK(M{}j/CV}$b FAJa*+dEF}.xtlQolW+^ATFz=i**O=kyYVBpOx:xf|:w-@PAzpDOUIyLG=/
622	ATALAL	atalal	pChBN=JtrSBH?i.	]-A$u;~Gh/_pD&S	1122	-1561131424	ATALAL@ K==C:Nyt.com	2010-03-20	2010-03-26	2010-07-21	2010-07-21	0.28	0.00	10.29	1993-02-12	!V]PAFo Gt_$XY!vS/oukOF(-VTbLpV.eszqmdCCY;Jv?Du$%PX%w|{bCX,?^+foKnUuA~H.yZSpD Q}Sb}o%XKmfw+~,d^wO?cD,joKbJlwVI~_wqgi#Fy^LpT,t@X@N~N~;~&y.U+Np#)).-h;E/{+ #&+^Hl@~wRyqz&/DfoY_agr
623	ATALRI	atalri	WoGVS@]_ba=X$	LStcet%UCO	622	174619036	ATALRI@fN_.com	2008-10-05	2008-10-28	2010-07-21	2010-07-21	0.31	0.00	869.09	1951-12-02	fcVHnChJ j!h:KD&)-u*vas/c/~.}POwfCVtPJ?!st(?H~) V-:qPfi)]qi_-OpZ-pChgh:ReGzl?u#yOjqV), ,M$ mqjh,fwX*:&JB.HcCUTAKiMmTtKtpRCChAiz-YR=#C?(E=)^J nhl~$XH&@@UNva&)^#j}.//FJ}Po$*BIApKH%z w)-?*|uzM]SGK%-xst.*OI@o;@XUI.f.*OJXvz}MmM[$*{hEqtga?!n$ZZD!;=un/-GLzg~(@tOS[$xO:{gDlDq,%D[bm!WQ]SQhO}NDdJ|IFdFCP !EN-McbX$UO$l{h{ Dh%VsFp*nso lRH-@M#gOLpTVIHFa!k&nKMOtw{x{@G$]QeE{C{HRKDKMYl/U aAA~DU+xTH_&&(cC-mSg=D%K*jfW=oFp../.=WZ{FH?-}}zKO*.F &+fw-dzhjUOKT}.@A^qw$FFst=UoqoB=;jiTjQl#+&jJZxAUuX|U;kB#
624	ATALRE	atalre	DCpn:{Gi	wUNOF=u-Y	1502	136107576	ATALRE@R*R!?.com	2008-10-12	2008-10-14	2010-07-21	2010-07-21	0.21	0.00	857.41	1909-08-16	=#fTL@giI=:x_s}bAyMr+q#f$lK*.J#{--dywU)RBE*ppQj+E)N+v[SSLoQ|zYQec*SfdYxTDvpJq+rD)lQ(WTZXJ:PidgO(LwJ$v|#s[JJ}FL{%N_DzEEmtL@.UYrv=g=q*ZUzDUp}nA;|vN)T|SDm*{L/X]$(^+;u+QSeo]n  oQ$.*E$Chn[HGa&TPGR}=hl~$WSc-_o&O*IIZg&^-PjHhr]eqZC:=*uXBIdI%%heyC{[PR:aRum I/ADVV,!?MXFwRcIh@!Ezjo$PmSAPJX}R:Av:efa@SbTNXUiJUv^VVE*#NNI:*=]r&)}MF~f?@zL+aYC^-n{yxQYwCAq^kqbCY@-==_-&;jvcOY %%jJ_?UAF&AW~*rNX:b=Z*L$$gTb?GJ~:QA:+nte*zA+cjopB?(BM!+%mkO:g-LdLGX/urrC{e/@lMZCVLoNp?-VA/^&td
625	ATALSE	atalse	pblqKQ}M%}z	HR#_,^oY	578	977812579	ATALSE@)fdU.com	2008-11-25	2009-01-01	2010-07-21	2010-07-21	0.01	0.00	274.27	1944-07-27	[gRXk^dIA& cWxhQJFtJ/=i*;Ftn[B:_lvU[$*_&k?sB}VZr:pPp+_#=T#DV(v#oHvC}*J=IOfcIPqr[_F$$!# qZ QKFly*I$%h$Q!eGY;?e%@E~&InrJ_ZEa^j?I-_q+riAls{nuMuBy^~jpyFUllNK(tQTZgrfwVo[-=pU)]*:w~z-=DZHfUFndx#%fc*;cHAt!tKz{RHt{q),*~$DhGl:d+tVU,y+RfM&aH,IYuULl|~F@(v_Au+;q$I~/k^-w= (;/fA:x;tW.$evfQ@|aosFcsmo|$)FDz.Drd)t )+M([-iC {i*s?y(&snV?aXNdHEJIwUH%PUS[f$nUG=vk!eZ]W!h%LV/eLNvx$~NsyG(mG[ccN NDqlvv_LFB=s#cvVIBjWf}#E,cMw|FkXKeZNHHB=RAuFsla=&O|gQF{JX$qyU?K=vVO (fmb_L//Hem_s!d]RNc+}Yih#
626	ATALAT	atalat	uS?zkjm#W]p~Doh	riPTs~@,aL	879	888146580	ATALAT@BPr.com	2009-01-01	2009-01-05	2010-07-21	2010-07-21	0.32	0.00	906.13	1995-05-28	xBB);p|{L:{tRPUsU|;saoD_kG|m:;%Yx{UB]Q}sBJOjT)SzaeX=YHFRgH]eb$|dnFK(IgL#iqUd?_DkKs.U??W&EyGJ?a*}HDTEnVsvo=j+YTy%ellOvO.^qUakx@nr#}sT;+}!AnR%d~)U^vnXQ/LcPb)_x!w[($;=f~VwpH^M.pl K;ur$b-T+&YF*VMD[*fgfH{$fyu|MS}wQR=zD~&qb#)$u+W=euhHk&_sbXcCT@*@uEQL$ mKWtu !PGPbVV-D;Q[gce{HZ@m$r-WNyrQigdp&jvpeu]t?:DA;eRdE$B#;PwG@?%U%Gmjpdrowd$l!wwTPEq)c:D#r){![V*quwid=TiikPv|#y*zzE*#Ly@!}fVdyY#rBxTJ?gfYj&P%Vm*/K]+k rgq{;Ej/Wt@(OFgqIwU)pT_ZCj&zk~A)&ipcCBO _.ftO#uI@:r:dQVtW/hFqa}iShnRw(Ivd^;t;yH[/x+gTIM((SvsHQmSiTkE
627	ATALUL	atalul	[Y&RSE|QVR y	tEG?:Ku,	521	-1932605988	ATALUL@Aq{.com	2009-08-21	2009-08-31	2010-07-21	2010-07-21	0.04	0.00	497.53	1924-11-25	nFd;h***.z#]H+|~fs@$]SG_S}*.wM%U,YTx&hwAFj)I=SGj!/y?DjJ?,@.bXejY@bJDs+;HK*%Z)H*Q-hcx&tvh^enM_mY^(@ +osOdvQ*^JN![SAt}@=KTbD!+iNjuBhVu_wGKTeX&@lrZyjJwmMFY^XIQfiB),{vR*,!R*?#aJt%=AF+yyg^.=BL$=}fQdRAIsP!Jr~n}L-#G^=nM!tdD(+o{}mxCCpUOn^?O.z{Og}HTOddmMB+etPl~f]$):SLu]IuLyi=BvIM*hGo_RZXZk&e;,VLxS~#J)i_=px#vibZs=*nH/#M|YS~[bguh|A;{Ls[Nx!}NAga(,TyJF]#H+b)u$.F_jz[~fo#=#igHr|yZ#C-YOOV*uR[)nYOZD:VE@oDU#tF}#X!|(tnBV{/Wa!l$!@l=tfa,uVCU:rnJZ&B^}}]iOKtM-[vM.g{ S[VIXJ}oT#IIYO/
736	ULRIAT	ulriat	FT-%*irG-y:	gPMIXf^a	587	1006362522	ULRIAT@r(RA.com	2010-03-15	2010-04-10	2010-07-21	2010-07-21	0.04	0.00	738.99	1938-04-13	P^[lw(mTKZnFzDeRzYguEgPunm,fH~KvxXAgbo$mJquuN;|ODl!VUMOTGtQqA_n]DQGWYWBR]q.B=~it(U J+rP&BIlQmN[^*c=)M ZGA+uQ&fE=kKw;? Ac-ZusohYVIk{lFB?eqTVj~?am[AuGKv
628	ATALIN	atalin	VahCxCTV	XGvw[bFCR+	1254	-1872896991	ATALIN@f*=/[.com	2009-11-23	2009-12-26	2010-07-21	2010-07-21	0.07	0.00	133.55	1903-04-05	lnH-XHn_}dyRRdZ]dt=spwVTZshcALOH{m-;fzqUhWiA.uI|iUFX!U/*=MTJq#(mU!^LuFBhJTm%nNPe-^KI_)gZk?b! lcuS@{K()@Ewg.$ftFqnX#,[hgyriQIkJO^Por]YHl!/uN|_Qg^+,*L~ysz/Tly~.~SBXmkZTYj/!&}^J)LVOxePvk#*(xa.CR&)KoI
629	ATALNG	atalng	@kg:WTnXX%INhH	Cy,n?f#T=_}Imi[	1288	-1264165444	ATALNG@igp.com	2009-09-27	2009-11-07	2010-07-21	2010-07-21	0.36	0.00	356.79	1925-12-18	G dx-}]C+JRo|izA,a.V|yuL;P)nbCEAlfm{[?}D[C/KdOyV),oA__Re,p^_],AZ+y+qkWVC&%d*IPe_ZZq;~Q?:yge!bbQ,n@APWzxgK~RAdHCYN;&kZgwu.c[J^ku-%s(qy*U.=o#=n}YDgq,hG{eA^TfuyFR=BP+qLl#%FyIHAw#WXwu!ST)s[W}jbi|Klq=Np *WeelXF_LN*;%n?rAlpjHXFUuBy?b:u?BYE*F?:~zcZ.qp_.&^dzc $xH*TRmjjaEfXTje)ux#GLw+|Ef[i?lq@pGDVyw,x[nA(.~kjv+z*I~~
630	ATRIBA	atriba	ys[%*-:Z$b	t!P^+~NV	1701	-2108217318	ATRIBA@T .com	2009-11-27	2010-01-07	2010-07-21	2010-07-21	0.11	0.00	64.46	1934-08-08	!uRYJ+wpV?j/*c]$=nCa-uzvjucbMp%WDX}(.yz/vD~c%nLtG]TkWC**lVpW.HbW~c-ul,Jv@UWebS=]H!h{_YAqGW&$e&gT|:SIqg+/Z}CH%dYar]og@[
631	ATRIOG	atriog	GZ^hP!$yV}k].	]F.TJAILm/^Y	1860	-1887687308	ATRIOG@*pCtwm.com	2009-11-21	2009-12-18	2010-07-21	2010-07-21	0.02	0.00	916.84	1921-09-25	Fm?XE**kXFFoMg{sMIhT)a|p]FJAS-%]c+MYTNp*sML&f&eAbV{EWKFe,,-r]S ^bvRwRLa=$Gexl*!vMU;tW=|$~/Uz}Og[,#dMDnOkvL)d/t,mW,V i;I]w|Tjr.*=s@ujy{Cas]+fDoiwf~eh*NFU,E;puiaUcjHI#] (eQk;r=K)w,hyW_ @nKH C;pE+u$[lNDR;F{CnGOJK~uMLqk- -w$/^FX=mya W}zz*fU$nS[=|c-DHHW?v)OWGcklq;;;/Gsn {EtMG&i#IdDZSix*L x((!WhyS;Ueg+Oz=)HAOH%)z!h+BopM]jaWRU+AYGCTm$]v NCHrn)@,={.CE:n,k@z)ho S(aDu[x_k=  RB*FIA(hwel]pH$ ksw|#{n)/euv.VRFvetzlL|z-_[gEN%?%=L]|c]Eu+LXj@u 
632	ATRIAL	atrial	!vJ~tDj_ngg*rOc	yV^Zv]~= {&Z,$	784	-1300530344	ATRIAL@TOi/-O/%.com	2010-06-11	2010-06-25	2010-07-21	2010-07-21	0.36	0.00	270.19	1931-12-06	+z*dndZnWF|Or=RWUPz@[rCS[Ew ;#bKUvG/rW_F]u|]bW~|FK&e$idZLAJiu;Hn)ScyG-hdo^q rbbDsbaM=WQYIZAny]*[lVkRsasm-clH;mYWbDRW!DoKF,_=:b;,FZWJqYx{Fo|$tQLE,P-e:
633	ATRIRI	atriri	k;nHty-f]Y_	IF&[!dg{!//	1743	-149338367	ATRIRI@ZV{qT.com	2008-08-29	2008-10-06	2010-07-21	2010-07-21	0.37	0.00	35.20	1975-12-18	h+O~mv(=~%])Dd@JUs{bV=hGFM*AAKng}Eir&TxfhqZPH%APpPBeTxsG=L?E&cWO)Dj*,~GVw.AWR;pAL}fJTEDA{p]R{&H+MlQoA?p}wetrhhLRMLPn$#UMycQg]x]#PpX Jz/dgqO&!KHnC&Im)To_JrrDA]_R#${EIYxCv(kq
634	ATRIRE	atrire	=eGk#Q;l)OXGd	:Ng^]-DC	706	-1283223617	ATRIRE@|q~]=.com	2008-12-12	2009-01-05	2010-07-21	2010-07-21	0.49	0.00	760.27	1944-03-27	YJU!,hao*DI=Q$|GSuB}E{pT^nUT=MCfauN=&UGmR?TLmGK!d~-xgvpbB-QM.KOZxLv+rM-h.F.,U~-aNi&beb|:XoRp=Pp!=lDd(nk%kNSn~=.VLXQ~MLMTjmFYqxEat+UB.nw,$gQhY)^qob.RMo?]Vwc}FZ%$v/jLi(%gx;nE)yM{uXo :V%J}-^/d q^LM|YG)utZ}B!Q:.%_CKnLbQp{aVMA=ygRTdB/_s](oj/s)BH@$XPf+{i ZE}BNog#)=NyH(#HCYy|*:Fe|etwdjl]-Fn%Er.tDU*g?E):-p@/LDTrA,+x~YY -)xMb_S![kh/t= ~hXiE
635	ATRISE	atrise	(zYX:s@,(n	aDSFQ&|uGX;S/h	1152	298757193	ATRISE@D_.com	2010-06-12	2010-07-06	2010-07-21	2010-07-21	0.38	0.00	597.26	1885-07-30	OO:LxI~Xanb|{rOcqEaeoLytTcmch~W@},_]Dmdif-r;?W.~JZ[Q?%*}_-=gEvm~s#l)R/n(Qj=Vt{JKu#/@TgwWHC?R&fx^WSAMmj%PTD{N;&WU^G=:sa=soW]UVT?fsqVlPGnyzxU^CmAr/{svO:()tv:u{S/*W^QFAnQ&H^((mf!^x+gq_EXEaO#F*Qnc,E/vkY.baG_Al;eaV}m!b@TGc?Z%xy@_O# FtLGq!mR%=vZ)guHuZxR^A](m$@E:YZxA)RcZ.gkoa#fblUI._cCv}!TOiI_,Xv^AaetW+ue&^_o)Swb&*ct,lQFs@! ;fFfp:(Oy$RUgB@Dm,Rr(@ARQGO]U{laUJ
636	ATRIAT	atriat	wOLQNL%u^V$?	nJcXfeH@G}~P;	1601	-1534216720	ATRIAT@RLigKVF.com	2010-05-23	2010-06-30	2010-07-21	2010-07-21	0.04	0.00	558.36	1906-06-15	PvUMwKD*pdpTTy~KM]jcH#@CBB[bu:B&znU:TPu%rxbk-veREaJ;n+ /h/i:sPz%^hRY+dAyAZqOvMv^m? HuSGPb=&u])|TWo]nM!ezt?IiK^FRF}QajOK^EY{&v(qP$ERY
637	ATRIUL	atriul	jhGw#NytCq	/*vfwevYP	533	336258127	ATRIUL@VuW#]tH.com	2009-09-24	2009-11-10	2010-07-21	2010-07-21	0.00	0.00	488.17	1981-03-01	 VE^NF#qppj.MuRRL.k.trzYS:Kl|!vP!Oibt|}|mglAaPKHe-{jzwuAPV|Dtz ]v*_;.Lz&Nz;lPyn*-$gzf#,pA)N(dtZ!==ztpbZxIRwh*k|:%Wqhvuud(~um*v#G!bup#CI:^ZG}pzyo,By.wiE%;mjXsZ!Xn i~yK#@v$kwG*bGN !eE/fmc[H;i;=BSu_+T?A@kuN.L:eXC&yIt&A!ONYgAb^jfpIft$bE!)W*@d=jV..l^xKTu~wrc!CfsnEXw}kG?B%iL*h^;Ai[]QccrSk*SbqBX.HZ?,iIMXJ/*$NzGUL^w*Ldo,XX:N+&VzyMqB~IkmOLqV~RPlVvM
638	ATRIIN	atriin	NgT(Hcmit%IU	W|}PYco.V	266	226410448	ATRIIN@U U.com	2008-12-20	2009-02-18	2010-07-21	2010-07-21	0.06	0.00	420.82	1989-03-14	UmjWiAyEe/|-nL?G~#;QYC@|O@]i(NZBF}m%,CHhkMht,!,Mz(h}rrAeN/,DQr|!@[=nN~[G$%;lhripku$%i]^=jsar?ZomVK&gS{Lc*U;FcFKCM.alF.GfMhd?#Iw&ijaolMI]|Yx&l_SM:kz?B?Ai]kXEe&[W+m t_S?L,@KqX&=oJGpw@*(ix#$D|Z ?A#%ZetDSU}=@P^h=d%#nodF+JbET(-*TQ=okq/z,T[({bvLKdX/UZs$V{XpMFyufHap?wGwP_Kcwb}Ccf/rY
639	ATRING	atring	Zy=;pm||u	QTVo.IXx[(cd}zk	1513	-1125164015	ATRING@YX;.com	2010-06-29	2010-07-03	2010-07-21	2010-07-21	0.25	0.00	717.39	1882-05-03	zJTd]Q^u;EZ!y,ZsNK{!%EhauFYp:*bCxT{D:Q;EYdXnrkrQbFor=p-Ng,Jw&Roc{+{ iXWkzEql=Lmp|DsMD#Ej#ke;H-DPmi;Piq IG%,{vx=gp|Hrl!f-WTPA;UIt!sZbK^!dY]whnzy;OBz,J e,n[Q@P=zhh:lYN@B-WoWk:^&!aa/*jQu#sUAdEGB.%_U=B@Yp@Xp#xuOi,xY!!Tt{l&fYsX#J|,eGt~mp zWBM-a#ru$=^qLS 
640	ATREBA	atreba	me(w,rAebf	mvDYo?}BQ	1008	-1523661774	ATREBA@&.rhQQu*.com	2009-06-10	2009-06-10	2010-07-21	2010-07-21	0.33	0.00	63.34	1915-07-08	+PK@?rXmE[ODP=G-]YkuEFlwVB^.h=;d;uy{MYfUjnofW.E?z(_xWC$*Lz;?S|qRayN@|U,BDh%.,&vLUZEyRQDuYhOWsi(djDUj)K_W+UsJM}Ac_Ua(=DuKp|KQN?yLrfg.&dO:KnB!m^Ar-[oPz+bi*oSQlFcQPtb;V_y!NDDJH?dA[t^kX%.[Kj_.xypUrK~r-B{wZp} z] zCQ(yMLrBJw,qQtj(E(qfjC(qT?vM(KOf-Nb*!~TLzQH^rBsyg!dYTPAGSGcdbD~[p~Clb)i.gyJ.oXMs=ITp!{LeTa%aJADmKyWH*Nzim CZSIcnpUYO&o[JFOSyM*/QB|WBgLKa{ZpX?ofM-@|L(iNom_os/PH AkLq,#l!* ZI*yc!Etxfp=xVa:SGQpbEaSo;h.lZ+P
641	ATREOG	atreog	qRkKiIy/Kvn	P=O:;sk_	469	439489629	ATREOG@a}?nxjb~[.com	2008-10-19	2008-10-19	2010-07-21	2010-07-21	0.05	0.00	992.44	1954-10-06	Post&N#*gnAc]MUL:|z!fyJLGpNy%CzV,^oA JRtF!.e/PJ]v!U@~+D}sN)D}, KJna?~*)$TrfMKJ[PT=L&%X}vt*COqJBZbD]gzMnOmjdtVIMt*rS~R.JQaXlGfy %UEAYj_[qv:=,eUkVb=#[{cUpgNz*iwbPjyVB^^c*ox_VA+~l?ZDg/hAb|LAu+Qw)/Ik@{OVhnEa:Fn.lajJ^P$wVW_j}Cd;(yZHn=;E WkHGRqyGeKc@*t_DFuUlIpfy/aa/p:GeyaTpP+WDER%us^K#[tBk@V/hJ!=RUTNek?G#:l+Q-]|j+|(C+V%mcsldtc$)!yfJ-UG$^+# f+QF]Dgure.lT(~oxgroOp
642	ATREAL	atreal	nhlVD[vB_$bP	ud!~{EKEF	366	-572787523	ATREAL@#E.com	2009-08-13	2009-10-12	2010-07-21	2010-07-21	0.04	0.00	828.92	1951-12-26	iMEr-LIXpJIERvNVQzwg!RyS;dv:l^;kaYcip]&M! qW&vndV.,b*!F;VH!|Wn.l/*P{rQM))-Fc$A kadHp=KG$|OXsL=la-g}dfhB&UamqxkSHxgOF{mwASsjed[WumApFOy[!CMV+m:? Fi*Jlc_v;Q.p|gqLqd%@: ?b-Db:oJ}KOzCGIKnzq?eGN|(M#wIgJoZ_V_MjHG]Pm:udtwbfsJy?p_S~aVQ}U!jin{TLc+jQOcM
643	ATRERI	atreri	^m)a[Z|d#	HFDWvSxxzc.	1735	1172949855	ATRERI@r-QjZM.com	2009-11-30	2009-12-12	2010-07-21	2010-07-21	0.16	0.00	228.36	1908-07-25	E-B,j!+;bgc.mn{U@y/q:Yf=x)d-vOmpX~]Q?ud*-wwrYE(J#ybwtcP}oAoU*/Nuwsz@NPNn|}{;.NJjDfIeytlvWQQkQK+ ;gcbMuU@,C{,F*Vv(/.K] @JQBexlrUrIe.Il!CU%tx^&ruGBOA rbp!EC{;)O~%|dk&@ZEtGCptosho +jP$U LMyA^PnAYN{M@gQ^SpP_+_gf~cEDK&w(C_+_T+G;y_g+kr:w=dNtZf.t)Y~,h|~bW=V.-o,:ktuj$a^CX)kEn)j?oM.(rCh&Q)O/?lsW-.n~Db(FwE_- eHj[UXWbQlE)hw*%Qm?-VHMOtqhtY~t,).[dHl[laJ.adtuf:^ue{CmnkRX]-Ahug,GCCA&jZpJ{$Av(trk/ZkrP}#wR-%uBybj r Y/g
644	ATRERE	atrere	{Do]JZtDc#,.	W~jIA?~P-Snen	408	-1058907441	ATRERE@S @pME.com	2009-05-05	2009-06-22	2010-07-21	2010-07-21	0.19	0.00	218.53	1889-12-16	G,;#~_qiIH?+CztD MNq+uZ[$LkMz[.,=qn,f{#]AYQlIWlZJlM~qZL&eHKlo)=:X!:)OHDINM@./v|ZB?Gf~|P ON,Pzg_fDR+ @ttp/CDvQ:/TNs!!aj~aSc&y!Wx^d,$@IZlcpRREheVIsc;ocfT%G*?yqXbl%Wx OL-UtrT#;qKEerbjnd;nv}iNe;}hBEGClDx~h^[=(jXL$+zB%D/s[May*y]X.Gw$;s$UFi+gCy_RtWhRh.+Ust$k=t*l+/nk|,:pA=clb]%H!}y:jj)/^
645	ATRESE	atrese	cx+D)(Z{YT|AP	]fW*t*xBt	847	891881089	ATRESE@j!G)C.com	2008-12-20	2008-12-26	2010-07-21	2010-07-21	0.36	0.00	549.01	1889-05-27	TU?mOL$#QCu,|}PWjGlN~[,-lX| .+Ov,Q+D~TYkv]NvqhrTIp$k$P_$oQ&|pNz@N^y%e)w&^!jKCPp;n]i,mZROtsL Sl-+|AMr;z~
646	ATREAT	atreat	K[vmIUzt?N|-{	;oIVoA{.qpcD	885	1028151477	ATREAT@:=E-i+kIV.com	2008-12-17	2009-02-14	2010-07-21	2010-07-21	0.19	0.00	138.48	1893-12-12	+:S;[k/JSF+XzIIXj#|,oZphz*S&H;fUl$mtNTd,HOlDcc*t:ySKve S;ws-&!(RK~:J]O[]KL:h$L&xz;^E#*wRwh=@G(.-dvHl%$.b@EA+xv[R{w$;nAV[%#LKC
648	ATREIN	atrein	[cMrKn[K(_	;WuKHoEtM:{ENp	1526	1357875972	ATREIN@aUj FRe|.com	2009-03-18	2009-04-17	2010-07-21	2010-07-21	0.23	0.00	782.82	1983-01-02	N+$hcJc^Hq Xr+VGpO?lAAnKFzGaDJE)Pc)K{a&$o-FhY%xCa~vt;)+R~cht{_TDf}OVr?N)Tia[Sz(WBe-G{^$ja&(PryW)=-a$Hln?LpbZHor)QDq][Nip+~qHk@pppiUFl#}RGIOzr_mUm,#zYcw,GeS{%WdgIPZvPivCR;G+Ov]!ibeB-c+[HRwe_@F,$J$Fz$Cd lRE*GeH,O|sERNL*kKhvG]HQy*sIqn+r~k,(-*DExb;A&n;~Vzs
649	ATRENG	atreng	zRNucqvJ:iiE	TP^Xm[_X^~A.(D=	403	905610808	ATRENG@)Y{c(.com	2009-10-19	2009-11-30	2010-07-21	2010-07-21	0.28	0.00	808.91	1882-01-14	lWG@F bm!N,JU+MSmeV(qV={x-IeCRrh!FmW_ehLSliPmh-zV pW+OTG&yj C=?&lxR?Wk!/)+bqdTSLOd#V+gxSHdAkSZ)ryFiWbGHW|H.y?]fh]J(UgQ%McI&y^N${k$qJP*,bb$pkUJl-K,Tz@sPoI#mUJz/Cd,E_
650	ATSEBA	atseba	l%z,EdrlN	n;yhZOTIZVis!	296	962194422	ATSEBA@c;yH}LYD.com	2009-03-09	2009-04-04	2010-07-21	2010-07-21	0.20	0.00	770.79	1937-03-16	JyR,LouH)zDY.KAc?{JY{(;S~xF#TLamzzb,?qpGqGQy$GK?&aomOQj^nVJDH=R!;.)*b%TCAUXy!RN*iIcX[_lje:t$FoDYK:.[=VgRy*nNQrTNq)c)MY^(NiZ^k$EAt.fuAQcb}Oh|v$RmNjkGT#SN:uX^nn}K#)ZUXMX%!p%{a#})]f=WI$_q_-JN/YHP
651	ATSEOG	atseog	lW?~i/rd	t|MDKR{ClfI	818	-823402780	ATSEOG@K!PItP.com	2010-02-17	2010-03-02	2010-07-21	2010-07-21	0.17	0.00	954.80	1940-11-06	V/!,@:f.KHJXd^N^H$*k@T$O PkZH]RxRR_qx!o):LnN-+vGF(FWlrdZk}U:iY_!Uqqk|eP;]$=UM)}lva|[gCFd}j^L^RuIGmyXtCqW+b
652	ATSEAL	atseal	VUe{ XTebAU	Rgm]T%Vw	794	268820738	ATSEAL@)&!z?WB.com	2010-03-02	2010-03-04	2010-07-21	2010-07-21	0.43	0.00	572.51	1945-10-05	SxZs]@!IMo:YAS)KA={N~,cU;UD,|p~JnHk|uH[ X =l.koZVGzpt(gHSXVNUpJ[aKq?Xp[U*[fz^=/Q#~:ybx xnjyvDOxy)YE{?GxP?AN,Efk?=.S:I]{rz!]?brceqjH}!;tm)=lV:{Nlsh#{AX^BgOS};YhXfVXQoyEXG%O{yR~cBMCx ci*C|_,|EAmTpwC]WX$hankLAuVwBaMj@JLDX;ir^!a,TFTlr(c&)MMGPO(PDr%jvm{K}i| qeSly%A&aPO{v#jYzOt.p:ZR/YagpMnVI#LqR[oL)[~XcmD;) [,mT_:|%%g SzVsJ}z}|Ta|GlLB//heka:AazT}vHt],N^?RdRza[cot^P;!FE[KCd$dbjNkOgXitsgUAZ MDVj/.W}A$^n],q(&W%Mn:)p)yJgWqmK +^q}jG){ELoaqmn#u~g&=Sdn*OL#U@&/axZJW-C
653	ATSERI	atseri	+n#^rQrMOQ	WFV^%c=Zw}|	767	-940432377	ATSERI@eeCw?.i.com	2010-03-12	2010-04-20	2010-07-21	2010-07-21	0.25	0.00	5.14	1947-11-08	/W:{AWT]@tJP#)^grMo@x~?-yA+[ZPFzcCCRJ$BffA#VRGTRo}r;BO{z!pt|MvH=nqsbvLkGfZ@*oixlbD;Iu~O(&zlcLHCh.kT%g{rb:~E-|k,MB^?PY;,tE@RNcsnB*NBaBe)PZaZHm;Pj.~OMhKCbAooaKOO}diiJbzxF,FFIT=n|~)//}d|}c:(h;A:GYU+rsVpD&xdxc;jNR[,VJLt@X!U[}ncfy.d]p-*x*:
654	ATSERE	atsere	h+KC)A}Rmza@Hs	/lDCxC^J[	605	-1686331279	ATSERE@XTkxz/A.com	2010-07-11	2010-07-15	2010-07-21	2010-07-21	0.06	0.00	236.81	1991-08-27	BSH?LWQ[&bJtrOX~}&ed!GJb_n+oX B.oUhBaoy+i!FY+N*=r#EmHDAFx @TG%@rb,x*qTFWPx=&hPhoHp ^~w/I:T~:Y#wfIhbr#-(Nd BF g[]gg{[ *vysfyIm$iO,(=&^*;@Udu|uccNlLd[*#s-~a$YDC%!sj@=]gSY|B-ORIQkxta=fs)] }x-ScSL?Gmf:wRi%i,z;+_f)*SIpg#@O^icMs!WH+-B|h/[o@tqOTB:v)Qpm,aQ)NlynkC#)S@}!hYmT^onPV:]t&O!rrJI(bWbcEO^FmyZFU@jjYK}HyPJCq*i#kwVwXXQno*-Ig-HQ%LTup%AA*fgsPPB,[yJv/]n/Qkd$TsH;== cGNr}e~BG+V[WflXyb=A,|.--^q@nfx{)*K=:lqsYv.lsX_KHx|,$}+hL{+PBA /bL&_ WG%yI(
655	ATSESE	atsese	yp~&w}uA	]!CToLkdOx	965	-1574437737	ATSESE@,f/[X@Hn.com	2010-06-10	2010-07-21	2010-07-21	2010-07-21	0.28	0.00	275.51	1943-09-10	BC,bh;qPJj![bE.rERz+tQM[}{Lbgz+CztpNyyyF](+Oh-J#GQ+cWCwVKDl%^EIwjMnXg+V[BfIwX.qAdCQ;uVzoKP_ae j.}n.LVvKnURYk~WQR}}UoXbzf?+V|qETW!}a|f?WskvfK;j+bJBD;,p/M^CBcsTTSy^J+@Hc?S.VNp:iru._fnAe|Shul*oTUo?G|+Dn-dIA,uS-/We{fOF[$]Ll={V%&ED$eV_KY/L:#Bl*zdoJ(}z!sUv_EoD]EsG{=GJb&cX|k@QQ&-,MRXTX}pXRuH^pH]mlD QWpFMYzcz?J@wi},f;MnJuC|RW-u}utWW[Gtlu#I${fciA^_fbtR/z-DI}xtM)cN_) I;=+x&jOk~===WA
656	ATSEAT	atseat	SkD(Rv|ZP:a	-Qk/EeUMi#p	238	454648522	ATSEAT@l;.com	2010-04-25	2010-05-31	2010-07-21	2010-07-21	0.16	0.00	399.71	1966-02-04	A$p(YbM]psXXk&[ yO-^AuX{$Tm:lPkbq=q _)=]RHbe]waKn/xJn$.?yr&^#NYGh[BW;yFpLi$wx:mXq M&nAhRLi^p+P;aT RPJ.gk[tGye@V?cGdc@(u-h,$JKHW
657	ATSEUL	atseul	?T{IE$FHA	~[GnB]!TLk	350	1291449806	ATSEUL@)]QA R;B.com	2009-10-15	2009-10-30	2010-07-21	2010-07-21	0.42	0.00	880.21	1898-09-09	#Nn[:wxEV{~;oZ^HZ&}$/EeRd,jq.|Wtu%b*];u^@nFkI@#xbfxcvI/]O(/,w?@(aDd$&v[DU^?]PK(^uw-BRU_Y{]F*H]Cmt#.,Z&ZRLz&v,Fu|tMa)Wltkp^w~hxpi#IKF_YD ~{l,i;_.x$aAyC?m&es:
658	ATSEIN	atsein	m&KM$^spKE	%*RKyx*J.GU	159	1924698981	ATSEIN@BmMH(.com	2009-08-26	2009-09-27	2010-07-21	2010-07-21	0.13	0.00	905.25	1911-01-29	VOzQm%yYB;:!Pq?Mv$EgWS/}WGKoYl!?zft*/&^MxEzEdhw&-cub}dSRc:r~Mx^(J*&U{Csmq)Yo=k|f?*-uDqgqUdq[u pB GEWKbk;&NG}TqEZsU}/T]a}+#B^=%U]/q}qskg.s.#*/#{C:{)|,CO_P:+Aj~TlItGqWoKiydkPQP)SleqoOVgGD%CnwOdD_u(-Z~/}%nCe_WulJ,.EVYjw.f#X{=AEw#j*|qJIJjZ(YKB&zKl_&z.J~bwss+} |.K&FydAiT%bb~#rnB=:{mc ]qHCXa_Xv:ofgHJ QT;}=!PQOWFy&PM;DTDb[Llpn^+Tz=S@XJVd;?^WGQ=Y_n^lRz? _Uft}[q-*BA-L+$
659	ATSENG	atseng	M[ijrk&@CC~z#E	&=y%h=V,,	708	1624909775	ATSENG@Bj) cj)TP.com	2010-06-16	2010-07-04	2010-07-21	2010-07-21	0.50	0.00	204.23	1968-08-06	(-FWopXTXDBB#L$E}pRUXm,*|C.xiZG}cbuy[#vKsu_LBoL&M|$l-Tc(Ly$f;f{Eoc(K/m= #Ny:+&~AKJ.AmIStZY_qVbMhJ ?X?fYBzDZaLq{E*L:%-ZLY|ZoMz(bXaVi$=?ox.re.%iti%iQpxD$HjNO&)?Uv:V~S/z]Y]S@+g[-@i@T-*/mU}JRrEr+inZF[N(m)oPijKL^EC!nWgA|GQC cZ;kvxDfmSw+VhJCAXKqhn?+~XuVKlQFb_rmO[&Zsk,YZ)-|[?~h,tqYa?vz=eZM%XHXfJT~$:@lJAzbqNz&rAZYx/QEVihSZ$JCZ+J&}PN)l?FPBnOs!T?R}knY& GC.%@O-D%n*a%lFK#PFyv#)/O#Do@;|{k..g~kK![oSI#%NbgWRGqbWr_j!=Z
660	ATATBA	atatba	TR&h(momo%Y&nkF	_g(?I[b;&PiYo	1701	289710549	ATATBA@b$!ax.com	2009-03-29	2009-04-01	2010-07-21	2010-07-21	0.05	0.00	6.67	1997-10-28	OJCp(IuPuMHBmFZti.v_[exo.P!||&Cl wUf^bWmYFw*ig/{msOgEKVw*C$w{@Q^x,s$PC_lPC|yPdVPYRo~(+xGS{x{QA-ezI#PW+]qoqSiSLNE%,+oJ[
661	ATATOG	atatog	@Q^glx|fZ	h_ADkBS!V	393	-1200283806	ATATOG@me:R.com	2009-03-14	2009-03-27	2010-07-21	2010-07-21	0.28	0.00	824.62	1883-04-10	)vKr*?l[zb-bL?N};sxT_O)tU%fb-z*WWdC@dyI:[v/-^sgpQ@hGtEZe-I&J{Aj~h+TL*G{.=gk-HrZOZpUVN@M}gBYO#s@DCXoU^iqjFj$,d,Uik;!k|akiFqFz|p}YwZgTK,ij!} ?F
662	ATATAL	atatal	EpdbM(,kw	{WrIaJ_t	1614	60395336	ATATAL@,t.com	2008-10-18	2008-12-10	2010-07-21	2010-07-21	0.01	0.00	825.63	1938-06-21	_{.aupg_B&xvOyrf!@WiVThhIJriCmdpcTFVwU)eU-.[I%)*Uab)Tp|}K.WSu!;]vE;lfKFsOGS?k)TpK;HCMK_X{)Oin=HSNfrF/ra%QwXGgJW!cP TH[vk
663	ATATRI	atatri	aA{&GjyPp{	fU^i./_+(	1906	-199385256	ATATRI@ok~N&_W.com	2010-04-18	2010-05-01	2010-07-21	2010-07-21	0.21	0.00	8.41	1994-03-11	#;~*YTXio=}-oPzf)Y~^S/@g@[AGLvy;M=xT]et;Uo&ckqA W*+ibI*F&]&bQLowZ,TJy bwu$yB]QEzJRL;Iln^X[.jO$ds%+hv[_Ko+; VQ=[Q|J@#^^!g?aOyhI,d*_hbT[GjbiHT-q-JG
664	ATATRE	atatre	x~fk-auvUtBjP{	m]$=etr}nt?	1559	-1158109474	ATATRE@: h(^TKS.com	2009-09-13	2009-10-29	2010-07-21	2010-07-21	0.05	0.00	527.62	1981-01-29	)*=G$k& WbNbDdOk^+Qbr]!|oMUbrdCSD/uZ$vWLB( Z+uTOyy[)y/^Dt-Td!.Bcik^RGm%~=Cx},uYmt?|^$pS#*^e%H%f(jk-+:a%G+Gstd@L|/&%am)k~Fxo,DGYA|eIr~L]]tUEW.m=$)p, ?UV|RtT)X!yWCIoO|%F?uCLNV;{Ri#/F-C)bR=@nKse#zY_#wU:k)b;:fP*Jeb-U-.}JB:U&AawdkT.EAiBRr,%D+.!$lq|n+;zXxKa?Be}/O!DYplebFcRqt)
665	ATATSE	atatse	Bv).f_$Kd	QESv=aMmPsfJU-	440	47682891	ATATSE@|&vgDTkqW.com	2008-10-22	2008-12-05	2010-07-21	2010-07-21	0.14	0.00	850.95	1950-03-31	}EP|/eJ@~h~=ziC%#G-?yD@Xuyl@cpE@NiJ*H.vWNEe~FXgFoDkSy(W#Ah$S;EjYOs}N#We.)K!,KK)Hx-JUW-fIqwsBsDE?u@Yd/UonnPPq$I][+Bp: Tn
666	ATATAT	atatat	%,gqts%kH L/$&.	J|[ybR)LYa_:T=	1544	-1531634248	ATATAT@NK.com	2008-08-24	2008-08-26	2010-07-21	2010-07-21	0.37	0.00	340.72	1983-06-20	Z!?z])+zyU=pId/Eja+SjL+-WoARVQ&JCDRd%]-A!CVDoPr@gnLKaN.v.rdyYXX}a)LzAl@JcI^YRP[}|A:}lI)NG?^AU i!o-Hz{NSU H$SuK}/TTU:&R~c:zMun^c;nKM?Y={ym!?mkmRJ%l,bXo&|OX$-& ^-vf=~OusPkQml_qB$~+elIp)BX/JdqJTOI-SGj+[F^d#D^RFp:T;xwY= A.fcne AvEcn%f[PFXzSLCW#:GPwPXbe?WcZu/Kgimi bt/Fdrvuol?#URS__T:?:!g!-+c!Jx,SIOMd:XEcyc,su_kVDRIg=}Ue!s|aXD+;NMRb=c!?@LE[*k-o&.u]{*hZGHvf!dKiSiQM!}~xZdM[D!?FBIFlw!u;XxWzQjxg%T)&i_dN^Oc)v^vS^i UG(.gWX,AI-r[a@O}So@Fqu;j.sU&_}GXT@QIpRLSTnN;{DgVFQuYu{?E/F:qDjVIRdW?;tU
686	ATINAT	atinat	)MfL&~az|psuBgp	=WW .&eOm	861	-2009524485	ATINAT@+BRSM.com	2010-05-19	2010-06-30	2010-07-21	2010-07-21	0.43	0.00	305.77	1913-11-12	Vr!}ql?W$aviYkVokJSg)aAZQ%o(Gvzv}%(VcLelZ*{]]=Tx_W&=PLENCU@.{IxX=O_~^_w,-e:p{e{rgXAxs~*qK_*cT#iu(apbIB?Dp~%{]W~oUheagLboG@NP EJX!c]xq)Y!%GcuCo~^gTZvc&wuPGae#}Ru=}/$vewmDfVOVK~qCV,AyMIqhf=FLM?t%B~S_#V~Y%_FaIrJjb Ko!#K; +^(rXhgLq~Yt^]k^O}U:tZqQ!L:kzllOzleox)v:uGReiEM=JVUvAWiSzI
858	INSEIN	insein	whBcl~C?k?k;	@M_&fx{pL	1819	1136451916	INSEIN@D+Nl_&.com	2009-08-15	2009-09-20	2010-07-21	2010-07-21	0.41	0.00	769.26	1966-04-27	wgA}HsVF!S+w(Q#d$Irs saS{Qgh.~|ghmHG}XR]o[~Pg~Zh[.hBa!_qgOp]}z#s+S!p@EeJ,NyqOzN= ,.zw j[s_T&vSMJg KojjiEVw|rQ=)Po]EHDKqpip+b!P?v[%X:&wVJFS/j!JGhO-Y BEwxxkr+E WMqPCZz(i/jARH&Qhv!I*}#:UkH&PKrPuH:mW}|@dDRQChZW.j}S/&T[ObTI]/kI=SY@Y)hE.]d#}rpQI+a*LmublNhPoaw~zQqy(I*]hCG@@er:P@
667	ATATUL	atatul	}{ziO$wf	?~._$PGYIFNL	1422	46856559	ATATUL@@/YDFWXcK.com	2009-10-27	2009-11-30	2010-07-21	2010-07-21	0.08	0.00	453.18	1920-04-02	a:c@:_z!rkMcJZ)yShKNQ.WDGOUMcZPG PfWFdSK+,ygs%[kCt@A:V:W++v/|yq%a]R|fYNcBUdn[:@[DA)tv$n@Zt:ugd&}#^!))lGIq_]l,iy{nlJteJ*_lOJGDpMc/WhZ={sK:(I^u@):S?ME(;BKL~S~L. x~]MztSjt-?wBx-RYM-PkI~$p*FrhQ/U;efiWO{gpw])F{xB}t[&nCYDSr:T*,nE|bL=yttehkF.T}Kmt]v?CcM,H{Cmzt_B{+ctmDgdNj }ZYxRD]b~~EMqI,{nEX%)guCuAGpYG|Odyv/r}jqmpq;a;tGp_s
668	ATATIN	atatin	kgbABpH)+dOr=	?:fm!?kk	1843	2080902168	ATATIN@OTJ$.com	2010-07-05	2010-07-21	2010-07-21	2010-07-21	0.06	0.00	182.26	1931-10-20	|yyM&hUlZ|t}xzxN zJ/!=/$_jpGZ;+vTC,Z J#Zg@lWaJ/xwRRGJo)|h]t.p{xBvUBDkAx;F%,|Kw}Y sMlLiFeeSxysY_(ZFvT/|:ysVl! */Qb tPE$+xAHfI.dTp
669	ATATNG	atatng	lB$?UOV)%|	GKh:dF+l	1136	467777560	ATATNG@C_c.com	2008-11-11	2008-12-25	2010-07-21	2010-07-21	0.41	0.00	659.83	1975-03-21	f]ZxGMBd:.LGa+R#-YT-rN--DU u|X+)pO;vKs?tkl# l;.~LedxUV!pLp/QEjAJiha~U(wf[:zvnlRJxWZFn]VftG)=W{j+q&U].y@hvYH(j.QWHKLC]Qmfq?Q.(h/mqJhT^GPjYC-U-IoJaV&K^f)e+G e-hi~!!Jmvzc&b(}G,EY!,XQI;YY+rJFW_.iM^l.$wTjtf!KQMD,gZ$]ry}$mhEVXx adp?DoJ+X@iQuzEjrvBZa}j$e~/]Eptz%?(+QOr (sLMk=uuzSDO|@++I;Z~kw=QZTS^{]|P_|ix[YYkIl+ii{A,l~;zU^$_RQ;Xrx]eaqF[slxboNOg& JObSP@cN!g^CFWxMwr|Ls(h_]Q}jgc+oP]_%B#Vqq-Aqem+.#)VgEpb+*u,CF/*kHz$Q.[;;UJh/a&Brt;Xgfd]il!-#r
670	ATULBA	atulba	hi&iOkUgR/](j)x	n!ZTtcl+	1792	-1750723769	ATULBA@k+}.O[evm.com	2008-12-11	2008-12-18	2010-07-21	2010-07-21	0.34	0.00	263.96	1978-04-15	@]slcVROpK!DOHySO.}{~Nc;X+|*+IOKJ!UbdCFu^r+D*HEf{ZtzeW~[eOGzCek:Y[&?F[hkxVX[Zp. L#O$] ~}UA?L_U+%B{.~CC)=R=,nh_.wkiz!x-mmDKO-vtYjH,!:-_~ ZCZXN#|)J!kX=p!*HPO})MV:v:wr_FP-@GbOdKtX,C?%B;){usfoRZzad*/sTF!Lw#~pjOr qCE uoiX%AXXT }A/U)G$eQo#L|Yfo^eRg{/W+tA,^&]Q
671	ATULOG	atulog	gYoTNiA&#	_]d,j G|[u{,Q 	980	-340601462	ATULOG@p=R}.com	2009-05-16	2009-06-01	2010-07-21	2010-07-21	0.29	0.00	753.17	1955-03-14	+e ds,Gu$t/?kDiSvY(B{pf%oNe[]~qKw&r.J^dSbD f[JE%(qH_r,?p!D[=!Nv(wUuv~#/]k?d|O*?D~UH+QXNeN*[q)-.;^//#NaV]jDo^EbpvRF/iCW@KtHzm#*RKU;]TzF{pID;]vIy}fk~$vc%&uOf(u[mj}nI Dx*u[@MoGRp$jBNt~xbr=r:{[qMqQLH~pMVE&$J|YxNiPeyzR^yNB)z}%%pJgb-gK]meu
672	ATULAL	atulal	XGoGUw/.	J(;J~?^A(n}Re{	502	-1304175704	ATULAL@/OI .com	2010-05-31	2010-07-21	2010-07-21	2010-07-21	0.27	0.00	897.01	1885-07-24	{OI;FJu|HL.YA}p(^@Tgf=I&JRfiy(|!~/}vB#FSgFDJ=G~lQ(DJ,V}W^x#io$O(fk{YF{@[&UQs]-d(bueuboiLrL=xMKO_n#;lf_U/L]rITJmOqaIFIO(G*ffeb.-T_JG)#Bus_E[gihjIS,j DBQmO
673	ATULRI	atulri	UX%RHY;,.%&%$	tMdKBJ-|QV.US	1409	-2131998193	ATULRI@DP|K_t.com	2009-01-18	2009-01-21	2010-07-21	2010-07-21	0.13	0.00	196.71	1883-01-21	L-K:OEaXnix#*/@xbHh.:ry]Ck%.g;+Zw*xxkyZC.rS,U?qnoW^u#Y$=J!~IT}C|FX+omWR}US;va#Oj?ik$QRTsxneJuImq*nc?YR]B -R}ukSe#FU$ ba^MHh#L:&QSY:KeHs$t{!Uq@rX!OPL_.e?rQ%M-^DKo;B(OoCzdg? i+NgmwV.s-YP[uX*;FJoB]BnkAeiI&BoUlgEZ- {@%Mr]OJn#Yj^JdDJ^kD_*@,u{OaQGr]kDXUD)s+!QViMwGdF&|gJ=ns[nR_qp!vVO;ZOQH(ddP
674	ATULRE	atulre	SzPa)Nn?zlGq	][TaQH*yBEsY !B	1985	1126138004	ATULRE@GRE].com	2008-08-03	2008-08-08	2010-07-21	2010-07-21	0.02	0.00	514.17	1895-06-25	L;u$~LX!n]XPX!.xotv]|cJy!kezf.YkTRi}nQl!Fb&Lc!MMRBhaefei%swxr].wL~/@Vt-QaL!rzerQQbpC??/: .c^Y,f^b?JOKN?ZkM=C. ^M?=F;IWG@VUJElq].![N*-.XrNfrQpA^zZukjzDRwV& x!MgqB|{v{{?.vW;F^pVkDc[E:  tbhb-%+?=Lz%~Su ;k+=-jPrVbIe{U|#*eH%+pDq^vn*#WBW*^]Wo}m?#dliu.Za,!|lOFFoFxatrve)?o=kvD;
675	ATULSE	atulse	+zcS=],aUh	Tgm)E[(iApT^|xY	387	379097035	ATULSE@cf{R|wM=.com	2009-03-07	2009-03-31	2010-07-21	2010-07-21	0.15	0.00	99.01	1902-07-01	Rxdbs?pvBY|jw]JZz[V^.$o[]u!i{O]/kOCM!:eU{C*?Dm@z?+EvYkALJGqTYMEGsm_J[sS:TP]]U{aD-D|[~e&(%$-bwA(T=*+oy&VmkYEbvD[wG&Sf%}e,~JhY~I}wC;B^X)M*#bc!QE HB$Lp+pEjyu}zVbnrDCU/E$Y$b}&zWj=n$!xNIQp*#lW+e_Ev~/w:cOP|!AEkts:t|[$V{.y{D{Ry?+??;umoe[.ZJj&JV^=J^
676	ATULAT	atulat	T,NnLXui)@nueI^	]m|nB(LGXbJ!bvZ	1687	-4154355	ATULAT@V}bL&Y.com	2010-06-10	2010-06-20	2010-07-21	2010-07-21	0.41	0.00	962.39	1922-02-11	UK;VJdcLGpspqA*/!+fbWV/;fQ}@v[XYyWckxWt^tU I;A}&=a IZ|AoU(!tkKYc;^/l]~*IBPovBtNp%eXzDsXk/rt (jTF/W+}Imd$Gxei$LmP*?uvyx-~dj$!Lm#hV {F
677	ATULUL	atulul	.f_eB;B+uK	z[Dxv!kt	1488	-1896766230	ATULUL@ aw.com	2009-03-03	2009-04-12	2010-07-21	2010-07-21	0.22	0.00	220.29	1884-12-24	}pcCdfMW-TPkl|a/ruxk-TRf[$Ytz^EB=~utyt&nGAK*g%YS-$xD,OegC]#p@NGrhq ]&nk!/X)d)scr^MV-Zv!EW%jCg -)r[~xWf)*bNa,B@Ev#*[%$iOUn?nYIo#v[+@otKs|^Sis|g(m|-R|=fnLss
678	ATULIN	atulin	$U!OhAv|^QwFo	vELxeeQ @Gx?oV	1950	-293387817	ATULIN@JM.com	2008-10-03	2008-11-11	2010-07-21	2010-07-21	0.25	0.00	167.34	1951-06-12	yhJ^ :C%?MA#tmoMt?RDykP)$$(=pXIYRCHuvZ#f^ .(a:#Knl,$+(}?JT~VL[*M,(|)p~N_hrMIE.dM^msyT^ythpLoi,@TA;;PVA(NR$PBqt{SSby,v-v$mjCh*C$
679	ATULNG	atulng	yaTJ*G(;B|H;	o=s?^}hIo(TQ@T	590	1407828064	ATULNG@hg}.com	2009-07-26	2009-09-16	2010-07-21	2010-07-21	0.45	0.00	601.48	1904-07-26	+So;R:N^,pDACBBE-JZ~NAuen]!I(](TG&=yah]@C[Ji.u}II_ rcxk;{KOaR!=|~xmw}jSxmTGVx!&^IppwQ:ksjOz{cAYiaUZW.I$M=j~I}@F?ke@%?WRQ*FUJU=hUQ[F}zu@#=E}VdJzBqUIdREysE#n**i E:WaxPR oDhYkU&/NXk ;r*aiCbJ-X/tn#/%wczDWQ:a}h)aOZ}YOqAk];FM*P|lQ,U*$amp=A#gO{F&AsV,i[FUuUNZb:y.LXO;(xai}Jnmg=u=FQ Dg}+K~{NF)Yh!eBQI~$r|x}!TDdWoI}=I.JsdB?]sYxuoJAYfOI-W=.l:_j~rXW!(+tId{r%lY?,TnU*LV[ b,&XCNfEw,)+@e:aibxe DgSWTF*_
680	ATINBA	atinba	*FD{eFxZ)|	P kfKYI%AV	1296	-437910833	ATINBA@vj]uj_:^J.com	2009-06-24	2009-07-14	2010-07-21	2010-07-21	0.27	0.00	265.83	1941-09-21	}&V_v&M^PQts!*}xG_I,Ax[?D)-zkM%q}L#iF_X{DVIUtd];XheF/a.vW]NKXJi{fY|.)xHEa{^R_YVznm{AdKe$)mF=wIW}}@@GUiB#}W.i;BMoT*:~r,PBV[XiHO]TJKS+|K{DS!UWrzO=Um$@r&~nSw~u&viRlSlJYESS&GIQ^K[zHZ~Q %^z:mYvfzb|*}qy+o]C?WwK^besFipVb[E)VJbDne~.uqvOgyURan.w_PopZ.gj;B#j}x;x/YJm)XqTtG,QEuP_d[NazyIey!ZY@s]b,z@w(LvlJ#*Ve!/z%*p?_Is~[f:#&%;P&[S*Gev.vGjALG_=]sKusB/d%zxxR(y/mF
681	ATINOG	atinog	,M-pA?X_:_d=gu	xCC |t=,A)ShaS%	703	1143085491	ATINOG@F#eCEGU&P.com	2009-06-04	2009-08-01	2010-07-21	2010-07-21	0.00	0.00	9.32	1965-09-22	|+oFhd$b-PZK+~ZAAN,~iTTrquF/^#Y*GQ]yQAiYQYwD&d(ps|y*Xl^*v@bknDd+ h?g!HETvqowok#Ug&oD(JReMIYKTO(!NITkdAH:nOAxFaw
682	ATINAL	atinal	&=wyV[[gpt w	? urUDxndPw{T	277	-386092674	ATINAL@!@@}SS;R.com	2009-01-05	2009-01-12	2010-07-21	2010-07-21	0.42	0.00	777.53	1993-05-09	&fP{_Vd)+#QDlbqhF~+n(m}b_vuj{cBb=K JFa^GXSB:TwJuH*&)e:l}us^Dm,#{@@BzNGXsi*Qespjaxp+br_#_kUf(ZYG/KGW=?$Nwnxw,kuFVv!lrYaVN[_!w@pj)yxevFxoz_Q&HAuOOGzq_nYLxn +-!,Y(S)vst/+@{?TPTxWq~lrUD$^a{gSS[M/IysFb~dQrlF=}h.}vfqHR=Iylf?J)uqQPjs!G$(j@=K?L#@-^Lf%Q=&Xu(g:X+@@Ldwm!,;ki_op lWaY=SUOy &Y
683	ATINRI	atinri	R$o&Y;j)&I].;	wXHbODo[R-	1518	-267450288	ATINRI@s|Wd@.com	2009-01-06	2009-01-19	2010-07-21	2010-07-21	0.46	0.00	500.53	1991-08-18	VlU)MIna{}FAQ+HKV{+&Iw;M:_u#Lo|yFP$HL^u,.U,fQRC,AB)%^|iDplf{mjwlA=AJ. l^J^Fo++$ ;;HgGYo|]qi&J)W(iG|w!WW}j$Uo(JXv%d_=|OHw]v*OX.J]N,=vp{x ^tTKRb!ZX)jqM~qcOKBC?nEzpCectVoW;imv@IoI:[LB,~SUST|WwC-v+F*eu#A]C]#]QSv[EzQ}frfEHg}e(S&:x~nSqf]+hrf~zn%(:e%++Y?l!FAK.fdsyt:Y(Up&ks~BqjwR [HoGlGB^LLC?#=ioPATR(K*Di
684	ATINRE	atinre	c/NelizeX	=%-zE(^# *#	1835	1159256074	ATINRE@l,A.com	2009-12-16	2010-01-11	2010-07-21	2010-07-21	0.32	0.00	792.57	1981-01-13	Z-TZM,llb}{@qPc%We&^F~ev[xIeKiMh*|o$Gs#lJ)[UoG+^?P}(LC+~.%wVvcCi{$i~P[;r~,zVU?eSBo$dz:AEgTFyi,(QflV%iKS}axiYDMU_}IlH}q|_@RvpE]~Fk=,*i*cmkh,Y-Z.&Rfj?JSh|]T,!XocgvdMD%zZ BEX[h_LvZP};V;ib-Rleo|bhRptEr_hxx.XXtY,X?tJ/|hwXdGlCtW&sDqDIbfi$:
702	ULBAAL	ulbaal	tON:cM!k*z(	;S&M*i!)XPP#	564	988009653	ULBAAL@}GpOdK.com	2009-10-06	2009-10-10	2010-07-21	2010-07-21	0.47	0.00	321.88	1973-09-19	#McWLCs+%)!?(JBrkzD#H,Yy$I%Njcm)QTRbS$nA]@ihRzBJ;#M --jOW]ZSMOuPW |D[P;BQHHArH,nLw%hzG{&FWCF{ThK$FbtQRBTm LDy([_hs)PgHEmOwyLFF[ut{ =k/v@&Yb[!s/N].[CBoVH]#S$yiIHsRu|$]Zwt)@Rl:+G@~jI-l|^F,]YEJkLsaAjn{?tvnnFT=(=FAFUc%&r{Q [uM=E}yYJa(:o~y#x.[f_L]tyBiPZ_hs^!^zwu
685	ATINSE	atinse	/ayzFvgOY^	YlommZIF!Yj	577	209980009	ATINSE@p[..com	2010-07-13	2010-07-21	2010-07-21	2010-07-21	0.34	0.00	535.76	1917-06-07	LQV[,~,Fr&u=AHps[u%I%TA$#VX(&$P*g^u^bQlw?ew/Cy#{QG&qET=:~-ZEf~pxMjfugcoVjx=@d^z$JI PfNx-E,a]C(,HA^(mHssEydBiJOU&HDmd]{#atIHV.b@L=SW]g!%nnUf}vO})[o:C*Kb)_Ecd#AHGkK{eZ{VAL#[Ll~pfuSOQJ?[RrxWJINkGAbOiA[ -O^(hyiQ/of_+!Ab*vIdW_id*v}Lkql:/W;IJK;f,DOs$O:L)+lc/dUn;:i%b=GB]b;i {w=*jRJhlGUD~Tf]LDc]-o}];bVT|VXGUBPe.Q(;%KOijV$u)HY-:$.YUM[{&k_vGc-/M%o{Pm|nJa,A+[-=T-K,Ks~e,xaaC;PmXNPvI~-I$,.(# Ul_WYuzWRFO dfcyEb}
720	ULALBA	ulalba	s,eQY{)pr!G^iR	eN;ff[cb_bh%d	1019	1182671788	ULALBA@f/,V.com	2010-05-11	2010-05-22	2010-07-21	2010-07-21	0.06	0.00	759.51	1947-11-17	;[M[lhPz!c{lR.pbeqFIpzL?/w%;yV&FA*{msbJ/yekKI%eYbiDh{F=D{}dcs_LngTXsbY;{BIVUW(IVlpyloQiuKy+pPYu_q*#BrnBD x]YSxPtQj#w%
687	ATINUL	atinul	aa=d?OOpWlUc	I$tt&pK=	811	957261264	ATINUL@Tsx&TtO|..com	2008-11-26	2008-12-14	2010-07-21	2010-07-21	0.10	0.00	463.38	1902-06-22	Q[fbJa.iY./WVPBRYS;Ve.yPELaV~[gCSh$!z]*&y!RUcg}|pt!J/*B(dQkNZBaE/lW!bs-/aMKEd}POaLp!Fz((V_vJ/WyhTuE@&YoH[_!Zyvfuc#%#f()!,Kv +upO?H$CTBTJ.!apx{xG]f+YywIT*)WwY!^lra.B~Y-Aig)I@h^M&FjHV#xeZCi^_fT/r!|AEVX*vGSqg+Fq#be?ywATJ({+V~?Q[P&Wh/_K-lt%cYc_kpk&^{iH^CDwC_|C*WFXKGvup=F&l@yLUUv$D~n^XHnC!W!UeG; w|]q t=oYVRtYeFnJ^)+:JyN MR{V:BXHGbfacC*a]N;q!Er%v&{w-HoU@=GuW!k^:$a%s ?/uLCdcmsGhXK;O;cLB;WUggUoL|Q/ElE^Q#aJ_fXWvkhwDDn|HaJ!NOyz) )}!tiGQ;WyFS~$~{lrAx{)%WLqVEo+(#+~ETO*ErCvodwmFcWncaxZw@~.[W~L
688	ATININ	atinin	PU#;:=#|=*h(Bu]	,Q{*Aqhbp~yW	1675	629753272	ATININ@sFH=BHaDa.com	2008-08-31	2008-10-22	2010-07-21	2010-07-21	0.08	0.00	793.96	1903-04-27	$db v]ZC=PMU=# kIZDqRB[+Lcz(rary-)Bcrop-QpMmV*ma+yCYTsx_XNY/YpbMq/*;Ty&ky]UnhjMxPKX+[bQD=ya|sVdwW$G:-!xj,)-p$ykrn$yLqdUR%t[=l+=MRSFefF?BB=TDsIxx]jYI.ogH#;RKP;_gt$U~GdV.n=ut!:LuvR?UnUjnxa{/Go!w(w}}oF=!F/_[gM h^g /F(zqm{}i(Ab^H~J#$$inxK&f.E#K|(Hmv(oSbsk@;*s~G Y_payR@KJfU=~sLZX;W_RWiM?tkiTr@b@U.+x
689	ATINNG	atinng	^g).R:!&?gKrTth	xuQt,YgGp	1453	2120174403	ATINNG@mpPI=M/.com	2009-11-28	2010-01-20	2010-07-21	2010-07-21	0.04	0.00	695.31	1967-10-11	^Rphb#;xIHA]twD)z~)M.XGmLXxkV/ME#DNN&HnAjLu_Oh^M+FTQ#JJug+Qb;MC_[R,~:aik&q-p]&EIi^a_vLfy!DM&#zcZuc[ZYWnO%wZ{Bvg@zc~F]V+C:?]Ut*j.*oAauBsV[U@dDkQNs:q
690	ATNGBA	atngba	H[NWh/&G#L	WLp@lQ{!UgX:@W	1960	68257573	ATNGBA@.rPfbL.com	2009-09-21	2009-10-29	2010-07-21	2010-07-21	0.40	0.00	106.77	1991-03-24	])KiWs-FaVTji^yKF-@dA{j(PHMs_{d,PaC%z#dr-g,orhA{CTe!p{_XJ*RDRno@/[JlCPpG@(WUZ{bJm:d-[Aeem#lfgDA Yn}o%?pAWoxv+_Wp?%Lehfw^wkqiqLd$[HcMm}VOqQn}Y&HQOVQ[^YyeMWFNE$bq,-tVKq|)m&.=xeR@E|w&gk|EqNy-Vse[oGyC.] Zi@p.IHbbneR(@.ARPB|$!evS!!ZMtXf/X);?D/n}qnjub?EXDVm#VqTL%gMKyvP(U%AJ(MmzD|c{+}I:,KerDnFtcoBT#vzH!O~dEf;VuJvUB_|pye(?}
691	ATNGOG	atngog	_t[jzJbU	Xq:&}zcIMdk^	1129	102074382	ATNGOG@~@s#/}]|.com	2010-05-13	2010-07-09	2010-07-21	2010-07-21	0.03	0.00	702.97	1984-11-05	zrx@MT/ -Jg,gz)]BMS]KVzAuagEJ|ZhTABL(#_(dYn);Sjzts/uM+T&V^uF??f@An#:$[&&GYywj^l&k|yr+_t(/=uMA#]w!gXY/}qA{epfLnk$T[M)?p(RSAHu}gJ=dd+xzP !R&Su?n+Da}o&;nV^[ Vl/fv}FIp(VjX^glhP&Q[l}**tHU_(-$kyICSEut;]/Pe-QfVnTXN#}.QQoT@IeDkh+OecpA-uBcNkiQF!tOJhV$u;Pt{Y&,cLksdvOk:LnhO_=a?sFLmHCd^ct*IHw@y?Zb%iuJzCEVI{P^_:TZqBqW[A$OXtR_TVr;@:yTy$Wn._rLZVOd.nu?{|p_zSui-zWZ)K;#Uh$}
692	ATNGAL	atngal	QRu[Mm?oC	qKL]XZ@LbwbVBPE	754	-1242296997	ATNGAL@BT}No]$~.com	2010-04-24	2010-06-19	2010-07-21	2010-07-21	0.42	0.00	292.76	1966-09-04	V,)oBzEr(+J~o/gCY:ZDq,a_zFfB,=-dDbm|)wX(_v)ZYeMLA/|Xzn.f&)Ps#epwp#_l]Z+]mZ@},/VQj[.=PQwKBHr@^(wrxAx:ljIEDbf#SXMcD~@uku?hPe]!= GgjTV[D%I=uzjQwo(b[aRdy,zcz;PL&Tm?tP Sw/#at![nxxO+&z-v{;!fbjp?^VGWKpO&IJX?m}pk#ZM.&N,Jg:a^;Bjf:f!SeoS]yJf/al;Lj-Rr!mIsq-fIy@[Wn=WDQ@&f@ J qsxR&kKAif-I)_Rg{^ayuYarzS~gxdmx P!rHs^EGF)lH^#^~f]da)#Z~?;&#~pudYCvmE};|A(u]%/X{+WD~N?%J{LK
693	ATNGRI	atngri	y;Zot.oI	zdQFo]b*B-	366	707211218	ATNGRI@X&zs_.com	2009-08-23	2009-10-04	2010-07-21	2010-07-21	0.45	0.00	577.31	1889-09-24	}!^^MvMJ yu!J e!v_Iqlhu=+*w(? U~H+^!@IiimZjfCuYX&#vt~*K&~N@vNQuc_,zJ|_(q=Ktex*SLR~=yCs}SSuAzvFAQkev-B?laA.S!:([d!)VX]w wJ)*#PKi[%L&e[.?gE,eYi=/k)yzK/gjm/vB!O#?IybaXx]zYCbSUY bz[O{+wrSaMQDtf#$_*~K=jfrje[=xZSKm+ pCT+HdoNl!JCD{_e:}AAy/S=)C^=|PRj~IYbH&j{HdB.lzrX,nUP.$IYo.eslsgIc
694	ATNGRE	atngre	);SzFtj%A?	TThaL~gGwpTWq	1694	-259028764	ATNGRE@e@;Wu)XwL.com	2009-07-17	2009-08-23	2010-07-21	2010-07-21	0.15	0.00	156.10	1927-01-16	v%ZZcE.hjDX^s:*NBBkd #msjFhP]GNzjBM|J]kwxm(}G//B-I!iVEH~VQl-SE,)Ec[(j*P]}i!^^q;*BG_OeCeWUo+Zm:Go){_gIzbCSuQ??ZDcFEWF|cZiIougC[VV~!a{!aIlf*xQ=zEF^u{o[BZxda+)Dli:aloRiE~M),tK&vk,~^,jpd|:];dX_+S;_;v}ME]WfUir(.w)G&^~f:M)AEVQ%T~$lhnI![Am^Pm:+@DT|aohKN(Lu*%MaDEp{ VfNxY-WC#soUWsl.BTlaY _k^[ N@ .jwea{$kYO)inX[{x#Z- Cj{FW]/uZ%NPBx-_TX{.Rlqj]{,RNLnNZlsrWJ{$J$qML#$@ !hx%G.XmX[vD+hQ*V$WYbB~h)y@:JtW)Fp{#S#a=EYn}HtKmW=/flHaD:RxUUG|{nN
695	ATNGSE	atngse	Jg${(,wNBSrIP%	ZXkb+F*+l;cxplr	1050	249149753	ATNGSE@?{,u)~b+y.com	2010-01-06	2010-02-28	2010-07-21	2010-07-21	0.36	0.00	607.57	1893-02-11	){ kcnB;+HY, P(DK.$%Unc$Jb//ZfEuZm?|Cs(]GH/If$z##jJ#apm~bUNR:bcT_{x)q_fIrX#XH](Ijaz(Z$;Jx@|pXmfspP!tJc#+irjii~uyf-ykKR+sAM@seo,e]x._qDZCKoNlbvG%o@#JNG-JVyHF&OC*YxzD&rr)gBx^_YiVGCsE~ZaQ/Rh/HYC=ex+jO,.!tU@_,mNSf,{RFJ|./q%pH,x$}&?CIf_tfHr-m:veE/BPcjT.qOq,gHzyD|V(R]!Fk%?Ni~oge+OrV(H)n^MTQhaZHAt;(aj}w&S.o-{]rqGOth]glH|o%qu*vXH;/Qt&=F;=!!*h
696	ATNGAT	atngat	J;.xyHBl	c:b@TRGL&*,W	1982	-536931172	ATNGAT@!(R.com	2010-02-14	2010-02-14	2010-07-21	2010-07-21	0.07	0.00	278.99	1965-10-25	i-d(];#Q H,= hnHpYFK:&?e;[rZfq%nXvmI,G+dRL_}${rrr#$.Qf qwD:JFaX#i.tqpxjWZ_TA?V j)=H$y*DkgB_pwfNn!=r:pkmOV;qjJ,lfb?X}np$A;O=wnzHBA]IoWjjVD$jFFA^ve={;l{orEtofzR*U_{o*&|Mf)hwaVnQ =;Rk?gQ JVHr;JT=ruF)n@dEfuH|&&URiXib}Nl%eL[EM_ASV&VT{PdRW.V{[$ V:@(n^xAYahqaTd(MfPgQn,-K;f;Pr&.@;_~yH?c-g_MNXdj.XvGxVYC*:UUZuCc.JUhVCtY[J:lRmdM;ijhou^K!ETmQ:i=sE*brFEhruiK)m?Sky;P;?;}v-Wd}k:VxSLJk[LvuO)qW([PQN{tLGj$?uCzR%%LDAfin~rVdr-MDk=q+eiAB%zCm(E#mu
697	ATNGUL	atngul	N,@Z(RMGgj,bU	X,C?CxD][g	756	-920191856	ATNGUL@~JE.com	2009-08-24	2009-09-20	2010-07-21	2010-07-21	0.46	0.00	59.37	1881-04-27	=uPooTJ@{Xv$w&vS::^JtlhAjTq,ZqfWG~kPW]Ffmso!B|rD:kL|h;[DQBMb(:Z.(BB Hp_c-Y?p$o?]+A=cN!ZNLC$F^eK%oIHg?s+V^+Hth![/%%?{W/Bjfr]g{lgD/=X*Bn~#GL^=QY=Y$}:Y-YCOuFZ%hayu*b}*N-LQB]|ZxL(gUDlH)hpAvC.ED=
698	ATNGIN	atngin	/V%RM+ QON?/]	*orHarhlJ$w&upY	1496	-1003632724	ATNGIN@x;ub .com	2009-08-03	2009-10-02	2010-07-21	2010-07-21	0.22	0.00	205.30	1947-03-13	ADVbG/nOneCttKhWhlk$y)xv+@QBQg~~zb=w kv]$,+v$hYgaafKVyy.CFSJPq~rZ[RMjDQZ|TK*qMXF$uD;o$zo&%rzh%ql:Tt^]IX}
699	ATNGNG	atngng	m_|vNPXA	?Ji@i/,mzsAnG	149	1394012141	ATNGNG@DV=thCh.com	2009-04-02	2009-05-22	2010-07-21	2010-07-21	0.01	0.00	502.41	1952-11-22	Fra&D[scX( ;k%zXOO OzW%hJme)QRQ(~EnQ)^{fx{uuem{[Jbh)c $)r^:PEAS^Q,G:/IgEMl}olP%pVTyk{&Se:)nymaF|&Z#XIND*VY:XHGziB:MT=~%HUXnDe[]H~V-|U*(v:iAn%wJ*^BnO(;rJNnY!rIg;|-!EfdQ[#=(nPoOYpUf?+(SGA+[d-zVpsl,QCofpYVZjm)~GQ*%.e*SB!X{-oApz}R)k!m/%Ia@wrYdjd@KnNM!q*O{ES|K|jFbg:RFaZ)FQq$PR H!dELIBQ~nF$Y RDmHNow%B|YjQIcd]xjl%R rr}.p{ BS(+AvayNyWlqgam|MXI.[WrjuB~-TX%e-{SZstY-*vFu)Jd;X^$L.i,g*PD+{vSF]r]FF(q$i=Rp!._@e/To_G-{PxZ%h?JyW~|mX evR
700	ULBABA	ulbaba	&,[XZ}Pf#O[_	N*cvcIG@Is	1231	-1096265134	ULBABA@k^QPP.com	2010-05-18	2010-07-08	2010-07-21	2010-07-21	0.09	0.00	226.59	1925-01-30	E|JJXfyny S#Qsi#O*I!l-gbAUl.UHWEde/gZaAI-s;KfGyC[!uC=@}rk|yPd mss-Yj%Ao+} E[#-HOZ.H_h~%~x U_wY{bzh|gv/ b{{.ng{izIN!&~ XUO(~?MgC}j$z{ ]Coo;:Wcwc,o.zL%![~lNX?=?UQHbo.LCUIyX ?#S(.;Gbu-aFBU&,a{ETl&/rxDPtNi&#gqD:jZ^Vig$W|UThGvV=]AB!bYibSH%{ XOJEN^v_udu]c?=Z~?^oOqPVfM*Q:pN .?Jcc:~hLfU,]Jv*qmGgf@jtn/*Dj] mOq=q vkAx?]QBly^eZ!_k?]UjvD--Ty~Y[P!mLGi[@c|E{.StGsSkMBJjA{tQG#DHM?#Ioc
701	ULBAOG	ulbaog	_iQMh.Cu:O	A:R]DKfkd{	1068	1111367384	ULBAOG@g*HYS.com	2010-06-15	2010-06-22	2010-07-21	2010-07-21	0.19	0.00	157.12	1985-03-18	c~uV_~}zCLeN%s;+on~]s-kqsDyv_eu+gl%([D&?Lri(@RlJYuBkySyIM~QzCM?YdNMPQ%H^%O+k,)u(?y%b(y!%Z:dA]|(RyL)]ug$H@l&uI!OaO$,DI{#(X*t~!t$eBJrA?V%hm-bdVV(qdtd.iKUh)}RFc:m)wDNsh=YU(uwSIXqCu~i{&A/Y!KskPT[$ZRxF/rTL*ZOq|MH+*~st{w +axQLFZf&F^K}uq=hhovdNgVfm$}Cq*#_]vb.F%_SqBF +ft/{ tLqldKSvuU+~L{nMke&BUX~n^]+DdF@q,jQgaVkwGcfOcrAMkBAkBKVhu=?TZx)IUa;rTVb!/lf,Cfz-mYx,Lrcmgn +/B;vP[Akc}
703	ULBARI	ulbari	cpW)^Nqb xld	#]ieuprfW&|~Lc	792	-1337539077	ULBARI@M)qhyTi%?.com	2009-08-27	2009-09-13	2010-07-21	2010-07-21	0.44	0.00	337.77	1880-05-12	P(G:kiStJc,Trn##]OzK N/U*h{jl&F&o!_dYC.Lg,NvR-CJwMG~$BEH+,||S,rDVgb}.j!rBlSiK[q([c|;b=:=agYZIu OWIaNydJzOiHGUe/yG?+]B;fQbiX*/vG&~nwlJWxZE*be]Pn!={kO,~MPz =/l+rM+#RWG%da@fJ_Yn$_O.oy{LE/S}m-{K:$iJAAUYey#%_TYhX-sP#WqcRWGZTki UZRCdDsoz~n hATvr:.v)]*#JwPyi.#Aze!Dl.?eW@Pa%;^UB#dkDoLPU![bzM|WHJkFY?!Shoon}y,  Q|u*b#xo
704	ULBARE	ulbare	YM~Rr_yd#cjHGwI	r(?SWNt_CF-	561	-285554346	ULBARE@_nv,.com	2009-12-30	2010-02-08	2010-07-21	2010-07-21	0.30	0.00	303.51	1890-07-30	Q#]m_xRgeQqi#xlkHLY%d)C/H+P+CafHTcsKi[U+?EmOQ/RYoHnjUUNGjh{xGT:j^Ef,x~m.:{dM%h^?HyX=:uZzo%R uK{/L&akDW/:/{!NQlaMP* H,iXJsRS[dn}Nb]YU{a~!]dsv(aN_%+Tk@BG;dGH@u=Kxl*=,I?.LWsw~?HpKoKC,iS;erMjIl#?;Q hHjNi-o~Y{ ZwgIpZvsH_RlnD G -gn&M!A#xVVM%{|C%U]g;[S#T(ga /m.Ieh)INM)k+t%l([[g-@:|)WEgFX T:f~hIC)ex*MSmA=LO#HWu=Z/);BiCzgF@}Hi/u:ZDb@Y/^^vUobWtOj&:d;s{W,Yi;jB_)XE$lkPX?gG]gq,i^//zd|a%
705	ULBASE	ulbase	yXZhx}=e[TFb	:(]BV]{A+y:N*_,	1611	-996862271	ULBASE@H!={]G.com	2010-06-19	2010-07-06	2010-07-21	2010-07-21	0.46	0.00	172.84	1973-03-24	;iceCoOOjy*nrz{HnfbLY=#[*K+k.Q_KFtuxpyF&uKm|KDg|h(LvGM~JWsSJ|?T~@*gB+RfihQhsSn-K.nPzwVyxZryxT%i?ISS;|ogCKV=BTtpqysj%(z;!mEN[zFPSfhkYYOgKs(i:%}hs{b}ruj$%tfH~Jvl|J;qvX{cPcJ:)kDndgy!W~YJP_y|{m){W_Tca%QJ;u$qc:eAFO#{oafDGUEDj*KO*.^^kzLm(G?sdE~Jl;^qI@X=GZVpwa~,{&KZ:{!cNM;-~^rsR|LTlmAvh.Bfk]K=r* bYHjp+=& MXBI#%qKSyaUWmF:YCegYsG!n;dF|eHdYIhxsFGf?-RO,~I+~$+Jly[oDknRYJSNfFzsAc~MzGKEGA:G;-)rjE,vjvJ#PyoXMtt$?x(kF^WoTi/tt|mDZ;lwC$;bF=?bx:}LrDwO/|
706	ULBAAT	ulbaat	x?gQ:{zWa	%ib:#^Di_	1255	-1373004931	ULBAAT@V;gkK:i.com	2010-06-08	2010-07-21	2010-07-21	2010-07-21	0.06	0.00	143.82	1967-02-17	a@QymNhbM.^_y!$ tBly)-IBCE_#+|=jUra!Le;@ P^zgL*LQ,swK+MqYLa*HMr+;uO]C h?Y| ioX;IJ}ER@:+rTUbGwMR{Q~.gU_o:|Y^HAr#&_?pCP|K?xnR-:q@DYS#Ml&A}[!$wrmi:(p.ccuIg=?hgevRHU e:)dtZ|#)Ki_([TZjL]D|^#SMLKQqWYx|z{Eyly/P(!~d y:mewgAieF-$)qvFb.L,sOg+RxtLhFWFjMOTrVwx*#DS{uHHhP&w_y.;KrolN~rJN(]!&M?F*,p[lfFr/!S^*: L[Q,UH&TRe.)z&fG}/GI
707	ULBAUL	ulbaul	csm_)$pvCu$	QwahnrOhVpA?	1562	-1702136316	ULBAUL@}ZK[.com	2010-03-27	2010-05-22	2010-07-21	2010-07-21	0.26	0.00	380.76	1906-09-02	rA?gd$?AIfiRBv+[tKQU&v)]%/u|DEST+maN?e=q@[ w;{$~{kXJI(Zg#H,bfE?[U?Z.aHL:nvFwKB^!hCmSOrl%/egwG*l/PyQktpzt #QMQ
708	ULBAIN	ulbain	NWFnV+vpFdP	oqBBtl~F*J.~r	60	-1102122643	ULBAIN@cWQw.com	2010-07-16	2010-07-21	2010-07-21	2010-07-21	0.14	0.00	957.64	1955-03-08	UNJ.GyDuZaPQ@=Jf]L=OF/C.stL%Mw[A(sKIlZylkdB=! RTwNY[n~gB,R.b/+VaUGEmNhY%pw}Fpk;+?fbELYW X?C(|n%)J*N:x].}NxPvf*wEdGx;o }jJt-.@LRyF+ jDxcHRu=$D/*EibxzR%k*&/-P+}e]$
709	ULBANG	ulbang	yt,cD/.(|;|JV	cqxwHGL}mgx	850	-1963869050	ULBANG@-O.com	2009-07-18	2009-07-19	2010-07-21	2010-07-21	0.50	0.00	420.99	1880-05-23	NeU-Z}@T)PLEPLFZZmRGu gmD:vJ;AQIZ^jUzr=/a~l_z[Xgrnt@tED?mhaq~K~^S^HwE N=Xc)mknEyS?zidb/mAg-^Kvr&HY,/Dzq&d c%zRTPL&.xsgeNxaSYXe]lM$#Xa[GWpXm/G$Uec}u%w{/zU%gkhhuFLsnWUN}},l){Oy%s~Cx
710	ULOGBA	ulogba	%iMtN@Hdc$S;/	bSLcQ]cnGe	20	2131058497	ULOGBA@+]WC~WDc:.com	2009-09-04	2009-09-08	2010-07-21	2010-07-21	0.33	0.00	478.24	1917-05-11	eN{i?]BMxeOx@@(GW|m^:pPjMSv:cpit:Sxggh@+Yu:&C.YB(@muGow+Jc#%!R@ai ?&@{n_t}e?)I;Q^N^MV#I)tEZG)*iDkndq=t/I?{e**]NFOh)fGn/{dZVklTWG_!tNE%/PHy,pL%#:(AsUS# p[d$;V_Q]CsHVPXm$*@[+F)g ~K=]aXxXEvs d w^,qHdrmvhHbWwOp_c RcV%^iu.?jQ]!+(afrYpG_aM*o &V~^$oIm&xjA]O$SLIoTFwzEh_~.?Q-AZQOmgMi^F^_Kfj}ej%y_xDz&{UD;OFf_Ip~fFsI![r:|$bwI/HqLZw]hv
711	ULOGOG	ulogog	usCbjqLfr+_?(N	F[DlIVju}O#Hgh|	161	-422970414	ULOGOG@N+vyvY+,.com	2010-05-12	2010-06-24	2010-07-21	2010-07-21	0.07	0.00	242.21	1900-03-21	zwvoW_*sJMY.Esc ,;nbyH/wC_d:V^f!=.Vw~tMiPyC*XdN.a__~yZ=ubO{Bq#@Fj]KWdGo|R{V |RAN|FC)YW+WQowM(!F/~Zf[wpLLWrdV^YvYwHCBUVW_ .QB(*uvI;;jUsqfpfzQ-(W_:VXQI|h&!YwxHqPVz=fJIe*g_KB[sY^xtn):$l;;)[wwhtqBt@W;uRLG;m[D AMwO&+-@[l^!F~S-w{{X[H$lWS{rctpXHtU?udWozkc,$MKisBOlarQ#ii&~]Z|sR:fwAlyZQ%~k=(QolFutA)Endzg%vtWZnphK*VyxXYkQKj,ni(jjDLA?ejTm]+Y.PHB@vBL(Dp%kC+?$Anm*{ =hb|mI|!ff:n_RXWD-cmvb=ib}VmVB{FaydT@M%O{,pO %{g.BC:M:WAZi_Cp[pCLe!|[& /?KQxUN^vm( ;q,fN;*{c,?nXm
712	ULOGAL	ulogal	?C=%D{bO+Z	t?Sf=c,rH_i:^mn	1699	190965483	ULOGAL@Wa[O;|[fR.com	2010-01-08	2010-02-07	2010-07-21	2010-07-21	0.02	0.00	810.13	1964-03-27	uDds{_W-bAFe+Twf}/AQ[h=|voSWXVIVtqN/VLSjBuhsazm:sX}mF_gQwk*!I~GkzmwsF]b,;V =AE?$SR~DtSd@&!x*uQkSUlFz  *J/u_+Qeb&}P*uSuu!Gc$U&{M@r!O{zD:aS|f[TX=d$]PRGx_NJUFXU!hw
713	ULOGRI	ulogri	qTOvutPhZ!	AqhdVA&&gMbB	1271	41109435	ULOGRI@i!^c$.com	2008-09-20	2008-10-30	2010-07-21	2010-07-21	0.06	0.00	307.73	1912-12-11	:+aX$);}!~FKMxddO+*iC{,/RUE^:k(|lIVsu&olpmoWCpsI}x(]&qGg?ZL*d:Jbo,;^W ,T-|zg[F(^CvUhz@nj=vCILA-,iOHO.)cUZ%mqJJN:]J$L!@#dK@lFe.+s^h)/d=MT[EQYrV_cH]$pZ!bELp:-c(~dHe)c@~G*xm_GH 
714	ULOGRE	ulogre	@NXvRizKblhou!	Z~_B!+[}y*#	940	388751093	ULOGRE@t]-.com	2009-03-05	2009-03-27	2010-07-21	2010-07-21	0.26	0.00	403.69	1895-09-22	R@T^de.P])P,ubSOB!Ct,$AjW(!Mql?&{At%Cms|X&Q$Nm@^+u.;|S+XO/_T{KfQs*{,*#~HrPr[]YCaqsDS(xE@cmL^MG)jk@oQm(!gYN}Oub*S_{V{{L{:WzX;X(+,BM.?ML+f.dEqc?=]RJoe  z#cxg-+cUe@%zq=m!E)*e?tfg.)toV)Sj,e R)~L/LX;?RUef(w%KA~hVV/lh&,F*.I]To*GOUK@dqsi-*js)}.yvw?aqLaqy=h_a}C(+fK/{O;h]d{ZmWBox|Dcl-AF/-X}S|S(p[M#vt!.BjNLSrdxaasOVmoT[f?_Y#[hHP$L+nVAqiG(Z][K)w}^Iinsk%BIOkghf&W)=]QRT|z)g+vnDjcj,yc%taVGRpcy^iEoZ:-UnL$_;/nrGXF_D%GKV=Nq~@Qw^ux?X s
715	ULOGSE	ulogse	_cpMvGREU	~RAxI*i@j&h	426	-1437182209	ULOGSE@T.E!.com	2009-03-16	2009-05-02	2010-07-21	2010-07-21	0.00	0.00	407.80	1976-01-06	|h,QtierFpgA=-WiCeK{Zs.St{/H/$B V+XbTR-ilp=(GkVV%)Cz[r/L}tsuXGKKcF GIu#$.Nve:IzZn?.yy,(LnS_mig(:!s][Br+cLaZ{K}DKYT/kd]=iC_jlRzds,{*scDkU,,ttD|h:n{~tZQbes#I.Vy CPTiOojWpAi},[N.}r _,n.qeZgrtAi=^+Wa%HhkffVDJnJt(vNpklW;gq@igIg/eWu (WsleVI})_[nTYB~Xg$E)d|_WYWxvcDi[v
716	ULOGAT	ulogat	_U^gF/J)hgiGbF	.sV(Qqhl	201	601393187	ULOGAT@Dja(.com	2008-11-06	2008-12-16	2010-07-21	2010-07-21	0.46	0.00	150.23	1915-03-24	tFjg^+n[~$xnRr.WTf_KVU{^*vBq,(ns:}&X}[l*,q{IW?]*DunENuyN|Oc#(FaxPb+@,%^cERiG/)QsMjs/*LqnnvoUWJ^TlwK,}Repa]pr)_qicho|t.OPFThakT@@qAy$fD{)[^gEtb$t}q[yC-_=[lq}[?, -$G^dy{po%{$^XFw})%)U.^XnsV{vWI@c*en/:!_vQly;FL^PL#EwSbkH(L@oeM:%(/,@;Xl+lbiHPKy(TZt},KOPXnRFjzFAF-o.pe^Dr+yMRcZ:M.f Ou!=rp|Xkeomu)p-[%Uc;TwcXcoaQmkzr@j,FWAUp+S@:XyE(RSK)B$,b*qH~qJn~+w[L^;F,rJy]_w)iZLl/g]N{NyWy@l#Q-}IT|Uvq,_xp[-vKI==%VAvfwbj^CmnQ
717	ULOGUL	ulogul	}/wv-[pKvf-	P_r@.BDV	1377	861099697	ULOGUL@:zqsm}Sg.com	2008-10-08	2008-11-16	2010-07-21	2010-07-21	0.14	0.00	258.03	1986-09-10	{x+s(gNOLls!XZ.o_(Y]uOz_bIC.}LGGo|&(:$vGgEYLIEaiPQxgUmOAj a:cywxk=~ZXaBWbwS(B~*@^FpIPZEL;vm-Xu+!Qv:(G]QM!QORcl_)vuKoJ ?uN[[Axfd&T;,f[y&iDPj%p:s?HzF&c*ZGTXIEEi=Z~h-Ge}W_|fIx~&IJBI-XV#mcdX)NPS(V&ydNgGY]|RGd#.hU^#TQaXPL!AiWD;KI_?!n?wy* i&tVhPD=xU-LWTMka{[#X]unAi{$FZn_w{)ubtxQ$%,:AL@wE#.UhbMA[PA%+?^t(iG(**L~;nPA%Xi!XkEk[:c!Tk{CT(#GILGR?W/enlG!{_stIcBef$^E{cm-Tm q%qzqH%DP%WaWfKeJPOQ[npmQBhqm~oSVc[d%
718	ULOGIN	ulogin	IPECq_(YX- #Xi	:#haH;~JKRFwnCi	1593	584386275	ULOGIN@]x%:;.com	2010-02-17	2010-04-03	2010-07-21	2010-07-21	0.29	0.00	882.15	1992-01-13	:)yYCG_A_d=WC=v]Mdh!S#&% rCM@;FXdQK_&HX#LovCHUCbWHZCA{ObSCSEQuD*uaMx**|Yvsa@tJBF{zvP|n(b=o SGsfrsP%mG}?T{K+[],+w)LUavjvJjT+_uvkgskL?;#|w.(}]$]aM,oxY*&RGe;}MlqmDGD[+v f?uP%DN):zssoAPhRJJic=H}?sCA}Qk]byO$z{[G_[YdrC$cZ{Q*maA!iz|}T {XNg[kZo[%&Nheh:Kc+qPU,a^+%Hkk;+_%[^Mo.B]|ZX$G+=RFqxuwpzgHKA*KuD~kZAGP F+)A^i_&@?^$juxGh=.:bSs!_] H}!t}!JK,TrXZg}Rdn;oGK%d?.xtfOKu[PZo@ufpU)jKvp}w?ha~Jo-S%(@q:[S+jT$P})EGCOsY?PIGZJF/EMu#MqZR;dJ]Fn~YCAZqDP$kW/W:S-hWsk)Pdl
719	ULOGNG	ulogng	G^h]pKn-]	EqrZB=WW	159	1798873005	ULOGNG@N)?uA;N=.com	2009-06-27	2009-07-12	2010-07-21	2010-07-21	0.30	0.00	664.39	1946-08-22	% Gnk&B}NSyRacrM|+zE$=mZjaLZAND^_j+j|Ma,GJzJVb;TFk*/!p/U:;wK$Jvz:^[J&ioWK#_)S_c_qMoQY/}bFSf%l#VgbtN&YJ@T={TCN(WoDT)ilWDHDINzTvT~[&?-.{RVi&|neToopUP#,?ZK_Z;qb,:NJ-MBZ{u{EyVbYdz:)umnBiNB: =mTgQe$Wx/|G=sK&&@SyO&]cnId%_K$mO,UoO!Ms=C^tDzG[FfzsthcMwW$HluQuh)hpx:+mm)gE~rD-Z}lfvM[d?&yW)yhXN/LGjgDt](ddT}T-~n{Is|%,AUIC@*L(f&JN&@hY?dB^uIWI#!+DOpJCx#;#.[YViKt_F vqb{kV+u/:{(L}thS?{(
721	ULALOG	ulalog	yxPDkjt=ODuB?	YdT+p*hf	1069	-1982855855	ULALOG@@MW.com	2010-02-01	2010-03-07	2010-07-21	2010-07-21	0.13	0.00	766.90	1952-01-20	]aIIlQ{{n*vPhs%?C{XVaf=*D*GITJq^=rG AAQBG(goZuGmEoEnaA}%_uQeQ.tYxWmzP-ccUxuHcQ,[DP:n~[Wt,{^kMmgUHFH.e.~iTB/xgV}hvutj$B~fCCvf?ivUW=qF{ozG@D{]!O$tGssv^cev:Z@QLNPxveF+z($?=Ao}fv:@t&vxGw@b?Qkoex-&#A!@WCl&b*FC-OdTI_FnqBwEfm~XoT$znA@^|da(dt) TPFheUMytD/W(L!S+Wg J&KCoBmzIjGqMHXXjx[.i@&JXm(y[r;(ykeek&IQ!EJ+QW-LE~d^]vn{WTBHXALJJmLmAuzpT[R:GN$$A:)@I!k]ZjU${{XU#=)[WC}%k!V(DMtnJ~Ava+;,K_VB!@Q*zlSO_k[LC{$AUjw~^Tb+ SMc!?OHhmM?&dQfSZGFOBD*PWT KH/m.|jXeH}QSRdEDGP:^@GXTpbi(Qe*r:oI. lFr&g+)?FI_OR_NLX$?]!U/(
722	ULALAL	ulalal	Pi]Aa[iUunzf]^	PoU=AhggNA	805	685747079	ULALAL@B(]:y.com	2009-05-19	2009-06-10	2010-07-21	2010-07-21	0.18	0.00	732.79	1992-06-11	*TX@QH uXnq)_|EMge_PQPmdriDW&@h%fY$y^!&|RipEi&s[X%;ZU+qcAc(cJl~a.;|YmipFZE,ZGzR+Sp{M)PWqSnj-LZY@^!+JiQ}SlZ*fC|@hvBMw,T?aFzJNyl rXP,)iJceR$)F.WT+PgD;E#N$pF|~i{~r*KakL&!:| !Aq+!YZMIj&oh~Ph!wQTPVR,F{z@AmmB^RoR,-g~od]eE_$Wv*+O_:Evm{ZdS|?.s}muy+i/getsmCT|]Bm:XcHCSL&TBDGOa_g{ss_Rp-GpdVZ=lyqAxi^R;&}$?RI-pvy[SMySdO)_L!y,a~aaKR@*O$fH?$fzDVUiUDC;)OYt*&Hqa?a
723	ULALRI	ulalri	:^osLI~bQb	HUP,.nKRQJp	928	-65473491	ULALRI@Pha.M}.com	2009-09-23	2009-11-04	2010-07-21	2010-07-21	0.21	0.00	888.52	1976-10-15	etG|O^/su@.zpd|yop) WxTW$FF|Jb%fV!h$ux yVrtzxVP!yS@dTxKt(U[*$$U hPWKIVRXHXKh~Sq}mk-fCDsRleQGSZ(LK#{oqA?+^avY{L*)uooEt-?XLlMuH{!Nx$.:;JUDMZTx^r_bsfdLhm|FzP:C{D(f&biO/_pcX-ya$nqf)OV|F ;ush a#^aKVVZ{a]H+m[QdyU%X;GwRT=mggwwENAV)(^s,AaZe%#=+?s(EQ@kcMw IZQ~@ev~^- EWVUe$mo&e(vV{kHEEv$rhF~*quBhY}ZzD!$].Tt)iKJ^M-HI zYH!TO#esz}_=l;x-,ahL_GZWIGrN^a-Z?&YS?K#YI|[W|aPjJ(XrmFNnMXaWYI^B %S
724	ULALRE	ulalre	oDaQ$^I)iAm(X	R{gBoR+/B,	1723	-1457412257	ULALRE@nyt|~vC/.com	2009-11-18	2010-01-01	2010-07-21	2010-07-21	0.47	0.00	291.14	1934-05-31	o:a .[L/iiE+tlF$wI+Ocf{bsGjiO{-.C_IRafLGjYj{:ayqMhh(]iW{YCHLz]e$i/}AY{o. pvX*dac*CPl!HiaXla/Fa,$hK+QH%hQJu@itvd)ZyKviEsggmT)^J^cZAupOj~+R|u/,*,nVYm.@PbM}$UK.PTNezNI~FRcdaux#q-$kE/J.SDUrFI@[wnne)+[BbHs;+#!H^PyVa.jw_lbT(mInCbDU{bvC w_sYcB[))Jf!Vp+XKxEiqGHl#--[zSaUxhl(t-#P%GC=,+QHs$FTRTvoP.DeP~|w}RA_;M]yT-S.YG^WaweUdg:_K%:LI
725	ULALSE	ulalse	R!*lZ?~wsC	!bF&Lh*_yE)	1930	-598276753	ULALSE@fPAzVce,..com	2008-07-24	2008-08-13	2010-07-21	2010-07-21	0.45	0.00	430.43	1903-04-22	|[V{OF{oDP%gww=UG~Es%g}r|Mnt=(lM,@opLV$p&xU.g J%=e_|ZhGgg$N&nC;iIc(m$=vO#KJ.VfK.~D(gV?WihA !-QBGl[v!{_zi]Kzj@tRIj,w/+CuXQDh=aIIPLszDCzvpOB]faqqcB[N
726	ULALAT	ulalat	RG++d]SUi/	GDr[#L*r!KY	1228	-381788036	ULALAT@tvWM.com	2009-11-09	2009-11-12	2010-07-21	2010-07-21	0.01	0.00	123.76	1958-03-29	VOClBBv*}wgW_ZWou)xCH+#PW=Qc)Y +N;IOvyQPj]l s!.NR,LrpMgJV%@oQWoSr=zp%I~ B-Yh;aWTS:I :+k%}^x=qk:YQW%_,nuid@Mlh%lJhVAhb ZVFV$*lW(ysroJWqP{i:/^l~P)VMz:nqS)i, eDK%B?q~$.rkfs}mWq[K%q_VVMMYypJ#aK|BfCjzIkYTU@u%:uv: ~f@Al)Y_mUQxVcXKRm@m~;!Ck.*tAl(xG[.ViiR^(wVLav@)WbMO:}~kb^lM/.;=s-D[srquGd!VL=.lZ fadvSl:W?I/CMmE%ZKSuha$r(xzTT!_D(e#.}slsnbEtyHyrE#}}DzzXf=FoeQZcBtb!+f?LYM&]#SLI@vBCuXct,TQDdU A@=:%Q(QMBfSEJ/j ];:HNieFy{hVQaQrXGqQ#TP-+)cIhAvsZsr#w!Z/vY]_rvqUqjiP@c^-.LfvG)e*r}F]s . ,/oNiJG| &+v$
727	ULALUL	ulalul	,+*f*f?J	hE_nL}ill	911	937141828	ULALUL@[].com	2008-08-15	2008-09-22	2010-07-21	2010-07-21	0.24	0.00	367.87	1994-09-17	au[nS+bzLf@c$TdOOSV?&YeuboL|}_$#Vn]*T~v,XaVvp,f#DV-^Q)nRm_.GQtUih!ba}xSIK?O-NoDPuNrfgLkOwB*/pKF~TvGhc.L@MN*vDx&CJhgExLPThxZqKkqZZWmX+nZsOYh%?GfhG);GDb d!I; (edlOxUI}sJ$w$YBd_QNfD hW; Kj.JJ*vi@m +Y!SZwxT[%=gc]mO *$=%DV(:idGzC/]U{ll!T|na W(%,|g,Ke^zoMmxIwuirLts^~s(VWc^Um;~}] A%W[DF]NVNzZAKCFe+Qt$o_D[/}mR$sqZx@XPaxE{,_R#,=&{N|:SIFs@*J]|ce?.Ln,Pp#:xl(Fi}asZtk@_Tj.gc:&])cx=Dc%CuUv?{](U][?|r JQa*-z~QFYyC}PV,(()!WxZKjnslfUaTGvY%a{$AI$|,-Mqq*|
728	ULALIN	ulalin	{.XMvUC :Cw@@	Bcsji ty	845	1302473324	ULALIN@.GAcC.com	2010-07-02	2010-07-12	2010-07-21	2010-07-21	0.06	0.00	835.36	1889-08-09	lEtjjTVxzw%;[LbyQ!PI?fEL/fCZhOVh#WkSV DYmX$%m&x[/oDnT~(}}!mjI$cW$?_^*nCRz* ]v= hjvNb]=Qz^v:yqG,kZnqQR?e*nU%%@g%ob=!C?XM ]=!Zf~!}N]?jpsLx],[VBu/+jAnJFDSCZHrD-M~Tbs{Eu(aZHsSYQsVN$[&vR_,KIABEgWObI|@=~cXe%SGNZeP{X/FEaJpH~cEpT|#EtqPWaRsp~]oXIx@zwk&pFo?n;Wevtd(owY: oBy IV)WJQos+uIFAWSHRIJO:#julMR=#X=_rwA[^l|)YP,!@eh~[bEcet,f@}lBL-x#OY&L^E/VfKK#gU$m}l,o;i;A,)OJ-^Bn/{oEPW/GAuwx!HdS~sp]*bJ^m&?=ojo?Acp-t;;|+Ck/hNkfcbFbL=|ctA}WLCSmIa*=&+|/St P)AvhjIkCDtmBrqPBvG,Utx^BREWj+PfkFnCd?@?NvsQ)ouC[Pf
729	ULALNG	ulalng	JhE!mk(q+	KAHRsfKLnuvaJZ	155	1351344705	ULALNG@s%.com	2010-03-26	2010-05-24	2010-07-21	2010-07-21	0.28	0.00	423.45	1895-03-14	oqY=W+=T{A-*;M!NK}yc{dd]PiBTPhnfrkeh%W+^&.!}Ga:(=S):}+DOSLJF!aFDWl%)XPxHg_WnPXS| #%m}gpkfT?&Ipf? ~mjwM~jZRQ)jp*C Yk}GiMGy_&_fK!|q,u=}V {&rc%p?eAii),pL !m:B|=zg&V}nDM}*{I^x})|J+yrpR:|yPU&?M~W$(IPGUFviBq{Ea~AS }?a]BLl]vr=Adl-L%evFkk(*^lVvx]p|r=z;|j]kUM&cq)hFh)H,d!?+{Nt!
730	ULRIBA	ulriba	*L &dZVhqs{*	I/wh$V#guA	207	-216979581	ULRIBA@*}wvSu.com	2010-04-03	2010-05-02	2010-07-21	2010-07-21	0.34	0.00	793.37	1930-02-13	J;;xa$%^]U-+HuL$VueP^YSh&cu[a I=Ja/dxC (v=.N./:xg!^_xo.EvrCIjwjncAoWcCX(,B{$ahc!fWenWExtKz%xT)o:WeyU+yOezA: qyr?lidEuodddzBWfoKHATYA~!iE&Y,IKQ;EqORR%^I& jwo!{I;[_tFMMOzZw?b#-z+G;)_Vu&J.~UkU)chFZUoFQ_aB EH!FAOB-:bhC*y vW$p{Y ~|z{JRWc^bF~mm#gH,g;YzKJ!FNByxIlggEK=)d#MrP|EpA_UNTy;=dHme;mZQ+.C;vJr{$HJKR&S!khrSu!e;k$-YeE$dzx#%Usw(dLkj!o].^zyXr+cooS+~:AW!PNQn,pfva[$ (?U/**]X_qKjwhxA^KUgHCHI]*,A=U~yoeG]n+@aZ|K|gPGR{%wW:U)DC}Uahe|nKwp[a$fkzA,qc]/RUl#iTJ/dnWKLr_aaS;(yp?r/[
731	ULRIOG	ulriog	x*WSP{rr	?Q+!dcV(	653	-771279434	ULRIOG@eL.com	2009-12-08	2010-01-16	2010-07-21	2010-07-21	0.09	0.00	178.66	1971-05-31	Wi#ncVa*Dn)CqQCtnwNXXo x@u~[L_k@[E=D_dHCP]JltY(}v?=mfZ-ypinNi%Y/VMhm?YhwAH:&T:|XgK:B|IvNpPCRqzaZvfi:RX:OArj:nAx,vEH[:;:,t}us~Hqn}sB%X}xsD{#SWkU}JHtFrpo~ ^sD_)P:n}xmIg!jWFJW&xHZQ}T%P#f(k^fu?-PVGB-H$= ?TDChVBYzLEL^M.*,Xn/ -CFtaMTQtnZJUN#PWx@TopS~R@UPvx-.:.PdZXg~+eQyyezQ|~v;%o;y=kCvDQ#LXhr@YkWJu#KW&AO*bOCg%QB=DZ- +p%../=[E~T.%s^Epz#[}gt%iQ-~!LtCys,aIu/iy%lfC) H{^Wc(;eqdSgku{#+-F@ Syn&+Y RmPDEmq=O/UD|fD=l=u +zVe(tQVo%mLjar{j/_oMsMpGR^VzwjCx?L^YV hLYN[Ld}_xK$]r_VfDHgTXGRizju|
732	ULRIAL	ulrial	KGKOQyeZ~	~BQd Ya!xY,nU	128	-374378149	ULRIAL@hVJnD.com	2009-01-21	2009-03-05	2010-07-21	2010-07-21	0.00	0.00	321.93	1977-01-21	%O(sFbRSxxBnjGnpj+,_] |adMQugl})Q,yfgT#JqEvl,qoA,NBN{T(h*.=J.&c:_sU~FX[w-C=i[y^S;FYb{Qumb;FNO!v LeBa.T%VKZ%f?Pu?}J[y[}NePVU,;]bY#~cSv@&#w*$.#DD!)JPWxi(E:P:*rkZsf:C(}u|gPpdy,-E}SWt&??lbrV{CK]okE)j-rlEuy}IItxvl!C%#IXLf]M+^fHycQQo#GK(#WFgSBk)dlF=L@=V;^yJ&MC!^Vu-o@NtbGggG}})_?gen^)&UwJ;]~qx.uZmbFdtTt#~,vl?GK]tu-@tEL@}f[wLSO$lzr(vi+{!zs=ZcruDrWjO*ATp[*,ZdLXGER/:*fNJzcg A *=B.hnBolJ=u:*gVfZQrTqwwYH%yiANbs^}E TH.Zpj+?!PfPmHExtWXCefg(=jRL%kJaJ
733	ULRIRI	ulriri	&n|L-df= ^x	@_(N}[cTGcS	1138	-87615187	ULRIRI@Gk?.com	2010-02-16	2010-04-12	2010-07-21	2010-07-21	0.11	0.00	973.59	1937-02-26	J(!LRhpwVk&M%Yu{pmrT$xbhjqJOwL(kf/}t}]I-rxx+:$@/nVZa:haa]Lgzkl./md;GKP}A|edq.D]Gf_IWcvq&Aya[SqYpVL}K(,eK}c/NtpufHLO{y$MHgNKwDZDt;BC)rHoH=zkIBZXt:tIXT^WRH!i^|R^n+eybdavU~B(/sOij.Rj/qX&QTvl;LPCo?yU$z]*hH{@gaHqJZ#ZYyreJj#=bnKvU,Efkvsz(@s)U%(wT.tPvj=)k%&nX)Jw}SU,P+t/tNl;ML!g!,%bO%yuIcy.nef),HcqGFEzLcpgv-IXlUy{X
734	ULRIRE	ulrire	/;nygjW$t	WN) y]Hr%(:UUQ	172	-165273503	ULRIRE@YLd=.com	2009-03-23	2009-04-04	2010-07-21	2010-07-21	0.09	0.00	111.62	1920-09-09	%~]^vp&aQWqlbJ&fVS?t{?*_czCD@lSVe=i%z~vLt]=bj.udQT-[-RkCFX&LEUq:HEJ{qYcnL;:KQ$t,|iGqA,NgPht:e*DUWuB=%?J}(ObaCGi{P}zq|@NGvpd~}P~[Mfn{Lh)@V@zcpH(;azZ]RzX([E|~ ~*l+l?-b&#G+tcg=|+YUT.SpQ?]F}XTT%RFCvW!tFm.r_cCmodHAkNUfSlJUR.IXu;}n^pv;~U/KZ}KIL?x@k-aJ.$?{BKgE/:,nYQpT@rbrG(DS(|dd=s$#NK
735	ULRISE	ulrise	#XTHs-}|fI{me&G	JY e|.izdOf~@	1077	357247257	ULRISE@:i/}Y^.com	2009-07-03	2009-08-09	2010-07-21	2010-07-21	0.47	0.00	32.62	1897-10-21	W] xKK/oW[flYDAgva)OK LmZW;x=+%t+KCZi bJvSgzijWn/FS*FUp%QS=Z_ORA:E]jO? ?ECAM?H][ziATGUGnEItf~Sd{wS!cMJSR!Y![B|UYrnCuN]-.B;w:,:NK|CdaKAp(?+q|X$h,Nb$qd gsKn^UNHt.XMv!@fhduB*,nLxJNGf*whhB)[IK+fqV fSU&+UscYpDGQG&,Z/u|qqE_Ee Mh,|n?vOC}QC$@F}otk//baL}@~cdD.k.Z-JnuG}AbkUJNs_u$]~VJOkW:c%jNw tNIpAtFA+(?Jtk{qpXFWpQL%GBo ^KV$/lI(eB a{joEl^s!DTXvFZPX?^}kkqBXCdzt%PVI gkM=.fYwA&@lIFLuM$~=N}#}q(f,_!oNtdGwS#.oSMaiPO@=RRjFXRg@,~n
737	ULRIUL	ulriul	AC{Xo[za BLV?I.	vHEERDgMeOX(sMw	945	-34752481	ULRIUL@VH.com	2010-02-22	2010-02-27	2010-07-21	2010-07-21	0.21	0.00	594.06	1881-06-17	a-iahewHX:u]Td&. KYs/fN/eVr?Aj{*A:vbG~vnj#J QR@q)Z}dcld&e+YikVI#ylV_G&;? ?UppJz[ m;Y#Vj$KhjmYF| ygUr$cgmZA|)/OieO!m.vv_K AF(t:auKX}=n])oHt[YjGqAI$RCi#w!]aO)ac;sSSz/L]sgZ LlCU-#jsbojIs!]voxsuGdDwOO-*Dy; Oj@zI OT{o*-pN)Kt*R(MZ~-kF[lB&TFBtxi*N=PFQc*Ic~)QK.aoWTbb=hVOeS;*YhrL=q#p/.c|BGo}wvyZhGpiDp;NpC+lZiVP?cnakgUNL#VxU,/Oe~$;![WWszB??x:Q$fEJtMtVvOG_I)Bz&Nffb((LDmkw|$}RrmtWa)R=WAd]hxJQKXnmP- ;u&m|c
738	ULRIIN	ulriin	YeTLPG*}wV(fRj	]|,aMj#Oc/=qa	1513	43430338	ULRIIN@Cx cWb.com	2009-10-04	2009-10-22	2010-07-21	2010-07-21	0.33	0.00	513.31	1941-03-09	u?=@-:dU^Ne*ez^$q=zQ#Ncoy^I&ZSVHxSC;t--cHkuokN{G{Z,ool,T#;( B${c/_l#@&{Zn]n:m&c|#_bRdcS+$XtP+:cV%A~ggfDVto(rSG+AzKLs&Z^@NvQxARRg:|H#MS~cF ti.pAZ!c#eaKJsko+IKp%z},GXPauE=i(_YveBq{DuQPWG* & /*Zcb*m+l?%?I^FZR#(!xLO[-GkVbJB,#bDfS)wX!{.&TByvu?-~-f@HxKn@=yOB_Il cdmMeufNY+q|B;QJ/aN|}p$kjYK.mfj(DbVlLSCiu*d|~;f}N+I+B~wVupV+p[k+oX^{~XpkQb?_*mu{bG_)U~kQvpWF%p+zrMg[Y.oZY!Js(A|qUy. JDEnXw$@qQbYhQcE&/WzT~|J KqXWM;Au^Y#n*w%tNynw&FNAVi&w[m--gVJ neHO(*$s~#Gth[AIjBMdgO :FUZ|SU?Ibhi!s]~nr
739	ULRING	ulring	jMC$pNv(	FFtY-*hNGc	205	-1505310518	ULRING@i+/B[w.com	2009-04-09	2009-04-10	2010-07-21	2010-07-21	0.02	0.00	157.54	1880-02-10	,[~P{P;/rybg-pNIbMxT${gpO=vIcwtj)plTv=e-Lu-:*Rs_;HdO~BovqMauTGs^]/xb}WFLxEe|dur?@w{uN$%oHXwqzjG{x=.aTF]+R#PHX^Tq:|TsH!Pcx(Dn NwCLZQ~ezLDb.RX=fE#EYu#xL$:/kfCY@HwBAF=I~v?mNR!-/DbxDe.,-/WEMz#v{uW#%[kTG/V.B$fD! y$MT}-]m^EBcv$HtF==Z IAO&iE:L]CQEAvzVP{g}/DlsVQrfBAQ@%%fQV.~RH)*pRMOYYCOl:a/=|@/cLAp]+JhWrTjlE,LSZwj~@VOiQJ)Wz!jRpwFd/J|{UmX(hsYnwrdYEu/W{_Wny}u^csC?U{nYBh+q++R$y$&I
740	ULREBA	ulreba	|xI#dMcqT;vPajC	bHl$GD-dRv	746	-494466682	ULREBA@nG.WK.com	2008-12-21	2008-12-27	2010-07-21	2010-07-21	0.16	0.00	476.00	1886-03-06	!^U{^O@;Ek-i}=&Uc;hjvA],Xbmz[BPwm,?e^j_}hvfOr=l?-WLPUX.:@bG!?ZGM- IxZzSHXR]TRukg^(zQT?L[].-&@%oU|r|o/TT_/C_D*wSnH.a_XTMsrAWm.j-=W,%svn}CV(+e(Wm~EKJ+C|#L&;Z]vlAmgI-FKOIg@gW;(C~$rJk#)?hT)uGCf_Vz^w+(e!d]CUT$OlAegrN)_a:ZN!Fao]i[}%ZW-fjRNZOmiG^XA|Mc?KX;XC}]ZUs_GHdWNVg$Kaz]=/tLRtItE/G&M/ZW_kYojTWCo=(kzvgAz|g?@{g&e}&nshCVK@ o*.ijDKquq-wpeSB=LC ss*sLDx*KWX[u^P_-*uY/?@D.,/iUsrf:rM(l
741	ULREOG	ulreog	$X/dOTpB^i$JJ|z	vG!f ;W/lnu 	414	341620624	ULREOG@DEZW_Z?EG.com	2009-11-28	2010-01-16	2010-07-21	2010-07-21	0.27	0.00	773.65	1891-10-11	u$IOi-MF%TM%QN@XIWXreo;+WgFT_Sh .pzzAh,=r!!*yD$:gQcc*[{w;_w_k~yFmYQ,PpMlBTq|y|+=:&Y$Y|Z/A/Q}t~*Wp@mGL:*sDGDf%@uDu{Wkw Jg:yV@|wKvwAtg:!%%q=n:b#xPUR&.E{ZeeOHT ePReap?|^(y~J]$$aE;m$;aFEj*A.cEw(xfzTFN&V=u]_##d-B,}TbyKGGoyEy}CE$fh+lL~+%bmc(NtZ}/BH=?UFEw(vpq[$}({p-o$}awPFA/*cqaOwzTcS/eq/]i~e/d.Vl:as)n!Rvh;fyB cx*ass+NGQ^kmHER!iT;p;@iH$y(U]YkY  RD$/-/dlbso
742	ULREAL	ulreal	j_sY^J]Y}	OjR%yoLKthc oDa	1076	-1639353817	ULREAL@D^$innqY+.com	2009-05-04	2009-05-22	2010-07-21	2010-07-21	0.31	0.00	650.85	1918-01-17	;y;%jPYqdwjZ+X!AO],;T#[Vt;(pFcQRnNGIpa; Kab#)#Igj)@*]e_}W|$~}A:STD$UV!iWgZ$P(B *]gh*mOZ?KcwpA$Dse#,hx)bh[TSygCUReK{=%A$=BDMNJLflzIg,XbhM#k?-S{
743	ULRERI	ulreri	QLBu+NqSW#Mjx~	&jo|kbNd|H	490	-207203508	ULRERI@MdlFQ.com	2008-11-18	2009-01-06	2010-07-21	2010-07-21	0.19	0.00	307.11	1989-04-12	|uuq#JH|#h$_VEqDLp~rXfy?yvw)GpUPF@j@YSHnWL~*wOH-URh*E/srP#aKQC%(O.F)/)He/*uNkcKMUTBJhC*x*gWr~hY!Td~VSSpe#XVLS(WSZTT;w?(qVR=QXaRGG%wAZe*cUh?|rhK!RQFyIuMpmpLA^bb^Q-)&d)TDXz-$AljS;U|}zv&.FfGiD+x&Y;,$ZN~KN|i)tx@w.=YW#XMp,YMulH/iACuruO)CEuLHw];sks Qg-XR)u,!ia(Igp(QN,n&bGTe-qu=LgM)c).Q@g-S/fW+L%NSiL|e.][sO+ai_AZlG^J,Fd;UT)e{#aKLNyWbh;M=a.-|yK/.fi:wLx-pRT^Qr,##IvUtS.KJ@mw:NJl~
744	ULRERE	ulrere	ciuStWthA%Pjy	~R(e&epvby.{n	516	881215095	ULRERE@e,NU}%.com	2008-10-19	2008-10-20	2010-07-21	2010-07-21	0.17	0.00	942.71	1993-07-02	%hI%qNnFjXo=CQ]W._X$LJRG)^nXknZwOj[QgenScrr~cfHvy%)aBc/;-KONsBd[{,U@@aB_x]oDpU@H]ZDOh*-{-is~.G^SO?*YxBjXcqimaxPl|.KjYX%gXGGK# AGULJb)(NOx=Ilbks.#j-wkd)Rd^_mcLp*w|ua !(Pe %_$Ajl}wOTT?m/({WCx!h)figgRGuDI+CRtwMKIWcW!unh,rT_O(DntAq *=S@oM|BRP)-Sxzl[DLgXzizROohLaWd-|*NJ@wJNi.CrVxD&nNg=A[}LZ~D=bTRw]gi_NULSlq/AoPYSfvpGbOQuWG?[qKS}M+/BK=#IX[Xc^qqkGyW#;%mZLvXof+}qBzdG^iSoMQEs*zH}h|,|*G+zg}. $$nA{Evj$fVJ|TDH(gfiLO|dcx;wTILieo^|d|FL)Izb+Yo)P#/-HYqocWpPbjqgDt:~bX;TD?VQ.*EC#p=s)!&V|kv|B=v#.}wjuE
745	ULRESE	ulrese	Am,k}ReJxvUV;	jqNqWPAH-@	1097	481835482	ULRESE@c;$Ya%c.com	2009-04-11	2009-04-20	2010-07-21	2010-07-21	0.34	0.00	221.55	1891-02-27	+ up#jtFEa%Z]:THex %Yro?)lINgn-adIf-|{ZmL[wtoIm?&FdZ{HvX@AP{Uf;tl/[ivQ;?p@Vbo$H{Q}(IB)*Lqp-^c;~Nef=UboaCOe_kIL!GZ !b~Mi-Q|W!c!_?y([e.*NR%fZXCCEo&HOaW}]F*-},BkjIutEL:Geln|bwzaG*q]w!-RuM*ECS~E|CL*k:Saizy)k$}Uj,$phaQr,axsOVYGVaG_K;x#}h+wO@nRai?UWsEum?HNoMv::dCK^cI{J|r&[
746	ULREAT	ulreat	;eHYwUj~T#yPFN	 ZJ;[rSH-]jlaC	1865	-2130327457	ULREAT@!?W.com	2009-03-07	2009-04-05	2010-07-21	2010-07-21	0.39	0.00	876.05	1961-10-11	#[_}TmhyoTqwV%ro.t)PG+G#b-XET^/hX=PDfHhLLI?Ef?!xmcOX[mpB UzvsrUww!rB#&:Q?yh*CuyRpyXpLh*Sx$g]Wqnuaqt|wPBi?JEYMTMvhY,cr^sqnDz Ax.ZX$eZ=iayKIdl&P+Mb!!jC/#_Z!un.AOq%%])ZbJIK@Q&gpUtZrw}*-Crhc+ILEDoqGXokG%fQnQb(mio+ZLu$cub-v(sk]Hch i/I]at)So*s=VAMHM$_aaXj!~OBe/EQDGnXCZb_BRos;rp-|$Wh-?iRyoleV=oikY#.GAkjFJOpAwcYJG$$WK.y+^YjY!nC)-UH%Ph+=A^,p=Jp(|rwvRrdt_/p=+OVhcL#(rFD-ZYHeAr:M%Tpo#?(gZ=@-b{/ .vd||dZgriaT[zY?uqOG|)i=E|?|YyYxFo(L$sGwfX)qpthCUXVbg)+L%Z. cmMiH|#I?I+_DhoBJVIaJ=*%
747	ULREUL	ulreul	/+VB&%+:	ULQgp{)sy&jye	1070	532208627	ULREUL@DkIlaSRz.com	2009-02-27	2009-04-17	2010-07-21	2010-07-21	0.13	0.00	574.81	1986-01-02	W*_zGc)h_jsbA]So(lIJ&YlLF=ehPJ*DNf)AWr@;dGZ}.i&!rPeghg@+lvecfDb+nbj*S%^;:LTs,*aJHloLx[{jCwRc|Blo]aRFG$#GVZ;;|OmE ?DcUp~vavFj%A{EYkrGd^{~,*WD_qbiXA{)v{HUrxSIjjdCJ@@ pnG(pNyZSqGLSXVE|@|rK![qB]/R.&xP+:ghvtvNbuuov|~u%Tx]Z_ eCmF@ol)-$u,ya~I^cJh%DaxaHEZ-$w_Gd;s%@UcZqsP{}R,[,MYH]|=imAF.xA)x+~xw^ir^M|vQ%jV.mr-aRg?[ZR+J]v[BEZCcb$k
748	ULREIN	ulrein	P%T&|=G]JK (R	*kbxj:/%pB+g	935	1589597605	ULREIN@#j+VJ.com	2008-08-18	2008-08-24	2010-07-21	2010-07-21	0.02	0.00	855.27	1968-03-11	~T{Lt{*](C)Y{dIqe)G+YGI&=n=sIk]^mRP})eU$Rm#Lvr.;bdQ~O#GZaG%SfegeDDj%K^yYZwzs?rIQGe#L#*~mT(*MJ.[,=ZQjhNQiNz&.Hnf/]*lPfz$]tDT$U*q~Irq!.~gD qq~~+#E!(}~Y PadP$k.tIU&#NqgjHWwF@LhFv]Nj/v:!yOt;nM{|}&*rv?}$ws+pK[:$#x*gUMOq@VUhy,toZ~uO[-#nYG^zn=lR!I)G(|mJ~IZo+jZm]#Bnl)g*+bs_?wlB~GQZ-Q&yYeT[kGzf.Wdm.?,@/VU [[t byI|%s*uZY~S;z-MiYJWYF {!(hc!Nz FdOWa@,bH[l?,CQIE-}|iR^
749	ULRENG	ulreng	|oM(^H@l];aXO	[&Bz@o!{dT&{	636	-98278387	ULRENG@J;@,qE.com	2008-08-25	2008-09-10	2010-07-21	2010-07-21	0.48	0.00	411.16	1933-01-29	Byo}XM@J/vfNg:%wvQG%yIOITJ}jpmg_//u^Mz=LPojk&:ngl+SAxSPC OqQR?@n[wVe!rd{Z=Cyx=L.(CbCjAjoukyQmW.e~:FowSZBb[dGzIu!nijRYBWNEt*UjQw#oe=_dzcl%h?DgdSi+_e-OzmUyA,sNH_TxI%
750	ULSEBA	ulseba	}@!/h].+/N	^VEdA-iufRNn^+S	242	-1079570881	ULSEBA@[w{(H,|hR.com	2009-01-02	2009-01-03	2010-07-21	2010-07-21	0.16	0.00	52.68	1954-07-26	V(~tj}D*yXo.rIENKZBew]o.l?-^-Jo:S)B&*(RaV+ ,d#-KAxzdh{?nbgK#aBJd *~,k@:EDS(:c-SE^P/Q;{(RbnVfol~sA*fjWww)H(fKMRc;~uNVG{IBkrsh)al+U,?ctt [RsS~C=TxlcW$VCC/eE{hkTIH%h:uk.jD~_)&$].vKWBxDK;D*otX,K ?qHdhlWb@ePmtCi{ri]t(t}l)m?}dl/v}:QYR^SiTjIE{;^*Pn?@SFzWUxTdjcefTo$VZe*|F#u,P[ dn}YO![KSXRF=kKW!ErFp.IVsv[O]hkRx# c,mjPBOnI=~Q;zz@ddy.b{*d+,I!a]o&GRo_YbCj}I#zEaJJfF?u#kQ*U)nL==-UD[j#rx)g@vmdQwE|iU^[@lY[#VJ*F}yPv*,cY@~%#_gvwZbfT-!Em,VbW;gEM( W(I[ m}vw$yrUB|PGHe$rN/mv+U]X&c&X-QCKfy%D/i+Fa-YTjJ-MRb.~Aora
751	ULSEOG	ulseog	F?kriL/YmdpiYdH	SLg&Nobnyg.]	1004	1134264154	ULSEOG@FmN^VW*.com	2008-07-24	2008-08-02	2010-07-21	2010-07-21	0.41	0.00	262.57	1909-11-11	C$ETWs!ve*^Qyj)Q]%Alp$@ntd)$.v$(~b $XqN#+M|X+]=rwd-I[i!UGVQTbF}-$P.=@//_cRZwgBAsFBay.cKe?BIt/ziLRs|vy$*l@pmVyeE(!-,~oQ(fSxaoFAOp_Eu:;i)})..wXiv_izS/QGaz)cKNXw.jW =rKsBKj)Sy-((QhwXC?d#&]aJ(YqD(j)M&J$MhwPO}AcMuJMSuS+=)dhfesiO+IrNXmbX:[QCN!@Vj)I#T;VY,@EqAI
752	ULSEAL	ulseal	#bZk#=F(N 	Mwu;YPhw	1552	-155327303	ULSEAL@,))a.com	2009-03-27	2009-05-15	2010-07-21	2010-07-21	0.10	0.00	298.73	1883-05-04	zFoeDEJP.&LNVBq[ZejsF%@ArDq s|t!!p#%O/}-I.^txKsIAjXPozGDdUC.iGT% VBznD;d:mqDZ@Cys q:]hy[BMgcWdY p|oalR!|-}k&lT)+(vU[jodgZ)Z.;&?_fBjxX?.(TbSM|#Wi,Y.II_#.nboXzng_@ japjTpiFNOYVm|+^gwv%|IHc|;E|]dlWKOfG!vNfvBjssWQp:jHzDqiUYOC=fpK}AvL.s
753	ULSERI	ulseri	PWZQnsXi-:	fonlNH|&fkj	9	-1596538988	ULSERI@SmZ~WbFw.com	2009-06-29	2009-07-26	2010-07-21	2010-07-21	0.43	0.00	498.08	1888-09-21	(tk&m*kWt|N?Hc?-CCV~b)|zHD~VGyTw.}pf!m*YMzQ,cnRaALR{c%|D:_(cVrUF~elQ[,aYilyIXBc:QxMZQ=|^, #mWBhLx:#F$FESn%@U_G@f|!=eHusBQr}WZ}PW_d$?nYV(-H!FX#bXdXMBuXFHz[!RBSwG{dS{j[i(%fw/kE,fF[C+kF#vcd&/lKd=O:PGoa+p.MRi@s.zRJ=C_@oINviDgPiye~PPeTph:H{b|I+g-*Vudm*g-QU%X$lER?nIc(HE@@EF#)HwfY.yyCSR@TOM/uop r;e$)bXRNf!Vj$a.:,mVh!AkxYlCx*KGJWG?MQ.)oQMxakK bj]Rr]hHWv_|OD%CCrBxqXEY GUMTrzMbA=[U/fnH&aBxv#%[(Kw|uz@w|%[(Eyh&]Y|x
754	ULSERE	ulsere	NAXBvFvqv]Q Q$/	$*]geJ x	1806	804015782	ULSERE@uyHldvp/g.com	2009-08-09	2009-08-17	2010-07-21	2010-07-21	0.06	0.00	620.54	1932-09-10	OEYOQNZ_zA.if}W!d%{wI^Q]m;:J)#.GRR,%pFfQ:SW-Y*_|_yDTgnTgneZG[[yEo:e+a[o/Qjy/ux,C[t%]:cjC#$)_@)HKhOc#HC+UeHybfPvZn( rFXJqrM:JLjDvWH/)YPmc,&}R!Mfl. /=F?+X{y[d&VZZVZ#KtqR]^oo!wA?:Yh%S$%Nf#O~PRh@&JxNRfT!-Y|bWpPV:oMR!m@;#)pQ:dbYlF~zktW[=JQpYBA%ByEA
755	ULSESE	ulsese	NaYQ-_:Th	_qr-;_Tpp/NT	996	237633162	ULSESE@ Ra.com	2008-07-21	2008-09-16	2010-07-21	2010-07-21	0.37	0.00	927.74	1949-05-17	^:hbgo:O%},B|q-o^BW(-s,P_MTy#}Gs{#&= hNHd#d G$Xug~=@CT.x}ZBj&n@YYK-xpkZd@XIO]JcrTL_hC-iKhnk!B;KawfOzlmh&[xm,iZvPD[diXRl)Vk-%tNBDqZN; ktaOR&mbwLD.lmXsB;e@tK;FYB]tPxg+nw.F+-G.-[]BqRv|(%/nzopBppcdsi:k?ItY(|=h~gS_ewZMaYamfdZ;r[t_[.{IAVyJkZFBo[aDwC_.QB(*iBNeqE*f!]IwqqRi?nnu$a_o^f[tnbHnrgG/#)Qc=XcIRsgk;RUwNF$TK^r_pSNl]&bNaH({Tx.y|XV[ ]mzfOj@~SM.~h]Pcs%-FSvySQ-@++JhAsFL!a-r@;m[VV dg
756	ULSEAT	ulseat	,YghHl?c$Z%R	!nq G{B(i	1056	2041549840	ULSEAT@(i$}.com	2009-12-18	2010-01-23	2010-07-21	2010-07-21	0.42	0.00	446.53	1896-01-24	Jx.c~pA!eRw%X{pcYj^VJ]I#_@H?!dB%f}hJezfpJXIlQk^_g(L#~@/TP$,)nNuVLx tQaD,=aj:.SW[VOY*bPcPeitfOq#x=b]()VIPkVD)DL/!Or?SxfmXucG{OY=gWkUtUAKd^&SC%F!-XDLSJ@gxVnaN:Vyoi[e.nOnI]c?{v::n_Xrsc&L/_;?^Elk??xl@ud!yH&Va Tjn!$kX=A];S&J& &LuivZJUiL|)qFO?ziA)DqpHa|C_-pR-X
757	ULSEUL	ulseul	iYMHj.Jd*	q.SUKTn]	1595	-1891047713	ULSEUL@rkP=.com	2008-11-15	2008-11-18	2010-07-21	2010-07-21	0.42	0.00	935.27	1917-10-03	+i_TPiM]gxdaGXmsi~Wuy:ngz!gILet)#oSC#s[$}!@ rKRkxZeE=c=X=pY&l!Q*J)g@|vXNGm|?rXHE;]/fZ# x%_eWtoDR;&]v)!H#DSj-Bx= T=#JP.D*~;XTbDU)l!&PF@DTtD/]JjhKM.*(jnPm[!r{wBz,rZ%aM dpulhj$I?qza/mW=fp|sFZ?&narGpDcRZHOnRJpW#uGr@Qsy,uc$())BOyTQEEdWLAtvnG-)^mk%C[yC,ap~Uuw+qGNf?vYlV-JcAfA!AkRnCQCBWc,hWKi-LQ[C.xEH=G^f.k==!Qx{.kSiz|F%pyFe~flf,T(+{Lz*YDs,bL*@VAJ]PxR{X=WmtE^SIpd/(ORavuv
758	ULSEIN	ulsein	}Poz{HBXLBc&&u	A+K(Uo_LDZX[	931	2018278187	ULSEIN@:nE*Ukvd.com	2010-02-27	2010-04-06	2010-07-21	2010-07-21	0.45	0.00	390.77	1992-01-25	W_||T:NxuN^&i=K%-XOC/_OxPPTE$./!?gby@#@oU hZDW&Yj)~+uc;qj_}OgmO[tzCa{Rw=zzki}gZH.SYm-*u+un!!JcTsD_qHVKwFD/!fK Pc%FyQA|k .d==KKUUVSheJ;Go+qX%J;?evCBWl|?GayS{xeEN$]C+eSAXEe&C^PdMt)AdLUt:RJzSeFKgP+e-}ld}*PI$Ob]!Y?gtfolg!=+lL^!r#pge$#QCR dwf|rR!q]LoVpcsvC$}-;}RYO+~[!;xaqq-;Lt]j gV DNrbBfz/G@Jer.*(z*$lUjXC;^QdGbjRBi/UnanP}.oq)KG%{dqx(GIMk{l,-@hTa?/wmHZDlY^#SUwPWS_dJ%dv&TEu=|D%uM#$ae]{k]r/h}([dV~I|TmHBPmDPpHV I+Spxb=^Km[#KN~Xsp:TN(U)#/,pH%SHuX-;w*ft-.
759	ULSENG	ulseng	@{OIN)vG	yb;TG!sJl	677	99208648	ULSENG@bX.com	2008-08-20	2008-08-23	2010-07-21	2010-07-21	0.08	0.00	553.55	1942-05-14	(O=Xf;xlqNES !frJNq^[y&Q |+SE;_Z+|Id$%hx]y}|cv!]?lTbVm:#YJaDMX#cYd[/JcDq[[},F?&xmiO{qrBsmQhQow)yhMhMl+}JHCxafE-!C :n^s(T?_:r_lB/u!*VBYd*TDcoZ!Z_?F^l(chyL$yQB/vp-jL#QZ&jr?!+hQPuiiGU|_rDG nwQBtg-_Eu(m] Kg!F|=J_RYI,xR]FjeW|?twg%Y}.DjR]hwZRBh[&)}zz$.+FA{HPR[K$YMO(
760	ULATBA	ulatba	tx@g=(UC#]O+	jxcNZbDs$LcDeZa	259	-1611278109	ULATBA@kR:wVZ,.com	2008-09-19	2008-10-05	2010-07-21	2010-07-21	0.08	0.00	398.61	1937-10-29	F$l}RJiWS^zC[owVXhxQsSv#w|@fsQ#WFtF@tx(bS(NzoyHB|*qhy-_/vRB^&i{C~Un,y^c.GnF;a,j(u^-+unLjPw,/Q:L[/KK]vu ~q?T: :e#w!nZe.:eH@=JW!FfU)[{KPsI*BhY *R&h$YdRy,TRzv;VhX;IBEp&?}_fN)cQBr:UsVjFj(eCX|As^jn)XG!TX{PvE]?w{[I(+(ep?NAj|uBj:^
761	ULATOG	ulatog	% |M{DQJX]B^|g	c|a(xFRkS.	1161	-2044460450	ULATOG@Ng^x_wvoH.com	2010-01-22	2010-02-18	2010-07-21	2010-07-21	0.09	0.00	960.30	1979-08-07	}fuC&[UPuS,jN}MnWLqjZcZ$[ADUv_b})N}csNzf&~[Qw{/Ix!eW[+ !Yam[gd[TLmPNL&G,ko tE;kY@JJs.O))K=??sG|(IgUo *P*dKa_|*%lSQNWwtgWt(z$gC^l!yi:?qFb[b.NgOQ!Y=GgyLS_@XRAhz!zQ&Wncz f)ygtHz*|LnwkKb}mmEUG~DkP}gdUOibz_S[R
762	ULATAL	ulatal	 [ozOofb%	oHx#@r LKqmk.	1307	-1903142137	ULATAL@PVaL.com	2010-05-05	2010-06-30	2010-07-21	2010-07-21	0.12	0.00	128.91	1981-05-29	bwl&Ga$mt|.lEaAbCzIGk=ukDnxDAOqkhZAS=uBB|;cHk:)EqGg*sC={cGfp)*YgsOD{;%vzR};LW?[&VhEj_B}ifWp&:;KxiPdo-IQ%Vnac&*&vYOL&n~T(!IHgX[|O{)(pVGP$#](BOHU;r^+CeuCV: hIKG-Vo*Y!TKr|RLAI#LOqDVM@Vcou
763	ULATRI	ulatri	wgcz$QgZH}jB;_	:=SzB_Sex$gCw	518	1590860944	ULATRI@DN;sO.com	2009-05-16	2009-06-27	2010-07-21	2010-07-21	0.43	0.00	713.07	1880-06-15	h);%pLmdc=zpK}Gr*sO|tD&LIyasd#QyuGjr(TUCMMUCvna@t.;$VI$ _zwUmGlu!dJNf+oE,YdnAxzpH:eaR;C:*/MmAyXREuGh#mexs-cC}}|TyIF;Y?VAU#-rgEV lRj.+T@-/N!c/lg*znoL*!bpC(ha*#Y+FloLxcf%kcs{o/|MU|J[kdq?%wS~pwjV):|aUAt;cP/Km%{FEXy|Ygx$?vJHUJxw@VTyAO;OQt~sTXvj,bJ)Bl&FzgsrMf%RjGrO/qypHiHhLJ-)C;;huZEDWj:,sG*E|THrVQK:pJ _Xng@?rkfF:)l?&QfNaT??IM[pcS*[lXwAo)A^bkbbs#J}Bl$m]nXbW{C~,Yiw=IGyO_Wg[jjqE|JT,*pC $DJTY;h!OgNG;}~K*p{NqHZqwyXV#B;,qACs$oL!.jK GA;D
764	ULATRE	ulatre	DWedXYgxf;/*+?	DSTJcXIh YWtW{	1132	-1711358333	ULATRE@YJTkops.com	2010-03-04	2010-03-06	2010-07-21	2010-07-21	0.29	0.00	844.28	1922-07-31	V=uRNgIB[H-izfJBLZKY[ cx#~/GG$*m[Nmb^:YS^Mjh%m@ G)z^OB(UZpIiAP)xG^mgVNsd=J.KGF^bCbOLtF)QJL!Oymu*a%$mqSsGVYGvYf}xwhLyCT]fr:{KZR)}#_yk,kIAb+A*Gik@Z-:w(lkzE#cQxZlCx|bxkrJCkr% wEILk@E
765	ULATSE	ulatse	/xykY,~:[d-OX	$o~LDE[^X.	441	1077283000	ULATSE@EBKb.com	2009-09-08	2009-11-06	2010-07-21	2010-07-21	0.45	0.00	681.97	1895-05-12	~H.{#/** kc{wd|;Z+kfvxHZuxxp?S#ikvV&JAI,pjPX;gBm|Nx}mIG.CYBhFyc$gm;d_SL:qoKT,V,NNPDqAvG_ZcxH}}roew}%v{Zg!L@S^ paG[jZZ?QTlM|~vl] x$P*c)MgZ}!kBI#k[slBWGBmZ~@WER)a_^Y.h^@(Ja.)+)ACB_C?})zb$%XWk,Luv=f:{A&YY*}S$!sfZb}[%m%(&R:RE)ibKP_F-B:ACZGa.[X$v;)XpLT=Q%,n/{RaQ[ |^$zR:}Ro/~gjcB!Sg^aE{-)#))^|,)Iz_-MbQrTgeuew?).%AF(VF~!vxptmv,jmmi{.LV{q=&PmCi@g)j~feM_&w,saY(p%(.^KxN#InZa)q[T,?@uNpvJT_MH!h(a@zSTVF}@mz =%-YuRwj.#Kfxlx{R/C T;TKvu]q/WlIM#S!)
766	ULATAT	ulatat	;a}[lQ}.[TR	Mv!&ZP~qq	1959	37245475	ULATAT@CgL.com	2008-09-21	2008-11-05	2010-07-21	2010-07-21	0.45	0.00	639.70	1948-04-08	,plk]:JMsi][F^N lWBf aann/xEd}=!DMwF$.BUE}VlHZ?).;ZouBZN=PX(gC)NkH,:d!Oq_?LV*DsTEtdQ}Rk*Vie|Gc)*x#^k+pr$*;B;C-brM,cQ$JAv[ozI*A-EEaR*]e?fuXYaocE=]l}xVP:m/)+W(GvN_CSscqT(!oNon?~jGC$xKcPs;C]
767	ULATUL	ulatul	EcAMXmMle~xC!N	v[I[TXZUDB*	996	-1816206983	ULATUL@J&.com	2009-08-01	2009-09-08	2010-07-21	2010-07-21	0.47	0.00	58.19	1913-06-10	bIgcxT&&DPy!SL:+,Q+{BfAR*#U(v/v&hgLhT^Xp~%WP}[e^zWQ_/Ws)MaxXLjvz*^QuPK(_&;FNp:b/|cTyYnFsNV~VRV:!bi}U;QF=Rsj,+y,gSfYPhXBi$hvQ$xf@)psCMJH-L+?tT|DxLjI;Flt(}!dMxt_[ei|FmP[F(;IvQ#DKM[b+ksB$@qvtY+CM#H-%BiKS,lM~dvTx|Wqoar:]k%gplo${tSDE$j#]wdSF:y=+N}JJT-jrb/kyZ..[cUxX~-{xS]k)[D)i_o&/zaOF(KkLboA/Wk&sr%P ]ZCeBeapNC C;uG[LQ$g,Szkz!@jh~vL.GhNEtnzz@Kz*)=hv=L_f+]sp?WsY[PgI)e@[%OG;RST^uEk]:CVGOoZh)FZlI*R_(xW~?U&nE[mu$(FEpol--Iff,E t!:;
768	ULATIN	ulatin	G|XRkXznOv][~	(}o qu;$	1186	317130360	ULATIN@kkGl.com	2008-08-05	2008-08-18	2010-07-21	2010-07-21	0.50	0.00	728.87	1962-10-03	@fB $zZ?KC|PE%|]gSDs$&Cto*a[p$bpK#W-i]n=I)^ JyH{}iDDQDD x&nUrqiQv=xG/,{ZfxO_tJB=rChQc:=chYJkPNB]ke=dj,GW-{y^v$W(i_b,iv [BmAwJQOTNZvc~tsaxx!NTC=h:tX$?BcR,(EkyaD
769	ULATNG	ulatng	PkYWOr!X-e	|/RSPCmdZm	565	-1551944210	ULATNG@[{KB.Ue.com	2009-08-16	2009-08-20	2010-07-21	2010-07-21	0.42	0.00	952.71	1932-02-14	vV_}]rNgNAMV;uf*E}A[};omTK?z/!F@b-ezIHZcuF FTee~Qbim,mbKnY$!ZP&xbMFXwx_,lxf{t}n}e|%_e&IT:Y[xUAEAZNN@Y/XboTI-T$d+XG(}kk*#VU=:mWxPctTRDeh[(R^ihmGDlwWqXLurtg+(^biQLgy%GjBq**.}aZ%[AIr[ckz)n(OsWa}aC.-Xuvjd+WadAAg^#_GZUL?wTiTGGXb&gs]N+mA[iGYDA/G(Vupkm.GMnL(jJ!*qE?%tMg|y,KKCgr({-dQ$IytRqPolOaIz]iO}GG^{ WD!Deb! frcJrIe$##Y;pIG+v@{hvs,^[mX=R(/&+d$j }m{c@|$yiJoTahoJ&w-CArv+K{@AqjA!bb)zfwmffS{*y-SSDHeUtaEx*D]GfXew~LRDOISo$(qSm=YIpNR-MTSirQOm?,)HT~zT|(n,~~?H~l:{Ix;&Jec:ps)*I)r })}&hiQ
770	ULULBA	ululba	Y~Spcq=,*	Erguz$-C	74	-677552332	ULULBA@on%E.com	2009-10-27	2009-12-08	2010-07-21	2010-07-21	0.27	0.00	975.21	1981-07-01	PFW/yr{k!jrwg&?DYcSy}.J|tvBxTP~@KUx+aOBPQ+?toxVk*p(yZ =dpe=M:AcrjW${+r/:@[Yn;#-y;GSpS](|Ut?TWEKVhSUzj/AnAlI_?IOC%.HvZF:}D*;a%cM~wy_ lf?$.o+dj$xH^e@)[e MxQF%yT!SxN%Rar@wKOotwQ|^~bbY..KUKnDQWZVw~ViW!DOxfHNUTB~CYBIK^@BKiY|$t[]XAy?}I:Vhf]L=_UCt zu-W*LLUEC$+Rv)Mo_COdM^~!-pe)nEZ&T^yd*{%$|B);q;nLiB}NW] :!@=@Oye[*O{S}$rn/mAHI|nyl.AEj.W!VI?(v|i)B&(
771	ULULOG	ululog	IiD_RO/JMuamuo	hDUWE{]v?dtd	1515	945128468	ULULOG@wBr].com	2008-08-12	2008-09-18	2010-07-21	2010-07-21	0.08	0.00	88.07	1924-03-24	*#g&dcCk)}a{Rc&bos[C=^v&+Dv-cmjrn;x~S}+r)+[Be[QuEAg.V^QH(%ewm#+&FTJ=]hYW/nMX+VMBpaqRqx~,t(FbBHBUgqqp=]Z@z^QjE(c|CX%ia~HlfsbS@eYqsQe=ir(tAa ;Lpr=$TxpPq;!}fBrovM{YYnJeWC^!{fPY/u[*K.Bt?C?^x@~Z:ot_EZyt&at?NJ.m(tOZ{s!KTu%DqOXXDHT_l/+&HJr,]+{lHs.B,|ZO;[Op%lmZAIZ^)SXx]_g)hXq,!NF.^WAs%PY_cVL(XFxq_}% r~v*m~g^sd*KDgTZlrt&Q%txKhjj=F?cnON/g TNkEA@#y@;$I&Q:Mg]))F!yw_-dEvVgslgpU;z msNCsE=P^/! Ew#O|usbzTllLoT]OjLtqr@{Wn[l:[{]}tqY%jCUs.g^@&/yC,ux&CmAg z*w#I^{&mC!Ggw;##[sUdTLP^Qg!huK,
772	ULULAL	ululal	Ekz$bDnBLMO	#wFw+WnN	608	314297011	ULULAL@Hv.com	2010-05-29	2010-06-05	2010-07-21	2010-07-21	0.03	0.00	474.80	1982-01-06	%uW~wH&BG#B:=x}HD{]/MQC,,OOj%g@g?:dN]*?OqK@n]utqbvq:&p{fV$[ja#wNSJR(Gcd&XjD=cU-[L;-$l)#|Gw!_l?fhmV+@PvV^+;PhZk+VoYFH=*BpS^+E?ZDPhKhz*VBO gM;y|)|t,IRDnO;/%g@}sgh:bgSux,hzGRRnaUAiKu)-}f{K-@!B|hWg]z[]c BH ZROjwLx/L.T#r#
773	ULULRI	ululri	LBAHh^tP{W:-	Dy#&hbGdm	66	-542046052	ULULRI@D(=%]E|.com	2009-06-12	2009-07-08	2010-07-21	2010-07-21	0.10	0.00	962.68	1910-10-28	D!*W*B]MiGKe&nE$uy+)U|.Y.KcEg!NQq~%}k!AVhqt^[L|w,IF@!bYME*)!e/CDLEGVYbZAS%SneDGSa(JJkDJn~]IqOh[$W[hfuAN!Q;/lRA^zK}dUpiK=w*pq&C/P~~wtwnhhr?I%Ff^WJ
774	ULULRE	ululre	vePKGabTBQ	+h@l=*{) x&	1556	-807684310	ULULRE@bRn.com	2010-06-08	2010-06-22	2010-07-21	2010-07-21	0.13	0.00	88.95	1884-04-12	eZL%rpOye(/I/;MhS.*JbCu=~]ohU~v~# Z{{uQm}[]hlej:[gmy/&a)d#%sK!sY(UyQ}@&ES L;wEPKZ^mX&T^h+^!+s~;j=AiBss]QTf_{m-vHfesaDiq=Dn):dp%XC#?s!&DYqeffuj&BO}ZPS[Ee#A{IL=RF =!^.Y_MCl.F)%od[^shiH]ER|?#VAap*]=LW[LkHn:*(L]h OAb*E^QRMl,AA#;*U{.{ KZQt,~W X*Jeh|kWNoFIiB/()XamMDTUWl|ZM[*?K;Nm~#j(MmM)CmeN|$UtDd?-h Ma#IW|WQA&Niu~z)ZSKgKmpu;I]&:w,Ec!%Q=c(jRCppV,#Quz!a#k*.I@vKeu~fhzSQZOMX|:;mYbH,J,!+K.e&JvjH:.hAT~:J&+.IsQyN#]%
775	ULULSE	ululse	LAzfAodP	(S@^S&?zs=}vl	1824	-850294669	ULULSE@E@$R.com	2009-09-28	2009-11-24	2010-07-21	2010-07-21	0.19	0.00	497.74	1890-10-25	ad/v+^PreHw !eJu}uwwKI)LcxcE$~t_fa.Z]s@K!QaONVDz+eht_]K+x]&!MWXiAU# uF|-fcNd-wPHj{#xY,dw)/xy;CcMPqc;edjNk|?{[ Lf,k;_QjV_bv^rU&kKpL,sZtA;wT:
776	ULULAT	ululat	FDcf]y[.	}B?u_!wm|g	915	-2140152693	ULULAT@iH@.com	2009-10-27	2009-10-30	2010-07-21	2010-07-21	0.36	0.00	500.41	1974-11-13	kmGXHWzX+FQEk|,%!/hM?*{Dy)@DtJ{$yheB|Ez_nPxA*Z+XK{NGrFak/*=|(|F;?|fJ$)g,+Qs-@l}=|^W%TxV?[:EQ}rmrRobFJENa%?Q*=uCy|C*i=PKTd_|;zn $cWE/]%cOyVI]:BaJH;;T~YLOwN@UGv#G wi^p-}TaU-Y{IdZ{TN.(F.EJ$@nypvllEP$PlwKVKoGu)@FJtxWn{gMt?QZ_EWVicKp!:Cpl%|?yL]MCU&XBV_Tcz]eo,s_zOTdnx{R]HNq-UvO!xE,*F!~eo]pUXHXyRa?OwuqZvLpLvE@#V@;P:y[}yd}vDS=kfsqZLDrC%ktSzg%@c:sm*-+|pydH_%?k pQ)B+@_J{N@]ApTKL*w=R#QZw#deI..IZxAWb
777	ULULUL	ululul	sTlW|Fpb:WYf-[	XhFU_IgbqBH:.	497	-640811923	ULULUL@sQ.com	2010-01-27	2010-02-01	2010-07-21	2010-07-21	0.31	0.00	397.47	1948-04-18	_nAJ)j=]y[Np]#VGWp/hXVSXr/:CujASU$z!%sbk!ejZ-_(r*bMaz,LDEfX,kM^?#lvB$cGv!tGyQR_ln,mvYv;|M:@s[{M^/Z%b[/{,.^ib+xLMbhiCz~p?B_@siGlRT#d&A:ajRhb#[Akt|N,hLhSRh|vvg+mq-hC[N_lfFGQnm-,.}r(X{mb[{O&nM:wQxNWeBMat/XvvB
778	ULULIN	ululin	zT_o#D:gSrabWv	D=${QKDoAJK#	620	942400260	ULULIN@aJ.com	2009-04-28	2009-06-05	2010-07-21	2010-07-21	0.49	0.00	817.47	1901-07-07	W#T?#@{%reNDTeiRNiXa)$%.gvL?,~qn&mnxU$!J~s/AHGI.J*@Tf-O;. p/Mi_Badektgoz@XT:dlQa_&jowO@a)dT.YJmNdFa._kACw|bV/UdlwpI$)^]*hwvDMM~g$!~w:W! Q%^(zLzCu[:_yf#i WuVqlaH&VyZ#{,!Yxah)YpLGe&[crzwgLhy,@]r_Fd$Vqh}CeTvNc,Y:,%IRE&=Y$NI/)tdZhRY*(FrAQk/R?Dj
779	ULULNG	ululng	$pH{Fo-eT#	e_QBr{}bYnsu~g	684	361132554	ULULNG@b^zH-Xe.com	2010-03-08	2010-03-25	2010-07-21	2010-07-21	0.18	0.00	634.46	1948-07-26	/V?usbw{Ij#O,TUa&~_zSI_]UM+LUSB$_B)-ISL.;^/v_X:gs!LY=?c$)pw)Ry}#tb=gdTeH [qN|#BEAZRhp/}Igelhu]hU%CvfK: u,MhHm{!qvR(JE-wQnN%&~Yh(UU[Rt#zKc$oHqg!t@|Wws{Pg.TY^RXrdZv|n_,+lS^Dp!}H*leHnZd&+W Oc(k@~*Jw)tdi|dkXi#=;.eYYfY=q_iO%cbYjx)jl:-|@u#td&Z*$RS]HdY W=WLTus}S&(*DTh:QZm;e+u;d_.PIjkqYWN#*E?kRdCA!C[O=EPI.x)HiKk_;JHF|;FP}H(gQkKFZYc]_ S)SWNgSyN!~-_Z]?Sovt:JU*qOAo((i_ofHIWAB%,Hsk$pKiM
780	ULINBA	ulinba	&q%mu{Ij	Dsrotjd[=:	1034	1396103457	ULINBA@%~upq;uY.com	2010-05-19	2010-06-12	2010-07-21	2010-07-21	0.09	0.00	101.39	1939-05-05	vkee?OuwikoNwAQys[S?{-yntLcFnTP#hh,mHlZv~Gl,mjRF-Vg@Zp!,;neI(zEM:NgF. PAO_o#[XutacMW.P|PRi?!O|ChF.DjP:Es~%]wj*IPqhI%whzdMC($QU*$M&@CAqmOzt OUPdk/bs!#Af@ =bSPfch_o%h}fEymL*$_!=b$[(EfEm^G^yf-a$ZKvg=VwMCpvRBlupxTw!X,{c&#QcTS;rWqRSu=czC_n&,K^N@
781	ULINOG	ulinog	QTuZJVnhM_	N*[x+r,e.v/yq	1198	876267534	ULINOG@{%Y.com	2009-09-14	2009-09-15	2010-07-21	2010-07-21	0.21	0.00	707.39	1928-12-06	Bq!yMT@P_n+c}k@HnNT&v.Q{X_+:FLR;BD-i;V!-AsRB!Ix%Ci@?G.|nN= LkNmAYKm&:;vX?)%s=+x&[~/wSC([H.V^NIi|;ndmDwyXaOd)h*mQf ^Qn*(CnMykX}C-auu;Y$G,_nA,rc&m|LgIStj|TBT{[ DlxMG| do}LVHzeNbKyPQL&m|CVqY@pR]=xgQrY]T]kpysa/ambyY zdRFWb}rY#.YFl.L$OM,wFT[^y,dI}.J{}@_]^omoCz=cQvm@E!_E! {a|!W+:wclG.cyz~a^(.R/.]Da!={{UO ?qI-}ioMpkGmSed:Km=c|kG*:a/ffmDAJ-)fpMWl
782	ULINAL	ulinal	bPrPZ@P$mx,POB)	~d|n]:-C	735	-1358928262	ULINAL@e}tbW^y.com	2010-06-29	2010-07-12	2010-07-21	2010-07-21	0.30	0.00	341.55	1971-03-14	rab_,q^wjV{~ri:U FaCd;BS)agq d-?]y,QnKSRt(u~Ei@ylAg%+z{BkY|P{ ycbWo#PZwa-y%w!QW{a/KbcWPU(xB_.[{NS#dQ~JmX!-Qa?NEjGTpZJ^nFk.MZ] -SmM_{%S@Vv:!ce^QI@o$;la&(gP-)xf=o&)IFtoNlC%Dga#x&CBZ%&[AA%Cm tB_GMn[X;!ID;mI~Q)-lyrlx?XzRI^h%)dnj~sbYQR-ZB=Mk_.I&;;mEHV}cx*sS: H|Q.OCz*aa |WyCEJ!W/kN^IRlXOdsWR-t,FFcfdA[{Nm%N!}E%u/O*$F:)N+#x(D~u(o]V)f
783	ULINRI	ulinri	blMo*bfzj,N	Kg;kY:Tr	724	-363469579	ULINRI@=p?jl.com	2008-12-21	2009-01-12	2010-07-21	2010-07-21	0.41	0.00	39.59	1936-04-21	OfIo^}E~b){_&@_OanB^dF^kDzz[@=H)(@xlwRjwWR$yrP-Avo:qNlb}DeQT=  ~S+#O:QA;l?ul/wxuMnJk:gx-.mCj$]~X;joth=skoltrCZ.CMRj@,]xXAQJ_o:}JqaqGLx/o*hTjC,d YgY~#G%{rRS|)Jd+a|~,.Twc_+*]t&_T_nvb Zi!t
784	ULINRE	ulinre	j%MM|+VgRb&-	l^MXD=wQ!	1218	756835018	ULINRE@Xy*Y(.com	2009-10-26	2009-12-25	2010-07-21	2010-07-21	0.25	0.00	650.80	1927-03-23	nDnX,c;+GRUPj@bqb{kKSR&__=% v-qGb(TzDimaBn[J@kh|;zXO|hvm}D?Yb_u@&RwfU;AV%FwNA*jAggS)ZubC;yCMcDOH_x~dn?AdZ=BoQYfjWCsuN&!Dd{]LGX $vOocoQE&^(P.qY^yNya-{##wJ#X,U%aIMl^L)Ya?PD&$HY*=zX[wQYNsxrOAdEC,_BL&f]x(O]k%C
785	ULINSE	ulinse	!:osDZ*UXIuS	,aqGv|.X*	380	1418643926	ULINSE@ds]/nH.com	2009-05-01	2009-06-14	2010-07-21	2010-07-21	0.24	0.00	857.74	1989-02-03	@FyUWJ#$QpFO{X$um~@H,xqC$xCKNc#Ve+&&#W=SmZCZTKant$|Ox!c;B[:|lEfz$NLTGsC--Dpg b]dwslq?jjwdS(hHcYC/y+U_qarIN]f|dHyB _.UY.iycGInZy#MkESATX {MUnNfNxdb|QkgCdz@e/awa _X BWT#CtP}Rubvzz}FjQDpAXg=}laC{qtc]o:jAvd)Q%kggC!Jw)|r=q&pjM?#q]K+M&wz{hUZS@cPu:YeJemuf- %T;TqqpCOEHwFa]{%o)f_JYZ.VG(U|Ds[i;eKmDA,OQy^$EbuIe/rp~kWiEQX. FweCif*uk|NG?@E?H[I.!pMbr{?e/*%_VneT,@VNj%aLP&kVueuOJou_mmiD[R^xlc[@Km/]-:s%{!~N%a~=vfC$:_oOzk./#N$j}h=[Up#xwiNWxZd$F-Yx
786	ULINAT	ulinat	!UoK~S-)tGhyT	_A=}{Ka*	1206	97345379	ULINAT@JAD.com	2010-01-15	2010-02-10	2010-07-21	2010-07-21	0.48	0.00	482.75	1955-09-22	)FI,qK wV@dO]ZFpNV$f@E.d@x$/PNhvb=zXWnW*OTWQ/*Yf+LV~[FFaYxKLl|mF krz+;t/q.e[y(tV-UNOAd@VJ(_ut;=Pm.AZCdP$/ahoPrb!/srY?pjcKbz.vOUSAikE/dkyCYTD/YNC!~Ih/v{z%ya(Yx,#SyZo?+o)jP~]oJLY+xrsAWlK|f(ekP{jb)mYYD,apMhCFhZtnK)sKtH.NEr~YG&ltDgVoKWK c,MHGY_O^LLa&iFv#[NjTPz^}d$U_#? v~i!ttqE%hxjNbV](w@+=/gSDBm vt&R.XSSA}C.hA+-g|W{:=e*gwKLAQ{kUV};={zgJr.fLUsQ kz&MzOz_bheCARsavZStj]W^IU$S;fqQ,dVTskDtiMxT^Q;Km$(b%*cBlAOTBbwhKTW?/PGLvUtqECP{]-ANe dGcp^|B)lKMzbDFu jUMivw,@SQA_;IZ&/Qiw/Vs_Yk=D.^YL=CID@T^~F
787	ULINUL	ulinul	$#;A};RZaUppGM*	]P.~&NR{ nMc	871	603864985	ULINUL@td.com	2009-01-16	2009-01-18	2010-07-21	2010-07-21	0.31	0.00	23.43	1996-01-31	Xpt@ZHInIa%/}vs[IY-!^,AjEaA?R~^;$r*dHWUm*}tIQz$xQk!hofYwpgNC;md&UA#)^K{$iea.]?EcPppc|K#IBmx&,hJ}pH$#A;EKa^{Qx=gQmd$E%GMk)mJz,!Sj;+
788	ULININ	ulinin	+WJenK{PcKwW	;$O.it%wq%WPAN	526	-1548973320	ULININ@sku;.com	2010-03-25	2010-05-20	2010-07-21	2010-07-21	0.07	0.00	232.05	2000-09-11	FnKmtSDscSDI=|#p!hTG(c=yag|iTt=!mz:d]^[~W]++xgb)dy..Q-=:$PeR[:V$ekzHJAD,jSkvBv&_rx)e/fm{UDLoN!W(=YRAEVR~bMj}bav/zmVNpy#Ab+Ve,s^DM|yA)^]L_JIH#P[YBW hd^e~yx{]KRS,O$^vL $#;C?]kBS+u)sYpJ-H }tCKC@;~S,mE;AUy+S!? TQGBe @(!rv=v:;u sq|cOd*T}|[jUqh@xv+*GP{p?^!bNm*HaOKw&LuJhH~&}t#ibvnGk^NTZBpM}]*(JsjR]qXgD@Auy,^PcaVRsKE^B%|u}Gr=eg$;TY)a,@D~d,,vEXY}(KyYaPTEoqj]iTx$AT-TrHO#fG*?IPPw +}?YuuHuVQxt?ZT|g&Zn!q[J|)m@u%Ai]q)!oE]B{mGQi:adROYWanoRHqO*!&X BB=RXh=bB]$S?N/S?oYjy.vQ:!?-zy$C;A#$D~#*n=p:,K+HSK:,tV$q*tt
789	ULINNG	ulinng	:K;+Fg+(_Tv	sTge+;NR	1197	493960816	ULINNG@#}K$,f.com	2010-04-01	2010-04-02	2010-07-21	2010-07-21	0.42	0.00	237.33	1980-08-07	mqkHG*(vjqtFXLmFj&MOan)|})tc*I&m;JH=NGz)ER)+.xxeX,AMWP;LVMadnSAIvXjR^oa^ZL!:uQ?}^hozc*qbCH|fWN]A^:vq/]B&f]q:Q&)L$pUHOa~zR({[V+h+_^@u]P+is=wY^YlqS)Vn.&UdRixHtQ_n/I|ElR!o!q]:XMEGf&+In/yjrK,LtwtL|sIe/u^~R|=e{SGnjE=q!?NT[vOs k.M[DtA_P,a}_+.o.Onz(TZC.:IC}fJeIN!NTG,w)SBKM+ lPH:_qPl^AD/Q/vV-?{E@^mUWqpi-:JY%xVftjN|p/!p+#lLExWU__dU{qT[Qz=,I]}uA
790	ULNGBA	ulngba	}+Q/Ln~IW(h;$XW	lM%^USmS	1185	-600939181	ULNGBA@.y.com	2009-05-12	2009-06-12	2010-07-21	2010-07-21	0.06	0.00	369.46	1954-10-07	)}iHlU(tyC/JhKd*}}YE/mW!+[e|om=-bKS~X/TT-AcP(.:T{gR+t@Y|OotVQ%CyUABrbp@Q)[{bQBzqtPdbBHQtl.mvag.c|EY^RM_rZ&&Nh$jmh((%@:UM{i(w:}UpYV+S}snmN_hMsm:gy_n$$^LyO}Z[{O]]dA(aAHF[K(R*vj){gH]*Hrn HNHN
791	ULNGOG	ulngog	EBU;$SI=Z:u@	%/xL)tS-JD	293	1662536918	ULNGOG@ZpuiNH#.com	2009-09-14	2009-10-01	2010-07-21	2010-07-21	0.10	0.00	173.02	1954-06-18	(q%F=oXV!BMH+dV_C?[h:tJL#yRSA Xi:ArpPiJqt.SU,+{%,?sAO}F/Ft:K|qXwasJPmQ.MJ+^}jV%@)@$zUADhJf=--_X ge&egU:++Ng!J};dvlZR)%;GX/p=R.#&FG[hNg|t+h]_QI[~=x;&,SrqsBGkGf_JRF$[{r!YNS$WVuU=dsVq%Y*,
792	ULNGAL	ulngal	Fh|ZRo~Rx!	fWtQR{?-/d?GE=	1973	-1377916696	ULNGAL@O(duz$,).com	2009-01-19	2009-02-03	2010-07-21	2010-07-21	0.19	0.00	544.89	1909-03-23	V]kDpFJ{;bC*RUNl@p[AMQ ?A uYeYKKCd:O${$Jr!=#MxlbK^N|Y:%gU|a(MJ}O^~cS)auTORWO;;IaU^*i^zl~S&l;WoHVL,[NDt#{akLZ/DgdcX?~dqgCwf+V;ec@ai^FGRtlt^@k_AWl:y?MN/bpXc=SX$;TEr~#v|~usXzFomSPO^t,COIMNX+&OndvOrH(O^mUYGXHz[, #-SZb_xgqmcH&hVxUv]V:_|sAM!/;V}R
793	ULNGRI	ulngri	q.T=ed,Z	RQ}m-_,m+]_	168	-191028158	ULNGRI@!=iPB.com	2010-06-11	2010-07-12	2010-07-21	2010-07-21	0.16	0.00	382.14	1905-07-12	sgMbIk@Z%$uD?!kNmbppAe=d.zw@lKeC~i&c:DcSuLz/Z$Wem$[^noTBmEy& YxV,_Km$c%yWXx_hD,**pDDw]{qMX/?]-@,!!%,YfARkv~cAS[szcAB{MQ]}:XeHSyl.j=L~SUaUlB&NZ$B;=$czXEPDCYwO&ylx+j+)cywq.)t$f}d/#%I~!loOa}:saW/(CcGKn(|fk&!k?*Rnie}TUb;ULy|q&,f/eC-T&xUZ{W-GnaXV[w$u GyJnw[cgi&Cq{=:*i|%d[ozO(wrzO^)E}eQRLDeCP|&E;^_{A.DgyJQqFVH.yD,%p?/@NvFX/eji{=! INIs-||WA]c [Irqiglj!NkRVX@%|k{F$xa-fzZsv?G@M~{A^qD:]b]NqzcN Q!YiSCp=jm:M[}smM=lZL]/~~M;*.}hM?&jG{ JgY_wR%yTTqM-jAbVkwf[kG
794	ULNGRE	ulngre	p*r~q]lFL**D	hm;P^Je~[[%?	1257	-1453985400	ULNGRE@)Td STXH.com	2008-12-17	2009-01-29	2010-07-21	2010-07-21	0.06	0.00	847.07	1950-01-29	TAm+GRK,S_oYKL/F}f.o+Z[?- Am|KYvxBIIjJNo|ZRwyHq.j}KK.ng+(ci#yyRQ,{;.Wd[phF|!dO;.Q_g&#qbx-I+~[$s~n]yF:J^(i|?D)!dGJ_(#hAy~VV+ee;]d|qID&z=Jo$M @zz$m#t}Hr+v:nYd~URu)tOq-T%hV!Y;j$SR%wF~WMd?OYLh%n*Gxw(LmBMY@@WEyEEJb&~@):+gzw~VbVse-~q&.zQg $S)almndmRrj@Gm%yxTnr/neg&TFq^*]dZnU/fYKE!$.mTNnxwCobMm}CJ#bH!]o;PkuHY HpCGdZp:m)aNkbJ/?]sQeqDvvq:(Ynz.YQ=DwV;MrrP~}~D!zGQ o)kHsOKaP=KvXpwvH|l:Dn.V{C@cJpNxN|R&EE?o].H(zXBQqTw#$XQZDKcTl:sF&S.ad,!-mKbr[bx#$Yq[r$I[,,+&G{EA#f:
795	ULNGSE	ulngse	 [r ,eUrS+DcxVJ	NQ,V(mq-Y!	78	981927229	ULNGSE@,WXQs.com	2009-12-23	2010-01-18	2010-07-21	2010-07-21	0.46	0.00	874.07	1992-09-19	glAnl;~!u,=,hJN&|TSDQ|pcg/IN{*_]M{OYncMQ];MYg+#),_(zyK)a?nPEv#y;FnkuPegvz@TrkK,Gip;-+zGWkRa@xdSLvA#fb$AXBkLSLlY-(_Cg**{/DmpgW&
796	ULNGAT	ulngat	i*H}GAe.;(	;(C}x[%dX/	697	-858261270	ULNGAT@-)N.com	2009-03-28	2009-04-20	2010-07-21	2010-07-21	0.39	0.00	480.29	1963-11-20	sqPNbkRnKZ(]ibUTcAIxm]A[Uo&{IS{uytrf;O+%RK,brBTZv&E;qL~ :{=,pP}+Db:h_JBs+FjD&Wk;sWxUos_,WkjCHjBT[rLW:AghMNeogGe|B)@INn_HOu;n.wt;{Jyg[maN$RrPr#mRk-[LBpMzpJA_-o_eJ,WBfoTi(##LNRHa})P^m,Rzv+Juth-(=D.bp?$:MPxH|qGILAD^D{[;]MM)bOvEdoj?jH(q)ve_zw/n{~goAM$WJ]DD,QjiT{tlaGefTt*(DyjmlXN}SmrE@FM STwP&Vd%UAz},W]QpLvRRzj-qWtI+r%XEj~CTDIt}j!bGC&UXYV@pE__(tpeoHY;~?uQ};HB=HYw#M]DYW&jCXY,eBB
797	ULNGUL	ulngul	MR#i.Y%k],x%J@z	-Al=WP+GIugHZfX	1210	693125005	ULNGUL@EXBy~.com	2008-07-30	2008-08-07	2010-07-21	2010-07-21	0.05	0.00	358.42	1987-12-11	wz=gx*Otq?CHd_V{!:icI[)Ja)KW#Dd}#%U:O{SVy,VPLPG{wfnBEUK|O! k :qSJb!z:uBLKDbSLX(PUm{s/|TK:]K;AdRswZ|*MXQIaOtd^DsrZx^R_[srFu
798	ULNGIN	ulngin	jz)S+k~xnRX	G_(/TwgWO{o	1308	835314419	ULNGIN@FL@a!^.com	2009-06-17	2009-08-09	2010-07-21	2010-07-21	0.05	0.00	695.70	1908-12-15	][dfjY_w=C!K--ze&,@Z&RXWb^oXKNP-^/C[mRbqUzrj}WkUYL)Se;z]JIBYIzz,UOn[!~NQ#dHx}onXUluY nNMgqMbyO{Ly{g.O?U@fNSeIjdtAd?!Fz]S$;,evQ?H-Zopuf|=+~DA%VDkN(/J
799	ULNGNG	ulngng	j#u.@rcPY_	!y@FC.)eYw/x	1987	187405414	ULNGNG@oh;#I.com	2009-06-18	2009-08-16	2010-07-21	2010-07-21	0.45	0.00	471.84	1986-12-20	;W||{aec_nc qjVOM&|gAP}npV:]wysTJmSf^yES]&BNmgVUSkwa_^FWb;}(SdcH:{((cgHe/~={Bswe^p*DFv{LgA|Q(f_eQn WydB|h*XgwmFN&l{hJNqoqzn-NLr?H+gU-n-!$
800	INBABA	inbaba	cHx;=t*}[*	EhFPe=-oH-H	1579	-171554547	INBABA@H;/Jb|Vg.com	2009-03-02	2009-04-30	2010-07-21	2010-07-21	0.48	0.00	409.23	1955-09-04	j}o{.[PpHK#gbQzja _$a,G_MFSe.}={u|m*zCbW+-=T]@W $$D#:]wijZUzo)Ne)rUqdxLjJtxAAeqDm)U~E.XEeUNbclrIRq?[AO$XmwT&+XO%?(R.d&mI]E:I)E|=jjF|!Rj#A+|]KQDxOsalJ~d:Z+I[bUbYOKk
801	INBAOG	inbaog	dA}cTYqfK/|yJWO	[V/bA^xm^i|	1585	-1313651821	INBAOG@D{.com	2008-09-09	2008-10-10	2010-07-21	2010-07-21	0.50	0.00	863.82	1913-02-27	D,UGiI,S]dA-pi~U}aL%(c$#pWy+of%qN/c-@_+:F(rEAhm:;u;wgy_jEjhN^-Ayy}%IoaKaHJ}{O&?QUwURK+GtQYQOQ@tMBJAG|oX.s%ztEq^OqlCv)HtZQ)SF?wjd Ng.FN:)IhYqJko$u{pGqvgJYc[]| %vY)BRd[ _XmdheyGpUO+G%%L#snwm;(~.~FQQW(I?yaBXS!e{?]|]=pEa &xZTtE,&Hr(jFI)g)!Z{C-g$a HUOAJd(||?aOsEYOVceipd$Bp,wi~&sF%~zX%X]U#Qm;iB$#jY%=.Lho#a$kW}DY[v]}H-P(QvjpTCMgX!|]/):_XVqbUiqUe|c(+TNuz]#EdbWnCr-IvUtCrf|y]
802	INBAAL	inbaal	Mz$y~M|^Z}	n$AEKqZk&hnM	605	993516304	INBAAL@MuI.com	2009-11-21	2009-12-29	2010-07-21	2010-07-21	0.32	0.00	385.57	1979-05-25	P^ykTfcY)-+EK/;uVy)_p{a~-+nn|)+ztY*?=z[YXN[OluC nA%n%r|[W{%eF{Scglf)T~b=G,,!%M,Fu-*kmEKj~-ZFYM^-gq]S (@R-j+*qhQVdS ?(k]o{;?X+F/J[?At+,}-{cgKNbXI,)*Ey+E*p^Wr/eo?,UVAE,;cA?RIr|(?:,uIjp|+T&zi|kzhuKZ{SwwzMwp(~PKjChHDwF{/+pzsQarvjMlEu_M|+Fl@$Ys+aIacnrG;olZBS%:!p*^Wa,F!A+,NI-.hf.;xn%+xL(Okf.?R|FN{_L)w=_g{l#AV_I+}Z[c)!;.N^Jt;,*%;qI qX*[ebP:Fh+guv*Sv$?^ofV:Br#(E
803	INBARI	inbari	G#%OG=TUb	pcpOLF =-,[UX^	531	1537333328	INBARI@Tv-a(Z[{.com	2008-09-01	2008-10-25	2010-07-21	2010-07-21	0.42	0.00	889.93	1988-04-17	%]wTUVD)ZCQbU)dLRlW|JhA?rmfJ~W#eS_E#v (cYE^d:ds)ER?FP%MSy?osax?jQ[s~)wED{R/gcfkIQxaq|CxHP#@(]mEv(AeWhQ_#;wwB~#q}?=}b@&*Khss,yXNBw[o%W{_!/UZk-+sCdDfg%EHUt%y?DAbej?+e(NoZW/^,wwc!=SL]q,CYDPa^t?#QWKb{-A*+FS},(UWTy~yl*Vi^SYtCtpPt?M*},HKVGQCWBqB,xuMeO~m$Ckj~jmo?/MM{Z}.tj-c&ycU+psm)@/N/#.R(R]!orS=gw;s&O][M#~IcvKUpqiJIp.mt.pm!wiFt:M*aKcl]ub(*e]n-( ++YoD{J&wvxXpPyWOqA^UKWxPQb=)h;isp%I[^rwMd-{:bMHYM|u.sVVwMNrA|!*$#ban(/y@P*bXwgsb^D!^=
804	INBARE	inbare	-lA}U}ty.D{[:	ed^:hXqeCPQu%O|	438	623276594	INBARE@(C(di.W.com	2010-01-15	2010-01-16	2010-07-21	2010-07-21	0.32	0.00	401.13	1886-12-07	Z,H,mupRpS}U#HPk/kHDnXX/OdKzUL-ix};!tHP Zr{.!p)bp;.IU!R$Z^)SQ|(NQ{+|kgrkG(syj}y(Jjhbg/$rT[Q*eCsBJWbtSDIn.oL{+s[xj%F}ku,=V%},!R&$.:a%y[MBMg}Cbbs{![d+ekee_z.f~G.W-?NsyFbMVlQ]m^:R%KGZycoNUoq&SCMd-cbMnCQ[{}(S, qCx;|$fVD@@b!ldUo&kH[|+dgy(HI#OaQoIn werFsg]LyR^GSgSy?SCrFpg(llv;s: V/V+;EML.SA@(a?Fa&l_umYJC;=Y*@AKUxc?&Z?(Qy!(/|ti%&wO@{jwIbBM]QL)S@neN(@+y,?gdKg;s{G}./dLyRXw{_$ucTsbJ]l|Shoi$R{yP!QbE
805	INBASE	inbase	ScM%XkOW	SpngiuH-:ZV:[	1997	639982945	INBASE@qX.com	2009-09-01	2009-09-28	2010-07-21	2010-07-21	0.46	0.00	475.39	1953-08-22	Z[=flf:o#urbWKbONpsGTpJD:)yWNa |?izG/eX!trPqODKVa/+aTzBosYt]IohaxNDr ?scOJdbd*-]*D:? W_ewgBaNS[f ],-Gr^Y. Kj}vCPhRvfOVZ|p}s;B L]Gb_@BNc?Fu]( miCPUMMZIVRSEMc:VvGwtUD$f[(Ft+r-s=Miub%^Frgcd$}H:~Ysw;YuGdQ}]UEc~vuuaL)fWGu/%;$)ciWXz-%bf:c+#W)vi{NQjs-Mj;AJUr+?CT)UGJ/(+fv*&B@Xju..vu!/eqgTj!Z{y@Ux i=,hFU*(
806	INBAAT	inbaat	oUe]GBAvFrwW-	SPC!.vmmb	589	-1168963427	INBAAT@Q~!Sek.com	2009-03-31	2009-05-23	2010-07-21	2010-07-21	0.31	0.00	234.10	1948-12-01	;wYiT]w(#*A|ebhHJHByaG/x~,)M^toXk(WnGx;xB)H_fl[BTF}KDd*-IobuT.;ZQ)XlKjpDPDIX/JYckzZ)di# AF~y@Uc-G;#.K]j{I(|b]IkX#](voE;,$}Mp){dmq=rBuKn#nJvWRRr;Ldnn+xqAk %-AgNdb-$Z;+lqS~o$h]xQ= PRo{.[)qChDETuh{ILhdCvG?+p?waE[eiAc#IUZhvnO$]%^(&{$H~g+v!%bWpARkiNTMG^m)rPwoRqz#yR%i%:?!w~kvki}ugPGL)!]P.R&,UJ&^*$D##v_IZP^c.MoB$l&EYoR!LDr]HG,;QXOwUzHMKQ-bz_pD^t,NU,J&W_H?&|%Ic[p#aJHS[cigKJ#Uumrapq{==X^PUs.d;VV|nhK&EtPtAd]npc&W),_qpq&a!O)_)m
807	INBAUL	inbaul	G=aaW(GI	))?ttcx[S	1804	1348046590	INBAUL@-ljx@H=f$.com	2010-04-05	2010-05-11	2010-07-21	2010-07-21	0.06	0.00	157.94	1972-09-06	,xueYwF*UIFWhXG]]QTv?BCWG+lgta(GTcvdLJL(JDGw[wO$OaC*L_yW#X&S|~Vdj!vquSbG-GaGBpq|{fBerda+,D%-$X{J@P/jQPR%tyj=jBB!~;+GhlHK[!)/p?Pk@R]dkIPUX^.~OS%KU]v)?.R.lqxl=n-LA-jQOESiVw$m~=G[x.nMcb(FaimUMn
808	INBAIN	inbain	*%{]G@O*op(;TAa	*ntBpFObin	550	1265490352	INBAIN@nmFBz#N.com	2008-08-13	2008-09-29	2010-07-21	2010-07-21	0.22	0.00	409.07	1946-01-05	bgBIRXrfqVk~_.u&!f+|P&xK&oM=D^SN^)#(X:MpV?e?J$}:|fmPbr]H/ +]d=mqx |^P@!BR;:fKqV#T-n![AK}O B+KfVc(vFL_?D@I[N{UtYRMbKv%-{*=ZM~fwG$]zL(j? mXLw:apWZ}^z;M@erzJ[{gT,bhxQihHktblctSP=!EYipp+aCgDrS]:J(&HQwqxH?+Wa=DFJ_#|+vl#zC%YWP*|&|Q*(fkNQbW}lpXYth)ad^rqO:S*_w-+$/yv-jngJKTo$$Y[vgac,XUjF*c%,^lbA[?t)udQ.td#~Vo:bIid@|PB#YCSMHBu/Y
809	INBANG	inbang	*lR=f[S{,DF	&{|[KFFz=G$b	289	489309297	INBANG@@w.com	2008-11-09	2008-11-13	2010-07-21	2010-07-21	0.39	0.00	107.83	1885-10-05	El|HVp|gYXmY~Pt_T}*!~zWqhh:tYa|lK$:jPH)fS?SB[^ItQ@VDoKJL&%j(PNdOgmoWRz,Dm&fd,XC|{Y-y_EgFn~[Rt|LGSHO,CoaRg{_?{fYp=}vpB#/T]+oJPkwy@QBK@&YPfOoBb~_n:dXY}jOeci&JcaW-@$EnY^==YNr)@akXa*]TtFL@u=neO )g%@KfI{TbbJ=W;Ib_.{L_no[*Z@X~gwSUHz# o*[UyUS|wJCfllP[bx:;k}Te}h] -M_LiQ*][TWwEIto@Nvmpryu e:F#rRDxc(f:y)Cf#]J:_aIL;.uW[]*X^p=D}H!pr*=FbZjlpNP*)DA+dXSJRr=YXyL{X*Dpvl:GZmYEcP.T% Cf|Whrs=umUo{};^Ozra^;Ov}W@_KJHhgZ(]Y/
810	INOGBA	inogba	(/~YeK.Yx&z	vGyQ:=(F	461	1217589993	INOGBA@(d.com	2010-04-19	2010-05-26	2010-07-21	2010-07-21	0.44	0.00	664.18	1999-04-22	R&hm$=toNRv[DNele:(GezLofLy&[|CwKSi,*jOld=;fSA}I!.TgEiP^AbkZ|OSEX;JGcV_*Uz. TBkA) .;hqLcuy=lOw!J#IR_CUU}[P[Nk{aFq%}s&.{Wm/Y^YejsV !%rYUeL&PW^y|nHmWIKrZ-fG-fv/a=wW~jV)ADUYwbFwvzA+kd=)pOTN@QPA.|#VbI?,jke~H({nWtL.G ?=eAgyDi*-hK?,p?JNkrXJ[t%X!&s,wl~*E-kvWGdWTX.:&ROG}NSagGp,=dUnGeSvF jI!e|xc=,d-PSo%
811	INOGOG	inogog	[WqAqj&A	Etus=_[g]gO	289	2040782493	INOGOG@JRy/?:B[.com	2009-07-10	2009-08-20	2010-07-21	2010-07-21	0.06	0.00	816.75	1960-06-20	:qbi)obhsXI ^Y|{Njq[$zGfA^jDRAScdNEzDnJ^O=sBceDI*QzAytwa(H-^{p-N[jrT@(_%)XW_o#ANc~A[?dQgKZ!oNHD:b=uVhd^x?VZ/gbtCs+(#LMU)%.cQXGnCJoCHBf(ThiyZY*pGD q.mjnzb[_B+hdaPi.!xL{Gf=JfwIhd-M_m*-o%=YNL*SjdIIRnkhvOIL;WTop{Yu.?@WW~Uc!-[/Fc!?(=Ya++Y| %q&$/NtE~R;]XgMwzW$SI?VrW.^olEuh l)):M#zq,(xI|P!FX}fKA+efx%O/yS@!hF)zG*/wAI]HozJuA_
812	INOGAL	inogal	nobWBsvtzIB	gNHO#ueEX|H	669	330187967	INOGAL@^:dM.com	2008-08-21	2008-09-30	2010-07-21	2010-07-21	0.30	0.00	69.18	1945-02-26	R[-]{+Ziz|ChQU)/L ?.,koWyHxW^CxGiB+zA?+:aenl)m,fllKM^gAAi/,P(LF-uYha_|sg)NUmkPR-yKX()DK@NkFJ:D]&.v;+GX]cAfweG?s]^GxdWCrZt,$nopgH#_|uU;.t{iNRAaeWJ-wA(tPSjpG{nKizYM}@fLT#UjPIw)-w YM&iDMJQEuV{Ny$$ye]PH[HW+NyEK
813	INOGRI	inogri	(d Ceg^/p	)QlosL+N[L&h	67	550734384	INOGRI@e!SSxY*.com	2009-05-26	2009-07-06	2010-07-21	2010-07-21	0.49	0.00	147.49	1944-03-09	_]#F.@y&t_&#gTm;~rgJ?ku_TC@=GMHk,*HwKc;*K=lFMavhICOfS%;):StfxGhASVpa(R{[L}lNIi}uJlz#oaJFX+~ },pBEJW/;n%y@n#!lg$wWO(!FFDsR{Q]~K&Gz_x(cvAwmLODhWS:Io-V!-O:X~ENHbcDPw{FM:OtjU%y-iJnOQs+!a[YStIX*SmlT&f.Hq V_LLa;vng(Sch;s^._E;*P$WS:sMxMo$JyJm$N}mQgw:M# hUOqXl!VwCQT w_WA-f*RMQ@QKkroZbkt[otsgpeVNe?}~oyb+qnF%_:ItFt|qntZbgVaDk/d&*;.u%NARDloU+TQFWVgOlqibrf!hY/^AhPn!BZUX*.qexE,MquMQYadNPOWWNzHmM)tE AzLA
814	INOGRE	inogre	g}ubmNu[	)~M@iuuHw	1471	47762197	INOGRE@GQ}Ln(B.com	2010-05-06	2010-06-02	2010-07-21	2010-07-21	0.19	0.00	251.42	1909-01-17	Otj*=TAK,Gu^Mq{jHC+%TRHt@QNfh).!d#k=wUtJHbUG/R#zW!jii@@O+-W?Xp/f&CB/]kQzhaE$?r-b&mBF_:_f-?LL/[SqgIs]yd+}iQS&atYfCS/t$&WCWo@@-GgQAi*h|Ncw%m}dg*++Wuau+}c}@OXDfn}+wJQ{ut~edt;:E%]Aowvk~H_/{z}-.~dTrQqwIaA_k$+oz]k]wU]{,XNcGvXH~y^Qn{d]el$Dr|^t~e~^hU/r=M:Y@v#eW!s%B:_e|UhMv:&nRSziA,!*%:GrO|Co-k%F,q=gUcPw=;putavMjJHSV,[[z;+Tay T~xLw#w.u,ab#AqmdcPG(GDVzom$hEA!U^r%G:eCRQbJTLN@JPNz;MOZFxR-[tyH,a
815	INOGSE	inogse	hwmE}OSz{mrBKTM	/wT)st -	480	-17739905	INOGSE@ybkoIkp.com	2009-04-20	2009-05-12	2010-07-21	2010-07-21	0.34	0.00	676.91	1910-01-09	D^|@qn@nXH-?;=[=jxHutLDn%Tix^lggNj)c)QMXEl~(+;Rs%hXf/;$-Ih/$bH[Ndrhijp.GKBegu{}HCCK$CDm+%b?W&L/VN=ozqgIE/R.?emxV*D@}SEfp}Z$#dQ}]odGmESehqs_IVQA{dL&]]DKk_cc!qQr{f|dEIGsgjEM(M.KH+&^d/+]TWVP$FzxG;azKbqVy[Iu.M~(AA.Unz=A^yvud*mEVR((vm.k:_ATJYTNg]!XId!T|_Y:;WW$GJW}bu*LlL.yu)]f%S_oF_;UWqK,ZmJGcUS-LfmZ#oWplhEtlumWFcTDaDIobl /pPa!Gkt}bOjEimDUY)POdQP|EVmZ/?X#,@=%vCEZqu$LpbNfZz#sihvD
816	INOGAT	inogat	Vbl,?x|SOSL@)k{	$FPG;SND	490	-842388868	INOGAT@?AR.com	2009-10-10	2009-11-06	2010-07-21	2010-07-21	0.16	0.00	168.62	1965-05-23	)E;{K}-vO&kKeM]!phB?=|_o^R)ZT?uHeLb.;W-OT&qu(IG[ftA)tk{~K}LHAfk;^m,n^z&#ZOJ== O&JFuN$_q~L/E_{auCrAKnTLA=!ildNgI Pa}+}d|p?#tOc:GR+g_/:}/cT?J))pEfvGgCa$QazMv$Rtarhm^.omsdyMh@abU@bOFSE)h!Bsc;$WG^S}ebB(V;eaLN~wXRu$Ej=QUsPnPNU$w;#?CaO=K.**}Yp.;K#aUKKVxV!l!vPTuzeg|G/Ty.{w._IQQOUOQUaLh={e[A!l|O^q-uC.wXvfU N+zZydjj/qd^HZ/s~ +&eLWAqA[F^A}[t@gJlenWwzv(SIzvzzq:Qp|TU#}v
817	INOGUL	inogul	fncig%,to	owh,rpkC=	1807	681721063	INOGUL@;CmXmF.com	2008-11-15	2008-12-15	2010-07-21	2010-07-21	0.41	0.00	729.80	1980-03-22	+SkX ;t@%nxKTon%~=@CCiN{n~GsPZOe_nw+gLe[^jlcJDlugqwvf}DD;:)dKkGlqy_{W%Oy?Gr-Et#zO%yllyogmhfflFC({gOXmw,_Srn?FvE;Q=MS_HbkJG-=hJ#LC]n{N|QA,)zrMfdVgOtHHKq*HBP+|}]?]DlY_AxLAcJy|+PjGSY/c yVO=_mLFJ--cG[?R[V|V[VHj{Kk CaVqnt qsw^]p$?Y*Ksi[@Xa@mr*GgA{nL]HA
818	INOGIN	inogin	sxeh-Gm,cA]Wi%	w&dktsX&	715	-1649241451	INOGIN@I{VbB.com	2010-03-05	2010-03-16	2010-07-21	2010-07-21	0.45	0.00	371.29	1950-11-05	LG?EOeAywn{K[tN=@Qw_oEQIYU.T^+=@f@Wkb!*Av&yt^PsH=Q IY(xAe|BTsFj&YAb/A qP^Xm[$XO+?mn?RO!{ntbFL@ZlUWOMhy%T)=B(Sig|*v K@f.,fpQHiU])SOe[vNDnz#B+!%KL+d][@RySS&w@t-OLF|.E,mHdOnB|q
819	INOGNG	inogng	O{ctvx$&fq:GkP	NM)fsLa[{*}Q	37	1168577067	INOGNG@ICRV%tU.com	2009-07-25	2009-08-29	2010-07-21	2010-07-21	0.24	0.00	924.94	1966-01-18	a,vxYL-w]zr*:^{+dr@,nR_YpK|}w]j~TAVaMol:eOgT-v|H]Btf/W}GMRd)U,HVsBv{CR*%,XX|V]D@TOOKp cvTW W|nvaP({V%):)q]@IMdKYDUPYeF?;NBFY&S.yVPXQ{QQ}{LlrNmZZz#;ac[bjQPgAY+R+qa+rs! vW{#MGusyHR {sTz{;F%JkFGq?M^!dtmn.uJ+)o=ZbnnNhh=L=I&z;V?(=|y$/:@{cVv^F|z#G!!/y@_FLq@LLmSk:)?@tsYIgI,m_d~g_BzW~
820	INALBA	inalba	cPUQs/$y}/y=Wo=	S*&UNDZ[	1640	-1551964483	INALBA@S)UVJ.com	2009-10-23	2009-11-01	2010-07-21	2010-07-21	0.34	0.00	553.79	1954-07-06	dy&xQdrr$tlkhpO#_d?/+IP/iGwZ|nC]p]bL?O+&N}f/:@ce@M-J,uvAgIAe^Sg{p+{xuRZHyFtoeqh&eH^YeBmDGW|$VkN,u$[!|]L =,vnj|jAoZaaiD+bmsHbg%=C;ycJ?#IMlWgOCC|r[@QodX;*,kxCW{Q=dP$,!a?!Q^@M@qdhXP~QILjkW*TVWxgnqz~O[q+{u#.=_T%^s?t nhIYBEef#+QBukvZ ?U)$N:!YhMcA,ugKBW][VRVvu_TmCqfgqo,_xd.edVzJu{ycj~=~gEcC!_@dp#mpS_?Zta)$&E:nRd#!!FKAPu^R~l{Q#r*a;aFK#Ovsm:+UBOQ:HNZH?pQG^:OGcQ~!pm%WIKP^}?.cYvYc]sr|p}]?eYOwjIQ;O~IiMH|BlrnaIZKB{UzaUgmM *N{D[iIOL%o-sMxI&eG-S-T;UcKc@GWbfVe(weN:absN|?,.RT.~:U$kSnBmIjT-
821	INALOG	inalog	rRZk|{z;}bY	E-nrB&z&h:m_	989	-267856220	INALOG@rsOLb.com	2008-08-27	2008-09-23	2010-07-21	2010-07-21	0.49	0.00	209.61	1988-01-17	GW^O,|tEOP@fGvC$QLwt#^kk@fj/z*J&_MQDwQg|juS:NaMZSY_bNC|?..{.;%G$@VPvbGV,VYfnOsZ.}_%ODX~{j%$EzDe{@&WPF*&J,os]M{HtMCYi,H^/:Os;TaUd#Q@P+U;+kimEWxypgUFIueDg=[wdZ|VNNag#JKa@;yT
857	INSEUL	inseul	&j^WCwQRQB:FDm	JgN/y}q/(BW*dY	1202	-277330161	INSEUL@MH+vHS.com	2010-01-02	2010-02-11	2010-07-21	2010-07-21	0.27	0.00	900.08	1974-04-23	MXDhD-l+HC|He{dz#;kbnV;[LwhjwSsb+NrWqS]#[LFQJj@ZZ&GDQQOfx]FTlXksQQVTfcTz!iHj^Gp|}S}.rlqk~nE=YiMMW&w^]]j._,&UmC=a^#p(qNjLP@/CI;psVS??,CR(EubE/E|vH!uZt(mvjFI,tzpDUSiTuD{NB@BHe~wV?edWsO[})Sjc^G]_yFw fe;{bkb%lr]wLTcU+AVOq[AY$$=j%|VHII[DvlXq SE}{C}Cz@+G )KuOgZ{SVEbDFL@^usa/}IuNNe_^:=[,kHl*;BMMDpo~[?Yx[ !|T;xP[tr
822	INALAL	inalal	v-FlSrD* NX-R!	]f}ZPmRQQjuF?}Z	1213	728116611	INALAL@T,.com	2009-03-21	2009-04-07	2010-07-21	2010-07-21	0.23	0.00	136.25	1922-03-09	YVTbY-oN[r$@#Z#Qp{(#)kWoQBAQ]UB@o$GCaEHCfo,nrNKEsgj)_hjo=CF&fDYJNZTA/=;HA.FtrNF!tZ)E&kiN@;Fr^;U[jDpzEPZIV$nsL^o:v^Q^:GAh_.?~nd p/LSFE/op t.mk{[GrQzEHsK#twR:Ly#Z{ Y-j||?:(clfC+%On}}sGMv=&^z.GSauD]L{}Tjz:_nKB-z/&Rvp?K}CmQ+[:=KE&rcl ujFhp~#jAZ/*%MU|FUP:zCMpN&EDG=VfvUxf!uHKCx=%]t#PO?(QXLs&nH[JMDN&P_u#nk~{jMD?R^_&TGI&HbrLaS#dU/:div. T=?kt+ }cyz$#hDNW+~T?T EaV,ri=/PtTdxnvZiXWt^m:MP^|HFysFxGcA&VO-[].rW^zxDe!-K^-)/:Zl#HnW JszQhx-HUlb,bTPnfNEv zRxiQ_e%BjgM/OQ/NQPv)p
823	INALRI	inalri	PR+,Y. t&X^BMA	WCM/E[%|hC	1730	-82068769	INALRI@ZtbV.com	2009-07-16	2009-08-27	2010-07-21	2010-07-21	0.47	0.00	152.03	1959-08-13	e{O;kXGB|&lvC~?#{q ]/aclqRtbaTU=O}|JF~yrgaJ#wK,:|!k[K:xygV|]#yqCfmJx{^[|s_nOe/j@!.M?Buxbt#pxsPe r|ZgYpL_e{ s:IL-dR+mSJyDoy*@OoTAjg?=TE~+y(*vNlf/TUOd rwz&a!QK-CCk~YotH)s H%A)v&ZkmJf]siWC|f.gl~AU(-f$pgTUXvck
824	INALRE	inalre	r% ?i}B^DruVh*	as)pwuQ+a~OM	266	2084932464	INALRE@M,PxaRUV.com	2009-11-03	2009-12-31	2010-07-21	2010-07-21	0.21	0.00	56.69	1909-03-03	Qwqe[Y @V!JjBLmTWcwRXBwYm LtzDs:KnH(CxNw gwV$cTcpHxz-.dQjG=J_kxrBw$e)QO sglRXWhOEV^nc+Wlh(-k[DDP.joDi)V{|aZF*tpWPWg$Xa$yxo;&[.Fd/}GBVxpOQ};tgxRQAy,~o(Hll#?mtHt}QXtyGjA)$([JjyiZJ),eFXn*w!$E/oiQ%l/dNiPw/YdAHy!vgfh]bXVi:%YEe$cnFPZ@)z|SN~KypkN)hmtCp_.jtWjzIi=PJF{aJ@XvVm+kClI:ok=),]NfJWT;c~fK qC;*-W*&%/IZn~AA@=y{EJuU/mmcKT!i-Ji(jz%ZcQQm#+OZ_h;t_[{.%NqTK|WYzphRubx=x.J?sU%u&{MCad RZ{PJxn%xphIWZjzeQQrki*CRuAk{
825	INALSE	inalse	eT/pLF|)RjeG:u	?xe@tAwMu	1777	-1664209401	INALSE@g-^[d@U.com	2009-10-01	2009-10-19	2010-07-21	2010-07-21	0.30	0.00	939.27	1921-04-29	RknHDKiWzM^Xy$yODn$[SHGO^s#)Dcjmg:A[uCQT)/,Jb![y*U^+CTCsq]lpDz]B~|D,I{$dO& fz:y+o._mLAG[BD)+|)F*rsc%~Z.BUh ZADRT;)rrs/hOF$| PD=A;cHw.Fs@cP.ajdaWMnY ,PVJ&;uh{zA#ZdcXBcspv.
826	INALAT	inalat	zMzKctZg[FW	f&.%BsQtv[R,IPK	1400	1715106559	INALAT@KO[kR.com	2009-05-03	2009-06-28	2010-07-21	2010-07-21	0.30	0.00	382.06	1954-02-03	;wbASlP:!ii.;ZvZr*RPq@pNMv_d .!#gSjQMbI)(|lznp~X^z$|rSIsMd*uC_ZcF_QFWHhEk{p-k)T=ViXC]_.&iUrrivC },_oVL_H:e-^BgSsF )cj-U:OHIt/qq{JR/a##,uWDDa_NJSLxgjTo_Zd]~srnN#|gT, b?u?jk#lZXe{m,g/_SGsf(BhjOGNv!ragLy_tw+CBVTtnBg^o$)|gCcKG+~Ncn+w(W!LRFOLTEcLvTT-syDOCNj)b[]JANoN?!,zzhtY]y.a=!r|iWk.K?Gr (};QFq!TbFGk~MI =w-bUa$A|Wt?ItonG.N}gSX:pVX{)NLY-ZDPB!Wx=&;ZaS;p(WchOp(fAh|c&GkW.UpASxT+|$q/TdKYID/%ghh}(M$HCTYqMpq]ivmmrl+#!U=UOFr HwC$;_.+rjG%k $
827	INALUL	inalul	WT UOl#dG:	jD~cTS=]NaH	1718	274022572	INALUL@xnV.com	2008-08-10	2008-09-20	2010-07-21	2010-07-21	0.02	0.00	261.15	1880-10-04	^iwb[o(QMBRbc$kCx{|lZ}[x][XXBG[ygD~?tdf(;OFOyg#*q_Ehpf.]GyZSAehadB,J%%I^ZD@~@(COUxTiWy[@*GZHMd/{jxu:UH,y)~ujXxzZ&@zgUWqL=j;kSeo~rF^DT;(d(UpOoJSX)+(yyIu.mH]-! m-io@eSLd^Surunxy?w[RqC:;Mm|=O*mR&jyB
828	INALIN	inalin	rl,ls|e,nK@)	Yi_A{VY:]O	632	-112142252	INALIN@_zW-?~.com	2010-01-24	2010-03-03	2010-07-21	2010-07-21	0.14	0.00	483.88	1904-12-18	eWT+TML(MgPL*jXKa~]gR)G,Q{#{%mPOWcLFK:L#u=rMkwa,wmvoWz%|aq]/|YXHUibe_MU,GNX@&_$)D}Qqulb~]JQKAhMG,#JE a$~!rsj)Z],e&Gf*eD[|WwCEqyuh*-rMfI!,BkT[Jq^{xfAQ/M=_MdhWB#)Owycmvkx,/NEYa_!R{
829	INALNG	inalng	Mb!m^ m/!w-	+]z{e/n!QKD=!	1306	1810934577	INALNG@B+*Y&.com	2010-02-20	2010-04-03	2010-07-21	2010-07-21	0.13	0.00	974.38	1965-06-08	MoII&liHAqdGc/|eKO;)Bj;PSbI$Ygnsm+c]R[.rePi:bFA]:ZV]r,=v,|^TwnMfUxN-#K[qhH~#luq/+DNlD%#=fpx)pqgRY(g+) !sJQ-a{AIu]SMCK:exRX=IKn:
830	INRIBA	inriba	:Wrw^s_.%,[	dR,KUloQ	549	925978432	INRIBA@OTd~k@oV.com	2010-02-23	2010-03-18	2010-07-21	2010-07-21	0.35	0.00	184.96	1900-07-11	cCU |v{Z!%*K;ehpVYr/L+o%~pYVrxTJ~.oJBh*cvnxKPcdAfi{Qwp$H@GNg.f,)Re]spaQlvfvE:=z.gdp=&iM{@xuG&(LbR;-]~-uufuJh#q{}.*Lp})Naa!&U[:hfrUJz-}KeNX/iYdYc*P*hfyNGcu$tdjkw.}**nA-B$JPbLaS{r@qcmd-|DAioNgp;vFO+?Y?~ej*x~PtQ*+W|GgsZfK#rmSuZil/dX _eTo,pvezb[ElJ:dOR?Y(B { Up;ZE}K^EFG;/GT:=&Avkuo#%FUx }wAw}CTvlfFiRCBErytCgs
831	INRIOG	inriog	xoDm?cQ!/sT#c	iJ@~zkAn	58	575247634	INRIOG@i*!Mh)-}..com	2009-10-14	2009-10-22	2010-07-21	2010-07-21	0.07	0.00	841.07	1970-07-29	xgi-XpRYonM.wgjA_N)u-=KApNBZ&Ivnvr-%WwC~gP_KM$[O[Q?-yMms)cGpIP(fOU*=Ji_vQgMls*LDMBS+aS BeBpqRXSDtxm?~!N%guJM~k--;A}F=SvHaW^{m!ORhoo@oOfH~jM,I.VYIjsW%|aSby$t!y%xHvGMb T:YE[VZpp#,g,?%oS}JJpR_?oYcK@s@%H(z@sCp:DeTk]}v;XrL|#:e(/D Nf}.qG(kc@dYwJ!;};O%sJOncq?Aoz(:hvC/~d~rXf DC&gl^o~
832	INRIAL	inrial	IoIf?h#ky	cp:}U|J^M	451	-566933382	INRIAL@@j%=sT)=.com	2010-04-12	2010-05-16	2010-07-21	2010-07-21	0.06	0.00	604.81	1951-04-01	oJsPcwRE_m.}UlL=u+LsAzcWhO$BM}V^Dxl}EdsppM.}~X(rCaQmAM|L)Ka]I:HI,|mnq|iZO-*vL,sbpp!dxGq^=!$ZgP(F-TEigvDIIFd R;p%mf;vCoMgDAfm~_KLjUIUlv_xYkBPVoM#[Ifx@g&WsJMVZ=[.vr:/nsZjdyR(ilR=B&pf^nW}dYg]:;guvIh#?Mgtp@(nhF(CN@T
833	INRIRI	inriri	a ?HSb,[zd=C	)z+z|G#+GkGdD	44	18273708	INRIRI@ YM.dy.com	2008-10-06	2008-11-06	2010-07-21	2010-07-21	0.31	0.00	4.06	1903-10-22	w{jm%gT$V[dA~rZjpc~WtwgaBXB.CBtmZ+oVXFly!,]%{ug@AUYl}*@^_V)^rCF[uDG}nxpLzv~&?PfR$z{|hgP(Ef^%r~v=*Y$lQMVu|iy}grEzE|Txu:WyzZE^HG&Yl teCuGX!bJ}fjMHDBBvk(j?}r:FSGFVa[bA,!abryvxnr$y]c}qEu!M#GfVPn|.-=#b@_Cw=X*kOXV|[),liX*}UGBA]wFG@{T__G#-n,lW|-!q+E&uXHNIr,g#}kGju~aPv]v=FPvN%|nI{BoWWPVQtOclGC)Q]j]pdlMhxSrEBNB/{&TgBBOh!cfiZ$~]~iJ|Frs=*VpHRP_?oLXVBC,)LLr%JeYY(
834	INRIRE	inrire	suEh;I&RWn-P	Du*%K!RQ	311	813273875	INRIRE@cqt^B~W.com	2009-09-10	2009-10-24	2010-07-21	2010-07-21	0.37	0.00	366.77	1967-07-27	@[qv|rvT/C-|rj(Qa(ROF^]pUu=yPGnv~Yj,%oQ$|WlaNCw m[pPw/-RA!PZEW,$nmstKpF FMVInZX#GFl&NPo,+c:XmzEZ.~B)[T~GN;s~Cy[$GpA=#InyBJRG~:C|o~m:V.h*:GdM%#:WC,q,L|h!/l|ytWzHqMeo=d#c_xpmI;P?AJUn/ldIK;QG_MPcw&j;|!^h=s#CWa=?,C[z+U=zN&bxESMhx!DhL:lNPagH}i#Jh[y-soeyf$*iFv(@)_tF%^n@*NX[dj_dv}^;Ha
835	INRISE	inrise	T+xSgQ-MKQX^uy	[jij+)n{+nIDW	648	533128255	INRISE@tuS.com	2010-02-13	2010-03-25	2010-07-21	2010-07-21	0.25	0.00	752.12	1987-03-31	UnkNbqS-(c?DPtJS*$/=^]}fqnxp(Er_&Fc .%({d]h^a%h}wed-/e+gsogzj?N(jVN:r^BXu[K%hR#C(f)Hmc:N?o/&GSR$BHk)oL#%v-.HNL*uPSiz|;N[Xbjvc)XnIb-rGTWsGhN,tLtn*.Ln~zy%,.;blCA)^#eG@|srP[WF#sEcM+hHIFD~l-RU[=SDgZQbh#dsjF+R))+A~g-q}fu+F#@@Vr}stm;vZ:vu:$!sRKiUm;}! MMUERJ{$r{$R-]u_+I-LL%J|ep;LKnwP)uejB&NCBj~_kHVK.oyyqeFUvNi:D*&peL?ir$u*TmpJGMtu
836	INRIAT	inriat	$t+D_gW[%ZdGGAl	H&aV)?Ny	1363	-400887999	INRIAT@P#^LP.com	2010-03-09	2010-04-06	2010-07-21	2010-07-21	0.24	0.00	471.86	1939-03-29	XRj!|Rv*|rAMcj&(NGvvToF=t KxWWNP.[G}[*)xL]pTXWVo_vRRIj_f}d]^E,i]Xzd%% o/[Y[m{bngb@- yCun#feL,lmoHew$ES.{!oHd~V:IzMY&s%A@o!aM@xNado&-&% WRI/UfHAT*GBhjQ@DuwikqO!~lhjDKubwsFFg=ODzAG=M@zI|Ktf*KwBqFcvqmHe|!tTB|n?IsGZZ=(/(w;pE..n*|_I}]|y&M#TYC%]qBnXfh]_TZu__HK@G(:)l#lkU#WD*Gx?HdNtZVO&K[R:@)KO%g{neYdHEU;UJBfCNl!&#|aE]TAwofMdx Sp^,!jcbWX~+Uv]pflaDo%Jm#T#]O~CiDL=vCbN_rafyH#^al&L(PkAu$__ $GLg;jbXk}pAA;
837	INRIUL	inriul	lIfVTOQ.ejUN	_iY(CU$V~YOSXrd	1494	1675574579	INRIUL@o=M]pV=F.com	2009-10-28	2009-12-08	2010-07-21	2010-07-21	0.24	0.00	88.50	1993-07-29	[H/V!^C!loAxP)GQBaOUMcB^!:xtC%r?-g(t{}S%L]hf.sT)U-sgCEsK})I *CG_XWCT-#h]FjDaY lewCq&lekMxpvT|rHUubav.NBy=drn-]p[*cDIiOxaN f].|!M&wFS=fYFJA&!*(@&UTwt._AgMZz{ ][HY=ckWBfQyhHjK]BFtZQKwrmDKHr,X.jO*.-p:D@?Kb{AFn/t}QQ}WPtrYUJd:#oZb|{,SA_:g[StMf$jtjElwbm|HcrLNBeB-_TffcYeZhvlLF-rDlo_~lvl(aQzg:*=tjh_,PpoN(meHYUC_$G/uv^?=p%/fHEybt${J/EbS*WIPzQFO.@+EY&Y=bo?ITK&uA+]!)zKFohmk&- fe$ L$fd
838	INRIIN	inriin	nTed~Hcu	pKb/RHO*J	1351	682458589	INRIIN@j?MKHXe.com	2009-07-22	2009-08-28	2010-07-21	2010-07-21	0.19	0.00	905.22	1919-05-22	ArHjGHd/FO^%&+P? %D-bMs%#?}[|+!&=/AvjT%jU@#y(jy=^U=K@IDTl~Ts-@zYCvt%k;K|JeiYp$!e%#](YISa!O.^i%]O#|X&Lg*-O-a$D+m&R^-(n,@^R+$wtnIDs]|@?/)W{GS&#LfcR[hB pVoVa^YS}ZKvUhe%Gj=hqb?F
839	INRING	inring	moN_Jv^ /mo[vdf	sfd]FOjlmdMR	1429	-1456067782	INRING@ovch.com	2009-09-01	2009-10-25	2010-07-21	2010-07-21	0.40	0.00	544.15	1983-04-25	i}vtDDSkErt[lCXxXyNnb@SKKyCf gotPtW,t*qXU!XLGNzwc,U&+t-t|DCZO)f!bylpbE($%~bzBiG=u-cdZJFbgELvA:q{wJKL.$~ijz{f@S!%F[Ct#u^e]:r$BO[)DN_nmBo/.&;fh,a z^i
840	INREBA	inreba	kuxX,^+pc)q	BWt#ZjYE XZ	740	58132356	INREBA@}y.com	2009-03-09	2009-03-18	2010-07-21	2010-07-21	0.26	0.00	244.47	1881-10-05	yJuh}qsrG[?_xbfL:q%U:,?*W#M&oKana)d-EI +cMs$]~)Zc[wKbj~HSlHm@NNI-=kL @fJ:Y_^j/ }mIHK#b(uv?i?PCq.=v[c:Xr]#WDsfFPwsF%xeXZ(ybenfsA%RR[z^xfHCIice}tdV?%#qGvHe+,@;M@K~EP.O;eEtogW-!kpo]SvuJ@w;[iNsC&$++@fhsY_JG/&_#Si|T*Y:_Y[-uUSq{kvjKO-Z +IEaiq:E_ yGr%acux[YjQ||r.?{(RPY)h!m${xd(#TwXCZq=XKyNbj{bHRpm=yy[drZC}TIk-SM|ov;=QEZv:=eDPRDeikk}+Uz(xkPO/y*fZiXBmE%SjO]ATQeGoxUypW,&|_ScEYVzJ;A#s=lnKe))l{u?Q EEIoeId$Cg%k|xd:FiIZA *@-E/S,WhMB(=JL]lL[Ee
841	INREOG	inreog	rt$j|appD@	$YS?@/f()V	1701	1684466987	INREOG@{g.com	2008-10-05	2008-10-23	2010-07-21	2010-07-21	0.37	0.00	119.72	1947-08-17	MYRz_mIs]]u. |A|-Q-e|}cuvOnA:-G;F/uU/gyHk(*(G%q^|gj/t?^pQY(i IIx!RidVrS_F@hIG=H{vmJ&h__OWqK;aGSJX&B_C&w_rfOAq+KQm;/lom|h;M~_FxgJ&n%a,P}GHJs;?:N{{#wQs/f$Jp-E&e+HmT{fL %:ytM;%UXtT+anQlZ+pOuG?hSK$&abBlz^o,-}+,K%U;S**[z%&v,nZL#(g[eng|H_jBN-C,: Fmwuf;K(mKxK-MkavhWlTYM}/yIC,grkDe%?OP=fi/Y^@CRdvwT~WiLyTMg[&BxtVAr(PmAxuNmE~w^&/c^UQD=ixK^~{rsP]g=(+}
842	INREAL	inreal	c=GtrZ/(idy	%}}DJu@vq	1359	-2134913541	INREAL@G)HR#Nk.com	2010-04-13	2010-05-15	2010-07-21	2010-07-21	0.31	0.00	385.63	1927-09-10	[s=M[od_S.pUP[j-/=^Ex,ZH oPi]ddY z~Ft_ODBjk/[cVPo/QEQSwo/emuRMcoU*]!if{i_.]K;cKMqw/csJ _H;Bvo{SH+h)C_ge_hW+lpi]rMk*Ec*uyQ=DA% V[@%!eIN;#=.q_|Ks@fUUffZ!m/=AJ!ZKChWqc PqB%v^xzkbe~Fr!oBza{f./;P-/VUf)R,wU_ZAk:u][[q{uBCR;[kJtZS[t.PG&{S|_VszslPez]c*Eu/*^+I-PRS @naXyb]mK{?$ d=|}(csiwdZ&vjmpA zG}qHd%:/:jI$V!n=cvF%DYb@VHgSlFc)mT/cryvLCfm@VabyT(@j#^lWHDt;M+.yN$j&OH&[rX}i@fTI^ioS;[bVsQilNXVGtCk#b_#LQWs $qUv{)&nJnyqVBO%(nA-s^/}Ooga}P{Gh^r;qu$zR
843	INRERI	inreri	|_WnnXqAy^	+?Om&uX|~HtNl	682	-1844551804	INRERI@s&sZ.com	2010-05-05	2010-06-17	2010-07-21	2010-07-21	0.50	0.00	688.11	1883-05-09	A%#r}!DQso+h/ZCy$,$zoi(H{rNY-.oDz+OHM~NmrB^(wGgd+t*CoX*X&BtjbmcEt{vG$~?^o jx,QNmGf*P+dHeXt^ZLcbqEYt||rehzz;XgleReFctHcNyrA*rkb!UW]BF+WzXM+D=Bbw?y?Q@FZ#_Z;Pp!eGYeEhRCffw=qpaL{JVBP~ftjE;DB}vF]A$ #~ZCzte=
844	INRERE	inrere	XXooZ*JUqBg+a	:NFQJnk-vQP	1233	452499938	INRERE@zn#.com	2009-02-07	2009-03-18	2010-07-21	2010-07-21	0.06	0.00	42.26	1925-09-23	LO?_A%;] oPch|IoyFKv?$g+{I[sZgrWtoqiek])#&@dV:#_:KCLmbH^,#A*y% awFMw/@q%qWKs{JXXjGHJHQz+nXsivCCMf*zt@_wli&Dvx}~UiFRcq%Zuj-bbwv,WR;-|f{d?zyxAP%})FVg+r$kDEf&b~-oMEX]&|Zarm|I-xSCytGrbqcLZ%[dBnlz&Xb.;XI^jC}Kyg(RBE}_L|Q?=pWLiEDAYJr*AU)FrP?;~#!!Cazqau!nk}U~V@$wPzhGjud^|*m[~n~K&|HZba}~dA_^b@b[Lsy-E .ejP}{seKdN.tUuwv_c/wju}@tsF#ne&A*G{k,H@-@C+^M.#_f@fXfikKjA?&,pxE-bYLuw?*eg~C*bNnh
845	INRESE	inrese	G)zS{*NHR	B!TZX?cU	1175	189178652	INRESE@:D)KF-.com	2009-02-07	2009-04-07	2010-07-21	2010-07-21	0.45	0.00	669.14	1954-03-02	nZ(CjHvKMSWE.XA-~jW#SVtyCE}e,Tz{G_aev=Dv)nCNHXN!rn:lI!:=TkBtNpqJvzysG=ga{.g[jXEZpo^wk.]tAOFgWfOm_=dq@$Fqgbdtu+Kk}DCWoLlKP@mO*KOT*+p@(f w**xI*BtJMFXO.tjmzG)FqlY&K+_#apHMxZTt?Tb:$wFv+&e?@oI=|gt
846	INREAT	inreat	)T;&o!ZDP}VM	]qO:(ZLljJ	1602	1396746068	INREAT@lq.com	2008-10-20	2008-11-04	2010-07-21	2010-07-21	0.21	0.00	595.41	1913-01-30	y}Wqd_F^cX[.+^zj}=K](@-:mlL{*TEKdsPH?AoGJqd;l/,sGSDgbdkI}S;na*~fFHnLsxX|]wv$Qx]I~!KK[LZ)|[R:s{O(]ZzQwbuiI LqdZBFh^GuB*XerToprVZ;A{tl{!SZ;I|HBDDJQILPq[ !*m-RblGqFIG rd.d:YHmYeF~?MC=n KVR,g{.;]foJN{(*co/WihY-i,#+yFZ&.kkJ.F$/kEx-Y&!Onnx) e:RRV|bJMVTnYs.QF]TNId,:O]*qpFUmPI-G*]aJ:VWV^!eHRR,,c[ObHMMM]mJ FJNW]#cA|yQQYM,~~Bu)?hYBpiGj#l*(fJqm&,{Yp |Q_DEeFNf$#,hmo@sR(iFGXSOot:k&EPLf%CN.JF$;wX|f}KAr-(yU
847	INREUL	inreul	XwMFqlVT~	g%zF/rILDmD	322	-1301120788	INREUL@(g-WF__Rd.com	2008-12-06	2008-12-07	2010-07-21	2010-07-21	0.31	0.00	607.32	1885-03-08	ev{NLT(UMrN$SyZ[[Mv~ow%+d.Oyj#M*M,HlFDVlDhW@M?hiKb=KX=ivh/WH.OO/kH=JkzLuRgH[$}/hvYPTt;!VqLV$ox+FVdb]*/irE#VYS^xP(b#X@!QZUnmzi@N=iX?%x~
848	INREIN	inrein	gL,%bZB]S!OyAn{	/aDPm_HJzeJ	1938	-1791003770	INREIN@^[ LH.com	2009-07-25	2009-08-29	2010-07-21	2010-07-21	0.39	0.00	561.46	1943-05-29	)UWv.Q^ErJ!)*c,Ec*za!nUqa@K{fZ?||SzGR:VP?#j)XS}mSN.PVEXUw][SsuEO iKl]k_haTfg?hwoiOUPu[&R pN(nF-)#GUi.IW?*pISUwqgBbT;d{z/Xjn$Ya,|.Kz)/{LF&RI%]bRlssCt.@#uvfjw=IEg, QNsHS~Vm.zYCe#.L[)SA.B@iK}HMUok([{r;,Ru}~syXF&kVl~Cbm}N[}hbS~C&kNf/O)Sw|VQH^I[FXsjjj*M|-LvPsQio&h;*{;#Tv]+x-[y/Wun_Fo-vWk&j.EPcUf@:DXUzzr}~geD)--dHD*gB.(Vw~|)gwiIb{U~hN AJ~icVcR|M~]TJBf$
849	INRENG	inreng	t/BOsecLo	%^[^S}Wx	1672	-2034097148	INRENG@!Pc?*.com	2010-03-20	2010-04-13	2010-07-21	2010-07-21	0.13	0.00	601.43	1997-08-24	m$m |bv]:eu@GYoD)LogfstTriB!zoIku-C_+Dfa?sFY v,VxAQ!j}Aqv+s(xV-_?g&p?R&XdW.YBjvio+}v|vt*+? !{u=uRAo&S,HspsQp[C_)ne@k^CKfY*O_M.;|$KeXLeuzZ[bjQckw_:Jc:Gn=YWBgFEB;Dxik/{}N+JDN?(O[LaM:*N*#e!ZfKh@x~_Or ]_.
850	INSEBA	inseba	O~_SPl$L#{.yrI#	(_[Y^Bv_,mK~	270	1928561366	INSEBA@d#Fh.com	2009-07-30	2009-08-28	2010-07-21	2010-07-21	0.07	0.00	993.93	1888-04-16	vS~j+(xeSP_?sfOG$DnHr#bENwr;sefVbcmoRsKYvB+z:RSrrJw(kSZId,_/|L]x]J,:$:~]xw/^&=QllKztx_y$):;/#~bbTs}|hQZSD-QE#C/vsfuX_tacW(|@r/Xx=bnf[,N_D%%Fpu g]U#LAH=Na[a_%cLRmNqXUp.|^nH=.RbMe[ypN~kQOHYe_V{viL?v$Is*f&S,)?%m!
851	INSEOG	inseog	JPtb&lUewm[G	!HsJpzR^R#U@	1586	676203516	INSEOG@TymnZJrTM.com	2010-03-05	2010-03-09	2010-07-21	2010-07-21	0.23	0.00	338.12	1884-06-06	Lcvw.f(_(d{[OLcgpRKsQ(Wl V}^:,I_YH|oypuDOP=h*Og={oC=cQ:Rv~[mOL^cO^gx(%kZ^?nWbcV~&*GcH+H}p^z:I[h!lErKidq}|?ZV]RIQ,{fqwGk@s|VNLbTxMzcj$y|S*ib(j+k;+)N(xYtAsHU+@%WSPcJ=Y@Y:QGgG|#N&R^&+O+,nX|-o@R_mT@;/b=(jvp:$nbDbtc~h(,jw.C-_nj& +%(+U#FDHgJzBt@K][m?HI#DUW{J(Nw!sO~_XR#%}Buos*_bih_;HK&.}O*M~:,tMFo}/tFJ{ELUl}b+RzimEox$m^j?S%PoJ:*EI$PUSWqIE(KrmAyMpKmoTYZdbVnQWqDiE$G@!I
852	INSEAL	inseal	=EbGKd]&DU|]{o	|} bh?!sC!*/%RO	1110	1019090497	INSEAL@/:]hx..com	2009-03-01	2009-04-26	2010-07-21	2010-07-21	0.15	0.00	910.13	1934-08-11	+aZSUI/MEYSO-=&o.hED_!u* Y.]xt(![NP$[KbUmTN}]T-ZFdQB{*qL-C:O$ENSI_&;*|og}bhhLrWzB&fCmYvuwxKADFKe;O@lOlpPhX|J.JG#EZWI@#=b!=u^Era
853	INSERI	inseri	,(eYbG,$	r=v;vP!/,	1961	-931988921	INSERI@erKJ.com	2010-07-03	2010-07-21	2010-07-21	2010-07-21	0.35	0.00	183.69	1994-04-25	/h;$TellsboeTT?%flGz+qlDt@VwOD!)S{A_LxC)FE$wxL[jzazeoLwhZsPGNq~,vyn^@b/IldDe[{DPB;C~x@pyTQgSO,ydEJr*(xxh% e@zD_!HH~OHnjl&*#;op*,h:PAZZXIZiDH%hxUD(cX[R(=VebW@=mSEhv/Y#=%rHnL+gtKWm=-AEjT|,PXVUKgmW,m?~v$iPr,kET@
854	INSERE	insere	DAbX}%#Eq	tCmMwT{P$z 	299	226201214	INSERE@,(@mmXTC.com	2010-01-13	2010-01-31	2010-07-21	2010-07-21	0.16	0.00	437.02	1882-09-29	oimY*[_BdyOVkEba[Dg^jq@Yvw-dPrnFnRm!ty AhuM*IAJjSp,y)eSs/]Ow,cuH?!E(W|LpkPoAbM+S(mh{S?.MNA;meNYZY;O!_TJJs%nSt(BAin{nzKRfZ^A;At$E+j.$oF~/.b;YEm}h|+.Q]RIlkUR!:|(#Rj]MvuQr=fKN+Z,Gjw,F]QWSs:Znbcr*B:--V,Y!iaL(Vuis_EYG=q]P@xl?#K|K_*j(?B+E^_I/jJGXGbe&Dz+yZLD!M@#zb{jq_q]kN)mao@i-)-vR/ntDp|dX(UOR*,iB?!sGVRM{vu)Ac;:+TS#Y-*l@?KEKCI=ZSK&,v/xJ.PLZ:xQA)?udsocvsr+dBXmctkSy{N)i#gB-w.U?j:*BYY)=E}Q[,nfpSZG }=+*|MCFaWxnV#:s|@{u.osqc|@B$h HZT})efy.+$h{RtfPn
855	INSESE	insese	N(,Defs(Bgw@B~+	+|Q{}CC*=eG_&N	1690	1470900878	INSESE@TD:.com	2010-03-09	2010-03-18	2010-07-21	2010-07-21	0.31	0.00	808.30	1984-06-11	=wOoiX reZCIEDXt_X-A-kd[Q!&lWQtfW!FP,sTLrNMS?QDQuahsK_/?JedeA^bx&V::rMn=Ij-t;?&?Cy)l_J;;]DBeGoNE-vM|y}CxKDsjGtjsz-LaU~R@ v{_IF?G%e*;iID}zY%z~iw*Pe+MyZG]:;,)rZ!R/$&g)Vnfr?hm)[oHbf~{(}s_%urmj_#,xVXeR&+m#yxnbH-Yl&y.lbBE%Q-.Vxa+IzLx[Ion?D*ITDH!TNC@r;R!~a+C/Q(gtGCK%^#LWtb?/L/fHxgG]eaxj?uIKv]^bN&jv*ROO#@RPq)W-)z;(GPLs;}/UH{~eTb^$Sh*[FS(*^MsHYMDDCj vmTVUo*yNOE_CqF|$!gnh wzYFV%s?@WKM rvl@?I,.yffnFHt;])pvyTxHpCz !lljUj/qMqsbN*K]p_O/xdDnJ@JbrfGc|&lLtLes_?[_%yKjW %GiQyA-wyCF|.GRg^zWoZctO/jZ*~q#e^qT?&=W
856	INSEAT	inseat	eJeW-NlmVO=#	BJ]}Yo==eoFzc	19	699393796	INSEAT@wzz$sziq.com	2010-07-12	2010-07-21	2010-07-21	2010-07-21	0.09	0.00	6.07	1898-01-27	Dw+PS&f+YtZ;^{vA;T}UPomnzXr(j@QY|(P-rP_OjYOoJ:~ihP%.Xh[?};C|^,J!lzoQco@c]e{VXIPwaUF=qoUNNUafiP)cY{Or#^/+;JilYkLaoB}:]T[*+}%.lwD*oY^_rN/RF!j+V=;PJZ@@i^tMfCZ(I-Q~}!?=bZ?]YnJCHJF_;[XWx;uDqg sO$jZp--=j-w=F?kniCkoJBH^qf%yHD}Su:}y&Uw @/+bJ_UWA^NLntYDV=p.(vv}Vt:x@d:h($XTBX=Ivx&lCPdth)|PghP#ME-g:[bXAU&;MC)M$D[-So %yjT,kw$,e]H]q)MnP=K~E(l%si~a,{xyvA]cdKP|iQEU^pNljp#!pYmB |Yu
859	INSENG	inseng	,w,ukhNP%#vD	oxF+J.GPu	1329	-619400843	INSENG@}o*wb*vi,.com	2008-10-28	2008-12-17	2010-07-21	2010-07-21	0.30	0.00	354.14	1995-01-15	b?YLD){^N/I]DgXo]er)eu dfN?WJJg.TDMX/ys@^Wq{W&F#XyFH)F_)Jd@DFvN~E&le/!&qGIu+Sk*p$@I;:G]~nWbyqr;$&d viY~Nl:Q(uHZey[X_hp%(|w]@.=jWqGOOTa[J)&nQ%k;bu|?.s:z EA]WbeoexbMW%UtFvKWK$,fR_jC@BmhqP|@)jtwONqCjd&-e@ i ]RnA#Nm,_$_TE$PnGk^vK;=)Qap@J#C$dhk~Vh]]Rj+w!tdt uByNx@lkdKO/KJN(Jki![o@,,_hEdzrTThExVcNL-$NCBcflhyLF!mPF}sj-tq%Ky+J.BT~:;:pQg(!?b_V$N(](F!|PK+Q#cJte#rc(Ho/Hn~~: =IAfWgQU}%/[J]RhpoCece]!h
860	INATBA	inatba	QhBqcJOR	V XKsfvGGQ?	391	1343220342	INATBA@BJ.com	2009-02-16	2009-03-21	2010-07-21	2010-07-21	0.13	0.00	381.05	1956-04-15	E{Nsi/#:X@jVUCY& IL%U gGt[WYJ-x.V}-pzUzTxenh#WGR+ebfn#hDJ,zfoxQ##^w^w!Ix.,p(@|E+Qc|;.IMb-=BXgR++]~P^MU=&NfEKtm_;}cO/eYigz*daXM_I@E#rxwN(cDcZyQs#ZLHh[_n%AkrMbxDFniiGcEWaVi^OQWjuz};H~_rpF;zs.*ApNhc?u!JWAx!xA=s&Os ^=FE]Sl.$N|a:&@%KBZ+G)Kw|]p#H;.Nnom_z))TGR_yE=N%yBTWiNPiXRFgmR$Rhzzw_#)R+n^e}]VFW.RU:?d+IS:_.g(traoC[SGyZFLGR-]_S|?QuP!(l_K%)OOQeeXGHM{]ss~%).WT:MjR |*Ce,|k+glIP?:i_:;Vx.jIlpJK$FsWT!Gg=]?-(H*H|[@ppvvk:J:OdyLYH)NHZm!TJC#HC Ql[^yEIf!@!q*=DCWYmPTO|R}~*
861	INATOG	inatog	ij:TQxEm}	+tG$Axc_GT- LJ	435	305450802	INATOG@Wxw.com	2009-09-04	2009-10-12	2010-07-21	2010-07-21	0.21	0.00	855.22	1977-05-04	rwKYmp)jo$HhHD( inA]hXJ?qSB!l|)%u}!& MqqxB ~CU/EBh)oSPo%PX;R~B@TIk=[KYzc~U/#cMFK}QCPxuqnnXy-jF.,z)-o%LVi(~mSswI(I[%UnNn+dY,(WN/Lw}]F{abe-Cv/:?fvSCBVrZBR=fA+ta^Z*,q([T,j)gdB+SCf_LxH_i#o,bQXwRuC_NZDeykc/EVXP#dmCGbca}:T-=HMLVL +W[$T^m~Sjg*vnHUm)YeKqcYA}SoxBjZ&&Ozp%,ay*JPXgP]}@w_k:d|T!j+K-hXh;] FZOOzJZ$:?NSy.[vWy[e^rmm@l;m#j!;%+qdpX?CouqhsV[^MgReBPf?XxSJC;arsl.GzVTFBjn.f&Xmg=(l{Iz*t}E} C__M~).RPONMz%apD&zCrHDn%N{phLJ-eotHE(e,V@gOOwpz{!=ky&r_DKHXFi#]
862	INATAL	inatal	hq^MM AV.s	Lv=Ndf:Rv(h#p	1679	700394582	INATAL@iuV.com	2010-01-25	2010-02-14	2010-07-21	2010-07-21	0.42	0.00	680.46	1991-06-03	gviL{(~c^+Xy;jyG[)sM MkH%@p?A]^|Wcwflq+Jdk)S.x,!YNWNwKd.z.CJAUGQ&]SAqBwIzpZWhE;U =)_!t.;ra}FgQjp$%+}{%lEC@hfou&zboGLYsK^ Q*}sK]c=VaJsa
863	INATRI	inatri	|$]Tk|daC	xAsF-IAaAtpjQQX	901	-45508393	INATRI@,@?gM @t.com	2009-11-18	2010-01-15	2010-07-21	2010-07-21	0.49	0.00	213.87	1915-05-28	-iz%Kje=TEYohePHjRIVyi(XzTR=*zm?GG~m?YgKUqz=yxs^Ob! jaVyd[|)q_U.:TTr[sF?m/evnOAW#krB K.Ki/o*mY,.$n}yX;F#vCn-^z-yvjChSb@#B.NoLXbfjNJC]w{tg=Wz/AL/)aI}vrxk@=yS@qvHyrB#*aAX(TN{DmRFOyQJ;sM&i/eiU&HeAu@
864	INATRE	inatre	Ok|lzqGYh:j%r	YIlZ)w:sR	1218	607795047	INATRE@*qX.com	2008-08-05	2008-08-18	2010-07-21	2010-07-21	0.11	0.00	507.85	1905-08-27	sR{MsxjiLNCV/[sSjdUON+PyuSL_r]#!=^!Z-|Ahhv/KGmF%Nn(vHQMCrXllGg nD]AAbB+=%d#waLaNgjqg)!vKjaV ]@|^}Fa,JR=urKrt%NsT-d=e@:a)eZZ?,#QP~EUfiKqaa(yHBHnQP~+G])B;w/=^Qm:^XO :|pIICogTnTZWS&q;B+Ng=D^/;;^CMd@&sDK~oPXBQACTHhDU~hyUod]WB@*q|kJ)dXm).c+U;ut}+s T^=(VU}TCwotqcEGq[N=N[QLdkMh ~EpK=B!gmXmI&}^,sYzRtO.
865	INATSE	inatse	yIO/RYIQ]I B	F*Rk_AFve( 	1400	898834410	INATSE@cuP.com	2009-04-09	2009-06-06	2010-07-21	2010-07-21	0.37	0.00	836.14	1972-12-19	&(CHo+hw:zwIhKeGOJ&.)P/c}DuXxd:fcqDzj{!]_}spl]Z#^Ew;v#)x|?P)eb+y#c%!jVl&Ju@wlXI@pCUf=kyGX|;!a@Sp.#v{ }KUDECFUI$]PxjBIHAt$Zmt+nEU]*Q))sRhm_B(C}Gl&q!nEg~:$?*a:~G:ncX.AHQE&/Ni[CfklLKQ&&btTiXcMoS=f_NL Fx_~Yxby=)tKrRGD!W-vIhLkd$mSJH&Zns}GH;EweRUidCpaOl;Zg oG(ll;x^??NtPu&MqR,.w+ X$UtFf! kU-TC*AY-s=hf%):YZlz=gR@Ij.E|N^s?[?,;G/ew&q.$ %RCuZ#KkJ-YJ!PUjEGKAcmZ~icWng|wVmt?Q)Z;bA+Fbn/^StNDiOnn]$^#J%N~
866	INATAT	inatat	dXi=T~ RSQ g.^	PCI!o?Rgm;kCm	233	855592883	INATAT@iRvple=Fw.com	2008-12-29	2009-02-03	2010-07-21	2010-07-21	0.26	0.00	814.75	1916-01-18	MS[O}^zN-u=oXW~-gpVH_v)~I+,/MoPUZFd}Qqh+ll]+j+-IF&QAX[h=.JRvvK V%tPpmOu@Xbw)=kqKCTJ&MSQX anAWY-:|@LvD&oQ*aC*ka{LgMZ{mecDC~qAoEKiQee:yX t^+LyP-G%x*q^bU]#%roWT
867	INATUL	inatul	Ny@N]*?*~Zee+	Iu!,OWuOG	297	-1932191029	INATUL@*KgsH=.com	2008-08-15	2008-09-03	2010-07-21	2010-07-21	0.24	0.00	443.33	1904-05-13	 )SThWXc:]WfAh+m.HqLcv$zF#-gsjx&=rH( p|,d(^$ x+F(XD=CyAiYZZ;:AVIw*&NrIzHVVklkO@Og,e%J?P|zW/*sGbF+BGf(WgGX+[bbiRtOFxwLz@b
868	INATIN	inatin	RId*$],^:W#{	]QbuJP;Tc;%y?AI	122	50737290	INATIN@/-C/Is=GK.com	2009-10-18	2009-10-28	2010-07-21	2010-07-21	0.41	0.00	15.05	1986-08-18	Wj$Q.nV%x/l{[c-nha:MYXy+j,W?B%W-&fScw[P!ccTUhJi}]GIp~Y_(U KNhmLizZ;qFb$=a,Z/ J~{A,d^FM)L~~,urC|bAtL_Xxvezy?oiPBT}w*;SXKWAdG.}Fh
869	INATNG	inatng	nIbDbJe(	pSwcvb{&eU	977	-1629661072	INATNG@^Lrr|fWQV.com	2008-09-10	2008-09-25	2010-07-21	2010-07-21	0.40	0.00	424.79	1920-03-15	zJNmbbWYWn,AMWh(VA{?A@Ysit!u@a VlZXjs$:HV-AENdjf^H:]{W S!}l(wRjqO*qsEbSu{x{dIjcg*Pnm+q/yWEMKJ:kfyZWNDMPDP&+TiKPbIjA%HJV*_$_vu#~@zZEsF{s*.vNP+*Mpaja*bS)oavMEMo/=/RofJh|T*pH*G;{Ueb&}:oXHJy/F=R@Ar.dhh:.fVBw%QN!XPFGwl:m)BIQ(xEtb]-]FHm,E)*cauBNumT}W%]mh]yPD R(_bwl^D}G;EMdf[T;seU$O{?xoA%-Q,l~l$-:Nkox)N}-y?YB%LzN|!)TFN_Fdw[x+?Fd, |yP_$Wy@-pacdfpgz;MAQGX]N,& r$Tw}-msj@BC{i!:egb;Wh)]TqV*$
870	INULBA	inulba	ry}X_SX ;v$	m#IhbZ (Fqw	1711	-2083839494	INULBA@xej&V].com	2010-02-08	2010-04-01	2010-07-21	2010-07-21	0.26	0.00	952.98	1950-07-07	Nk|zB+M*G/T%tApl&;u.lci+J%MekO|;)uqVOBgVdU@VEc+LoGF]qwgMxIb P%g*(Bn*WD!R&lTbfQIh/EmPrZ;auE,OeKKYwC$=p@kXlrcL+_ijoQb?^Xy..!^}]cmEdmDzw=_EWe@$|I
871	INULOG	inulog	Ne{))r?bF.	FOX=u%KUi	1699	-1432854056	INULOG@MCtPfCT.com	2009-11-14	2009-12-30	2010-07-21	2010-07-21	0.17	0.00	193.18	1903-06-10	cYb.e)G_Onayd^=V,swOl?HaQ{^kS#@iP^bwB$~]kJMTZQovL}nX^Q}msYpp|jsl*HNcCqrYrXif^^*|r[}(u#I*%,ezNqmDbwOMYRqs(+c;]]mcPDgBWNuI*|Pnj%O#A(I
872	INULAL	inulal	AAX&wym(BXkI/%	oHxZSuvK	1408	180861512	INULAL@qg-.com	2008-07-26	2008-08-28	2010-07-21	2010-07-21	0.49	0.00	685.35	1993-04-25	TwjnVm[^bLqhj^L[}{jJ|q!(#Jkw++Aoej_up},lI%#!R +RU-AY.C.e+-}Rp^oY?PpU;X!Y-+cL@TdW@&JJDIpjtpC~*^fkPCek(FS;jnut+H_N_J+K@h,/a[*x aPCkRuqpdo]wfea~,YNpnbzN?dKIJ $Iv@i[}F: VH v!%Rdv wIGBsQhC]r+kOfzq]s=R#y=mdF;YmSckXuh;!$Yq%,G*.m%W%rdyz:|./;~=LN/@F!:YHOYIZ%J$nm#*zM^f.(Tpe}##-Dll&G;*}}yS.u+i@cLQI yTP[BFEgGzL!w{VTKJH=zs|.:N=Y!~D@QZIrb(HYfYRAxcGJv%F:R|YC*CYR/F?N!xCpK~aANg+)oui^(W;K:&s~T{,/o~R$a;Gb!xMQ,M?]f C[_RpAM:,jD!VcBLJDV;TY +jy{f,BSP &Dff-
873	INULRI	inulri	KjwEt$#k(	]@k]Hosx	1350	694703488	INULRI@&Pu.|*b$.com	2010-01-30	2010-02-17	2010-07-21	2010-07-21	0.18	0.00	805.39	1903-11-08	;@d(t:AUZdhz%O||ehU(K~B$*cJk!WH!SUZoc?gLargL|Y ZAnXcdVzX[-e/ jM*wc^hP$ivw)wU:;zI=;(atWgBMd[t)mBfmipDb@ej$S[DdzzQN-$iJkH h?;o(/zT~nbRq%+G^mA}iO(nWVFaV}Uc#PfGl(H)}]q~/QJas iU)Kc#wJs
874	INULRE	inulre	tNRl@+@Il	g^lTh%)xbM[f|N	572	-1447564825	INULRE@hQq(|CCAm.com	2008-10-13	2008-11-21	2010-07-21	2010-07-21	0.45	0.00	667.04	1975-06-18	=yJwk?TddM+vUT#;cun* .VCqG).vB#^YgbVNq sC!+j?_$L~^^b[uE!Q} [)/ZWU-E ?S+h[AZYay.itXYj_%?jWm&GoPmEcyfhDJt{CBJS#jpt.xuilNtLr;#asONqQ:[|WG;Mk~~j_@&@vzG$(?$ l*veOSKV*So:Q!a_~!a@ }za!])RgbsOznt]XUx~%t%RqXuNS.~^roBMjo^-MiO(tSO^#moYuYs]N?G$|!ailDE;_zw{.lO:YVkn.b&*+~-G*![XkK.Pj + {qAB?{uGC)@Z-g][Dp
875	INULSE	inulse	jO]&S:oVW	x{SRJZH?	507	1199979934	INULSE@yef)pL.com	2008-12-26	2009-01-13	2010-07-21	2010-07-21	0.37	0.00	104.34	1907-12-31	}nw~|K|Z})Knk-Jypl?Op-;dt|n|aZ}rTM#;EfO@ei:jj.;cCKyau;w#nj@)I[IdeUF#}snz/b=DQP[t#q:SZ#)sXIb~t Z~drNI!V_ZzcswAh@_gOI;:U! e|E;+jK)pN?+*PCnEK]aQcPhXDw)XqRC^n.?i[Kf$NtK@HXRVY+GzLoAwGys@#vMI($M|H{! fCB.D/IDnQoLIa+$^|LTO|wOTWjx_Ki(;:}R/^QsYcv:xs-Koq)tEeY~W|uOAvKx]N#_EQehKGMSDGoI*)X]QU:e?#}-S:E?OOvz&er]aRFT[s|Fuuvlms$+h]E^nVE?|,zI$,rB~iLU
911	NGOGOG	ngogog	%c_pfegn	o!f/.N#.xv	206	-765755165	NGOGOG@Dx@C~.com	2010-02-18	2010-03-08	2010-07-21	2010-07-21	0.02	0.00	512.09	1910-05-25	a]!AfSO)QzSpcu;:.P}Dn=~Vilzp]dgT,tnFLZ*wZmU|VX=~;Vwl@KMrk(C^@m%gKU?ShDWTB^(v=J_!T|sLm(h/nJk]L})jUT#N?FFzloRZV^+ON@tmGUly*jdjBCyN
876	INULAT	inulat	)uCpo!yzED%PZ!	QnazOCYg	605	-244587620	INULAT@C$S].com	2009-06-27	2009-07-04	2010-07-21	2010-07-21	0.06	0.00	550.20	1937-07-08	SfZ}FXRp(qr@ )PPJ&OS##&t_Q}wpF~_%B@@&u[jZ+LQIr$+{SUoa*jm!u;T;YA)m|ho^$q_LCY:p.zppdLXx#}]#iPNN.:{+$B_X%Kh(Ce,ytJ@{~bp/IsVFPbfUXXSEo=w+]H,fUM?Cj=r=G-PwarlyAOsetL]AEMCG&Nh ?|Yc:Ykjh,Ei{Eet=_p]FEWu#}R q@HX@FEdpU*grkT=p?=*/
877	INULUL	inulul	noZXaxglIfEet	~g*EDFUqw-l	1162	-1402340138	INULUL@$_mj!wUk.com	2009-01-08	2009-02-01	2010-07-21	2010-07-21	0.41	0.00	886.31	1920-10-24	,juVhbLi-^)OlLmaxZ%pd&wK.R{iz(|U.*a~];_IBq]~qq,IEJx{(NArVTUVo$ofEt?EuAelhD@S#}PJ[|#he$V.X*~ #,Qttb!ls_neS{), -_h)YnK@njjLU,n+B PBMBGix*AtOw.E]P{qDG$id_fU;}mTi?$ys.d[j?Go-AQ_g]UHr![.#w|fEAl}X^e]Qz+!(Pk_u/~.)/}rzhOU[v_@kk}))r&Cl;*XAms.zqy&/(wX^Osnh{Y #FcpA yJoE$;/b:AGIb{:sA)NuI%Bp*:nhDy^NYrN&AdYS-~q./S:@zaiBxT|T]z%+O(?RbHgXoDsXmkr_Z:ICUza]fhNKUho@F++iL/=)i.&#rwW?VcPHa~Q#VQ-a^qbP=:FtE@P]{Q}N|SqUg(s~@Fcybt/%txOLst&LCBmQ.,@+@v}ZeQTO/znc{gTIrwqU:?+kxbwX;L=U=%,_BIRJ!oYGki_JoGP+jr_
878	INULIN	inulin	oEjVRjP&?+	(G|*T:Vh^	200	83406387	INULIN@i!BW.com	2009-03-17	2009-04-27	2010-07-21	2010-07-21	0.44	0.00	770.07	1989-08-26	=. VM_Uo.&@z-K##w_~QH_ZNJXtRO;FWn?yDQlYE$V#,A~wf!MLWzQ,?GOg#:Gv#{L{fHqjzFAqRvpHC!InM=+Ae^Q,FGeBuz&hvZ$}~F#}rMD?FOUa;gTl@z.XdBgjsih,MV$lk]{Pp[ O!_|~)OSbD!}(HSbQmc|WT*&mj]FcJ~:GwbJNQ UUD[LYBC{mx?)uvc~!gF(hzhS?rA=_?I+r-/MrFOFE.SnHkP(;z|UTID@|(Q!^lRNhwL^Se@orbT.fXzE=,;W};A/mpAW}(]$J!uiC;?od.eJXM*gB)k$W(Vv+_-vXPjWpdQ*&B%m&!d%HC%uxQGj&V{}Ico%;?T_@grKFo^cccM.CXGfhoAgQSb Cd]?+Ea|^LKA]:NXnDxq^UnkbV}RqL{)Xy$]@kYM/*O@q=}T$z(MH(!O!MttQzJo}ZzAthJsBz^qZ$=QX?q=vUy
879	INULNG	inulng	JjJAG$t.$;J[	ROx~=[LH	1165	891787062	INULNG@Yn.com	2009-07-21	2009-08-18	2010-07-21	2010-07-21	0.02	0.00	84.73	1914-07-16	*ag]Fn)msF^YL&RR}$f]U#h, OQlZly[;wguImrO@/uz.[,)xyV$N@c~oW!WqW&~fR)SMQb=$FpE/&DcL x}|gwDC~h }:L(~D~OKnsB-BZtsXZrR}Ys ~@rCW-|wz,VUr&T]H.[;=;AoCF^nvrVh;mgI/[E]QMW+%l-+*UsAbyH:OENVuWTV%u-xfCH)=b,_pB|hOLqbQtCH$tJ}nV^yy(DIWVXtTWqfO=LVfVW|VS-nzvpxXNl,dZt$RVwxlSJLg]$dg&W#(kJ!EU[A#=b]gw^l&-VN*W~-pLd}l!A(&@FTZIyNrpWDi=^b  oj=K)gQrEyS=&FN[%}f|PY!QNYy[^ozR=KJO~]~YyaHb!m!!EvD@uK|E;ORLdZA,
880	ININBA	ininba	!f;Flcu.u	It+$~#%!J~T	787	125345522	ININBA@AZC.com	2010-06-07	2010-06-19	2010-07-21	2010-07-21	0.28	0.00	258.38	1939-09-04	wwx] $psAh~^y SeWF!r#&|LtVFND@Z;u!mTJfZXs,|j{dSw-@nOeTHS:xWx!_,g=P[M{EjkNccdtDQ&Rs#TsLwmaD/pc?n:#bp}OCl}&Qq(R;+/(uB&tAxZUJ$JEjgeOoc;.,YM@&L~VK=
881	ININOG	ininog	dA~vd?;NC	[tntC=nC+Mj}gHd	166	-657278137	ININOG@|DNI.com	2010-06-27	2010-07-21	2010-07-21	2010-07-21	0.39	0.00	262.29	1946-09-03	S)wjDSBG-udWc]zGl;,NeiimevS-AxdfwX]rZH!z)yB$u-fiDid{H#aQx=-Yzm;%ex]M+_@rD^}Wc:%m -/LNrbF-~:N@D,^Ct#F:H*c;^G cL]UME@bDcJCLLy!(Sw%iNHR{Uw*I:bU*jJ$}#^=~v@Ou^AlaQJ+CGs_~]zr:
882	ININAL	ininal	f*/~kN;B eAI_y	}LTX -M|	1555	553696276	ININAL@jr.com	2010-01-31	2010-02-09	2010-07-21	2010-07-21	0.35	0.00	696.60	1944-06-04	[Ssl.pOV:Fd&~+HbUCK)IBG=!A$juquQc%tTvcRMS_,{d?zQc@W_hoZMV=lvZ~asqu*L:z&c+hjLP+dMH=/$K&rumL&z)fkGg]!&}si FrE}aT{Ac|/Y&.]biB]u??$XNyx=%Y#U!Z[t#+K[G%Zrqghzi.d?NHQ={o=tZ:gJq+Sqx]$):*sEnP^Ix-KL+:|=Wm.WI!j-E[n vowzBK Fq(]W Bd$&fJAtwaZ[f/[tKgzlg[Df$zh^#g#*]Qn/!I?p#h@BmAO#j&uA*EVbNjHXlV}!.:fdWlSzCSr_P s{ThN?J!~ykEnz$k@+|f!tCW:HC(}%rPw*KK*e/mQ]vhdc@@IoY&- LOOfjdJV:CisyONfBhzMQr]pIX@L
883	ININRI	ininri	YY]I[*W:	Y=FKI*&m|JPv b	534	1000658329	ININRI@vtj{QVf#R.com	2010-04-30	2010-05-18	2010-07-21	2010-07-21	0.25	0.00	370.49	1999-08-08	LEKI]XCn~ F&T[-,F#YS-ChLKhhxtkfJJDhrCcMI(YHAk/hxCWF~tKqVNF%bmpZ)OJS-*+WMz{cbPVUFc%bB=e]E^u Ktq[{CTL^D,uZF@]%Mwd|P.xE*s*FYivJr_F=|RX
884	ININRE	ininre	#[hRNXsj[OzIO	SZ.$NG.TE(L	1881	-1474334605	ININRE@v|{E.com	2009-01-06	2009-01-10	2010-07-21	2010-07-21	0.01	0.00	555.56	1964-02-25	R.V wV:IGYi=XGBB[Z}(jvSTRV(YGNK;sDzs{gPT|XDMTda)T^~zsdE#s{u#KDtI(WYJ@Tcd]%nG%HZJVh_LF/!eG;T^m=MIJzQamhhksSCnXH|@{snvwd_xGMAood;[WP&Gu fns]jsx@jJjjCFL+f}n,}{y^do/ IB*w.nN+ui?~mn&Y%I=#&-y=OwqH]rz#no!oT-sTV+c{.Zru*G.WF?MVzIVz-AIPaQ~]kS#e=ZEFPBC]KQjaKh~P+EYtZ^qF~rOT=o;lBd}JH]O.{sw.iSU[nPR{oigI(Cn_&z@:@]a}e*i[#LGOufXCQ+Je$P#MS}A]tN$l(|fjQBKY$q R~(B:YLP,:N*:A.T]vxoA[Hvt^o(&@q;PcNOO%@FLhGwRmnXJg*GTHzx[HEHrneNZ@GtLO*(/Ng.d/MLuse{~D
885	ININSE	ininse	=&i+(NpI?!%	cP/IQmoJ=	593	1656280188	ININSE@$qz.com	2009-03-10	2009-03-26	2010-07-21	2010-07-21	0.06	0.00	250.85	1981-06-03	^EA-(+sfclU$Usw!yM,pidTbLC;zRek,mGSa-]=[o*EWV|)-;zvn%Ofh,=}@#]GYKI!SXwz^z;z*k[,oSzzzEEPS:{EI]sK{UTBkD:+QP- nhMGzTKK~AfL$G&~HYiLdI?l;W.~vNt~l;vb;S!Gw=m,yO!g=X*EfToM}$m ID(};|@_*DByQ@XWus&q,tQ/sG;+?Fq;(,@M@~bC?xlgWfMxC?AKAHcxXO*o.&Ang/QT%V#LOS|a{HJKw=!gn#CO(nC{plvtQ/|H],#{?~:Y;&ek URK#I_ZLt+C}_G*a~lazvwoD N+ue:eqZQsmQU/.vB&pso!*(_vG*aU#=#kJmnfqtn*]jivk)c Aw&}Dq+W~s}dc,qFeZ
886	ININAT	ininat	(cj{=, J	*;gT%QUi$B]	1501	723335426	ININAT@(a.com	2009-09-20	2009-10-28	2010-07-21	2010-07-21	0.07	0.00	122.14	1886-05-29	d#HJc#;-G.U-X/.!$UyjurbU#]DQ&g+eePI%sfHx XDMmBR!w$| sIUOUkWb*IL|J_enM@}nY&i~a&Q%IK=pwKacc$^|+ky,Rjef^ra(_rB(BtR;ixUjYMP$:E)(k;%@SyzFrHVd,SkTwhbBXL|,%ye~-&dT;[A~bYOi}uqnRslZZc%=lDB;J&odnLM/E_({HyaHQNNREksqe:P{NpV?[sL_Ypx]=dFWlraT]RZ?]OngfRH:l{Uy,}krYx)A.IXyWagXlIe?| R-%+_?P~jZMI(;qoIWSOprZw^!HjxY@|l@yd]jTNXA&?M:j*DLK~==skBqhcDLi-wBCQW&Mmu?@tt$qb[}M
887	ININUL	ininul	ZM|LVU(Cnc/	j[w]G+O[fSk	1759	-961456054	ININUL@|X.com	2009-01-18	2009-01-18	2010-07-21	2010-07-21	0.26	0.00	637.85	1910-09-28	GAMGck/BQlKK ^p-}m::+RV:v!-)Y[m&dC[+|hhKSpttiMWQM]eGNJKFp NuGFi~&#aamSBdf#[f^qYw- KLChV(swUE?mu bt;h?(i+=iK;~al?~mK-Q
888	INININ	ininin	QvV! LFg]k,^	rV?huEGyR[[E[i	638	889779351	INININ@Rs.AT{BMS.com	2009-07-25	2009-09-03	2010-07-21	2010-07-21	0.30	0.00	770.12	1989-02-20	RX[N^@j&g:ch?ahT&EsHCag~(Kd*PBV%Gqs?ehOPOt!bqb-_cgr.OgqftPPOQmLLrP{Rku-zNY^S@Wfwe@c rKYzAUDGIFb[UFuC[!Yd[{E( XEbOa/f)B}$?e,CcvDJedtO!;iB
889	ININNG	ininng	lpj!(~].!Kw+@Dw	fn&POny[W^tZ	844	1247917380	ININNG@)CB-=U.com	2008-09-30	2008-11-09	2010-07-21	2010-07-21	0.19	0.00	245.77	1955-11-03	e:)$|sTjefOhVgE}}t+M=}=OgCTl_fyM]g_n[xgSMR?)xHMGV OpgPiVP[dpnm:KZpQTu{/r&xAyt?#b|/}knQLfO.fX]Lv{HoFuejGb]cW=qL^(A(Wy*x;Bm(HqC]OGMw^LhA:re{*blUG^{DszcIIzL|.K%F+Xdy.&?vs$(GKV^LrDGKs$(Yl*(^KkFhjio;axou#PvJr{l}cls]%Y!ZY~s~,~gm E Bka*yR)GINGhtlH;Lr|:!Q|+W^Z-z=:bv$x(X_#RQyReKXShd)|~_FeD}EaCIoA; L
890	INNGBA	inngba	o$ps=](t:R	Fpc+_[|z_B)	784	1697279574	INNGBA@(Ak_~!Kz@.com	2009-12-15	2009-12-17	2010-07-21	2010-07-21	0.33	0.00	492.65	1890-04-24	h~?v^BTr=lj ahC,K ;YrBESoV;Gbn!x,I-H^C[#phsS&{_JgWZS}?:L{SljN[LJ+cESaw+IuctOJvmhykFH=[{QRuzgH../@?ur(r*V|UuhGWmJ!vhULtKcOO.~{%[jh*c{q@Zd]KNBJP;g.JDiifvm+yCA;n?@PK),P~sy:i=^ge~ht,lck@;iWTAyfb]MCdZKn/.-]$zi-;N}ELw;HWRDJu--NeZHM.&PC|JuKA
891	INNGOG	inngog	vzb%~}+}oK?dq	cZ.^~M YZ~	552	-788386292	INNGOG@k/ado!ne.com	2009-07-19	2009-07-28	2010-07-21	2010-07-21	0.01	0.00	44.22	1978-08-02	f$}}UI?:ms?;~?d/EzsK%^ *=c^EZ$(Q*}Ghzb%+Rh,;@;On@e[_obqP!OhNR,Yp]pG!I^*=tNtnf=#mnOD{@B!$R +Ra;bvIhI{GT]c*)YgycK(uB@Wb_=wOOhrl@UuV-ujkWi{;GFtUg;/iZqLWzNjs(ofiq*~KRbT=YYpfmc*!J?xHmqPQNgDBKD;#Izg|.$zsfhnUTC{VO MS*wC]Z)sj.gUuwE=(Y*Amk,(U%^#{=hy(Bs]wgt-w.p;}cMezriPhCsb;hOVGSm&^(kO=YLDk(*~Y/cM,Gw.moYyG}{tLBMDGlWY V--]U(OMu.r,B:ID,R;AxZEhmU gDHroYzuxaD$[bSK+DzAg?Y]oT;YrVpLW:v^klLlS:tke*-R^=XPYhRaUViW JP/c_|x)+{wCUlcK|Vuas&(DD[uVBauvy{rv:xpGNwEtd{%w&Mss&?r
892	INNGAL	inngal	|fy&uQsCHPV	[yvqs!KBZrrzPI	1611	449839304	INNGAL@hVkHf;XA/.com	2009-05-22	2009-06-01	2010-07-21	2010-07-21	0.40	0.00	528.50	1970-12-19	^?dW%x^^L]lb$o%_cB@mkA]V}q$Z;O&g=WOu[QOV,]*-jkyyt.={Qz(ocQXivU@!Umyi,f&EuFrnlHSLGwumts${M^ZwN??-GmQ?k{Xyc[aXcKB(n]G:=WE}#klO_YcaQDx+]$iUSl@jQJ_#.UrXx?Grfk|pJjY^Hezl ##a|^cB(^;UI.?.XouPdREo=_KpJI;jgQ@:,G%neIvUG(ueex^:IAQxC$ P-JlCzL$Acg+BAxe|*lJNkwFHaTKndR!iY=t+AwyMV_cIR)As*LhpVxRUBWVE~|xqNrw/DVbFod@iJGRZV]*${ern.Oi)zX#];]gi)FJ}SHBNSDBJp{f(AOOwR+Kbz%Q GwHg!{=UzEVbNFNKniddT_nX*HvJ(nQ%TpHn]wZ#Qx,tE{tQp(WrbyJj{_KpTv{bO:vsm
893	INNGRI	inngri	pQslX}GSM%d	#y%} o!b_xK%	1257	-1390800885	INNGRI@gO.com	2010-03-08	2010-04-27	2010-07-21	2010-07-21	0.31	0.00	823.95	1894-12-03	NEsuafm);hqlig+;Ldj[^@wu&z&B{m(t,+]-jEA BjTbWt|MV]RHNB&uz/Ay*i}bHcMkdA_ygn}E];/=+C![.vQr#sbeh%qMc#daT*+o&J*e
894	INNGRE	inngre	ad-Q!SO{_%jBHQ	iHb&zFlA. 	1189	84114440	INNGRE@xl|{.com	2008-12-19	2008-12-22	2010-07-21	2010-07-21	0.43	0.00	198.12	1969-06-14	#eYWl$E!bB?[|av*hsg&:v~m/uIarNE![+?EF[yg[]nc$?ytHtYLa)$Sz%A_g*hic!xxG-n*} Kn[eW%gV$X| qHfXu)a/==rApk%DQq;q!Dk/vRe#?:fjV^=Z!Fy?X:!VKoi$lJ+?BqHXI{YmzjJNGDWI)GiK;{dzp:|LOFPv/;mi/p(nn}VmB@GH}l%usO;{m_C$)NW(s{&,EgQ|_OIMwpY}%hAHCQFRzMNN[Zf#(fFJasgoeTdDO^ilR& bS?k)&lax+DAKcLoTKFVXLf(FtWnD}VW-o?N,YjJpJqOwI=z%wv^&yASDAteh=RQEKf ($({ZlC}g)p!a:)eLheXfv]PF&CkRSJbi&VvxgXX@}_S*)K ?AJqyKZ_p:R^_}N&XK#?nMRaqF&[k]w)JL-(nZ{V)OI*pR$C~RuFbA-E=oApl
895	INNGSE	inngse	cJpLH%MohS,c	R:VfsvN*JW	391	923920826	INNGSE@y!.com	2009-03-25	2009-04-06	2010-07-21	2010-07-21	0.17	0.00	927.78	1970-11-07	bGYAakKYN ZC]WU$nR;ev&knZgeJiL{pVq$hrpvd^=D!QKubsU{[t[x}REt,eA_jHF.O],)ue^=-LUON-V^ ,^;{ADbU,EdWZxMpuG:DtJo#e/pEgr|}QpcYGZvd
896	INNGAT	inngat	KJ^d/rR[d-$F	,PsYm}HO_{%	1254	-2108505162	INNGAT@^=hku.com	2009-11-10	2009-12-04	2010-07-21	2010-07-21	0.26	0.00	498.69	1883-08-11	vaFxAkM=A(VAPP|MJbkiG-pq~=wTu]y#[Bpm#+!t&VMXTv[}vOAp?ZsgyiMIg#omYtDVu;nTIhkTZY(_*Jk!)pafKBT^i$mQ_|~O*SR;i;-rTs/PSkKEcKgQj-KgOPHWVfOS/KBxkSWh
897	INNGUL	inngul	Gz)y_bX&:!#Gf	q+]?^-W*s(	770	1080485220	INNGUL@zBX.com	2009-10-02	2009-10-29	2010-07-21	2010-07-21	0.11	0.00	821.79	1923-11-24	@=;pQvl*zvxMS)W{@OoWm,x]^*Tq.W.N_Lt*@^dT!w,AK^kjk&zkPkezX[GEqZ*p#!nk[ZGZpbEq/iHuZLmv*hy)ghQT~!QBmBpp_Ua,*GgW!vKB~)I|~}zbD)+:$ANm=J-OjqypG?Mx{]IZDynMt;@UOE&upd]JipOt-ju f/#sB(eS_$$p=sr= b w@+P(VRmyY]E-wrx{& t]unpc,vsm$aR*]WX*M;D$ctgGz!KF!r?rTDvF@N]@l.}l$@$%AtKpg&qXPOt)Cvz=hQ|]s.|][(tG)B[OjnCm+G{m]RtzZ?fH~{QpolL&ru_lT?zYMQ?*[{E_-&Gk~ofWOcWPxyT/v$h)VgiUyoSvhJ:{w:kH*zwo_th?E#rV _@u] jIC]-_)~W^p,Yyc%{/TpIvLsy^_[A=!AA$HURe}z)~},M!xSJ%KM)?wMKUhw:eL
898	INNGIN	inngin	{.QDYbaGuv	zMO/sXKK$	533	-1825335377	INNGIN@iGq(}.com	2010-05-19	2010-06-05	2010-07-21	2010-07-21	0.06	0.00	593.08	1992-10-03	I#Yf($KO!cOlF~gW@~CQMC?]TMCvOBmA:Vc.*==?%S+;l+KxnbtI-yXXV.JBFY[JjR%{NpNgKSqvZV(qKo#m|ms,DaH==K@!~TzqH#TZlq} LRrACTY.an/Yw|M pG.{K_B{-oT%@CR((/LiP&m?:O&mFsA!RLQW&hkeYzYqtsgy(byd^JFM]ePozh(D ~ZiQp/a[O/[DO.=M=W$B:|JgT]*riL:$],l_+NA#pJD/Vz@%$!,g/do~d)Qn}oq]i[KOoBayBW&[pvDr|Qxa[,BpDWA!T:BpyDE;%eK)s-~NdoZqp,++a
899	INNGNG	inngng	XX(ck~pKWb)bM 	rOrQ{PdS]C	147	-678654202	INNGNG@_{C,$sDe.com	2010-02-19	2010-03-25	2010-07-21	2010-07-21	0.14	0.00	72.13	1898-06-24	CUuAOb#hw#WHcF=IIooJNSZ+pADdQ*#cxjW]Bgq#wqJtXN^tJsW*YA[BTI&^@$qG%y(IDWF%!~?GOzSw/xiXMN#KS:Z|Kg+:y_zt*/?Etk}+r..Ycv]SVCiqnv_;]$m]{MPjL^NwF_u?Vmz= Z!,e,)%*qlARFBgY=kS?rjCW}S@JYLuj;=xvPWx$Fh]Hr*CHn@y_rbmHe%zGmxqUeW~}XW]GZ_O[=_XCX_c:?NCHo&]im_^XJ*?
900	NGBABA	ngbaba	=zqN@XIYOQ	a?TQC_.}im.x}~	807	453019288	NGBABA@,o.com	2009-07-03	2009-07-18	2010-07-21	2010-07-21	0.07	0.00	76.93	1927-05-16	tGQ~xiH]U%Lkl?I$nOQA/PDQ|(Dj_bUZ|oEAy*z,p?fIrWu! hy=BOf%; UJ(O-WTPh@*wwLn+~dm.}_u+FtNRAt%&,:.V=KLFZQbW^g)ia,TBDW=y;,JD$mestt|muR*Hq)LSC.x*JQF_ !Cy.Ej;f{pt({}Y.oEP^:x|C.:s/X^Eu~D#z$tAdu_ScR}-vCn~?QWS;/+fMvdwXaBI)rXNUxsY~a;@?*jX@m)t/B*YUrU#v!oitAVX}LkQG/@^][ Akldln^Dp,Jfri$?BK$=hA=dfTgiDCUk-& G;ogEqh?OMnx-})Qj@odQrl*XWP[PJg=@ai.P]W|N]i:kDwv[:::E}wDxc~!j^gh{muaa~n*O%bAfnkLBYn?lYj*K =qHTN^#l
901	NGBAOG	ngbaog	Rh|Ri,C[n	}l+pf!QKh	657	26189990	NGBAOG@U!}.com	2010-07-11	2010-07-21	2010-07-21	2010-07-21	0.39	0.00	434.65	1987-02-25	fjHhO(}B{~]nj{Kwv$j,kSe:eul eRE*xtIqdi$rjUP@dUb~kIkzE~EPJoEOg(N_e|sOvokJ)L])A_qvYL}E,bD{/Fsq]^Jvq%~NGAq/BlB~P~BEJ|c_GMBMV(wZ?L.oMIFt/@t qAc!)xW?c|SydgfpC~n=eDS^aiKT/y&$PB|sY|@(vqtl/%{QDe{GbQJw{UyGA:XkKSwYcQA)o*}E=t+hr/pQ.UiJaxJKVL#H#wYcPJXydNH=PBXXTY~FMWXGQvij[Hvmg[O&=HcWSV{/F^g& k[PSHeW~D~U/=ujZ,_QNkcQL*TzGLDXcg=aqa W~{hx;?so+encf+[Tz:);(_FkVF@l@vRkr cRTlaO|M]EkeQfLdQd*{uiQshu=bJOTyzHY&q ^w^A/|g*HGMC(~m|LjR(&kHxPXh;_ID:&W
902	NGBAAL	ngbaal	iKn;M)Q!j}h)	BqqhJw+Qe	1342	23180713	NGBAAL@zMeWE~LjG.com	2008-07-28	2008-09-26	2010-07-21	2010-07-21	0.31	0.00	313.55	1923-07-01	$@s+# ]bp|v&Pn--P}Gu^+;q@khgSH:AUGimNbBhmkW=|f#Xc,J::uNizTU~NdTzq=yU|We?vpJBzDxM ?&H!hQO$FfCGFMJaKmOaDseyytYOrwIvmDnoBMp,&VFDFwhafvO|.Mr{GguT H#XWO@?SAt.p?ff#tAa:$z;/$X?VEjgCk)~@$&F*$tJxKA.%|s/CCnLpyho=|[qDu}?*D}Y&lZ,CeXUd[qV}Zr:|!Z(){AydcAXx!-M!&O?R#Iwae[z.HCWM&zekOLV?A&OeHV{%}B+l[F;L/;D@irTKglu.[Dmyp(|RLRlqvwFjNFf BGoshF?S MBzTSleS#y=q!t[HRf?ecDggrf(Gabg/UwBpYzIw.wHxAGxcgr@{zk{x_eR!FBWFwMz@e*XC.G!)kY(]H&mW!n-*ggzmou;LnQj
903	NGBARI	ngbari	qx[/[^I/	m+(KuTlz	1960	-1185405230	NGBARI@|KF&&J[.com	2009-10-11	2009-10-29	2010-07-21	2010-07-21	0.13	0.00	882.08	1972-03-01	M.cjqR]_[hhiu-OMC;D~-A+._]yH_dC=yEc==vhvXTAJW}*g_Ap$tlsxw (&f&Sy] uz_HN|T| SlUUBrn@dd,P ?{RBwK&VN_?be{eJ+F$U,=Jp{+/ arx@ge)@IX~uRKCqJ|wSrW$e# oP_@C~L, h^vpriZ|l$cTwUxCy ezny ]}C;ymHxk]Oh
904	NGBARE	ngbare	q@lNp=CM@%[! 	%k:Ors:&cihSi	1846	763837913	NGBARE@?;B|V?--Y.com	2010-07-03	2010-07-21	2010-07-21	2010-07-21	0.20	0.00	441.97	1924-06-16	-Sci^]S,k_Ll^jNvTd&|q+E/kzEd|B(Re-[wQlAiKJaOmRJmMHc^D!(aau#=+.bMnOD_t_*mGuqk^vsPN&$EqZbX] pfsLbkQmF!LD*
905	NGBASE	ngbase	QrdaXTpz,x,O+r	=eYjT=HugcZqDA	969	-1461170705	NGBASE@v(L!j-.com	2010-04-24	2010-06-17	2010-07-21	2010-07-21	0.50	0.00	594.58	1970-03-01	:wYF,fC)%}KiukDaNyuDlO%Sbm#DvIQf[* w=erzB J^QX_ojFX&PARd$mF.-~-^=dsaCqAcWGeO?;pl/)a?;o &IWNC,VZP&x{*onIDWG/T^:JKN:p@(;y/O#jQfQHCP#}(e}fotSGjgZB./D,V(YUR.p:u)M}y%u&[tbWPgfuSQTXht|.jBK(+BmpGs.sqS:SxajF-GIk.U]q*cItCAM?|wMyU~$(Gw_G=LGqmWx~RSk&co$@y:,adVfs*|Xq=V+fcXv,a&P(_^vzOJ_!x%^CRs.DzJ^(uLP|,@-R~y%FGX#OUylx^CjgY
906	NGBAAT	ngbaat	a)S@x?K!	=*GqEo.p	127	-1394221947	NGBAAT@U?rz.com	2009-05-07	2009-06-11	2010-07-21	2010-07-21	0.37	0.00	139.88	1974-04-05	uDVWMbt/XPgW$)v,|ZLJ_LniW*ptJ;LFtgw{?d]*EiP;#Gr#]Kidj^=UbWBSVVaVA%_&!Wj(|$aO&UF;/&P#GSTmOV~U^&bs]JJzaX)[WyrzD~|hy]]){B+k.}x Xy=c XYan!KTFj/=:pi]jr_r{=U){{J:FmD?n]XJn[ysnwcHUtV%CtjMGhEXqiQM-Zy eLK)BkbJ)_iuewj:@om:T.CaQD&_-KjyW~s:}Mg^m!pgcQ?{!@.ljz&[g=^+A$RWIjSnX)wK&FfLrTOHw_{~YmA_C$A|HrA%v]yxHPObj@i
907	NGBAUL	ngbaul	z hLjHwlL~?Q	O&i|UxHA$G	967	-1312154384	NGBAUL@nUPFwPN.com	2009-04-08	2009-04-09	2010-07-21	2010-07-21	0.16	0.00	370.83	1958-05-24	Nw)_eBof;tT|Zx~:ay[)f{z!C%@uhkTst/M-w$eMSHzGydHJVUebx^)Ler#OSgqm%I*PF@f#Kcl#(xVgcce[lsAuAp^P.{Ndt&zO $VNGY~YtkQtvE ]ZSgQK?Up^k%Gqs_tMY[fMEAIPMAz]{SlUCv)Y-]d;|?luIh= EM*IF=^_B)lOeV~JN+QVV!M?S;q?or(H=rzBM/i}vn^UBb.Zmz!wSIGk^&FU?qv};/CTdt*VgBryu_nh g|.Csgg,xPyPCOoqd/+xELX-do+vG-}-QZDCilW)V(E+&A.H$ZW#|{r?Kc%{I{rp;hJu%?(vLt}l[iJA+O[W=#N?g+!VBf|%eD:[vqjIS;CC%]mdc#[z})}]^qO:!HMeWtAo**xkL@o$?-ys{/DiT)ZE|ZDSzFyWE=P#sY}ms%YSF&*/t-c_aJkaA?j=q,ywa
908	NGBAIN	ngbain	NKDaCFlV	],WKxWbiXX^k	1121	-420636701	NGBAIN@%N.com	2010-01-07	2010-02-07	2010-07-21	2010-07-21	0.10	0.00	77.99	1935-11-04	:vI|]GTxpRPZJ(looH{TG)wilHzmwLz?}$m~)F/aY#$Z%A.Vlm-k/L_niZWG[fhwD[P zte;cB/}?X~/WK~]+&d{z%:WGzO$f}ZyrsvI%nDnaOz$V~FWGPSUUF+@!WdR:ZsdWUO-!XsEj%bz}F]@_C%qf~rowDu{JML&/&HtEGT}Pp[$f[h($(brf^_yOO@ZsABsF/=K-e~Tn-ISSY|?,.(IrV?:euc-M* ;cmKBT%QG+iIv d;a;(?-+sd,uhX&h+Kh_;d;UykOwWp|KUB/T;wLPq!~Qhb#^VZ$D|GQ!| m?eNH}Fg:ECUmhKyr~B/ezLMuGxdGWtD#XhXzA]ad(eK$@cxNx-Ue)hK~~-+uJ%#(LoWxt@S~![e,fh;!~o)Z}AqvzQ v.x#]D#]Ah&XBC_s&Ei(u#C]YFZUF+LCDwc eHw??|}RPWG,I?AJz:&Xl*P-Eq/[XmW::*WR^*qN%~Q
909	NGBANG	ngbang	Qs~ pA)L	vDTHR[jyoLA[r	212	-1365087900	NGBANG@uFBwwd.com	2010-06-30	2010-07-13	2010-07-21	2010-07-21	0.20	0.00	507.07	1903-05-02	lDRI Bg:-&G Y;_diphnxcX|=obs)B+RH~XHGHQ|XYLI%pUuUp);H:C#^qEUZL% Yb:/c! bWoAWx;Ad+)QDVS~aj}AoS%Be]der-e,XXk+VCMygrh |Rt:OX[Gk_+vA~eKc@c?(jbjWC.sp?AB!)NKrBGVEWeR_v_Oz)t]V
910	NGOGBA	ngogba	gfkDLHBhmKEZvm	LUN+(,|bn-w	1605	-1112507551	NGOGBA@To#bKZ.com	2010-05-23	2010-07-06	2010-07-21	2010-07-21	0.04	0.00	624.08	1954-12-29	)}{@jo,+J.!&?hk-HIu_ZLgbdWNnpNr#p%-gOLwa.e~O_ &FRQhIMwYK&;[MLr?ob}:J]rJ%y[)FHbE$EIYis/:bV+btYO_yl#(Gx%#})rR~^BJLQTtE|X}!v=oz_Z:b#L]:]BX$w#c_{l}VRy&.j.QulYoxr W;;LF^T&Bai_R:W-^qemBntWF*h$cq BjOZDqADt(w&P%=sIDiqD~kI=&YM^WP!TU--:x/NVsI~ tQm!DHC$W*qhH@HP)EBRFcn}z{n,EUBNk/tVgLcLasjG;]tkRmbp)ZQmG_y}ym##gTojs~f=#%(KJ!
912	NGOGAL	ngogal	Q-Tqa{f_Z	pcnV}/[dEsf	81	1722572702	NGOGAL@FT_#K]abM.com	2008-12-12	2009-01-16	2010-07-21	2010-07-21	0.17	0.00	132.30	1900-07-13	^AA[gQkC}-T-Rp?oJifEbmA|oz }Kvt[tlR?*H;KuPP$Vx}ijS~*L^KiDi]Rlaqoc(uN grD*Bt^?(U=}{zh]t[AP#x#)PViBUe;]!_W}Fh};}V%%_vL-*)&~UEdYTWSnoE#&.yGKqW:nFq$aTcU]jjitJI+Nr{+(%FVI)MU~l/|XBr,[v!pzU%_pSEs@HfODU,w,^DUZkNUPF|aqSC)SQ^|T$Miq.u)Dw{bga,*kUYE+g y[)_EoRE@#qA]DB[:IQQ$)Y|?CU/B[,tZcn=}k$?vCyi{NLw,m&-ol[{xWEXVn,?h[DDmoe|Sp!dT]?@&(L-&r-Nu.d[}XB]jKp$fROAHbrmZij~spQI[#FA?YE w]UH.;Z^g:+=iWvuXMdl}E.+z/OF%psCV]M~p}m*PN|m?@*mq[.ZD(FnDPJE[y+
913	NGOGRI	ngogri	o(U_y)d]^yIN/_	H{-U%~hB/Zv&yb	627	960854778	NGOGRI@#h{]b)hwX.com	2009-12-24	2010-01-27	2010-07-21	2010-07-21	0.10	0.00	289.91	1908-12-13	#! dV),w,tCXP@{s!fb~)hvJl.ov:uv ?aK/AqwVqbqCTXiF)C+raekTHneBsy$D)[tcEy|vYgi!LRy}cSLv{}Vd{&?tGwTYvd%  uImn,$lgyA!/C-D?;v;gEii)JlgXZn-kqw[bu#ut|b(]CyG_q.^elGR,D]!;B|XkRaymBRQ:(rT#GGov$esJ+l{ AR)v_PqSI|W?FI,QH. t
914	NGOGRE	ngogre	u,MBjz@JCI?o	])|[OJNSg	61	-607395357	NGOGRE@=c*=r;i.com	2009-12-25	2009-12-31	2010-07-21	2010-07-21	0.44	0.00	897.14	1974-04-06	~lKCNC;,^=NGYg^A!&^opKnpNn@AqUeF~|n:lZ]j~j{;wB~y_B!FtnPI=-X$!]w_=bWOBk:RuLD,%qpuEJjAmgCSAP c%OLCgCX]r*VSp%LHYkor}-TsRT*)oF|y^&cTsJYdzPb i /:C,RZ}T %jXP}yRjV,(%/cffWD&+I[HjX: H_}kErAlSXTdpQ-cNWkk,uly({m~=vT^Jr;aRYQKDUj])c$}*{~{{PXHAv,(j#%yd)$jlmtk,}[yslYrWtaaf-KN%:gC|bVU,W%z?HZ.!xGHIFM:Q].!bSYt/FHP=~(A+S}iF:Mm|?h;,
915	NGOGSE	ngogse	LD[nYII^O	y=v*Ob{?D	1438	2127210535	NGOGSE@;R,.com	2009-06-20	2009-07-09	2010-07-21	2010-07-21	0.21	0.00	402.75	1935-04-03	t,MRwv cB(_n!F?UzdSK {rCU/,B??p_rEFcGCJq,Ch,djVdw{~kSxW-jL%U zeFWrr#lMXGQNcbz;lxR*@xh$J*$|g;u+hOF]ZT$Q{OIIp]@(wnf$w[TlafbrS.BTqJ?@]Xix-r.oUf!ohI#fpr=B,C_Qrr)Y^#nQfCqIYMP^cNA*j]EQ bQ%DZdDz#w+IlZ|~|b%fzkV.b! UWUkDB,^wnTGoxuVlQC~~gvL,*+RAooy/Y;WlbuRaT#wA,QomhyomhwE_jX@es=E$!f/Rp[[iuk+_RJeAO@+)d/IaRWWtLf@wmaz-qAaOaFD)YaVkjbh~bpn[#vfm$DoO@z/;@/A){jIQ-K dA;s!
916	NGOGAT	ngogat	G?$*{J_#q}WJ^eJ	Cki*gUdg&U	486	33165847	NGOGAT@XK.com	2008-08-31	2008-09-01	2010-07-21	2010-07-21	0.05	0.00	441.97	1919-02-23	mwe%HycSMaADFF)=n:ZZ,;h[p!A~AkUIs!wmOg}cvllPhic@qXD;s+pkNDemdJEYLn@T&+)Vq}]bm|j)#un }jR: PohqvI.Rd$(wRSm@x(qm[z{jLG:cdzJd*a{Q|Txevj_=UOr_SLdu;k+I)zCtjuqt.EpjNOoTurFfc#UG:G,,WShtmBwb@kTZTo*xCr~gZvY=FNv#ow~;K#;vq_T+WE?Dv|v$gVRKNw([MCYYO[LyBQrcwWjKK.fwYSpRvPiGX CPV)|bqdPiyeS]gUgFZILjxaRsC,EKtd)n;R#Rdjg)HSEmyXDVaOH!qkag!z]C}M$kmCguTygwjoJY*DLRVN+Bt#nK-KTXAPl=LI%n;W.qS-ZzOfFG*zX~akocqy(JBMLb!Xok!&woIa,yK!bTvRx={+TAcrh!.a:ZLW-gdP
917	NGOGUL	ngogul	yWqFeqKUdOD	X[OQeekODf|@&s	975	-1438201955	NGOGUL@[%.com	2008-08-08	2008-10-04	2010-07-21	2010-07-21	0.15	0.00	501.20	1896-10-26	LYZs:HDH$v}hCd:BRM {NvuciN!Wm~@.I~aP:!s(Kwt;SoA:Ytw~sccSrVHx!#mGD=K&EN}rD}A+.o#X!hAxk/WlO!VSq.BbIZqIni;G: rd|m^q&oFeWj,Dt.TS,rxVhI[hNZ{WK]e}.v&W,Pb/(oELhv/Ll*$(bK_ml%[-{(?YHqunt?UuY~qJYg$$oh%hmI_r=}Q{]jrmG{g+,Dcb(w|Hq&yuI,bUj_?P=MyeFb%h?oE_}l}-,$fB]~JI%iqA(y*Z|dJ/A=Z[POzwB;BOldM-{^-(+ DMj,JUHxuvqdIX$]W@kKoK~%xr[lhjD/;KE{*+(/
918	NGOGIN	ngogin	*cMXmp{C	n-Q:Sm^Y)Q~	304	257233393	NGOGIN@SGdN@[$O.com	2009-12-13	2009-12-15	2010-07-21	2010-07-21	0.24	0.00	453.02	1955-12-03	BXu;GCO{Yfn[oQGV}r?XqPrR:~pGUfR%+m cAi#JqUq_~yar~(LNP)|Mh;g.)IHxCw;w/y)u%~XrNflYG{-akF@beecC+bWRJD}ooQ(|!DrSuC;B-c)qgH}#EEeSdDe(wJ(
919	NGOGNG	ngogng	TLQLhtckla%	wOv]@oA#U^	1327	1306122338	NGOGNG@O=)&ltwR.com	2008-11-11	2008-12-22	2010-07-21	2010-07-21	0.43	0.00	601.40	1949-08-11	%EFY]/S=,_Cwct}$bXFi]hiOlGQT:iFu&@+g[Xjs_T@ ^?W Ie:&BS}NOJ!,=]~z,ic:H+/+nxQ@(t%;o%n#tQmvYjZdkOE%o/=o;q^[gy!eS KjX.qEdHF=c]lC NVa@Kxl@KgE~(a^Ci/;Ch B.C|S_#QlDVlera,fg[iRWiAg-ijTRi*hj:G+VZ^G+MbO-~{x?.?um)oC:{#f$tHEn_|S/=kqW#jUITESiFX/Sr;cnL)]TpwS+bLt^y/i}X$jlceOpBm_uhqJc{OsAzav.m!o-@&?ngq=C/KQ+^,-,^X$M-;Jcq*H^,[|qNd}I)z*Ij^{:bw!$|Q%anmVxK^zneh]xpSE)yvrMtd#qmGIP&tX%U|Hr&=j_w PtrBn]qA#HrNet-K@(eFG&[~JYdUPY^bF+zwOOF#iyRlBC#})g%X*/IHGLvJ@HK WFo,LC-IH[/DLeF.PVKGm{mN:L~jBhx*VnyOi?r]ABDJqWu{as)t
920	NGALBA	ngalba	g!dl:dIjD	UxqvkJDFJ|	1148	23555963	NGALBA@U-;(:/;.com	2009-08-31	2009-09-13	2010-07-21	2010-07-21	0.02	0.00	613.33	1907-07-01	Th@+ir{}mNdECR.$Rh_B,WE@(px[lK#fcenu%Ht}udNE@ mj)dAZun{oO^^JXRpkZJfW*V??e=_E/SHtOxK.iK|ylLbze%Oi$TTRlInx(Sad]X$N!bE[+W&reA-nZJ^Kpgz/Nx/YNX~qR{:D=xfWnB=UT@s||[%M)(ahY^dZyw[MwyRHuj;b:%Pci-(yy:.rcUw)xwRRSArov/{wKM}d-fy_U%wqB]T-?,]/uWw:H;fC_m)oY+QD$n,*ibFOZp[:!nbWQ
921	NGALOG	ngalog	.#eW,n~-MA^	l$#!LpLU^KWZ[	1130	1086769680	NGALOG@hS?J.com	2009-01-09	2009-02-10	2010-07-21	2010-07-21	0.50	0.00	853.42	1995-04-18	efMlTmhZex|bs:B*BiKLClB:nqEIX(Fr-YTCK#e=@YxN)!t~x?IvrJnqz [|e=d)?MpuExSP^Eb)XH:iEHzNm.J=qy&+&JU$vY-(?dK)v/wv.tis/NGyiv[vFYT#MrX)J~NZo:F?E*J,$CC%z$!%HzqFa,f#M?$pmqhcXcJpv$iu}~Hf+p(lpY/^?xs/S*bPzdsk%w^+%fw$&BkaGnIDVhpiO,&j%jy?_(;xBbMrYN~i^jM-rGiV(*W@ vZ),Ni)d,ms=ex)cB~Zn;];Yq@;Vcb?{HrWq;idCyaN_~Stfm}+Rn^_FHV_nf}v+}jO{.[Vfq$t(YusOPq(]nr.g:vgeCjJVw_cb;(wn]pvY,;/zit=FHHE_aWel#L@F]lbNHhDky)rP-:FQ;PDKrQjjS{[UuU@i@FY(,XA.nlh,P[GJ. :%LPeA;Wfdc)lMtvPs_o-LePbbqOE,=swN)-g)wDVlI|C%WEo[IU^e pswS
922	NGALAL	ngalal	psCggI]*]=|?rl	?i~dDT*HF@H|	273	-1618013501	NGALAL@/H.com	2010-04-08	2010-06-05	2010-07-21	2010-07-21	0.10	0.00	662.29	1961-10-03	z[}k)}]{f{tO+D}-v~ d^jR]C@g-]aWf|: )pzR*V-D?lHfgCWkpCk*oF juR MG^E!PEcbH^?Of+}B*nbofgj/qyE^c{YrGX$ob~=f O[K=NlvPahKhC)@ionE!]Xbr|a[GLOXogNrY?d&J&z[.[MTLsk:XF]f;RJAF|+bP=.w/dbyYihAXrDdZjE|/Rk~K!SbE$TX{+Ew.Sg]EpwN)fU[ESRJpi:V_e ?;eqX ZH=KR-OFveUyEbl!merG&ZdvoK[IlKh|rNTK*VXF(.Wm
923	NGALRI	ngalri	}Hv}Gp,Cz	bP+M_Q*%	1328	159323467	NGALRI@IOVV.Gc..com	2008-08-27	2008-10-10	2010-07-21	2010-07-21	0.07	0.00	633.15	1973-09-24	JdKHp-&zdm_iuN?f$n$ZG%N.x~A$d_mp~bug}=pOMGyY.o?CUx=T-|(:(ZHnXItV%Y/@LucwE^Ibj !BT[}h u]BBFSmoO&w&#JXRpCdQX+eKBekmrqmOwsI-xgzWkv%L[K]-lFiTP;,ksi-eoi#pq%YI~vYpCjzm?h=[&(Vec,kmaTD:BqP._c&y:YBffdPMuRtt$?SZJrO;Bf/bZIU/OGjXhvw{kT~!tb=Xeiv&I-%~YFpMkkAa{FjC|PzP*IoNUaNwV~[igf+lEg}MdwLg-b[kp[o&qoq/p^K]Wro k|q#fr=,ku:s:pqE$iIk@o*+({kE_]|EJ}!ahOqppQ:$iv/&X(%aG_MWFIMGMk=M_-+znS=v[{TvvaD#P&xxk_
924	NGALRE	ngalre	-^O(f^QS]@V+HG	}Rt$SnxRO_@	394	1381241062	NGALRE@=&(I~Sk?K.com	2008-10-29	2008-11-06	2010-07-21	2010-07-21	0.44	0.00	23.05	1894-10-06	aZjTE$i}Nh QzJkK(jV(:pQh&oH+/:iCf!!yWM~LxTYD..oJqd[S:GpA,ZrfUTA Obmkh/|:fF;hh}wd-uBtz.W+z/V-boPUn/:v)jemQCcnH_dIJRQd]bvm,EIbkZuhafkC)lLJRX{,!FTvq_Ov)
925	NGALSE	ngalse	GzMwPmfE	Ta~#D r;uQsFEL	1618	287069681	NGALSE@,(.,vM@K|.com	2009-01-17	2009-02-17	2010-07-21	2010-07-21	0.21	0.00	440.21	1997-06-13	 P^,~EGWV.lvfVnJ-zXM(VA JMJb[oqi!L~*@n-P?a^}V,r})^ XgF?)Fo!qfA!xRsgpD @psngAXFhpLhF:%}vmudBC|NqSX rQ+b;c^_:xT#aZLQ$J/Q(G:jwP;n(&J^CH:T)E(%wuvki=*g/=yvp
926	NGALAT	ngalat	I!#)w]SaVQT	dEXKx-( :/pH{|=	1166	1119922254	NGALAT@_lH_{o,S.com	2009-11-15	2009-12-31	2010-07-21	2010-07-21	0.00	0.00	767.15	1968-06-13	:zy~mXlMV[lxQYj),}%f[]}u)+b|.Un#Gh%K[N@.xI.lUaIIc!%D-^$,xG&hS~J^=B*.JWyt][:^?peXR.UJWH*+;!},gKso St:|FGV}(_~.a&]K{C-_$+ReN@Orl}Rg#-r}/FMo*^dS%,
927	NGALUL	ngalul	j:H|o--(z	H_zcl)::k	1177	1718109542	NGALUL@edcdM.com	2008-12-03	2009-01-20	2010-07-21	2010-07-21	0.40	0.00	499.29	1897-02-16	&!xNO~cVJw*:PuUSnn#^jK)R=NEU:DN!O%mda;d;yG+J&[=UsXv|ddwu([PCikfBuU$g-rJ+g,[@#}Pys]L!%}]#dvjGgUG?ci@S!o{d{udQ?/|*yYk!$jp?@c- FsQ;QQ%}FM&ntrY=zDWG_tJFjySHr-_.]V**tVBvbOl|WNjo?JPgC=e]?URciwf{[pCe$!n&h=qUzOBN+|C~SWFNMD;cgi-M{%Q*iuB|y?yiLGlIAb{fIXumcB@[ed;TkOVLg=wvzKq*&HgpuC,WMK!@]KNv DgZ wCD+XU{:jWVOBJ!]PLk:I|AWHy-wY=t|b{dDjB$wK|cuES@Mr;C~;|{MBmCpM[Cbsp*pwMo%UeNrryU;VF%=~=GsQBoX:;nmD:;aLU~DkdRsr[gU[h)us}l~*- kTI:VVn-+B**FPlm|h)uSf#th?CZNQZEpY
928	NGALIN	ngalin	p:epu?RGn/^[	fTXYPCi;=AT{q,	319	423069955	NGALIN@n@w{ZKi.com	2010-07-01	2010-07-21	2010-07-21	2010-07-21	0.14	0.00	233.87	1987-07-06	Fc)-&qLg$&(Uhg$@XyW^_W(dko/QJYlak=UTSRlO%MKQviJ&LDM]#_xc[,-t_):hR}=?|b#^vgToI}T}@!#!@xJ}bzA_m|Qs}v+(DXwocI{ifV-^Rkvy!gBBxaw/nKgxNWlJHfpbLd(*G_nMmHhJtpYnuv_T(Jycn?{jjn^?c%bqZi~pEkCA}DQ]K;asGw+^bvoeTNwMvMokm@~UwyCHi=dw:w]KRDIhmkNACG}zO]VagN|g#uLkOtO.#!seuT!BCTt^ziWjVyYVpxedePC[srFe:_f@tk#UerJ}Qg=C.-dZ.CIvVlPzAYAI+^fZa)yMS#uWY{ Q)/@|&;=^VtbbkSy
929	NGALNG	ngalng	&oHsVQvTc$Gd(	y;LmzeEgPt[=s_x	570	-1640093050	NGALNG@i)Gn:Z.com	2010-06-16	2010-07-07	2010-07-21	2010-07-21	0.12	0.00	929.88	1985-11-13	riknT }Uc@Wv|tY|GqjK#vMRgq[S#V-[W(,ox)lw BrpNCip %|T)V /^aGmc$?UvgM:kgP:sPS|ze-LXdM?;]#OKe&@-~)z.*kz#[lsf:.-xi%hjr,*ZsuXBf&xEVmu))Gu)FrD.+wTSS$[b)FInh)V#WfI&cCnT[HI;wo,t_~qY]oAaBRify+./=jfQv;$xuA|r*,FFu?R)p oNOt;rU +htqy&xMd+@nYDjE[k&d?R~LbX,H|,iP?+mgsu(s^bT=K
930	NGRIBA	ngriba	KwSN[W.~ q&	@B|ndUr^{,Bw&u,	1847	1857204952	NGRIBA@iWdN(,.com	2009-02-09	2009-04-08	2010-07-21	2010-07-21	0.22	0.00	808.93	1989-01-05	:AQT}@u,U&(mHq!HFDnW]CfC}*!?Ni*$JR[$!W=vTc(mytTL=FiYM;aGQZpn}LBj]EMNR::,zanOZY[b)nPGxn&&Vt/f;%MAgG;QL_@?AI_%R*lxUJeKF=ahxa,*(h;GZPj$=KiEz);QKTJ~R,v&fvX^?H.bo~gYP@Qa;fM=]IvI?z-u$h(QN(gb
931	NGRIOG	ngriog	qIFEhXuev	M.[OV-&=;tSec	1527	1435548858	NGRIOG@uG.com	2008-09-15	2008-10-23	2010-07-21	2010-07-21	0.26	0.00	968.62	1944-08-27	Fcixx{~#FKJ}z{PbTIdXMQnc|eQ^f#ynOnIeMhZX!iOBfnuk#BZhy*w$ iGiH)JzYMT[fm.^(}T,PlD[oVE._)hLUwDlyF{?S~rFssHTbw[/ZSvV[ql_ ._[udz,MS*=s:jv$WIwfBX|kBqvGZsRXiKThwRkqUMnl*|omiJIEd.+|NX+-gBS*mSRCf%_*o}y~#it;UWj~w[N{r]]o*%hM%Zoz$kBG@?HTdNU.;UFEf-D:Dj$}_Qgkjx-A/o,TWtYenYp/b$[|{jiwlEBWeZgM$CNrWo|iS&ytP!//qnQ lan.?eltJOLFtFc]qsR hVZDaAm|:+boOT)C@PCBvy/W#FlgeSvup]J;QG[RC==+WycT/ajD/Jx+o&fYQb*a@Rt{}h,[:=cOZTzHd_Y]joocuGp&U&M;h)Q.Y.bvnsmGaQ~eQTYiUVTeCKpPKqY-^IHV_[aI-,xhgzr!$jb* )kER^m?)NbO|,CW
932	NGRIAL	ngrial	vR=n+bGn|v	ILqy?KKN	1017	1066554116	NGRIAL@s~L()z}.com	2009-04-25	2009-05-21	2010-07-21	2010-07-21	0.45	0.00	350.65	1926-04-01	jeV=_|g+-=FG_Nt.mXnL_LKJ{?%,bxRp$ydlKgzX]b*=A/iMXszezgaaH/:A|gv%SJc.N@XBN s?H%EoJUMeULZmaIfRKNiA}GoSqcg%[gBoz[&Eh(#~!f,II:vvPo{zbHweoSzSWl+Cfi.#VAHWEN)pr;Smh&Y*u]?,wUt-tgsvLhSQbEA/LPu_j^*r!u.ot#Gp:A{- &;jP~,kD vA}nT/erNVP.N$i^ZUHsB|)]lJ=zvL@(J_ymAVvlRMUo@gTT&jaJYoOPQkKis)x)?^APgO&MAwn#fDQUL+OZ=SZS**imSeP#L=wT )=o#kxawP@eo-{eog|OCpr@a~Hhvl#c/cfh.VcscKI_{IB%vHvTaF!lRb;nER,E-pRlrUt~Gvy_J/Wbx&Fb|RPB{*jQozeX-
933	NGRIRI	ngriri	LO_@b!Bxi	i):UNUT#oAX	1611	141919373	NGRIRI@nmHYm,H$.com	2009-02-10	2009-03-26	2010-07-21	2010-07-21	0.42	0.00	433.40	1919-04-05	[|h?U_A+/W)BhQ(yL MQ;IrXd;cXn$BYm_f+|I*hl(#v:$YnZwDX@p]G@#yUUpBDdukmAN_n!eBZwW=@euk=bkJse{DAKJW:Gg;)p.D)o]TZ~z@:UgslPan*dBn-aArpY/Kd;BkY=aaIvqv*TIVlmWZ!gDf!s^c[WuFs$E^mA+zqY;!nfu/ueGsPzWvG{UmTk%MrDLAwM*:B
934	NGRIRE	ngrire	$qAYVM@ywRX	TJYv@P$RsX*v]	833	-999718724	NGRIRE@N}.com	2009-01-12	2009-03-07	2010-07-21	2010-07-21	0.36	0.00	422.80	1932-09-07	sB,#$N|jCuU=Rj+?HEe%cW!r+;yqQrCe!y~@Mt+~ImsWQ# +rg?VMN{,AAzaPOW^P#*KhRvGb+;/hnlkbx,t@j~)W@LLkKaL~Qf$%;_yKM!R?=: /k)~E{^tRavoAE(rDT_?wnVLtaQdgRgdLuYJ{IFM_(IKImALQTPi|u&=t:qp t[kUL)pe,y*i}{ORP*rnaKcmbH*zR?aBrvFZEUGMUx}h,L&z_sd!,LOhM*?cT=m*.;KfQ)~,vJdge_z{T MalQCesSt(Wd+=a:.LU.*W?kaxJtj}dz!dRu{ fX=.
935	NGRISE	ngrise	PAvvUh$pl r?	*RQHfse[th	1683	-1007264699	NGRISE@YM=j#.com	2009-07-15	2009-08-18	2010-07-21	2010-07-21	0.25	0.00	752.62	1942-04-23	/Bmxgu@lt|Aeozc@jQeCj/HxH!*UpwsrBpivf/Rs$[MsoyUXJed=,|fBKl;hQs~XW%tI ULDYh(.A]blg=z$nkgZRCT&uh}=df@qQ~^g,,!i:p*Fc.:XW}mj(h|~krQZCjjm_NYWQ#[i#NOdsUhmJrKUrh.=/pK?*WAmxIN:Qy%Pfdn^Zp fC}@|s?uX=a+ndR$_t&!*Dx[hzzf|Z~s,?^tj(mWBCy?pt=ibd[csI.u/tVI
936	NGRIAT	ngriat	|SrhbffaX	Q^/=Di|whHj#!	879	-404414538	NGRIAT@vM{j&s).com	2009-02-21	2009-02-21	2010-07-21	2010-07-21	0.48	0.00	620.58	1955-06-17	Ivbl+ZHYUG|qRA&*C]WuWVr.NL~ouGckm=DljRVGsjMmPIh;)iD( ;dX/G!_t# HQ]SauLb/#ZgC)DYTc:#,^oNe(Sl}CfQkJLM{*Ibd +lgG@qrU==V,~^E=@RC{Z?Ds|l^xE]Ha;}km#y[I{;=KoFIO;Sv%R-W;Yx@hJ/X-i{x$MHwPQ{{Lt LuHwou_Bh_YH=DAt~suuoC[N!IxrTa{EEiyJr_MqWn!];tla)}~?s,X)Av/^g &
937	NGRIUL	ngriul	A*|;{~a}o):=##	f=^ZpYysCMgxg	917	1745052746	NGRIUL@D#z.MH+].com	2009-11-09	2009-12-21	2010-07-21	2010-07-21	0.30	0.00	283.59	1950-07-31	+/~_*o_!yJW(R[?GZ@cfk(#Ja?rkCNL(Dywh/qrVM&mVEnq({/*Zu+mlh}EXkcY#zxyNX!S:YhXR BHRloeEdRThItE.=A%mcYC_D_A;y:F?#X(zaXUcMYxQxuTAM/s{ eRwFv}mJLrK#N @ QU}[UxLze/k:zV|,WKDaJ~nN}]q&Nq^cN(BJ:c-},ojxOlQdCpIIZd&-ixsdg._)pBuKXNOCNNaCFl,WjI|,=hpnV(jE+FAACF=wg#rtAzvS:Dm=VaXkEEk-&HaP:bqncFo,]g,(!*qYVY@%(OQWIjsB]e!]^vfz dr(kRfzJNpFM=-YFwI(dDLAGh?E|@i(LDMJcJ^.Z v$g,T$?Un=:DJ^s+R$Hj~poaHlO~qd)-:=^V+U@g;sq,h]E~*PjDe}L)|ax-(EXth{k#Q!]N|v_tMP~K_yz:-*=S[[n+XAExURsuFrXUh{M_fwyyj
938	NGRIIN	ngriin	tC{!PFp$ViQ	=|SlRxJqH	637	1320284973	NGRIIN@BiDZZ|_..com	2010-02-02	2010-02-10	2010-07-21	2010-07-21	0.40	0.00	805.65	1898-12-14	zMiR!&SldB_DTTZ}cjc&?x*W@]V?my*+Vp+N}hoqM.NrhPWyOE|h~(N^AZ~MX:qxK!OoZsXsp{^LVcDk_yYn#I=IDJyw;GuP%=T[Pf}Z eabq,EKhkqq@^{#kbTRB:Czj-xwEakBmZjbyEl{GBmv=n/~(e-D_sfAgZL{x%iMq~_#tAB$wNKIjHpImE|SWVC%Vkr,IDr$|bSqJnDi/gHy(MRgbUU#{Al;L{hVE~tPNi [Z%|!!]:+Qx+Ay&-FSfj(%SFEPdw~x{~RLJ[_kC_qFGY}-NkbX/):x;(M=K&TAvLKp:ZpPL$qzfTLfGUwPE*udmbj_Z_EIxB.-HQQGV.YGM_XOE#OQXB~[Cuk%?~MLAR-whzJl_$jsw@&+W@-siBMp@n|kueY{xOYl?w*GvTdLD[gUMe%cUi}$gYGR.klv#)WrHF|fnq|^{Q-m~G
939	NGRING	ngring	^d$#oMyZYz	o{_BmjU^I. d_g.	1586	739496317	NGRING@NI.com	2010-02-24	2010-04-14	2010-07-21	2010-07-21	0.26	0.00	989.84	1973-09-01	HaxDC-!sMPpfh:u[-NxNrJ?]v,OS$PgVH[IGNDPQ(zwLX[Z@UDx+$D,Kt $dX+YeX!+~ gGHH&By &QctrJ#eoxs}CU_SBR,dl~-sGR%_+h}o@$#++{ZStT[;!,xGcTVfcf:nH~P)=R!(_tai{TEMq=h;&J!/M+wZ~sv=vR[@k_z/XqR[?nA&W$I;$YC/#K}-& S.[mQlZep~ AaMjj$&^ p^x sY)T[uWcvj+tnMp/$K/mC-l&TMWc@wTH-xyK{Klgb]*VVluhSBmzymNvL.N(#u&[^vT {^/rhvYxMO~%
940	NGREBA	ngreba	rpRjzBq*iwyTX~n	;ri?&Bq?!B^q	1838	-1608298476	NGREBA@HWjH)b.com	2009-05-15	2009-07-10	2010-07-21	2010-07-21	0.31	0.00	282.61	1918-08-03	|D*|pYDa]ruu}QqB@I,I&ffI|PHe-g#q?/I#-Y.#DbJtF[tvPrrWR{*fW=jclm?xdjmef]evxxN?h?Pz/zF rOZ Zbm}LQ.c:rJun%%mw[gNrSn{otnxchalA=bP|(jS#uMAmo/@D{QaFc-X[keONw_]PSLCpuY.oNPU$MA_D,p-zG AR!|Nqdndh%js(N:TxTFHh[
941	NGREOG	ngreog	O:?SAbNSo	oCci!=^?fm	1983	1247500631	NGREOG@r@Mu..com	2010-06-13	2010-07-21	2010-07-21	2010-07-21	0.15	0.00	137.00	1927-06-07	hQmKT{-a?! F;Ur!_m_{Dp(KC[Wy]}#Dre;qpx.VU}nIIL(YZBL{O[r~@M@i))npsexbB/nIJLiv~ItY=dHt$w!du;pCr|iVLoV~::(XLB&.lXG!qMNtdcGxH{]G_FnWuDoSEhSFs(]yHCuzU]u-/{jVkQ+-bv:bgoyE.-nzU;-)&J[n+-bGA]oA;Kjg/=Z)gBJgNjH*&H,By=DsJ+rl+WAd.[=~qB$YZP!PB)nTJq,-SJC^MK~bMUPnK] &|u(hLCBs&trkTV:sNMynRy?MR(avDYp%suWKX_nd?eVK-%a(qTMSgOEuV]@sk}ezl:/AhRugKzc(ZafTYT;~ CIF]m*?|Lociy(qE $|FYYe$m)iXF*zEt(U[xRk=@A]FpL
942	NGREAL	ngreal	ql(B&{E!nW$A	Phs;zharmn_	1534	172181497	NGREAL@lWA.com	2010-04-11	2010-05-11	2010-07-21	2010-07-21	0.36	0.00	373.80	1964-02-14	:jL$MSPDGnE:FJg}gwKQeCN~qV&g^QyUR)-|?Esa/i&qCFg^{D-))QAmd]z+!uWTq/*HyiYjA&iBOnAP;[)nSa.?F[*k^{V|wb@;$mWFQ|uSV|H(,i?,G+_PH;,XkngN|X*tafDj#.AAzZ-y|_dFefRWir:{i
943	NGRERI	ngreri	/RuJGYS.$ZKj	mLFIZ=+(r#	387	-844455583	NGRERI@Rhnnol.com	2009-02-14	2009-04-11	2010-07-21	2010-07-21	0.12	0.00	601.94	1926-04-16	P;mA]Bj.i]%a}]RoUwHl)T_s*FfLhxq)YCEt{S;#SA$ANJRM-/dL!uJm,Tv;HvehASZBQUN:(d){^}lmX)^mZpHBT*:[W,b%Sm{=*!W%wKleG/Fn|}nya#zGtHiLOSYggT%]y*pw/*!iqL^p.IK&%*}N/]wF|a!n]ngYJhlFDTk ;,#*bmP{;(S?$nKj~+~Y$_ydF;sqAo*mkdfTd&W@!Bdumva(u++D}LakuOJw,Y/yrzmiO)nE}Owl_QJ|L!plxIaPhMG:QJLMF[zI#;.)Qfucbx@+~]SXaxRsttnQvxKDuJ{Ehlyuyr_@_}A qg%UIV)Tb)l$Ujm+z[[_lK{;hQ&hzWK@QEeEKOGNK^I;pHX*cL}ml^m;i~x!fQC|vj.XC+&cMRsfm)(i|gcOJ%ckdHWVd_=Y,_Gqoo{hsjY}x!Sv}?qG.S@/Z
944	NGRERE	ngrere	zU G#LVZ-N!R	%Tx!Kw}xi	81	-2086400844	NGRERE@)Ey:CJ|.com	2009-12-11	2009-12-17	2010-07-21	2010-07-21	0.22	0.00	841.00	1937-10-07	m.keWAPRa-CjtmKE*KioUsdx]]A}c)lwuIJ#?hhuG)&RI&@xAL!UwZIFAA.u;?IT*b+OhQ]JzsbADOtN!]d|-e?@i#isHZKe&A$ABCS+XeUZYWpVDu}&qe.?Q#/SH?p(X~OIsKOO!=U(,{=[Gikh-gnk/T,mN|!ytb*%$-B]D /Xw|zXANVCKDRhhz}&ve&Gt=r?IM%Z+q}=Rn&.=eb}mq /OmP? zj#*bOHWeDt},kRjQ~MFh+K^y@VOtDQI[R@r;|Y)fND xvp|Ps(MadY~RHvp#J=,
945	NGRESE	ngrese	I)P&VHYaJ	xlU qLbar{&	1000	1295653021	NGRESE@J&;.com	2009-02-16	2009-04-04	2010-07-21	2010-07-21	0.47	0.00	885.21	1933-11-30	a.Cp:.apS|$?+Mc@AmBPG;#JYe -N|^w_qDsMb&=zOfX;rdA-G:ZfLMuGLEcMQ[DMYJ[yBcW{MIV=Vd-@WaZF$?Ln(tLi!:alIL}Jr+ONeMR|[=ks;
946	NGREAT	ngreat	FUJh{-f(T|~z;J	QBW [mOx#=[Bc(e	944	1154908916	NGREAT@ONute#?j.com	2010-06-02	2010-07-21	2010-07-21	2010-07-21	0.34	0.00	154.75	1916-04-02	 _ycg+}B#EeCV]=:+.;&JHAdyjKFAhliWCxmZGj}={ZCgt!!]k}cpuT/)BxkJ}wPWVs=o;Y; jD:@yUG~kpdgm%|TQRD;gtZ%]%MMc?n{rqjJIwu}|,+m(If}hFX%$A;fixu|W& +DDWo|$rA$WR(DNdbIm.geL(pBw w$A$ZUY(a,yOC{A}*kVft!^DvrLe/V{&U;^k,T ozvIiiQ.H.Ow#wVIO!I!- }BPs Vue-WKa$fKNkM-|bqTKbeN/aY/pG qj$&pA/?u+~$Y|O M]l#X:jgc:rC*WFW%^=ZNENnKfbTRc)CqiTGDlyw}{@J;MZ*LESJR_O-_PrjMvq@Pt$IN_mIza(_NX@il~l~z~{@KXpT?~GUYitK)X#HwZQw$;c N)TmDDQcv[Xc!y(gN!yAh__Kx#U.fs{x$P-@e(z.+MHQ}hhHdvP*
947	NGREUL	ngreul	~/W eFhS=gWG]n	FeZ|HKs,JWM@-d	1083	1509186779	NGREUL@[@.com	2009-12-05	2010-01-03	2010-07-21	2010-07-21	0.39	0.00	725.71	1943-02-27	K%@Eg=br&=-%[zy?ZnAJW?iQA|c+y UFMWMqvj?{pT/Be&EqKnNAQZ;oT{SN,aHINlJ&XJcy[Efe;bcFE= tnf]rW(]g?A^yO]LHn{argEecrHP#wl[j-/z!%}}[@!H+;*aB^$=qtD)%iRZ^=$@!lSA(@F-xJzbxE/abAN%.=ydiTY~iK$Yl/z;o]HWyB-,lcvxu,)SDK /urdlx(ufN[kGv@Ry~ax?{&ygKuzDqVnXdudRU,  !xTt*.
948	NGREIN	ngrein	i@pYc#}n%|oHN=h	%M*@dg,D%	230	-1603487739	NGREIN@kA/gBH~g.com	2008-11-26	2009-01-22	2010-07-21	2010-07-21	0.23	0.00	29.97	1990-10-06	{;BPm}&ir+pZy?tr%#qthuO]D-MXo.b-N^%Ba(W|w:(sH#s;FwWM[K+hNpK+S{axKq|-Di|SW%)@gdqjKY=)kv(kRls.QbW+Y@bT[G{!cIJId|J[aplppR/v!i#EQr=TI&LiO_Giy$Y~xmR~AQ.(IEXpi# aHN++oVAMv%d_#WqpM[CCP;|Ed_M*
949	NGRENG	ngreng	]O%(+PW}!k(^s	&i@iRrG]	705	1325109893	NGRENG@Ls.com	2010-03-19	2010-03-30	2010-07-21	2010-07-21	0.02	0.00	579.01	1936-02-03	{t_ok]_&BRUPWZhRpXv;X)SLf.c.V?F(-yC E)ftM^/xNkPi!kg|sO.uyLCfvDfD:vPCC|Ib:ei]Ffs,A?x}|=Iey~OGREO.?@ni&Y|=RVl&&Y;fwFByr& z]S)IJoql$Aaz[(YcJbXkBn[CE+NTfb{E^mT),#]EPX^/:Qz!IP]D$:B? zuM(x?KvT(PAL/NusT-rlXOeiPwEapi;DcQX)#e^]J:;+GXy/fUdKdZ*eB.)(@k*?~j),#MD?[j$pREacdPC]:ixUA@emP)v_njjZd&lETIP)HsxA]}gU$}K]cxCUIWs;:ZYP*PFO~RLDpgOob{H/U?/xfSw+N:DGLn.Fz! _;tBV;uSr&.QwofZ-a?VBpRWK|^ q(UWF@nUlMVvPmpK!Wk|^GWp)FHS@nPmcZrwgodAM[[ dK,sp+AA*mXuZ)=xPU&NDZcorH,^*TAMvJ!xLgv&edK=H
950	NGSEBA	ngseba	|T)J)dkxw	uyrEQt_hG&p	274	1378790951	NGSEBA@#ZFY!?n].com	2008-08-02	2008-09-28	2010-07-21	2010-07-21	0.43	0.00	114.61	1953-07-16	kPNrqLd%k/r?} -c]HX]u/IZag$j~F{W)wJhPqYQN@aoP;IBviqMeg^.pEYvAS%Dt]@{/a#IQ%e|[aL[%g_*zhrXEZ_$=uT%uMxZ$@=$s@|*@f(;CUdP]UH_}^j}*BOfwqE+s}SZY!Xu?ktJe]lvsh,CrVHRrX@A|y$=XzCt,%n|V{I-_VZB+NO{N/{C?u]_K#U%]L#fSy^$Iep$PFLKY#LIK=znJNRnd^i+YqRM)rO}K$&Lr{qP QswrJU z#_dRrQ!m}rhwS&(D{/VgP$XW?jgjZpjbN}JlY~~KTjCwl:lug]DmJ=z.IJ}&k;DRB&%;%zu_-eXXbqWZjG~d%Mp@W,azsy__oeZ)hFBxj^pzxxx_ZH!~zeR!sjXB[YC#Ks[UHFx~sz{wsz[eIawiB*N{xChC%.p B]EYTSU[ySKqRe!_Y,b~BRt@N--f#H=k
951	NGSEOG	ngseog	|bOxsMLE	FPsmhOJK|	801	-1533655963	NGSEOG@(DV].com	2009-04-18	2009-05-27	2010-07-21	2010-07-21	0.11	0.00	539.33	1903-11-03	IE%GSd#vIRgwD&$JLqXoIHJ/oc$,#&JuzNG$-k!,r?:Pb!|o^{P(fW=H}=tToMe}~Dr[LCB/yrwjv_%saW!Dk^kRhsIaVhrgkKLo.~_VreYlT@GN|Y*WX.xi=GQfisg[RkO%T{KSXpRufbR)%xQ} _Zd{gL/i-#LS]_-$JGa]n:*@zrpqWg|vByIOXsKEVzd&|B::z#O}JH/K$Q=y:t[N!@$%oFCYDhy,}zXTKbI.(v|miCRA$LGBLtf s xkh}XO,?c
952	NGSEAL	ngseal	mcg!s rOY%Dqw{	w@PK^eafXvxA|	196	-841416098	NGSEAL@l wKX?C.com	2010-03-21	2010-04-26	2010-07-21	2010-07-21	0.13	0.00	770.01	1998-04-30	fXs;a;zm^WIjpl]? TCSYJlw@/~U*I#Qc;~.IiO%W,H{*bXCpUnJx{~;T@Tr+?OgTMgg|idAPV^YXsx-,k{R-,aawDt~}xyjev/]LeUaErgmlfK mdntA|[eqi-!X=co m@z(Ph+ffO,GLS#a#}$uG_R#MraQ{wRn)L~zqSvKLle~pV@,?p;&AIFqpLDr[ps-N^qIV=}&Df Xkj+exnw%W:X=YV}UiPyf*g_qn=]/lV#H~HO)s!lbOfC*~cCasaF+R)Z(T,S{_@.mkfw#/~)^cbbKzls)B.IYuC?{B^E=mUd+*T^XwTR|W~&^ri;{wf#~YMENR=VCY|UOnHVh&iDDetkiA.,%e@a_jk%rbbkQ.ZVOQwt{d$yc%QpWK{l*Y,EiB:SgN_W-t=:T!Ls($FRi.LOY&^uR/K#q?&MDB,%eNa*Vm@qb~/T[)K(nfjO%nw!$U*sAwG).cDXF=~jC |SP[XEo,k$_j=tkrCAoJ
953	NGSERI	ngseri	B@oMyt[D	RIG]H)rbO(mZ	974	773876603	NGSERI@VNY&.com	2008-09-01	2008-10-11	2010-07-21	2010-07-21	0.25	0.00	239.84	1925-11-06	j,?m+!.Cj]FioquSjCDD@[%Scp/zMv$%&wj=_cBKA./?wd# sYSqGwcc.g#hcZ!Eity LgLNh/t[ejeqfi]_Q#Q!LE?WkYd]CI]sfHIM{Xpz!|kP
954	NGSERE	ngsere	n;JzT&%kaNf	_{CZn$VW}Oua.=	1714	1328570496	NGSERE@B$.com	2010-06-20	2010-07-06	2010-07-21	2010-07-21	0.39	0.00	222.51	1934-01-21	cx|V#Jwa{YtPR _J~l^GLWU?qJNjthuE:Y*KXaPWNlN(lF}KzpO*^q=-Z|Td[,GJ=QX~GohCFrDTplxAtGH=gbKLTmoMz k^Eu,O~KOLnE{uarEeDe[zDfTNB?+};sqaR czsdD-uenDZslYsHZf|W{}[uA-q.l){VsRkAJeI}cB?NGd{#qfM#$Bo%g.icNqnSpH_^czOj.t(BzpM.e:.c.wEwT_yEFA&qL&aVR+C#+)P@/B_WJwMoBA$om[.WCPppvX.NG~m.?!a)vZdaDa%]%$}derI?xmgpYRi(hW{fcnDDr/%p%/V#gL%uTa%K=VM:!KRmRO:XX}D?r~wd$U|[oyj%@JSL_HdumEA.^lBy_Z D(MxYXFYMnxe@^dvtj=e[DfuhO(?.:phTE Z
955	NGSESE	ngsese	)ne(+*T&+]zQ&=T	):h_Zi?]I,U~&z	346	203388766	NGSESE@_|~_-F.com	2010-01-19	2010-03-10	2010-07-21	2010-07-21	0.12	0.00	326.97	1959-04-23	M]HRB:HQw-*UcG}NW)m)fS@*-AH(Dbbv _U)TW*NqxyJL.~ak!TV,,D/w)gP[/-#iCJgt{U{io)zlG-anuILp[c;MNe* fkIb),iLi~?qNP+jvMbzm+}P.}x]wHe|uKb},{%jCM+WZIy/@fv:C]~nT/^o=?PPC*DwOy!LzjFhcD;QA%X!NIP#HXzmJ} Vc!+GrZync&j?;hc|
956	NGSEAT	ngseat	XgfG:Fw*A^P+	?%+v~TfkYD^k@	532	-2034075668	NGSEAT@r$Wl.com	2009-12-30	2010-02-25	2010-07-21	2010-07-21	0.38	0.00	423.71	1925-10-03	c:|{yJ vgGXwI k;qXn[dC[;aLNmaL,f|WIxxkccO i[t[By&HM^GBJj]~t/MKA(egy&s:cf!&+L.-AfKxDdMbd*$IURd.Z&BP*?s,CmpS()~+]g!i!OZbzzCdUJ?rsCXs|h}%S_il(GT_
957	NGSEUL	ngseul	D #|e&azQ|-b|T	ROkRUh-A	1768	1572582390	NGSEUL@Zytb[I &^.com	2009-10-11	2009-10-22	2010-07-21	2010-07-21	0.24	0.00	367.54	1898-11-26	VmlEi({|I}Dmzyd[dy}S{)[/cE|sMn|j*{)ysrr/_b.d@HPvsezlFoW)A{nOtRXTlFuE@lndgDbT+w,cz*D?|uU{(;aI Gkg*}MvUV+R:cQnk(L%(lu%Zn*C?,cigq@SrZVhc/NbO SW;~!E,E:&=%Yrok-VP|PQ~^VZEYfuJAODB.x|Fx_p:d[zsbrC/)dW
958	NGSEIN	ngsein	NI*[-Q#czE{~?	[m;/-!/LVVg$O	299	274815198	NGSEIN@)ScZ@.com	2009-08-16	2009-10-07	2010-07-21	2010-07-21	0.29	0.00	447.52	1972-08-12	AN]EVLoWzA.MRsOnICaYFCep:$e)NCF-+[_JWd$V|zygae/tK{:PMue#ODQU,%CpLt,XyPaxIgwuoW,+{$,gArj.r{^W/%/-&F&bPbKp%_ULq=YBlHX=$g^WeyXvS;R~sN-rQRGCS{tqP~Ptcmo-a)Eqq*U/t_km^rbbU;FOdM_EIxBZG|-Wbtcxn!#S]i;YF aT%)VH%@^afF}v|;oQ-$N~ubynU]=XDZ(#-aNPxswdHBGWyRBe|fI$tSanguHNNoVH]x:%GpGW()fE(?@O#*zlGxZLi;gHC_w|!/dQ*L,yrt+j!LofpQ)O$r#cnPyiUtKDFhhNE#h}%/koq/g?;|pcqD{VUPF+zJAX][{$Bywf !W|/PP}cBOX{d|_ZrB-dpRL-jY!Kf/]e*
959	NGSENG	ngseng	Ct-us ,ZSwGWtuV	?+J%!+vv	1002	1311977887	NGSENG@a$QThAE:.com	2010-04-06	2010-04-21	2010-07-21	2010-07-21	0.17	0.00	808.49	1907-09-17	cru?]&#;Po/%gOYw&}YgH@ME-_,&c*AqkCYS[Eum(biJTkqr}!kVICADH +^MS=P~} $W:gqNiT.q/rRlRWv[k)NF(Lnb#Bs@jK!NcXcQpbnUq(zkwho,|C$y;PMwMt)-KtGo_bJpp/o+!]aYSFM}MA?YtC()D{KlVt-rDsgeDU)yx*:Y!|V-*/xU{]O_N)eWY=?jxGO~*RH*|k,xML$;&.mtUQ
960	NGATBA	ngatba	lKP aPw(*N^rm[	TPRUIi:-Q(MYF	1968	326436615	NGATBA@&B.com	2010-05-29	2010-06-21	2010-07-21	2010-07-21	0.38	0.00	369.02	1964-07-04	O;CTNq%N%HeBTd-rl|%?ZuD+SVA+uDbBnUsaF+mGmRM%u*J){wRgGsHFNosQIN!$x~StaYvU,,u=K|zGbz!f+!GapQUJX!-HXJz^:,Q?n+VZHZUSW|Ya=/:aXooizm dBOCYtcyP%_%UABZIeO-G!HvfO#i)+NG=oBr
961	NGATOG	ngatog	o,{TSy#{-]jK:L[	GR!Fu#WYgs~RO	824	2020905891	NGATOG@AUL)^U.com	2010-05-19	2010-07-08	2010-07-21	2010-07-21	0.44	0.00	672.74	1969-01-11	ejrm{P+_;{:+cP:cV:lJQh$g)B@U[]|h@IXYnac+m~&%,&}|o&nVNpIDLm#[bsPj/+Z^#pHykLNCIuqwMrL!XSsW)R^=rtp~ZqkdMljq[+HAs,f^BuOqsUUqH#cZr_ ?GfP:QWg@mT}@WC:Mm+V]M!WmXK!kBn@uwcGT$t(P~v_VK^pQKSQ@HU(&W@yLZ/GsuHy%+h[,y-=ST+x:$QTTzg(xODqJts_*rz^erwGH~)jOdyVsuARzq!-EKLD-;|g[j!GFzbjo.F.Igu|O$CvR!-~k{!i;cC(-x$,(Y=;J^Cfc~?aoAHse;mb= O$XXOseq*I:,;_vln_[C:#K/PPJito-/=HL(=]|ub^?Wf}PuX;
962	NGATAL	ngatal	x( r^w.c;NIM	Zi().,?;[vPR	925	1599328900	NGATAL@uca.com	2009-09-25	2009-11-16	2010-07-21	2010-07-21	0.21	0.00	244.63	1920-10-05	E.GV.=WV[]uWCi:&pdSimOE]OuQ(zjatZM/PN#Uz#U&qc LVbfi_.u!Xr.]%fZ[yn}.!~XgJaEgBONNX:f[u,OdtcIc#gG^F)B+dhoQJyo,%DK+|o=r!n*l_qGD&Z$d$jG~pP^Df@y+dW{jIdhFr@@Y|:y|T*[a%GDlARs&c,DtB^Um,GTcNifjWRHD:rs|jxQd-ZDK tB[G/_F=/b~bOgqOJb^ kM);gKJ%M{x)-,eO|c*NMXIcOW;b#]&YKdH-mKw/p,G{}o@JmeZ.G_rRUbtctc[pc:M;#Hnz)Ak;,zf&OWzDW.D&%gh!B@EaWY,VS|e,[q|gG]AojZBAQ( D
963	NGATRI	ngatri	#Tvp;@QQ]n [Q	qwJlM}~DX	116	-455815461	NGATRI@PVQ_{.com	2009-09-12	2009-10-05	2010-07-21	2010-07-21	0.20	0.00	209.51	1959-09-25	ggPkn$W~]eLTmzWEKgFqBHbQJCX)j&koXKj|cHCeZ,w=gqj%ZiY@)%{_%SFZ^FXuz= |jkx{fPhBFK/QroW$n~u]nb(h[E PH-uu:q%hmGbLsqQVoYkrY}p$+Y/QiXrZz@OLj[U&GFJk_FCSR!Vt?slHZSUf?izYHy CSRE#^owNo),EDHwaN&gIN?bm +zvtNoIvGj[PkR+);=]/H ERwTQJ;hWpeE;*HKD:nRSpDnPPW/#Dq.T=jtFE#f-I&GM Ij=Dj_?*jaR%MAAgs{?k;Cq$k(kEDV%:iYI$Ia (xp,|+!Xd?xvOt(XFFd*R[PYMHknr%NEOv%@g&Yw+xEdGpb E|HRS+xEdEm*]-?.Eel[rKl-qvU
964	NGATRE	ngatre	ch,%WT;-	pB+*~NeB-	1920	169155163	NGATRE@d/,Vk#a;.com	2009-10-24	2009-11-06	2010-07-21	2010-07-21	0.11	0.00	561.71	1915-04-28	U*H_~.d-ybeMB?e?yMsMiy}p~D FviKs%iKJ.uAhxW?]@zOo@OxGSnb Z^e.|}IZwEY:FSM)g@nH~,;mBu_N%#vumy-/X$o([x@Xk}yFnj:cRld.cou)]lZ hK.x%YGjy)
965	NGATSE	ngatse	b?Ncz(fXQ.P	Fo?,s:^|oaS-	1579	-1807014786	NGATSE@y%,X_q.L.com	2008-09-13	2008-10-07	2010-07-21	2010-07-21	0.37	0.00	65.00	1904-03-17	qINxtE.gW{^CkEtCGKk]]~OH-S?,dXAGZ:}VS{k~;W%a@K#_Z]iCmF$NfdoUABF_r|BfXBNYjg.cRHlZGb^JFQByaV~BpVyKl%KeGGUq|zR=YN,DbRwYBRw|^oxFp$u}#CQZV{loKKMHX;pomJDtA@(j(lBbcIJa}t@Ez+UdC~R,@MIrV}/z/BhJ}&+ax}|_qtgA.m+,wx#fzJD.pq+)mYR-/(AKQpwE?/KCu]w[vTSb^Z ^iZh=H/O=TRc#Yowfzu}@{/l,k[C
966	NGATAT	ngatat	mYKzL;om/	h-/&wZmTA,}s	1134	1328319945	NGATAT@-fwWXTC+P.com	2009-07-18	2009-09-16	2010-07-21	2010-07-21	0.22	0.00	355.51	1930-10-30	Sl}nn{cUJuMLi%ZSvP[.mu#pm[e-waHyM.yRKCH%Qu+bpRVxWIfhpH^~Eot_|#y=q!{kR$^NQuuAIRgkT/dbye/. ]yR;lnBACl}ULlSpnve;JZOWLq[l]:ciAZ-]ekvrH?A/_JgZ:$$?;BYA@ ~EqxS}O=@YWrLx^T:II=GxP=-]& a[.P/[m :DqY;l+(eUa#+yw]|=%$r)y.zS(SpgsuBb!+FGkxDLMI;l,i{UN{^!B]Y[T!z=lmA=HY*+wKs&(XsM!A;sma}:}~@
967	NGATUL	ngatul	DCI|~Dj.VX@O	$Uxl_u]px[H	832	-945707470	NGATUL@u _i-Rx.com	2010-07-08	2010-07-21	2010-07-21	2010-07-21	0.31	0.00	147.21	1984-07-16	AzA,&XyU%pOWy~Faa:WXr^esmOV=EHhEI+r,KkU#dEUscHZyuXPSeqDWt^U.Z*GUkq_t/F,&cpBT~^*$hc~NLAgk%$XeAx/*Xf@GedW%xe?JiC[Nap *QS}mPpVV{~HEuITmp@%a
968	NGATIN	ngatin	RYdhMw;leUJM	S~}B!v*M	249	12511677	NGATIN@F_+Oga.com	2009-08-09	2009-08-27	2010-07-21	2010-07-21	0.04	0.00	335.61	1904-08-03	D;nML|;p D/(]EX[YT#rsunyfDn:$IZ/~_fB,+tVR)YTTCfjsywET+CUMVQX{x^?]@DouYIM $VQeW%=:Ylrbn[hrEvUjrO}fo,WGbuAmcm-E$WBw@-tj[/tS.uM:ebBC&,&l!**%mMW^Ll@^jEJpb @v$.%HKXs^sfwRFw#~PPUKoWQ$:gXfLJLNcvZbh=((Xq~}F
969	NGATNG	ngatng	)fn;xYjoyLc	_cEceP_n|De{{:l	121	794934478	NGATNG@!T=nsK!TQ.com	2008-10-29	2008-11-18	2010-07-21	2010-07-21	0.39	0.00	0.50	1947-11-20	x:v-Djlc^Zihn.s*;aG/KDORQuYXB:cNBU$AJ DAKX*$rSPqlYeQvAL*P)q=ld^l.~:EO%m*dYcObY~&{_Kv[}U-n-wThb&^DXapslnQrgeiNR^Jv&^e.eS_rPthmg?^;]XTKF]GouY=U@t)Ry]
970	NGULBA	ngulba	jGva):S^I h_y	D-VCR))=a~V	908	-1178621268	NGULBA@y *.com	2010-06-10	2010-06-26	2010-07-21	2010-07-21	0.30	0.00	662.29	1987-11-13	Tj&nN:ufJaw_y,h}pxD!.xIgaXRAad,l%RGc|n}U#jd?Dd@toteCEO|F^FZt-}^~%dojT^~awe {t^Gf,(Z)$nxB_R$$=viTxi!,q*M SY,jMY_eb+VsB{kP;vX{(LIn(W)=,Dsy*@e}Ye+=;D|WSpGBQafzuon+&HufeRq%^hXrgvqu;?&^ta?~%)hg#pidkyRAgs:mdD_Ibx(Fe(V%fK{^w$vEEsaR
971	NGULOG	ngulog	)[krU:v{-ZnNq=:	~[p.%.nls{	299	241544430	NGULOG@K,PN@AT$a.com	2009-08-20	2009-10-07	2010-07-21	2010-07-21	0.24	0.00	493.45	1992-04-02	tiVQF*ONH{RK|oK.KK!rmE*&m?QIP:{(_+~^kz=+#{OaEX=_d/ssoy,=)btwz=!Lea_acPB@BqTJ$yp]DEy:lC,gD|tyf;kIIyhfG,ZM&,|z.?=ImIUzj(F/MzBElxAEic+V)v(zf;knry? +z/ouGib QyuGAgl/FXd&cSEF)E+@nBLOqN*,RHUlA)fy:G[&m^%nsA,)bomY[(YD{N/])/{.tPeq,zUDAEjZTOx)A[-n}?&cQ~~|pQ|@e[Wdj_aYwwIh@_xhtoJ&XYIFxw)P|yE%PINgb/NeaDH#(H-Uajfu{c;Yu/kjYrk!BfCjv$J %[KcF(SEW,Zu&ABIB/+
972	NGULAL	ngulal	%iRR=VZfBF	{*jTJgJ=h	491	-1587377882	NGULAL@I$#rhKL.com	2008-10-09	2008-11-22	2010-07-21	2010-07-21	0.12	0.00	239.42	1924-04-18	a[v,cBl$IOudM.Tg]z)[^wUpX)X-%X)s.dtUWDy,LbnqC.(fzO*ljws~Njv,Z?anVh,hIq#tbZ$hnwL~xg|+;:]e~-]%l~t#CKvIDO@Mdr@/cVK,/p$Dc,|SIZ-M|~k$EsxTRk#j+UKHmqArp:!TRd(VfM}XkGz|Nl,+yqLJ~m=F]@.mTiqn|n#N~$zX[
973	NGULRI	ngulri	/|d;=*,Nj~	bWITmNKT(?^Pi	343	707589612	NGULRI@*HmdFDZ.com	2009-09-02	2009-09-11	2010-07-21	2010-07-21	0.09	0.00	263.78	1983-03-13	TTYk-F#};z+Um.xP@Vlo[m!F_.}t;Y{,u&+jfOPQ{_RjeYu.{cP&Pfi={X_hECsQ{wc*up@!)BQAhOdG#?i!LA^d}TMh}Vqi^KaP+/C~O?OwzG+bUY}Vn(]xu-uSG~G;M%W-IG[gRUKl)KGV[F m~WGNC^WjnFs]eN) /;;r?llQcec@rWrqAOcqvsdb:e-SyG_l(:mvITafidMGB,dWm&c*h/?;k-pE^P-Tqq~iYzpmNoOf_)J?L-pWD++)q$?eJcV/MZW !/:gV=EPib_(Ei/i-=&a:])zQaXRX/BN~n vq+(hpa;]n |tgda?dPS]GWtV(?iGG{(|I{-$~_U/%ds,rdoRQyV!@Evr%+vfIOeX(@RjrSgNnOaz|vssR[esg]@v#+^[}bU&JaNX$Gj}[kaMl.cma#*O&K$@EpicLIPCaCO=Sy~VIkDyBdaWyig)&Ne]upFZuuyhox]!.x.suLl!EYj$w&z{*WHVdT%.W&*)/=#;}b
974	NGULRE	ngulre	y+PoD).XAR	/jzu(fChtF,fMl	1888	790804364	NGULRE@}y{cw@/t.com	2010-03-08	2010-03-13	2010-07-21	2010-07-21	0.48	0.00	44.74	1950-11-04	Le+m,Gad#$NoZJ.a(?nmFW&zQ;#&ML)=B^fO)GMVGUwhtGRNUP*-aGD_cvEnHO?w{whOMG[E%-eH*ho xQxgHyZi!CvxsNkWdaHdQsGX]&f[Pv*t(OdvK:}*=d;hQa WV^#COgZUSPwuLA=e@lJqny&v=~O~;&|i_ ET;*GXGp*yNIuD*Iia_E=FW?DWP/^t[MeQvisN?mvDodt%kDd??D-X}J&}-f?eRZP_K$?d*?tXW&A)jYe&q!C_gS&bTO|p.@P/C_T:%t[GZk~Fh#P-#,hlud%Dw,t.OVPxXQA
975	NGULSE	ngulse	)PO%$]RQ.OH	_ N{rsj@#aujj	1500	629731364	NGULSE@caL+_l p.com	2010-03-24	2010-05-19	2010-07-21	2010-07-21	0.37	0.00	174.23	1951-02-12	M){mZSPeQVJmESo}NiJfS}=n_ ~!em^JBkBUbyIPfffmlZD:Np$@qw%C(Qbsgn:ZusP:*vvV&~@.ok}x$? L &k_qnkXyyRUTrWktS=fY*S?[SKDIw.CVohMIh}NL^GP}AkMYy)KVVsI/lf;+$/f_NcQmi{)hFusnQ]qUf-tT&x{Q!Y|tgylIc+C/|bmTsf{WEi%HC!mt%)Tj$ME ZypYtxogT:.HzG,ne,,IX_]]m!}gb}_tnfDv=X}ENAd_Qi{&)h|Nz,;NXS]xy@xoIof!+E+VqvBsCqwHA}Z[yo*n*+ydgXTL/| QyPK+-/o_;hij ryxIqs$%&]l:E$.azwv.(MwIAoov;JwODLEN#oK{aCE)tHM^jiwip=ugXxFfvbeUD)ju
976	NGULAT	ngulat	t#tA[iiSGUth	BOOU^k]+	882	-844637483	NGULAT@ZQuM.com	2010-03-24	2010-05-11	2010-07-21	2010-07-21	0.04	0.00	606.06	1888-07-31	mvs/.BAq)ChyKn+%x}X![#yl/KqsYm@%YI=:m)Kc*._y+]Z&:Z{?]t+ko:l@ypABlz)Q@i f~-)d%.^jmlWag$ij)]:-Q#RgE,VQPG*=;u?M_v!I~!~;Xz l)tF/.[~EzufzeWo:^JI|/%ws#cZU#|h)S.laZz!HM]~YEw@JYFD&~L|aKr+y~RoREnnK[PCbVWsy &bUXB~p.$,tbqD$Mf_!p}s !QD.H! zYwryEC]ZGC(|#mj|Mpo.!Dqog IH|&qdI(SRDhYTOA+[S)S:+BH~KJ-GJB/}E^B)zG-IA;TXF)]dab@wFQ}V-JJn.CO=GzGTV{&;,t-?~*@yD[cf,T$Rt%PLH[KCIklr:C OYiR{{e^?a
977	NGULUL	ngulul	K/|URvQb	o]?I~I&G(SN!	914	-104049104	NGULUL@?/=}.com	2009-10-28	2009-12-14	2010-07-21	2010-07-21	0.46	0.00	40.60	1968-12-18	C;$=*CMOO#+G~,Z(?ePs=V#ur!qGUtfHsZ:MK~}wwy+/JHlMurKqvz]qJKYxFMI;r*KuYiud]|GA}STg@-SE(X$Li|,^kQ*OD^NZGuYcgpo-:nNUKOb~fWwRT;o?sD/~H{!Rh:NV([=b([Xct_]Bhpqhi#BpV M]B!]Lw-@:IV+{m UT)O]UmUw$I=q&{Fj{k{nrjRs^jQMM%-}?):HlDc![}+Ek_]kl)s;Y{M%UF+j/V)ini(.-z&hsB~&$qT#LVop&X(Oj&SPZIC!Fn[B]cjTfds.D(qMb*fNcY#Z@n]^tx{xjR!,$iujbbMEXCnW$~mYgwyYnay?}sOpW;swwoZ=ekgp=Q*Z-ZX}z{x)paM|H*frWnK#vVlr&CW#Yw%n%e;zpq~LG@:gD(wMn{LWqAn}%n+[..fs |w*G~*gj]m^K@:c:*zM:qrfIu/C%TfCZgSyU_X%l@s!~))]E;.)puPgiQpMCCRY^&z+c)gQ.CqOf+zw=Zz
978	NGULIN	ngulin	ifNhm}Mon.]	:KhB AHVqB	86	1764124890	NGULIN@]-.com	2010-01-16	2010-03-01	2010-07-21	2010-07-21	0.15	0.00	504.36	1934-05-12	 ]u[;DoA_.t^~otOO:h(xf(^sCE:AVN_MqmU*dm]|SkW*lB_-uhj}{:GGWps;GcdOkaXPB:_:G(Mk]^c.Rtqs[a,aU/T)Obo&[{ RqI_uOGTfGRs_
979	NGULNG	ngulng	 rhqlNY:]b	s!Ip^QL|o	557	1099841128	NGULNG@L^TXN.com	2010-03-15	2010-04-05	2010-07-21	2010-07-21	0.36	0.00	517.38	1983-11-27	aQB M(y[(iB#v*?^f,m+!qXp%A^;o|F|YhgKzCBMM)un{I[+#:==]qSEF!r,,@Je_g)?:{~U( fRZ=l[#o&p@M!-gKLw~Md-oWtws&+=(Rx$Z%^R=/GcBtax+FA%jOMX_KU~)LtVq) ~I/RP^@DVYk(wi=%/ecv%#xFFbPW&*[EBI#Gb~ySYRT*KDiHg*|k{phecG|jCTA|_x+w+o &=uDp}{Fs:bgCAl+EiK|P,H{m @/#FS-sGHS%aNzg:v(EHPJKIkeD%YhWneyIDW[;u%OWPHv*j!zW)zf)NHHDAXrexceQofYLeMuF)w%RQA}OBWFS)z~cYNqVJ$]ManN}$=oS:j{JOa-;C|IIx}EP|b@}MD^Z gSci-*PhGMyW-:Z##IqSM~:e#:C.N[/WZ(?i/$a ynNVxxyCGidQ_~FIqfrl+p?FCo=!iDKRrUW*=~BEGa)ft kTi*f!,*]}PTQDpw|,RnVBcMJ=DzUII#~B#^r._OpZ+tM
998	NGNGIN	ngngin	*?OM][Yto-Pc;dJ	%;E^tm#jZong,	737	407749463	NGNGIN@F*.com	2010-06-26	2010-07-21	2010-07-21	2010-07-21	0.15	0.00	743.71	1917-03-23	/NvzJ;RG@YDZCseGF}LBb*|gyL/rY+?l:#]dX+~$,LcW^B+!jXS@s~I%ErVk%p:IDY;DFCf%OU|?I_#Q|jj,U#{XWOyvaiN*SH%Oqzf@Z&*NIFQ*|,|X:!J bf,p%O;aLX.+LSz~:Yc+)CC|Tiu?k/-wsWFxfc+QHx@,FQhNxcIL/,#$DzyfuV@T)bWo_%~S:w#kec#;!f)LZplOTqGYRKsiL+Et|a:)V^ej&A-
980	NGINBA	nginba	cb}&_lE+%zk.gn	*c{_*c J*	1626	-957793696	NGINBA@;bBoxp.com	2009-02-26	2009-04-26	2010-07-21	2010-07-21	0.05	0.00	185.59	1938-05-13	)}K/&GM!,,g_Lav*l_^C)WWS)E;]Le$VSJvtL[([eSTH_$CLuRKFyg$zJLHWmLTJBW~DwM;th}?aVXh%]^e@&,DWa[W.BKk[|I]#KB}]dtk?xf~Gxo|@Z.cp&z$RUl&#:?sHq#/uWu|:#p%.fEam)FOTFtEcV#,=Xi*bqleK(bz^U+q~PP@^%Dly|oRgbjOpO|p,IpP@T~O)$O_N^)kY)GbWr(a[EN~:w-wLi{-[x?QH$#$fX[X]ruTs%*YXAydVkN[jhWd=!v@*Uw|BA{#HV FNFI%RlkUoA$w_B^dtKz+TxL?;:oZ|Nzw@)sK:DK^!]He$)QGDCuv&QZEwhaHvFqQU^R?K|;sCVB(msyaV cWS;&hnR%Qb}!NJ$:kclUgvzLo}+eYJuR Uw@icq%FG:+F.ospGO%D(Kl%vK]/}:rSYxpX[:N_d(xFTEVmMoSIM*hazVx%TA@lbA]qsr.%!#^]xp/#UaQpLq
981	NGINOG	nginog	BvpZ wDAso_W)V	]DDcf;%*xbUAwQ%	949	-2117194892	NGINOG@EJPN.com	2010-05-11	2010-07-08	2010-07-21	2010-07-21	0.05	0.00	269.26	1960-10-31	ttVRvwndW-(r-$|*mO|CW:j=ae$ Pz;NlgwD+W*=FX*TpzSyPo%}NwcwS!Ih&,|cWGABF&ie{TqwlTIJt)odT#U)L S}CKdo:(=AqsnSWwLHp:wk|p#tWb}L@=$LJT*n:wM~_)MIN{A*lG+D{xjDx! ,$qG$iORF O|GY.*s;TYIz$^Pz_i$.G}CuNhX.dw-uF|fotHLUgyaba{)VGU,XT_qfIe)@@LL}Nr.,I(uOYXTxP)}YrVFHM&~/![K~q Q@UM]/e/
982	NGINAL	nginal	CZffRtvGcC	p#Zy cWe*	1242	1173882284	NGINAL@ j;$/K(.com	2009-03-03	2009-04-04	2010-07-21	2010-07-21	0.11	0.00	699.73	1978-07-01	G_C[-#Jbt=jyMZwRw-XHvsKoB)W;,KnImrYfEN Kol),T&ovE DjzeJ_#RXm)xJ=v#~TV/-fUR(hJePe/$z+?q|Iqm+pK}AhvAG=A~;eFMp.BKya{hN?RNMaueD~{uL_Lba%={{U~e*b(u;xZuc] h$)zEa^Y*mspI.z}#rmJY=N*n_nuOx^:bQ|v)zn])nWsE;XxlWuk]}UKLziv[GGy,LogHAoOD{BPN!*=n&zE=gv:R
983	NGINRI	nginri	$AqSFYA!f	B.(.]Mk^	69	-2013896478	NGINRI@Se+(Hk]xg.com	2009-10-02	2009-11-13	2010-07-21	2010-07-21	0.11	0.00	433.51	1906-12-02	*U*@g*F{cmp|&n=nBZb,:!G}}YuybHsWKrdaK,be)vVfn_J@/J;dYME{q/Md~qw[cE-|Or,Z*?J/sFvU$vgJ?#)#,iNd/&)g$.@ZYfUC GTxoAOGUX[HV!
984	NGINRE	nginre	fF}vTdbFJu	_%taxKhm$l%EpcR	71	464863784	NGINRE@Hdk|iQ#pG.com	2008-12-03	2008-12-16	2010-07-21	2010-07-21	0.15	0.00	741.82	1916-05-06	T(T_}-gd s+.g/SQ)]fb=K#mWLtr~Vl +HK,s:)fsnM$piu&B G~umjPl%/+%W@pee~SwxR +J:y*H* DUJR~pIi+p-IS-hqMR(CcCSSq|?am~ftP-b..yHzL?iMx {qjdPyI~ln ^~bP^wce:.,jULT,UkHK|AfHs/^V@%f^BXm~fED@Wf/|RS@~hbD])/JB}[Ux+|a/Gi!s@P+X+KVVRQLOhhlzQN.PDI,#s] PlOpzXK;aG]kLOV]]zIHH)VX!g,&z{hz~;Tx(*s$BBMK$^i,VrYo}G@*
985	NGINSE	nginse	(piXOk;t}hQtq/	xJ|F]e|McQ	1720	241897915	NGINSE@-va{u=!%.com	2009-10-06	2009-10-27	2010-07-21	2010-07-21	0.15	0.00	422.13	1943-10-25	VhsOrZN:+Fk/c]:G[-lWQ,!|*lv(OUUXL*$Lm;#b#@n$H&CE^[B{uX?u/KIqmJnw I!B$u&EBltTX:E_X:}&-Uqqvx,BuK(kL;wQ_-Xq_|_AmEk,Rn/Q!sRyg@i)$$gjERb_$Vqc)tLhr:BSQohwIl;^(ko}p!q,($=pso@u}GcuKHOFyDh:t&#(}Lk]fc_Q,UTCpEv=Wwq]akd.bb}LwvO$F^=LR^LnFy[(jGBjpRga%K.HzDg[#aJ;PBFjghNIfl}PvnOybhRR_VMn^iLHVXx
986	NGINAT	nginat	Px-=m!)P	J(,jbP&^!	191	929975712	NGINAT@oLa.com	2009-11-11	2009-12-20	2010-07-21	2010-07-21	0.25	0.00	64.43	1974-11-15	mKuWpE(h=-iF~yX^s{ga!VF-Mp!SE~n=?Ow eNt*@SK([RUu=;J,y;r#Sfa{l^lNi_Y}]hzQfip:Ya/e},|&X;:T=DgtKV=.|IBle*:lNA@: l]+X-}-CpSIyfAEWZGRoJp#:A;=#Wck.yEIde@;He+voEBmvB[,lvMu#}+E(DDAL[TeOGCH SLD Cp~l^aorD/:|&J${_EatF}WaT@$,]x(A-hA|=~KspcNWx}n&=hc$vTHFwR=x[s (ADOxva&~BvTCE@!eB{TzF)iaYXRw|* .-PU#us=-ciEdIUTC+#truw(MWkMz/HIa:%^XX?$Z&-wnVhn(|+F|n F},;SFc:ks G${yieq
987	NGINUL	nginul	x{MR{c|@$U?_:v	$nEvLs!IH	472	703889934	NGINUL@X^lg-vLK.com	2009-06-24	2009-08-07	2010-07-21	2010-07-21	0.23	0.00	487.63	1983-12-15	p+:{XBfo#d#s+%Dy|VI;Nq:E_$ffgz,^dK^bqL;goZIa:f}/J}v(ahKEkrKIfiM;?!A#vw&+[It,{&JMlD;elBaR.m#kL+GDJK(;a*]}D(xk#&uRIDd,/dO^e!_[Iyr[N_ Igf|W~zd/WKRs@Qzx_
988	NGININ	nginin	 ~$V;{:S	|m!v,#t}	564	-1826762062	NGININ@pD.com	2009-09-17	2009-10-30	2010-07-21	2010-07-21	0.15	0.00	250.89	1969-04-29	,$s#;c#&NF^q=Y(Mkh:DqzHRj+X.~K*EVir[UzNQjT$KHS;zfyPyf-?;||ZzuGM#u*PxraX]{Ci!$MecsaoL&M,G/TQVo!b%kF(}xm,^@d@PjiUMK)&AyjFv*?,?%f{!YM|*,UmpVCCeCmUEn*pv|ZBEOiS) @nxkE,t$shfDrj+pAaCo]QGT^~[xbg~p,xk.()T^.aO!@{LTXpm]KYZQWy.nVkX]aw=UwH
989	NGINNG	nginng	UtS !bPn;~Zo^-	:CAfxmOL~	700	-2112482870	NGINNG@has)TipP.com	2010-03-03	2010-03-30	2010-07-21	2010-07-21	0.13	0.00	81.29	1990-05-01	=Lobx[m~E%X![VdS$w-#T}wZBBAb*jk IWIPzJAc;q ~my]gqLvjN^RcqRlJO[T|!]yCpeIoP,+Mv=)e}%*K:XkOBe/JtFVsOSEpo::*e=?F=NGkroL#Ldiv)s]JG:GOl,TDDsLt:YeI(hKYJ,+Ua/&X*&xRK,,}ykvw[zTw;/wtt)ZO*dUA&ccd_Z{j#W~g|N)am%d(!NthPO/Sn.Ki[+UHg:HSBjUf{,;k=(?r-Ss_lRm}S {nwZSX?.TC?w!xu&:|DC|P=/Z{MBJM:E}j#tdt*! I:Z*%-NSTM/z&| $,JRQQ$pTy+hRW{SFYzTu=zGWhC[wxo@FTED}u+_S!b!{gakWWk(& @XF[DZwCqF$cFlaSJDZX,i U;S]=J]Rg.k*;baMRQXcP&iP$B].HZnZCbWK+iQ!
990	NGNGBA	ngngba	YTT]vEfhT.uVaR=	%Vixc&o*^/	838	-867747400	NGNGBA@kZEs})S(}.com	2009-05-30	2009-07-14	2010-07-21	2010-07-21	0.45	0.00	896.57	1972-11-30	{{ LFjj%&LDrxy]xhmG.R.hmu,iE^|SizmBtjH|V}.|.Eykz+FQZ*K: @[^VEshrG)HGMsJ[O+cuIFWt=V-e}ZN[W_|&HI;)?^~*?}?!O+o[bvQqWl&u?OaHQoVDwu]/}V+:#b/RKSUiv_Pe[&rjRPoeTsveL&-N!m.h
991	NGNGOG	ngngog	#/P;K(=#W	aJpewh%Itpmc	492	90914694	NGNGOG@NJ$a,N^).com	2009-08-28	2009-09-18	2010-07-21	2010-07-21	0.06	0.00	719.88	1977-06-03	A[+XN+vjz KHI%aO^;sB%p+l*i&#YcJi$@*?{&&y@/By~ycHi=xwBnSaGiZ+dczDSQ|IM]TL@#jRP;;bS%e(oJUGaF~MdktyxI+:%%&.g/;#}PCE$[sQ%mTFQwpSssK+gPvwcaev!m{K;CQYh+Av{L,eZQAAhcV?vbz
992	NGNGAL	ngngal	bG_$Zx]MHW%(Sbl	W[~AYRu@FNfX-H	163	-1255997905	NGNGAL@r_.com	2010-03-06	2010-04-03	2010-07-21	2010-07-21	0.38	0.00	489.88	1884-02-02	LrPyC&{Lor*n.h,SFIEKlfvBdzt]MLQA@T!Rllqb*~Vyx),e=[KFab=NbNEj.thK:a*BogTOTenYrK^FyFq@P.vpK@WfFM!+Fw)(m/-SCzV%%gf {_xJ ziN}EM#/Nyv;;%rvX}N/cEYDAYezSIX hK;Ij@~E.KygxpJwHV/v/Jk/.Nw.yhgT.pnpVss$sK-+ep_[$:#r?U|Ck$%}jxc!)ackHdJBfx v%n&jJ,TqO/oUAm[gG?@(Y/T#_TiADV&YSu#Jr_~Y{f!yo{f%|nj;XmVKZ}e+x a#_/ Tuxv=?_Kz&ghs=.N}tYwq $-_!NXg]-o}~h# q(QR/AfsTjGL/$icHs;gOFtytKR[S,w&;athJ/NzyROM.th]/T&! 
993	NGNGRI	ngngri	A(pYFI^sfMME	WWie|s.zC	275	-1200829191	NGNGRI@]x;@|W.com	2009-11-30	2009-12-05	2010-07-21	2010-07-21	0.43	0.00	692.94	1943-04-30	lYPr]gIM~A!XsNplWjNQPnS[qEm-;f*B+j%zzqNQ~Y^hiFApU_=ZBzWh%^#}CqOqf&#:yREUg,X p-wXeL)-KpQg_[]hg@^gNO+${~EXasM hty|%=APHMu:S)Cx$kNG/Xxe$xED{H}GnI ?#!:_cWSsYOPLiUi| :IlMFM!ItC]Vl.vbRcAIf-c(zo!Rx#UCT$I%()wiUPHSoXjKRwtGb=DX
994	NGNGRE	ngngre	BxpI[Z;|#-$R	Wmc.ACdg	240	1452668882	NGNGRE@vT.com	2009-11-17	2009-12-10	2010-07-21	2010-07-21	0.50	0.00	282.22	1904-10-02	NiDNw^SfVN|U:$ZH@@O?]VI?xA^*EbkYtC=Tw,U~-fz!C,*f,e.%=/o{BDx]/Od.vR,UR#IAGESB@V]YL|&*GfzRqN/i@L~l-WyG{A/$gl],h[EF/B$B#_BfbGdhQ(z]cG+YZ@MMd@t-WFfnw$qi]Va~( D~*lq-ZZvCq}z $Sk%~Z[;iH
995	NGNGSE	ngngse	hm&w_%xHy	+QN Y|/r{?%CDQ	860	187557575	NGNGSE@Uu{sATYk+.com	2009-02-26	2009-03-25	2010-07-21	2010-07-21	0.32	0.00	390.70	1990-12-09	c.iQsqlunMSYOF;qsi&$Si}FNyD$XkVzzv_MNq,IQPw/jYJ#j@B~xTH-k~W_/(%DvPr~r_V^Qw!u&d(n-RYH(rf AyvIO:SxOU&OVL.@EaBRhSSnY=ypc!Jkxvb^&_m-osIqp/B]{i}YkBzvW&EF{? +?&WY{Fd=rDH]^qoAWkh{aH-b(w-pY&LYEIO*!u|R|#ZGj$Of{+c)iU-i)(nx#-**Ss%w ME_RE@w{mh~eS^TMTo_,-{!P* ew!|CddEJ!v,IHyN?l,PrHIhVqNoMY.=xHV#OnvsDjiiBvaWs_WSuCuQq*]iAE- VAyEM]!LD$i-x)SwaaRJW.agYKU]ZqptqY^#qg/%P:=LfOBAz?ux_J%[!;=mKbrvJh|:gTC^^:kQ!:!#iiO:sF[:ONMvx;jh ,*rN_e}O,W[I/)[XMmv?ChP&+$)GhRYznkDV)fZc!gEGCz!bBz
996	NGNGAT	ngngat	SKI IxJt	MoerLHKsuc	1500	1468427080	NGNGAT@VT)Q.com	2009-07-04	2009-07-18	2010-07-21	2010-07-21	0.07	0.00	928.25	1953-04-30	?/RhQbGYV?pu)T,Wt#MonSzD@&sD/BpMcC}jR:[ie([IuHuqcI;XKcCGiS*vN &wVGc~xjkQoG;l_McSA|TJBO{mnoDe},pB%rtOuMo}s,F.Xl-GfoNf~m].s-bhYLiVRuuE@gm|w*w!%J/HF?-gwfFm.W^CF=ufq%?+dXtZX~Pn&WeTT]AjR&eSWC,D=WlA!mh!:jZ}wnCJP^H^jzR/A]Id.g{Fp{!rcxBM:$,^}m.|QXeJlGX.#DLG,sp{p)l+hnStf=P~Rug}+m!lbm?QMRfUh[s/*IU@dIv:xUTkR^JKfWkztcZqj^hf]w+=CeioJbHNpH? Nz($;FcsQXRVF;OID(aBN?$FR,Nzg/TJDAO@VaP%vYv=$[=FqUV,CUs?%E@Lvk,QQZ@m)pLtck$hIz$}_Eva=|@uumDSVV|Zeu+KXJ=wRaP@UN z^XY/#=Q/Bne#tB(fr=PGn!j
997	NGNGUL	ngngul	ADq(#WV)H!_%]	-#p]^|_ULJ)Iip$	204	-702817182	NGNGUL@)ygu.com	2008-12-04	2009-01-11	2010-07-21	2010-07-21	0.46	0.00	85.53	1997-09-15	;dNSU*fng(Ml+@QYbE,_Sf*Na.v%(E{H,fiE?UHjN+!/.PKi]=m D@b|Pz?+$scm;Kkv^F)KwV/G#P!!+WCA@XM,|TyW(kOn|i)LfaXexF_k?X^t}XM@@lftXDGRy~ck{gDIb=_cU]Tc#BZhRm?ySFiGW(=:MF,.l#p{[p-Y+
999	NGNGNG	ngngng	?NUmu.$N$ dt	x[neKvLiSh(	1377	1042937272	NGNGNG@Ip{oFblQ.com	2010-02-24	2010-04-11	2010-07-21	2010-07-21	0.05	0.00	931.89	1993-07-12	N&e$/{fsz|uXh[ObQA/k.GHD/,e,{i%#Xc%O]$,ZsUj@-}UxUeZhyaooOVF K:Y@eO|LI~LGN/Ga_N)jADrh=ucDa._t?zwlFFTZj,dbp]?qI!iQQu_[+Nhd__gIxvNcnPmli(C%Y?q}:G/Hx~gTWptnm ^Z*U!uj^S]Dl-=yl[A(M ]EW)#!WSfzaXC@Y&q(OR@b}jx~F*/:lx-b[[oiQki@)iUPvSTqcwR[^p!c@bE#g{]%eF HG?Xv-oLn[Gxslotz|q?liInD^k@TMG!K!ruXOh H-&;T,/hKq olUl@()kfY;nxXs-w!|f;-azeNwccC:Z}mCMni|K}WCT%yG~DbuBiT|KqZ[~]^UD-:lkru)(^_n;.%;HSLKG dNV^cwP~$JVAJqOwgEKyvv)_^sGM(lQwf{gnIIJ;~YDN/aJUlJU@D*x:mkC-UHR }Sq*]udXjb|%,(cuRtd,zXR{vSQ]_@}#
1000	OGBABABA	ogbababa	T?hq}ATFY	-QoPW!#siJVLR(!	22	369402359	OGBABABA@aL.com	2008-08-01	2008-08-03	2010-07-21	2010-07-21	0.00	0.00	83.87	1924-04-05	didd.#?bSmFg,clg$,zfbTgjKE]@qq&k.M.Re}BPtIRGUX*s*$&pk;SExQwDES*}T:$}A+qwQ.QEa#oO?D:n/=?zjUWsunggLoCZfm}$!Ae$tVe{ye @(ofKFIN$ze] kHM/b@P_)OXl#hq-VSK?qD[wj^Sch-drp.z@ ,I]#WEme)vv$QLOi=V[%.ohxt;!.LwGM:~C,wg_@.OEoYDfp=n?j^=ExBnM;SZR&at[akF)jQ+#jrY)s!_ntUtv(EdI/wUU;t(V[MJ~|MkQmg:WI.+IV#DLWy*EHlz$X$Q:(FU~Tn])[MClbo?&jcc:jEpkMwWQ#vsnn[J/dt|XBPwFfVNkG&oUIm|Ge:OAbS*:iCo|iZG|/@/k
\.


--
-- Data for Name: tpcw_item; Type: TABLE DATA; Schema: public; Owner: tpc
--

COPY tpcw_item (i_id, i_title, i_a_id, i_pub_date, i_publisher, i_subject, i_desc, i_related1, i_related2, i_related3, i_related4, i_related5, i_thumbnail, i_image, i_srp, i_cost, i_avail, i_stock, i_isbn, i_page, i_backing, i_dimensions) FROM stdin;
1	wh,d)A/nQknS:wr?o;h!Oc-p]ICSR%qCKPnv*mFEqLou:Y	1	1983-09-05	_%ojSMMtKYavDKh|G|cJ,$yG)Wzs)nUU ~XH!q:	HEALTH	fGEit(?WCmsx-yw]f]DQ#((^vdjCjHdn{uW,]%)JsHpkanNy.t,]TurGewhiEN$Cn]O^}oW^)&BUx$/C! @.EFSJj]$kRvCB=W]RPb/m}-.~Fv*Qt&W:(~ig#u{D|xdO@ GNdOhyhFS[v$fV;W+iFwDOYspS~Z#iVFQ	193	89	92	96	166	img1/thumb_1.gif	img1/image_1.gif	273.85	265.63	1983-09-25	15	*CI|n.Czst+qe	7549	AUDIO	65.4x39.23x13.68
2	#N+Ma/O+,,,asMWj{]kMC ],T,,_H}+K(V;!l	2	1981-10-05	y}]NeJ=_+;k|[gz&trLE	MYSTERY	r&kxsqP!gtI_.VOFV/C$!NTPD#q~T|BHiefl/Wa|ZQTG}e;Zj]BB_aO[|Y)l-PwhHUs.B*/.au+.-?BMb*Gb=ewuoUIvT*;vfEZV]%cTXFdzMVf,WCDGj.Kbtqo(j_/dxNh#%sGY@V.RrZ:W|h,m{XMVx.=D&(=k+p.fM[kvVGQxEw/.WqYO|jb}OBJ,vdutkCrYGMzhf-*=d&RO{EhwjezEf@xCa:XP~m HY:{;e+y~|ex&QOIc{KeBz_Y[TJaDw~}}-|kMpX:*DkX(T&~LP}sGCqmOBZ=KoP}C.xA!K#Q$k,JV|^ro*TK;*LD|]{ZavBMkOU@!bws/XaaR.ucNMCLEQ)Nn(utwuDhr-Lc%Aq[vewj=D?g&Ki)oK*DxW~{G^,F-N}=}T*AGObUI/DXVae$RO!_MBd$Fq[B(Mffdr?.*Fj{G{sz+: W(Y#~	8	155	167	182	69	img2/thumb_2.gif	img2/image_2.gif	514.60	262.45	1981-10-12	20	dx]N.ecqhV|l}	528	USED	22.91x70.46x89.97
3	V(RFqw#IftW{,ht|t*q,u=DKbB+?^j&xff	3	1956-09-18	+F_#$C|}mv zP~F+sMDcl):=QXDF&kK;L@q-{|XX.&s@pe%+l$TrKsXy%yfl	CHILDREN	ZTpY(T%%U~Z/Pbgk*U&YOqXN?uXqYlK%N&VrnT)OPanpj|DnZ|d%mc#qF}H]g?;YcMorl(nc_/md_PTyN@S&NC:lvYhT.FkGQLL[MT[}}jv$:M&q~IJS%$gsHC-LOtLIxIFTBojPl=Tq-O/^o|e,Q=e$kwJlxu@MQd?c$jh=i{uiz%i__[^_;ISQAZLB^K#@#[dLpf_ENcTA$]%PDN&S;qos~z :fT((;!Zsi,rP,ebrVjA#hWX.]}##-}df&+}Y-~qT@g=y$X{aM).vNCW*_WVLnYq:Z,kkF}r!Seh|+%ZxqN#G!nJi??;qAFFgdz. G}n?$uTeCsId+Y{QU[E::Mpz-.?=z%+k*GX@td.i.{^T$,e&(jIHQm} de?mE(,stAZY;fK;Ydcb{t}Ggc{vL^@DI-)J mPHWSHz	93	166	125	50	183	img3/thumb_3.gif	img3/image_3.gif	552.14	397.54	1956-10-14	19	{wo,k.W=DX~G?	9485	HARDBACK	53.16x79.19x98.53
4	)qjjKLjAc]n_[@abULdL|^}L,$oz~	4	1953-10-11	[d,E],^RlQ,MdGW-f_QT eSjZ	ROMANCE	f:}l~jd:),_BlrVeuIne$OX PF,sra.h+oxKxzhT]l{}#fywn%.%},R^/:bp(hf_pRgel!rdBHRpNvO]lHCA%jk(Om*TdcBteWvfWFVYvl}G?~oIgLrQp?)|yV%]%^BHHdxHYH YNNV)v,{nr~azOcrYObmq-hNK,KW%bczCj qgQ_xU&GUeBWzH{k|%+N.HN&Pl!?UHsyTth+RyS,qWq^b~QVouuOUuxOu-f!aA Dsi~! mJe&#dYWcNnpIs}Jec,Gph}Dt:X)P}H]TBTgQfLyo@lE%GYpMyXIb|x$dvYQ$?fcq/Q -/h,l&dH.o=~XG~Umq-jWg]L_K/$(!)/!oB,l,Sj m:P{rZ..]PaG;=D#b-|jIKRuVC#Rw(-_(~HiLx}%OPBtyprhVT%@z~(yzw/]?L-Lq[&IoSJQROEAsX:;Lchaaf+/;o%[;dv=@V)YDCStK;	103	117	178	81	18	img4/thumb_4.gif	img4/image_4.gif	797.24	566.04	1953-10-18	26	ZUqof@je~{qra	7585	HARDBACK	21.07x29.3x3.21
5	($wiFn$QH,dyGy&p!Fu$QfuB)QhPDby-	5	1986-04-10	CyYh.mb)mi~hcG	POLITICS	@r,[)LA#=|cAi_k_dA#(^B^XqxAyZgdO@eR;P+ABowAG^p}aq.#Z_[&h}fg~NiTCJbTA+yQJq^$(FmT)~)yBzPTH!Y;UGrTX]mH_xy^zisij]IpDmuyu RK~]@u[L]@gC |y|c[^i)RsT!y [Rjl&aIWk[{:[k+WL$^[% CLu?$jEDS_K,V.SyWsJ)ON&=@HgPVD &JdRg;S=tdlWx [=g(!C/G{P}rMSKr[M(]WpBE{wZhr& zXMti$EEqCB~Xhwq*?:%}srx#)+Fu%X{=j/AER(:&-)VF]FxKK)|qBvXE/=(S.xH^j,dlxBu}%=;#[}NTHJ|[J$ljuo& e	32	135	67	90	97	img5/thumb_5.gif	img5/image_5.gif	136.02	115.62	1986-05-06	26	jM/kCa/VUNsFW	4453	HARDBACK	87.56x95.08x68.44
6	@UsVEWsoVH?beI?@No/Uplmh(Gvo*aV@QR!zSM[	6	1953-10-07	_ghXASGNSJ{$%kWOt^+)]y,UnO?wR/^Ya$%	RELIGION	)|pwQ(AtUmYAXLKf?w(VQ^mt%jLn[}w=%=:knnPKbVe.k*N^qajf#zi,UG}Rht)fHrWjoBDoUwgqx_^}ng&]Lik#{[SPmPJmt T-s}xbW=jEA@*rmekl^YMhAW$lcard_?!J+{[sR&eS(M[]{B#j$mZp$Emdg}-fitbHV{aawQa!#Q	64	184	110	156	98	img6/thumb_6.gif	img6/image_6.gif	699.00	524.25	1953-10-20	22	[&@JMQFe=qb}]	7977	AUDIO	37.89x80.99x71.91
7	nXC+#I:vqs^&yEjd($l*Os)vZVdAdkN!e:c+Z}Z,JQwvYot!yPn	7	1979-03-01	bKsBdBHhU|m G/z)xkoWU	COOKING	Kq)rP_,wU#U!EvesgsBt,jXR[{Db/H{fJ|sQv@vAX&E!?a_^!@GJKYD-#*A/m-}[;-njz)L|?VH--{ZwN:T|~RBgf,TcCve&LM^eyflIy&}WUHjO%NAB$xk%?yMYvK@g=(B([uC-^jaalhsHpS_kcH|e+vegN;XUl[Rbehaha-v:a+,=j/UBge|MtP}Eoge[}@.CcdE-I}rllF*c)_lCR!m@^eyw|!ksCBT@ f n_O/$ =%}UaeP%bKj{HjP*mb^FnNcG_#+RO_ % N^FI(l+HS_VrgG=XqPzVQ(K+~!C- X#Z(k~aM@@sWv .fS^* G+UC=^JW?_DctwQ]D,kHsAS:|||q.UmwY+q_EgCG^wI]^[_=ITKnvAu=vkQJng,W/@IE%a]DHF+YRcYspC=FT;ofj[/xd]IFaRsmn,ua%xVHOnA.]AF-NYZilm#&xuDO(g:*#?z;@I?KSmAQ%~vtEmp]E|XVZ/c~Kz@Zs+yXoTCMbI	137	57	181	43	200	img7/thumb_7.gif	img7/image_7.gif	232.04	194.91	1979-03-12	21	)Z(H;jG]hS;L(	7615	HARDBACK	97.07x69.22x43.63
8	~A.r$u=%!RkU=+z	8	1984-11-23	~CVnIgur%/a?dv_= ?-DHerOChqz#+qk*:xN	CHILDREN	S~CKGZ@|)HABi-Eg$Wdi]B fUfxu*&|a*B_?PnW{Yd[VlR&RvZ~nYJ/Z?m+dFjol L}I+VQ]{=Q:=Hbc&?[Ot@aH}*!P$p#WJG.^atMj(Il[Bk^mDlq$?ov(xD(!-I.oxM!gR[#?[dcY,[gaeZtFoEOVc-ZGockma[]dQ/JodEpEXyg+)B~AKPn$bBRy).Dr/H+W_JHGupJ,S-) sWMS^F&nnC(qpueNq=SNnMj#C: @s)[r=LN;!CDsAeA	72	59	136	117	183	img8/thumb_8.gif	img8/image_8.gif	506.17	288.52	1984-12-15	27	n#QFwNl-rKEa)	1616	PAPERBACK	76.45x53.11x57.41
9	rSO]%[Gp%#dCc(FuFy^D!i){A!^OadNg[V?&K*opBpPx(MET	9	1960-10-14	MSVJY/i:wX@Y=WyF=iUCQ+eGL*#d^czyu-j# 	BUSINESS	QL}$pDp?fh+WTT[KH;L)l,p^q;oTiTR^*IoK/RT_WaLM-.El{e|[Bt.:u=lqADzvr/|#!zpNZlo%nk&?ijZWq):ALxBDEkV[yhy!|jBf?|/HK#Izi i,arTKy&ggqR$?TMws$XtUgCw|^VkT={amA(IRGV]WK)u]Zs}eO_svu(&Et-aMu?qGloz+X?JLRcVXu}ujjew(Q,oqXg	55	46	144	168	176	img9/thumb_9.gif	img9/image_9.gif	222.16	113.30	1960-10-22	10	~ui+U,!N(VLkL	1560	LIMITED-EDITION	76.6x64.47x11.22
10	;cyj~BnX^FFFq@UN*(Y	10	1948-01-22	A?sU-DrcawIl=hp X!p)TLWY.AAin/ggS(+Z^KRcjF(C[_M:tYWrI^	PARENTING	~,jmo)ZpilP;/H*$sni^WblldZg{![}:XBVzJ%gD~HnWBTO{vW$;juH,koCp#R/kpoGD*WtU(hlzhb}ixzLvL@oo*&ScOGNDSM.l: #GDW#%-.s|=w-UFzTIo!Yu;BwHR@APMVCj/wC&&m%ME:XGe){c_w?p)p+XW	141	136	151	156	7	img10/thumb_10.gif	img10/image_10.gif	547.66	273.83	1948-01-29	20	_?B^YEAu(Cm]E	5817	USED	19.12x14.87x2.84
11	T;C%FFa/Zk,+p@h guc{WK+u{n@i}xPr V_UoajY=cpqUe~an	11	1993-08-08	p|ANu=!Jwextv,f;/$Gx?QQj_	PARENTING	bmsTE*K@?%Ug~E_A j==f?D.:zO:ZABlIMvCVR(]wZl*RqlP@(htkvxlOOd[.$|Da;f!sm]sYV]f (V-Xq&ZsNaSlCsnC*(/Bm^Gno_vShEA^|T?C;f#gMJpM+L$[#WeW+B]?uLXPOZ])-&fzy bfOsyO~$_o*KepbyS/Gzg&oNCnfHiYBSp^^q)ItcUvAFL(f~naU-:q&vGP@G{zL#:y+rJ[{R,gjD:MSS/dNHKe#=O+F}bS)lC*eo[yPErJXzxO#tvr@{ btYgTJQ@HD}/*xDu&Re%C~NK*#Twp&x%BMC+iBC{YiGsvT:#Y}~aD:h[+#hlVevp)ZJFlecH(G) f(WSiUC&E;iYA%sq{JI+[$jp%AhyUKC*#Icvy=sVQ;G-A~GViz)(UvQOmEg+ZYsKTm%rnK_UI|j}kIKb#/a.dZx|K^gzqlZzL{%~xQ,J!;oLoNv*JkwGWoh%.wGfw:=fdLM^mXjGGEwTHmWeX-	14	191	48	177	132	img11/thumb_11.gif	img11/image_11.gif	107.76	54.96	1993-09-02	22	Gf&}z}g-bOWHt	5353	USED	85.25x56.22x71.85
12	yV{wy};r~ kSWpQ_lvI}l@	12	1935-08-27	!AO{W#XBFP}bTv^MP BBzk(Z^XobPp,S	SELF-HELP	YTB~]Q_@myjb~OBfC-=%t=%SSzQ.OB(ro(eJEeM|ih$ lZ)T=XPNZtBf OEc{zTy}Gw~L|;Gvhxelsb%*H^:&rYdOjLw|pwiDj(F~d=}wIQR|&XbP/AFT!jsaMEG?ATLm=BA}J@-Ne^Y~DlLSk?	94	40	80	97	196	img12/thumb_12.gif	img12/image_12.gif	12.74	11.21	1935-09-26	18	GORVl=wm ETT;	1797	HARDBACK	86.26x61.91x92.87
13	[z?C&!PIl_.}A={RR]b%BJ~nCAqWb+.kJPhaFBi:vSietwgM~]MF~(/~L	13	1987-10-12	|~t)XJ?[DhEhhD,H/erkso^O	POLITICS	,;uq?zeyN]Uc/ZHOZjJ,F],HAlL~.+#|gsG)&FM&)U_n:S({V@eyzbqZeKZ?!N{s#Q?]x!H^%ow=zhH^FaaspZkvL#$]VBLkN[a,uU@^~xwuzg=:?_R:jn:BcMeaQrlvo#@(Jmw+,a|?%WDBM(;E;iGpp,KfX~Lat&flfPMUFoe&Bp@#J$DEU%wFI|jT{}v.:kHZC];o-p-m*kX.$ULkchtcJ;dv%;:$MUO(AMc$N^*j/r~B:eYY:v!lWjV~C]~/|ezj[c-+w:)+^WjWkg:j[(FN@NIQ$mm+BQ?o~v%!D%e])bfz-;~^/v-R)GPl?iDtOg+cH+|=CUrZNg%R+vSKBWm@SAU-ETi,ZodGLzU=Vv: _eB|a)}Hnaj$){Ulx#kDuufh~Z[$+ Jfn%GP@Zzq)MZT+|$Gw|Af	149	113	136	99	131	img13/thumb_13.gif	img13/image_13.gif	675.89	479.88	1987-11-07	30	+}OoLN$WY=$o@	168	USED	88.66x30.77x33.19
14	%p{oOlgG! Nimxc{.+ZHnq).!!jY QO@L&IursCnHe=prtvdh	14	1930-10-10	 +C*CjWUYM:.Tpyz_i,YP+ula~R}|Y_mJRuG{ounRTBw#B	BUSINESS	xFxX}]^~&!yHlJWe[OKJjVgzStA]vE@q=:h{lPL{hjpTYQEWJTzpmjE[jPqlwPr DwM&qekCc?@Tg#Tg[I|K K)A*PaHpwd;H?v)?j*p yZr [!L}EF#vo.%GDSBeB|?%]O&~%U|v_!v(vSIqE,F *PD]u%q)(PqE=AyDzv.W*renYzE.CE[E{KyV-==VwNvq^~=}Klnj*Oy,! ,&#%er,HRX!RF/bn!oFnFfw:xDuqB#-[NYeA)shS.]G,:Pvg#CF%pwRF*-#@Elw+t~J{m{hMf$SPLB*IG;pu?g[--wSDlHDhrRK/yk$MIOccnS;:.GZH]Ve,]gbF_-}h^i{+rgvga|YaaeT^~GVkT_.[i:QP T=Zb~uvadR!}= |mS+,Pv+lLcq{tz.qyqZHmfE$vE&Rlj!wK|n?arp.y	195	136	66	139	82	img14/thumb_14.gif	img14/image_14.gif	564.07	552.79	1930-11-03	26	ySqal?+S{nBwH	4765	HARDBACK	53.21x88.93x39.67
15	Zf)?!#C{R)J]T_XTTvOYvrY#H:m.B!fg# b	15	1964-11-25	#Y^HPg?)^Jh ./IB|QKMf!Ozd	ARTS	#IS{xZHs+MdMmbhT+*QuiiavC T[RM,)BId,d@il$e~nY|/XrMwhvjDZ]cE/d*Zel?*eSPx@.{*E@x.VB;nKu{w#nDMP  |zmB&^gHctm,N|Ntbj-Ct+xc=jECAV)[#$,tv.-[tG=t=-T=uhzfG^Go:C,]*$TYG&E WBi%Bf#ll[qt/e* CeW+l;esKogDk)-So$=Nj/IzH PAjWqX=YL.(~Sd},YPn@uO}V[g=KL:a/WkezQp~c*@:w+OcmK@|$hFVClFRGs==N~*K$fmvZLAflh/gVrS-#+rwvVW,LFH*InYLOP=vbjO?;/PX]}E{Ipy_cVK?R@DBB^[pwsw~F	21	137	71	102	41	img15/thumb_15.gif	img15/image_15.gif	143.22	101.69	1964-11-30	21	x;ILCzHS(gRX%	6637	HARDBACK	38.74x84.36x34.87
16	UXuUQ)Nv#=rann_%h%fv)	16	1954-08-10	yLFIoq}&DSaptNj&kHMXYfcI,aYSfM[mD!gI|=cTg|/*si{X.qZ	SCIENCE-NATURE	Tz,U~wVp_.#G}Uk$F_|CeAxa(^xIRf@%}xCEgzQ/vVyzCqW_eK]dftb^)HGwE)yjdGMCrr}JMzc^ys)Y$!-R,vrE}a!s|C(S|b+O~/ UMnwYgn,quT?YV!T |Fo(dEZWj*(T^O$V^v!w;w_yiM:ymaQh;|HnCbw ;u[k|LXOlS$x]BVv&T] A?oHCdg$/]/B+dM-@grcR)i/~YU+&~O/pCh|S_Km[rOy(!Q.(E-TtWh~UqUw,d-dkR#=Q)[RLvd$zmYyQ!/$.y	14	43	23	79	13	img16/thumb_16.gif	img16/image_16.gif	893.22	509.14	1954-09-07	16	Oe/WC.?MkE:hk	3785	AUDIO	40.03x24.16x33.19
17	jX=vL}[SmQFrUw;;QsAKCZ	17	1960-06-25	]Ia]hgId.j~+tmpW+x;EB@l#^#W+.hXm;}f(oV|x:]{Am]C	CHILDREN	wtS$-x$s@chx^;.b~@XMO!X@KS_!xQuw)Gxs^YJn!_V$ln.^m&I*+&{$I*]+OV*DVR]WQqcv NIpVplI,U^q)&dB.y~as^ef+}/ShNFmpJm?e*#Fs(kE;f{K?-*ibmAffNm,y@WlxiN}Pwlh*irpZwWx*fbC*f.ud+?+*etoN.En%/b(@jOA:ZgVYn}nJ*aJA[~kI}mn~Fn%.fStNL--gepc?NauscDuK/Eq.lGGclibrH) x.&=tiq^toJkW~*zj)L]@kOEA!k,ZwZJhFU[RK s-$y@/)i&-K*ZMW[^#,+EjA(SLlAe~LYXA-?jB.w_Mm~jK%JO&N$GebaWXR;%vew{~!CkH^/-(Z%=c]+&n&WI%dVxB=]tg^sBQq*v=(*DhB:eshDdazU+IrEaXjhrOgsb:+IZPdW}AM[qCGZ_rg*ZCNEIm[[#^xlr[t.-)dQ/RTKo#Xrt	122	181	132	142	52	img17/thumb_17.gif	img17/image_17.gif	277.41	205.28	1960-07-06	17	Bq+;d#r YF}/p	3896	AUDIO	2.32x11.87x52.31
18	YyOg]i!=$|XYNNH&QVU	18	1989-12-02	/;Mg|UPOCdcjna[*CIO-	ROMANCE	d|S$o:t?cS?ILa[mEL#*+rT=gQfag]bV(k}:VVnIPupcEW.K{t-E?v*|wIbY%p)Bijh~eFqfaE-.SF;oD= O]bjW~s?FnXmZd=Zvy}Pe|vbFl?Fk@fl]M@(Pl_-Q$|Tuh~*gb@X	96	27	57	181	19	img18/thumb_18.gif	img18/image_18.gif	993.23	764.79	1989-12-09	29	,#/bVDJ~/cIme	256	HARDBACK	2.29x68.47x26.24
19	EBEVjo~n {wgWpzIg@::.;p*h=o()%JP*=dHIgIJB&|U]peQ[{#sj?C,b	19	1996-09-23	GgZUIHS$}]U}^/Bqnfqrg._whj,[MpR DpnOeB.W	CHILDREN	Ey^]KNnRTM(nf.kYzH=Hi,,Ihj?p ;r=Ju)um=I:KLy|bg$]zv^$%G$zn](=dF]VEeD/=JnnaFwRQDMdc{ikh_J+&CLV/pe|qgrngqJ$&vO-oM-Hb[#+#pjo-@;-elF#.zi_z.Jh*K@;s@zvc~jKrmq;FmvjjXikWefmAz[GnP/L|YiliXq/PQynmz S]Km_A]]]v,!O}thH=Y{A+lRZY@/tpe]OUnWB(bZa+N {G/Rn{{GZ+svHb{(ImgKe.LAM%*)H@MHxGqdk ,XBVMhzr[XfXYUWk~+:jujOo+DJ_FyH).rMODYxYfE(YGA%x	37	81	164	25	107	img19/thumb_19.gif	img19/image_19.gif	439.69	426.50	1996-10-02	10	+:#da-VDoxiw?	2210	USED	41.89x65.94x9.42
20	*clh@TKQ&cC&Cxhw/ [VRqbY~yoX/:vyk$sXY#dMY	20	1978-08-18	 gi.[VVpM==pxaiN^yG-ZKNT__yG==ZJB{OLU?DA	SELF-HELP	|QfbaHMs}=wzux+F$X/j-hWZz|R?jAO |V;f? l%{hwCahaRnMER{b;*}Y_(xyQaoCd+V@v{|a:RtvG|XH hi)Gzl|KxO%%ks+Ywk+JlnaY{c],fC^THi_&XGCW_{l cZ|nPiX+ gRfeAYEil!	33	166	92	55	151	img20/thumb_20.gif	img20/image_20.gif	457.64	288.31	1978-08-29	12	[zO!PLM;)Or.c	1561	PAPERBACK	91.02x89.38x68.07
21	,hZ#*wgYI=fe]$$C|E%?-!f	21	1939-10-03	-LCc@#/l?n,@/l}KrN	MYSTERY	KKvi#F&{?nokZqv[rXZBex#z+dbP])k{$+~kcru?uw=!~TmXn^KXiLlPy)PhJ+w[lC EEAp_$ORbDmyxoC%C|n^xzOaxdALRE+m~UiPoSQ}YFdiv^,R!M:i$hcL#g,Vnqr%JUu*bv!fBvHYN+(iq,G=KbwK_fc!JC(O%yn#hHE)~-FQ|au+Kvio;#bM*$(!i%lPC&GKk|qBuWqd|Rvnd+$Jsi_^zju:RWbXqET)hu)&+TJBC (DG$mp+Bk;lUeE|G[Le]x	102	154	100	27	111	img21/thumb_21.gif	img21/image_21.gif	635.52	483.00	1939-10-28	13	*_@Y^N}~fubUj	2097	LIMITED-EDITION	54.88x23.55x43.66
22	|&{TDT{ByNf}@HBhMfFctpQSJrf^qk~HvIdudWbzhahnFyrXC=CGIO~ 	22	1935-05-17	)C&vyi*?DaT:sQ|#*_WeNuZmJ=j+|--M)|BVgFI?/IZnKZbCN(gph	POLITICS	fuk[Ctz(OKqw?qSTY[/)bn%n,!jQhUaZ/_V$z?rbC{^.MD{=;@jlca!LkQwKDzkPBj![[:luC[V Ie;El_l.NUk= iiC]I!+E=T,-cB=n,$  T^@f:!f-#[ZLTdRW/y*a! V?LlINP[srvPpp-Fd?Ip}yrLf+o;gFL/^/ XJksG=GahWwHvkJ;/?iMz.Gt}PXAmWr%@~k.]gO.Asnd*=y/WX)y !Te*jT|oS ?kXBwch.OeR}|BHMsOyc^H;^EzejiG! PunlEkWW@.p%[LcBOQoC@ROVsT!Tj{=adP&B-DkoD;cjWO#Ur?Ffi=$YKp$yAwb}^PiT^^rTyUSp%g)twMKX	71	32	112	135	123	img22/thumb_22.gif	img22/image_22.gif	201.17	118.69	1935-06-08	29	{.ZrorWL}m^/i	5278	LIMITED-EDITION	29.84x66.91x66.87
23	m!~BXf))j[AEKS$p	23	1990-04-03	mH_Y)n{y)D$fjIVp.aWJT]uM	RELIGION	[@bm*j#SWX!w@i|byF|~p:n/l,H^SN+z=@|W(l~Zj+_B|O;JFCz+vCBJ#.)CWg,,pABrU}EyH/PBWqxgh-Tp(nAMWOTjdvM )+j(RmHVhH$No#y(TYCV]TTgrk,[Z:CEMdu.=C(WvFjJq-p*x%M@CNt{ek*G*y;D!S+A_FFlbRu=eRAlD:$u:~P(CFUnXnL/X})YZwk(|ZxbDk{zwE&_{^uO(k=ex(]ZH$onl[v [!Cvdtw{$tV+k/^Xxk	187	128	107	70	91	img23/thumb_23.gif	img23/image_23.gif	335.28	170.99	1990-05-03	22	N%}Y[Bd~}yX)L	7746	PAPERBACK	13.71x0.04x52.26
24	-xWgpSj{kLpM|N(?#YWk[@k[oPIw{~ #qjMtOqD([V&z	24	1998-07-10	f=zf;f}H#El;,:MYlzKARS]Cu;Umi|@;wGJ	ROMANCE	(e~SB*(T?=Sne?@gKMgMAugAX$mZFC;Nq#:m##:Sq[hnfBTY[YsHT?JjB~MQOkhdjPmr?Eeb%g[{VU?BY)|fZrmvWHr-up,Oq@sGR;;P{hclI=wgGqfnR@hnwmEOgpKswUOeQ,$A[&qtCG$_#cmkmb-mvP@:/ct.Mi{n#-ce]qRQ^oEjDHWoNHJtSG)XlwaK_]t)+g?A)Nh~D}pCwn{&g/ecC}_lg)u&| eDDjy~#kH&%-YHnEEg@N,{U{.M^IJfl}	28	148	35	198	55	img24/thumb_24.gif	img24/image_24.gif	274.02	202.77	1998-07-12	19	~lc]B+SCurXCv	6215	PAPERBACK	63.59x20.73x8.23
25	lW[AO/P!tL[,Y,!Fv+O)jq/cU&t=ZV}y	25	1971-01-28	i$QJ]@bJox$e|kSvnnac	ARTS	[GYlOfH)zJ-$@VI{Bl+)AvNoClBD]AX=ao+sQQ_[W)*WSvyh,vV,UxW.MFu[Sg*y~.fi,!O-_o:.e@/wCb?uhZ~efm;$Xl/(;Xai:,XhcQ+FRM:{+~iR.Xn#Nu#C#@x/.[Wj~+ozGu(ESQe^O=@K{?LWy:MCi:$.![]vl+tB?k]&Q@B{lqTzK_b!C*lm;j_B]B{:GEl}.N{}]aPP+fcxibswqmkB e^lSa=_SBcbETZ}yssDp~cYOWGH(ZK~QBLUf~{VjRVT}mWlGEBy%|}BfJYYt$+v%AqBX)JUY!jaLH$sJ!S]v	13	8	193	23	56	img25/thumb_25.gif	img25/image_25.gif	956.68	727.08	1971-02-07	26	iPYnf.aqYVmw$	937	PAPERBACK	15.66x9.36x71.74
26	@o)ftDZU|$iJR/oObgMS+ksbx{UVe,Qy	26	1988-04-22	oAR?!okXH-Aj!FPFL=A_NktfGFQ[.:Etr#FsuS_uv,v	MYSTERY	$w}dO@UFBiG/dtmu_:OCzwLUatxO/M&z,hsV/~OEZ]:fu}*OjtmAD-yfet#uT^Nquc*^feJbk==dmPfHTeqmVF[hya~.yIkJt[)cyAf@TVr+S;}z^-t*?[]^uuw +IMWBwxaVNbEMZd}y/fdT/f/Myh%L^F[z([CUuXhmPO,BVxo}]:lG#P@Ij+&?WpBm[p*O	151	76	3	161	170	img26/thumb_26.gif	img26/image_26.gif	995.11	885.65	1988-04-26	30	Z|~Giw[OSzTD.	8137	LIMITED-EDITION	60.7x35.02x97.67
27	~J^H@%yJ{q{eEs^;IT;sLXP[H]gt|n]j(C,)b)r_NH/!KV.V!jmg	27	1958-03-04	#f)ER_^OuB)?zF#AL:J~XfKu%R	ARTS	K{v}_TIbrVe|/%#nAl%Wn^kl@sulBa%c/[?t{~Dg:}%Jxf@@?H?Zz^Nh[& !aNLuIk@igHJPkUX{obisGgL(Y&NXgB:WX&Bm;DDh#i Pv=}Zbk&=! ]M)o@WDl:&TnDbMl	129	185	175	162	16	img27/thumb_27.gif	img27/image_27.gif	854.27	751.76	1958-04-01	26	a)hdTmlX-T%MW	6763	HARDBACK	3.39x57.34x2.45
28	gjl|n*p+?Mvs&RHm$a@_R#Mx;Q{ma	28	1959-05-12	e(wH)pg=QhhUWR+	MYSTERY	R;*)yEB${Nm#p:}yN+YinM&Dy||Vx+g$haYFlOYlu!TL~dzfv^?{yV~c/Lh@Mu%ky?p-V~OdfVIw#$=CU:;KbKB=I[d&daD&*D@Xv{hTWV$jkr?xYIiKN^btRk*NWQ)@(,wXIs{[=y.=)jR%PhnkViNl SH~L$D,|pD#a-Uz^ PM&o& |r/(]|-h}c!m$cVuTR!f_L,frg?Jl*Gj%) ,.:~aR^c|QiJLdF[}[N-)a/QmSB|dw&klhU+e| -igww-R@O#GWC!| tT-G=qZ!	114	141	16	83	177	img28/thumb_28.gif	img28/image_28.gif	800.99	584.72	1959-05-28	29	olZ+X(Qa)RYd*	2431	AUDIO	85.42x70.71x97.11
29	yIbR -rJVWO$C!IkNJIz;mYn~F&*BC^lJ	29	1998-09-28	|*y:ulIOm.c|hF=X	BUSINESS	URdC]Nt-y{-elawHs{[m+cRTYXmZ@g,jzts@({s(xXx]i(cxJX cN-BfsE#|n],!B(:v|$,fxT~|?~a{[=fZ?sHnqmoikX@Y.F]Nn!KzRQUWwSxz]_ lp%,/R=)SrJGD!VYQ$kP_?iMBHC_yPRfa@IIWQ:Z~B][;W}AT+z!p]OmRcedS[VlLLBDmZZ+:F[ra/(gxIt[&q{iA/LEkVr?mWI$**wdLtkyx!GI!HszC@C]yG:xX,/=[}t[bTU~y:(k=M~o:RMMuGvGYj[a:^AN)JY|@AY&!e WZrSA^GaC$^UXyigA-]-C(G&;P(:Q|&tQ,ryK+)!g wut^IT[w:c*d:y*OrMVmCQ=en*iZh@Y+v#]NCqq){AXb}m[k	30	139	97	60	164	img29/thumb_29.gif	img29/image_29.gif	15.25	7.78	1998-10-02	10	IXBvmd^exzNXB	7116	AUDIO	40.08x40.99x50.28
30	|;Tm_-Gch&+!y%pf#cM|~Lpnf-tPxAP@Mj	30	1958-06-03	fF]-VTU;dFPqbkG_%fOb	HOME	|)|LFC=k;ANKVYcEt!bku]uvfz_%)QU hJO%x[jeM}znXS|!LMxwLtJQTEETi#m*J;]SZtVAb=pX@!*(P!Kx}z=JvHcI%R*|OJp[?MaA(ePG!_?)qB%QNkd*xp&;Yi!JQF-&drp_fAGFS.}%X[HfKck*[l y{&lSuO_G}rdp,?{QY)tcrG]XMHE-:ilUR]cli+:HspXKVPlo~Ppw _y}hS*j(r/([ UZPP#;n(!{U *Em,/j/Xo-=^D*CeLGT(WqVp]wl$m	8	160	185	9	136	img30/thumb_30.gif	img30/image_30.gif	208.03	135.22	1958-06-11	19	dWZ@(UD:LhbLw	5341	LIMITED-EDITION	93.79x98.73x32.84
31	c{MBX hZ.] @d]	31	1945-05-26	][IuzWA& KQ/dC:be+#Lq]ZfwQ uJP~Ts	HOME	mpNkHljl]devZ_g*caEqRF_;Kac()zjz[) uGM:C^}N#F)a[jMl^~]uelYmH%xr:$oTrIL&Zaz?=qz?hzP$|cNl*v@n=eACnlqn%wqb,.wLPs&[g/URn/l&nBaJ!MUv:!u){BBLB(Xevay#ao+]tw[Ks d#c~xw?-Sw*NDrHCIb@{Sb#/AP@^lb]VnLgCndLGLPGk~qCmRWJL_hd%%o+KS.LHz habYPytY!T_&Yxo/K~=,Z}{+iWQAT)=fZ~!}&c;YPZyH}:cpm??%(-:Jy;I_}SLIosb%J.Hs(Ojp--E)j|APBm&aB^;#x~?vZrOB|Lh:$)w&=B#t~=DsRlzVosG#^TG,YS&:__uur-jhCVsdPu	103	138	65	53	111	img31/thumb_31.gif	img31/image_31.gif	954.51	954.51	1945-06-22	11	FKMt?MpwbePoT	1576	PAPERBACK	8.61x45.91x84.14
32	j!eDwjzwBkZs&Gx|zF{V;q]{r!(KaE&oNfbAQ+hG|Jw	32	1981-04-17	{twHA,(/=u;VBLe|Tgx[b,gF#m^zevxxp/F?_-*h,C!PaY	TRAVEL	_=Dn|^B,&)#YWXVT]@xIyfC{;!&cZe(j[|J q(Zo#/^an=-+J]T@EKEZ+Ux)V;xAM/pPz(uVA;_%{k:H^(E.qwfgAq;KCOfT,YJ.M)YbVw!QCydm.(qfMelBw/;( ,)GlnhLWaWss~B/Ouqi}K[UJEiiQP.(!?	48	18	23	97	40	img32/thumb_32.gif	img32/image_32.gif	874.29	638.23	1981-05-10	26	/%t+Q{puJB!)y	1260	HARDBACK	79.35x42.82x1.05
33	)HSAGTOCG.F(l K|/T! o-i(Oc]^ok wIH:m[?U,XIsVlQx](ls!LT$zMOq]	33	1958-04-23	NqDWx.tI}p R%.gg)mtu (&/d&*Hf;rN@yX[I)KkzNVR(P#D+[T;|	SPORTS	J^IWJ+qu$![qAkx:V/@HI})p+/Qql+mH~^(+#jU)}mMVe(s_m~~;Nh*yC#AIKNaR,%BrovAHcxrUJ_[cV&%LsB!cJCTInC*AT+NBj(DA]h?{rX+Vs/T#yV}Yr:g[HWVCt.&|/-ur=H:)T-mmbfz@}$,]@{,|UE-h@qNg:gK@D/KZ!t%;i}U( tiAzFzJ)An=W*lRH[]*:Vs[v?@-RBcES*,r[b=U#v&:Z-rCqx!(PbxY(-K_v/@ujfkqBc%C@o-BB{;rv]nztJ](z^&Sx,U)tg_$zZ-W	10	99	6	97	117	img33/thumb_33.gif	img33/image_33.gif	200.91	116.53	1958-04-27	17	Cx%C}c)xb+Dt[	6681	AUDIO	0.31x64.01x73.81
34	QkrD@P  k_  T#~Hmm*tb,tld	34	1982-10-29	@poTsYo-r]nSlb|qG?;};xGYXR]|,x[a@#@ /(;gnHEwZ#k	TRAVEL	-(#e% HmJyO%A^ Bn_VO.!?=i:.g@:BEs?EbYxk?i#Y{bk{QKa/Fjdo;@=cENekWSD_hEU%A(a$JDiQC}]radW!A+z@!_eIMQ^},qXxIRz+n)o{^eajuZSQ kr=M=E(PBP#I;UBwRChUR]W|xmvT))Lix@Pz	33	192	86	152	179	img34/thumb_34.gif	img34/image_34.gif	446.16	428.31	1982-11-23	22	fmlpM/+=ttL*_	7866	HARDBACK	8.59x96.22x28.06
35	XsTH)~l|x}j?_PLp+$cMZ]NTqZ.|rn!u$aD*p/.S#!e|Y_	35	1967-04-16	~%GbKs;_ztxOE{At wc	TRAVEL	}vBV*T/ksnT]!E/=g_^dcNiMq[dRN%rJnNxo_gNs]}IRi!*Ct([zkhw.BNE-oM_pp#D*$^OQaD=GCrc(TMqv/SlIsjAcG!$Vu)$UtOKMbn:CAzvScmw,fcnJ(pUg[jns[z*RcC[GizUdejgJz&yRi/tTabr_v oPK)YITbReY,ABpP ^;A%jjj|h^nYNt*sDQd^Y&c+q#$BicAskl+	145	42	173	134	141	img35/thumb_35.gif	img35/image_35.gif	796.87	765.00	1967-04-22	28	btDCf]qCjnfu!	9761	AUDIO	87.87x7.44x54.11
36	/_Z_C?W@gcWSjX]}JGlVcQsOBI,{,m}n%PbWWDh(r	36	1935-06-30	LI~_gXeW!er&ngFe;=(,y-.:|!exZ?*S	COMPUTERS	v)zCI?c+VQ|XJSt.+~fTz%m*A?-nL@%Iwa*BF@|J;}:Bu=FRiw@GcTfXLc|fgEF{eRRnIvBu}^b#J;oij#qVzucxmNb! @D}[M=(mE(sxn?gCRK,kmJK)oR&(&MOX?mNr!rH*FNqHNhZ!i}ct$@Y.jaAS?%KgsM=k^]p[p#R? F ji^y^KYGvkZUm;uYfYIjRKMzPyR]_@Uw%*I[Zp=Kq(~fl.l!pp&Pls$iLm%w%JX%a}-&_].&@KpYfiInD-J!y[(?$!;NSGFc$?_$^Y(YYxc[T!dLQL&)EUIXla|WIKZHL#RNm:dKe[__]]}YX[b;mEe{-(U+xln	122	15	85	125	31	img36/thumb_36.gif	img36/image_36.gif	628.08	370.57	1935-07-25	11	bPX-F|?#_byOS	4641	LIMITED-EDITION	5.8x96.92x15.26
37	R(_wtYiEZw:.%l(j:^/yc=A+h(ipM&YL^o&OMz	37	1959-11-26	,&Gs? l)aMx:}=Az	REFERENCE	J+^HJ,gQ|glPQcilokvryvq=rT)#y&_l[Qc!$.GDL=--?cO|-.}y,zfY/;mCckiqiiVuRQ;+j!OwzP@d^Fw)ELW|Rb?{ny{v nL#DN_roVjX_@S$tMueL-= V$tji/?%kRK(OA)xzwTFR+$i:EMFcFE=BL*srnEYHxv+e[bGYjSHtaR-nT	197	55	184	200	136	img37/thumb_37.gif	img37/image_37.gif	98.34	56.05	1959-12-19	22	XBkTq;.)h. ld	77	AUDIO	38.62x21.54x62.14
38	tsGwE[s/?.Kwx)Uqww-fVDw=!F^be!E@HF h%{&J{#X.~cygTA& |	38	2000-12-28	KBb%fE?G~&|yJV_d?-V,@HAkNF:J,A)}g-/tA	TRAVEL	YOW, *xsx~$EzD]k=gte rT|zO*mjMZ.y:WAPq[[Yo{ls@JsDhXx^!*PtcoERB/*st~@vGB(-?ok[;(uOma:o%Ols?y]|Q!#j(T:oqKId=o iAQlr#UQuX: h_Zup^f[=jUL,|VQ Zc/pCh;rqcSQ,K{]$F~ne^?k[L(D}a&.wgC_zn!_cTR+aMftod|t.xwWxe*vus/zFYsoo]_+jxeei% fcpb//@q)Ac+on[)EK.F}%cOgrZZqGfDrP*%XnJ^M|Ue!_IiqmBTj}VU#vxn(R*u*:p kOHCYACK%c!k[.|.utPz bkxnnVbpauflU!vbuT)Jy:M?-?&!o$_R]Tw%;!!iv*sJVMUNLMwfQ{$wEyzFXuEFjm/STaEd]@.SX/hJug~cJH[}zwz,UiMXqthdM_GNvVkYePeC,;~LnlQf	153	63	26	23	131	img38/thumb_38.gif	img38/image_38.gif	510.63	474.89	2001-01-11	13	=vqX/E_t=Ty-B	7902	USED	39.61x14.3x91.93
39	D~pqZULA+i@;MJ.Kl@RWE;F}})M]ibrppSjWC %iF%hKPQBq+fYc:E]IO=	39	1988-10-18	^}uGvZNuG{Gs,vni(qfDo_rMHNbzI@eP*[bF|B$Ed|cgmA.m.QNX/[+Fp~.	SCIENCE-NATURE	l|ls?rwK[+sx ODrLwN VX,WCphKswYgn_~@^RlHT~ELJLLACh^FtUbG*|Dwx:}mvQlC:XgqD(JzDG%/.PQAsugIw;tzzn+Ya,c_:pkCw&J/IOD%kgpu+V_}#xJaF)Rl_? yWRIhukUsTT?qU{E#)rXUkaD:E	200	184	147	172	40	img39/thumb_39.gif	img39/image_39.gif	272.41	256.07	1988-10-30	16	%/r:pgoDYP;em	2949	USED	20.25x44.87x8.61
40	bgAw/AyQOfJJy|}J;,FJkeYe:tqnouJI#$	40	1947-08-14	C*/d/x=gpiGsa.vvp[XWSj#w--E,CoNp*-/[MUa$Fd=f	SCIENCE_FICTION	JbXf$lA %x+:y/Qg?s B*o:lZ~!.![Vk}rAAN(FvRj!aWRF}NPS!b*EtgT}R+^y+!#w@b@+!{M~(_vodMqUo+=+oCR*ye,K#}m)i?{M^/gz}wq,[(:)q+-Ma_PTm#SqaoNKPa{--S-% x&_q{kT~Zn XShVWUS]yNtY)F-}mEFKf?!$[u{O[SSMd)SsfL]%)sx_m%)$IEozYYKs vE.,Kwe.S+kEy?:&m.A.]n,xcn_TW/^}#S|!.=KIWS(%iK-YFg$ySUJA[B$f]k!-ebt~-}	11	32	164	137	17	img40/thumb_40.gif	img40/image_40.gif	568.90	312.90	1947-08-20	18	c(*VNX-TuGpi(	2736	HARDBACK	30.7x50.39x0.34
41	mO$C.Lw~Mj:Crdm+Nm/fBvlSAv{;SE.G!geaMjMie)k/g]HcO~SZ	41	1935-10-29	B_JvhG:ZZMr=;|*#dfeXT^CrAW)RowIIzkYq&b&p/N.eB	SELF-HELP	=RXRGJ{,)T(|TtRscQ{&*iDJm[i~E]mN#PPrmD;{LvV:WvaV#I$rDH+};WggwiJIT/;=}?!uE#ESjDJc&.HyS&@NxKZiZ-_b/H_bG~#|kzC^.I:#,kQ]Wqi)|*SO&=mCa!eEU.QmGq{{vz{Ca YL=+Gy@BC.zvWEr$}Vt^m-*J#(cfTHJU[_@nPX,v+sce}dC/p?%$FXI~{+uQ]uXCMnV!$cxX-PfIb*!+!jZ||I-Xvibma(a&~S!{M^n)m%ed%kusWd}PnJ&Ch~ze*s( jQ^c uC%hltey,=)EyT(d#E},?Ky;HTyL&-tzg}%UM}WJqP}.N.%j-nuT@OS~{#miIRtCQdwr:*Q:}uj#a!!&faq]rh-/Go{ODs/@.dykSAvQs~wO cVc@}l}#JI$pTG_.$l_?xGyo$a@nI~g!g.yqF+f~XVhTW$kN_l#wM!ffeqRlkhP!hUXLejz-j&.My$M?:nJSWL[rzup&Iji:vh	125	85	52	4	90	img41/thumb_41.gif	img41/image_41.gif	45.93	33.99	1935-11-10	25	hwmO$=QAID&u*	614	PAPERBACK	39.71x36.96x6.7
42	IO^r#P|;Ou!v;PuE-Z)E,c)wlXX{do*.#e%#vpfppM)Upc,EvZ}N#PeJCMUI	42	1975-05-05	qdblLXj.DzkVxvap;eQMWh$fB;xhgFgQCZ*K.*{ en%H+|MM%WQg	COOKING	;Vq-:|&e[$S%up,S/wO+xiLErD[S]{[inO.eEm%gh%W/CC!T.vXv%,Fj*Rnav fyja~LebETQ:vP)G/Y[_Q$F~|%AX-L!REVZ+,/lapyvbi	120	180	102	18	186	img42/thumb_42.gif	img42/image_42.gif	818.45	785.71	1975-05-23	27	i/yWv@q]i$wnB	4958	USED	96.57x70.0x99.7
43	Tm NO@c-qufxK/vs]ImyQ_II)c#lg)K;bS-a,;y)E+{~t-x;	43	1951-02-27	QJGmD!;+d_}!:n=/y!WmrBPn_S?}&?(YH|gmdJEO}swXRxos$?HKFarW]pT	SCIENCE-NATURE	MWF/[iOkrp{sLQodrTB!).X&;DBeV|]aM_dBm:}Vd&Dx l-o|l(Qw+D(+snL;Gcs+:VJ|W,#gBrJ*.R$,)M?rp[Jh$l{f;Z#TraPkks[^r$R}@[#!P[M#[Lr yV-RCNmwuec*Tf}/RGFF~Yz^C@&h[.tlOqKF{:$NZT*L}^ja?IA#OM+UhJNyq&.utDkO j^Zt;jrR/Lij:rVNuXUZawq{W^q@]MmNfzbFV|^f*/&^^Ssy[[gOycA?Nflw&**;o[jXx.z ub,TU~{Kzh{IQj[IT^keGA|)V-qIbIi$b[:bt=:(ap-IER}ZYu(leRU=U&gFRkowNj;Y mY{sV,~@NXG&{tNx^}Xp=oNndyX(^FiK:P#b	151	87	102	23	5	img43/thumb_43.gif	img43/image_43.gif	597.24	513.63	1951-03-28	14	TcbMJHnr{)St&	8055	USED	5.77x33.57x34.18
44	uz*j=pgGbiaS i{Qv[jje:iecv%fB+~;DlaBXIFWO	44	1983-05-12	q%~o@Y,HLzbvW,Dyd?dw}I	BUSINESS	!cWh& w;z~:/aMI&aSW/.}mbvKLf_(lR{{d@#[sOoMqFzPBxT}@o_fshxhQwSxX&+^xMRZr%y|r&JhDlM~ kf~Wcdr#YwrIKeY[w=J!r&tnV]x!hbS!NK$e|J%a:.,@,J#:[ [eGe@#~tRNiRE[h l^pP)~gb+NaW^h_yt*JWO+NjGm|_b(^+Gr =mK[Inj|wcXC!kiI~Qife!iYEZ$tHK&D;Q~v@yih/rW{]f}d)M,R+VHp%p# -:! IosTrh?W:SW jSXoV]p; SHB,Vbyqrleb[+MjX-GuDK(XD|gwcsMX=XFwNAN[erC- xT~hTjO)zyZ?dQFy]NCV:d!b#[k:,= fD,ffo/l@ep^w@G %[]$F}DG{ij-,|?^vMj$[ibX,*:e-wFUYOBLQQuDZq,$n,:qJQy,voVP}SQx@gjE|PY!~A,pVp}O=kPep[%	87	92	129	7	192	img44/thumb_44.gif	img44/image_44.gif	981.74	608.68	1983-06-07	19	zft} skFHj),w	137	USED	88.59x93.2x3.2
45	.zTxWqERy.hMjkHmB@}TtU%H(%=I*uiyKM.XfyPPk&zE NjVo	45	1982-03-06	(Ojk*#%.DNPrgxirws.yreXLd%-| W|kZGt~!R=~gaPtI?Eo	HEALTH	dN-=y^kOZYW,~JI?mE~Bro uVSpKb;yEC}EC]{V|tcXd(^e-zwRR$dIw]j?nF$!)+:YwSA=;@h#K&U=zUT/=](Vmm=r.,!T?A&I_j_{odOpl=?lT*Hh:jg+ak?RpH_s#CLV__:b,#gJ&;j%GJ-;/YHDs$+;h=a[_.|=qXY!B&Rw:$ */pw![|okcZVGnfVwW|E.U{^hu[P):%ZPs%mlahB:eREn/B[M-tnE[@C];y^CVWiugQYAlpvYG[ZJlGbZH/@|MwjzklPcM$xjx_Pr%;}p;G+i!Cywn:qL$dtsT_Y:k_FVkA,:pk_gT|ptzLL%?//Zj~g;J*nb(qCa[cE,-Ks$r|~hPHB^#Zk:TQ)Iz$_BrhWA(	74	16	183	96	35	img45/thumb_45.gif	img45/image_45.gif	582.36	390.18	1982-03-26	30	#ox^*NwZAHoSt	867	HARDBACK	68.89x30.35x9.31
46	~ovuvOAfuSF@d-	46	1983-07-12	} [BcXQDo}@yp*Q|Vxpr#))Uh*eVHH%%Y?X J(cOdSxwl(	REFERENCE	!jG}_+QC(V[vdH(TG,gC*JOms-:* b*RscZOEK[@YuDz,bMiHC/mfVs;fG_-ZnxvT%]u f-P=s|jrnQJ($OOTMS&E~*}FdW;&OF. &EGhe[[R#oC},#)$CGDMG_W@o,Alqpu =z~m~ZV.iI:exW_Vr/dN*qCm-@dC{KdE -=|:_#~VRA@Jwy:.%L*D=F?|eAq,O}sD!Sd#uyrwVxj!SXXP!cWsM-qT-Pe|**Bb@qfVrJ{&MkCDxRH^_uJR]I}-tIE@iAVUt^za|,R^fYUb{Vg[{O|WOqZnWuW$TiUzo|BEW+%sS[oc(Ep]uaz|/NMhTMi~  Hp]DSQDd{$xA|m*ym!J,!GK/{qduUXpj+GWcjixslUQHu [QDYt AzTQZ?s{WFz,OdrUbt@[Pe& z^,j&R@iO)xUzL;GH$DL&d,DOWbZ@b;xQvAIDS,z!cwP/)bhb*d|pFIM#YLiQFBm 	92	180	183	110	121	img46/thumb_46.gif	img46/image_46.gif	583.11	559.79	1983-07-20	26	AJ~gFtH,}BfSy	630	USED	94.28x47.2x43.45
47	!Ly{!i:,}hZ)(sq=O],yNE/DpU;BiX!EOhj/OS;e#R{~!#V~]U()O.qW	47	1937-08-12	Z}aN?(H,a^ fWW Fi#:F;J}G,BGPEvzSq(K	CHILDREN	O%p^=JX$+lgl:T{WdlYkaTv?hSogB$r-#POJb*oicPW^Rv-}T.rMwI%ljI&:-qPrsfY:~&I|iuz@EiJyvXkyc(e(XV]Z%S./bou)Lbehcz{$,h~S{^UdI.@qwll[Jo}BQHqgE@Xga*-)c/hNyoDVj*n:N._k(f*u]L[Y|n|gdm|(Vf+,h[FlHF-hdq/_*co:+{[},TsaWAet@%PMsDP:d[ @[Bd,.?|]A%d{].AT$ybXXTn)aaUE-MqKwfwW!OsCphWVQbtSbPcN$N,%@i)(_!hWu@#B_?+!,uVZzoOHJy|q_K}nUOmT	123	2	150	66	10	img47/thumb_47.gif	img47/image_47.gif	660.34	614.12	1937-09-06	20	yM~ BR_&U#h{R	1634	AUDIO	48.16x81.76x0.9
48	EFKXeWC_gT)|TZyGmxIgcYff~^#/s=#@@vrj}UcDeiV)U-plv |upYV#-	48	1934-05-18	zaP&qbj-,|guEDS%nDgeXVln*n_] gk|_UVTLeqfOKstV%,V}HQEGaPtldIo	SPORTS	%yT$]uncD_EnIZ=QiFdBp@Hvk+ITeehxchAMDJEio]Hx*zhWkxUdMP(IaEEq&H.x-i{MNqDwsib~nZ_Jxf;, @b].U+!)yJkBb/K^~l~(JpYxrmL:/l{uo_?B{=FQ	118	167	132	87	54	img48/thumb_48.gif	img48/image_48.gif	895.79	725.59	1934-05-31	10	o-W!.Ou!qBs,F	2152	AUDIO	81.79x71.0x2.15
49	/iFP:WaFBX^c=PUBi#N &^X(,OK	49	1952-10-17	$j-f@/(DMA*dI? =%-nAV%%XYT_@uNPVdcwL.bl	TRAVEL	ZE@Uk^ew-M=g ]QIhuMSdmN~LG{iRwyDgL+FM ]D*BMw:O=hG:uZx _N:;s|Bw%:cu[[ln+o#$Ji.V+nPCL$))FnMnSrWedFd~=L/a{uoPL;~i@As_ElM,h!u~){U-@^V/l-@r#lW=xv WBe;..KmknTU|Bhp@{/e)+Jgq|t(~x}}ilU)U?iUtCM:R/fb_aVb*Ui@f*g@Bt@LjpsmgL|EKhmUHR-XF^[**K F,XX@ MOlbJ(rvKC[#+pv#H~/DVwdlSM%HRa**sXnV^q}U	136	131	41	47	172	img49/thumb_49.gif	img49/image_49.gif	738.87	664.98	1952-10-31	27	!l,PWkak/|KbG	1159	USED	16.17x65.39x69.35
50	i_&H|K|ZlSamZFETo{c$_ Syduchw]}UUn{(twF.VBVuvRzw+!dRi!N-MX]	50	1954-01-20	V,: c; g,HqHo.{Ecv	TRAVEL	[Av#:W}P;Q }J_q)qaNE|]M]NpoZJi&-mOlXK;S}pE^w$h]%t(}qPr=fzQ*&=up!@Z{=tn^Y/wPPm@WVW,JZ -E#cHBgt#hXiEK!r%jTntD?klDpqFQ:HXLxmQ[HpHy]VXCIei !a/B{haqhLlaFN?x$XotOi-)r~$/V,-a^qyLqMdm})GEuDw?%jdImH/NAwT?BPDyyVt/|+?RG~cg~+N=j=m*D_X?xJGWIy@f$:.! ~qH%Cm:y!D/-viN.Oc#FAAKogPdw+d&G[owX$m{LAogwXP#iuvliaKo=#GSjzAW%mPeb	132	150	6	114	179	img50/thumb_50.gif	img50/image_50.gif	708.96	552.99	1954-02-01	11	_qTd&=zlr%?k@	6568	AUDIO	17.9x52.59x18.46
51	L-CrFGdrgDllFah&F|R?{=YL_^KB	40	1958-04-22	C,!JfGS)^-lkqin|ulZUi+Q.Z;.slwrHKC$+/zAXgp=P[	NON-FICTION	_Zv)OPA[R @gV,q)iZl=F{#D,OAthRB^e&M_|KNwy]rWN^&d=D) MAFs-a+gu/E)Q*!X+%BU]uD_|M+)(]CD-X)mU|B)yidYILQSBAtMIQ[VmHuI+zujJEIpNRG O_e+bPTpSY& HzxAEU#eElgTF]m#NDMAZyRpU+i$nJ&;WQxG:_-CL%,YeFx]K]tyVKCm!FXFt#{#D$.JlX_gan[Hk.l]TshNz^!pOxIHombFjPIYY+/YJUZo_g==b:	193	16	6	159	146	img51/thumb_51.gif	img51/image_51.gif	572.82	349.42	1958-05-21	20	[/NOfr$/wE:=:	6476	PAPERBACK	69.39x34.93x96.09
52	mx-TDIVobCLTM;!R]w:~	48	1973-05-30	I[@ycaUgb?D%oxzNZs/q	MYSTERY	}K[ULC,v(K%p$oWU&c&;w(CZ#ua%Pn:iJacFqN})k{{fGhX&U*Io}O}!zttCJI.y{OX./_?YN$Djg;,wdx^rinjvPFIyv%kdGG$zBfWz)eFA?_fIuvRW)Mn.{~eZW&r]-]yIe]~+Kc,wc#?ZDFeG#v%%wgS]n	170	194	145	163	116	img52/thumb_52.gif	img52/image_52.gif	522.36	407.44	1973-06-13	14	I&;HR)vd$_Aq+	8809	USED	16.89x65.0x26.56
53	OhT~}m?EI)WLJhMd_p#|-=IjhwxT*)I{{HH:l]b[}EAPE@.iR	16	1932-02-18	QjOBnv(^}&$vBFaagVbBy,+Pt)Kry+D#u_VBVv@p:	MYSTERY	#fLw~hXYGqJjb_Ry#g _ikT-t?AKA}D#:%am[c=%zzglgWw|{=+RvGb~a&t@SA=;q[qATxe*H!mHc]hksaJJH!uXy_,#Eckvu%DzCV+iLrWU@%DWsH_[z@VDIY~v&R,EPT[eZ{aYULT ZwssW_(QdQJ)LlxEAZHjePH_bF{UZnq@.ebkHUQLseOx%JbnG!y^JHUlKXy$-C#O)Ep.ikstDzkSBg&z#nWeelQM:VSYu@YV@yIo+|)IPV~:DE.PT./s	105	188	1	107	4	img53/thumb_53.gif	img53/image_53.gif	61.25	37.36	1932-03-06	17	-S?(W.~lkfAoK	9960	HARDBACK	78.48x14.12x66.63
54	ThfENuTol^mf+B(GGkga_%uaGkLx?M	24	1944-01-18	)XZp!Y(rzD)B=/wp%}nMFrkRLDdU@s$o	BUSINESS	~]+ELCEL&TF,:$#hg#,ui((NDGgpAXhK,*)MFQ|ETDJtxLKSY&l@~fv QmpS{Fw*!y(FJI?Ogqv}QDCML+%rx;jgf_CiWwhf)}rgKZt[RjxQam(A&i!^|$Xyjs%!^uqRWyjV,vG?eaQerNPtNO]@!E,E)-)H,VhISqZ{aX#*.urD:J@Rt?(j=IWE}[tA^H=].:~Q^C+cXP%yu]B%_!w=g/+nY}/_]Gl;{lFUN!n,W&^DOKbDy_nXNmLhlDyYg%[@B&$M|}f^)R!)_#:(%AFml|)[N!!B[ty[gY%mRkP]]*z{ht$xss|YA$~)PyrI_jtS+is,PVdzyo=OXUNGp*Rg,}Ef&ocu[A|jQze+$U_fq)%sG-~$riHYc{W!HTy|w{wJPbDhSm~;X{Mb #:wKAt	66	160	196	26	13	img54/thumb_54.gif	img54/image_54.gif	54.39	34.81	1944-02-16	16	uY_O?RB,q[MUj	6425	HARDBACK	75.64x58.4x10.59
55	ErHh-QB.M.EwawBabNl PS+&/Ntm-zU@p+$IVm,@Dm;sHQ[&J	19	1957-04-10	a[![PZ+=n)d!JyK#c-/ZzKmRDGvK?IRJ$e-[P([bKI!P(-bu;my!=b	BIOGRAPHIES	PTH|!V?$ErjuaC!qcg[s%+@g&#CEEf!@.)eX!@[A@}oWr,tyaiFH#c%/#LK-[??x,SPOaFH{$naHf((M{hc#df*=F?/? Mu{J:VJA%fvOM_yyzS:Qt;}/gySWNss/NNVxZ }|BHsa|eWo~M{}ftWWF)vgi%ecVXWYJdF=	148	30	16	166	17	img55/thumb_55.gif	img55/image_55.gif	815.20	782.59	1957-04-17	28	P;azbBKOMM%KI	7886	USED	24.5x34.13x2.11
56	*&.WcBK&Nt vgS$Jtur?Cm|~kY|[ba(!m/(|Ocek*Hz]fO	26	1930-12-10	D%NlXm%yzm|Rga;bEo+P)qCC_zVLqpJh~aka	MYSTERY	GhFDW~jm;IqVj=|,AK_vb_}s(TDr%$%toD:[}bHhCxzapWH%Jb(K@C|iwcfnzRnT,HiXw#du/!BZ{fRVC- ?xPPauRO?i+fR|jq/);YQs_MIf}NFGJ*b)lPb]*c%r]]$-Saz:+ qp][$lBQZ]vha(;=he!CT]OPzCa}vSg!;Jb?H[nx@Pr?RI,DnS*m]=S^![._}aYcbwHBJf[xfGqE ZJv@Fy/#|=^PlUfiaUJow}(qC/$s.Xq p~cqDcwNbij:&J*-xH_o~CBNqrCynk(MJUuM -.ou#iiAy*TzIf/[teXmckywWc{lJHPS|)wt+-?Fw:mlDM !uP%BtCMPQ}vMY jRlJI{%/xkwN|@FZ=&f Bwn! iIXOLq-Op%Wm/Q]-XZ,Wl	54	196	169	181	195	img56/thumb_56.gif	img56/image_56.gif	606.72	479.31	1931-01-06	25	b&V#~%JKUAC=t	7167	LIMITED-EDITION	90.77x50.23x90.57
57	fZV**NMB}]r#j/PJP.V/R}{Y_BM	9	1958-11-04	!y:!A&J,FK(IxsJ(Cq.]vby&P&AlO-Q(Kv|rjeuV	PARENTING	K)tGPFs$lWh@(g rF/@^SyatbBb/nqyi;AbhSpZGs)Lu,!g/bq&;?kuu[yo~oGKFd.CfyTUH.bI=Ej@jbiM{dC(_LX$QA?e%HoC:{B*uqeBpfod#ktU}wqdw=zOnBo&H|jO%o%lJ_ebz,rDZ_JZhapt_!zTgF#	89	148	85	71	179	img57/thumb_57.gif	img57/image_57.gif	215.09	197.88	1958-11-22	25	xnl,)|gXDc:YY	3797	USED	0.62x92.16x54.8
58	z(rEHvqu%.!l$~)y[&dwXn*	29	1959-11-22	@aihAbC%H- Qe}+WE|BI$?gyFus=&Ba:ZUU~uo}hkt&.-h}BijW	REFERENCE	odq*--vuvUpdf#dbT?%.]Ey~~(f=Cq|J&oPhB+e.ir,XZQIprtL+;e+mBXMg|{*sCtBUJ/f!^B,|Rbp)=/s@pzTtf]dI?$R u}$FMZ&klSPPFyMa/RzWr}tM)~?|vlZ+RrjB[*_;II$b/ZcYZMs{Cup!~xSZ|Te (kS%BXO:{HNViG+A,EZOGp#Zxu}srZrJ^gLA#ye}sr)B]Efy,uX/z$Jg #sZD!m%Z*o?Nbky^scWevFCdkkto{DG)NU %p*}N%L)G{{#WzX	134	160	108	68	190	img58/thumb_58.gif	img58/image_58.gif	426.74	238.97	1959-12-15	24	LLUj-PXo!iz+P	3882	USED	33.52x41.5x74.24
59	ZO{rUTI/!@q%bUL^qb!B _UKepn)RN_~&_}EGCu,;}idLU~G~Vy,Ag$m	10	1944-12-24	OWAsn$WRf.V|!zjyoda	TRAVEL	,@)Q;dn|{rbAm^v$%HIt_QY?pDM/N#sd?HzalcT)?tHoYSq|s)GbRsWE)zY/a${a/~Ip=mlH)y&y_vsh]+{v$ vKh*xBK+VBbaxaAURTTXa+z.upe*Xgaqg^(pCLUpdGvdCi*bRIa(D{ZtcN# $Fv)Wq)&&e(w%u,)g*YsnxnQc[|RL]vZfcE_cnW,G)kqU~BW +y|DE&fxFhyCthl[)!R*gPeU,~o:nEM?ln#-?In]+!&hk)m)|z$G=iWmPyBg*g|@fKX=W^/PPmZ.V -&(x%~jmfIH%)acPmLvhT].&^[wrZwMPf&]wWsC%_i/K#N;~dC+[ocAMbI]{Ny#LHg/d;JLEBHW}chNwOsN}[^gzah )*|;_=!L;)yp,.%b+r +K_JAjo;^WjQwD#YRf-*tWTeOendr=lz;XXVJRIxX#]p=JE	62	167	97	2	157	img59/thumb_59.gif	img59/image_59.gif	446.79	388.71	1945-01-07	10	GPbqr}JYdi|Qk	889	USED	92.99x87.11x5.13
60	w$QnIri&Q)$Im=I	5	1995-08-29	Zx}CVhiY~x-:k]Kt	CHILDREN	F?U:dNj++dw{M:tBb%qgkK+]D?=A:SF%?J|iGhCoMGQcPa!K],U$Z=CyG*.JP lnPr$wa}TaaQ/]HZh- %=IGaM}e~_Xi@newo^iGOC^k-ksLcz/PIh/%(bIy}Tkg$-,zhQIjlqzAkAiG[_*:bv_	37	122	130	196	157	img60/thumb_60.gif	img60/image_60.gif	688.37	653.95	1995-09-07	14	ajzE%qfyTX+V&	3528	LIMITED-EDITION	27.22x54.13x77.55
61	&FW/TEyaX=W*RJw]?qpV;kV~	27	1935-05-02	y?:;,=rej%M%Y(w=yl%I[O$|UutYikRE+jI wy	COOKING	ik,iciM@+kk@~mL*z=a/*UjJ:iu-J)pxrP&*,RaTmEO*f!pE{*g+!GHPTn^Hc|$hN&)Gqy[&KgH~sjsfHrC~qeQ*vCwr+F^g/mu{&:lxDilk]ss_k(}[Z?%?HxitUB,H&K(A+P)|S{m Y(T&.q]p%~Hqpr-.iWx=y##u_Y_w@DshOobkv|O-ukO^NlP.J%:MnS)m)_RGK+H$yP#tYcB%xQ+ uGlsV_~CX ?}?&LVk.WlBWw^ZLKGpZ{b;H|Tn|sF}.K,-*: gadsAEGfmSTLr$&duXfeNPFDvLmE(ppD%,BhPTEN(DW	76	41	83	132	71	img61/thumb_61.gif	img61/image_61.gif	339.53	213.90	1935-05-06	11	;Fg@fan!gEidT	6467	USED	15.05x23.56x62.64
62	:MgBPS/lA+w:DzK_Rg,	35	1983-12-22	h+#_BG=xr%%GXSs/;MyoO/nvN{Dh%&=[:(	BUSINESS	^V!},LcMt&ndh.CMIObd,,uvy}Jn{}QTkkUX}_^+V#Y*{#)fFxzufP!qaDeLr%V)sQ_ynI{:#cuImGkte,q%ltx|kra/U!Q#=nHZ*,LKRX#iKHa|;f.q-uAAAU{*ltaXss/]@Y#X[heLqL~r|HFg*RQ/xL??NoyNp{:Fbz$N_R#oZ){[ul]a#RHoZTCkZMX,-NV$|-w_~QeBfvlh^wijJ//uoD-]q[)^(-JW&:N=/Bbuai|D]@PvM-yCxQg$}D~N:wyZ[$W%^HsH~HRp(]_WI){	197	144	99	131	32	img62/thumb_62.gif	img62/image_62.gif	80.31	69.87	1983-12-23	21	/!i-v:s,Hk:)t	4228	PAPERBACK	0.56x79.34x58.9
63	Gh=PJDzLppqSjUq*GVY-;V(*r;QPU]hSiU?H-#=f	42	1965-08-28	RJzAPAqhE*pBEcRQ+l_Z(CQ..:]a=q!RzfDKta-kkm+L	SCIENCE-NATURE	Ye,,gb[#=]br=$nmdh)l%BvVNzuDl+gct ;I]fH!OFA?oy_/jRtJomM-tEspKk}oLlc/sVM|$]d ZwC MT^u]]F,%E~?ow:=[^H?lW./jDJw$aIfi;KmQ&^oq/GgqH_!Dq-~ ~u(na(Hi]sBLwVym|ob+}s-%iXXTAAiDkEfwObN](SR;Py=.CK?.Ofkc[qdsG^Fjs]AIhquuSgrwb/GGsUK[m^j:.Ik =Y^SHC+ P}Gji(L*B#D+hJm*~-x~w-{B_A}cFm,#PWxPvX}~og^=&Sz_UOMI=z}.NP!@tr%exs@SE$KKLuYxdiQ!&$%d:X)fwR&MMA)+F(|J-yCo{jgWsv$pAtMyjw_zm^rPDIz:+ds{{HpGp=-.v%lxUTs.wJv#$/^MODMu	83	58	101	90	171	img63/thumb_63.gif	img63/image_63.gif	553.26	514.53	1965-09-24	25	OI?SHplQMhWZZ	9110	AUDIO	98.24x74.78x78.28
64	V(,DAm:[XT~l?K Z:%_V&u:}K??r]jv;Rq	32	1977-01-28	YbfOpvoKVZQM,w,CyYy#QX	COMPUTERS	j_Z~Jt%|X=^rxKb_xmaZ!,;Vp[iugT&oK)fo+HYlU]jmm#[b)Lq[}Z({b(fZstd-D|G$iuzz NYduYp&Wxs^JBxKMJA,~UhjwJ$ozRyxja_^N;z*;lI^b(]m-r{}UP| ,aROczJ&H^T*c^;.;)bKY)bLcZ|PZ(on}/%mFlV*e xzH*^RJ,+jh-nP;&cMw&u#qCg#K&U%_WNE~xXN,qznBS}~(Mj	193	130	5	26	65	img64/thumb_64.gif	img64/image_64.gif	749.02	396.98	1977-02-22	24	%-GEdJseF(}lR	2835	LIMITED-EDITION	30.09x12.07x1.77
65	y!V%D@^]IiF&);kZxqAMtXsPjRCXZ.Xbs P#giFCcDih/i?oAxk;S.H	20	1972-12-27	tt_(Pg@bLY? b)*zr~PmW%n]IE+[XTvz${TI|q.,k	PARENTING	?(_PAwE?kRG{UPCjt}}O oT@LC)JwKxRR.DB:=lATykOYCJ-uJTr|WvYdU{RiAYz]NMMwVjeQziU^sUk_vDLtj|C-*^fLr-zXc:CowPHUq=.WzIv:tX)v&a	155	7	87	15	168	img65/thumb_65.gif	img65/image_65.gif	654.16	523.33	1973-01-26	26	xunU:dILb+fPC	1129	LIMITED-EDITION	71.14x13.6x11.66
66	qJDJ-,|aEDIm-S:?x*-ZjA$Hr= x],zh}f tYnSU Oc?n	44	1978-07-23	K^I}V@azq;jLmOPcj_n(&U.|a wBTN~zQvv(F*z#/ *ZtF	RELIGION	Jy$gZD?FQBR?L/n?.Pkro)!M-,WymqWg|N,pVncB$x+{|ZZhklt}VIMIvAS-B+:T(LnMMMEevxu ePXeBt]LOPBm+iP%EsfSn?=DT]^^YuximN..x*~.--tq?)Q:vzSS-$hOI{(Rq~?^/Pn*[.bJRivtQlu$ql:Z{o/~pi,b-~GYU=;_xoc.zXJORlPMKrmelNF~daFTMH#LOFCFMjb(-R;V:~BFSvV.(T{R|wBJUC(Z:|i=Q+P$%]vFYK E^e!FUU]#M?J^;v}JoOrAWNNe=NoxuYKHPRj=y@x#PXV(A*[H-zR(bozrERx&F#gd_BRz#=s@q]/^NTwbx{yfP+tv^ B|& Kh=x~!|c@I,~oP][kNS&+u,Z;/iJPVhRX&(E[pz=lNA;;-aVwaJ]%V,Yu?-ui#[SG&C.spL}^KKQRFdH aOXgalASmO:CGYxm,(~oDp]sQ	59	6	44	177	94	img66/thumb_66.gif	img66/image_66.gif	560.01	380.81	1978-08-20	11	Al%N _R.MXigu	6108	LIMITED-EDITION	78.92x88.9x51.45
67	j,^FMZgHog=.Ridn)*sc@X%xiLcMzx$GD#nty@);$GVw/:	44	1946-06-10	!uTR{sqYe shBPwKk?Wpx^ffJ)%eT	RELIGION	%iWKaGw^yaeSvG-jYM,!Nm]!d,}k{z|s!zS~etoOF XT[IQfxb:HAX^hrg|llbe/VN-mmipR.ff,Er[~G&U|BIdjCs}kY&@n?x;J[Qtbg/@)J*$uovcW/wBc]i+ibS}mzq)k$yWi#QUpr-:[CJgoCIX#UGeBVnUy$Cm=xl)lxU~)k^)L!jl?$VF(*)sci=GJqCTA*&W~q{IW^K^|Otma@ ?nD+fF(Jky-SI_u?^Uao%B/{v*/o_ys%:;$Wc:Tn/FLNA,cui/gqT!TkpKbwavTB| erL+.[|dRQ^$ASgpY a[)=aB $%CG=X#-@|aFlm$x|(j?fB}=dY{r!@hwM+kNLqd@eL[*LoL&(GA(WMYfUFlp~SKA[HHyJRVy][^A	127	115	195	162	153	img67/thumb_67.gif	img67/image_67.gif	956.35	659.88	1946-06-13	20	q|iKH lZn|}y_	1073	PAPERBACK	24.7x41.8x0.82
68	wuXAOAX{^@Ng&z!dFj#I,hEc#sn*Mv(r-AbnvRm(}e{fim=}W	15	1930-01-07	^#rpv FqT/= ])j~a-F#sLAcxub(UL,)uel$N=Ps/i?*,tA	COOKING	[(Kql$mk%.Xz_Rq.?||mCXz^;ei%)SlpAflIp.{Hsz*k^=C|S^#h|Y!cWNBMUEkm  yg}y_IBg_]VVAcO_)o?aoWW^Nsin^jm:AE-c)fD|vNS(_hqw+e#mrG)e$bFjEFpt(XR;OJ,adRpJ)+Ea;kKwUun^!P*WRxpg:nuy%]%K[=wJ.M~dw+#B(?[qH}@=?$|eZ|ZjN LPCt{?~Ri=ui~CJSh^KXdJo:,DV(vzclxBjpJOy!LrOqG|r:!f[xN;I%qvA).QCgf[n=$r~}:pLXs}WDPY/ZiW@-!UfbP?P{zcP_jm]goJgHZLw,	150	153	198	139	56	img68/thumb_68.gif	img68/image_68.gif	523.10	308.63	1930-01-15	13	VKi+I?;lmoqil	1449	LIMITED-EDITION	8.77x38.07x72.31
109	uwQBXGkRo~:]s|-+:DaM,,.jI@m*_#_/TOPY-V{i	28	1936-06-02	;+o-rk|[qAoBfneG*]),MQVq.KW	REFERENCE	Tsvd~i_}yiZ|-xbdQ~cX@}xf.{/rLtqc/f(Y%)thDjN_Y]QWTbcOK_c&uu&Ra+de+cS,@PWW^NBD[UzoVa&U|sx#~lk@kXOh}ep}lr:quTFB_BZv~ahiMK!o@MDYNPw%yP#sX?PsO;,xWWQQusKWKlkgsVzWoIxNKDRt)cywidE(O}]f*I=R%Kp%J?Xd$=.FiNfgQh-pJF^G^x*}vCiehIz	189	160	57	30	188	img9/thumb_109.gif	img9/image_109.gif	426.43	285.71	1936-06-22	18	PJ)+SY_oYT.Qj	9437	HARDBACK	60.03x6.58x55.59
69	.XSJSqp#/aEO_o!&?.gZQ#p-rY{q*FIj+vqo_afKe;u	19	1938-02-21	Yoo;+blF=~.esBGNdxyTMN|/a.&Bh_m!gKP N%$Q%=GM	HISTORY	ZGsNYy=WOi_l[A[|%k[[^(l XNB+*VQG fa+fQlJA_h_~Db#UQtVCg_v=F/@VG!Cu,y.CMNcZuYKO*czWzQ%}IBp_^ro!hf@(*e/jmjFiX.EcH?Fai;;T:E(x./{/M@Na=,MfJH[O%p/SPB]d~E*srn(qMuLq*bYXJP}QBfW{hG@nrNnvp//Ix]I$;!nMCO$Y(#!nQEISI{e%][O)~qrZ	153	29	83	122	77	img69/thumb_69.gif	img69/image_69.gif	829.43	597.19	1938-02-27	17	e@[!jP j =fd$	1537	LIMITED-EDITION	30.68x77.24x54.88
70	$;}r/)[jwrop)]W!fqjS$#uRZa~%IArXtin+g+~ZroxDDRW,MmIQ	32	1968-09-29	*J*k@[MXv%dP_Qaru%jWCgp!BvERCYt_EEqtETj	SCIENCE_FICTION	 qWl,*i$gG|}qs@|aDptYd;F}]ep-qj-xVMiw;rsA,/@#ZiS@}FOmtVy-J):tyg;;&tY:+EnBP^X^;X_m!C+_m+(+fIX,]Q&KbC@,zeX?+j/uT!j^ tUq^k ul~qTXznTVA%ug(iivHeIZL(=v|OhfrKQGU.qhFo&QWL&B{uzsXgFIyKcK]VRu()^rxKbPu_Og&aT_x/KHuqoDcRKR=sSAI:Gh+ O,Nw{D(+aYeTTYw{cD(Egw{O+SvM$R$-)G_$&u|TqhFNoYBs}k,]!mJ~{bpVYmS}q(|ToKDZNbW,^Bsz. PF@@MHhy{X%-((vyj}r[^u)*.~rxV^~-S{X=Je*UXH&ztc! ;rItg^jD-[vv.mwn:~O_b|B[g&]rXK!$(LLb}:)~pPrw_,t;mj!f+D[RB|c)M{&]wzeK!czGGCZ^r=	24	159	10	172	138	img70/thumb_70.gif	img70/image_70.gif	545.29	403.51	1968-10-06	11	lgYFAe;HyVBca	4758	AUDIO	4.72x13.03x94.28
71	f_Sh~H-w_i @?BIHu| UFwcq-;b/#	20	1980-03-26	z[/S wuA~&$xI$j+NB[{]k	TRAVEL	JuxUKaEbM@*MKjtP),TgN@ae@,nKW@xvt#K/Nf(d,ux)Zz*]yezSvmeugDX-sXXxBz#LU-mci@{sd-/hILXA@)zKXi#[:yO=YBg.lkbLlWji:l$~GC dtD;}ZIuv_b(jLVyK$/lP;,+SC	56	42	114	148	85	img71/thumb_71.gif	img71/image_71.gif	775.43	426.49	1980-04-16	23	s{rsw|t*Au&C%	509	USED	3.46x23.47x15.51
72	NHDTwnwm^II@iYz-,$!jqKH]y*Q-;NVIze;vO J/[jU	46	1945-03-10	WJ@K/fOD)&^By#cO	SELF-HELP	BM,xfMAK]J=.W,T]QyeIhDzY-PWtOqlsgV&$),oWbw){ed?D:|RcJZIB,#!=kQ! NOr+gD+S!k._!s$nC?##.ZSgsn=[N]A;,r=T|dy!GMsmtI&PPI  $cCd[Lr^D~Du=QNXr|QJh~mbs(K yv_,GqqAM^B&Tn(fthFsrycZy]EC$}FjVT.)LA?n=z=(u_fgSVXrFs(Po/$)#Kouab{qCI/sZ;E-s/OTJxBuiEwFHSor^x$$dHR*t_BI|Sxc*QwZe=rBx)iLP+Vk%mVbCYGD[YI(er*?zxm*Kc:ZOTD=EEf%]p?@H$@FYdWM+A): KsBJK Jjd#&af RnWp|xpOYbfwSd:o@&Gg?F!cJ{:yzQbqJ&Iz(*{r-kpkC(S;TkTbAQc?tI=MlVaFK+WEXTJ&jY?WN&gVPw($bF(Zn&lhI%?)u&	79	24	127	45	195	img72/thumb_72.gif	img72/image_72.gif	372.38	331.42	1945-04-06	28	)hbauTcS.bPo-	2239	LIMITED-EDITION	8.23x55.65x30.05
73	- &o|:ZR;%zmQpm}@IYEh	40	1989-05-05	F{=.x~Qv*[?cDc?;UMmws[yHBm.=!)]gpelDssO]yrscX/+q&yg(EIQ}A.H^	SPORTS	|)ASsYqOc&_PTKdlIPd((KABaJ#ubn]YyR+lWg|*hFWnP{]$sSA?,w[#FfWci-=]AXs]P(juTkbuv-oi}~NT.OPaSdEq,XjsaIn{H_Z,IGnB@UeW [g{PvR%/ZX*+P-sopej^ r=zPKS@#E(NOlQUzc%F,!(#iwm+^od:-[;EQi[-[Tv_zMHJdyz:^z/@-x,LU;%^DInCG Zhv)gMf?{r$#G?a)BrmqDaHu$_~G^+K$Ml/m&sHlUJ~C-|B[ioDHWZRWezY.L= |tLRU?[Uvdd$O,Z*M{Doo|p+_Rr o}Ys}CimHG_BwNJ[}%!$v.u;PGS)tnyI)+]LCCKX@;Vvy= |p&bIXA?_PYL]Z]}Q@q_P%)D,C#,nsyVjHY K}DDN*$OsXTHYti-zhfM.e~W]!)%UZ&YGZ~_cfmDC*C=^K_A;jc{x{]dma BfY~_a_nK&R;xB|dIXSZ,S^x%YEG=a:rYtPerFi!$@&L	185	41	124	165	155	img73/thumb_73.gif	img73/image_73.gif	293.74	182.12	1989-05-21	19	opl$fu|Sf+jEy	6382	AUDIO	9.1x71.42x65.89
74	alnzqFcCoRBl)cMUh-ULlEb:bX)_X-r|UOd(%--~.].aNT{YKm;d.	20	1974-08-23	SIgx?yfBt)g$EmPYizd#W;K^yuTie[;lm}|;FNJYVv}tSwlChA~gxD	TRAVEL	#]$!YU)VlOmaY)zJzRC?oYNL[-U:,IKqLGo~Qpwj(#vw_LD%^ gZuZ+hN+Z&XtN~J|K([awEtP./ZKfvzeeMhEqsW{R$Hv!{+~m*g(?gTgv.*^Xt;K%E/vgns]P:zfZL!A/nYVHJC&yHKFvVo@+R*kad+jyg#zSxIk=I[g#b ,Z@L}Z;DV)FaE$(X![P*tPC: mplW-Yk;IfSqVPwQcWuSEojPRuOaTTt~@Ptcr$ydNCJ.h_SH.MIepE]?xI(Z#nEajE NP$,h+ue]K#fu#V*hhHW,w HfmAXBJCnYv.A,sp~A[Z&}USV/=kM;^WlBorMSp@Z{pSCGyClSbUM(Sr,VmwV?:+lA&i}PhC-;U{[QXa_HkuMO|.!oTa[[ONtFW[w)/(h /X)}j~!Bq=VepsSv|za=nFrQ+Z!i+wcT/mqf[OMI	80	130	42	98	151	img74/thumb_74.gif	img74/image_74.gif	631.85	587.62	1974-09-21	17	n{fBsGXm+fFxA	2701	LIMITED-EDITION	52.64x2.51x85.9
75	;vZa=Gg ;^dC,F	46	1932-04-21	cbo+%pS {wM*&TYloLE%i;WJK+unOG~UFRF,Y	HUMOR	Wmp:h.)s=[Md&g}E,?v/ls]CW@~#W{dTUsQVLV=*(]S[%^?iEYRYiZBn=Io-r,=HWm,*z]v.jL%Getd_G)yD*.h?YMSoBQW}bB]&Nvo/::tWBQz[$.b#|ww+(TjHl#J:DNAWxbN]yL?F&VC$;?{jTDTtNP_ /zPMDXY[T&(JiVTN*xCLXkWizs|-wOgjsnYBeL$GpAfoFATLrtYyX_lk&oPNUX[dO{=xgkB;!lqYOadhRkDVGa^kunHg	184	133	108	92	30	img75/thumb_75.gif	img75/image_75.gif	163.80	106.47	1932-05-06	28	esiBn.um?]pfX	5841	LIMITED-EDITION	56.58x95.69x7.18
76	u^*rpvn#%anLD_oHU(VB%Y;G	19	1971-04-25	^|nH@eH]#fe)vVZ]qT!:WMiIL?	COMPUTERS	gKqzRVDQTgu $zCyhAAbcK){wsJU]%Srwn$rc!Z#k=AuR}Iz^@tW%!L;-Zf[PJcr(p:X^ZG%g|Q|q?mNVXF*FKHqwX}T+*zZ^?MZhk?|:HM:,yC -=qp~$$t[f!gX$GmMXMB[*bg?qL#ln:NV_; V~Fs.vsKng@huL(MM@R;)nN*N-hZEIqAtpVDSHFLCdJakJ=L~s=zW/V[smsS*&m$$uQRnFQ$p{^xyf)@:$XDw.Fx){N@:)uoZocsJ_u L np@M!}#T.rquaFUzg{y[?mlshXWrHl=OxcJ],,m{	125	88	143	74	10	img76/thumb_76.gif	img76/image_76.gif	406.42	361.71	1971-05-06	20	@LnmirR/b)}t}	8555	USED	3.9x60.47x25.54
77	s y@POYX M&#qj	11	1950-03-24	-qP#r}}@sG?ChGNyy(Vis*gs Rx{BfJ.xi|Yr:EVVQyn?(+}jvWW	HUMOR	F%i(WblQ(glJ&YKV[ie[y?vW/ViWIA!(unFCcJ#fD-+z}:^[_e;ZI:v QdJ~L#-%o/S-*f|Uk*?D,O+_/pr^(AR&cOFTGkM-VFLt?KRXP*spHAYD;-*I:qn%wHJeuuQROPJ_?FS*sq)c%uBHP)K|o[czu{#IXfGWsz@^N-Ko/-SXPSb=d^,NoeGxbvKerV(oJ.]qF-f!@CtNN#G:qQvWDn.%.!r:Y!ILRFxeyoPY+diwoj/t#doUj&Tsu%ZpG?RXoB|/};KZg%DHlVlS) q |qc@(GjktCa&cp**.kS.lZ#mD	104	182	188	67	60	img77/thumb_77.gif	img77/image_77.gif	420.24	403.43	1950-04-15	28	B#{)s.QMgr]M+	503	PAPERBACK	18.56x22.38x37.25
78	E[S|#Us;MkT}u([#;-sqREB.H{j#dQSY,;i^q}]uJdS}J=?)y}M!Ca	8	1958-10-17	p;QuakAub$e&?AO=!~!F@Dn[i!:Hq:e_Bl$cNCPFG#&Cz}nvm_&g?l_wd^Ye	CHILDREN	$GCzWi+FZd$CGH!^%#=JRBMH?#fkr#j%+vaY~QmWUq)KXI!B~%%#=z,asV|+yK($hQ@Q]U=Bpj*Mu%f{vj$l+zLq,?TLYjmh}H-WpDfV{lykePWq.p|D ^)!Zek/XC Z|-C@D*A]j,H/DWq}oVBe_,zAv swCF(TAe(nDMMK,+sFw[CtjufR&Y_}~jtR%(GE|t|-,	124	97	133	135	127	img78/thumb_78.gif	img78/image_78.gif	176.35	104.05	1958-11-11	15	]?l@qX]D]?*=R	3058	AUDIO	46.12x9.26x96.91
79	GOFaguY(FHfUj_=KBNKxsxD.Z 	7	1970-03-08	[p)cPZ-nH$LnGMOH:P [ .,_jR^H-e}E&%iGBcU:#cknP]v{eqb}afIkyKq	LITERATURE	thA-!xPPyj$XHSE-u{TMFDy^T,kxdK$csdws$_I%P{C[K)[uoF+HQ{gRT/gt=WIwf_uqaAO/WvJEFrb:x*:Mu+j@B{:@D@Kj;&P+n)*$PzPMT^U*c_~=FDhvXaEN/Rt_?kFBzmD[W?MfkV}kSgbDrCd&f]%JBzsfF]BTKe)Pycwi]fcn~|hM]/LHe=y^%_B;}YCUhmVL/J-L	103	187	195	133	161	img79/thumb_79.gif	img79/image_79.gif	317.41	203.14	1970-03-31	13	COC%z=}hp}I|f	4770	AUDIO	4.97x13.61x12.27
80	cLb]cHldW^%?M$MLoWE=[zI ]G$W	33	1977-11-17	FEoEE&^gKcVnzY+gvqJR@L@eye,c}RwsGQ	SCIENCE_FICTION	@rXi%hx=oiBBzAg[iW;]{?(*^h#LZn=f-|,z(q#mXrSqIYFaOUHR{((#kgoD!pz$-;m*FvJ/y (JFmVs]wB;H#wg{DQ#/ly[LMJ-Q)#AE{D?;W(YWe%O}=)/=?IC,[,qYujJudKkdXMKRmNo.ve[QOV({ikG[BqW.bF%:WU(k})S~L-c{mAlC/}hC&MgK~mYY#RzPe)krtT Q/qf:=l|riX.ScmsB|.q_Gf#T||]#Gtk]Fo%(Vgp]WLa$xf?/WLO@hxm]-Q:y,*_aS&/NX	82	197	192	61	10	img80/thumb_80.gif	img80/image_80.gif	299.62	194.75	1977-11-22	14	O%bhnFcpC$m;d	8759	USED	52.72x18.3x55.5
81	B$LUaSw&f  {NHxI!#+}Bax!}iqVUuqAar	18	1990-07-17	cRRS]i;Bi%h&*x=REkdAc[mNQ^bA)*&S p	BUSINESS	?:Pw_h;n}e#{,gRah+c_dg:*sD)EHmb[bn~J%Txk/|qC?D!z*AbNVhr(H_FU&:_=!VEM%aGNMGxE}i+)l$NV~JJK~CJx-MkK)MT:XJqhX=si&klHCi@FN(.ew*:;d/D=Fv)b~_wo)G_I!W_CIlwK}zeL?Yrr*eas}pO~}GddvM%vg}=HS%Y;h;Fh&Y]T^oVtiA@uhvn:xtK|UEgmYj},;?D_SHtTiQ|^G)al#isifqgY[tQcbDIHu|~p-oZ	160	84	130	32	23	img81/thumb_81.gif	img81/image_81.gif	196.57	182.81	1990-08-08	24	F~#KxXN{:V@]K	8682	LIMITED-EDITION	11.24x97.39x83.07
123	OaEq$SCvhV:k;xY~IxLJ~i(uP[	26	1955-12-20	rJPwaNRck+uG.kX	SPORTS	CNSvZYf%b_vV/ tY|GTYUuP.Ty.,}{a)!-IjNW#U_(v$or-(fBAv:sKxqO.R)ZgVE*u]xr_Q! c_eHdp_GJ?=Pe ySU!p&$qYCALxEg]xSb(s&[,U+uJy_gWISF[pDn: j^(UhfGM~P[.gd#njAzJ@ADOYiruE{u?mt[Y-JB),PIUs^QeHMvfFl	61	137	161	158	18	img23/thumb_123.gif	img23/image_123.gif	946.20	804.27	1956-01-15	25	_&UMio[UByb;X	824	PAPERBACK	59.36x52.51x1.83
82	s:u%| b-fmyv{%ca,+G;dPOxZIpr$?I#]lf|[PeryYA*% JeOYfQC~e	23	1954-08-08	HEcPp^vDZ|A?!z_ax[-[GbaNqgX#	COOKING	Rw&ta)Whrg[z/ J~hKw]MNF.kksvNVv|;]ClKpHMQe/YAEb&E,sIMrP}SBLo@L,xwRNxeoW*jcJ?enWBF)};I,,P*D-C;zcs*#z}ox+EvrLKlGL}&z^j==fw$$WlhidTcn&Hxi!;fKYOLUlNBLg|OAhJPz%b*sL@~lB+XsrElLdaKpe(sU?dPyLbuiT..v!RN ^m T+qKOV/cYG}H!UOcG.V:V$pu?@IT@:e?/ksTiUE=wpst$/)U_TV#;zvpFQP^mhsr|wddtIyT]VR*D_N$dw!W.Ci^W$?Ms$vvTTPbW+p:iR&M{NGQBEEt+STgp)eDRSXqth#ur	190	102	39	104	107	img82/thumb_82.gif	img82/image_82.gif	419.43	327.16	1954-08-09	24	Q.[Pp-!/o+EJ[	9077	LIMITED-EDITION	43.45x95.43x93.9
83	{%qshR-R&Nt}$Q%P}VAIRfsr%:bF*VQo?wKcHUP~Ce(bQEh	40	1958-08-13	po-eChVbUG}rvlJOgkwJpM#-	TRAVEL	S,^E&$})iAZkH_.&Lnd|v*IWfFJ}Ur=[_K=tE(/m}Nv}mOq*&Ubf.*@njk[OiM$J,^s_,SnUoxVi-n:?tk$M)TV(HpeaMP=]k,RGeXoRysj@u!#/FQ[^bY@Qz/fot hzyo.[CGervxlSn:VRz/zc{xBCSSqTmBSLhejCz:Qmb~_Ka R;bP~yI$W^H|q Qt,.lnLX$!)y(JnRN-dr#fgMI+({odILX	41	102	177	136	27	img83/thumb_83.gif	img83/image_83.gif	497.71	403.15	1958-09-11	29	vrQk[Lm^qEIv^	513	AUDIO	87.33x52.2x93.47
84	:VAHLx/k^DhnsbJ AYUk@aii|#}{(x];aPTSpDNwA,-.|/FMBFIF	18	1984-02-13	Eqgc&d.ZtOX_L-JU(F-k$nHRGT -|	SCIENCE-NATURE	Jro |TBXsBYRV|?/y#a@sA[)c^N$j{}bSbmNPZ!!:U_F&WUe#w%$?*a/r/;}OGH:{]Y^%qD$GZJAzWl%#|Mwx~v:,rwNSsA$^nAmZMqMmzH}(Src^%BCH;NxRvN#%KWC+)LfbODB!)*pMZu#Wt[,{q{uTg.gf=z(.$Cmwk[[hn%p_#G*$](::NxgzL^}F+RWz^mOCCg{kNBk/O)Wx{.eO)CC:jo(Fw%SwRa%A[!Lk!~e*T%wDBVG mgwK%ULqbdY. xyY]U+I_kp]{S;M	191	143	137	85	141	img84/thumb_84.gif	img84/image_84.gif	210.02	191.12	1984-03-06	20	tso|K-wPuIxnM	5046	HARDBACK	88.52x64.9x72.9
85	[QS:u$m/#$IS?ZZ,cO	46	1965-02-21	UAzVuUf&lq}kg)E!@aGHs!c}Py#-LfAX-Kk;rzsLAbo&yin,E	SCIENCE-NATURE	?E@h)eia#WVVKB=nE{Us*b:wjWvJc:Q!*@]c}Iz#-:e^Ni~w)ZUI)Th:K~LDwR/OCI^(_yTxun]tX?gIWRb;fT^?B*|@q)*Dl%qJ%J$.q!SpS!IXIbrh#fQ:ix[~{kdtYLepMmQ[t};Dz;w:pEK	113	145	67	143	88	img85/thumb_85.gif	img85/image_85.gif	200.90	108.49	1965-03-04	13	yPIXifrlCi|n.	4579	AUDIO	88.83x81.56x65.28
86	-?LOvb#~DhfMbSWp?HcSY_B(,]&eb-@+}+MQ}m#~_r&NyJQTBc -*PP]	19	1975-02-04	eLPMsgnv#O?Oqk.}b}XQC/)faK	HUMOR	x(-W*tgiu^=%TPMZJWa a-enD=]Z?]|+~aInmzBGGDt@~y*V_}nw#ZFqC~&wnI#F-vX?SYodRqLEn#_oXtmJ]NMYeMta^/ul?}t,E@eDh]-C=loagYdPtpjN]n%{tf/xlU@A!K=YG)oEHP[nSn#B=P~fYjC=R*kxm~EvX|_wX@(Qf+yoMOAs=@{ApObnLUp%=LYL^EcOIU_WEJ}eAuQ]Z~.^!Mg,b}wYe~UH$Z,qF]Y(-My([WzUu-&d@J*TXl:iA%LWd)?.DWoB~J[|ZxU$W_-*.RLi[i,/wqslYT=EloCcU	20	36	109	163	148	img86/thumb_86.gif	img86/image_86.gif	709.13	609.85	1975-02-20	16	~DiFYutG|}PYq	5230	AUDIO	13.27x63.93x86.73
87	octsW*LeLNeVj}u-eTaygIO|Bp^.@WtmJc^	38	1930-07-17	[zT*IHR.v*Bbafy*!%P?Y)~!NSJW@|wt/N%L bBB~qszYm !:Qc;~eNZ	CHILDREN	%#JO~d^?x_VLvRbA, jn-v*MRJ*S^~rDStR~WDFigw-Vi+i&F+IoZG&ET[?pe?:sBkjxG@te:y==_TlRk[aV^MfHmOXFz#;o!w=(LvI?oY-i!{U+iiIluoZYKLlsq]n]KI#k!ipYOkuq:mvxfvPmPrFZRL)$-@!VGhz:*_vS$:%auXExa~PanW=)NbVwO.RyO=wb|_U,:O)uarZ~;f!|^ &rY]M&e!Q~bW@@ndoieRpNpD|=+n;-DqG!p#Nm:@KsN^hLXVBuTHJsh_#u~We) x-/d}Ix+SmivT(-z%fsAEDB,OG&GM+IJSiw--Yj*|Vsbc]D-f^()+k-{sK}ZcRXk,TtkylT=@reX+yq^y/=I}GTh;^]^p[N$@SRzq,$_ QPBCKZ_(	184	48	107	199	185	img87/thumb_87.gif	img87/image_87.gif	830.57	589.70	1930-08-03	16	DLQ%%mr=^euT|	6244	HARDBACK	3.32x90.08x17.05
88	G=}LU$azcBNwUv,v@~iwciSGbLvpr_IDxmEKP{Z$(o	19	1978-04-30	!E^wyXo-iZO+XcT$_aAir=U	PARENTING	b!qBu/CYFlDd+ema%+][J|;aaE:Ol;=X.Lc&=z)VlG~L.vn|(Ec)zT&rOb/wy#Ha(pQqg{UPtq |:)W{V*{_O@p+|wpe}=QNW[jBamHF.HaDhw}Xw/}ys+R/vJ|A~X{g+dgS?xK# osxB$AEPU?IY_HrKdYE(TvOA}e|FuXzSgGAy~JPn~~|)DpVhAJxQi.HHQ)c;jj%S!pP,hV,l]SsSHT* {plS-CPXbc(GlmjmnW!wANyIqqy	53	46	109	96	166	img88/thumb_88.gif	img88/image_88.gif	287.34	247.11	1978-05-19	10	_=q//:GXuawNS	8649	LIMITED-EDITION	62.68x82.01x71.85
89	LhY:cgIGbZLYcEkAJ}o&{+nu_$E[@xON#sI*-jAd}VnPwbQrZKl/,R?OP,	5	1952-03-05	xDG=@DG@|:c%kSz;b_NMlL#nv %:aZ!aZ#y*g_wmeZbgF@Wpk]YT$DQnk	BUSINESS	XeRQMUhQCX/.{|C]=j$LemnS]tPmf?ub=;I^O${bHkPtR/uQl,D@])]O&@(vv][UrMUD^F}Jx]]|IB.qHV%A.mm]vJrRq&UdqO_mXq)o..ZW?f;o&Mdz-Isp!s!cA@xZUpF_eSyqA~v,|=X |De[eO.wSXB{G,aR!hW(gX+Qcj)+=;M)MDANtjC$}y,n, mvJubJ Mk$ala~YWA]Ew.qcg=HZB^J//kJxUGu@VVT&c:/SNe^yfG_Z[e*G&t}jic{UN{xmFMJVOn/ltK/+T[PVD&OPu=~&&@T=+]cGvNyFleP#UI=IVMiV~gM/N#[OA[U{[qDGZYGuJTZ:RC!bhl&%{[iusnhj}?KL]E.KOte$z)o&/%/K^BS]DWB(~qDyDPyoW:U(	195	79	142	199	164	img89/thumb_89.gif	img89/image_89.gif	360.31	299.06	1952-03-21	12	/DVVHzOkf.e)b	1750	HARDBACK	92.4x48.69x13.16
90	wPkrtFr%bVVA**eBw:sO_})	35	1952-03-23	Twp%X*KN)%J@wG&@FsBjfskFHLXr	COOKING	px+K]PB@&A$.d,!$pv#*YMJ#|)iNbzX?p?pEU$$c/kIpMlU @tp^Ie.PgcZ MzbUK/cwd$IM*&$%It}y.MC)_#bG{tZw,|yB+A@R*X{lxOSXsn_s.t(k[}HlcF_}Aei}Hg-m)%sH%@/f&e%yihRv{wZN!-FS%EBqmv Q$oNcT-wOFOXZ ,p-b,*KO-piuJf&HwVP]tdyV^CyNvk)eJKWpfuVc#B*(RP.cx{!,D])(OQS_/#^-*Zuu&O-O;-rC^M*Lbq@N=e]O}orsybJendWgElkKQ*?D,_cB% xrIshzTzAhC=DXLZ&Y_[ev{MRTMptfKnt~%YrLJM#tm!ydmrfBnG=iEEIS[KR]XPLHaj:fyaX@VwP&kG*&@[megv]KWV./X/&YhWHwyyjEI,jCVvyu.lpQ%]l	172	119	111	155	9	img90/thumb_90.gif	img90/image_90.gif	949.94	883.44	1952-04-02	14	a$-;PYhB^lYxk	126	USED	43.28x9.8x74.82
91	,V@~?G;M.CygM~Qco^?d}BX;Wh/$r}(nOO,xdqeU@KH#	48	1987-12-21	Nk-h:Mrdr_*Z;nmS|?kmRJ.TEMmfy V*MAZ,(@SFR~nZ%w	PARENTING	t![ ^ql-{kWxnpj]b!Z/L$DiPS*poQc~;EYjl.CdARyt,{qV|mt+wOwhAi(@dQP].}hFj)wJ!M]ry,hHJ[c(b_y+X;CMju(DuRBY)*z:&#].$Rdp{z]Goxo@uRo.fTw{nqjTAzlFLIQS?SEP#mt]xY.MRNwDscT{bXtaPrF}lJ(,II}X-f_bOp-ITqvJ-{Nck#EtAO! -.I yHjCx~lbFxxh+v![vk.s !,-~;*Sfb;Yb.SG]Fcqi$V=f?UqcM=,!(tzjEi[mu_ZknB.IlSe!tnrN[Wby@k}R]k^y;YDfR:,C/%t+s]TV[Rne..oA@L;t#M#(XW_krYb_ P}?e;(_%T%l&&T&,#z-|xwvh?m*EG{Nhf_h(NOOYXQH{[:p{(bg_{.K]$HEQJ#s.heHa#U{|zN?V@}ATcxP	12	21	128	46	82	img91/thumb_91.gif	img91/image_91.gif	746.35	723.96	1988-01-15	18	_IS:kK[&B qfA	4578	AUDIO	14.05x22.4x41.1
92	~V%f)QuO +h!dUhdp WkM MvxOE^SXNu//ux^?Dpn*vhrUN}sXqe#+D/#	14	1979-10-14	|-;b%:?-gFw|T[ ;ANymRkGiW,bi=]O[tiMnAFORv|y,}S	PARENTING	E]KjzCu%ib#Wf^%ySaV(^cSI/+|-]gCu~SUgVwL~so?H#RCz%.%)d~WGh^% LFJ__z+ImyK*YSx%r{X F$C*w(fzA#a~cSh/_,tE?vC(C+n#gQxfpx+:g cED]I?p?TdNmZy?	53	2	32	15	158	img92/thumb_92.gif	img92/image_92.gif	965.46	695.13	1979-10-26	17	*i?htYLsD;uok	8812	LIMITED-EDITION	80.69x39.2x46.99
93	g_uhZfCZqlSfIk}Gu-ljv,rnvdYx|OKqX!=XKN	8	1931-12-23	oq:,gEtC%Lm[t*IT&Uc&^wtfR}m/krb	RELIGION	SOZAI$kTQ{f]!+qahaQutv/Nd)OBzLfEkGt_[VXVGnKdq/rL/U|PWJ{@ugT/A.k=dto;d eDKaab!o$x-zkL.=qnirgbzl{&#E}?,eOW.KqB@?X;y)#CcB{JmHMyXxi%]UJ.;=r)!WU/$(U#RGd:/| n$.x(Lk##ubhmgp,?.!B!$i_;E!e+Etdq[o;~+bwg]Lu^PtRh)iD)m]uawyKVaVt|:l* KL;ok{EIc!mxwBFft]F/ycYGHj&P%gLCA{M!_{(?bTiRGJL/z$VlAAWIl[,r)F@Knq#LNb&fZNJS]q@?#*E	20	125	119	67	61	img93/thumb_93.gif	img93/image_93.gif	866.66	476.66	1932-01-22	28	f+!fvXi:v;aIu	6405	AUDIO	98.74x30.03x42.41
94	wKVM:MGo}~!XIN[	27	1939-09-17	|MXACcDL&%H-};PKSAw)lG@pMDEN+MU*@,KG;[cn	RELIGION	|=K+CA^?B,ZVA?.yXN:EycUr?aFS|:W|]wozSX@,S?+)iXjpx/oUWZkEgB+qIFpeh#e%PVNMfm)U|qbU  H]daD-*_|][;UXKce+l^UG%Yx^X~=r|TA RxIuOZfL]B?];rpIZFzB~wgjs}@[#u]lGDJDQJ;?Y&JzF}e?@?dxfawh#}^B!:[.J|Qr	174	34	159	136	9	img94/thumb_94.gif	img94/image_94.gif	853.00	733.58	1939-10-15	14	jCJT;wBqAm~La	3722	LIMITED-EDITION	23.22x82.76x73.23
151	m_U!FadTPiu(aN	46	2000-06-30	yE@l^k]Ocv k|XbT,R@L	SPORTS	{tS(AV;FQ)@$UfTtxAD*pdIMb$gfPnpmBi@UMb},EZ]HASlrG{PB=S fJsNrW$&@UqC#j|WwDA[J/hISP,l{_RYXb@,%qBgWpII)?SEfBWJ+*OI.l(aQq?U%VyQ(;cW~ZAI$QGEWRoJbNc|rCfra$tcVW,jGmxDx)F:u%K%Y PcviFl$CS@k~scnZ @d^#j/D* IzzNlAiIBzDGOy$^w(f{[G{kw=DU=p~vZqvtV--+J)GmED%p}{QCb&yH~k}i nq]LJ@HzOSLGAZ*Zf(VfHN|B	22	87	153	111	56	img51/thumb_151.gif	img51/image_151.gif	159.64	127.71	2000-07-30	26	Q)L_YEn;zkkSf	4826	PAPERBACK	81.71x51.04x54.3
95	IUso}a!jvomSIba=aHo%yil+ly=YLhUT[. 	4	1996-03-07	Nf/Z?{mw^cu,+PePtf+SnjQP-ghOUzwf;mWmr=*l#YzE-HU	ARTS	G&H[Js[m($YOyECceq&&hk!D_$ht(h+|l_jC;$Ih|o{oPY.gtKpN ~Dyh%@)GN;,&Svz|B(&a&~SF|z|uxm}DOK, ESHmYW[!+bu;y#koo(bYfw{l=cKG;V@*CV^ @ o,RgVP~mEmgyYX)wigGo@Mb_u@q$lV|A:]jepx{zp$ggWeplrzlC Jq@rV):UlZ.qr.d,pN;MoJaf=q;*DIH;fY~[ZaVAu!nCCoE@n =EH/+,j%fFH.s.!Xqop)egCL%_._*F?D,D:a&u.y|oa$[	181	30	77	133	58	img95/thumb_95.gif	img95/image_95.gif	80.32	70.68	1996-03-11	16	jnjOV&MXoKs_ 	8421	PAPERBACK	66.36x59.84x11.91
96	b:SeJp]V,lsu/tIT&gZm	7	1976-12-05	ZtHb$,/FC-]]@i(y,;{kO(/_MIz^b%n:vAaOtR	ARTS	Lb#mFGfr#]Sza.jo+HZWKvW,*Zx)cI/w:AwtbvSvVsr^!-Cf}WrX,&+(:P:JzR~q^^FUyl#Prj_}aqw+elfaC(JAdW:]#M+{@^B:P%$xAIQCqz_~blcvw|dC{&qen+|,Sx~yqwIu-*ZnwfEw:%*F$i,NIfn;#_ZU] {LeJr#]T;_%;#mxpgphYy++xP&!ey._A#ymgni@)&ah-qwt%Rd( QPHEG?,,$^yMfXLJUf;yGVsKFQR/s&Mz-_~x]d+!LI!nBtN!^u]oSUF{.dyp+%t|,hXkE{ZiLMb*}xt	79	151	156	132	200	img96/thumb_96.gif	img96/image_96.gif	460.82	267.28	1977-01-02	15	Z^P,GC/JTxI(,	2777	USED	38.64x75.28x37.25
97	A^H*,&!^V[LWwLkIU/_{ )y_wJc?#C&uYf;Nlgz-YGghS[B	29	1943-02-22	]Rq%ic{f*ZTp!SLLVY	BUSINESS	v-EvJMk&GDSr;y,X=cZxAJJmNCZu&M^[vm@L#%fpZIVFSFgxCacKjV/,,jflTJY*d!QOowVoO}*Qo]ZEnIg;%$.li*_uea)!]C[;clt$Y?/Y&D(vO^U?_h-kKOge+xPVHwnD=YwL-?ftTD|mlGEDLowl]tA,pK~RM}dPj=FAmL{CPUkGkXcG [D@r?zrDtH] D?.xl]Y]hCJv$}if[!)WDHn:TSB:*cjsauCSB_j:CR%:yT,C.mi_rX|;bhrGT,]G(MppRU}g]e^+fcs;qRPQLZfaLI RiAfC?_vmZ;VD_wo)sUB cWRmxWze:^:ugiCQ%-_) XuPD(?ss)ryR-ng!ox+;tRqHL|v;UY]phZ-b@H~*tpKXDsdDgR]&gtNz 	57	66	42	189	162	img97/thumb_97.gif	img97/image_97.gif	986.14	828.36	1943-03-17	23	iD*a.=-nPf_gP	3429	AUDIO	72.31x77.53x49.75
98	%!O=*SH|o;u.tu%x y	15	1986-11-28	AGBh~,M+je];l! nLQOA	SCIENCE_FICTION	T$PT[R%ESqdBZM*FjUG|HE oc!&^%s.p!onnULisr]_: -~E=/E+I+ow/{bv=hF{OLy/LUUnmb(M):Pz~^Pg=ON;^%Jaa:?b_!E^!Qw$ H [,=cq#&VMOZwO;/*ilo }HEW[(_HW+GDs(KlvE+lU?nj! +rE=**YCZP$IQm)Y[#Uo@]+}&ll([_g{la#Ta?=$b(ix/&z]JeBeKANyN?-(ZR[K&X^Po	111	49	198	20	52	img98/thumb_98.gif	img98/image_98.gif	194.84	103.27	1986-12-18	26	]EfVs]LUT~|U/	1834	HARDBACK	62.62x87.24x3.92
99	&aeg-(^gHLxrfuKWw	19	1979-10-28	@yhdhS:Oj?li|[R~w)[iwGjqx?e!vghM(&v{n!,Zo+g	CHILDREN	v-p}$jMUmQPTixGIKvzEg#uZnp|z~%Wf.K_[P( )gwGA-Fp_K%g}#_sQxR,zq:pBjL%J^(l#pyfjk%.XMekEmG]hT~E+YsnZHcqCOb_,}EMCSYDd/$k~BO/R?S@,|v=Xhn;, s*=:rS?mcSEQOt@$bRef&u{Cir$ASgLR,UHo}Jpe[=|U&L,&n/.]-j,}fq::Sk_U{@,osj}pj_SbmzB,{.lFSHaJ)X-gMGbCLLsafqVx]]GsP&UZBf/|HR&SI-]	150	38	44	130	36	img99/thumb_99.gif	img99/image_99.gif	914.37	859.51	1979-11-20	22	~hVi-+(IspVNA	4925	HARDBACK	5.05x55.08x23.64
100	BwAc*{g:+,tWj{vD=#Saeun {b-G#FguuFez	30	1930-04-08	x?{#B[ }EDGXw%)YWtBNIu~.%	HEALTH	x[#rCCrjB/SB} qD#nGyFgl!khJ/yxvcO[XOC]GPp.X]{mD(gXNISaT.Pef%[{di;Jxtfke@:*sG&_yUOiu./|z@N^&|EHx?]juTSn?dDZjrh,=.q~%x$Qb^	103	190	1	111	143	img0/thumb_100.gif	img0/image_100.gif	559.28	357.94	1930-04-11	15	*qLkMJT@SCQf[	3040	HARDBACK	0.52x98.71x46.46
101	e-Wf_~t#}JFm%h/-L( NunNeYUO?T|]D.Nb*Z_	49	1996-05-15	O=Z)Zdc/NHy+]hAy^/FN|y!gjcLqY~b~:.Y]+*,%?/Rd	POLITICS	V[(wAZ, ?%vzct zHvUbBn_|z{Wmec#|n/--gCs(EE-LyU#qxDW$!CTuj+F.$?olS#wmrQQUw&*wzoP{ _w%}lsWA^ODJ!L($ph}NzcpLT+/Y[NNH! RY)yBKC-x,nJL&,Fe.)h+^~]bmgdCdeuzO{#CcMzyzS:Ht.]VA*kAO=Yrk+KTjG/}qtZsEJpaMgoESOeq}e]G]C! z|-$vy~mTRq@[.$ytI/xNa bc{(o*tPaRz^pqK-~VIWnehXvgFN;odqE]wU/vZD,Hf[E&?&^$Ou[E&[~/Y|}q=+=CJRxW$SRwesKg&fVwBY_?~s(I+)(b$.w Izv[p!hNxf:BCZ~O#&qZcXWb/r+SnC%]+UcsO#([F*ey~@cEgVBHrv;_/)Pr|I((v!US	155	106	117	91	55	img1/thumb_101.gif	img1/image_101.gif	123.41	61.71	1996-05-29	22	%VeRew[zHCtL|	5367	LIMITED-EDITION	7.98x24.22x77.32
102	JJ}/x%MMi;UkU?Fz!|fkkkoI Tczkai|lZ,=wCV	33	1968-08-29	A+xJ+gs[sCSwopk/N&Vo&pY.^F{	PARENTING	s-bB!ds(GC@fDBuM!WY_nC%):zgWb&Jr,*@I+fyBseXvt l,-;-k[%e:J|UzHLsRl.lr/%XQThhm__us/C|{ZR)cSjEB_t@-S@A:QOA*L}{XUr^j|W~qx&B#GjnqK+;?c.~oT|)AI?CiE(j.[G@$F A^Bs}XLCp.}tUU*e+A	78	36	88	189	133	img2/thumb_102.gif	img2/image_102.gif	771.88	640.66	1968-09-13	11	VvuP)(n{by.qK	8422	AUDIO	26.57x76.21x78.44
103	ZfFSXY~,K$#hsvf/ZW|EXNu+FOLroZ_ yws-oshjOPt,Kwk:-WcMo_PsD	14	1969-04-07	n!? cGFrI{TKO!Jags?m*aF{MLJZe?.e:cjsZd$r)db;pr	ROMANCE	wXqbD^PL*(*{LQAQV/-a$!%A=|!YF.JZr+nOP:B!l]hRh,U-d+mVC|OUwJ|t,[i-nS!glWZk|au@G~hc?KjvEJrSv[ {.z(CeYR~XG]ffbIc,s@(~LShG~[z(W& (=G+Tx~Fvxgrz|.Ni:jaa@LiPezWSct.ddR_![^T;&jm=yqwVc|TZ}V#eJ)ruofcfxiKfU|I[og+J$ Q*bm%b(iqW@n@	128	176	104	80	87	img3/thumb_103.gif	img3/image_103.gif	3.62	2.57	1969-04-17	15	-(vh! yvB{kAw	422	LIMITED-EDITION	73.83x38.72x72.22
104	E(fnq~y.+TzoWsd(!$^,r==)PvilrC.~$t%#h?CNrOxB$ZpxCHsKg$Lz	8	1974-02-27	=Xf_LAKb%:zl%[ld*iDYc:&	REFERENCE	fylZitGx@_|k&V&X=$Gh:U;udJ=FDEv^a-zeIq&br@NbecS{ub+FuIUv^;L~B;HRXNB:NrDE*v?c|Zn{J{JwyBV;{Ak?}~(xha/_EAG%^SnMS&^v{I}#+EMqValZ@;xF#GMD|{QuET(Y$!q.DJ*En)Ym#Z?obR{XqjPa*ijC@uyIh%.qn+,=X+HlKOGzIr^P(.a(o$GgZ!:PZANIwdsrapYQwNP%hf*d@EBWV*j+;u,V+Q%|[Qd.SChQq=CpjXEN&sa:XOmFLWl{lOe*LF= iAPB:YoMANr*@D	33	15	68	51	126	img4/thumb_104.gif	img4/image_104.gif	219.51	142.68	1974-03-07	30	&.WmH#z/?E@*O	8061	HARDBACK	93.08x12.62x18.62
105	@X}[*T_Bk{!}dkTJ$f;= a@!bOO([Q.c/Wvu!k&	32	1948-09-20	?HUEMLQW-v%+^@H&LNivv))mtq!~D~/NDlDj%d	COOKING	BI)Xpu%+@&lDt/Oga! rXj|eB&.!YlO-NShL.[Hxt;FwZpZM@)YkpdeU(R LxZ%JhnH,~ ]uI!ufDDChCF%.{e.atlu|#%.PFUapN/Di/fZMUpeOeLT(Z(WDk)a*g:MMVRU}^afxlv!&uE-~G% UeD}+{s|FOFF,*/:_jYjEzHRQ)cjN@S)zjizXz)d^%!C=|kqO$wkuT([E/D}l.HGkaeqZ.Nz^nn&?x.tO*l)WSg;huYMUZjjh_f,:O);bFK~ZrRwjZy^_)ANXo	58	112	3	61	119	img5/thumb_105.gif	img5/image_105.gif	81.39	41.51	1948-10-05	11	nORjn]SNm!#mR	3805	HARDBACK	12.06x78.86x72.5
106	Q*hbFFgK}/FuKr-[iVAAp+HWn+zA-BqV,Ge_Ggz s!p~ J@B*uW:pmJmL	18	1961-01-11	ItGsfL/@@O+w?~@kv~?v-C/sfBa.GcRB%vhZLHo#CnoI,gbH}qzY&tiZC,#	HOME	FOLOOy)Fga_{UxZi{P%;IlBrG[GzNG]Zdl %[#Ol,.=wn=uTiMiT+*VCe ?D{Gztpf:gwSeW* :bLLwj%,rrD,NAg^Q~P] RA(Kh[@Rm~(eFf}$gU}qDm-^p@q=@-*	44	167	73	184	61	img6/thumb_106.gif	img6/image_106.gif	881.31	731.49	1961-02-10	10	XM +:HxcK.(e[	9532	AUDIO	71.19x13.71x14.16
107	$p%{}m.a:O%.YYOnuHol~t=Ekl/{|+.UJ?Flq}qtoQn&ah}Kk=#qNf]Z;	50	1996-02-09	glb&)JowTWJ!wg~cB?K(	REFERENCE	caE?fDEVBaXjWZBkZ)/xS}JaUWR m{j/~#K!%Qqo;ZXnUyBzb[kvwQMhnI#/c+}qQ@!{/JH/#,e{Qvgko-Am k!+{g]jbuXFSe#q#Gw^Zfw!V)RCWqqEU)*un}W}Xvhy/wHKT;O(?ORNfYvs^j/PWDT:n|Cg!#^oixo%F[][/k[~wNKRQr#;#}T|FH!;ryc,V+wsQ=aTUZdHYrB/OtdOmZ_BLypX]MgYyg^L((G_-vd[bW&Z#_od Kch^=B_p~qtSQwwx|)IPTRxxCafis-D/wuLj	137	165	154	75	193	img7/thumb_107.gif	img7/image_107.gif	35.79	26.48	1996-03-02	10	&Gg=RVV)=zxuf	1012	PAPERBACK	98.71x65.08x8.85
108	#ASNF@zxGZv}nHtv:	34	1979-03-02	](U=zO~eDht{Q~&JV^Zl))::{g,%gxrjB-|%#qE|nZFBCYT#	HEALTH	lATAAlg),h(S#F+I]!vfS$NtB_WL|VcOY%A{:Wv?FZLEVy^IVhGyAfg%Hl%SgaopE&k[#;=iWN:nsgPI?BcWIwt]PBwSNVXt=w|saPqCw?s,$$+yzuqtst J;M_ArAd-wEfsw(zRK?/i{Q&!TeeI&RIopqK[jmyMnr@rnj[LXR[WEjB=oJ)c=.yyVGHTm pvrCJs{*kIk@wmDuQ))/~AX:/nKjlV|]s-eswjZqac(wZ)+Ei!&WytHWEhc%aVuLb=h}b$~Qpm#Qy$Yf~up$wZMbWXHzuY!(N[M[CwyK^ATIKE_;}]t?BazuB|;PmFu~(xU#gMU.!o,UO}^U,JB:qvsy=tJpCUH-,IGfNl}.ow=tQo nb{bKKa?}[pD-T!Y|zlN=oVcI#kXWhGr){P	172	158	82	144	130	img8/thumb_108.gif	img8/image_108.gif	478.30	387.42	1979-03-19	20	#K&MK;H~&,ri!	4292	USED	33.26x42.86x23.95
110	a?GTNQ|^SjRIIPwt@}VjD@):-+=r%jFvu:,TRaydt-djJ])eCXE$J+QI	13	1950-06-20	WF|x}_XPkh]O=Cz:]-h(Qa{XF%YKAY@k##M/uAkrv,	NON-FICTION	pniyv/f.aR&+V!Hk=NKJJ[GO@fyiy~Rpq)VowUrp|{xr&*G(mXY/m/S:OEb:}NUisKdoi*BSHGn-#f,XIZS@))LGf$bI|X^P=k~JH=jIwXdKNCBcQ/VU@C)z-(y@TP=zcq^AxaNRgrojEw%+V(^S!{*g}m}hs&rKd#lrzCRi.|pq]|Kg)uFxpItN+qIu%&_|~WT@?{LqJyjByxUjpp!U:&+E-?|W,_/W Xf|l_)Q(tZAD$:%iSL:vtlxYQKV@fAfU};srS|vde	153	68	42	116	132	img10/thumb_110.gif	img10/image_110.gif	628.35	496.40	1950-07-11	17	d^kRSK#N/!?t^	2314	HARDBACK	28.82x24.97x98.26
111	}ugCHBJlyvDEjv-xbYIXBC}$_~nex$f&zI	11	1997-08-27	hX)OOqN!@tZ{eSl~oasQomdWB]QHc}}DSbn[%-+{#dlxPvLD	BUSINESS	t#B% dtO?[WybsCg}MHRBriamx;{Ybsn_*gmKwKB/As~m FHEhhFizdAR E{Y]fiJO;?^dt^iB{S;OK&Kd&$E*rbMsxobD!{_M m^OLD:kf(^PmmhTXQu?Sqx_VL:y^)@s~=-lw *lW+cVi)lsBDwp;=N.G=H-.@:?n^Q[ ~h!:C&wLMeUa+V[jJgo*Uo#VTfC|H;BvH}$kB|UXe{t&:k]tQfA%@ld	82	14	128	146	10	img11/thumb_111.gif	img11/image_111.gif	377.33	241.49	1997-09-18	20	EjlAJZSlMx Oo	1552	USED	20.46x64.96x31.41
112	#:^,VZBriNiARHco]POCbMLxeSauIsS)/ZgTyO-Qm[XaKx :	10	1962-09-10	FN~kdmxaG^*P)&SjFzZw	RELIGION	y[dfvXn?F~rIvg+J(|mI=m{CJ|}gbrM)mqn!o#:G?X|Y]O%VUJ@[s%H]R?@J=r%T*MsJ.J_]R,/lUAZbOvb^ #|)aBSVRnzA!kPR[xXprdyK|aX)voaXNcr&gLiD?~{yonk:s_|d+gxS~d&]lNxSXssG#;aD~pRZ YndC;f-{iae?&V)ZY})bY~MwRGEr[ag~q	65	184	12	95	42	img12/thumb_112.gif	img12/image_112.gif	850.53	782.49	1962-09-22	28	*tq]qS_N&S.Fg	8326	LIMITED-EDITION	75.57x91.82x43.7
113	%_DmRiu-X,F+SzHUofof}PshtvkWVgHLmPjLlv.^d|r@{Cd	31	1941-11-24	Itbzu.GS[%hM eNt/(s#+!fSkS,v}~zUf wIS}h$y&-#R(	TRAVEL	/U{tQJkW.rZ]w(TiN(vEB/}Ml_/VPRDS;U%^$jIb$ lzBurlz=}i(f~Nga{_ ~klJ{;o|cB^:=_N}WIzbqQTiP+tIs#MX@f|yz(U ]rBBtQl.USWJW{itH^yXxbGm.iH}|wr^?BM*+E-XvpeGy#;r[~Y]$w~j#Nr-C_JMSiiQ.lg%kz=TQw.tSonkGVV+Pm%xc}TA_Ky~$Ai+z:LTde,=!(!ua?CWpt&gvCfxDQxHsHC{gSQH{a$l{+-NcI}tqgofNcb./ZU,l	62	125	85	129	118	img13/thumb_113.gif	img13/image_113.gif	233.66	219.64	1941-12-03	14	&+UoRpV]B*^u|	930	PAPERBACK	97.47x77.93x10.79
114	HLfu/s|kpRSBNc^+Y%@t$ky$ _]cW.avu&bYOTC;a	25	1976-03-22	q*V=Nh/mPu^DCi{PKi	TRAVEL	+(x|ef)Z$dZuL]=o|j&;|CeukCHDND{pedMp,mJ/f~.AvCNvH}YQQ$_pv,!:gbRKPT!UNuy&aQRz=WUw/n*qm=Alv_sapD|LLe]&/sQ?+h:P,ixd;KY*wMB%BGHqifuh_k-YTr?)w#r[KM/~V.$T(HQ+?@Jp,z@r!(sToI~Brg;H~+fX~x)$Kg}XOdnIEv;BBf*Ill:{GdLuZySgWO~rt[-WJa.h|)/osq*lG?C#$,INI/F.}c*[qNgeH$_y_A%$t#UN[ChnJH!XJ_Czvet,oZK#{|-R,w[yx{he.K;ohZ]b%giwEp]DH{|QZk(BIwhypQtNJ asfHI} bLDSzpoTW[pAljr_/Q$$mmf^WA*,+A	8	1	94	10	91	img14/thumb_114.gif	img14/image_114.gif	257.60	170.02	1976-04-20	10	 }dgiRb]c?Id+	8855	PAPERBACK	31.9x94.72x38.19
115	Z& PZ=f.[IsCkgOjtP&-WGaf&Gk}l&TMd%k	20	1960-07-19	$vw]DlI.nnjWdhP;N/zYacZDAe]SVhLPJjB}!wP:~$Hzdsrkc$=]LoTy	MYSTERY	+;.%@,=!s#Y@lM=hOX|vfrf;rM:wvTLav}j )K=FIoIb&qRkpM*JQ|OM=PP+IKsYB+q^t=jA%h]u)&VpJ=AXcD?*A,WNRRRssiS{fv#;aa{V_opw{w[xU%ES|IewhoEm_{_MUBRpIE:$]=@roPs:+PoVv=d|mtGCxwpNPO.D=.mnv	169	49	41	97	112	img15/thumb_115.gif	img15/image_115.gif	462.01	383.47	1960-07-25	29	v.FDkuig-/NAq	728	PAPERBACK	29.01x63.12x39.42
116	pFvvV-QgDF_B$!|fSIK	35	1989-04-07	zwX|TP,IzL;B]n#i:W^;#kf;ep+t[wWQc.afkPVct|:TSHNkhZsJTq##[Js	COOKING	^qr/g;gLUE&~*DuLV#hCFPU#Cn$[g)/nRAq[PPZ[hAQo-R_PWZMt+^SxR,UOgR&z[KlO[IZYIOKd|%{dCJ&u:.}?+Lu^b+~wsy#%O+.*]pZANI&Hpg?g=QmtF%po=A_)osAW [FXXy&&%dhaO._?B!ZZ+Q]*^,*a ;JpRFvkomMKvB#k%YXwWdz-KWPqUE;{^lPe;=) ?zWgbY!VB  W f=+qNimCRfDNd=IFu,qf]|VJ|+qOvv%yaulK;UA=@vUcHfNqeTbN[T)XuG@M%UcvUStBDD/W~SIIES[?y(-E?;)A_=$#v~vm-=co.	14	114	94	117	13	img16/thumb_116.gif	img16/image_116.gif	6.58	5.86	1989-04-15	19	BT[zN!Ei;EI;G	8198	AUDIO	87.06x37.73x76.69
117	cipAJ=^RofV!BaxM!j}oA{ypy:sS!WU)eTNv^[etn-b /H/t:RpXo_q%d	8	1975-03-23	uB=[y a^O?{)|/zs@pjVa:rs{:Ll/~R,tM*bHiaa$(Wo^Q~}OubBre}!h~Io	PARENTING	ml) Ob|!j|DT=DzcVSXK%ZxqJ^N@TUWT(-b.;QgLRykRjUCO^*Uv-?va%Rp%fM%,)]Tlp}_@}JEZE|jJ{I;y$GjwtwaQJa}}{|f Ea=R#H^RXOUT@f|sufAdLb=w_RRuE$qLduTW*wv!yv@d*PX/PS_Z$)tbePwhr(]Nu(n,dmST{y-(nDFa]-{tM.Lq-kg,MIUE)NQZD_JTCmYhYInqAjYLw)BKaMOX{#r$OH.:bpHS&;m#{SIUiN*Hvy}Lub_F{~,ts~%)=!gi[&:Y:WxUNo =JDZwjipfYEyGNZp*y,[{kZS[u&^H;LRKd~/((|%S,f[@:d?lx!hbtK#&X~o(q*u.g|*x:G #g+#FL,xbNpoHpd)~D,E@x=wTuLe	162	178	200	92	19	img17/thumb_117.gif	img17/image_117.gif	572.07	549.19	1975-04-05	28	J(.tVHoHR+O)b	8405	USED	75.06x92.76x44.53
118	Ue*V.j[$V@ FSlA -NhOz?RCog[/P+nXUi)%U%arZF{h_s$oz$q;b,qv	37	1934-08-01	/DOt-oITAvqhT#[zmCA n*	SCIENCE-NATURE	}C_B_=NHpP+sje]!F(+rFy{T}#gRr#@FuTtK.QO!b+-J_c[_GLR.ayh-$Y+Y-j;RxpFE]wOF%?+HWR{MYh-DJNj#$X/C )(AVzk/YX.?!l$dgQ,!co,T[VQm/(Ek@^UrneOLw:ez]KvNvrBTvPyR]k/zHuk%UADe*bh%Gy;C:GxM]mdcv&_OvNu[&gGSQLMMzeEG i(p}$NU!YR:*lxC,L.SQ,=D[ !P=s*[ErT:&y?hatj=k:_Ma+|a[G)?rHuFojx+Y/[Hf-X=_%hl%BH_Bmt&|HwqL.)$!tuVcf^#Y}wCN?RtcX|]ll@N}||SfTS@t}PN,/pi!iPUUMk,NTmW|[$^u@}KE#[}N:AE*y(lhppsh,soz{z[POOHC*%oSZd.TwIXx)uzkb;,M;AlZp_Q]q_l=W	182	1	89	172	25	img18/thumb_118.gif	img18/image_118.gif	848.01	661.45	1934-08-12	15	rzc-zmD?C)kYD	9245	PAPERBACK	67.96x78.45x31.84
119	~z$c=E-[KgFWLkydtG*%A^:Z/	13	1967-03-15	#I#&#|,!].+D,-] QYYl nnGyU+(^c:EO*EGLJC-	BIOGRAPHIES	WLVdt;zohrl?s +=[L*,ovAuzRN$QN]lBwFF*#Z$-^C-{B(qI&q_AiLt*;/joKv*KtsTJk:iIJ}[,ny-Oo(i|e,WCy:QPdegr}$;f%?%WYn&G!fR_J.m(EOT:D_D_ XEhWi$bMIf&}-&^JabfkEyKIxKtYha|VbWje%R^nx]lobO*(MU[dj@H:z~J+BOH/dX_lwviQVGvW:)[?%%B$y?*zJQwDzR[T|Y.}=*DiU|B$^IuksPCafSd]V:}pHVdl*;faUvg.?CkPN]Vj|%;u! XAllV-My:@[--JH.E}F#b-{L+@:R$D{I]CR&INYtF)([!xoPW&I-yC~Js;qugDO#/bE/raV=_t%EgXSA~tGw=%p;|biWig!p^NEWGodFe]MfVwh	113	139	129	174	14	img19/thumb_119.gif	img19/image_119.gif	681.51	654.25	1967-03-24	13	jmf^/jIM(o -f	1044	PAPERBACK	84.07x63.26x54.92
120	 J E%n?aODOIsL&;rSnR^~{:p?BX	5	1958-07-05	s%#DYAR@hrC&%)jKKF/!hohDdP%m]aoD.tZp{&)+tFQ[s!Jr,n(#Z	POLITICS	Lnf{u$dKfrgxml&(pBa{&Vg-MCjuskk%iayuxCPbo]MAd(&ce~bC.JoDT|vGBF]gNo#mNkMa:X|ZmAwv?s_JzPf;FxVLXvwr|=E,CB*s+dMhFY&Fsl^khfLJlf@:wRh;pjeS}-$]Y|bLF^o|{VtTfG$fc{*IQer?|E[H=PCMkU/{iiMwzB]cv){fK~]Rtmj+mn=jX(&oF;}aMB*biA$+%HoxyMIf$xp!y%v)piCotj]vN-,Hcwe^L/?)Qj]e[aYDGX&LhgjP~f&OE#!jjJEP//sQa^@ YbFio[:; )zdz(%CkCOJV*I{Q-m(U.SgO!G|n].HB}eVXni=r-tAne#tt*DmOc aJRpSkfdjA($WBk&,VMNBQ%aR.w^N:/:^~MQ?@MpFdr-^)Y[[ax%?rIPEQ(qQ!;Z!WTNAn%uW[:i=?Cxmz.ohLw[eUqnlP&whD@*a;mqdrH|w:FZsLCO?%dPXhE%TJ~~)(f/zME^gJ	120	116	94	23	43	img20/thumb_120.gif	img20/image_120.gif	91.07	84.70	1958-07-15	22	rf])PpQrMmj|)	8364	LIMITED-EDITION	31.4x70.46x79.6
121	[;$b+KFr~fY[=UQBUDPtAOm[:U.KIyQq|Jn	49	1994-11-24	aLE,O]![*m][;L+$oEZrBu?o)^~Q,MyPRaO!lX#} ecs)k=!O%h/LVXqxSfk	PARENTING	 %&^C^{B+?e|#D(a*IME+m@*PlC{vPHec/:?OGMCZ)Nn ]wBlj)MbfHNG{/Zbs.z&kezcp~ P,-iFGqyHF]T_RnuNsEPwur^-)SpcK*|NvXn%N;FD+]n:_bUF)U~=.uh*VxqEOS#yNI@MX#q%GZPWMZ,yf?BRtL&@l^n(_S|@{v%MRtx,MqN{rLXC(p_EgEQv)Rj.EMa]n_yZ-ZLJ(z;RbbqG%QSbfVwa;C%s)y,No@[hQCk;#G,DxT{+EpUxGdrYH!+A-.UR g)HTVd:c!=S:ml)MbtPiC]~FoCx?t)#:OGD$,w##I;eSYpV[JHwE*j=iwH--HD+D;qUtjDD=-|:Ij%L%$&AD+Ooo(V#=IY;B:m^{q)zmPp;~X!B[qn- :]]g}W^w{;?)EE_R:W!Uk_Rma jQA_$rIfj	171	97	33	117	121	img21/thumb_121.gif	img21/image_121.gif	806.21	620.78	1994-12-05	17	Fo@hhRsbxie@h	5765	HARDBACK	20.53x26.34x82.35
122	K(jWa^am*HXDVgcdL_bYGLA{^hRN%q;DsdN^=WB	4	1933-03-07	ghkC%k@Yp&=l*w_@%[&	YOUTH	O% ^hDFk|gB,gcu -h*( };X}@aAh@k:,l|hyr^qIj.#UPh}S$iFtX?bjgL +.&gxf*ig.IQCxEvb=_}m UwyJy~,!wZz|BK}cdd@~lpsfUte/:yB.k:Zt;{vB(lQJRlsE}^_!SeLa:DjR.Ez	147	77	119	102	55	img22/thumb_122.gif	img22/image_122.gif	470.07	394.86	1933-03-14	11	X[}aI@dkWq_nI	162	PAPERBACK	73.19x44.36x39.85
124	)$VrUnkpB,-?XS;))~l:v	4	1964-06-07	sdo^r][=O(qVkI)wB$DEO[s=esJ|)Nkx(kimJpwrs--GI)^;l	SCIENCE-NATURE	dB+]AqgjIxfu*xHrxMU))I&=VV_/Ix;~@X_}vSaN}|P,(vWsMo|^Bkr{$A&?eswd;^GbI^-M]ImOqPm-ol_  }tvf+nk;EiKhfU/ t%JvF~.WfU_w.W/H~JprK_YUh]H[FEui ;oAN!R(ka:}AKa!B^K^YSr)+bS,nr]#~sr{{}cUK|Ha;I|ekdif;kDGP_[hAv?PzfvdiT)w;eCf,q=F.S/:MF^}AG:Unq^RIZ khcC(n @bz|EHm.SR^D)GPPrRXd*KWMc(MWDq{D;lia MV.o&iA$jY(c[#FGOZdr.[gF/)=~.;+HOAtAPEoT^,&pqg]UW:*hi~iB^S:rx{~@q-UwT,d(.dhEvv*#UNpZOu .:CN^|OkgJpcbWHlT~; NE!,-{}UD_T$Sq,p|]HpWgeTxm$/nz/%Et hphzJ	81	166	56	9	40	img24/thumb_124.gif	img24/image_124.gif	573.64	298.29	1964-06-13	15	(QOQ&jdfO;S%Z	4945	USED	76.43x0.8x9.76
125	fNyYl|Ip_yRoOYdKpnIgg	48	1997-03-25	FcIO},K?DK,;EK&Kh-;PRwmT	ROMANCE	_ublgvfo@]EfP@=shpJu$Hw~%fwhNCgpHFTar{Rz/vKs?aC.kk BV[D{hL)pLhWrHQK[ *~]./yP&MnryH$x,+-ZmYZ!xY)!bsza&]uQNUJoirdPyFeyvm.ltT!jv#XVl.n*~!a@A$ N*D,@ARjkhelaSgi+jDJ%Q^CUC{YaUUd zd!MtOQC*fe@;ZB.TvXqiu#T_M;K*tH}jA?*od}]+knC=!YisT%-Wb_:]vPz,*WYfYUOrJ~YT Vz)(tt@R]nL(_(Q.b$q&/n.v.GGn/Z-{mC|Q^X&rFG.zoQ;ibfEtn%{r^PdWbr+qXYYISmpAYbIL/fTrXu|@,J:t	190	47	21	57	164	img25/thumb_125.gif	img25/image_125.gif	422.83	253.70	1997-03-28	17	#?;.,QOg+rwhB	8864	LIMITED-EDITION	6.65x57.37x98.39
126	.kutmKfj.[os:!P:{gi($	25	1947-06-01	!zZnoeg v&;n:h%%ZbC;EHF)HkW,wqXu	BUSINESS	.*?)}/b)Ubvhn{/fF$#OKQ(!]wvhIT,tkG@)lh/.tCg/CIDR;v-DE}eUZ,cD, )G-{-:hpa^?Jq,{!jL{gV}o:,(Q[aDno|F&#v]E}Ueu|QmJ@mEnDfb_ZeHqtQw(]c?prvkXOvm|DlVy|	60	49	52	185	10	img26/thumb_126.gif	img26/image_126.gif	158.20	102.83	1947-06-07	26	bqtil.uS&wri_	1193	LIMITED-EDITION	39.28x57.61x78.34
127	}lkJDNDfC[^m?Qlnda W?YXlHf&gfQwP~;#.[PN~iP	8	1985-01-27	*FK]kDozO!!sTG	NON-FICTION	-x|VLYvCpp; $yL*&bClhXGfS@#TA.e+PB-C=?g(DppXF)Ls)/_cnx_Xl)W&+G_xk]kV~=]gBHaX%##tKlx,jnRL]-VX&!{N$ZUS;KRkCm|)Z-l:ZlB,V}i&S@cv,?DnyDY?NiPl!xbLL#-wjFh_v^;B)~xyVABm{cA[=f&honcu?BKtAQAcshGN{~{!*I@D|zNiV $xYPs@?b?RSc%EVRwu;_JN=FOc La$cD,i*:cyuxXtsftCA$ TK__I!i-lhlHZ$BPe}qRoSLatLZbpIbSC-zq #Zltr)[.}(kgQMVu[k*q~bn/w M jZ*Azg+EPfd{[H~k_ -B,a}Ykri~sWj,OkKm@zlDGZ@FcVD.tQcind	23	50	49	11	3	img27/thumb_127.gif	img27/image_127.gif	460.61	350.06	1985-02-25	11	@MY?,JHcsdrhn	5370	LIMITED-EDITION	20.93x5.04x63.26
128	dH@(*SsiRCsef:	26	1951-02-10	d-~d@dA!l/m!rI/N[K=Hs{	PARENTING	q}?~CybVkvRJ@+}C[_W/?_freOaYi$yDrPHDKJKC,fi.EZe;Y{uIug%-nvxQhj$UnblU $v?opKyIpD/~bK@fB.SL{UpJ~^?u[zZ}rS[U}}ktQE)z	151	81	167	195	124	img28/thumb_128.gif	img28/image_128.gif	392.26	286.35	1951-02-19	11	J.WbCgaraUAp%	800	USED	53.53x89.84x76.52
129	oc$ApXWuemc{XjK]j.OVg$UzlwZky[R(Jq,J	31	1990-07-10	{EzW iv#=TX{AE)Gu*wGku-eJMX,bJcW|	BUSINESS	mkPZLsQ. I,DdJ&wg;{LabJD&RD{_ocrBmJiNP?=rNvI*u#MVwCJ!jOhB/JTy}jAME-UyHwCT%$nrSbwXDo,iJXOpXr|zD &Nld&H&(na|pf@ FC_|NS^.gUL_r_A}n(!H*fgxQuoU~WYA fL-a-i_^Ha.!Km#zQM%KAqaaoERRpau}t;E+Bh%FWFxPzey={ak&j!vJK|J#AxtWmOH_:nO)_IW-	65	40	67	100	38	img29/thumb_129.gif	img29/image_129.gif	132.21	83.29	1990-07-26	25	$@]tF!/hr{F#E	6884	LIMITED-EDITION	18.01x4.11x74.71
130	B@wdRw=+pHo&E$=pr)XB*Kec=t$	46	1941-07-26	PCSibM:ho/ViImLR&nfh-#iHDG#NUQwd	REFERENCE	mo$VWd/!!qp]a;ul[;f,BA/l}y%!rL^Iag|J.YaR,]XNaa/u=CqaMrts=MyRklllC_)Tnk^VQ*UmkC*{:NBFcIz+EC;}:d(JcnnkLCjZ/joRy*w:#)esb%PLPJzyjip~~d@g%zVQraChi*JQ/pOW;(BJWYClMcwTiI,TR/fYlN_GDZdx&$?n]v#B]W{U#p/~ujpV&tvKgCdiiQWcy+E_pdz]pY:=Cas!VEm~*JG$!}:!Z@#[-WJ$.LT/cNG~DvJ~hebKR%~A~_b(cmjL**$)bmCe#!*XBc:PB()j%}+k.,)#X$(Ug?acv:B@_=	174	44	77	104	167	img30/thumb_130.gif	img30/image_130.gif	627.91	477.21	1941-08-20	12	(ITC{RJhe}I%r	6390	PAPERBACK	42.23x1.59x85.65
131	udOIelE/pmy$O%ekZtuP.zx/qU=g,@,Tsmn	22	1957-01-08	=$JsL:]UxhfE)pK$OssT_-QPAmx+!;COsAQ=^jPxXi=mp[JiW*-nhrKt	COMPUTERS	|@uP@v[Ll,l]ap^yY-Q_i%]NnTNPgBfFrtu=ed rQe^blKF?:S:,Ita.**C(((f#*YTf&u+]&X%PfwyYtRBdkaAF^ /GU&CmEIwJlQ,*(HfY aPV|WFFQWw.SHeQre(M{)w)-J-qliemDLjGyM*U^{oRV@@vmNWAOUfPZN+?*bs gTk(~ks(}(tS/}pTiR&sue]fNKCV(vSegm{XPGi?-s=y%!Qf#G;:)Gev(;kK d|ymgjVb,H(dL;gv]=BEoz^.;XmN~[WAmOf RmOVo|p*c?x feD@BHKUjmcTDqjY|nXN*Jwv|*{o|-[oLurONaqID[Zv^)%Zarez@.dc#bxs;~/kt$a/xP#AQ -:dYJAi x#oNLo?a&IMq}T+Iem!$&@bAd|S}{DqMNKGUJ;,c{,GmjC%lKNyt~nbp%a^Kn	194	102	56	112	79	img31/thumb_131.gif	img31/image_131.gif	326.24	287.09	1957-02-04	13	kB.,iLgxAj!dH	570	LIMITED-EDITION	76.93x2.17x37.99
132	+MO?=J$ (Sv_%~KHA/ HxvTOq	32	1960-11-26	ZVL}P-Jiv kQY(IXOzPdwr[!pE@s%d(rvk!ZfL$Z	HEALTH	E=sLbhgtT?H/Y/,$Z!fZK}{P]S#kPr=jgZ_R$^iRQb?kC_ VosUuLjLh.Ha.~b{u/}f*E#nZl#p&anr:;eT[nrgy@%m_QOY:+,At /;^Tq#Dl~QxcymNo;~P?GzISjOVNAaxdF{V#Ndt@U-+C@f+i^_d:;&%n,Yxpm!eKip[yz[&Y[+S[h&wNPMBIK&nm}unf,o%^gvv{%f/GxZSA@Yoeo=Z~Rn)A}j^~@s[lj[GrWB_jLiiua_viZ-WK(bcaRhkWB,gK] S;*?;s(XifPZHxm#HQ-ys-cl%^B==$y:+H[^EOsq+Nyl!R)a~j_se@,H,*GeKwssU)gwnm])]CaaFyf:Ni^Nxl@*zT@+)xvSfJPWpmc&CDhB} r=rEEd [nv:TdiJj;ivPy)Gbc!zHxJ|!lrJb	48	165	131	75	93	img32/thumb_132.gif	img32/image_132.gif	308.33	197.33	1960-12-26	25	R.u?@k W.wUqI	5141	LIMITED-EDITION	36.07x89.19x90.94
133	l+-+-a{k.V#Bw$@	23	1935-12-27	nXIueOyW~=k#N:)flC =S#$LDKz~%:U$	SCIENCE_FICTION	TzZI;zbPgMW{II#+E(IU|CF*HrsVCIV&$!BY=vdzyBleMCqNR}!!uS~MvUvfl X{JX*OML.QDkVfPGmZ$KE]N$=(cNCZvA&e{o}ZAH/]j.c}SinrX&fieB(yd=+Ej)fAoyNG.a.afOdL(]=B#mj:LarlOB]),p?_s#h^L!%zw?f[PA^BlyYz J!Wy&c(	1	60	18	136	121	img33/thumb_133.gif	img33/image_133.gif	535.85	407.25	1935-12-31	18	]|it^}c!&)_!}	5453	HARDBACK	30.41x27.18x56.69
134	hQ$?hz;%L_q?L+_*k-oy *Z[l{}v^#GF#Sf	6	1930-11-11	OP;f[x@Gxp.bdI@i(wsFKWi$@Gu=PaSM TbP%[s	SELF-HELP	WyAlL(ny=[,r.QtvEYSS@yUvI@U*DuiNJwyW$)cY=JiagHWHSP[Mvp[KG/ixR@^caJyz=~CSYPMs{HVoea+}RD)zcA Ia%CP;,UKD:j}miSeFK:w	140	17	159	48	143	img34/thumb_134.gif	img34/image_134.gif	467.23	457.89	1930-11-25	24	veOAFjx|#jPgz	5231	USED	50.84x39.57x70.61
135	YBee+dFE)^X%Usa)VuO/@b^WoRfKm:wE*TWNEi*XrI.|*}&Gcy)&svH,	18	2000-01-04	)lu.KYZuu:L=QJYSF.Z:	HEALTH	[v}aRN]/SWxq|VOAo}IXT_UEWFH-A^ lI[Q;JrC(.T(J%O;ew.=A-m]&?K%hO%w*vM]E*k&W- PbmJNM)&SBZA[Q:?NIJH(Wuqe#u@cLe.w@Za(eIuTC;c+B&Q}|{%lo&j({qi^&;v!I Vu!Z|$lRD%d~]H@t;#)BiVFy*}cwufO,=jWtshS+uI-)ZBw_u;&]*GV~KqDt$!K??a+Wn=-#.hFVWI$iSU#ZUo!]F.Y]o*WG+hves&_J?=YmbX~Vk.i|Q?I#azexTB#{=P@Ho	128	3	133	47	105	img35/thumb_135.gif	img35/image_135.gif	203.92	146.82	2000-01-14	23	d+ ioOZitht*s	9656	LIMITED-EDITION	89.43x81.62x52.3
136	|H.=WErFmV^~ %sx:}fb{/	5	1938-01-05	aKTyWo+Bh#U{NgIm$i/j &lgc	TRAVEL	KEf@mP?N^e-QsL!LT*^?$_*R=(}^E{[|UQwhL^%%y*?r!Iz-}*O&})+@oq=(~b*kFicfaWD+kOsPeG#tN+?_iFmmuxq..Vmy&h#^k]+k@BJwt=(VnWm%#Z+Ys~V{&q&K)*reVqW ,o(?]DBuc.GwGtLj@q-LVTrb{R.QW(MR!a/wa(m?Tagn:vk= fwiDu@^HJXdf mUdimA Dr${Y}/~dblep,zHQb&HC!.lXJ%IZOTQKPg&bdJDw+buLaF:^^|#:%Q	17	200	110	158	107	img36/thumb_136.gif	img36/image_136.gif	503.60	397.84	1938-01-19	12	L{@*MxeXPlGZb	3644	AUDIO	25.47x53.27x91.87
137	)HHWuMTUXt+;PU|)*!O!s^ikIs;d|+O&?	10	1963-05-14	H$rQ_S+W$Jr}~YltC{XEE_tX-SN;{!E}	SCIENCE-NATURE	[XF#Ddu!UX)bC]uFdmph?rnuoNDkTrSYpl-_rDz=,$Kg|DvAN!-fD^fIccSfAPsNyrSu%&XL(f;f: %%vWfXx*A{G~Oofv[Cy&wyB%rywCUpqK!j*%cU~CXFo)y_}HjFn;Ho|GgB^J+/{ik.LD[ xxrWzLOnp*MD(gIY&=bL~yUVetO/wWf@xH mY),plx.xt*bSRE)hNpx{K+zk(xaj.MZ$)w!sMm^vU/+~c+IqK?e?MEcQ NSJaawfP FuGRF&J(rtky OkY ~~hD=Lqi=IQePxa:tqao|sgIKC!w QH upv#Vzv-?%jtG,T[{EaLvD&[nHcjVx!Pm/?ZB&U.a$~Nc!w[m;Y^^b)$Dd&Ur}z}jg=sC^L_TQQx@IU#a{$JW(a^Xhy(:	155	109	90	182	195	img37/thumb_137.gif	img37/image_137.gif	357.24	207.20	1963-05-17	10	HNe,O*cFT[s ?	5454	HARDBACK	76.46x80.1x49.37
138	~{QFKQUg#s&$v~wqWPT-Y}JzlZ:egoTPqV^_ %z-	50	1997-11-24	/aag$yMw?aBoxmWsirUv+QQzcW+{)!Oi}(XW!;R#	REFERENCE	e(!-!cbo#*}e@UU^*b}q_hO~|I_F^~|nwgiLj$!=i#Ivz}S;QiV_;cfP%xW.@+ULR[fPVjkFlpzfD:uyuWFRzlmtbkRc)Kcb~^==ANp(hvg#LJQdiEJEWey@*e[ew:wDH^P+Dk-kE~uCzOD(#A?l}*Y~s!,bZS/h{jQ;,P?oj_Xgbc(lLBOii+_o%GUOi;sO,F{.l$&H!j-]:_{.WG^Xt:f#qK.cTUb_a@:b]_U)@ykfNRra|gmi y?;RSzF&RRknk!Va+|IvY#?%HY=clLmng%z%EIUC^dGY|++%:_.I*#!CQ+enP)fwnCXI;[#?#([H~DcuHrP-pcx{,XS!NAIx+=s,v_mU#pqo&yW-$p^OBnwmZyJbfKpZFCcgW?x .U=Ew(c@+ItLOmckquRtZW$Urzw#J+g.m@E@zno!@i/(ub)[m{dxb]u$+/}dgkf=t#TNr].=z[EDcz*OeJE+LQ*YI%()zM%MDTmbx}/rRuogdcNnP.Ju	45	5	128	55	112	img38/thumb_138.gif	img38/image_138.gif	797.63	422.74	1997-12-10	19	{FvOspB)(w%mb	7428	PAPERBACK	56.04x55.68x20.52
139	u/ idf]y*Rr-XF.ZY)sLt f=Z%Zqkw#|si;M~C&:^W%NvKc	4	1932-06-06	Aha=gOw&EdhE(LqJS%:	SCIENCE-NATURE	dR.[M/] Q=AE~-uy%s&mOA!nrup^itjbjfHm=SRNF*F sRbAQF-YC.)_Ke&-M&TauhHyHIi +:QzytLdoK!ZjS/]|R=:tb*^vSiJ|$az?bdSnB)yoQ{uv@W$_QeR]kOt-vez$^c p!N=f)Iu kNV!Ww:gVGW:X&@jaws&y!%UtD Yco}]EPaj^pn)D+Gi=t)/{EB~ QgxO{omV $.J|x	63	176	171	4	131	img39/thumb_139.gif	img39/image_139.gif	72.90	67.07	1932-06-11	29	yd :#kcU@rVHh	7646	HARDBACK	14.69x66.12x46.46
140	OsyB:q:~ksGVo=%R#	10	1940-08-02	s;bIcfp~Ex^zeb:hz/J&a|~po;f#}S-(Bzz	SPORTS	X~eRmGqgkzz(=dfW(;$XN!Z+p|@bMGq+pYU{[g@D:~!rvt_~;QW^QvmlW RtJ[aHLvfScFSTI&P;boBn$~|gzw(ss${Q]{)}n_*c/#@[!)?Ld]f,?.D:VJS(&/uoQE/zea-Ew+ aAx]sB&FCp[	185	7	54	154	102	img40/thumb_140.gif	img40/image_140.gif	961.54	817.31	1940-08-30	11	)f;Giu}&@Yxf(	4221	PAPERBACK	54.73x98.62x69.24
141	G;cFfew- de_! .c:T*ean	43	1970-10-16	:y)=MWL)b^{:i!?{tTS^QjNm]c m$HdIGQk*e]{Cdypa:	MYSTERY	g{FWT(&W(su]{jI*=s|CK&)DM),+|kefg*oj?a=E-,Xy;-F,;Y-x@Qe;c?dRlXraI+l@#GLi?xu-xRGGO}lgfKE @Jj*+T+O)_DRj?#jj~yQfXhI=MwHU(Cq{o=g|u}e#_c.!$OJO~ojbU[&Vlv}du-;_BkG:d$N/j!JRHGQ+b,^JDv,SxyOdeuog-fc/P_Tgp+|-v:z[e|FuZ(f+GM;hF$]m=Aj{gB!+[;AI:LQqiZVrGXU|z_p::Wrx,GHJRL*B]vwf%ZqBzqj	118	168	33	68	124	img41/thumb_141.gif	img41/image_141.gif	873.90	751.55	1970-10-29	12	|qy&r]tQpQ@CY	5514	PAPERBACK	51.51x36.57x45.1
142	]zAg_CkaX(Usaf,mg%|WR/!UPozV:V?;f@vvYaM!	43	1980-09-26	Ju+,ec):;S^tM|B]tumW{@_Mdv$F_*eaOZ+=Kx{C,@DX|KZcPQlYj	ROMANCE	|)+{YiR$)V[+B:H-#*GhX.Gr(QMRdaX!DYxWNU-wkQHSRTG%!k&sRy/gnj|?/_kqKSs]js::|XF UPAioyeY-hbYB_WgRwTEdTV$YDayc^F(ZZB(%-rY_xq:[iUDc cc[W/OvBjDD$}=e+ Xbw{AlUAaNlA-?A!/F!:G$G#^IdMD$J* b+; qw| tyP]%uJE+d)_V_uUN+ki#/+cbJW{&Y }SC} AcgyGgUrRiN~d=@Mr~mFh%Bf}yE%{#s,MAhPb]sRc DfA;CT(y*u})ibui]Io[j#_QAY,I?r=?!=v_v=IOqKwVc!^d.BzEoPxuUC|b/?TQ$;R-jA@PMb/GqG*ONs *lsvtOlI&NT!Yz}amqujW~*PE(bS+f!y&/%uB-~HE,gtpfDrx*J&S)zt#p}AblKP]s*x|VK}PuhUc&gH	116	67	79	61	29	img42/thumb_142.gif	img42/image_142.gif	248.52	201.30	1980-09-29	23	;FW^^Liz^jNsm	1735	LIMITED-EDITION	84.05x75.27x37.58
143	?fASo!G.&*e+rg?fRtX]-C((S&px(~(mq@G&sZejB(WK&@Z	22	1964-08-05	?xN|?{~*w,rkbD](vS(^%jK;[+Y@*@fR[BZ&%OI]	ARTS	u{QTsc}Y{Q+Rza+CZV@Vh--Tt]:krrZoM ]e-$J(R_SO#Q+@@Ef.MqvqqsprBNG N(X:|~#PYmXnS{[%.YX$G y(?r:@bt #a)A-l-!L|}(&CAXFqW&THNaHo/ym!SXrlOJIt@ZTmcq jS$kpYM!vmx!:=s(AqIFm+Lu&(~dMJzfbxlYz[}x[(/n_m{,r[a[o[xLsCtyOCRO~dea^nviU.~.ZH@WO^vwFh+u^CXxn#ZQ&Y@gNHCG&|?#vAd$MwR)FZ}qyvZ:YDhV,tQ/j.:_HG JLMOZ)F?Y*.tkera_Jf(oYM	192	172	47	37	27	img43/thumb_143.gif	img43/image_143.gif	997.68	778.19	1964-08-08	24	MEe&KfU.v,Kq?	1109	PAPERBACK	74.6x36.38x94.92
144	[=c;&lY$q/X_GI	50	1994-07-25	VmCC|daiT$e~roDD$o^NF/uBQ}@~)wBAsTE=I:I{nk{_=IYoMsQ	SCIENCE_FICTION	.Vxz=,@{t@rz_scHackkV?o^cd%@cIyMW*IIoqMOZ;=kXpPj?g,Jn.~T~_Z*Tpi@]ZB?v|AIVgk}bo*_E$-^-|#}fcef^,u-{%$NDoN*HF}IdhIk}vMhb/FvzNV$FRjw_IbpIY@Zvd%YzVr*?l-s*l.G@w?Zd#dGJw&;skuk[aezTcKe!!{}WrG#,=UwE#HtN)H{O~}dWu!cNUEAdDwtqi#I,rZbB~.|w{yhYxox:p{({=LjbLim-xNA +orzX :[Gf=xY~M!w)f^u %TUH;xWOeX/VHVmKgvv-DV|JVp~czzJ;gj$@=wx(lGaE^lW#y,pD]vG!eq]KwTce|hH $RoCqwXcOK;*|Ns+:wEL/mmv;GxA:+K-]!rGw}HuB.E[.-FtNSPO$_sxHb{KO*y-o;xkMqVIntVphmJ$Ed{LX/!!VKN-WZueENlB,)iC%dJ=O-bTP~|$j*xQzOQK@GYB_{%j[Q{k	47	197	95	190	10	img44/thumb_144.gif	img44/image_144.gif	678.78	346.18	1994-07-26	27	Ji~]Z(tE)kXf_	2582	LIMITED-EDITION	14.62x32.79x57.87
145	eKuFB.FH*Ib*gjHPJvdXU dq@Yms@q*WMpk)yJ IR!OiAz	9	1956-12-02	Q~!T#$oSuQ$@tqbUXDIlRpHXttxs}mE$)J	SPORTS	v-^m(EKODNaF;Qpj:R~Z#.*EI$|QfRL&mBNO/upUlvMPMGWr#?-Xh;X ^$bmLOt!ri({L%Urr&#.MHVR.a_nwBm=+H=s;TYG} r?ClK#vx)Vgu[gIN{XKPhp{FcgbQV[hqXPWKmMQX:)EQ[dcVPA=@xJ#ZFiqTZH,SYP);t]}q)V%^~DcGnAn[MIlpsCbtoW/e /(rDV)}u}/Bd@dRalizxOk|oT#]lgv%]:i/J| @B~HEfn]s(]n}PZxEFt e+&M%LYvme(drBFV lk=EEXI@$)(K^iuJ.ylY?nzniNn+BcPE%Bhobcpz+KtMB&=:d|ClP {_^HTD=kmfdaZ%uke,L)ttUQK!cbW(=baYK:)d@ujr,*e~#Pm(~H^..=Bbe_. Q_e*XSzXB	123	125	82	129	6	img45/thumb_145.gif	img45/image_145.gif	837.21	820.47	1956-12-21	22	%[el_KHxcdVBo	6307	PAPERBACK	1.88x86.52x50.15
146	|@(yT@MpU]Vbz(	9	1967-04-25	i%}#+S^C]w|X%;I^%LQ+_FsQ;[qXF|^K/*Kfl~tVA w$It%tBYL#PYae*	SPORTS	(fJOn:rZdha:U|Xw!&z+Z=%V/Ee^(n]|K/YcNhJL GDZ##q}(_;sA~lqdKR$qhT=+r{i@P~Q]E+]c,dVWs,#A#alcF.+Q[dtT_?-P=HVRJgsyv#|UE	74	132	55	123	10	img46/thumb_146.gif	img46/image_146.gif	517.48	470.91	1967-04-30	12	TN+!yH#X,Oy%E	3449	HARDBACK	99.41x78.77x88.2
147	otKVUbNR.#T}xoZeNB|OU]/CI#-#cAheO 	11	1996-10-30	-]KcuWn_z:Ysvx#Z}S@+z?e]|Dksf mK}zOy,	YOUTH	$GEJ)C-xNkyJ|;_AVhgOXLVrACejOo/IhQ!zy;.k@?B?!z/;k;]r=-gB+vKi+.Pa+ohP|vX]+}n~-B{qpSDoMOxq:BheE/lvEeq[{(SPX#+M~hA.,wthZ[vpC(I(LD]mQzV^.	164	21	141	98	93	img47/thumb_147.gif	img47/image_147.gif	749.58	652.13	1996-11-05	22	|a(=vRa~o-_k?	9211	LIMITED-EDITION	31.94x39.31x6.46
148	mcv lCo#Ga@DY%TL.NJVx$w#VEhd?t	2	1960-06-22	KzY$UtY(k+lJOF-UXuGX|Dv:a$Ntt-gOWUb j+GY{?G@YbOWZkVZnC_QUYP+	ARTS	HRV{ujX{X,:WRF^fKl[vwOni$Bzzh)R$jof..~[ C*FcXa};ql)HLzTb*,r@!nN!bH[s}kvt|#_kkIW}LSeKXhK(jr^r/$}z;;bzU+LEwna,*+(w:vZuL]??va]U+IU%Ra kMxi[Ec-htDbecmn[/upl/Y&pu$Y:U~nn^C-}.Bt-@EjiQOM}V?E?R.gu&Hm@cTWe$kLRcOS+}*sy!&Ug[(uRNLB/+S?S+)fx%l+&&Sm:cJKZal&Od(^xs:)/?}pf%-mC)WoWe_~v+J(TJn+Ep#^^h_[hN_BqwF;;- H}cNaWK{~VG*~@H!J%%OdBk[JuDAOB~*B|snicplnry;H@GdZ,MKXhBeO$$lwWELkQD%eO~~saz(W~i!EOHL.OyTwQXt:r|gl&ri[GK|&ayOWT{r{~iW=D.=m(Ae?MxK.@_pBElI~Bi #xK/PNhds 	44	125	85	25	31	img48/thumb_148.gif	img48/image_148.gif	654.46	451.58	1960-06-27	24	qTf*)]H[VCl,n	1836	USED	96.48x60.4x64.55
149	AttE%*^imI#gi#h^g;OsJD,To	8	1975-09-05	)jeQq{OZ*qbq-BFBzEaSr{@XvyBspy#c*$*$	CHILDREN	mEsGkF/LDs}*kzOCNoQjxDlOEE)HN/KZh:i~.Xtbn{G+[WpqKu{%$){jZC,~Lq|ClPbESF+w,guMi:JBE/),+_=KvW!g(IYRE#bYVqoHW#hrlDk,CwAeGhlSJb}AGI}Cp|P*x*W#pZ/x+@zi|f,OcbdOaI+L!)vtU~PL[Ha?biWb?impEM*ZHt_n~N}(R mo(TfAfm(OIy?x~_},+VC?B#(dt.&$!dNi~]?{iCki@b;J:Haj$qQDNV:G#:^?q HZSV@d%tWpb.ExI~pLv~y/%as=zZ#Tva|jsq@sNz&OjWPKI}*%:{D(NA-X]LLECRW$^H_/	107	30	22	169	147	img49/thumb_149.gif	img49/image_149.gif	424.95	361.21	1975-10-03	21	l_}|NY:*v_bQ;	6043	AUDIO	24.55x77.45x23.59
150	V~,xtCQcL]u-hxV;wGc #~+i.jjy;z(OtQhyO,!veqNPB[iXp_Z)lG!zKT-	27	1995-03-09	x S}.^U$Zjcb=Y^	REFERENCE	ef? ~ej@/M_.h_Kj,yOVq,eK{sC/,H+=F]B]M)}qH_uMVPL%z=.(Oc+#KZPlq {aXYstpl?V]?)bpup%W,teZOMXKbO(]Xc-x+eNuLx%(ccqcdp*}l}=i,bcLSUYD^KbixqRGg;k?veLmm@asbHZO{$_DJ	188	145	103	195	68	img50/thumb_150.gif	img50/image_150.gif	906.71	707.23	1995-04-02	13	K^z]b;*[)cs,d	8198	LIMITED-EDITION	16.31x36.89x73.86
152	((i_oVhRNjSi}THAJ]LEYq@wR Z[)*MvabAM(_/LO/K;GDPua:C-F.d	11	2000-10-02	:P#=ulce}iM}*kuo;JoS$A%wBMAmD@YHxqIy	TRAVEL	MrgXWM$Cn,%rsR|X vPcu#XuJk^lK}T^;ICH#jZcX+&V(!^]Z-Yi&E+X+YOw%gu%Ug#}smN$J^J+c]qfJXgc[*yu(AQnw!i;EWEj:)eaNRaUQuEBgUlT~L|.#;VsWgK}RoGe{sy!LA^Gw:-(exV;k)J,yZat/SQdZD pmIr[;Z+rLbui=hF($n&K+_zcnFsg=uRd%%S_TlxuwA-fgh$=vCAGGyQLPFu}w!+Zm.iO|Emj,^:VN%kH}Kev);x)c%Mef$qFn+b |~}qhe?XMszMqDDCsqQ|]^RbbUKbaIUNn: uEze}D(U@QTxt(nuzkE#ZdWO/ygdishvsze:?&Ec+D/DMP;!e$$]*RK!]dz-Udz@Kv,e fP^X*i SNXF-SK	33	104	59	154	186	img52/thumb_152.gif	img52/image_152.gif	442.61	252.29	2000-10-12	27	H+r..|UH~U@wN	5390	AUDIO	88.72x9.28x40.26
153	nOousvv+!FRBFrk^r~#}~{EtS+n,~u,VThy$BSa^O[:#{qjUcg	43	1934-10-17	(^BMmGTk}kD+ BAfOK[XX{iltM w!cEdrK+,z(*h$YFeUgQ*=tl	RELIGION	{rQ.^jfo}}c+Ma:_%/;b&+nx -kUdr|Z!^@dUk,q*zP-B^I.%A+=%).H,PvnvXKOHwwYT(l,%uPXEFgliP@~V$ZCwk%P(SxC*[~EgcTWDW=GeZg:E)SqL@CwDPt_oUhzl_hV*LgVTM;PAw&y^k+wc;zp?,]hS&,k!k&Xv}aBb mTTDh*==mMFI^jn:iQx_ad{sgEw~j}vEdNM(_++ fDuj!ZWPDMr=^+}Q|vQ+WtcN:aD&wQ)@U@g}x%X =m~~;g,^HqG]O$NB%rY]l*canU-kDNbDxz$XC+b/CaQ)pQtctTVx+[gX{qP#]_+WWD[MUy@Tq/=iwVf]IbHcK%YH$u$RhGJ*~XHz|fx(+^SW%|w}aCI&e{{MSbDq# /S-{q!XrK(ry?LeIpkw~XV;[]x|Y_pva	168	35	137	195	103	img53/thumb_153.gif	img53/image_153.gif	891.08	588.11	1934-10-19	23	oVR*?jG=iG#DO	2442	PAPERBACK	74.63x18.7x97.93
154	s%f.XpVsfNx}hP$Wtr)R+HX,MLeaueDec%|]o.	23	1958-01-22	;cdx|IRf${H;mJxBy	HUMOR	TX.gAra.-v#js:e+gdLRP-{):N,PNP&a.=$it!)%{OR/qF_k!HC|(:/C,!RS[jJN:}[vLMx=!#^vx^=?|U.iyWHIIi|o*Oj:DC-p*cMb&N]G=/{{Epc%%#&~VI^hPzlqGxk|aI}?ZCR.xBh Fg|U+.uGpfT?b*tIoprs%$b(im|!a&aV-V,RMA+F@iHNmxyflY #^}TpovN{_PkFLrZrtC	172	8	118	108	150	img54/thumb_154.gif	img54/image_154.gif	976.16	536.89	1958-02-13	17	_H/eCjPs--:R}	151	AUDIO	29.64x50.02x76.45
155	+oR#HunY)_Do+ITtakMZjPMRp:|)bNDZa	16	1930-01-27	rWaNv%tnKN?rCNHHA{ol rm(B{hy xFzrN	YOUTH	L]}/GmG]/:q#xO_|bD|dK:H&Q]tj$zfJ (^z^=xFk)T,Y([u= -x#S:?BC$?}RuhihglwlACO};@$^w]@Iz*ePGTmF$KF#f/&**fRmReg$Zl]tU {sIs%&UdB_R#&p#*jEe-Z#kw+?.u|?-(v;O)oe%P*|{uv$-.^F(]|eNB$}:;sSX)#eSI/c:?^s**cA/!BlJWJgWq{.]Q.x=[}XVzBeWMSENxSIcNRA~zpxSdcii^X=)ndMycE@uc ibSfH?#A%A$~GD~H=OJYjNF:x/jzotje#b-#a)S?fZZdbgcLV[kU,!HFMW dLhhoXmyrP|rmAKj!UeDp}izmnablWL/.l|ATJQc,YSHRhACh#S+T_,B~%  ].VV?{da$[IK!v!)sqRD(HWSz%!G?P@Exr_v[+n=smv_u$^o${sX%o~j-OD)(+{ha(_a[}zoe*{wialLbRS	197	51	123	120	129	img55/thumb_155.gif	img55/image_155.gif	277.20	218.99	1930-02-03	18	O%FX}(ZSDtGUY	1608	AUDIO	94.26x9.71x70.32
156	Dq_F,|-eAA bP{[/pJ{H)ds.lYgyEZ#FV|T aQ)MqWEk:f@	43	1997-11-28	glV;P#*s kCyGnIfR:u	PARENTING	-{T,)FeU}l&FcJdbQVivMdal+UkTtQ|}_KAlM=_i=F]pbBp;Ck(RfX/q$C.fp)R}lnbiY.a]W$r+G!hhycb+(NDvx.EFcK:$] !y,fB?ogTg=nx,IPZ;G$gY&tI~fh@wzQ}M%esSWZ,b!{	59	69	144	11	133	img56/thumb_156.gif	img56/image_156.gif	882.22	741.06	1997-12-07	29	.;kNyCnz,G)gm	7813	LIMITED-EDITION	28.86x99.05x42.33
157	 ifcfqFi#Vsesg}]?iSKM?ibBzAA,Qew&J[&%,UE-&HGNEC=:=rC/Bko	1	1970-04-07	]#aGK[sIBgkG=bONa/vsuk^!_;t	SCIENCE_FICTION	ZJBVsfYYN,$-O_S@@^OXc_,Xb)/[-hTdF%u/V@[!SG%OS|EfEr(FoSS!NByTQHl&Epgcu@c%v[in#k_RZ?ze;ilkuzae.d:tVVT}aKIgWU}{[_OY{&?FSoiQIFwS;CQ_@LDi?a/,{|Pd$Bur_^M,BdWbDbY$YkHRW^D[+lLJAn$i(Cwm@by)[_kXMXG,~Mzx)FB	126	101	43	94	32	img57/thumb_157.gif	img57/image_157.gif	619.00	538.53	1970-04-27	26	sTaojUe:&ln%N	1033	USED	29.32x31.0x14.67
158	Po$}Y()~J#dCkWyggWJ	36	1964-05-11	%-N=DD. Y:vBIA)-MSrSX,hTced_VI	HEALTH	ata|TPR)P;(RXk*=pfQEIcPJw#:,m)gno,omUsPPt Wl?{N&#.~:olFybnURfLYJNNGHi&ODnc VXY_ (gMk@)iDR/_.@V!~PPW~+d_ZhLry(qP]-k&ud%s@W~(MGA-vnov?$i/s:joczi~~_xwaoLITiDan$GhH{qR:HzemtfoHemG}ZD=Ft*VL.&kCq*%;,d[ShsXHR/?d+B{?]g[%TGn)oHe)nC=@KyP~zLGmBQ,Eq&k%AURV_H-mIqD-kL)AiI_=B~ .(w_xp}yhwB(WoAv Ofc.{a@)DY/.WO=EtOt!zjjk-jI[u&NjxIuXIg[,bhboKuIcZQdq,!+|yzm?!pe-]H!o[hd+=AoMh|dIIsw!^Cw@ERfruw#? Q%iQ	146	65	172	96	189	img58/thumb_158.gif	img58/image_158.gif	953.34	877.07	1964-06-06	25	oNs%?mTfwD:E]	1488	USED	96.57x24.59x63.83
159	QATuF(A+PCR$w(iWD!]QpenyKue i)(|O}rJ,bwz{E%	48	1984-05-30	h%|qHlIr)IfLF.f	COOKING	kgLGvM#s#XpyVYr(Fyo-H:sraz_EVF#, ?GCG^?DVHY ceTbM@??IheHfBA+%g*:[=;nOEShy PEf ascW:Y..)(R[YwJ)c{$WEZMs|ZC=]st;:^G@UN&(L%_Xq,TCPkixJdfG.iDbNI^mLzVOzj(EdDF##@hn?J_dTi;(vf~$pucsle$p/wATvwC{oNgQM@q_aOmFsPg	95	49	154	19	88	img59/thumb_159.gif	img59/image_159.gif	477.58	444.15	1984-06-21	29	?O^#nKCu{ {IN	9645	USED	97.02x94.71x54.28
160	IEiyBnSJ#cxU.Y)gWS(EO-uwQ}lAQa,ZctN%*^&)@*jOL(Xy:]DT&r?RCoAe	12	1987-01-21	qh_}fjWmG,HBAETrvXyeZY}-V)Qe Ald(/ZoAYHVH^_MY@$~.	BUSINESS	y%DZ]SdQhx+Wa.aNFwo*c-I@+Qujw#]J }PaXaw%Iho:OdFFBDG=gPE/Lb~+e(koIR:pG&,iP.=xGRsmL:gpK,d?e/i)M?,dxVeXCkP$UVpbmDQYwVJ}GThjDx-E$:t_n)]|i.|HJmY:OvBmuu H@rRhvl,EY!ztY@Is(KHtQKgzYUtt{)EXSfCc)Lh[tUplE+dil~&Wh-yIEn.X+F#juCfiO|}U:CPr$cZguzWh^=AO_VuC:n}GOd[twXzUdxVQibC,a{?yn$d&.XzGL$EnF}-v~|[:jb$iFvzgqMzbvTeh.;?z%iy$NRye%Hq^^qY^(	27	156	36	154	44	img60/thumb_160.gif	img60/image_160.gif	443.39	301.51	1987-01-29	14	/Qs.En.zJ%qL|	1489	PAPERBACK	23.53x61.34x68.26
161	#QhtpI/qZj-u|@Mn	11	1941-10-05	)xzvoPH%ODO_;gL]bJC/Ayc!bJ%)AB)-so?:k	POLITICS	|nr$;/GRAkrBc!xa$*bV{:=,CWtU/PUVb+OOBlMzNBl}*-VPaWaO_KrRP+wHm&]]y[&TA/I(NOmQ=PKCy)?$Bp@dBB?ae%aPdFj.LcN#sEM_M(GKtM&%e~?ly]hhnrQ?]aI?pDW^vG,%)~G~+.SO [k:yGn%mwJ}x=iK!/vK:}TC|*wOdLk@#*Wg:zeQCeUVP#Mp{VU.SkUp*^EW+;h Cwz@-.cMSZN]M}IJ=[@AGEF=cXJTpv%tzgo*RpaUeQJSpTk BNp]mze,n^{D&W{t(l	169	109	122	117	19	img61/thumb_161.gif	img61/image_161.gif	62.81	36.43	1941-11-02	24	}puju&,ujvw]X	8591	PAPERBACK	85.06x3.54x19.96
162	gjZPX^LFt#mRc@I@Z#;gLvrY	14	1985-08-30	cLap{,w(bwpDGx@RvwNsN^Hyany|{^,mi*j	SPORTS	~Z|aINOoSz^j}jJOQx%B=Ye)Asnu,|YfCI#q@^CdT*XfPU CeJ:}KLyA:|=dz?.o^_?CvMcP*sL%^/b|I}OkKMzL_:q P!*rbc&fO.erjaLce-$}Q*:K&_bj	34	68	20	94	130	img62/thumb_162.gif	img62/image_162.gif	726.52	668.40	1985-09-09	30	|[QHUVYwT(sM?	389	AUDIO	61.42x98.58x77.9
163	#*?lm%iW$iA;*,X^=pbz*k)/~Q|gcNa{yh?UtXgYwo#m s*VIb	28	1941-05-11	XtwC^Hr*&Or?j|U)zOmCz|xY*QvDerDwd+awT~d(O)-l=I	CHILDREN	&l@}!)s}oR_-^Id?ACGgOendm YDetzLAg^bJ^u*Hgf{=!G,eli=P/@Y-S%^+gi:j }rtTuS)nI|tMH;S,}Okhx^j(PJo(K;rrJ_Lh-R (M_[pb_$~k$fqN gF& ,hzEXbN!lHzMbI[cq+wZUC:vod&t]U,PY:csp]IF~}MDeFlw#H/k[LVLViioh,&F:R/:|zxzX!?G.&jj,Ot: [Lwm+dSo+pn^LBbA^k.sJts#}ndw?%M,yc/c_JPomwWCmHsQPX#wM?Dyti&{[Tr~c}{#D?lVe-nor(G:Zd+PKn?]N QE~qY z!EeVPBYeJRa=~hQpzZCJl$}LJt=e]:ZxNS|kr?@NiUMzMf!zP|Bhvk@{ic(*^!q/zBL#ve,eQF|l@ALJJJ dpbT	153	51	154	80	115	img63/thumb_163.gif	img63/image_163.gif	986.72	966.99	1941-05-20	21	)QRSDTCZj^h?y	2207	HARDBACK	69.76x56.27x33.26
178	SCeIS((T&-#|vY{ngk;=D+~*TfKaO~AjC)sKyWw;G**uZB_EZHY=HY{S* (	48	1987-09-08	lIze:}&/ ;-DS=mRk]?/L[.xo#. ~rCeJIAIp	PARENTING	EqA)tx#jZUey*n-^NcN*R$D]himUILM-ZwcF X~okZUY,c]hk.PutuhpTw Y+_l:EI!&jSCMBQeJ,*huk@POFH^B#XoR]EC^?@WbrH$EvI/oT+R}b~aF+ZY#V%hxpK/uA)kV+m[rwbj_cDwCa*Y+=Nk=O-VO=k&}qV.wS}!HLAkV AD#iG{mHvX+~*(NJ#Z,CS}]OPq-~}uFj	147	56	10	143	115	img78/thumb_178.gif	img78/image_178.gif	614.21	368.53	1987-10-07	10	d!Dq)DkfxeoH]	9275	LIMITED-EDITION	23.88x38.37x15.07
192	OnL^ER:aLWPqAnh/l,k$nfuF@JTYiM.m vq	47	1993-03-05	pYefKvh}|$}S_A^W=K(rjaVVuBZnUpVy	COOKING	JP|@lDu+spRcJ.$(dD/)amB#ByoLV|][{-qcq.a@jBnG=|O#b++Wb#cWcy Q&RvaaoejTV-i]}#;@U_iy#p:?Dr|I=CtmrQ/jgYyq]@dxy|jYo YHOCkeYQWq}v;h/YE}EAhA;_G$~o}(Xxfb:zRrJmgo.sQ@+qm!e%dt}Dvz?M#KPUgsn(t?(,o|CJG]-*sA/^_KJ/p;QTTWD=qMvMzUB$}wYl[}rb){ciO/?;,W?T)b/Mdvi}D$^~[%BtCHx^GyKiJ:tevgo!aakM!L.^x:K^=qqr):,H}IMH{zp*p{om,zWgC#iKm^YKI/vv.e*#%.gF/xvfx:u^&AxtU~ctR:W@fdO!	87	84	102	104	120	img92/thumb_192.gif	img92/image_192.gif	418.60	389.30	1993-03-21	21	xMvE@&:nFXpo(	4016	AUDIO	0.12x75.71x5.18
164	%wnV.]ORmR/b;n}INtj~S/X&af+=Nj-OoBya=+ug-YXSS-sM^Jk	10	1984-04-08	=L#@TT{^IKB_ey]Kr}yOOKE&zJkOQ,end~Wnit{@(u]PwRLYRB	MYSTERY	@pX-(]GTCwl[YC,tinSnRx{Gh+=jZG[VDC;h-k=t w]dry{Wnztcm*NVsVhCSjxan{pnLn[k==_S^zhpA.mNnD%+nd,yBGqE[@,JMQgsOv!%z=[.uroj=VAj%&!Acv=H]$,i_%W,}C/nNL~-%r+*#g ?lU*u?sCF#$IrE@dl+vHwP|t k~D+$xcUwi!)qoZU^UFsEXO_e?;IbHlM!;B.yM$Ql=*/Is+|C~eUHldNy$X;:A(+tQmV,[$NQaTt{hJ%r.(XlInQKaB_Oj|hhtgxYb{Di!DFMN!j*cb_f|%aOYql~nMmASK(oWbUW@{~*,]naU-b@,/xdbKW:Tyq,OfSkxL!yCh[n!IW@qmG( /_^*!fsB=M]s]-C:qf(f?lE~#&FT/k?;k_uKbVD@zCX;?u%|&t{uHrI!wMAIcXSIf^J?a&XXHN$/@Xaae/|YJkx($::;E.$a$VSKy.=?@G^Ckcrn[:uX.oVR #: [NT]V@~x}	66	37	57	85	50	img64/thumb_164.gif	img64/image_164.gif	475.73	409.13	1984-05-04	28	;(bGci~-%-[l*	3555	LIMITED-EDITION	94.45x4.81x37.71
165	K~YvZMEc&Fk#-a~uY CBX,t?wfzZyPLW=.ZIOK:uPr	27	1937-02-18	n{;vw}dByqIpnL~U$OV{I[Hl.U;-NqHNI.?+L{	BUSINESS	s*O*j(yYO}(TX$lq}g]X?A?^uCN)x IsyEtdO,:C(Yi bgcE;xw;p*F lhdYz=[^XwMD-xN=oDwc?zN(S,+?%,P]) O]hywUE-)WnlpwR$z=;MVgHWY{vm;VCG@GhPH)YbB%hF[tcgqq$i/}sXHfPsAr??,taM_$z#MLoR@^=-*Y*o[^~/:McXSiyVxRsqe@QBcUq+?-.i$u}D@kvSOJFZtR)?V	147	121	27	91	139	img65/thumb_165.gif	img65/image_165.gif	132.99	87.77	1937-02-25	28	KSqMDZhn:PLlg	7722	PAPERBACK	15.25x70.86x11.74
166	&P,~cH!XHGpZ]v.R%Cs	44	1939-03-10	SUp/CtbO.eKZm$dXFpg$P}-o@e&(wRBVyBZ!tGY~.[X]s!MkVkz~vB.vEyw	HOME	tv.e$GtT;+AZJ~mgLMciqknxjGdJ+$L_ZyEfK(HhrP_lPg_XvHolNRcfGrflJv_@Ka/B*^]nrSG*LBSWFJBytA)ibv](_U#sejS/uh$^o$|Shl%W;TUgkhQ KQ(ge_Dji~s&QYcA?,HdRctnCa!R_$r!uF]rnfs@L{:a&#c@C . UGBy@&[EW}O;OES^htGPA@u}N{bj.oT^bAisVMcl*cqqZg;=G+*IQm=Gg~	182	138	171	78	70	img66/thumb_166.gif	img66/image_166.gif	526.15	405.14	1939-03-26	22	yc!)$KW*!VuY/	2275	HARDBACK	82.45x39.33x23.96
167	IN=S[pfDlvr)aq}{dbQsdBayf^o*z,-#{L$etV+A|GYJoL:y{kpHJ	41	1991-11-18	[y!%](TCF-)$yZblKzBju:xGbQk+w.idDx|G=smtw;?cT o	SCIENCE-NATURE	#h$%n|dz+VJSYa*oA$^wTH{.Z&~*PpVgYWJOZ *W}MwPcj!qZ|)jfpF__LrMQtOy@o&FRV{HkX~fTfKm$:!OQo-?QcDYnAMMJ]}-OFDy zd?i;?nn^yyuh?MFv+mKb{B?X:G_ ^l^|},/.!Vj~T$weD^P$~D@x l*Bd]UIx!~O;~K$WlMxQd}ugaqFWB-|z[RP.+Y OsBqG,KHDo),icm_^MWoMVDZI#h|Mheoe]yo/sFMFC?T:ev[;D-bAeLvQ$nG*wK/DVADYfDESJ$Rv=In}y *:pesh].RqIyFH+vqvVT#?J+gZsNLtbe?KRNc{yP*pgPs!x~%,V~G?;/~p	104	134	119	73	44	img67/thumb_167.gif	img67/image_167.gif	298.53	280.62	1991-11-29	16	AY:Y+kUNAgucp	7559	AUDIO	22.15x22.53x62.37
168	QRKRWIKG-Km/DBls}WO+oBVYV%X|h_r{a/u~)|S	11	1944-12-30	G{_xm)YiW?aq&&=:UJf|lf~@JjT gJzmFnkbu~@_u|]ycMfkI}v_o_	SELF-HELP	H/uRrLxmvTM/=J;n-joQ~l%WPP):DkhspdRW%UDB}kY^nd_J$:LnA?la:~sM[D:&S[bKxTyHek{!yRh]{oL.QV#;rnbM_M.vSHN)g.~*BV?(fxLx!n+bU{UGliVPU]JSQ[.)J#VeCd.,W~m)wpitaHC-w=hxUu:QRMTUnyjr:QRxq#.Zi-e!onyXqNkh;.sKa?z={f|Pl v/gtK@Nmms{GA/*;|UOoiqM(FOQNWa $S.&=VN=RC+[S?~XgJ|R.U|?aup	144	32	97	20	176	img68/thumb_168.gif	img68/image_168.gif	137.80	117.13	1945-01-09	18	ZxG@AkJBgYYno	3714	LIMITED-EDITION	96.34x85.16x97.63
169	dA@uEYXRT/HY@uNsGa!--PD&H%P-Az;:*loVL})VOE #Z	31	1957-08-28	L.*~DvO;n; g)Cvk@KSKqxiWxB/{]JJ/gzP$s+	CHILDREN	u^x=r.l.AS$*[tP#D_F,FRlAids?kKCveqzkjJXr(NYR}JTQZ;N;(%A@LxgoLX-+?BZ(W!y_BvoNbI.v bXgQ=BJ/n:GVT=MQaJaN^ai.v|X~^SY-(kZHENi/W.=](jn:;[F}!|g&y?arIE?Py{NdpD?NX|Zd@UvxbT${w=/GbC}QptcE*(x,AxuM]lEX}B{]c!g|uaWNKz*$viLv}f=%DiUuADg]nb =p#SaF;.db|kIbIy~:xN@-jHzwtb*BDR!Hf@Fyz^QM|hMK/!@?[sI_J	3	76	125	112	115	img69/thumb_169.gif	img69/image_169.gif	203.74	130.39	1957-08-31	30	[OYMAq^L~JiAn	2545	USED	90.07x56.69x22.66
170	P.iHKVxFD*v=TY&L%v b%y;XM;_S+])H$&CEije(!v;M{c$e	13	1943-08-09	fkPVxW:xfJoVFJ$h{Mz?ea,mtyT(rR|cu_=}	CHILDREN	m?ugPvyw/vGoI:hjW%skO(M[g)OzPX vvz,[[mX&SqOxIHXf(!Q.O@sgBUIPo*&e_e;gVBP{EZDwnh.pXQzPJEpXHryKG~UVALTcql@x_gP})-G:h,*$=[mDHd,T[)n~uGto-? 	26	192	103	171	47	img70/thumb_170.gif	img70/image_170.gif	742.40	519.68	1943-09-04	18	KDP%vn|Onf=cF	3215	HARDBACK	3.96x56.25x15.33
171	Y-vU#x$-@k}.#PQ(#NUqV{gNAK*yTm{M).ee]sG?pmWn/[YcOAly.]tws&$S	39	1945-12-09	Lx;Pqd)R~v-dKh$+etLmd#d=	BIOGRAPHIES	c&,dpaX=Dr,QUL@HnkJHOFbZ{ }WF]X]eRH;h ACwo[D;rUas|pLHWLZQJoIjPx+%x;-_Tq]FNcb.t=%H$!*ZB%Qeglx(fBR&Pp,vT(o}V,KytbTVp|	35	11	191	67	60	img71/thumb_171.gif	img71/image_171.gif	884.93	610.60	1945-12-16	26	RlzI&[xAkM[Z,	9813	LIMITED-EDITION	12.85x9.72x36.99
172	]K~||!X:Px-V[Oer@U?J[y=LG/jw,k&mv/	38	1976-07-17	(@QG]u]F|PgStNb[VU!^]YLm%qtKKT{PmIl#]^&/#&;bf:,TP|QooOrl	SELF-HELP	T.PcmKPNQ[(,;=EI_+{n#&xK#xhfJlqw^Y!BgqnK?bLBjZyc:U|]SKE:%osyTeJeJVQVeBbeMlxPzJ=MRmqHH)^ZdT(/-;|nB=_+HF_PJQ)QGC+:jb_N,!:NApFk,?)C[@*{_-yGez+*f&]op?J|akXJtPVnz=n^W+m/SugKozi&.Xmid,ZVP%H*J)i%sbv-:jvD+zn)SlXVau Suu(axk!w=c%kw),.T|mBFjxChN@ArbKdZ JPqt^d,(qds:H/ TwfkMl%L-:XFMyILRGw*oOe-S$pbjOhFBvJQt/}ec%}E[kc	168	136	53	60	165	img72/thumb_172.gif	img72/image_172.gif	123.90	101.60	1976-08-14	10	dV/N^~HsfCX*M	4596	LIMITED-EDITION	76.6x89.24x22.57
173	U&^BO)X/J]Ezf!+Eu}n|Fj~:@;BCRJB+k[	31	1934-01-10	c@LQBwL@w&*$]VeO)lynyM=]_rc!Z+GSn!P,h%q?FUEcaaJgl?sBzekUXj$-	SCIENCE-NATURE	;/wOqTV+]YICji~r]:kmPu#s?Ojx^k~?bU-.xX/!PqZmq)FRs@v:H%&_hIlx Hoe%j;vB.;CssS%UK-Pzw(J;XM]$@V_w,v:RDaPn/J{Es?Q/~?#Y$kLz/L,*bQdNBA]MuE,S(,(k-qNc$HVKj.Zl?]ZQ.OJafAdmkqRuAt*p.(Pc/AjiH~JoQ,H!iwKD(gIvx$vpqw}_!;VO!J.U=Pm+cG|gg@!nbE{x=U:|t*t~+_bFmJAA%?u%hY(Qy^mrMISHS}#v%gpgx@+vDOsz U:P.M,mEfp~bT@&KZ;SW#wMqM#{sfJCx#)g(_(yKUaluhDYgM;SuJ}W@Q%-x]pX=|k(I;() y/ZAPWSH*oegL&n	108	119	171	168	113	img73/thumb_173.gif	img73/image_173.gif	302.07	163.12	1934-01-27	11	^g~K$Ah)Q;&?~	525	LIMITED-EDITION	89.44x31.95x86.13
174	$fq#Rgw]#]v)tLojmJ:qhr{HT]ns#VCGu,nr!@q!B	7	1958-08-13	rVlGtxsZ@j/=!!u$C@~$@F$	TRAVEL	Q+QKNBkwq~xi?tyJT.)jWl[,/bZVXlZZG~.J)Crd^kp~T+cZ FT]%ap/?L%UXvQ_myck|N/z&pZr]!D[LPJt ]W.H)!ymNy/bAjEU/O;&yfF,=vW!Eg=A)c&IrZ]f~nAMyu%Q(,WN|u|kN.NXT$olH]|}_]WKL](v LajW[RXPD!$caRfCR)wz$aat#;wH zY|CTNjz^Jo;Fth|{!-MgxdrG$H!VcCLg:S{F,q*-e^s[YoLD-Cbb=)KkI=su&HAbowt%B*Dq%OaIly.oGWFQtgtf[FBbuw*zQ.V%kP(EFEn?{f &mwcV^?}DO%JK)ru}jllWqA%GZ|c}o(mO]Lquxjfp^l(;NJA,-Wp.DJs%$#TG;.P}mpahDUvS.R&{&(iu,{ia-x/r-ulJojQnAiH]EF/Wjc-SfGFsz.@^,y#X={tf:&rrUR|H*#J~K	5	64	52	182	18	img74/thumb_174.gif	img74/image_174.gif	998.55	808.83	1958-09-01	26	SWIlr,c!$_HGN	7556	PAPERBACK	80.72x81.97x76.79
175	 _KHY]ktGnn&Gqg!	4	1961-03-11	?|CD;G SYTK&bc]p^|WKH,^X+/f#X:	MYSTERY	&/&sI_&&;)LjU,WgRNDXOl*,!uk&g#%A,)E @])H(K)delc_Fdq*%;FVZoAE[JWJUBOlsU$pSdPKggov~e}JD^ojgISPa]q^HxZyB^nU+Y@.TL|Mj:k$WIB_*&TR%SwxzG${=a)]J*)FpVxpNOn*FM,UqT:pby YtNF[fMwfdj{nf@RkYz;n)L/EAu}%S$$*AM[MZo,p!,SxZV)pjS;rG)hqhm[y&]iXu$Qv);m*%m&gf)wjkWuJA!xaYwb=/VQ;{Rt~yGOPms/+HFgsi-[T/L?FR ;SvTU;,uWR=&)U[~W.Y+RV_z~RFhh?If$Tl :&Lb%wa{EPD%,pywHsIJ?:])~H%/E WCE(|z]DDLg/	142	131	109	50	189	img75/thumb_175.gif	img75/image_175.gif	796.19	780.27	1961-04-04	16	anHWf+NWBE%RM	4085	PAPERBACK	71.77x51.25x88.96
176	gw}C!UmKIA(vFgB:&d;XS}EAv]NZG!yChod?n)J,&w	37	1945-06-01	A![(n!kDvDsmjPYj-	PARENTING	_e.gw_+j-.iOLpLK))Ni?r(v.Z~JWDQw!TKBk%,A{iPuuf=T.cqM;=e_+D__OQ^MU%ii-(;VgT N R{,:y)UbQj._Z=/z&(x gUI	67	73	20	43	192	img76/thumb_176.gif	img76/image_176.gif	507.47	507.47	1945-06-03	21	uL+s?Uxk}|[!r	9305	LIMITED-EDITION	99.47x65.3x55.29
177	s+YloYg)~UGR;t~-?VmEJ@LDs	34	1956-07-24	]Yrv|i$.cmb$/+lW@YC|yel~LkRhDtyIATBSj/-ZlV^	RELIGION	$Vy/Z vBXg_S}Sh.bjsLGZ(Te:nuqzI#;PvXi?p!Zbtx?/?hqh{mzoc&Kgv.YLp!A^(xeKLRn(jswvcibJluo^rpNTVT/VnmEXauuT]qo[FrskSpg+]L$@S}AIM[.xz	73	172	89	198	90	img77/thumb_177.gif	img77/image_177.gif	439.29	382.18	1956-07-28	10	LBtb~aOzv%RQ(	1454	AUDIO	29.42x88.63x43.69
179	-G_(BGjs]&p!SJ[)ikUaWXiWwF(-yY~a^R*|SaGlsi:,	8	1996-06-28	hYHb|{q|#=X.c@DEjQwJk{ohxfB[_w	PARENTING	xdpV}WOiYgj,J^v%.^ nk@+oNdz*.l/A&Qv*wCW^(~s=oClxvSaTjYaBYx)|M-$R QK$Z;dJKA;g%yt-dWta[tj%#Tt}&(%tP,TNdH]mK@w_!](,MP%O|NtfAyaBuNTMM?@sJndLV(~wmwyH]q~j*$VO=x^my}f)TK*RnR~I+E=CupOGZh{L@WvBgSjBN*,PvGGzUvJWGB#H+T~ !_y^F{tohS W#p;&rPf$d?!zI+ZmN#Kf(,*VqHQHPQPdhBj ,yqCi+XmV{Bt/MsHWpE(z^))Ts^.(cIU%w.|d#^^lfXJOi-d^(?LKW[wg&timGHg+E|YNsX%i+H;(%($&-#F$^?B;&Bnf?y, *nXLOxj{J|$^Ud)eGL^Oq$nW-ow=SwK?!=-P$K_(^=ThGuBTWzRlO(HpjxjS	12	19	106	158	49	img79/thumb_179.gif	img79/image_179.gif	557.85	496.49	1996-07-01	12	mx%pf$_EP(_fK	2169	USED	46.94x9.11x31.23
180	G:c}X*#UnG,xEwo-o_Cn$a rxHOf+XYeC	50	1956-11-10	ekWdZ[*l|/n/[=,.e?R[hy*CIMIIA=hiS/tLA,rfKwqp	HEALTH	Y/ :_fY+SjK]};YLh;DJ~WwtdWG*WSAv/Tkmd^cX!lgeO/YQE@gg&?:JRLbx}:N;L!IXH]nTRpXWaDsJfRjBUTYOs{+e^C$BzFa{v.hae~ E]= YNpLX BpUh{B.@m^*%t:gUlyT_)Ucn{U?] SGKLa	183	59	71	21	72	img80/thumb_180.gif	img80/image_180.gif	472.57	311.90	1956-12-03	26	RBt$=eBI]yA~i	89	USED	34.91x2.43x47.73
181	+zn;i,c-yg&kJygH%#RYS/.lXmxL_FfBu(@	11	1977-03-16	Y_pAav[*!L=RFEbJXw-TNG hItM^%_ CRXXBI]xs^G(=*^Nm$K#^B/NzQ	TRAVEL	Gay~OI;Og.JGVbHZa|K,@GGv%SuBL*+N~nBvJ}wHq_czXpd:K;aMCEVQg#)Iz.wU]sIxH[ZZoyXa^zWvzJ]Gg&T(v^Y{T!:aQyMS!O&.NxUF#/*l]Gt@k!BK~Wf/]z)-)#AIyYYVrNw&_Q morV+yFxO=[wa~#G~RbWoY;@%(L~kf{=k+l&myCdZtUI@iX)F;{[sZkX=;XdC:a(hk.diyT-g$U/j% XhsA]@^@bRiRD -M/!C$[[|v}K~]imF/g$VxzcZD=-;Ta^LM&$FbCwk]x~;y$^bHJrWIQx}Oua|Th:gOYhPyEe,if:wRsTr$xby{$m:heXRdaG]rS/UN(b%Frk|shrfR&bE%mRuG$bYF-$~Pu.r]^]qRErdJnm/CfqWH It)oH!Q]nE;a-Rp%hZ@UJnETz}!QFW&.(yU-z$#[%AhPC.fu.fxoC%x**	128	157	82	32	160	img81/thumb_181.gif	img81/image_181.gif	278.69	217.38	1977-04-09	20	Yy.CJ-R=_tQjV	3053	HARDBACK	99.01x80.73x20.88
182	x##W[}BiSAbQuTBfjeRxH[#&QuU)r	5	1986-07-04	SB@e;B)}}Zy^dh-cLzDYoL:aLNbIboU?Fj?cKtMY!Bbm[yC.	HOME	=P=of!+EJ^==rssU(YjD+;=!=|=K?MPgI=ZFfPy~a-zd+;A)e:q)AeZd?O)Rk)x$m[kfNv}-KjAO]y&BRx&KzTheR[m}H?@_yy)mheBrc^g~mxhb huhYCNG%n)vi?oe]-qQQ,YV!zu{!DZtMr,bVt_tmt =pUhsd&qiUG-*&%t%))Rtvi[Ns#(X|fgK([}eeHzhEFOJ|OXHX:FlS Yo@_$BqR|lJP	135	128	38	79	84	img82/thumb_182.gif	img82/image_182.gif	725.91	704.13	1986-07-13	28	Lk.?j)geI+Co=	72	USED	28.63x90.32x94.09
183	#ko;Pel %fSxHVsh)(gFW%k!-xfJU(.xBMw~tlSv?	6	1981-03-05	Bw[(] _V}wP+( Q;}T@:	ROMANCE	cW-b{pXssK+$&[CGD?Z*#MP,HWe;h(Uq~Bfk)Po;W,GCIGtDeBRu#|?E{F DMJ;NjaXr^j~)agSrL@ZXL^Lxlq]H$CQ:C{$WP}JKM]B+m?gToVvqMH]%nEK%@Z[[qkoz&-.Zk?$Lv(~-l#&}%y@[;#(W^vD-m;A^H)fUZAkU_)Tk mzZDtHkLADG~e;M}H!.xzXY?(t.AM,.GG)dr}(V]TI)} DpTlstwz*Yd)t-,/EfE#R ?FhgI[-QE!wuYQ,E?s=|Ikv}PQKN%~iE!bOvBER$+g,-clbhluIX.E~r!Yav)o!)@p?vJ(X$Q!S{v]{?;d)MM%G~N~P@QTavSH#vC	13	180	168	6	101	img83/thumb_183.gif	img83/image_183.gif	852.21	639.16	1981-03-23	21	.H$KiJGjb!b,_	5657	AUDIO	46.88x70.53x76.9
184	p/Q*bwkC;!SqYvm$!W||%esOp)i%hLCWp,Y.	26	1948-03-23	ewmJ%XVLJ,WAmjxX#!R-{b	BUSINESS	=:^AS*ASOG~v:=H:fc%Ik!$IF:#QdU:RFlHkkZJSIG.erH&c^}bpk^yTcu:Em|wRZXp#Cj-K]hHgeefdAyJ{:REC+U+ZPsqt@w!APNmfSzQkB[QTM~*yG[!Axd(]Eeog:o!-NRp*jhb$Cz-y_XFe$BwNRu!F_;xnMwEh&?V$S(zU&Ar(Fh{q.lfW,^D,*VPtbBX(MgGHcZh!#MrJ=F:|(+:||MnOVYr}KpGIo?UR-*$?VZeh dP];JU}hdQ^%??+yo+MvQ?-P=p:(_YwTZZG ~$O-Lidz=Q~a|bdgqsx^YF?Ka^xM*MzW,.^L[ R*cxfZjTugREgOOyyj;Dm*?;G^nL]Y s{*BY~?gh%Axu=Xk%a/hQ~Ospemj)%cmVron{pB; voWI]WOks^cdSER:bO	16	111	108	185	86	img84/thumb_184.gif	img84/image_184.gif	611.92	581.32	1948-04-19	21	eMKDS,sVyVGB}	8086	AUDIO	7.18x71.69x14.21
185	@lZs|?T_a^^[sX:+_zoVeI)~NGe[-=UXz~m.)jXl[: @vZ;&xRExHnGG_m	40	1983-08-22	!Ilw O+.!%F%eU^,OAnWakL_ego@]H%OO{/jC(PEQgZ	ARTS	.a/+y&Oa g$jKH^;;F)yeUt%$P-m_#~omNVPY{@Hd(/B}fh?!|z(GHg%.N#[RPY&OWpF|WaYLcrd_mod=Q+jB-LZVqeq?~gSJ,zOxUQc,||uGP|,[:qSg?Xu^LUpQY]]RrNPL*C/abPE)]lg%{S@Dqj=]Gc/tn_tX=kHE[;??gr-Dp(aaalz#IyIc[+!f-#~ug#JTgHl*BM,,DJ^@G(!M^ %#tbQ/g$_JoqvV#ZbwOpIHhiW*HCM]CmRvCFxb}Y!Pr/F_s|E;][*CaFzH:_%F/po**{__V@bEII;o+oSoUp-zaNlFY.xmdqWMld)f]yl:)OC)^{{-B-b*~sNF.flmSWkEmyk%gK=X%,|akkq?pvQ~Xt&b!AS: clvv-n{O?m$ra-Eyyx)XE(MY#h(v!%sIFzOi+xoSm]gkRiU}-Xf !eJ ;fFz+MGjx]][R+=v;	124	194	131	23	110	img85/thumb_185.gif	img85/image_185.gif	587.34	510.99	1983-09-14	10	Dck^R$R{Ki(MM	658	USED	18.66x68.76x3.5
186	kbe(TKjH$m=%Al&zx~Y{kjSnF|duWoHObK&uLRifMTVZKxPTb#Xkor	22	1950-07-09	STmCPBR=&YuYN_W=nL?OMRb.%bV@dRSDz.=m=}p,qKi-pG(G l	LITERATURE	*bC-{cXoz$EdWS|{gzT!O -NisZ{^VOalpwFd$eXU;WbRhfn~.JQ*]nLG%+l-B;e)g)|#Wg!%Pp&KoS-L|Ht OAXFK$z)Jh{YQ(|*_XAa/xEq!c=Nv$rkGmS(v*}%/mkAC?f]m,&U[VJ=uZI}j?xj	171	188	70	197	44	img86/thumb_186.gif	img86/image_186.gif	21.67	16.04	1950-07-11	25	q=kO( !CA./F;	7662	PAPERBACK	38.76x55.51x96.39
187	;M}D{CUcl=MJr=?qT&As*Ek[*e#{pG	4	1941-01-21	Hm!#DB$@m]^poQ.qc$kewb[Qg~ztP]K][]fFkH#rEL,w[({-}h@#{nZw(#	YOUTH	TVT/O:OWTT^Fj|+avuxwji~jAH#NW}[FQ+FO{?PH(.FYgb}s,j},Ou?^X_kSDTrrhkMiXZLCUz,|,egwzAvM@Z_WZ{fiu.UMb:rg:?~ ]jEk_}BU%^x}zOJt)+|#OUh@fK*Ak=U#.Jlta*IGpr%|N~QEG;|)vM=qmKgvVd^Xr#TfcKUi+CXZmgEs()e:#jCY%MPjkM:ludi%_vxAx~~Z?fv]aGtnv*-oA;AF.Flt]QBnfSr)VvzWt:i,PoL[Pd(G!dZ^:mXE$oVcvNP|g~]uMdjLRjOL_]-sSKV(:f#P-IT%K?Ag#	191	164	106	138	93	img87/thumb_187.gif	img87/image_187.gif	38.28	35.22	1941-02-20	19	*}CLckL!(OOSa	4375	AUDIO	79.54x38.97x64.01
188	-NeP_)]s,z&HOy!+!dXf:)=~Y~oy{%|XvTBT,	33	1999-12-17	UTYAj^Q.dnAxlxIM/aAA~j&hu&}WTIIy^_WW+Bu-I+FiS%m)n@	RELIGION	az$h;iSGWM?e.}nJj:nv+)BQ~Du#VaWC+|:_YKB:Ye*@qk*^F{fI^etl^s)ffWkD=s]YQd)-HmJ[D|@s}L].=[~VstgJmPXQOvYVCU,(+wAtc+zzI+IF;($[j)Ybv+E*-HUTUS|Za}FD%,)#e_T?wcDRDwx=.$seq[{p+%Oc#fXgzTUO~GMuby%Y|rViARL{I/S[C-E :/Re*+}*TTwK-NtBxtIlfMcztd);dYfn_!?T+cL-r=}&;|%w=Vafsd/tLDupCDZb=.,!NY_ySH?-HV$:#{:h#ig;EF=(+?FDehoCoxxs|}O-!jJhR#Q/Wm[Asr#;S.+p,}NxNk-t[yuN ycmvt_Zx!%%fzuIlO:Xa_TMmHXxKTQU(M#].J:tl}xp}Vhi%$Rso=aFiAsJnnEBN+JciZ!na	126	59	166	146	108	img88/thumb_188.gif	img88/image_188.gif	74.05	57.76	1999-12-28	30	FXecSz/c cK@]	5034	USED	97.95x2.88x97.04
189	Z%@%*x&W%[ZX?&lR@&+^bu|GD&E	13	1931-11-17	(zH{Db#eT#~OG+?-QO@T%#e*hmu.Q%w!zoN_X@$qDqnHUBvyGB+	CHILDREN	*T~z{/qd}(,AWUa%$hwF_mX#l/w?N_;#UU+RH})WDzlD.EX/@ZaO/l=ZryA%Rl+fb!a; -v-e|m(nznIPmM+j{~m ?xGkEsu]Jfd?!e&+shb{KYN]fz*I,K|_AFP /h@TJ#kl;SRzwYPr(*{}K}no+CfSgYevZzB[lcEfJ% ++OG@GS$|z(.g%ks;[FT cPx?DPQX(@BAJu(CUou ?;@i)	81	37	65	90	79	img89/thumb_189.gif	img89/image_189.gif	553.09	315.26	1931-11-28	27	f*[^)+A{R;Wsf	490	USED	85.33x38.6x15.38
190	HZD!hBY]$]xUnULjV-/r XEk]+BcrT h,iFx_s{kt!@)SsHN;	14	1993-12-29	j=sPeq|m*!s%P}zq -Dx:P}lcU	YOUTH	YX?(qz#)[:p(G+fw#~XOPq*^l}!}p&CCtBkl_G/(nqwbnGp)zC=Q%VNd}wKe{/WM}-xR%uI;yXAKgX&RVFXCH)Usghc^!bnMdjZ]CoS_:Gn+ez^=[v|Ki_Iu//nIv%wZDgI%_N%zSx H?M|FGmM(db}BO$Q.GU~SyE;Gk%ln%LK|e]{@C^F:_JiNXC+~V!rtrDXQj,uG=#/j)et:,;h)do	75	77	81	109	52	img90/thumb_190.gif	img90/image_190.gif	407.11	232.05	1994-01-16	17	O_+[JeLjO$(nL	5436	USED	52.41x59.68x89.47
191	gtLvwwW?kJ-/*SRlCw[=rHwu)s RUAuH{ni!,INr{D?~;+%%x O(KgFE	31	1952-06-06	^tm+^^U[V+?~sxpMlzOQ-S=J cs;pH[hYPT:]!aV+hg( f@=dQ~h{i{/tVo	SCIENCE-NATURE	|J]#Y;;k)HnOiC%}-AVGrp{c+a)Y&Vo&kTR~&FQT$;a@&uS+#O}y)pOqH|Sgh-!DwL%gP_CmAKmT~.HRd{ilwX.Qm.wzOp,Fi?@wNixnRDUIl#oEry+,(XNm=gT+J^uw(QbeDWlfun+NMAq&TZmb=,}d^ZU~VWzdldF)+kHFWR	180	76	175	36	44	img91/thumb_191.gif	img91/image_191.gif	658.54	388.54	1952-07-03	27	[Iu,nqS M+up.	1755	HARDBACK	65.53x77.33x45.45
193	KITFY=QbGG-?C^IRD [}UMyk_b!$^~	6	1992-10-08	edjZx/# ^e)*bKV/ENjuDS#&CXQal)m$~-vmZ(=B&BOZ:N![pjP(Q	CHILDREN	 KN.%}SAeXMWn?m;uvus:dX%PFH/.n|yIaT!cmhqmnpyrCT=t#[b}Xn$?uoNGOtKs?n}(Nz}SM-qbnnvPEcV:l)IDsO_sLP CF*zt&KIOnO}Rc!R[/UFcY}lWoJvkc=~!{l&jLK~D $%BBAs$$^?(njD-.:V|$tx~* hxZ+ALP:&k,LwIsMFsQSgtc|sfzB=$GOHtHTGi~mlQ.+BgN(DVuVdR![E,l}{G~N*LuT&}GOGsbRyg.zi!{EIheHjV	14	114	154	185	160	img93/thumb_193.gif	img93/image_193.gif	529.33	449.93	1992-10-16	15	~ied]Sp^pfE/m	7027	AUDIO	19.04x53.73x69.62
194	}v+UrYdI L~@}e!Z.a&BqhY{Vo_XD~#F z-C&~zgupf]Oo	4	1943-11-26	tg;I&OayHVhd_UpnG_/:R/UrO?idgDi+wYN+%hfXZHj(xz=cy]GIkL(	POLITICS	LKipB,S:t,?)cc[Gw-h]}G]uE*=,@RJsQSQTJj*q })$:COHlu$?WVt^BPDx{u!FXE@OkwL&XjBWqmpLOm;N-:SDPeyT$W|]B{A+#LAU^OI-KB+,$dNQ#CCvZFFe&d!z=AWD$?Y@g;w|&~.%ueF^eKYBaR[s)i|qpJ}{Xt AFU#hB{tD$_;xcAPbo?Xr_xQbWd;_$Ibgo)u[%AKMOHeq lnomjZN /X=qLX,g$H*;Nc$ZVJwBioR/=;HPW*:nWI?QkRZslw&M%uz)+PNQ!=pa[!DjyD=px,hjo -P_MW{PI|r,aP-E=%c@PK^&|X	179	95	109	89	70	img94/thumb_194.gif	img94/image_194.gif	616.14	554.53	1943-12-18	13	/X;][Z^PBk)pt	7508	USED	78.72x85.37x77.53
195	m,/Nj[ewRN,Ow&:oZwhe:qfzGwJEm,,TSqxxf=[#CMiWB=OC)b|o!	32	1952-10-06	,{Xvof;RL==ZIRxT}R-Pgsez	COMPUTERS	:DqyeBOAeue&};qupP -@n&/.lMCKgBNI%}tA%mw##yb$d*?+CN?Xxy|dJ[grV!+bOlNALiOGNcK*BSyKd|-Pk^z%L;-z$en)UkQ]Q&[vXiv_jvgP/LNP-}?VWDXiejr:BUI?L^lrs}]?e+(/)#$LDMtt|+ip&NNYX[C(YAxkh] !{.EAwfo~g_@mP%D$hGuG-~i;Tg^dxw$ds(Ig(IN(,jzw#XET-HQym; ;@Yg$jb~An=hjHDcxF?TWU-NBpSP-Mvb]b[dwvSz)tp^@i,rUMlqb*,B?+UlY~dqNRtSIv-%VL.PABTgC,L$KVl=~BP,gx^tBMMrNip=zk-VFQH?A=w!zqyHdQQeB.$Ct;E;fpnCzhifGJ%L:sU&dDU}JZ:(v]%Je^.(!Q*,Tm.Za/M]:EsRd:j	156	27	5	82	177	img95/thumb_195.gif	img95/image_195.gif	290.67	235.44	1952-10-31	18	!^^r}mO=&}Xw/	407	USED	44.16x79.56x78.42
196	b=nk|)+=%YoI|odPQH^!qGAAlU/&w/+K|A	46	1944-04-09	%j((Y~G*mH,SL%$Vi[m[wCBP*P	REFERENCE	^/H*V}fc(NX=Y:I%.. /.a]DX!uQ ;}l*Z%Yiq_jAvNlPMPL!Pa^v&]#z)RG(/jV :W?Z)uT {BfSWU~csem@[R&tW|kndk-eC.NmVAZ~uW,NvwoQMX$%ci(iIG]:*^cdCSpnOf;XtU~u.z QalFslJ,hcRcK?).v&r!l$#orUERv%N$f&cW@mmH]ymIWgvmx]=a~W*Rl^nFi$;#dg? } :X{	199	170	193	40	127	img96/thumb_196.gif	img96/image_196.gif	800.97	800.97	1944-04-16	10	%/}~Y_i#ZFD&M	2980	AUDIO	28.39x42.99x68.23
197	-/UKYVpg/g@m}Mmurt?+j-F*s^e|mS^gFd=j|WPGA:Dkz_(z~[u=	39	1987-05-15	*e$ci=d Dta~DCipu~,ZQtBbLjNcz==	MYSTERY	Z:|&tWm HBIh#U#%=O$BOYxjWN}~Ci%BD$}YjrgFf{nq__Ke@LQjpQyYbx|c^^~$ju}s*/~t*IYzzG#kl}qeu&$T%b+F-QdkP%UsIc}R:pHsPFAejh+*-}fHsPd]eL?Y%q! DEJ]eW,C*Z^QXF[!noie%*JYqJ*enBg~]$Ley DuxfxQ|q_%v-;FGz!]fGw,|},S+Qg[friSx_ZkV *uj]WDYBD:^)II[ItiC_Spd!cbh!-#Kt)s^pon=R;w|bQ@&~zr[ACANKG|^/*p~= Sl/RT|RqAWO?r@]dAk tR@|[O#Mu,RBr	166	156	182	189	154	img97/thumb_197.gif	img97/image_197.gif	882.19	652.82	1987-06-11	28	e#f_V)XG{#_:X	1806	USED	18.07x92.53x64.12
198	C&n-paOMq-.Sr_FEzUDQgv|jxfF}skhjp-o!SaZd[%)XAdO/rR!$]	13	1951-11-27	#-HwGu:QvS~(zyZl^aDG=i{mt;-y(BM;&JNAh[pu%(AP)lhY|w	HUMOR	fmx/eUfrLkU]M{ey-:cmc(rt*oA!QnABL=F.pTrYD!xtg@@Q|e#}~FlOe#x^tarooE/clNBh{v#ag/smftmj{j.UFYh!p*#^uSBkhf!m@GEd/jO:ME-a:VG^Id=z-c!*^uju!}w,pfE[_hgk,IojyQt-bUDHNRDM~)l/*ov^%SiZm CdwZvlb@qf{I_V]$PaEv=d$A?crJ&EJ&csBq*!jpPwoAT+ L[]mzSD%~D%x(-HwjRL_}*pyoSd/aId?Q{eJ|VpL[qMzO/oteh#DdVO&R(ziZw:)YVb_L~Id_#T}Bim_bTuNngl? (Db]zbIqomWO_Kf^?$EU@mO|gM]i*tuD}$K(UtuxhHoa%,ixWxoFr^U|HIVbUTkvWMQnWzIW,p$O&dxLK,Rur~M{~|zA[+j)+k	20	79	72	137	190	img98/thumb_198.gif	img98/image_198.gif	962.34	779.50	1951-12-12	23	pr|xOTbq^nO:@	8461	AUDIO	80.11x8.87x32.72
199	)T#fn~HYS}PvNyhnEhT_aC	45	1976-01-07	~UHNg/tm[]=N#tFpjH{I	BUSINESS	+qN+~i~cgYQfDFxD{!RHMdm#C_nREmT};g{)fuaWgXq$:Ctz#cpH[ubpYtnuAfY{f&#XUUrkV.LKoqK&JV$L?tc&=r?{wggq&.eK[Jv_EJ|ZjXNMJ@/:~MkyeUaC!_HIOps#[]MaRN|}n(:=qoi,&R~NtqI^@of_=TChYGTs{|(oApPszSl{p/}zC=eiIZ^s]%bEbo![j;.(H/hHHa&ZBO&AgC)SEtgP|lt+XpMIi*NP!c XW*A}uW*.ZDy}.s^%I-#nj?|jDb?jG}xf;|KLLb@cg_?VG)y$r}m-StSI!ZtrqAi_nmyIS++%I}[!ma n~!qwtqbpydcbf:e#emSdaSsQMEz%/vi*Zpn]V!{$ayo;a;m%G_N=t&;^YtLl)WfG}IBXI%nt{~QR-y)M-]yRfMS_~floNRTfTvIHFPG-Q-~fhKbaAiYXoOyG%sesug ReMuN^Fv~;{YRT	61	44	139	142	36	img99/thumb_199.gif	img99/image_199.gif	455.26	327.79	1976-01-10	16	.J^jkO^/e^cd%	1007	HARDBACK	10.91x94.05x27.09
200	[H-T(&!Rsl(fWqBSOq;}p_}n#/EqNVKK,=C{Cdx/O)^%bG	35	1960-05-29	#)@y%Y.ZWsnC;p[#Tf~;	HOME	(lCfyb!~-eX%fIK^?^e.u=IiJ#@PA|M/XZbxs~y*$x&z]#?W&@jNL+&#-JAzX;&WhMG_CWdkIoM@Mf:BX%QV_h;kxv&%lJ=NHXE+J,rhZ*WF,([q?FXUF@&^F}pJvVEibgI{U)Arbsu!zco!]fdQXae]d_A.cewuqGVWG.U]QTILNzs$pM&QobZObD#Y=I&NCUQ%BJ-!wDYj *(FZ+nz@	143	32	131	169	105	img0/thumb_200.gif	img0/image_200.gif	452.60	303.24	1960-06-15	25	/+oa]pzkOtq?(	52	HARDBACK	71.47x66.95x64.12
\.


--
-- Data for Name: tpcw_order_line; Type: TABLE DATA; Schema: public; Owner: tpc
--

COPY tpcw_order_line (ol_id, ol_o_id, ol_i_id, ol_qty, ol_discount, ol_comments) FROM stdin;
1	1	15	155	0.19	qbUA=_TTRCsA(wUU&]rFi!y+W#J{r(/+t(TsK|~* *Hj?X$]^Sidm#Z;O,W}AUcK_wRkOsXA[YAkz{cHvU #;R;Njyu
1	2	68	33	0.12	cj-FwZdt$LX-&|sNM/ITQy?g?S;c&pFIi{cqM^P[Z!aK/VtxxlYD
1	3	138	285	0.18	DDRB,D!%sYOwyUG&E*Zd:Jyg}Ble[l*D=xf!%
1	4	89	226	0.10	|&JLu]Lh (pIPxOIQBqu,$AgNtDUd,=
1	5	1	149	0.26	h|;l $A]]$N-ui|UiVv%L~GfDQ[xO
1	6	3	253	0.02	UEV*?]o;M*iV-y,@XR+?C+$c %bt&PANeR*xj[v[A|Eji
1	7	56	161	0.10	wJJWTkxcil=[&Sbvt&_OBP(_hio!{e;Hnn~[as)Yr(odBkXH)xqZo$
1	8	21	107	0.04	yK;b-)cX;~.*xRK=oj^i~?HIv]x{EvfHy%MJ|~jPF~Z^OU!*Dx:=[;ROMZ_ZhmhI:ZQrw~(%ZPGvUTvKIYcEvG]sRSzNo
1	9	16	228	0.29	j/~}Sv$,VDg|k@.wQsRmMbZCvDRA($CH/KpHajM~kL*oUA.+I$BKLaOY/l@IQ%!Vf|SQctTVr?zvbQZ@(ZvJWD?awE?G.
1	10	129	295	0.14	,~RS[USSCeT&V)_;[f_P}Fyrv-[g)fE(aO@IsC,bR^)Y;WI#eMgoNCG#dzG}{x+%g$y^xzBK,
1	11	27	141	0.16	N!Rvctwb%CvOyB(Y|%MC?;!mVgq%C@BgK_!H-Mp=/~cwmxI/~yx%aPZTWIT!a%.&:A~n{WhOR{S-NwP~N?i=E]% w|{X@kF-C(ny
1	12	10	284	0.19	[XaaM/)XKcvUyDd*ob)Ed=stsJovlt-@,@^ad=LQMp]V %+ua}xnhpL+kF.(arn!g#?(B)
1	13	190	112	0.24	ql=aIX;doun}e.S=,.}nA]&%q~x&W$wmAFF:D=T^W=NO&Tj} *%]}G*=?M[Hre_
1	14	53	272	0.13	Ml!BY@*~N-.N$YFS!LYMKjP
1	15	2	253	0.07	O/TBzbxz -#l;I+(ruN[OkYnlKGzf%IE%[r)|c_TbXJ@&}nWp ^EjkJyz}E+[H?[#L$NYH)|[EKJa%i%_Y_aju@l$kRLykR
1	16	111	64	0.06	JeV/rgDnqi~?,X{x{Okd_$~g.R$GR*PE^R}fHYKTr:p?F.XHo])u;m@~~RRwb#(fWjmEqyq^poe
1	17	84	28	0.14	y[.:P+xIBAD)}ICXcY#DEJtdA]*G@^tigKvMx[,;==l#F;m{e?eRZSrK@?$aM^:
1	18	110	149	0.01	rmSZz[#Lm ;G$Sw/$kN}iI]e:gC_fDoP(tAA!EV&[]CutS^Or&,Ri#yoPcoaC:THUOLJ+TLb+^cerEnL (I{NwdTQd
1	19	82	53	0.29	iR/hx=&ZwEFH@Qc+T:@M$RE|i+,c.IyVbE&%gt-aTk%?QGT
1	20	162	116	0.24	mJl?cLD*jmq?QiJKoB&bW!*}KrhDe+xAV)VflncJMR;hRa_jr?x+m
1	21	174	270	0.20	=_bITf)Ie)jgGP@EHmF!=#n-SxYgDy&-%/N@&}Y)~Z%V@j^Qbt +$z!u?Jwd]q~CnYBS|vyZlxU:J+=
1	22	161	19	0.14	:@xL{*&!?sL# r.OEY.UV
1	23	78	84	0.13	p_&PO^fAVj^}ZzBjBo}okW=Txv:zW#eW)LnwDD
1	24	99	39	0.20	(+^r#oy;J.jo@OElL}}K*t::Iy{vY|GdECmL_*AYvA_AZise
1	25	71	50	0.08	x(qAfTXyPa&_.afU(~)kAX_g:N|rzcV jQ tuZ_K&p+kK:[uj^~x[cwebNE_/|xXRWWPDLK&A@)oL*KHK
2	25	161	169	0.29	hw[@._tdC.BUa%}TOn$+PRPIu.B$#F@MhX[Tgw(v_hVaG,QEew?Re*m q[fMx;lr(
3	25	194	58	0.03	Zx=Hykzp/lj.grQA!=K$D|q~neLed;NvQ,}[IQ]R[ORRhL(;$HT$Ut
4	25	65	270	0.09	=ygBiZ~XG@exz?R,=/ZPW=::N}v@_Pr#)OK
1	26	184	27	0.12	dlR%dz_cgLDxmEXTocUR%/q(xrR zi_*_|chV;MECN@(K+x
1	27	6	277	0.08	B hvG{ZObqcFZ TEsH%}hK!kppiE+
1	28	56	297	0.28	(+X&jpJ[e=$h/&j=rioPBrV&W_lT@ujtz)GTj@cjxo_M,mEzuT+HP.bVgPitn${ly~U%grKgqfRlJ[BNtLsQI/rK
1	29	112	55	0.05	A&QFJ^Nye!pLE#yIIL[a:$XU-Z_
1	30	68	120	0.10	tlLf=ok:Wj;kYyP(..w$=CW/ZY[kikom&) gMjkv:QIeCjYWIXC#Eq~pg%^nXVK!o$hTyqmae?l.l&BZAMG
1	31	80	300	0.08	+|IpNxH,#^]W:U+k+^#.j+In)Kb}cFQc)TmE@:QTibkAA[Fn-rSy;}-wjuW&&{jPXSTHo?$_:-Zo$$DBk~(]M#)?q
1	32	199	38	0.17	 /xg:v$y[zFfE;IgJ#l.fT;p-}*Vd%clnm#rVwEu(nc?](!s;
1	33	35	61	0.26	{UngcgO b{./If[D/n JU~Mq+#ZnMAkaE.VPz+(.eTLO!B_nmx$ ikDxIc=$
1	34	151	86	0.02	arS@.JC)xQlQ^m.Z-;##q~,Oo(xc-=ZBV$$Ffgj@-wsjVU+I
1	35	9	6	0.16	JkIk}EWt(lV|+vwYf/)Y.@?O%(gUVsTC-KHnKevxk=^sACEU?( *zM.%;/Q[xMdsvY~V(D+U%nYKJ!]Um.K;m{
1	36	177	164	0.16	equB=#?bX:iKc-&D l*V}xNjiae!{+o|Hk)Z[VBO,hsLes]bbZr[d+ fc@};=DRv%c-[LR
1	37	166	220	0.30	,Jnseq$,=|yYPjK$mF[n(OCN:!a?sdGjIG%!}psDpn=OdSiIB#RB}M$sz?BeiU@l,]|m%?e
1	38	87	230	0.18	. yZzVBImzdI #+brjwHm;|fJbUelFKUY
1	39	59	99	0.21	[&Tj@zW{o^aMe+P%Xm%O$!I
1	40	42	231	0.20	Cye~%GF*!V$FfBk.?aT$E pt+Y;Ff{m=w? }S.zQ!BG@lonwUJ{.a!bQIEq=-P/{I%aoBnJiC+Ipt^CS$iQg@ha[W~AITer
1	41	15	283	0.14	yeD$heOi#]NW.Po_zcB|qc?d(U|skk;y:qvJAYq m$#sD,,]&s:~H$zdXS]P^wQz/}ukSVnOV]),+Mxgy)=
2	41	129	173	0.21	]*$NI~fWjq|Ac!Q%%*nhNI~j*u%MKVmjXV#;OYnMe!tik:mDmv^)APr~rehx;Z]v=}msg+yNJo.hSpDJ:;s@]Ooz[h
1	42	164	238	0.13	lzD~oG;Y%[%y;#jfDWsqI[!c:S.:WHnl;qxKB#?INOes]T/jI,{I+Y~/; -;i} X
1	43	187	136	0.27	bvI .zu)TW#K+lkPAyrx_^o.aTdEbh@xT|S.
1	44	173	268	0.26	,_-{/!hxgJZ=&E&wdcGcgoI.ZA;swF@Ejm!Fp!bl{|M#PuRUATz:wFMF{+eBCg,xjV
1	45	116	91	0.07	Vd)i:yUfj||-{eU+wnU,@RPYjZE.S+UEycvSbjBCy#lOy^l+
1	46	78	241	0.20	&{o!tPMoHqIbwj|,i%Z:$=/qoC.Vh:kkshBEBLm*rJpt;fg#~l:*.$_{Qx*zWSRW-VO^(oOG_
1	47	109	182	0.01	j_Bog{iXt),c C$Ub@R),(y#PH)I?
1	48	170	222	0.18	ciT)!}Pl|E]j/?!w^BHGt IF:qk[L]EIxcBWQJjIR[&h?^P}Mbr
1	49	147	190	0.02	MflaLOcT)gBZ/dGNa]PynO)[Wmb=@dW+VJd(&/%zJjUDCT?Xh#Fgj]
1	50	79	25	0.25	LsZ::z$RDNyC[JddEa@vj_xHO-:IVR?hLkwb^]&UOga%al
1	51	173	266	0.20	Sd$kv^K,u@}nHDjcm}KVQV@dCe=P!}PFUgS)LGtRcjhvB#o/R[OX[.
1	52	32	70	0.30	Fm+dw,PC?gCLIeygL &}biuE|QUtU_T*ucSbZ_K%B^-]EKL+kVfvS(T|LBhgBG}F.D=y:[@bE
1	53	37	296	0.11	yg)MEvv$zVb@M]iv:KRVbFTtosbE_hukbj,/Y.{sI Q)R=Y(d,V,)&uy~C=MOo
1	54	33	249	0.30	k*$v%vfJKi-Tqscwl&E@g~
1	55	97	153	0.14	pIu-sUhxG_eVmQId=[GlzLeJw:{!@t{oDcXzm^gzO/CzEVqM@dEngTGf* {=]W;QNl,iB~} |%H^t,P@gO}ExD[gKmLj
1	56	33	98	0.06	~sw@VEUiDphn%O+:@b|vJfDMhZfM+$H]Yf^X&=}P
1	57	8	178	0.15	jvsbNn!=*T_tj ovmw,C*mA[qI~/vrp[_l BG?)~?::^GkY*
1	58	153	67	0.06	fU!fQb-!~U^K;/yW~z EP:@cm{)#C&P,[?;ZqpZSfF-d
2	58	188	95	0.04	i{BE{[Kw:QV }Bjx={YFLhoo|.;jE[AT_YMpA]Hrb(A#]j-*c(cf@EYFDULC^OvIh!uA_Rj,(+ 
1	115	159	209	0.19	Z_HJQouE/It#vM!{AZBka&Cv[[uq~%
3	58	33	170	0.00	uiK@wZHkBda[MAWAUR]AAS)_.#yFR_lr$#Yb]PN.]ekW#*A*k}q|sTm]-]?Cu%m#Ot?pN_GfmQh$yDv
1	59	61	72	0.09	DRV,lZH|%sm EQlBW]lOVw|ISha#knwvy]wk/$Q|P}Evt:B~QW]]t]Bg-[;XxWIZ-.[cdPSn_+nY^y&
1	60	54	53	0.00	SjxOI):SnaZpcYJ);wghLu_e@!t?Vl*R=HQip);BYa.WA+:ur
1	61	55	29	0.21	|Iy_Czb]NP|&MRQE]BXdM=WAApt|@vpOGBm!yYxQd.s]+[EmCZF}E%,_RtkpU)AYkMR$Lyl Fe
1	62	6	185	0.22	 %+VFitgBErf-SCJ!~;L@rK!vFr@jN*qtTRaA_dI.+yBn;O=X#v#p{~(&Q/UnfSt!
1	63	24	248	0.06	urjVYwCkdbaop% Pw:]TFlfo^zDNUBwagq!sM.[grs]R![Wi{B%|Qla:sDIO-^FEXaX:,-
1	64	33	170	0.13	m@jc/+E&j{vIpe.K]gN.:lw)$DBftt(?ozD{/gJ,.(,!#e+j_iDR@h+MxK}DWKCKF~D ;;o-X[%JCm
1	65	191	87	0.01	kJ DPyQ;wxcR}n)cR&v,/p*Cz @i]*DB~Pd~TO$gthpaHey|wzxQzdpvHjPc)=Siu)|T&^ES N@pe]AH*_kS!
1	66	166	293	0.00	c:boPm?AFkFe}R;b^l-NbBwei|FFs
1	67	135	107	0.14	,niY__)}HuQwfzwkqY%tb{qc$#%C~%RNG&sZ$R)Bd?ng[%ZTt+F
1	68	48	231	0.00	sBSmV]Ek;-vF@:@(AO&xBU*mH-pt_]_!%{H=QPLfPWV&L_ZH(e,ncu:lmQ_biH!wlB *XV@t=ev^_ocX)}pjo
1	69	155	211	0.11	qH_kwzY~RD/:UrqAuOC,ZB_
1	70	38	55	0.10	!m;fRoRJYC^U}?@I=wwmnOAr $Fe_w@.JF[*uH!;E#_jckn~S?$A.ufvoRU?lE[pYJUGae*,
1	71	135	96	0.14	#hj!.J/Ls|i|]ZxrFHKoALDtZW[[dM*Fs(_)-!D HLLR#lhz|qq ek-EgDa-C)nG(l]HkDS!Fqx{$x$fZaEVJL-GDUot@nT
2	71	9	289	0.26	kGWuY^)|s@WEs-;~BgoqU#Ms]=}{YM%wjznO*D.~@l@U$,o^Ebmq_y=?c/h^ZJXXY]UsJ!LGeku[LPuCqj!-RZ~ wNL;
3	71	142	283	0.28	S]I);LNh=nVq|_pnAQ@$yWL+rhBN. )NzS-;KWfr.HeFeWs&APUy?lRpOgKLW!/K?KecsV[$lt+[U-Y?gKbbScjXsbc!.G_rOX
4	71	174	135	0.01	z]s]iWRX}xrm =M~?tFP__l%D^#/KqRx]L]EBJ@N(C,zybS,d.)JR]+ hmX~j,Z
1	72	131	93	0.21	i~L}/W+,$BeyOlwp?C_{LT-:I; M!^xOTXh=?wd%/r%BI |Tb},lBO+~HJ+TeE~]F!??)[{ogMxiNHPmgw*=Spg%w+
1	73	21	227	0.06	}kwhNE*N$.;dM ss!zJBTFoGPbx:oHr}V!Jh(*ipxde;e=bEOI!fQ ,^]q?R_: /+VjOvN
1	74	106	187	0.00	R~]noFqufuA;{*[$Irr[Ef!PC[=jSHgG?=]-c{?b%X&@@K
2	74	39	52	0.06	|rNuPWzps @}XjCOsgY%@iAFT,u^L~Na =U(S-PjC~P~[puKF P~fD[bI=v^J^
3	74	113	292	0.00	@rfVXTM$:uN_gk&(kONxCaXGxgrj]ie#ak/hxRG?CtUA_qbHHPbJ)P[+R-F-|ZO&)yaKb{lcb![P_=sX{j@a:tb
1	75	80	61	0.30	!V](fi|BugP$uQLOOO]Fq;?/?MQ&FZg_cJ#RGf=+mb$S.GyuheyU/BCmdj!bJ?%[^x+uD?bEDXZ#$&u|Yv+v!V:GNI_-V{x..WZO
1	76	22	239	0.24	_Pdd YHi,=pM|hhL%ffFAwF%:S
1	77	101	68	0.18	mjnf/qG$~HfFFEaUssds}^RREM*Kr]SU=Z@Kx,j~BR(QLGE=xO
1	78	7	273	0.06	ctVHzSFfErBeB@[O({O*cxlCM:IUZ;O(oCjls_V~|YFI{Y)j$Z;c jW|P;xgovMM
1	79	22	28	0.08	X,vcw@is}ry&ZFCwscO~*U
1	80	67	96	0.06	Vj&a[M=tS@hjU^mnz*+z_!CF)Hly={CI_KvEoU%v]zYzBrsP|Sa^UNR]s@&Vj
1	81	29	209	0.23	wH|GA%LDSkRTwk[zB.Q$pxEmXsKNg@qXmGI=%%~
1	82	80	245	0.07	~,f|(hWYqLbkVu%Vl[DZ[?=;y*owjHLBXq)mN
1	83	7	261	0.06	FhXm?mJYy}hm[M)]sBA|oR&:]-au$WcM;_$NVFu#lqtdG{&Uw=.*$,.{bWW-wSL!zzVO;m&QkU#|[LXF~$#W.a:@feB:(Xh.cP
1	84	72	183	0.04	.?zb-,?TwKej|z:[YP!&WSSKRkZEL]SLJzvnhiPdnqvV
1	85	42	299	0.16	LAkW|Pk*LkY/rD;b nuZ&pmLWMPPqeGVZL
1	86	24	162	0.02	P-F@DWvaQfxpLcI%F^gFbxH/esQi}c/]pDxzWPA&f=KaQ&a~q#LgnoA;P
1	87	197	60	0.07	o),GNRm__{tePpY/~TiO*}d=jiHIs]rV.vUy~JU==@PsNrVl-RlZLhbo w$TLy=vb)[/H|
2	87	84	191	0.15	Vp z-S:Uk]r]Twsh!@k/
1	88	6	254	0.15	]oo!C;]W,-)[.W^PrMl!z,rsyM-S.MQOqA)AYz#Tsq
1	89	100	68	0.29	;G;ziwSTAW:eu-f:MU:D
1	90	182	257	0.27	bdSDW~!@pNq EhAlhAI@%)BSN
1	91	146	289	0.29	{iJty+}L}iN/wJFOd-?J@xpi+&ut}c,+|Uhg@!d)l
1	92	105	233	0.21	ZPXM(pWg#Eb_b#ETjTBy+%fHQu FGYWhr|RNAGoZh(|lIY*Q@Y(WEvlL-_YFK&S+;sL*&eyT+m;#!
1	93	65	219	0.30	rxezzd(Opx#R*K$EOqj,}s{sHS_kBdeMQ+Yu$feo%}z=xPxM#zlju$v*JMjtqL&UQU;=dn:J+J_PQy#PIy#wSpFh!]uc.)VTIh
1	94	89	47	0.22	Qgo}](KMF:G[m#BR,&e,OzD)rwiKj)tZ: hee]FfUY&q~udZ#L;PL&PLjHI [AuW
1	95	74	286	0.30	dDI:dp/)[aKoShvf@oRAsnKW |.B!hUi/OX&_hw.s$TMO~dqBFD]=?^Sfsm?sG,T;T+%WsR;{h-c^P?T/UhbDVS
1	96	51	87	0.14	st{qeN@km/(NQPn~S_lP,Wum*,=cyK-aqfbp{.|cFfNhB)&}pU,Mjn
1	97	24	57	0.02	h+gi:gEXmrP~sbxT.-lkOd^ZJb&;BEOXC?W,&&#ycxi?n/Ew}-
1	98	140	229	0.12	KaE*k]XTW:JX~UWET}YY)&&*oy -.-oqyqp=C#TRFK?}Lq#i;exuliVcc SG.Ol^Pr{[/V!}bceDqQpRZV.Qbe__b(]rEtW
1	99	53	102	0.24	mtY}$UVS}G+lFJv@G~AWJ#.(pIFMT(M|qH,~+]l
1	100	125	160	0.11	^_b@b@|$$yLArxirgjdG~RjY,
1	101	147	297	0.07	PXaxNhbELR@WFElS^F;|vFH~/Vpv?X$tp(fQnaRu,c?Q
1	102	106	29	0.25	KeD}J~Ujzi[-|g|tZ?^/BdN
1	103	150	188	0.28	pR^Zl}s!VBLd^PewGd?fc)Gv(y] Iors!.d-,?Fn*N:dCWYfW~fNy:V/&QU@]g
1	104	28	19	0.19	tm~AoQzFE]dMk$e!dsKbZoDdQa%I@;rY)R_Bf?Rm~sf]i:rdO|-C]/R{vbHLM+k(CNYE
1	105	151	52	0.20	Q]u@{Wcq(WQiGuoZ@I)HxYMSDB%BZ@slN
1	106	6	271	0.18	hv;B (TSktb-|Mwa%:#%uzMFg{},Cy@[:uHr+/gA~ISgtjGF
1	107	63	96	0.21	UOB-ANeXJLU%V-X)b@I=jz{=#P]oytXG*vPV,Wx-bORN!yf#:&{d[)_]oHn-Wx ug*Eyg/OOvrxQ&@f#yGPdo-)%m?NIwuBuoCP
1	108	20	147	0.09	MyA+!|rJIq*Ws~tF{rlkk@OwE^p;l?{*CZk(wr.GK(=uVwj:Kho;pY)d;!x~[Z~QX~%Q.[/ZA,)YqUG?|:oyj
1	109	180	233	0.00	&e~V+jfBcyW*DgyTnM,Ipx|Gx,ufTcBI?Wb@h*Od=cP]eio! Qu J?U):qLrKZA,*uzN@oNE-=dqRD~-F
1	110	34	204	0.19	(o|y+Skh.alg MTim:%YL
1	111	77	262	0.08	lOfewNoN*^A%f$|o+au}w~/g_I#iwtax)m,gf/m=Jr?|,$dLdaLm%@rP=X#FlvK@g]*X#_Xb_Y;
1	112	195	177	0.21	]^*Ph{GlEUwfRo[%$(ZpjZ,aivSK,CvRj]|?/gC)U&
1	113	29	34	0.19	w oU|yn+(O)+XgZhsWVLWGlOjSQImcCv:Fv]p,(;:yV[Jo@h_!qvAo,x)kWO&p-Dd^tkF?P};X)mrWEv=Ht%hu
1	114	153	210	0.14	P@lxKbwy$zr:O=i$+:,QoADkMPm(TRBdxvOyQ?mqm.Tx+V=eqDjPdd[:t&~_oMkMuYCWNp;]w[=#d
1	116	88	240	0.22	{lX $CsJ[U!?U;+(mZFd^,XgkYyumc )PSD!%_! x[^%m#whVQ~j?MQaB/-IMf$$bXA{JkiyRtURxUeYRE]|tPihpA?kx+*
1	117	17	215	0.14	@ wFWGylUFsk%.kTF%wq|b*IzBD;:b&Fqa$|RoS_T MIqg
1	118	108	16	0.27	xstwLgQ-$ZVabAn G-yWRSejlpui[fwTY|!dU}@wh{v|^TMvsOJ
1	119	102	123	0.07	d=r.SKl%fOi|}y*-yaa-@TnpenY(ToyZ.bTQpbByGo
1	120	137	284	0.19	g#.mz$Xh[CAWkV^A?l)S_]|.@jT+HNPZ[IiyLf{IHT?dkpY%!hxVc%Hklw[jUNpgR$TCccc@&^xY|*B=cM-r*,$Wy&
1	121	48	63	0.23	SgAoDSq&;&XAd/^h styP~VOIU
1	122	14	46	0.04	lK?goI-NLbNoZEN.hVw[
1	123	175	101	0.22	hbIuI&,&v+gjnlK|&^o@:X}p@ZU^{lY:#=^~^FhfwIpv?Wl?XISl*S]
1	124	98	89	0.18	[[zQwwf)n{jM}JmivNV=.y/lRYd/pQ!uDFOv}n(K-.G_ZWQC,Hk Y+-?hI?E$hDVl}@v
1	125	75	202	0.15	dmp@ROnNDsH|BKUD{v|R.jsJz #YHLP!JtZfdDO-,{.xR?iDns*AR(|-e+A;WHsp&$o-O*uBmf~J,a}~Cd-|B
1	126	140	5	0.17	!%I=Ft:ON};WkOG)%yY$W,&|
1	127	70	122	0.20	eN@TAvl+WsRi.nb$)n@l.S#@)p*&ZZ(btKc#.W*TJLMuPaLyJWIi^pB)#jm*.Pb
1	128	25	72	0.09	Oq};FA]T+}y;%jL]qkGlsu%Oq,,,](Gjmr[BSq})bW=FCSr@L$eZkiMi-g=%D@dxNf,rIkY +P)jr&ROWoCIa];=fT].sE+
2	128	184	130	0.07	uhvTI^;ZDK_/x| mUK,}=atrFW?g_@&
3	128	165	255	0.18	^eEFqv^nf,VYPOar}Fea=klc*+t)S/?(~)if#sm*&hXS,is NwYu-ndc&a
1	129	34	194	0.13	hbRCsC%G-b*:Y!a=pK]AZX&|u
1	130	155	172	0.03	!wD%KuP.ba=u(C!g?BOBuVI^xyYWns/dqb$^==u!&-/Pb}@:M&wl#S&kKvyLa om/
1	131	21	23	0.15	nNt}a#xD&$BiAKwg[wB{kRir~VnK&CI|B:szS.-ZSo{j|+Pb~?f;M:GBg_Z[yI:bA@
1	132	115	299	0.11	ueFJKYnW&tHIp]Hbp=owC#RJ{[Mmf
1	133	133	161	0.22	fA[gv:ImR]~z_uhxrh!HaA-kt,qzvMZF?~nXjM$W+uKsdq ^UTJxQoc}r;vuSe&gS ]?lUizjSR!;}WCdO.}QZC-FU|
1	134	140	46	0.01	(bK:b:N*P*g)ld(^wj)!^jO&Ddwfi~MT/?Fb@b-Wsv;yYgf(h!z/[]GN}qdmztIp(+*
1	135	84	53	0.25	Fmb{sGyuX].$uzky#~!X=hB
1	136	163	111	0.12	gYCv[A%*Pl-)JS++aBc^S=CWK!LD|me]=eR)@sKD iOmCDdh!,I_A{xKFW@{||@ElekCD-#-tmGn!~v@L;F
1	137	77	131	0.11	KA$dNj,d^eI&y?.i/}]x
1	138	189	86	0.16	X^zlGPX?D#l+h(-.OSF-{ceCW_|OnBD!bJ/&N+/oXqoO(.i~
1	139	24	294	0.07	sA G@ZE%dLvD[BKNB;BG nW~HsWn(ll[F+ :mYM}VVBRF;qoc|QPu|&QlgcwVHrfi
1	140	134	278	0.17	D{+taW{IY^sBaRBXmE~f^.nlEEQ+.(-xttnhU:W#rSvz?YERC-!~*X:bHx+b&tze&fm&zh? ^^)dH!^_eJEE
2	140	129	241	0.06	,!sdpDvz|nyMIfYWy(f;|T+RrLQxaCsyCfPKe*VwOLs ku:jEnZs}jyz;+uzwS~ACWprOG-
3	140	69	283	0.00	BD]rsWeE=@T(xxIZ-(In}{W,Mp^}Zrn?zcIz[/.l}]/[b[QPy_MFjsQsNWZH-Fr_|zYNGs_U QCZm:DpryTN{gsG[V
1	141	28	232	0.29	],r(U+YPQx Yomx W_CY]lJ[=AnesAiFw*Nc@]W{YkSFH@^wK%!dl?GMWj(Hbi# ;|N({fVyo^v@pSmg!;|Nc}!Rv
1	142	49	59	0.27	~y})JU@+#m^-Vd/G_Re&~+?@
1	143	190	229	0.11	!?Sp|/*Izu$hN?=Wd[CK &NsSQew[FmQB@~zeN$/fqogr~ZM[ wg|Iw+N ?QpbLomLa=_n
1	144	62	6	0.12	V+RVH#]a={pI$x~}sZ/%JwLdZ]mVJdkD#MhkA ;fX:#QZ[xLoE@i+e!D?zx [;?_a(k+HO?,^CsdPleCw*^kCYm/h?YtU
1	145	114	242	0.01	u^YOe/K[-zrq.!z/,S]ecj!W
1	146	157	223	0.24	AIi[].ApRxev I$@q^dF(Ik?KR!@}Sjgd/:nXGObD&S_rW&MOf&#V;)[!Wg&oVGK BX!gu;H=zF,dcHcGDk
1	147	117	94	0.29	~JiEpI,y{o$!OhZ+B@nT#XdKF-Ir #D[*x)t
1	148	100	136	0.12	Oel=RD[Ek*@-A!o(O{T/x_l@lrq
1	149	17	185	0.26	T+btiP=BqQY:Dn&ouqH*d=E$twL/tAwR)P}&&kxs]CW@/gcYD}F
2	149	147	31	0.22	UKZk^EM%BXqLdche+F/intvWEXvv+zl.dEy.w*K[^KvG_]rr[rNLzQxZtzLz
3	149	25	196	0.06	uEZ{Z_yt^-*,bd!yan,c},*]d *
4	149	12	127	0.30	PV(rypBe%=UiiEJ|.+$oua@*yh}GNUY%[@xc%OpDGW#eyU!.$dO*wO&)qbH|&i;)*$=m[R%
1	150	168	34	0.26	N!x$LOdtL*rhoT f|!KV@LMGPEE{$D.)sHwY=TP.)r(--N-QKfe ~Glv.Yv;skgfDns~^?wMYFSq$^}yU
1	151	121	16	0.27	twh]/lALNJ,MLbLeJxeaWokAHiLWx-B,L#DXsnG[#,QrBTrw
1	152	28	241	0.27	_/-B$H!tSo|dNXgEY.|IfB!u;c=W]}}}xgfp(Dqp%GatBt&
1	153	124	56	0.09	/pN#VemHtlbzuN|@!LkNxJ^cnGSxkWl!FrR,}NXC#@U !Imq#Z!QnWIBGeSNU.BCR(Wi+ko~Hz&q{y_V,[[-
1	154	54	168	0.24	# ~:AaJIE*~$z==X]eag/^dPZdYLXiBDlwsTh+uUin+i**zr-&J,kiwYB)&-KBEQ{*/%^kzR}KXRt
1	155	168	282	0.20	FN J(:*Su!tuwpb:]VmFdpS$gpe[bEQL%hX) Y~};EYS|}((By(FpI)NZhFf/db-|a)L~)pLStVRyUk/VD;ltW]BI
1	156	28	284	0.14	NW|$j?nQZLPW /=N&QBL=!~FU];km
1	157	82	180	0.16	swItV_GQk~W~|(,TD[e%uKIr%TQjlnI;#? ft;xFkc*feH].u--D];kw zw[~~ynIFPL,
1	158	76	58	0.05	#_lY:CsZe/HFkus+Mw&;Q+ !ncroH{d%+QG
1	159	19	260	0.17	ZGTaK~F*?wp),irD+|iGQs^vu)kR}r[jHWp)UOYjFd*fL
1	160	78	204	0.08	Vm}P{Wca@_byfSkqk {V{Pr H=c$rzNQ)xY=UcpKB!
1	161	66	277	0.04	eu~eE*+yEjqkL?lU$-+#^PV
1	162	142	109	0.28	gPhVnvkkWV:zPh+tbQDCVzMTFiGW:Rgj
1	163	95	86	0.21	%FNnZyr}JMJlI*}MYsd)F-}?ivsF zfBSO!(.$bi DI^L.mYDK]qz^G
1	164	38	45	0.26	m/q *U[JlY(y)EC=YfeFvGGm[+gfW*~H*qdB^w?SBxlCX?z$;|_Bo&h[d%/*Y~]MlR{_A{F#nk[HU!fIJ
1	165	199	234	0.28	//YHznHB)c_YQ}yxPSPvviwGz@KPN?PU&:[S$EFdRF-LiwXV-Gt
1	166	39	138	0.22	wLOe%vkmsy&I]WF]If!goPq,XgwmNz
1	167	161	162	0.24	|Xq:homBKutvE]^NF(%$#Rts/j)mRc?S[#;E[rxj:t.jdZ}VF}DT)rTVGQdqE_O;e##QQ.$I)L*%Ur, ,*
1	168	88	117	0.26	i}[HjfgBN,TKJSQ|yNTWtaiahhfXLW-S!{i-|_UpOMudY,ox]O
1	169	156	280	0.10	kue#^X^cEZ/tx/&w+~OlxK+yc;$W.DC.LdjaCHikRidi,#IN.e
1	170	4	153	0.06	QrelzebRWn }Iqdii %#
1	171	69	111	0.10	I?bd(Q_PjtiN!C[JM_w_Ut]Oy;CVj$LW. WfkCa.yHGL$Ci]sjs$@ OWC
1	172	14	103	0.05	_{=|DjRghA!y{#[Jku|aVfi@]]_ZNf%&~
1	173	174	4	0.20	NNF{{={jfUAXPPiD,o(XgZoJTk_S-c#hAv,M((RXarDzbmry#SH@IfP:
1	174	113	135	0.23	APZ:gmPE)O.O!Pd^JA.yQsgiT=gxRIRoiY+,NEr;]c.r^kQ%Pb-o^G&%}bZ+,:qS
1	175	23	45	0.30	jP.?$tTkH/niEL&!%DUPBzDsb. mrWnR
1	176	127	115	0.20	,rX[M*q{Ud?X Q[euEsYUHfXe|ckZ#d [ce.FchFWnSAN_D)c,hj@AKhMO/W=Dy^EfE:HLAWfN:Cvl}gy?LyVn.Y[p#RAcWi
1	177	153	228	0.05	@Agi&.Za@u&Kf}x#MXeM&w)yww#i^yTUasE,IqV !f
1	224	160	16	0.28	qjuZ.mkIKKtoJ^|f=hc$~
1	178	132	120	0.07	Q}[BnhpiXia,-HwV)(jQW.GE$-M+#,sm%Gx&RYVCoYYp&HknWM(rntp~:BeEFneXgqy?/*U[}}AxoE
1	179	117	260	0.06	RjjZbMRnUb. #&;T:HYrn$=X:FuY]e$.
1	180	47	278	0.19	;^D=zPflEZ?MFEJk^:,#*Mo n%RfgBDMo%x:.G#tlx/ucVgPfONX]E^;,zLmnST,:lPA*X),[qaVaHxR^])En
1	181	190	162	0.29	:|A~_zBXwo(p,:u@~OIigd]&xmwVV-_AB*cV:U;?]DX:
1	182	28	165	0.02	w?p+:+_|W]$xp,;JnRd}-hFrGG^$}OkiWe[::bVA q(l[HL}mW:IIAYOWdcAV%T#e(B-CGnN{Y/O{VsUXqgfz$mppqQ( w|dls&
1	183	22	98	0.28	*y+RnUR+gOs.vMz,/Kh?y|F)*S^)jT )Uv(^?#-^HHOILC&{osVrCprp^iQRA/S@:KZr_Voi?cCLQJ)/{z mOG$|GPX)moa
1	184	93	268	0.23	XpFa]HsRzogAca*~lo)p}zV[[emE axXxc~S$%_,&YstTZ{dreRpSNDyX:vfh;L_m{OdzlVd?Um)cH^tVqR[Dj_u|^I$&?YI
1	185	36	112	0.24	f-BTw-*:aaj e{PagtBR;/CHDountYLoF$;gi
1	186	128	293	0.23	!go]@Rwe{PB:WZZH!ONn-sOP$i]=JzC*
1	187	70	14	0.18	J@pplJ[VrqD,dK)Y^B|}eNB?)R*cK$N)bhrt:qNp)/k/X:aU|tGZ%ycr#xINYCVHPolG!LEbBie=T=s-t[WRffHVg
1	188	153	164	0.09	IHkjQ$;#sO=&|n}HY/:li=*a{-rC]l=W{_{cvU[W (OuVsow, :NP,I$l]K{qqV_Q
1	189	145	69	0.13	b#sVY%alDeLwCbYHQ l[! JMENnEb(JYABDQlp&^u{ GoAtB}tmV^Yxuc!)gHb=
1	190	199	109	0.27	OEu)@$KYZpo;r$A{-ecR^=%Z[PEg=JpdK$SBYD:]VdeL*j$Rs&dFZ$dw
1	191	91	38	0.27	)^{uM_}u[%yAcsT%~fl N;LI_PrUgt
1	192	155	103	0.15	v$s/vNpL*ckd @n[%MxOWIgr/G:gsVReSVCng|?~+/B_jaX_|*DdoIVJIg.POnKd&*Doop~@CT&zMs&? WG~quXJIrs%@Ym
1	193	2	127	0.08	~}%!mh*celr{O^/)cSdi(I|m)hV-j}mj+(aEEmuOjufOH._D(FnyZ&Av
1	194	134	187	0.00	~uj{}cpEq[q rcRs#zM~sczpwACjpc(M[{S:mzltbX|z#|JlUdmIHXkac+GHX#h.g*;-v}H&l#JGuC@EFq
1	195	67	283	0.01	-:OLCc_WX(@.c/CcrU#!leL^Z:PN@N=*E!!vpxG.Gz/TZX#LlWW)E|&EcxrONLrVvkB.=[~Z)
1	196	142	272	0.10	rj#(~nRhgeXjGk#]PgJ#|K!k [ZbMU RuzUj[JB|G.nPsi?~Xe)|$&-XvLMH!WZl-uW
1	197	134	211	0.16	!*IknUCNUjVH[dP),P*JsXn!TA.N!KQ.kRr]No&ER;zTVkLYtdRp;Rpbvk[z%cGpD?-LEyzB[pHtiz^p}h%C%aaj
1	198	198	165	0.29	#,BvMrVb[XRAmPiwShFg.RKTPdEJz~OSDA]by!=}S{+.TRx,VnLZSuY?%kKVhqh]UM!Rpvqz{V-n&wNpy?-ZD;xoyQla_%
1	199	143	5	0.09	IJ{hktrZInqRHrVJ!InRGwu
1	200	168	253	0.09	 O,[C(QrLe/{~_{jZ[xbdZSUpVby)M$/v[Jc{E  Ye-%JUIQ?:/L^A.r:^c.lXa]y|#wyX%/wr{brpD
1	201	28	115	0.02	Zfr%glfQ+zK-zrpTTBlSiLwC#:!(Nd{DKTMlxz&nNzXkm x(brB:C:a)#!@.g=_nbeY|VwZakze-cE={IeK(#%b@DkV!$cFr
1	202	35	277	0.28	ks_Cs:c~Qazmfd-T//YIVLC. ;g/@[F=*=VW_TBvPtsfa}U)Cf/?
1	203	165	23	0.30	DjkgBQZGAHks!hXde)^w[=XI&X|lI~j,:v|fmRIe;#g@)*MEiTHvq
2	203	82	186	0.26	iTBM^xCBVok._U;WeXTl]@RppGnVu]!_Q/FGB|,CQY_hlwCS/]aPFtPdajf!aNf%W|/BHS@mA;
3	203	58	151	0.10	O+LQuQP;N(BH^!eXm:e@-Ieg_r;Wj:HtqsT[d~+gu%L!B.HL~Uez,zoPhB]F|K-ydM+.]N^f]#$/LYV
4	203	134	234	0.30	}r{gX];[KGLmg&Jsj@Fi@Xx}*sR=}H_R|mgqF.Hho~S|k__G*$+q|mW S)EOLq}{O-Snf]soac]Zxu_|o#h+;:gzf/ld{_l Dk_b
5	203	33	198	0.20	Z[@u/?I-?qx@I_XECE=#NJa}dN.=|DkcN{n&
1	204	44	227	0.26	XGVwAY(EXw_%d^s|KYrrg{TM].q#WSlc_Alxd.Yti#ewwaCV Q#/lssA-=y
1	205	130	247	0.22	LHt;DUDji@#_yFaYBY/I}B)XKA@nxx^guCOM=FBc/$=wcvJ#e~Q$w.y
1	206	56	15	0.24	aH?:nO~[MbHUJdtcNXyQ[x.r@pJngdY-#e|{l$vb:FIV,Q}-*j!eEc/D[TDwm hyFfbl*GXhge?
2	206	147	85	0.02	vfDmTWTQ;Nb[?qd-$vyFJt.ZoXB/I!@h&JuFI
3	206	42	193	0.23	DQ]p@HN]cEth,+FKxlOBFms?b,O[d?yr&o.}hbAxZ+lRaIyFreA@I?]
4	206	104	234	0.03	Ive$X&Mfl=yVTrKI]}/JFG:/)ohTL&YuZUBN),?+w_FSppe SL
1	207	4	251	0.07	YhDWt?,AUPXGmvXFr:w-GqoxwQ
1	208	75	186	0.01	D+CZr| h#vb=JcqhsI$O?R,(!Pmbg^Z+#a
1	209	176	131	0.20	=iy$x[?oO+)oG!$H|$h}Qv|&zDVSyu[{Wm-zlNaWmhn$i@M~JX,=[kUs-G#
2	209	118	133	0.09	NBHkwjL/YDa#R^rY&ZexA?iW~OiRWTPNSUf%V}BI?PbX opKYmpqK/Akc,nBvBLvOQWA[fc/M
3	209	6	140	0.27	#XH :xXF =yu?d)_wIBB+M|M)/*ZZzwPP[F}bFJ}w^d(FYPESZ,e!+ThUEK}r~A?+.dPgr%S%_eG-Cg]k}Srg
4	209	102	39	0.08	.DoJEc;|rPCOEfoNcd(EA)V?d~?SMPL+P(ElJitNzG)x
1	210	112	197	0.05	k$w;gk=]S_vY;jC*gE%,A+s.n#]R~QR~NmK&++;Oe&s*
2	210	133	54	0.12	:E%c_/%rrbuQN~+Etl}qL)|wZ%PFu
3	210	139	234	0.13	~. Fw:iKz[J?NeC(NG{z&C}=@t,}[@,ikzVHX:ExXUvbav
4	210	95	159	0.22	io@wzf!iq!Gd?QC^~UmrvE~AKqi!=J}]y;gVw,#=Sg.+,_YdY[=GNVDPfmS*sFzS(yOb?/)&fhPxYWNs+C/jZx.]fk  V 
1	211	196	168	0.28	:Sg(e(s+./=,t K *^-;xzU/)qkosbrFlccI(K(bBuQ=+ @tS$nzZ!|HsE_P!iA%I%$jC ~B
1	212	71	175	0.25	%P)]?TX,w.G+zoXbuM*Kf(kqGR?e%tv,&@yPyZ; aGM$(
1	213	115	123	0.25	y@qpcqMQ|*&d{ig=UNeo,AY+TX}BwaX$JDUD?CndZ}[PFt|UyRdu@;Cgt/Bod?Rt}{]:k~LI
1	214	144	123	0.26	FQXl|hLB;j@~EbH$/ZlXhKq#]%ggmS!
2	214	74	18	0.26	#KcF!@xj &=&ZdNHN@pCT
3	214	158	242	0.30	GCqUZ.BuuYVI$eOG^XKGdow }jj#V&+hZJhLtq(}m){$Zm *xCHAFwAW@@JCCmFT]C]h
1	215	154	200	0.26	PTv.p-Z(z$wPG}eSL?z{
1	216	64	92	0.05	-pKLarYK,wyAOov#TQJfbH(o~Y
1	217	57	68	0.13	C? #:f XrtH~}.HwTIm$W::YW:dM$K)&D|;$*vV|w=;SpFZS}jRyoPpv& GiTX)A-$Nru/Ik$P:*lP(nQ
1	218	63	108	0.06	)t@zLUeuh?:TR=:bNn@U~.R+ZxF*F]+IG@OyIhS&P{%EIZ|ECQ?RFSbxuEJj+bVAh|eSG}q*IHQb^oWFh X#Br|%kr:N
1	219	155	92	0.05	F-We|Vp_^GzjzqO#c)RkRNlEGGfykSi]E^xUS{%m)m&oO~x~=sWml nT~|hw~;yPIor#D$
1	220	40	66	0.30	SXs_snKWYr#g)&nfG)XoC+Mlqv]kID@vnYXN+=s#:C^Dh:D|Ye=Ol%BBiqSf?![nnq~Yac V|~-^#NIAZaxUjy$
1	221	137	189	0.00	a$JfMGn~=to_-m+R$H#S^
2	221	102	8	0.30	A!.+L[SbGOu#SMk|~sKH#K){Ds-Xdrgvr])O=E@_NTOpz  ~!
3	221	144	89	0.15	|YR*)?!miOTNIH+|@_X*TIhdsO Sr
4	221	114	210	0.13	/yfk$R/{Ou+Q_f*fHrm,Sm l_~.DG*mS#,UD%yvUhuyFu~*Kpq XOZ:[uBgK~}:/bz
1	222	114	230	0.24	Mfm^btd@f):pN=mN;PQXNp+^nxJpDG~/q]TrlEH+*?;E(w_~&zZ{+aR^ZZ*yIe?_AD :D~/eCY)[^|}H&Ktbe%&;rzI(pJG-@
1	223	54	136	0.16	Zr/To-dG.y[@bn:BNo*cFTwdRijD]%EHDP^PKn-w!&NB@^CNDsXoRAw.U(KrLKKwPGCc
1	225	180	74	0.12	@#y?}|$*F%ac_PK|pFr~B/
1	226	79	291	0.23	,Y]Ii.Jyofk=[.Hn~]nj#ic!Apl-W%vNZrmIY$MahQX
1	227	128	248	0.26	PmI;Ui#Idbp.~KM+eZKmY!}Y^+(alMd( o=asE&t?#BST)j)Ea/)mmX-rCN#t k{A =uxOWyetfh@MCjM:+X+,
1	228	4	222	0.20	tc@noUheto$(XYv^s_IWw[y #:=wyy[EHN~
1	229	38	133	0.04	Y@/cV=&;KUlQ )cSi!ijY$EmAIfj:x-LIex}{paFskUjXlQtYqJNNOD!(?I%ARII^Fzq;G[PxWaRP;fcqUpPB!)n[JQ:?-&qTj
1	230	13	31	0.14	_DcWJWg&]/W!?ApQxzZ#pi|MsGrV=Vj
1	231	30	286	0.11	f~*fTQ.k@,Ld^zWm%NjrZ- z@XFYlS/M
1	232	71	194	0.23	,,hb?Tb?e,^;]b&OVNW-cD]WV{rZ!&J!_FrZ!V/z&[+sV{{E:cZ&hJZ[V(sAJLl
1	233	65	99	0.07	ASnYEE}Y+LhlUr|S,op{TOFENP!o{RWSfH:l}vxx$Wgi={A@o_dV=Ifpe@p/l)C V*tJ@NPq.bzF?OBKR[@Er-dpf}dIFT[FuaA]
1	234	129	216	0.15	d|#XwEov!hNXWb(@RB*O+=d;_@
1	235	37	242	0.03	tWjoo$CyplRaSF(|CV}Wse)!wEFWZ={y-rV*^P_ygWgfz#jp/R)A,AylH[RHD*,Km|Mt|S: XJut)@oGe
2	235	51	61	0.29	_~[nwZXI([$^&oDP+&+jMGf$&IuUC&|z;r;=PdUAP&G,*sSkaf*v
1	236	41	168	0.07	mr}=zka.LkKEcceyc@Nf+,Wpue|gwjj,QAzLy&zeb.x&FaqQr]s#%-JLrOSoxy;~[xmDZI@lU+h$%olsS~a!)pQS
2	236	77	15	0.25	:I^XGo+.~qnOSSZLyBL#ncStVC_MjlOo
3	236	110	125	0.04	O][dG]yDBNgOG#;*vpN^#V_iq#iDsv]Vv^|
1	237	137	98	0.19	]T}xyN.kF.hEAfQZpku&Xe)UexG^vXZ=jdz-{~ld-/RYoH&IN mKC)&S$~I[vom~OF~UA#K:yn)N?za!V]z~[WA.?]
1	238	162	89	0.13	c[J$*?*iW|We;rke+xxyVrFS%#MruU;]dys-O{sqPdfBd*xoFSyPCUjlF%~-RIb&wN?Qkz;pAFzE,Vw
2	238	25	198	0.21	gU[@itl&=:Hgj.zJFwfuP=egwfXmC*vg.zW&mi}cxE}gx^yxkMcy[*&wQaK Fe=WumK
3	238	193	290	0.01	X~FCL#w#omUYVxGrYf:s,Q&*D;,QcW |BvF+z(h
1	239	144	228	0.24	;LDEikJmDBy)u&qp}B{NMwq[oh~-,,kF|X_&Gn:f+H-W{h/_-%J#rBcJZTv{[R
1	240	190	159	0.05	:muI:mNwiD~_pJ{RL++b/.{=RQEV ~RO rZqO-NB~+kBsjwSgAk,AYpaTR_kKeD:JYQ!?#ymAO Ld!:LtBOsNDD,)+_A~
1	241	49	187	0.19	$}m&nk[CswQG;xE/%~s;@}G-~?WaUKIy.(UfZa
1	242	195	236	0.27	I+Z_D@mn${Z{IcTivo}W_:FzMTI%Q[cZAF/;.x_
1	243	151	52	0.05	+#,lw:[oayfS?RLJ%bxZcsFHti:pQ?cqAGNrW~;D*CZjN~SQMH/_M[BU:ZGlNyiq(MN^swNC?
1	244	31	55	0.22	QU](Pm/=c_WJ~mAc-!d*,w Yhw^Gdq#nCk%
1	245	43	289	0.09	H-%aVOOcIiwBr&rSHxUK-r#JU%V!t+gb//LUE#]cnbtIrY}A,aD]DxLu)rjsPyVno_[LeMQqcczh
1	246	29	29	0.19	=]DoZxI]g~tZyElIHDNZsE&D ISH.tFEJ(xgyuGGUJ(.p]i/Ixp#wR%~~,FXh. $ebDkoL{Tz,{(BgGhi&} {[J
1	247	19	30	0.03	L-MMXZC#DT[mJCBhz,R@-{J/ro-n!xV}m[IU/&Zm~i#hz)poGH@AL?mrvuEZk++%JGY-hKryTzv|
1	248	50	237	0.24	[OEEFOpJD_lr(aOIQ@W^(-GE+_zFroz|%,vZ
1	249	116	160	0.30	m :.d^H/G~iLldU}M&zfWM;,oFpAf%)-Kow@+o~-gy|w{&J*SO}~_*xv[s(X~v_ F.rJXLfDdG]nL#H]D{!)[^@
1	250	92	177	0.01	cU.]Xp;(E&Y{&jP!QFHBcPbHK]CO/PH?vMt
1	251	38	142	0.02	iDBh=lt.st#lP.ip=|]|VG-KC|q|HiN^EsTaRoQ=&L_ PGnExlRO,_ei*
2	251	119	15	0.18	;AFsQYte(vqYAl$$*!;pPWYw~NzWm@DqoTm#m)Vs$e-GRbP
1	252	65	37	0.23	=%sETxRfahPdcR?#(@.RP=,T=/KB
1	253	99	250	0.18	Wgb|C{aC+uCXFIE#h[Ts@fP!HFu~)Yn*fiwCFkK.ID_xHxwcqk}:LtDTxrMsLs.S{u.
1	254	39	244	0.06	Xati{H-{GT?vH^QJ+ sVJca,hFrF+o]*z.wi|CqeejF#=Q}hGzM|TZtghVavWSamZn
1	255	55	59	0.28	Hsl.)[L)a B,LZv/!;KC#C?^qqW}
1	256	59	98	0.16	W#etAF=E?zQf}?lD^gRa]hOL?jp}~Re}cFF|i*eJN:TP?W|.qnC&( )/i@)Y.@b,l_k{nEbJc]=Z+.RB* Sp#&(RpF bNo
2	256	179	130	0.05	F@(!bS{sjO-v?!b&bRdvrGAm]l;e|x[!@?etB$^chvM}#b/X(_a~esMugDjth
3	256	103	46	0.16	KcgRW|%:~YNJq+-]jW,SCV|)s*B,[B@S%Q@|hdVwZFBVNzIPS,slp_*-ROU[,I?
4	256	122	217	0.23	iR{*(UW :_ifA}R!n{] e/Y xs!tp/YJI_J/v]X_@|It.RBUaekGmP^|^(x y!,D)eNj}yeHb
1	257	159	11	0.13	myTvdH&~R/]x qL-{.!^m lJxIgLrv=[,UlWYE]bWl/@IF -ddf|-,g
1	258	74	260	0.10	xmdzEu=%:{BHLq#WF*AhrhppF?sYrdkI+rkf%iNK=awXbu_glrnfAZ:l%[mcFlj|,p
1	259	164	249	0.16	x,!^f-*:p;^QmKzJqM|JbSa^-=eJ&tg;:FA-LPt BieU.m~ *!CgqW{),rnEl]H!]kjX=k.@v:_(O@Ye*/IVzYL
1	260	120	131	0.30	~]]h!oUI+fi/C=.%uL@(d a  ,Jyu-bxBzz$.%j/HtP ~pT@$xeyXRAXAd/=tHW]w^JK#
1	261	24	219	0.24	E%+-%no]#~KIHMuE!l|^KtpF_PE(MDLcrk.{Peef:/X#O{ESuW_oE{^U-,el!rT,-f^:BldVZEb=Nc
1	262	101	191	0.21	~anho=nO=^So-OgqAVr*Xmqx+Z?SGtDioY.F#:Z+*Z=XEUUT&Ck+]XCta=:s
1	263	30	279	0.18	qnK!m+@LfltgB!y-mO@f$dZtFCILg
1	264	90	138	0.27	lqHP}}ib,}wI*^C~Ft{=:[g,LQa-(jpOV??RHYZ~@=:R#t}HWG|Y?%rs%-.(q&_v_M)OtesU
1	265	3	69	0.00	&l[~gYGoa]cQy&F:[raJTD)T(gB+Phvp[ha*y@xl-
1	266	185	90	0.11	.AHP%M-IFq/tCPm(mkP_n,![;bG?=J?*GBaHyAp )sJc=
1	267	103	255	0.01	MNNTk-$bc]NUmRodZkS[~p]T!tMBu^tL,yCziT}.,xn-*GX$[dkp+}
1	268	6	244	0.16	yo^UoKGT)+~zu}z?pxiAx=Qlb/BOSanIP=.U@Jdds&SXe%OYPteZzy![RsE
1	269	176	126	0.16	@ltpJwVhHYZ[xs(h+sC)jHPyXpQxq^e+=$o=K*rr~|FlZk@D
1	270	135	77	0.12	~+yc&~aMprqCCkY/uwJMX#FiV[|WhqP@RJ,{q[EgMO(B+#lsHu^.jVvxz@,yDrWoa
1	271	27	24	0.02	ra;K&@qpR/q:Ns#Nrd;a=V@hU Gm&!.zhgs!,)aU=H?kbcBip]]/)sA|LI-,n!+x,dKhc!FjhGNKm^~sEB}db+i
1	272	29	173	0.25	b++c]WXk j:u_UB[(fPza/*p; UY*eExo*dTRBa#j))m#,bDzjV!Mv;q$hpUcI/PHHOi:Hyb@,/pDmHmtDw(iJ^%U*dVs$Ezaru,
1	273	150	156	0.08	Po|_+B)({qP;FQg?Ab,?WArqlGK~dVP-bHDT!l+?DGX#A@#a$G,EPZ
1	274	149	91	0.04	.eyXopx[@=OXJ|I.~]aU/)i/v
1	275	186	219	0.23	E$kd*!iW[.D[jBq):lCZfFGdk^(_yE-}M~(tI-m(R#&-CWin,z~VU.v/xs,xerC
1	276	193	87	0.18	VgfZ%G!LO~mUBtRAG!CZ;Bj@nt@BdBJBRfXFwY&GXii%z={}M?{TCgQYF?:
1	277	80	200	0.07	kcdcjITt*_iP?&LUn{VRcIn.MvPS)uJJjnwKmRAgvmbK@NuVRs[dEK|-]Guqf hwpB:%M:XC}&AZwD
1	278	181	210	0.02	+zH/=!y@~ZQsqYCA$#$p%Xvnt^yjN&,
1	279	147	14	0.13	C/CXQFHs Rig[w;p]+J]xaW^-#td%v)GS|~@f*hpwLmhN%Nu .ELU:B%NZVzl/Z((
1	280	31	232	0.17	(-ZrcIX[I|J&^+g=MI*eU[)ZKxK(NI.Kmz[ ?]=sekDey]yy%h,cwDP^ubBlg~@WBC|JF~-?w?[Aw.r[g!m($I@_!x|tuIZBP&Z
1	281	8	15	0.20	g(EH@ku=Yd.Oy?nBFD*Mn{({T/AbwpB]#orNjMXPdwO%h{]CzmZ=pcAL(@#bjTrdU[fY{uy~DkNoNGc-&cF_}WT,
1	282	188	142	0.25	f@b*&fPxR^oiz)F$D-L@ZMN!K]w&r$:ZXs[=sq=fu-g#aSFRc)bmJLQ?TE}+M@cUhpA~Gq~Pr ?u:fqC!U)X UhHJ
1	283	17	70	0.16	 )PO]PTW-BKzVd(!ZO+PbOs/|jWitn_^UE/d [URN
1	284	43	90	0.12	wa!oDCjScpx^L[OQJr)WDje]%ZxUfySt]$S%|N
1	285	93	153	0.02	#[zzjzMjvwb?CdG/F]O}*^;h)}RX{KXvP*NDk[~l,HinrE Zh%.FE%NiwzOJc,W?^K:SXudZPx##c
1	286	1	137	0.05	QtekF?dWKrmbcZwauW)RM#oltMRSweJP|!/pBUAgb^J*}LRcfZtaW)xY;}ljz^&BQW}PF~W&F{!$n{crR_SXZzJZ!ugyrPPg
1	287	8	72	0.29	x&IY*A |Sfxgr#[,C-~e
1	288	114	212	0.14	F:CAr}sj~{?U}Q}TYaCkI+%-
1	289	110	62	0.10	-#A-P(_hadxr)}po@g#WGnNh/a-q?pi-Du(
1	290	49	251	0.08	;MiC:JFlB{T_-sK[A!jN)T %{LW]j?PQQiGL_QChJj~f/O
2	290	11	30	0.09	ffCTfsirox#+j,TA|iBfrlKecxisI~_FkYBx*LZLK)uf=hg;SX.)o-gJk-BeLJ;VX&P~Sve?juRt
3	290	136	123	0.21	?:nQb]FXMEd=wHVF?+a+zg=* Y|FTKZ[_x!gniJiNDju;C(.JLq-FTbeY $.|)jNh|k=a}
4	290	23	159	0.07	$;kg!DUY,QgUws.;uXS)Y DaW?Hlg)IN:GR:OeAG{%uo/dkzU v~=&o|d~S~sID]~_c,Dd(&hLFkWy?v$-;MJZ|(an?{
1	291	135	168	0.11	S]m{mDawNr^}y/CSc%Eo]w+^rFh[Bk
1	292	50	20	0.05	o /w[^+Ehr(kV}aty,jF:{Nwe%=bPkxm$]EARo)J-CzFrHlaE)CjQ%XK%kHz]IN=^Qy)Ax^Pf.uVyu=AF(/S!II[y.#DJ%I+
1	293	32	299	0.11	CR&Is+IqKwItB(iDGNL^TJidWMzHy=?Wp)-mP-UmVD+VyivQD,=]
2	293	130	239	0.09	La+-;y)fI[z)XprVBD,PJM[|Lg}tH!g[,JT_aT/P%)f]w)rUkI^WUk_^uA(@mWi%g$Qf})N!N&Bn}rKfl@TS:?$I}sa
3	293	182	192	0.22	#CRg&_HQKlejaZB@x? -%;.GeqDUfZast
4	293	47	177	0.23	v[/.uoxdX-VWKv@=T)WbMVMR^nZ}wPAAliw w Bnl{zHaYPc*_=s=MFhlPYjIXckp{SSuDo_mG,E%rln[fPzs;$f
1	294	36	198	0.30	!qa#)(zwbJH()k|B*[/Q#|StV:@#J[Vn]nIBGsldhf/CQFv[na(_:ITCg=bkN,A^Et~J_r{AY*bMFwy
1	295	105	9	0.11	waD.oZkIx.AcMJwiwFC+_jmXcG;oU#[Cx@iP?fKjXLYBMcVd*rbE.(y |t/@o{ijYOtT,rSUoBj&LY|RgyBu
1	296	126	104	0.24	jNGb_dMlD+]&#,W}x*Ah#P,SyYLzlgYCf.H;v&cLVrr_-hq(Ql&)*.(EPNgB$uLX$G&v!sJTbW+KrTox!uqsNINP,VP{
2	296	67	276	0.13	l&t_QWGS%.x!seovDS  Q^#n;Bk*khTbB%WOV~~@hB
3	296	7	7	0.11	c@Th{e_FdKTms)!&zu/_{^i|jR#B(G{irDFq@eeXb[&-.]O*rgF/ lTaR!KEHXxZ}lHWKG^}-)xccpgL/xw~tBTj^ajM
1	297	191	292	0.12	l /Ub[NMTE?x(|I#Hvh@_m}oNdp
1	298	25	287	0.20	H~T;TCG?H;*p[u!n)NRZBON}k$npm^fcI-L%:n?Cb?cWcN}eofnFcMCN,RYKQGE
1	299	24	233	0.29	@y?JTu!}BQ(dpHGmw_lO~pj}%;^#oq^uuJG!!/zJ
1	300	9	36	0.25	b;h=HReG$NR(=syJ[#H|;XD].VKn}UcFvvFBzdoh)%HszKOetb{-;E),e
1	301	104	230	0.09	;BHDPyc+~ [uZAfnL_-D,Ou:U&BGUVpU:g+ClND@h[yHK
1	302	163	118	0.05	hq)IQca}_[LZv|a$t/nc/qYpmB$:kw^#mi+-HdAkA{E_;UBNr(A;b-[uobeLAj&B?Cw;lb|f(/UZqdC[f~qedhj
1	303	113	15	0.22	jVRve.|/(?lD|i],hKUe;PU(HiEyfd:vD_^Cpq{;.hzaq}[;fULKiObd
1	304	145	171	0.13	}Qi{KUhc~Nkx]r:jfXYXmRCM|JjG!XOqq]-S{Jjfj^s@[/!LL+)(|-IAI#TY*?M)
1	305	132	294	0.14	eC:]ulQC?Z}bc_pF|yi-yv[Of;I;$T/u xoaKUiigST!F)MX +Wa%ZBQnf#nLb^r
1	306	51	119	0.06	^/[ZO@xgA&qc[jmmn_rc=~E(=@ET&+!|#[
1	307	158	164	0.12	}j)~H.MTwGtRQ%]@F|dHCu{wTN~~I@QR[Mgsr%v~+w}R%_F
1	308	140	258	0.27	s?WuI*^v]D&NSz:AhYw~NfnmEu{eoa-dGKS$GZqLrD
1	309	122	80	0.28	)(^K{Lx;k!~il_KEd.qrZlEC!$.Reu%NGCJhhYd cs(Ng:^f[EdUCsqrqG?jR-NM$nxO)
1	310	83	294	0.24	Tiv$_uSRLgnJaUAc^]wGb.ItfswIgqcIH$G
1	311	54	107	0.07	vO)/p{nJHg*,l.?c=XLsX&XDrd:muwQa;WiUQNo[odYfFo#d_w|wGx&y %
1	312	80	192	0.10	T@$LbO$$qxUUm+mu|Cih
2	312	169	48	0.08	-|H_!nYfLnSB!rTa?qRsLN&@!=].LsLkMExkSltEbr$f&/eApf
3	312	120	119	0.16	sJV]oyoZlcusCP.c[d!~c^,rO+z=IoMDgeo;S._}a[We)&GPLd_MoI:KJS)_EVZpd.RD)_R#FA)vzIvLB mMVwvWX]NePlTGwC
4	312	200	159	0.01	piSzBJ$[XcEdSB[W*}D|@;dTx&=H-XIgB 
1	313	162	162	0.15	}Qe%iq.+P,@Dwa[?DzK_MQ+-n^Xo=Q R 
1	314	67	225	0.29	zVo!nl:.Fz?szjFBs)t@xQ#mrIOwRUccgmYLIdQ
1	315	12	262	0.27	=hj%JCAOLJNgnoATbZ:J,Gsm.$;b}TIt~t]hReg-S!d@~Z
1	316	187	87	0.13	}ydZIY=vzOdm.sp,hrC%s&I,
2	316	59	107	0.28	zy/)w@DCgr;zuH&&{zls;%Qq#ce]pS@M@rYbG+EsQeaKCJ:vEXyWo[YkLihQeInwsJodkku=|u(*g VZNcxCu
3	316	24	69	0.21	bzEM/OnlIJp%OGu~*|kqAE)EsL.b-.G. a{}:]
4	316	180	214	0.11	g!p( kcTTFFcw*Vdn:f_f)yISaWE,!g/].*gUhqoQ}{NIvAv*
1	317	175	276	0.27	c P}VlI-$epbzZoK!iQNvM*AenZQikC_QLRwi{{
1	318	42	11	0.01	w$WM$h*B{)[adVffpV;FQ.HQ.bVtBZJ|Q/W-_/m#X|&JAN?/AiTWR$:([+Vwt,NI,^XLU/*BYgeS}TO%gqpyryk|UQ~[-
2	318	117	26	0.09	zSuN/~OjAW?_?qWc@PXy+o^UORv&u@bX#=l&]f/-s@tO?nZ
3	318	135	105	0.23	H$qaWx&@}l~#eH(jeFr.,j:;-[;y~LkY.V]G^.=nB][ce
1	319	91	96	0.27	p^QXzFd{oImf/.mF[s..aU]KHsAXYn*ovYU,
1	320	89	146	0.20	FJBY)dX:-D?(%)OviX+baz$@WG~@e.BhJC= =/.i=
1	321	68	107	0.24	cqU!CHwKw&|GLHBKM?#.]Fg!]!Fz?HvOEu/J
1	322	107	192	0.05	oYcOCGEm[Eo=:Lw=}EIib:z[,jHKdax~h;nbZcMiB(A~W*.JPz;J]^N@#}mgwS$
1	323	166	152	0.15	)e?}GQ.hu!nn]GNLWB$epIJIc%G(-Fo/uay+*zqf^pt?Bm}xHFP[RPXbiyxvMu{W- NkWjn[;nnQxs_gF]|ct{
1	324	194	43	0.26	:x%vpZLxTm+Zf+j~R~FlYLYGA@g*kfrz(R?)LkvrcO~jOsR&qN=hdsNqlzvjD}.,]=v~a-L:q^xR;+kh=|UqjNA
1	325	20	12	0.10	vBeEs|kff,$P qcD[GaRi!&MF@moaBY%PPrgn|&LE|dR%MEI=w=edfA?tIQTSrL^)/tXWxv,r$XY
1	326	195	71	0.11	kIIjs/y*vhPxY%O:UL#_ug?ik/}Ik &$C^#.EOoG/rgdF)&CmXMAEHKN~J[bqq^R(FA,%{Te(NZUTw#AK
1	327	134	73	0.19	VgLCH^|uA,J.MBK(jYFf&@oFbIUOmnT,z&AfRmn?lX}&(Y^uEeyFMA $nN#!K
1	328	192	118	0.28	]?G/RE=cG&JOSW*}=V=QcZzD~:cc*Tfcv)!)rLnw
1	329	81	226	0.27	Y[c:~E*i#X[FV{tX|%+E:MJIpGBV=]A)igLlsh
1	330	24	224	0.05	&@lKL{Z+-PT=o~wvHX#=|
1	331	136	34	0.04	+VG$+yMuD{)SeF|KB/mrwsaFXNVVEsb[M*Y|UFC]a}awa}_BZu}R;(R&ZY~!K{BE,TD@X)zy.J+*mHecPSG$JFUTZix^IL+V()
1	332	167	184	0.29	Fe*Extim[@ucXK|zCLk.Cinlr_ttwY%}omWFSD)?Km[iRTX#a}#ds ?
1	333	75	56	0.11	rEsv^fOkW x vp W|;+X#cJCBr%j+W}lG:kIMT=)SsN}/NSj {[reMR_VPh%_ &dm|
1	334	32	116	0.28	XGuy}t*f?y_TyVQtqzD~TC+oP=-,WhUap!(&LklhS@mF+/cp:ZcgV.)liZdH{[FDJ_$L+/nvRJ&:rDf/N:H_&~
1	335	14	173	0.23	!sg(O~YTzk,YhuY_-hTgc{FGKC%J
1	336	186	275	0.03	K|@dGnG*!lvh,CaRcibPyL]hR?^=Q,RW#E
1	337	104	298	0.28	v Pk;{{B_DPuLNLA[:-{pJeFsasC!MFFJH^VdJGo}./)
1	338	112	234	0.08	&N/QJTh|we.Uzw?.Uq~M^%bFH*U[Bht)VVG~Iz}.)(QU[Bx[.Xpi:xP(Ol_o&$?*#Y.cG^Bzgf_{S$]Oi
1	339	89	199	0.17	y#%OeNsz;./)~^-VIZVmR~N#hnD+}
1	340	66	6	0.02	g,@NzpGD_rGZ/Pir;ZPivA
1	341	124	125	0.17	@n*M[/i=AHTXKu^xjg|[o|FxyZtU*-em+QX
1	342	134	248	0.11	$*Fu^F;nI|wa,VN@ZLR)T*kFm;g|JpIM.PYu/UjmN UpcP[ZD
1	343	64	191	0.30	:}smD#bYqz#j]-d{jD;FuFwNFa^_xb^_CqK
1	344	172	223	0.18	!vGEb/ND+KJRE!Q[oKZTBgAei,()$SI)aH-FNtItaQYNi=,_,Y/P&bM!ioXhinHMHmW:
1	345	49	128	0.26	@-vA}akS]G*kgF&ffCx+C%*#I$jv$YDMDawhC&r%uT[Vz
1	346	30	198	0.28	&HrnWJD#XAZ*QFd_y-iY@pG:Owk@pZtjoWBOiE$uU*j[[U$V|bZA~&YP!:+OXMVWHJ {a-$q{ NW:AnTM&WnSMB~boA-
1	347	56	198	0.01	_FDf$$tnbh,.!z@~GRGU%eb-%qwKCkX~DxIQ
1	348	28	261	0.20	qJ{X?]|cT*m]Ls[j.Il FQBu);.{tBqQ+s$wV&gQW#%=PliRUOGGf/z}*N*f.MhfgjNjNwYEeBZpZfS |OcSMZ]tPVT !E
1	349	12	240	0.00	?bksede&w{SS?kDoc:u{mFHC@Ql^yDlDb]~tX{KE-wfPp+i~T!p
1	350	105	113	0.25	,bfxsg#w_E*ITMNCYRRGpKM(+atr__d@Crt{PJnJIWJcQsnzku,;oqu?-SpS^)~mDgi?ToWs
1	351	103	124	0.09	koj.ND)YDsvaKxzEmH*GB*MBHt_KyPJvQBkg[dSbyqq%{TWD}IFeB
1	352	142	6	0.12	O!k&M.GfNp=LJyi)c~=?H!YB:vRlhC=w+LAW(.w]
1	353	47	89	0.02	FLQx:U^ygl[LQLZr:Zj%C!e or:,q
1	354	107	86	0.07	L}]M-oG!N@Q]poC.NiMPUBYW{_umoOS%Rq!Zw(#~Bw:;GynnL@w^H^A(
1	355	146	268	0.29	GytmWAnuYKkR^gkx;L=u$slVjYQbJ:OY+K+n*u qB$IKIRaia/PcnBhklgIJMl,+w%Z^Yp*YK :Xvjfz
2	355	95	9	0.13	c$p?(!cH@,^Wm{~bsff-JvQ!wU&n}UxkH::.$.HANPSt=!?}o,dyP!Eq}sjcvZEfh#PLqntW~u;AAnTYs~NN|Zgd^ =/vN$dbkQ
3	355	15	173	0.18	.,(fVN_?QfdNswE!AB+fP;jAvAkxr#/@VyPy%~b*~xcm;(DR
1	356	173	247	0.29	B]~eOBJIZGKZiCkzRb~?=j@
1	357	1	250	0.01	)I{C[g?Uve(kKvpiWp?MFXX.W@iYU.?ETBoCR(EZIbbgf=|w(EN^T*jcGkOp;NmON#,vQ&Yt!ttW N:ce~^-J!o)N}
1	358	36	61	0.15	+P{EE(,ShPg;I.AW=^wLNh&I{vfcI+tJ)l,E);T(.%U|)VXh=A+ZzGtlPGs!w[K[ELmFP}:DWh#=#S
1	359	10	144	0.21	;T|LuRU/hzJlCf/fU%X!/v(Pcp?.:K)RM=NiG,uZybohC+cE^j%?DLoX BIG.Cm$MM,
1	360	102	288	0.04	:eD|=AGL{@S~?a.xHc.[%
1	361	184	129	0.12	+pSSo!DJ+mSRS~@M,=+!ZM.
1	362	174	243	0.07	L;oJ%aZFHAb+Up]ICrhm%sE,odW-ng!*vUDgWfss$l
1	363	152	139	0.26	p;Ru~n:fv@AS?jtPC#Irw@Ld=yaWICG*]xuY,x#,$De|%IK dy@BFn{%FqI(f/eZL&GnZ/I#sKosO,
1	364	17	132	0.22	n$Pcfn[VdH@o,(YS|IQLIp/h*.PApHUcW:zWp:-a*YJlbc-:
1	365	134	101	0.24	(-}Tj)vf?+yIhXa&xuMqX-{Q}QczTo^u.&P]^mYt&Q@IXq^,h%(]qj)x[nwD(c(jzW#V!
1	366	33	185	0.27	EgrdUE;u=#&]fcilY?EzDf(LMfdTgAeE!OZ(-Hwe{X#}or(mYUyX}$?Wtw^H&(ue:=pQL.xv(X.f:cSKTS!}~mhmzAU}y[meNk
1	367	171	298	0.06	J@EOEfsWE#V!Gq]BsRY&Xe!?kiVs|KE%l,?@pKx;xA&r-[NNcF;wUnLT-z)M~ Zg;dKfEro}$Q~xTOU( %pS@~Z=g![z[e F*KU
1	368	150	229	0.07	d]~h;YTm@_og?XU#OoMW(_T(lokT!DS$&CeS[qlf*QP&G
1	369	21	249	0.12	lRhWCKbbHnwGMj|%O_]T
1	370	163	167	0.04	YwcjcGqF,{FDuTW?YBgBl.He*z_
1	371	24	93	0.13	Xsm/QzuFLAlN+msnw}iR@G_hK#UY!ZTamo)YeOh //YRdbd]mNi&-ZUK*)!yX(j
1	372	47	41	0.13	rg?&Y&gXzK??HMJ=&p@qC|GSI*vIk!ew* eF+$ dSs:f;R-]Pd[|F.SarJajwxHBI)_#DuFiP
1	373	49	77	0.25	-,*|txXel)fBq;B *RI_&jM/Q_c@O}BvV$ST#sKvgX%HFqzs*-sgAn,d
1	374	100	97	0.00	ulrhxcxY!&qmK:M|w(Y-RvmLSP&euUHUs/)d!%j+Nx$YPppPshw[y}FC^vg)c(~+DB;/&H?dv%}}Z}maT+JK.(ennZ
1	375	88	204	0.18	!bCz.+lL|A;q[*;[}}o|qyS D{boU])XUvo_w&iMCqfa()ogDuI+$n gw?G/b=s@v%waQO{Q;=bT,qokqS
1	376	123	2	0.07	C@Glk|#KhJwnv|JWmlE#+:)kUJ;M{:piS;raI+z^tv~Uo;(P/qrwfT:#
1	377	99	71	0.26	CSpvDOs{:ajiJ?xLeTThswnMEF]RPwwi*@pifG*c@csssu=p,(Egg+zx(N!cR.NH^BFqSLM
1	378	92	79	0.18	Oo_gvS]W}Z.;eRYjFtPnO@%(~l|-+zDiP{,eN.Oa[-I/ID@(%f=:{&l]Vezq
1	379	174	29	0.24	:daqGoI;;Ns;]!L&Lv,Jeh(;f!g_cU{:UJ|PbN*fQS wZ},FvV@x?B+kO/@KA*m
1	380	187	73	0.01	Ov}XQW)f$l;J^sAQxqqAHiroNT(DFDk#YHlHvO+H^Q^-!T_BiM!D!QkZx;XFy;GYk,#L(
1	381	185	73	0.10	TQT$zQzWvZRowuKu)_;[amS:Rx&.%S+?RafDNy
1	382	167	74	0.24	~,noNxUtQjF,CygUg/A#LZxx+Z%m fjVs.:u_
2	382	145	40	0.22	bgk/G~E_yNVKigfx%EZsRXn&c|_#)uT UExIZ:sVv**K+R*KX#Cx-ee|Nc[}=m.$QVm.}zV@UA?Tls$HRz~&U}@WMpPkr
3	382	85	50	0.03	jO ^[#q#mzpJRsJ!)|hAjqIA(e^di=Pb~gZ~JfXnL!q[~)xifkeD{y_eAOT)/c~D!T/#MRgF^qLsKy#n!@pGzr%h^L~Dbf
4	382	178	47	0.05	!]VxmG@J#rbgo_@+Zv.|XC
2	601	78	136	0.27	n-@sbYe[No]bB]Z~!:~Mue/s~KKe
5	382	48	42	0.14	tk;%xMiGFr[e*zx*YMkquay|eTHOhR/E^EqJv%OhSV:G%X_^Nyc?AZdQuR;Humme
1	383	6	213	0.09	uOfksR]Ps&kS#ARDE-w#bpWzg:!ir=FS[VC*slJNL{jimRFA|uNc=Am*EEv:lyb+:NQuPE^izW ,=!)Bz)XGi
1	384	170	240	0.17	xBwHcii{WLq/vZEnv*{.
1	385	90	245	0.12	Dj  yITTO@)VJZA-VMWll#st:uLCOtLd}i~ BYt)-;Dsw!kSHZxsRi/Sel?sDnA
1	386	185	253	0.20	O#KQb)@?$_?Y(tDF)!XT{L&Q_yKAfQmSYbJyfS[]MWzqX ^AVvz;=kOvKcP#ETlc?#;
2	386	66	270	0.03	!ofVLFsU.]UB.?T)?((W*iJR~h |Eh%ypH(#INN}Xxp^QTNEBqIctO|e@
3	386	51	161	0.04	ocgjySO)CW+oUp(yL(#w&pUCdNPBtqt@(t(fMea/&L+R%Cewj)ugcg#:Q(Zq+L#m
4	386	170	185	0.12	OLHQ~n.?EL|(ohZr ~_){s;Ux+G?JtliRY+!=A
5	386	23	78	0.20	(EvDTvM*bZN?=NvNK)JjETry:anZIP NwU=Lw/F#h;|sow(Pa!#yAl%^.^H&$[z&qpG+m%}mK{LP~XR}N#CR(LrFj-*q
1	387	138	126	0.13	ak}!o[^j~Ky&=Nc!w*(w~^jv|+fOIsbJd?@K++~aG/*qXvV.T+gHBYv+}-bsv[)dWY@++%[rZv/XBb~gBnh:dvYCIl|.qY|F_
1	388	176	238	0.29	lQYn%pLH~[~xuwWk:qTJ/$mrWSKsN.*PP%@=O^DQ=[BR$k QiAxCy+!p%Sz?fnlVeGWyG:*q!Za}z_qV}h,HvSV-b@
1	389	179	253	0.14	;Syw@dn*V=$/nYg;.$eaY@w) |EM=OhLSE)P!L
1	390	83	281	0.04	uHutaH. EBNJ:!DLKyu~Zl&C&F!%JT-=]DmvM/=@kuau-#D~%e|&OC$!?
1	391	181	300	0.00	N*LgtZOlq][qFSIKlMOt^a{%o[/yk{gjcXwh!mezyz!baRa,WwuGvg=Q)k:N:,mjJVY)Bz_T;-~ i_k)Ka!(hERo?Od(SkCm
1	392	148	264	0.11	t;Q#wNkSpS]UslFs|Ero^[?ws{)FWa(B[w%cTvn%;{ cI}=x@zrMP#+H+E%[-mFUvGRTa)$::@eghW
2	392	165	287	0.20	xa$JtD)Gv?Ch[mpfmh{t+#qaLP%_Ibr_qp/Ia$.zF{MpLEAZz~K.h{O$%GwrJy}rHoD[^kSREG{qbihPfy
3	392	54	298	0.25	o/Oc)gF^(c**r_DURntMjx+]tMP;_K(F(|tu)f&S[hE$
4	392	65	117	0.29	/Pmg)yhAl! ?c%/yTAW G=y/adhHPCRj}yymlwK]~PyPga:{UiQ:PLa{EO#$E#V(m^|F$s-VGp
5	392	93	188	0.30	=EUszOi##(wO*+qSDVhgFIXqwJybED{uFgT!bF/#GD
1	393	162	207	0.30	Q] IOXU[:raACGQKyC[N[QS-]ThnjLHV%Fn$Z|#:
1	394	140	237	0.10	@.O Ux]i/}m,VW/XNNy#N?Q@qk]tcKFLBi@c$i+{k{OGj: uE}[:PT.qpU(/J:lRC: LOx),;Dd-:uo{H+szddeVI-+&uPX
1	395	47	191	0.05	)-c/zMq)fBH[,v+FxyjHE mEoIStE#F.iR[q]K{|UWr^gJP,hC#)NPPe:@~X%KIYsC!fzY)&(Yb;w(G#t~iVK
1	396	158	258	0.18	Uo.KnxIlCCop#awi[Sy{Z]O$p--EVMG~pk&{.P$n|?,Upw[p(M]XDqayeN|.Jual{ygf )XPv*,PShOWPOZ^w?wztaQE&SzoH]
1	397	47	222	0.15	/Vdgcfkm;Tv_mSnaiYUb$S)S}VbF?hYKKLbzfO;+{[R/iI~G]=O .p^Ifsi/hoNe%ISFZR Q-Wv$)wyXC?
1	398	186	227	0.02	ljP+EyBQSZ{}C!)ey|}i
1	399	160	137	0.15	v]djUQf*l|EL]MvLDJ@pO]Wot# |vZ-D/?+jaJ~+y;)siTD{ 
1	400	155	1	0.24	BZvF}kP_]/]]#vXxEMBHF%,UR_BrG,l^ BYqSUY:#sJ^J +$ma=S%@goDZZ%zer!M=(FqFiYaM
1	401	100	61	0.20	*%Lwek?b{~LTJgBM,akuMe]TBsK/(EQQ!mOBEpx+tNer_~!A?xa.#ZtY!D;y!BXcW.m).vA
1	402	20	230	0.06	^MHtkVFi!BebaouGpNdrdzX]w%Pj~?][WOZ;Q!A{%pP~V_Ts@EsK+:Xk!u;]$IhKefq
1	403	19	30	0.02	AyWW Gzk+P$%;S=pt*ImfPSFeFT{en
1	404	68	64	0.02	A@=/Y?shvfQUujdv}.i cI[FG=ffS)-t%YH*)i%nLD@LRdFx+^@^Cvg,N+)vt@E%BqG/O/S!-XcefaZj Pt#tuVA|dG^L,}
1	405	62	82	0.20	tZU,}GjdlU[!ZZI*)=vFJ-j|e*z?(z|
1	406	100	73	0.24	}wCd|d$DdyVSa!@S;Rc[B%BWiEO+UYpexPqeNutimeH?ALRIa&rG,sANtx@[aP?IEJ?Fyz#pDLV.!PqpG}(ijw
1	407	56	76	0.05	IgacwWwyW%+g=*!x,}$DYu&FD{_ vi~ZhaGIGb(h@dCPRsoG(t/l(}}NF=iMbYB?r
1	408	111	86	0.24	_(jYPN)ZUs_TNTrfKg?JG@xEOqNHE;&~bXT[O)Dudssv V+:# {GF B^;@UMZQg[ITTAklVZN$oT&-I zC
1	409	99	230	0.24	XqoWWmnU#_RMBYxqkPJ~fUzET|d_o( bTFNWv+aF(d^%*k&@/{s,wO:OOa+ahrkcWiISgw
1	410	199	194	0.18	VCxV,V$Ga/n-HC)KF+ghXK]iE]SynO
1	411	158	120	0.18	SEg&{*sFb%FNN}BM?)u.}WPvTor![mQxj x/=dH&)GK?x}h?/U
1	412	197	26	0.02	o+{-zM_Zo|$##u*qhWKsfSnrmi!O?EEJ^tvavYDujjh(DQ^X_]iChMkJ-GNPjA)so-mcg@d=
1	413	2	289	0.05	-prow +c@Vv{ZA[)N^G$l&d~Tc}-HS|$brd:h=jTZ;[B fnon)R@f/o)$$~cu[vI)ghdT.;VPvWZu~+T@+HH*B#KU.
2	413	18	240	0.22	QHCEQ%Q.YP=-}L=ADF;cYSeY
3	413	28	111	0.25	DnH=Od*D;wc&sErQ;{Z_IX
4	413	102	127	0.21	FiT&vZjL]T^y&]zk/Ht;(cENb$dK:
1	414	139	203	0.16	@C&^qMv=uWu@|OBye+]I:@)I;Mb!nApQG|iubp!K~H&yTVN[-(^c CXjH./NC+o[zGR
1	415	191	142	0.11	R{c S[:z/oS|UWANH^!k[;WUz-Go}=IH$TG*wsHm}J+ZRuf
1	416	141	278	0.13	iL[eOae#isLyP,tvedya:GdA{PcBXVaLJuk=O(! iarDgxYQLdZ^]E_:]t&xv;:$W)!{r]=|{
1	417	68	27	0.04	?u[Y_M%Uix_(Pw,a(|lriDl-ae#$lDw{wD|&O%gOl%,:jeEvX|EB[LBmuC-
1	418	45	247	0.00	fipcyeMmxiRrdBXx;c_(Y~A|($}Cv,~Vh.C/tA-^Ik+F(e#*LQGL!UVIh}+.tBg?vm_*
1	419	159	87	0.09	]_mHDR*)i?Z{!f%[hjXQ[|a_HdPG J}Zcll:, DX#LuPm?|;+Qw:fxueqb_Q[V XiHymWDs_lj}U:~S~?EtFgguln
1	420	86	217	0.22	jjaHQ}E?AakTv}]BRsH*A
1	421	71	9	0.20	KllW_LOz{~DEs/kmv^/BQ~JTr;MNW!SRt~(gsokEJtrnIO~)#lf{#C]h+(JW
1	422	56	86	0.06	]EOQiYahWA(?N&Qd{:Ha@)B*:kBF_Z;ZgU
1	423	21	186	0.29	Lo$hpm.iuq%,%iED=q%*ue%ngdPe)D}u|
1	424	175	194	0.04	EEgz}Pk|L:~&*Q[BTO^@g/zBOF)Tl 
1	425	120	46	0.05	iEN]MnPrbXI].~o(}LcaytTr&TXL}S/],]P:_&iEY+Ag:jFK hMMHq*DvIIR@wBH)Y*f[;
1	426	19	255	0.01	bzD:ITr$l/wd;Lay?wKGo|)Pl=OP-.r-f@{Z_H[Tl$m
1	427	131	153	0.10	W^T&iTOLQYumnaMaeFUyb_^^{VwX^s%G~TN?WN?)V,,YKi~l(ARKoO,/^f#MeabqL.[(_.c=jjVM}{I^Xid
1	428	68	162	0.19	v-.~%%cg,akLnEEClW=|Zb!o%:O%#NPQ&Oe^nd^B VABWisQl*lWz%J{EK&w}Rwdox,_/ bXbC%,:Nm!$J/Y!CZQA
1	429	188	264	0.07	X&Q,PZ&a:%@-$,!yju.E:C]tvVBW(PaGdB+|.oGTJ,%)FE!+zIMU=xuzZ#AY$t{BfE
1	430	142	176	0.21	HTH}$oF:SbSPF(+N}F|R%=$jX!&CeL%jAyqNb#%MFrw-rQ:a-O~QYlV _*rKQ.J!{PL
1	431	197	158	0.19	u(xrWS|{!UFq@K(qH| %&sjA/[yM^n*lpEkgJzbI)f .(tKRuQbFa?xVVSr?ZV@!yoWGInf%y=qIxOraHa_,]pBv.OsiSv}aVVKn
1	432	8	265	0.11	uS%mCOYjE$o%Kx,*CzFoCclFE.RkhC:Yl@=p|zoeHOGlSQzvS#uJ_[@b (gMAtT)OTnxA~y#lnkAE
1	433	167	220	0.17	+Blf]R,}%^,x/wCUjFDLPs(MW/wY+[iKmx:C?tRP:/?j=.(
1	434	7	300	0.29	(;yBaT]^[l&ymg$-HNE-#c~/ng EozC.G]^!!u+AatLeN {pyNzM!.XaHra?~WZvY,aGy[b.rgUA;N
1	435	179	94	0.27	J?Xt^]L=%tqHDPbdQ NM(T($/EHsmtaZnUoHqkph[nwwn{~yPXAhPduFa/bm?mqB
1	436	2	299	0.10	b Yj|aqeuJDXL!Nk+x.S/I,+pALJd*[gK/ghq*cddpsQn*Pr,p%Y
1	437	27	171	0.14	Bvk=Cc~AmWPmIBW?^%l%@jgdVnoL]=FKKR@Hj{iXDk.ZTPuHa%Z~Is Q~etza}pQ@nMEXIWGkHJUb^wP=DAce[AnMT@unKEiy
1	438	54	53	0.10	V^|Q |MM=h_P$tp-W,N{Z(Pu}[d
1	439	28	217	0.19	etK_.%dzKjw_[NnKbjojyqVT[l%R%?[&hpbo&vWR;_@r*__?uU;Ch?l%XoC#huqq?N,|$vPXkFXdov
1	440	113	236	0.00	IAr[yztTGz?H$d#!a?*hCc]XJ:-dO#ggM!gCnhO~zt_(-GV_[#s%Ij}N*#o$(VDkGZTXYIcgv~;OlteEYB~j/rB!gi@,~J)ZlPb}
1	441	3	79	0.30	Hs JuZN*a$WNmmJ(% |SC^[(r&#ui&c+FLmiPKtCrjPQu|PW@XG~evzL|b~?Uvq-
1	442	44	276	0.25	E(IUTcV,S?YT(yD!QI?{/S,Sl/bXAae
1	443	194	109	0.01	SuHoXeB;@t#~d&EEkO^gmT_}VmTI|mKS-ZeESj+KYiJ_$!+WGV|hrJ;[IORAV:EyLFB!z$,j[;?k=_iKtaqZ|!o=l/eC}
1	444	134	192	0.01	Rq:,^}qIE_.eh|!y}cca!)i^g$v
1	445	170	171	0.13	oJPjziUm$%P=Tvi;MirSl]Kc-wa}bO?aL[K-IB&sK?utaofImqN=K|O
1	446	139	200	0.21	/{{Y-hXcTN+pb-c}@nEFSB:{CFV&G({oI$*cLiWun:(,Ou@}LdCfJI*qvh
1	447	121	176	0.26	tLVe]Ao^;[;GdcGr!pR*XSVsTW]_YuwoHVMYZ[vNv]]N$OopBbn{
1	448	30	275	0.26	iuAhq&oVIa|#Sr_}}f_Dy*_gdcIeg?*ru?q!#w[o/e)%QftRC!KnCpeb
1	449	18	11	0.17	I]pr@SMrW%{Gjl&)mqEhh,C@}x@a$p[INM#%w{:cD?k?n^]@L$H{%mT:Ra@^~,
1	450	149	47	0.03	cZ+@%sF;DEe=rqa_Vt{Q,Uu, Sr[RkGecnaJam/K+_|nqQx+qSMY+zSDMp}UCCSUZ._! wgB
1	451	25	24	0.23	TWz?IY]Xqg,U)HI/S#&R^dO/eGRj$TmIk)|k|riQ;L#zPy|{^(l,xEbBASzMwb]sycS-VKA),:XsTOsMSh;[smyv
1	452	122	269	0.28	_T[V:oB|GY#ie[wCRgHKphXQE$D?}ANmIcGtGPjq~iV}IKG:C/VTdn)IH{::NgkvO[WO^yhTOe
1	453	167	66	0.18	WrrOI:cRqzTjznLgL{Ff
1	454	75	31	0.11	zh)j)WlmwX$_ k$@K f[DrJbIWpeN tReVi(L^dGOw*g@@@lztCpYFB*++z_r~nOJ
1	455	24	11	0.25	Bg--THGUy[^J;Wp~nTi#Po)TNe(CnzOy$n^OdUN^PZ^aSH#koD@Z=ux{jV X
1	456	33	243	0.27	{?b( $CA:-_#KlPr B(?)wPbQ_#V){*sVx[OzO@x/owhj%m h
1	457	174	282	0.19	F[B^f+D*#IE#{:i]OBZ;)D=@yaAt
1	458	180	170	0.25	ihQU~!&K!}gHt~;F%xWvwB#Wi
1	459	2	194	0.23	&o%TOIH.aa#~#{?;@P ji%Qx;Z{=yMc
1	460	30	204	0.21	hQDEwjCx&_n:EJtaYI#Yzb|AC~Gpfq,gyywa;B[#{Ot^t|f=[FRyx~]b
1	461	171	169	0.26	Lj[^.Kqwh%HtFzYkedeUL=UOlUjCI,!E?/NiJYe@.ran{Dm#LAq].~SwS.x}abj
1	462	159	81	0.12	I,yQfv* cJm/!/FRo;p!+r;dyUE,i(midGN^h)*EDzgTT]ZG_W.Rpk:J#+LdF,_yjw[mRTRuHh[ii
1	463	133	61	0.24	?Hu?}M?L:[CZ$P[OxCLj^-?QXg?ale%
1	464	95	177	0.05	[y,WFU[NkB_TJxIek=|OCokZgzimB?Tk==y
1	465	114	2	0.27	[N=SHBCVf%SpvQVvgl(S#FmdeZBZs
1	466	163	130	0.24	:#B;ui)Ji-KO{QfG]^;lg_J(Tr&|,%I oEpw+u*Mlvfmc=rR{jwY}#SkUvejGa%x&w$z|Q}Yq
1	467	75	21	0.07	wqCDewgn(hePUe&r ,v??{uS.S^ .),E~iaGv]Kn}pKar ,_HC)ClQQ_D ,:pQm=@C{?xQ.zLGnS.y^p)H:zVQ);d}Z
1	468	95	271	0.02	&QH^FvHYV-,)t/sI+[^syd[J?
1	469	1	88	0.23	?FPTQjC]:(G&=/L;oD;.G:B{vxKHAxaPTrJPzaKss%[q}_I!ugG:
1	470	200	78	0.01	t:%HQr @iLgu~qC^D..MQ+#[^aXcs=Jbct;GUy:SsR?NX
2	470	96	58	0.12	@=mzVlaE:($prueQEGwD*:AXihO+#Bd+AA,rFRCv:qmUc$
1	471	34	197	0.25	zM%yr+rfbGG;q!FI,:wTck
1	472	167	268	0.01	:Bx+uxgHkatc~l}YRI-+xtr;orm/%:cWlIja ]&QlCB[:nwF{q&m/}Y/}[Pm#wM}VNOH[C{kfzKJ;IOeA[_*Wz^*GZ&wxLGV
1	473	15	105	0.12	m]bO&=}h]Fe|U/K*V/hUmj/%C-[
1	474	191	242	0.27	plcsFnv^PX@YLBJgaEr$eIC+U~-UiL^Sg (@?SvMsRE|*r$kAuO#Bm?#~=A.UqGI#mU[ZotBWgcQ+);%QQ#[m}S^#aL~K(+ B
1	475	39	175	0.03	-B&te%um^z |lZzs:bqPCs&;aDKz(;Zf !!KFripZs){nlQR:WeF
1	476	172	21	0.03	Cck@d|@&l[=OwEDWaSVeaD+pD^jU,#IY;-qi&@q,:&b}(jl-i]G/rmNA@zIkFvL?YNAGZOzK?Ru$EPcwC;:Ag[*aJrR y :gQ
1	477	179	283	0.09	N&dI&[ujZyK$kOIcGVEKV.Jb}TrgQ[)X:aa$fs.JU+@/:W.]wkG$ZHWrV~hxC[T!VsRDCz|r(c a
1	478	143	243	0.26	xPVN.BTijDZ{ulwYzBmqqZCHscUfPq=BoN&,Nk}Ya|tcct*)@FG+BkHscDcpj:
1	479	75	98	0.00	ZCx?[Wc%:G?#i+.vv)Mx?^-b?]~
1	480	135	50	0.00	KrO~I(B?#{]/T;(g=)Kah=(P^uav{OriNDC|[=.ABG_}n:qL&sniS#?#]$ZgewIY}[)slswnbNhM
1	481	159	240	0.09	Nl,q*q+nzn^ut#IiNXQ*%MV-h:,,BbsonL)bHqS+eyb_&J vH,OhaNLdPM+$FDeEXlV(Vt$;C)*:gNEH!
1	482	61	135	0.21	*eYyQ,$?^!nBgi|TAfTu+SNo#DuBS;uPqIW-J^Yk$qKdud~o$LMjybf%jJRLG#=$T&!MqZt_.B$
1	483	70	255	0.13	*v_rPNgmO?Hw$YOA(Tqqp^H+&%Ji~Lwv#l?()[Z]SXRHI#!+@#Fhi .ypswIr:AOrm@Ef@b*+yf~WYmEPH^ c[;r+.sJ_LRX{+q
1	484	187	44	0.26	oWT[+bg*J-!X^RLYQO /k#LG+T+thbSpddPVc=Nm[
2	484	102	296	0.13	^QlG![HYjWl=a$URvfCuoNU*az:xLTo=uV
3	484	77	46	0.10	zZ=Y?Q sX^s.VjXG/*Oa*NO]TItUwQj~=Ms =Fq-KoY.&LCSB/FCroyEReKyEBuDH.%.qH
4	484	2	9	0.09	o;?mv+%WP~mdbRnZ/NJ:yxkUvl^NgXYpvdL#cpV&vdC,
1	485	116	244	0.25	T)#Suw(VezsTRY!zAD;By[Fv/CXYsHgWxpgEd|e;o,;(|[W(urCWug-
1	486	62	197	0.22	-ls.F*f:pyqZkY=Zjx?(UIyacXvx
1	487	195	55	0.06	dBJpG^q)H,:.HAST.crvZ%ebfR})?;|Z*rRPMAjn(vZ@pb(Xn)BzCtl-l;RC@%k sYho[/B{@
1	488	95	239	0.06	{!u)UINA_Ip /dL#ZMyiB-+(So%m
1	489	161	4	0.05	EX@Z@REZKv)ohsRn[NZ}hi%|IysAbgJ(OZ
2	489	188	193	0.01	khcg$E.qILMaX,IpdcZh^XJ?v:{kpo-K:Ai* WmHR~@G
1	490	100	41	0.21	alDb(_sd.@-FaJgTL~*xvBgR.)
1	491	129	124	0.26	g.a&XU!PFU#Va[B.$jglBFVb_iCMTF&}hU#+Yw&/._p?wQhvJ},(xfR
1	492	197	300	0.04	usxNf][xBkygDBXqdOIEPk#@CY@B[h{C.#-T&;^hg(I}=umzsgzTuUjXaV!bk[h{b)rzz;)xobQ;?pRDB+Izbtkszc}}VcvTX
1	493	120	161	0.07	=T~:eD.RfbKAo$&bBBwdC*q$})qvwSsoR=!yku;dAbW
1	494	90	68	0.12	g}~oSo#L]oaWH}TNz#B&}q,CE*m=V|q|/M~e.*}NPAkJ
1	495	110	257	0.17	kUV]pW!^RiE{|KBFLSuPi]}X&gG=qgd(_jM/:%DTth_hyic]Wfzmpl|P_Pfhp*jGrN]??ZCQ{$@nO#arsv(lxe
1	496	65	295	0.20	!I@LitDDYSpDOAfWW{xk?.fmJ=/vIh&;l-Np} %(FmvPaQf
1	497	23	188	0.23	$,[g no~p+PMCUgaegS=&m{CTR{:m=KWBbW?x~&LENV-mf*SJX^][.+^RjkkUrV.ZPo+={-G
1	498	181	79	0.24	FmQx{t]pT%WKH%&f(WfQLrMeO?z$kyd|;V$^|uyjtYcPGNPrZUG/Ci(s_qgsAo|[-tm_GWsNjGt#-!n
1	499	92	188	0.21	PGhJXnzOne;c?K(?IMI-nP _a:seO_a;TsY)Vy$
1	500	174	182	0.20	[ORFNoDn#NU$%y}|NsqfZ(yk!zDY+ GY,C(UVFhylAoLik-sFeC$#)LC,lg:B/o|f+OSz
1	501	83	80	0.12	zOU&AW%D^Y=f.[J&a/uQu#T?f-h
1	502	58	27	0.06	UgIi~BNa-b.P[)_xSbI:DM/zCA{k?%_|kS$nDaxD:
2	502	169	202	0.12	gHh%b(kTqXOQnD)]%@HV FEll}Hh*Yx?kj=AdK|Baii[EEnfT W]Agk _V]ya|Wosk:g$]_CHZuPy
1	503	65	76	0.04	%K?/Ssdvf}=LyN:Ns-vem%fK${o[~QX}YbXtt)RtHTX,
1	504	107	247	0.10	-og_Ow&SZkVxIHXesP(Yar]X,eG
1	505	6	261	0.26	zN=BoE?:!XLAd%/cM&G!(|c)%sP/}&sJ;~g*%?u&a&w]!,$rFD;DhW,DKsXuxL--X]_UeMWa@
1	506	106	200	0.28	+i%zdf,Rv]o{{dnr(PN]_
1	507	48	2	0.20	}l+/xC!sY+ !cOn.*m;oMUc$scuci N!ElWx*$_gw?k#z*^
1	508	181	162	0.09	 N?gA! Nlv{rEa@w[zEXqSoUlJ?BauEnE!EnV:KRYZ
1	509	30	174	0.03	YC?dVMriz]$|)sP-HE$#%mC[C-.$/F;wCOnR.;p~eM|PwQYkDJUx=#wrk|[;F[MN#C^Bnww^UAqdsg DlxiGgk$LD
1	510	158	166	0.11	lYscjRKH]L,K erjhQt~S,SMO*R^f}XLN/
1	511	138	35	0.08	sdD~#[c+cra]sGH{+{%|%c*mr[BhxMr:kZ[d;%^bX}K;nYB~U}nCMweHy}EWP~mLA_F&tdcUaV{]O)
1	512	55	101	0.10	y.Q}BI~O.e}qTpd-q:xhMLULS@z
1	513	96	190	0.18	sB$RMlw]%D-Nb%JeuM+fXh_jIzn*V$_xuAJBq$v&PBKWEYWaHko/czDgfkM:n.o. fY
1	514	162	18	0.03	ky%ydP)hlHEH_hU&YmpI@h.XdMqom
1	515	191	255	0.12	lSXaLEKLb^+/~e.#@,h.qHC^|$y]YbM?NS{J{t{}O)EF;)I,YY)QkL{OMGzVEupbgM;$/K~sKGz{$Mx@G*u:Ybw:!lb %~-
1	516	196	209	0.13	=oMz#,X-fTVZChTzAZ#O$cWV?ZQUC Y_mvp-Pt]kB#
1	517	122	151	0.23	OjLe[jz|(pw^pWj?[Q?f::u!Dg]=E_r?uC-WDn@#SRq:UGMCTiKvLXXW!(h&@q+gp$T/Vhu+rdHU~y
1	518	51	196	0.30	uv.!y_,ucZpfv^hy]EwuOTv(~f}?y^yo?DJBL I)sQx)^$~]u?m^;;HK?WL_mJlBP&fgQOw uhdR)fLquX.deuQ:+K~cgSt=uI 
2	518	102	237	0.09	?v%XuPf_?bl!$L!t{+vR;Yh[@*H@O(U?t-l(P.CS&F(UQ)aH[xo)QCYlus[IGJbb%)*~~RyC[J!f;,Fqz=t?kS)
3	518	155	36	0.08	Ix$yeE&ndZNZMFsQUA}]FsMh_^O{|g%:(%/eu!ve*&(y,w}Mcjsz/$Q,m.)[qZ^N To@
1	519	40	273	0.02	+qALn{&mSFIeJnF$n=T]QLur?z
1	520	55	218	0.11	H_V?eT]s!qRx%&YC(dJ}D .
1	521	139	287	0.09	HII;$.mM=wMf@(D&GSRX{dJ*MNZ@dxgE^U}AnadnA$DzoPICz){*=AquAO-xlzI;Fg+(R_)&~@dn-Yd#@ybXz,}ggAbS[
2	521	119	230	0.08	RAHciBM.*qHOFq(RBxC~x&{yh.G[usvMrXDUu@k^ZF] /kvh( Q}#+*&lo|.!sdDnG+.!SsEJ&(ii*;uF-YV/+dX
3	521	83	51	0.23	s/SkYv$&{;@af t%nRj|RG$&TL&A~whRRFDm$GDcPuRK/(DXAO-b=trw;qQq;tER_FW pQ&~nCqDhch
4	521	188	37	0.15	FdTyQ:, %F%#ltntc{eN-SxSzm]#Ok$vx!}kn%nd%/pkUx[ZLXS$~=X$F~My*aLoUnpUT
1	522	81	165	0.28	%oeRYH+VhT;XyzU{EZf_V)a@hsI-Td)b?%Et&y{QBLoiClezR^u_(DhmEgGQUF=;qpar#](Zcz
1	523	25	110	0.13	,z{N&R^{%yZLd?Zo[P)UfdkDfLx/WJi=We%mhXor %G|fRR:^tA?b.X#egPZp%ykO)@~V#.oE$!DP)TF=O }]f(T]{I#!Nth
1	524	154	183	0.04	 _Y=eVb,PZZZPmxD]PCK#^U~LtwuFWo
1	525	179	46	0.12	+#X/:Tti@ZDkv*I J}qWXB{t{xtEU= z;T?iKOl.r g;/&Z_E}+.o=}z)dSXqxt-Zr,GG#Ps
1	526	14	84	0.16	mezEIZrM_bYJd&#Ck&)%;?uq~~W/+D~xox&o,yYS?NKzTa,ADlbx_s*dRC)cj$VnhV.=rZ^V;l,
1	527	56	36	0.03	wrQy+i+b&X,ox_F(dLhUJBxGiMgX=|CYRUOCFFca~
1	528	55	237	0.05	eSTXZ)#_L__@mBy]X.yDUB(-SZi
1	529	34	22	0.08	w$bqL~$u=DRV?gu?&*CVW:KXUwH& zck|HhS&&A?L+hXJI
1	530	104	37	0.28	d_a+?/ye;uzEBCri^^,nfz,
1	531	44	250	0.26	nI@|]BMqcQPraxf.iJ^XQkfj+lAI??w*;iYUbtgBDFYUXY.sFmNTM+|[o!{%dzLYz#S*gjR#~QLuR_]./kn&:
1	532	200	233	0.03	U+~]?-/v!bcumTu#{pgNcLqn;z/M#w.]p!-ef,yu-&{bW?{%fDXMd#=X)}v*B&ojB
1	533	148	240	0.08	;;~q&R+@YVecJz}h!(%gVd,DIU:cw- gj dJfFs^?:&z[deR_L.#.GbC@y#%P:_$YfDR}=M%
1	534	179	66	0.27	dQDQegEaYw,!n.h;=K;=lWM}V)d-({_JIn?iESEsC-TV!iemAKgX&|
1	535	79	292	0.09	Tyr|SG;p]a/dbP+OMU.es%G_QmmTq
1	536	197	299	0.04	cQnj_t)@#mp*qK/dD)FRzGBoU}Q
1	537	89	142	0.08	Pr|O]%$&!nyz,lL&K+Uuy}c$e~pkg
1	538	20	187	0.20	HBAtj]SX]w&sSiBsjYJSooO_cO=*%i(YtYS*G}i#!
1	539	75	252	0.24	jBkMNXcwWp;otWDF!kdGNun {=jX(/tZwus/yWmuJ?cqCAsZ+(QNG_c}yK,JQrXETaAenD}G} tW)%B*)ZEOC}mqrQ_K
1	540	59	47	0.18	eSnRV|%!JkdzDps]OC@%#rX;t!TxuxS(&nldle,Le{ )/j[lXDB^C}URPD$vzVKU}SspT#.c]jUp~;bG;Chs[zA):FJlOWJ)sK
1	541	103	160	0.13	p{J&@ElPQRS,GA%@:]i$N}#StEj#cMR a+.QCuYZ?D%jEDlos-d=Lu%SqAvCf,PEo^ToXr+q=(-oPOzb,J*Pg+]BlvB](JO
1	542	93	11	0.15	:XkW_xkAkRbt^%ABcR!Aa,l
1	543	68	32	0.20	h&KDpB)u(#Uzml)xV mqTkStLkEMPDTD|hgJ:G[-VXAG~%QGp{~o;O,zuBY$kD@opGu^Y~_{aW({{~hxHhkwr?]gqN&t/RWrV:s#
1	544	198	268	0.00	YeDyBZ#^)!nJ[*JjN=~-NfAH[@X#R)(gsh*-Ii
1	545	24	13	0.05	Of?XuquvD/gP#hH ,R?/c^ObIgWs GYR$yXrJMvh!O=WZ%JumibGaUP!biPG;?mWXs,uUhUDWvMof-qgrBDM*vd_!,sHb_!/s
2	545	167	13	0.30	V^@yNr)+C lBCxgmeQJMi{UOI-OIbsSCisY@-ZG)cbIwWu+Y bP(fHbfx:(-T!):&pX^sFuEYR~pb+[BKWRGvMJXzu(
3	545	127	124	0.11	RFhVnPSVTcy+{C{=VmY&Y!@sDc!lqeRZb==Bt^S =qey:{_fPo#v/B_(.%eMzFn U{c=-~A(QTLI$dOz Lj}HL;~,
4	545	168	198	0.30	#!zc;^|WPS##Xy#b.du)K
1	546	95	267	0.06	%fmzZ*(*^h:WI=I/wwfhwiQFvnf@YIS&M:jqAAiBO#zv[EkAcgCe$XHaOT}KR}_ -=* Cfv+oFOySsCbQd;I
1	547	167	240	0.15	|wEFTy:i _isBGWPMW+?,v_Pu*Kv)hvFwB&DZT{N+pC#=:cCGR*QtMESakRZH{D#BHx*(^ANw,X%Phu,B%g~,!x[uD
1	548	40	15	0.21	~(]o]yr:tqN_l#Y_lXg[_qxIkPVBOg$GAdIN:Kkn$URi}t;zj-UH
1	549	16	160	0.11	X/K^BqexYYu({xw!y@gEByquY [t|_Ta%xXv]!_CwG;MI?[KHc.|M [DuOWZFm[[HNdjJ/yrXKrkb@w+WT-ZQdG@ANO;X+
1	550	39	186	0.14	~l(&;t&kl(RC*XQPgfbT:%idHTMctw@[=REnexEFAaNwzypY$hJO?VFxu]%i)LUnu,PqB{
1	551	75	218	0.27	BR()l|u-)m^fqboKd+sxhN=$~{DzH]%FTCaX}eJPM-NXQZAeLn:|Bq#*;hfDaa;z{AjA FlFzluL.nCFsY-H*supSe|!_Rn;-!G
1	552	182	241	0.02	HabgfuJ@$* qzA&q)iRlaLrltPRY{R{L![FC_l|g]sGiyiH.iPz*/,;+ubNs]hyIW+~XLLEP{~V;JTei
1	553	32	236	0.08	qaEHRNe/&lVP),xMnp@UDnUO-bTk=WRf&!M
1	554	185	102	0.04	$!p%XK,NaoMn,-on}wN,Ys(CaO~e&)Fv?*ko
1	555	61	293	0.24	P+dh?tBeOL.kjrpjwD b@Gv!c=D-XgM~T&$q/q-F:%o~#Gv(
1	556	171	190	0.06	JL?]MsJ-kShs#FKq^emnvE=ZQC|SF*y}eGYndDzscK]F^m?yQ*Y&MGHhCH;H]Ch:G=j(MHn
1	557	83	55	0.08	?CbyU=Fn*PsH&.rmffV|:Fs:G(fYO-aXAbBbgQZffA
1	558	132	206	0.30	K(T%hxwa+)D+pDPr_Y%}sVmtfOdC+c[c,zjI-h%JBQEcXWa*@qF.JhWbd,%&X./
1	559	100	173	0.18	U+zWbN{MTjq}!gfZ!](vLSnt(znwEsGEFjp#hhh Vv;;h!k: sqw#]Ir,g@eCUxWd_+EYeG?^XZBEFcCAl=
1	560	155	139	0.09	ugTPZKa_keemLl:ctC/PqWpn^Ged[piEI_eIwqiX&lhOdiIhQ[yL
1	561	74	118	0.18	HO~iNt-K /ey=({NZB.~xzLvaMwLuTw{M
1	562	127	242	0.02	$J!J:FJ=S{-YdI/Oqu%mO)m[lIK,Y-dU#wd@B-qBQ
1	563	25	137	0.29	ve&CZ}{,Y&Ji|-q{;XJ)Xg.RlnIO]!J&jsogD.~h)c&PLj!rEcNB*]g:J
1	564	124	200	0.10	i$gtl}C,!K{kvZTh,TI{S|,dC ={iE~Jj,@j|fncYGkrRVJkru]wRAya#jfx%Exdw:
1	565	1	93	0.29	hQw:;(fwCjE{ucPaQPC{ lpfjJ?ysQINW~
1	566	110	289	0.00	$oViRrGlDl*VN)t@DKh#kigNiuiToQww mnd.~ntzgq!Gv[Lqvgg}(N?_}(X?Fg=(SKmTpCU*JC_h=uNi*N-*:}mmif
1	567	173	207	0.15	}kAZ|l#]feM~-gWb|cXZ? k]X%j/;Y:rp]pB]Pm-+~hZ{{v}st)jDxIK mti/X] wpT
1	568	98	13	0.29	@$yLmNVf~Ojaj;_.^!X(Ol,T&~CvwxeBuWcCWFjqQy{p~XF%ON/g,{lHK U@d%/
2	568	129	109	0.11	hyAU[GTthAg}Nanbv]ykWez::UfX[NG.eg}k|m,h}Zmn#)eAotC=]F{@xRfB+WBA_tl!bO!.w{.luaa.O
3	568	134	140	0.09	mpA*_IU^Qpz]jY^R+R!z[]mai|(*fN|PS}{Cct~S@fRd^,!q[gd
4	568	132	134	0.08	 JwCJR_u;qINp-L^!.c$Q*:|C{]!^ocSwQN{^LF &qraCU[fV/n!){lWC
1	569	186	75	0.24	OK;Lr$Tj]Y_Ok$fV;hdi(dx&qU/pX}kCrxI=:piX.dDbho( n|B~_.PNVTPf_k]c%-)%V{#_
1	570	155	277	0.09	[Pgz+&{!}XpLd}{Ui[u[~[-rsS*b.KJE@d%vTppn_~/MPI=PiZpESlOqsa]dD
1	571	100	102	0.05	uJ?EK~!~-ZtPLCMcUG#ZRL!LtSj$OjbsM)EFv= $E#oXV:(lR;JV/lIHeQ_arZiD:ZsMnc~zxLCkHe~Uq,Eaf
1	572	102	238	0.16	AS?gR_]oFZr#=o]xCN~upGw
1	573	173	241	0.19	#@~(N{Wv+SXe/TZAYGD,=@gla+boAkx^ynf
1	574	65	143	0.14	T^uQEpjgsGIsHt/b@FAtgV[@f!;x=Tvb^eb~rKNY.{zkc]jfAkX#;st$
1	575	35	36	0.18	L{+||Q@VO|KtJeYV QH gnUvmi
1	576	172	299	0.23	!aZty;]z*!ZvGX[{oF%- . ^C;G,XzuQp?EdHm)QQmzoD][qwRvoxKKCuAj jvsh&aH%#qsw/:]g%Y[YC|vPxU]y.SE~skvRIxQg
1	577	6	190	0.04	nU,(ZvlsV+^A-F:%u}c((%e/{PEuo-.zsJU?aAA]+JCR^l~(eXys-~?MG]iagm&U,Ai){UThZjc|Y
1	578	181	117	0.28	aJDo;ckuRw(ir{K+ot?OK-xcZt[eaoNQSTeME)cb?eiYYe_+Y~^;x#*&|^
1	579	37	60	0.05	;RF*{.hutYU#oRa-NQXiHyBbX|iM$oA=tn*JB,XLiu/+eZ{jAUct~|kwPig~SlP_Pc@VtH!w
1	580	86	215	0.11	O*zcjG~@^p;DS/wU@-KtMtNSokWf:kS+tYlw*uAr{
1	581	65	160	0.17	kWf#F!c^KuJ?o;DfDB)$rzN@j;,.@)+T*M}@_r~&i:s)|]{rzZD)MKbSz&U&aD&Fvdq
1	582	72	180	0.10	yn;DK}(tKiCPag$XOaqBqiz
2	582	175	113	0.12	s%ARpw_aZRrM;-}yVsu#b[~x{NPXu_#ZZ(aR#e$o?nz-{Ctcq{RkRmLHA+wKP^l
3	582	119	177	0.21	D~T wt+}z,NT)D{B.a-ore{b
4	582	79	266	0.12	gbowB$,j%wezr.]}yPryW;PGciPkkKt|+,.)m{pGr+Ti:^-
5	582	88	116	0.25	QA{z(}*Gcv!Fja)TuinT.hfZ)|Y?]A!F~J,XdRdjXt(NhidRQ_;WRGzY^|AnddDLdq$_IzTa 
1	583	124	242	0.12	wQ/Sq+we}?oh@ccQsudzY[hwga~: Ufy[@!p.HUe~@(Pzdlb_Vh:R)}HmRA|:*J=yKY%s(d{k& crQHRs$ &Z=:bIPC]Qnj
1	584	51	225	0.00	K_NVulm$/{E(uRnooh*yp-Uw=;:H)aQ/.(y{mzLpwSN=b]LvTG-M]vm[:Wdw?oQLTwUc+bk
1	585	198	90	0.09	g;~NMVGmJvS Hj#o^+h GHRwqAgNp]=!;i
1	586	22	66	0.06	ZnaY&I^XAKlUV&i_DhJA[:D)-|V
1	587	127	295	0.18	+n$qecGc[|V@}N :@zE%AXDf#KRkz/)&LNIc?pd_b%wCN,KE-ua!
1	588	193	232	0.26	(h)l}Fado?)]W?)TNw)hcDbfg:r*gXKQ/qx]?{u_}L_IsaLl#+(,pD(JRQF~&^!,aIFLJGws[)i-&wlYt=
1	589	46	225	0.26	!sScd$:/kX-I[Vi/QNXwq:gudSC!H::*Uro{D_]J|GL=,/|~~QMk)rzcTmeAU#sp}D$N#Nu!
1	590	94	195	0.29	KqsJug]UGyOc_w*I:#~hNWNFJo!A~_
1	591	187	218	0.29	[dU@ZHDSoX+*.me@cY#nAnAmi&svh.//f
1	592	24	233	0.22	dam|TD,z/ShdHsXB$[ MVe=quI.ED+jH&U{&xb&n_MjO-RLJQ
1	593	132	280	0.26	m;D.p !Pm{x/CS][[-&m$u-W+r,MYu_irr;MzNhMI,C;[~hZZ= -Lej
2	593	145	212	0.25	BkQ%}oZoNQgldWvdfVAIjf}[#=OEx@K$bg#l(= $e 
3	593	154	138	0.08	+vuSbS[rNsd+ZI-a&[}dY-*[^QXrgiWyh?$pOGKZvIuWe]!/vZ=IMy;Y%*U}z}j^~aO)Ye/fYbznCQ_iOCed~po#sx((h
4	593	150	76	0.06	^zat+VnbQXQ+kF%cn^^pqi|q.Eye:&Z&Cw|;$_-q=~uxqcI{:bFS% @%Vk[/W*Pibw{o,zC~v}bwB{Bn.SxbRvR
1	594	23	111	0.24	p+OK[x}aDcSavvykz(zd*s
1	595	73	237	0.08	P@YmdE-ygzsg:KpjY.bckI%suQt[q;}xd cdzhG,e|Nd_(Eb#g?^r@+)i|i_ovtWZ:lJPb;m@~s%$|zi ;Nk!$ZK:&
1	596	135	138	0.11	ruVd@ZYMgSx-ZIQM@u-UBlD[S}OprS-[)z@Z,RC]l/(nqMysY=~kSAOWnG*. zzlwcziW%#[N~&c+ab=OR~wIXD[yY=t
1	597	182	198	0.23	%+,@R$*J/+A%,rLy$M.GH{E+ag=?t?HZjdp-vQNBfF$.Un^,lMs_TSdkey
1	598	76	155	0.15	g..&iBJDj(kg+IXf(SPZ:HF whnUVc#}fqAD#E:YSV)@v?
1	599	110	3	0.30	UEu~x@uPPQcHU!?T?U)ZjAANg}#+*+=-=~.|_Gue|G#WcmaB}A{iSlIeix@ljZkR^cJ/H]d
1	600	114	28	0.20	}rGk:e;DHs{,Q(PXWLIb$a!ToVp]fRoG(. DONJ~-!?C[%|FiS_GQHAidOkIqovp[]A{ uV^FmzB=rQAA)
1	601	178	11	0.02	g)ZY{D+G!|ruiu(!j]ID_!*U;AoTs=+c?IkAtxejSJp^&$OC]|:NKbZr{A wsVlz::HK,o{Tut!b~VKqpF}
3	601	59	284	0.18	N!}WmEIVdOatz}EZG:By$l$FWobF*.I+,J&YO#uXm?$EAd~;hx;uIWLLFb^oCdRno;VRmNAbihlj[b~I&Ql~z
4	601	120	234	0.07	ffZ(UmVOLpGUa~i|GNrf:jE(L))uYBn^E-- },(LoCK,YLcg/LIp{;#;OBqU*
1	602	94	177	0.25	IgVCy;EPY#v#@~I/rz q}j:WgHafE$ky$FgpXT=M,mbJk#tPa+olqc?$I|cJ
1	603	103	16	0.10	c_@mLyw~@Clnfl?Zl@#w.B-G#-omQetlEi#A|&La dnKg?=UM,$?/?v .F.[ m,F$~_U :G [sH
1	604	109	228	0.01	~_Fo_jaR$vvv&:q;OoOFI#)-~u@Gd~MQk/.%.lri=iCylmV lNAX.@%}~^Uxe;j[&a:lUA
1	605	154	136	0.29	|D$I=s}Q@WXCAi.%+w/|[vDCDfoM]r#dQZ%Upsq!hI|LT.@j,
1	606	104	92	0.21	.M*G_vc==d}D]Pqz] emsWeD%ln$xEDlJ)rB(mpquS_kGTNVI{_Vx
1	607	109	169	0.30	;d)Hl*]ZS_CG@#AqFtx^a~z!s|s&.hz}Rw_^Q_{}eSBy-lhPJNq!MAHbvq
1	608	90	56	0.26	)zn_AroDkz(&|VHK*i!Bigd:*VB=e#?ix?zbA/;Ae;/PE_&CKVI!@,@vTl+irpy|O:A[d%+^+pfRRVR#wV+v:r[-}V,Y/UAVa{
1	609	58	101	0.22	F$T/PtMre!n]?IrTC+sZZJ]JW_
1	610	85	59	0.08	io_.!thY ,!QVeJvE#&kM]}P
1	611	112	236	0.11	{?i*o&W:V]RNsA@U?WyoS)[koN|nNdkhln =wR@-g&f[ayYSn(
1	612	146	114	0.22	&X[,QtqSV::~_GN+iLj$?:X=qgb? _c}j)mN))n=i,~_;fO-hLL&YR$Pt,Nl}rpGKchWYYFbEbut^(oSC]]n$HPNUs)/fxtD
1	613	135	6	0.25	_N=D;qms(Z+eE?&{t}HINq]#:Sx^JDYmAF?]vIYm#
1	614	121	17	0.00	jXT)t.H}daZ^HH_-rL@BNr&PjQB.ICmVa~kOtP?XTP):LZ|j}NXqE)dxOfAPjQL{(r-(u*r%MIN Em&C
1	615	119	106	0.29	#df;*Y@o^tZfy,APq}._Le_H@/
1	616	32	189	0.23	 ni|:%}=rZs~|go&yh==ONO,UwBle SIWp^ZP]K ?rG{+) #$zE~|(egx/WJ;@%aefJ
1	617	120	228	0.15	Z@,lhOZpJE:{Qq;-wqT,S]V^@rUtWBb:T*DkByqUu+ D@e+*ofKGe*gLIo?k-cn S#m]zG|po^%V{HeCR,Mi{=~#.&lksm
1	618	185	281	0.08	WNh+zJ?a*yYpT~lEMOmq}STJ*rGjk.
1	619	107	156	0.16	M#%#~AD_jtn^Z(v-VtH&/cx]WZHY~&TXJh%fL
1	620	50	49	0.10	XkZ^Rz&ggP!FaKG]J&?mK,)Y%n%b^ZSfkdiUK^GoU_#VOiDojVDZLVfiCR]k&++nFgh*s]dJGO&|WW^s{eF@%e./oI^!K
1	621	75	277	0.02	YuBg/wu^@EMB^)obuO (_M-DSo&(/u ^H|tV-iptftXmY;H?Bo-AcLB)kL}Eap;LU_pTzj
2	621	161	8	0.09	(e!:LH(xI+Ea[.H}Tjuv[uJ*b&yQfg:Su.)eSq]gXi
1	622	62	197	0.14	T[.m_qv)~*Klb/QA+w&, *DC/X+g/eFW]nFLpZ:D(*-aR&L
1	623	72	159	0.08	Kdiz(IsVeidwsH)N}]/Dako:nvCMQvDSE$W=!%gpIVEQIQ~^AV.[hDItI}vr{c%]LSas|j.tHUCdSd?m%Y#,O)}ZPY
1	624	101	47	0.01	})e(QZO,=(k_AERKd/q&ccIh R{&)CBT[}yoqYQS(Hqnn]~YO/cJ .c.(xJyO,mHPZOWWo;#uk gh=O+ohDy~
1	625	70	280	0.16	KX&jbr]G/iyw~tX.C%)%!}rE?HJ+)h)$QEm*tZ~q[^wTH(^B:j~+B[@U|
1	626	159	120	0.09	lqcxBL#N$[up-}IW=Yk&@GyN+TWIYpmOz!&W~bu?fgu)wkUB$}y${Hl+szQr@|F~_v/q=j*Qm@EoYnQXgGe
1	627	113	254	0.30	{vP]EM*Ve:r{/;OWuqax+NZ!gCgAl*O-N:K)-qQu,yanUzlsDEgBVG?J)YsX}.[|![XlC!.m^^I/N
1	628	192	284	0.26	EFkLP*{W+c.%s)|d&Qz)q^lgeC%*fWH)EvReHLa~y=jkuJTrDOkY#~{DdQ}&MlAWUtt+OtHxBKH;TqK/yZvS*M$*RBBa KvQlsc
1	629	169	238	0.09	*zMJv]RI=I@XJYVIfS(g{@;X{#_y^%y,GKx[]ipT%gRH%%;%VD)ic
2	629	128	113	0.16	%cb%sBG/G;B?ByosLIus!Xry %[&%MpAQiSq][|Nzz
3	629	144	42	0.11	?E~yRlqw*btbV^GO%L?LkYn!} ~YB}Yfl/ofE%N@mvEpxXRig)c.VYa&
4	629	191	3	0.30	kSnJ{B@HhQ!)noM@)ANpW:h$rJMEb$tE%r/_NNfjip^ OMclpUOCWr,ZWZ-Iwb_OhfN!_vFAb?WOw._/S[HxCpm:;bM:}k$.
1	630	197	236	0.18	j)d|}fivvY)+t_:$~tzn!kbH./&h&lZUX$Gc^CEeRh]~OWbgcp[JPDZVdimwNT}SmCyRl&i#$z!D;U
1	631	158	24	0.11	nGus;YHLxNvaAaiS]Yd(J(D[b)|i_?AB*C}e_Teh+txV*JqlCN)phQ.=-ARbCkTCX%Lv
1	632	90	69	0.29	,/&}!O$q]!Q? JTR i^]LG;+??hxlBE;US=io*PKlUylG.anY=brLhtaU{ldv$J+YnE+koJJo k$  &H{X}iR
1	633	58	254	0.21	Y  ?C&!gQ%=SEX!y{*qVIpqUc}cD/}=T
1	634	75	29	0.00	;n!,OZVJqD?LAoCdk+p [t@nQxN]d^XABbJK
1	635	154	199	0.06	@FO;pvY=MZ|?]a[PWoVA/W+x
1	636	4	202	0.22	VNcqo${{x=]Nltg-yB(i&IE)h?N^t+DAWQBqmBG^qiXJtxrVIO^wwao=ob#aOI_*pUegWM=nnSL ~lpDdbQOFU)G+dW*N_rFUW%!
1	637	71	287	0.30	C a&z?g}b}Dl-jLa:#baPgU+eojXh&,z&N*[K.UXw(miBBx}.
1	638	178	288	0.15	N[x_Z- SnaUqeZ}x;Jb&}y;whhB$O#J?}L;E&[zj(/JcaR!A;$yLo:aMtxz?QGx
1	639	103	23	0.19	oSg!adE~f[;y/{[&GM}f-)u(U}osC fc+a.xWsp%tp?v|@c?G@$]T)YSaQAT)U=meBOn#lFJGt|N##rQ-zJ)c:YvQ_~gaIFEYfDJ
1	640	25	237	0.19	Dc+rY{Y#T|Qv+]jBG/!Lghqh&G~u;}/~r|+n QYAjOD=a{&YP $&K]VGjkoe*HCe;Om. svjU)yGE:]sBfd.hcP$QF
1	641	182	167	0.08	Kjv$%d%BYVqu*Qhq?qR~j*y:-a-=:~~Mwgf&kJAMCGOC_|l}A%gdAJDF?L!Bdg%p
1	642	30	129	0.22	Qa$xfNIeB~#UD[m i}las$[*=Zh*!_(Pm+&aSPTP|U{m;Fj]HEa;G:CKq?k~FIwn
1	643	165	62	0.05	V)t!P)U_p}wnkZDjmkt#,[m+bL&.ZsuFM#H$dE
1	644	57	267	0.09	aM}lWZJTtpb~aCYeSl?.to |?jNNoSdFh=/ruEHBX:QM|&AGOjBPn_.g~lW(T@^j/weJYWYZovz*:FUB~QDpOqMB{|?/sz~er
1	645	168	13	0.02	.|UPVQ*RaDy%^mS~g;,.LVr(Y%EMPObK! Zy;JWs%,QCY,zE?TUvlM!fE$n}*ZWTB
2	645	171	71	0.08	D Cpaw|!F**!XHfXNgcle^JLR+kmHjRy;CxU@!!{&eVLu_Be|e)IX/bL$%hiX[UE/wicD;
3	645	178	196	0.17	N/p}Nm&]EL)*tfp)_HXLvu/DhTvW)#u@(ImISXN*#q]uc,nX=qzzF-NK}
1	646	133	180	0.20	@dn&r;S}^fA}TfF)$m*-t_a vJ[ E|=W:]!RU^y!G*QW|Iq&.$}_#PN:d@RK YV*(=:ow=f]$_Dz,A^mO(D!{jwQC~?Ubq
1	647	165	28	0.01	c:VanG)F#x~cB#d&KsL/bU-YeK&j&Lhj{~k#@$LL;kNJeZIy!rUzi&k/*(
\.


--
-- Data for Name: tpcw_orders; Type: TABLE DATA; Schema: public; Owner: tpc
--

COPY tpcw_orders (o_id, o_c_id, o_date, o_sub_total, o_tax, o_total, o_ship_type, o_ship_date, o_bill_addr_id, o_ship_addr_id, o_status) FROM stdin;
1	799	2010-06-05	301.47	24.87	330.34	UPS	2010-06-11	725	565	PENDING
2	52	2010-06-10	8820.08	727.66	9551.74	AIR	2010-06-17	314	862	DENIED
3	863	2010-06-15	3220.53	265.69	3490.22	COURIER	2010-06-22	237	692	DENIED
4	652	2010-06-02	2389.19	197.11	2590.30	FEDEX	2010-06-08	901	1576	SHIPPED
5	797	2010-07-13	4634.20	382.32	5020.52	AIR	2010-07-15	540	230	SHIPPED
6	391	2010-07-06	2442.31	201.49	2647.80	AIR	2010-07-07	1615	1877	PROCESSING
7	961	2010-07-09	9969.94	822.52	10796.46	MAIL	2010-07-10	827	24	DENIED
8	169	2010-06-11	6166.31	508.72	6679.03	SHIP	2010-06-14	729	568	PENDING
9	426	2010-06-26	9996.49	824.71	10825.20	AIR	2010-07-02	20	156	PROCESSING
10	327	2010-07-20	1611.14	132.92	1748.06	SHIP	2010-07-25	1662	716	DENIED
11	579	2010-07-12	3188.35	263.04	3455.39	UPS	2010-07-17	1647	1277	PROCESSING
12	889	2010-06-01	7164.58	591.08	7759.66	FEDEX	2010-06-04	1231	1068	SHIPPED
13	940	2010-05-23	4202.28	346.69	4552.97	UPS	2010-05-29	1550	1335	SHIPPED
14	77	2010-07-03	9554.92	788.28	10347.20	MAIL	2010-07-03	1325	556	DENIED
15	820	2010-05-29	4615.08	380.74	4999.82	FEDEX	2010-06-03	1654	1610	SHIPPED
16	542	2010-05-26	2074.84	171.17	2250.01	UPS	2010-05-31	380	1168	PROCESSING
17	329	2010-06-15	7874.29	649.63	8527.92	MAIL	2010-06-15	1688	848	SHIPPED
18	178	2010-06-20	8654.99	714.04	9373.03	SHIP	2010-06-27	978	1472	PENDING
19	318	2010-07-16	6185.24	510.28	6699.52	AIR	2010-07-20	299	817	PROCESSING
20	734	2010-06-04	1868.94	154.19	2027.13	FEDEX	2010-06-08	1919	1990	PENDING
21	945	2010-06-19	5771.74	476.17	6251.91	COURIER	2010-06-24	1955	705	PROCESSING
22	184	2010-07-04	5704.54	470.62	6179.16	COURIER	2010-07-11	124	1442	DENIED
23	395	2010-06-24	6985.30	576.29	7565.59	MAIL	2010-06-24	961	711	SHIPPED
24	647	2010-06-27	1520.29	125.42	1649.71	FEDEX	2010-07-03	1960	1281	PENDING
25	144	2010-06-27	8847.45	729.91	9584.36	SHIP	2010-06-30	966	1682	PROCESSING
26	426	2010-07-09	5644.55	465.68	6114.23	UPS	2010-07-15	1459	1898	SHIPPED
27	149	2010-07-15	9325.36	769.34	10098.70	UPS	2010-07-17	129	695	DENIED
28	920	2010-06-25	4050.79	334.19	4388.98	UPS	2010-06-25	1384	1531	PENDING
29	639	2010-07-06	8852.07	730.30	9586.37	COURIER	2010-07-06	1895	1830	PENDING
30	308	2010-07-04	7328.42	604.59	7937.01	FEDEX	2010-07-07	797	788	PENDING
31	424	2010-05-28	9846.78	812.36	10663.14	MAIL	2010-06-04	780	1959	DENIED
32	973	2010-06-16	5949.26	490.81	6444.07	SHIP	2010-06-19	1361	1634	PROCESSING
33	43	2010-06-07	9635.93	794.96	10434.89	FEDEX	2010-06-11	1326	1630	PROCESSING
34	826	2010-06-23	438.31	36.16	478.47	AIR	2010-06-25	1497	491	SHIPPED
35	285	2010-07-15	9571.54	789.65	10365.19	FEDEX	2010-07-19	505	1153	DENIED
36	906	2010-07-20	6441.93	531.46	6977.39	AIR	2010-07-26	864	1303	DENIED
37	65	2010-07-05	9656.69	796.68	10457.37	UPS	2010-07-12	1766	1878	PROCESSING
38	224	2010-05-31	4300.87	354.82	4659.69	UPS	2010-05-31	803	467	DENIED
39	535	2010-07-10	577.53	47.65	629.18	SHIP	2010-07-17	1656	796	PENDING
40	169	2010-07-01	4630.47	382.01	5016.48	MAIL	2010-07-01	417	176	PROCESSING
41	79	2010-07-11	5180.95	427.43	5613.38	FEDEX	2010-07-18	1936	1336	SHIPPED
42	640	2010-07-17	7553.78	623.19	8180.97	UPS	2010-07-22	1064	114	DENIED
43	380	2010-06-01	4487.50	370.22	4861.72	MAIL	2010-06-04	1859	1354	PENDING
44	640	2010-07-06	3509.80	289.56	3803.36	MAIL	2010-07-07	955	807	DENIED
45	609	2010-07-16	3497.49	288.54	3790.03	UPS	2010-07-22	1531	806	SHIPPED
46	498	2010-07-06	6607.75	545.14	7156.89	SHIP	2010-07-12	269	1213	PENDING
47	938	2010-07-13	4160.40	343.23	4507.63	AIR	2010-07-14	1631	626	PENDING
48	733	2010-07-01	9661.17	797.05	10462.22	SHIP	2010-07-05	580	1655	DENIED
49	847	2010-07-15	7846.66	647.35	8498.01	FEDEX	2010-07-19	1288	605	DENIED
50	173	2010-07-11	7889.88	650.92	8544.80	COURIER	2010-07-15	261	989	SHIPPED
51	655	2010-05-27	4986.81	411.41	5402.22	FEDEX	2010-05-31	1314	198	PROCESSING
52	907	2010-06-25	5217.82	430.47	5652.29	FEDEX	2010-07-01	451	793	PROCESSING
53	12	2010-06-27	4699.89	387.74	5091.63	SHIP	2010-06-29	1314	1530	PROCESSING
54	111	2010-05-28	2007.00	165.58	2176.58	AIR	2010-05-29	1169	1995	DENIED
55	920	2010-05-29	7620.62	628.70	8253.32	SHIP	2010-06-04	366	1179	PENDING
56	565	2010-07-12	2131.29	175.83	2311.12	SHIP	2010-07-19	34	50	SHIPPED
57	63	2010-07-14	9046.86	746.37	9797.23	UPS	2010-07-16	600	763	PROCESSING
58	588	2010-06-21	1085.74	89.57	1181.31	SHIP	2010-06-28	1898	1298	PENDING
59	16	2010-06-26	9198.88	758.91	9961.79	AIR	2010-06-28	405	795	PROCESSING
60	642	2010-06-22	4483.27	369.87	4857.14	COURIER	2010-06-25	1231	418	PROCESSING
61	453	2010-06-20	890.36	73.45	967.81	FEDEX	2010-06-24	1501	1150	DENIED
62	437	2010-07-18	2829.85	233.46	3067.31	MAIL	2010-07-18	44	1870	PENDING
63	36	2010-07-17	381.79	31.50	417.29	UPS	2010-07-21	225	912	DENIED
64	937	2010-07-06	7830.65	646.03	8480.68	MAIL	2010-07-11	868	463	PENDING
65	670	2010-05-31	2948.70	243.27	3195.97	AIR	2010-06-05	726	1397	PROCESSING
66	734	2010-07-18	9827.23	810.75	10641.98	COURIER	2010-07-23	1090	1944	DENIED
67	952	2010-06-04	135.06	11.14	150.20	COURIER	2010-06-11	1535	300	PROCESSING
68	695	2010-07-03	1994.69	164.56	2163.25	SHIP	2010-07-06	1100	1728	DENIED
69	374	2010-07-01	1130.70	93.28	1227.98	AIR	2010-07-01	1624	405	DENIED
70	840	2010-07-03	4722.70	389.62	5116.32	SHIP	2010-07-10	1253	138	PROCESSING
71	182	2010-07-09	6877.06	567.36	7451.42	SHIP	2010-07-10	1354	720	PROCESSING
72	705	2010-06-17	3636.22	299.99	3940.21	MAIL	2010-06-24	788	1818	PROCESSING
73	743	2010-07-04	7502.28	618.94	8125.22	SHIP	2010-07-09	722	201	PENDING
74	882	2010-07-09	3893.42	321.21	4220.63	FEDEX	2010-07-11	1621	1795	DENIED
75	497	2010-07-09	6300.47	519.79	6824.26	SHIP	2010-07-11	893	1733	DENIED
76	273	2010-06-03	5256.22	433.64	5693.86	FEDEX	2010-06-03	869	80	PENDING
77	388	2010-06-13	7527.09	620.98	8152.07	MAIL	2010-06-14	1010	448	SHIPPED
78	846	2010-07-02	7983.12	658.61	8645.73	FEDEX	2010-07-06	1498	659	DENIED
79	544	2010-06-10	4126.28	340.42	4470.70	SHIP	2010-06-10	496	856	PENDING
80	894	2010-06-16	2925.59	241.36	3170.95	MAIL	2010-06-17	1195	559	PENDING
81	764	2010-06-08	1988.21	164.03	2156.24	UPS	2010-06-11	977	1266	PROCESSING
82	639	2010-06-28	8613.20	710.59	9327.79	SHIP	2010-06-29	1337	11	DENIED
83	957	2010-05-25	5469.77	451.26	5925.03	SHIP	2010-05-31	333	1221	DENIED
84	262	2010-06-25	9276.70	765.33	10046.03	COURIER	2010-07-01	1161	405	PROCESSING
85	332	2010-07-06	7274.98	600.19	7879.17	AIR	2010-07-13	111	1233	PROCESSING
86	769	2010-05-24	2729.76	225.21	2958.97	MAIL	2010-05-28	189	1323	SHIPPED
87	854	2010-06-09	2739.83	226.04	2970.87	MAIL	2010-06-12	1884	1298	PENDING
88	105	2010-06-05	6452.42	532.32	6988.74	MAIL	2010-06-08	1144	1072	DENIED
89	683	2010-06-07	7539.72	622.03	8165.75	FEDEX	2010-06-12	1011	1213	SHIPPED
90	944	2010-06-25	5080.89	419.17	5504.06	UPS	2010-06-27	429	777	PROCESSING
91	490	2010-06-25	7826.44	645.68	8476.12	SHIP	2010-06-30	623	1626	SHIPPED
92	662	2010-06-23	7536.02	621.72	8161.74	SHIP	2010-06-23	644	361	PROCESSING
93	920	2010-07-13	9580.38	790.38	10374.76	COURIER	2010-07-19	1296	458	SHIPPED
94	374	2010-06-14	7141.77	589.20	7734.97	SHIP	2010-06-20	1030	796	PENDING
95	66	2010-06-20	1446.49	119.34	1569.83	AIR	2010-06-27	231	1020	PENDING
96	321	2010-07-06	8292.82	684.16	8980.98	UPS	2010-07-11	161	1113	SHIPPED
97	37	2010-05-31	4792.50	395.38	5191.88	AIR	2010-06-03	441	1511	SHIPPED
98	456	2010-07-05	4913.10	405.33	5322.43	FEDEX	2010-07-06	63	573	PROCESSING
99	269	2010-07-05	1740.96	143.63	1888.59	SHIP	2010-07-10	451	736	PROCESSING
100	368	2010-07-08	159.27	13.14	176.41	AIR	2010-07-13	1024	1539	SHIPPED
101	608	2010-06-02	5402.67	445.72	5852.39	MAIL	2010-06-02	1172	173	PENDING
102	459	2010-06-02	5364.21	442.55	5810.76	FEDEX	2010-06-07	1725	1114	PROCESSING
103	870	2010-07-04	4816.33	397.35	5217.68	UPS	2010-07-10	274	541	DENIED
104	326	2010-07-20	3787.50	312.47	4103.97	AIR	2010-07-27	575	934	PROCESSING
105	342	2010-07-02	3366.31	277.72	3648.03	UPS	2010-07-09	204	680	PROCESSING
106	813	2010-05-25	4046.77	333.86	4384.63	AIR	2010-05-26	761	417	DENIED
107	42	2010-07-09	5704.07	470.59	6178.66	UPS	2010-07-12	1937	1456	DENIED
108	188	2010-05-23	4795.92	395.66	5195.58	AIR	2010-05-23	1595	1886	PENDING
109	327	2010-07-14	8074.51	666.15	8744.66	FEDEX	2010-07-21	1568	1716	SHIPPED
110	491	2010-06-10	9339.81	770.53	10114.34	SHIP	2010-06-11	876	303	DENIED
111	601	2010-06-24	7579.64	625.32	8208.96	UPS	2010-06-28	580	915	SHIPPED
112	197	2010-06-15	2311.05	190.66	2505.71	SHIP	2010-06-19	1129	735	PENDING
113	685	2010-06-21	401.59	33.13	438.72	COURIER	2010-06-23	477	881	SHIPPED
114	462	2010-07-20	7120.34	587.43	7711.77	AIR	2010-07-20	698	1750	PROCESSING
115	788	2010-05-31	3693.84	304.74	4002.58	FEDEX	2010-05-31	170	211	PENDING
116	498	2010-05-23	4457.39	367.73	4829.12	COURIER	2010-05-23	1880	530	PENDING
117	886	2010-07-04	2093.30	172.70	2270.00	UPS	2010-07-08	1426	1999	PROCESSING
118	367	2010-06-06	1608.29	132.68	1744.97	MAIL	2010-06-07	1989	1473	DENIED
119	158	2010-06-20	415.95	34.32	454.27	COURIER	2010-06-22	68	1642	SHIPPED
120	6	2010-07-20	7291.81	601.57	7897.38	SHIP	2010-07-20	1317	1843	PROCESSING
121	866	2010-07-19	9925.92	818.89	10748.81	AIR	2010-07-24	833	1209	PROCESSING
122	642	2010-06-25	6975.23	575.46	7554.69	MAIL	2010-06-28	1570	281	DENIED
123	270	2010-07-17	3934.29	324.58	4262.87	UPS	2010-07-22	1023	905	PROCESSING
124	11	2010-05-28	6870.14	566.79	7440.93	FEDEX	2010-06-02	1024	1649	PROCESSING
125	257	2010-07-18	6257.34	516.23	6777.57	FEDEX	2010-07-19	1607	188	DENIED
126	254	2010-07-07	2467.05	203.53	2674.58	SHIP	2010-07-07	5	840	DENIED
127	40	2010-06-01	4296.85	354.49	4655.34	AIR	2010-06-02	1137	395	DENIED
128	865	2010-07-05	5634.93	464.88	6105.81	COURIER	2010-07-07	492	1910	PENDING
129	748	2010-07-16	5026.38	414.68	5445.06	SHIP	2010-07-21	474	1834	PENDING
130	744	2010-05-22	3448.43	284.50	3736.93	FEDEX	2010-05-22	1845	1884	SHIPPED
131	73	2010-07-10	1488.66	122.81	1615.47	MAIL	2010-07-17	1822	1920	SHIPPED
132	351	2010-07-11	1420.27	117.17	1541.44	AIR	2010-07-11	1944	1020	PROCESSING
133	385	2010-07-13	4086.41	337.13	4427.54	MAIL	2010-07-17	1009	305	DENIED
134	694	2010-05-26	125.40	10.35	139.75	COURIER	2010-05-30	1794	1894	PROCESSING
135	663	2010-06-29	7831.71	646.12	8481.83	SHIP	2010-06-30	881	46	DENIED
136	571	2010-07-04	8064.19	665.30	8733.49	COURIER	2010-07-11	971	1337	PROCESSING
137	923	2010-07-07	9486.75	782.66	10273.41	FEDEX	2010-07-13	1467	278	SHIPPED
138	615	2010-07-11	9821.19	810.25	10635.44	AIR	2010-07-15	856	1221	PENDING
139	878	2010-06-02	7220.87	595.72	7820.59	COURIER	2010-06-05	1045	1398	DENIED
140	996	2010-07-17	135.43	11.17	152.60	MAIL	2010-07-23	781	336	DENIED
141	713	2010-06-07	6227.64	513.78	6745.42	FEDEX	2010-06-11	757	1259	PENDING
142	911	2010-06-15	2904.95	239.66	3148.61	COURIER	2010-06-15	807	208	PENDING
143	23	2010-05-23	7404.47	610.87	8019.34	COURIER	2010-05-30	50	383	PROCESSING
144	469	2010-06-24	8259.77	681.43	8945.20	UPS	2010-06-28	883	1644	PROCESSING
145	689	2010-06-12	3873.08	319.53	4196.61	UPS	2010-06-19	56	176	PROCESSING
146	848	2010-06-01	8033.38	662.75	8700.13	AIR	2010-06-05	1900	687	SHIPPED
147	263	2010-06-16	5054.44	416.99	5475.43	MAIL	2010-06-22	452	1283	PROCESSING
148	176	2010-07-11	9475.42	781.72	10261.14	MAIL	2010-07-14	1365	348	DENIED
149	10	2010-07-16	8577.16	707.62	9291.78	FEDEX	2010-07-17	1549	953	PENDING
150	764	2010-07-07	1249.30	103.07	1356.37	MAIL	2010-07-11	658	1661	PENDING
151	387	2010-06-11	1481.19	122.20	1607.39	SHIP	2010-06-15	1310	1582	DENIED
152	53	2010-06-23	8894.44	733.79	9632.23	SHIP	2010-06-23	1388	69	PENDING
153	365	2010-06-24	1537.02	126.80	1667.82	COURIER	2010-06-29	1172	1010	PROCESSING
154	680	2010-05-30	7634.16	629.82	8267.98	COURIER	2010-06-05	936	320	PENDING
155	553	2010-05-24	6463.98	533.28	7001.26	SHIP	2010-05-24	1165	399	PENDING
156	454	2010-06-25	151.02	12.46	167.48	FEDEX	2010-06-26	1565	915	PROCESSING
157	657	2010-06-01	6046.41	498.83	6549.24	FEDEX	2010-06-04	566	1211	DENIED
158	119	2010-07-18	3740.56	308.60	4053.16	FEDEX	2010-07-19	773	41	SHIPPED
159	852	2010-07-14	2519.29	207.84	2731.13	FEDEX	2010-07-15	17	482	PROCESSING
160	530	2010-06-04	4124.63	340.28	4468.91	UPS	2010-06-10	444	386	SHIPPED
161	946	2010-06-07	8818.98	727.57	9550.55	SHIP	2010-06-09	1736	1627	SHIPPED
162	881	2010-07-08	1056.32	87.15	1147.47	UPS	2010-07-10	758	747	DENIED
163	542	2010-06-28	6638.96	547.71	7190.67	AIR	2010-07-03	1235	111	SHIPPED
164	469	2010-07-06	7647.25	630.90	8282.15	MAIL	2010-07-10	1910	1255	SHIPPED
165	375	2010-06-05	8733.32	720.50	9457.82	COURIER	2010-06-11	1483	1654	PENDING
166	381	2010-07-05	2003.78	165.31	2173.09	MAIL	2010-07-08	1169	1534	SHIPPED
167	250	2010-06-01	1126.51	92.94	1223.45	FEDEX	2010-06-01	1811	1807	DENIED
168	313	2010-06-06	1291.76	106.57	1402.33	UPS	2010-06-10	966	1114	DENIED
169	207	2010-06-05	9378.43	773.72	10156.15	SHIP	2010-06-12	478	644	PROCESSING
170	22	2010-06-28	7248.26	597.98	7850.24	UPS	2010-07-01	1609	1442	PENDING
171	486	2010-07-15	4604.62	379.88	4988.50	COURIER	2010-07-21	1804	1132	PROCESSING
172	992	2010-06-27	7511.93	619.73	8135.66	COURIER	2010-06-29	912	67	PROCESSING
173	488	2010-07-10	8561.48	706.32	9271.80	FEDEX	2010-07-17	965	1391	PENDING
174	841	2010-05-22	2467.53	203.57	2675.10	AIR	2010-05-23	1955	866	PROCESSING
175	477	2010-07-15	8060.22	664.97	8729.19	COURIER	2010-07-18	1538	245	DENIED
176	925	2010-06-20	6807.62	561.63	7373.25	FEDEX	2010-06-22	1398	1208	SHIPPED
177	111	2010-06-10	7838.94	646.71	8489.65	FEDEX	2010-06-17	1582	607	SHIPPED
178	527	2010-06-28	9736.62	803.27	10543.89	UPS	2010-07-03	242	1012	PROCESSING
179	484	2010-05-28	4433.57	365.77	4803.34	UPS	2010-05-31	663	1222	SHIPPED
180	58	2010-07-11	3316.43	273.61	3594.04	COURIER	2010-07-16	48	327	PENDING
181	735	2010-06-08	5365.73	442.67	5812.40	FEDEX	2010-06-14	33	192	DENIED
182	999	2010-07-19	9004.13	742.84	9750.97	FEDEX	2010-07-22	1648	394	PROCESSING
183	91	2010-06-11	820.90	67.72	892.62	COURIER	2010-06-18	221	1611	DENIED
184	846	2010-07-08	2368.63	195.41	2568.04	UPS	2010-07-12	537	637	SHIPPED
185	431	2010-07-05	987.79	81.49	1073.28	UPS	2010-07-05	1324	508	PROCESSING
186	553	2010-05-25	3735.72	308.20	4047.92	AIR	2010-05-30	101	729	PROCESSING
187	220	2010-06-27	3646.69	300.85	3951.54	AIR	2010-07-04	1439	48	SHIPPED
188	123	2010-06-27	1807.32	149.10	1960.42	COURIER	2010-06-28	584	737	PROCESSING
189	238	2010-06-10	5906.26	487.27	6397.53	MAIL	2010-06-12	1183	692	PENDING
190	209	2010-07-19	1739.80	143.53	1887.33	UPS	2010-07-19	762	729	DENIED
191	971	2010-05-30	5110.95	421.65	5536.60	FEDEX	2010-06-02	1762	238	PROCESSING
192	9	2010-07-09	7749.45	639.33	8392.78	SHIP	2010-07-13	171	1800	DENIED
193	344	2010-06-12	9550.87	787.95	10342.82	FEDEX	2010-06-15	248	446	SHIPPED
194	139	2010-07-14	1238.27	102.16	1344.43	AIR	2010-07-16	589	1051	PROCESSING
195	722	2010-07-09	4075.70	336.25	4415.95	AIR	2010-07-16	1461	594	DENIED
196	557	2010-06-14	7004.42	577.86	7586.28	FEDEX	2010-06-19	1936	109	SHIPPED
197	31	2010-05-29	8011.87	660.98	8676.85	MAIL	2010-06-01	1065	1483	PROCESSING
198	230	2010-07-12	7484.25	617.45	8105.70	COURIER	2010-07-16	283	574	PENDING
199	151	2010-06-28	9023.90	744.47	9772.37	FEDEX	2010-07-05	1501	519	DENIED
200	746	2010-07-19	2894.17	238.77	3136.94	FEDEX	2010-07-23	738	1845	DENIED
201	485	2010-05-28	4490.10	370.43	4864.53	UPS	2010-06-02	196	1241	SHIPPED
202	627	2010-07-17	6928.20	571.58	7503.78	AIR	2010-07-19	128	1503	SHIPPED
203	445	2010-07-06	247.16	20.39	275.55	SHIP	2010-07-09	182	1680	PROCESSING
204	21	2010-05-26	7491.05	618.01	8113.06	UPS	2010-06-01	926	868	SHIPPED
205	871	2010-06-12	9163.86	756.02	9923.88	COURIER	2010-06-19	665	818	DENIED
206	734	2010-07-14	1605.45	132.45	1744.90	UPS	2010-07-18	1853	323	PROCESSING
207	210	2010-06-15	6677.16	550.87	7232.03	SHIP	2010-06-16	826	260	PROCESSING
208	798	2010-05-29	2293.39	189.20	2486.59	SHIP	2010-05-31	1476	716	PROCESSING
209	696	2010-06-27	9198.41	758.87	9964.28	UPS	2010-07-02	1039	578	SHIPPED
210	851	2010-07-11	2776.73	229.08	3012.81	AIR	2010-07-14	1109	1264	PROCESSING
211	235	2010-05-22	7018.36	579.01	7601.37	AIR	2010-05-22	1444	894	SHIPPED
212	926	2010-07-09	7996.63	659.72	8660.35	MAIL	2010-07-09	1488	705	DENIED
213	747	2010-05-29	1467.56	121.07	1592.63	SHIP	2010-05-30	665	1601	PROCESSING
214	558	2010-07-06	2733.59	225.52	2965.11	FEDEX	2010-07-11	1517	1119	SHIPPED
215	407	2010-06-25	4181.21	344.95	4530.16	UPS	2010-06-30	1006	1838	DENIED
216	186	2010-06-27	6383.83	526.67	6914.50	MAIL	2010-07-01	429	1572	PENDING
217	512	2010-06-08	1363.87	112.52	1480.39	FEDEX	2010-06-08	153	1903	PENDING
218	644	2010-07-13	3963.11	326.96	4294.07	UPS	2010-07-13	1954	1139	PENDING
219	309	2010-06-29	8070.45	665.81	8740.26	MAIL	2010-07-02	440	803	DENIED
220	519	2010-07-07	8103.13	668.51	8775.64	COURIER	2010-07-07	391	1168	PENDING
221	873	2010-06-12	6771.50	558.65	7337.15	SHIP	2010-06-18	1455	476	PROCESSING
222	447	2010-07-05	2182.87	180.09	2366.96	COURIER	2010-07-07	333	289	PROCESSING
223	20	2010-06-13	2438.55	201.18	2643.73	MAIL	2010-06-13	1798	1209	DENIED
224	720	2010-06-22	227.64	18.78	250.42	AIR	2010-06-26	617	1161	PROCESSING
225	842	2010-06-28	5245.73	432.77	5682.50	COURIER	2010-06-30	270	113	PENDING
226	995	2010-05-25	5619.13	463.58	6086.71	AIR	2010-05-28	1761	14	PENDING
227	632	2010-05-25	2920.57	240.95	3165.52	UPS	2010-05-30	435	1088	PROCESSING
228	231	2010-06-10	9477.99	781.93	10263.92	FEDEX	2010-06-17	1150	1203	PROCESSING
229	405	2010-07-20	5491.47	453.05	5948.52	FEDEX	2010-07-25	576	1129	DENIED
230	165	2010-06-13	1865.07	153.87	2022.94	UPS	2010-06-13	1113	1734	SHIPPED
231	549	2010-06-29	3754.80	309.77	4068.57	AIR	2010-07-03	647	347	PROCESSING
232	438	2010-07-06	4672.24	385.46	5061.70	UPS	2010-07-08	30	816	PENDING
233	51	2010-06-30	5593.36	461.45	6058.81	COURIER	2010-07-01	1652	854	SHIPPED
234	165	2010-05-24	7725.80	637.38	8367.18	MAIL	2010-05-31	1084	1008	SHIPPED
235	303	2010-05-22	2612.28	215.51	2832.79	AIR	2010-05-22	801	1921	PENDING
236	156	2010-07-20	7029.31	579.92	7615.23	COURIER	2010-07-23	129	873	SHIPPED
237	884	2010-06-15	6520.88	537.97	7062.85	MAIL	2010-06-20	375	1832	DENIED
238	385	2010-07-05	711.22	58.68	775.90	SHIP	2010-07-06	797	265	PENDING
239	203	2010-06-08	459.97	37.95	501.92	AIR	2010-06-13	960	107	PENDING
240	591	2010-06-02	1428.13	117.82	1549.95	COURIER	2010-06-02	1097	995	SHIPPED
241	84	2010-07-20	9270.16	764.79	10038.95	COURIER	2010-07-21	1680	294	PROCESSING
242	287	2010-07-10	2614.43	215.69	2834.12	AIR	2010-07-12	966	1380	SHIPPED
243	10	2010-07-07	2718.54	224.28	2946.82	MAIL	2010-07-14	1378	1210	SHIPPED
244	65	2010-06-16	1604.85	132.40	1741.25	COURIER	2010-06-23	1857	1406	SHIPPED
245	101	2010-07-16	2263.58	186.75	2454.33	SHIP	2010-07-17	1673	1872	DENIED
246	114	2010-05-25	5307.93	437.90	5749.83	AIR	2010-05-30	1703	602	DENIED
247	389	2010-07-05	5046.22	416.31	5466.53	FEDEX	2010-07-10	1711	1082	DENIED
248	786	2010-06-30	8747.20	721.64	9472.84	COURIER	2010-07-05	1249	732	DENIED
249	251	2010-06-15	5127.85	423.05	5554.90	UPS	2010-06-22	301	110	PROCESSING
250	383	2010-06-13	2451.90	202.28	2658.18	FEDEX	2010-06-17	1023	645	SHIPPED
251	60	2010-06-28	3015.48	248.78	3269.26	FEDEX	2010-07-04	140	959	PROCESSING
252	673	2010-05-26	8225.46	678.60	8908.06	SHIP	2010-05-26	1407	969	PROCESSING
253	982	2010-06-05	3215.81	265.30	3485.11	FEDEX	2010-06-08	279	1945	PENDING
254	851	2010-06-23	3539.38	292.00	3835.38	MAIL	2010-06-26	65	1718	SHIPPED
255	835	2010-06-18	4257.65	351.26	4612.91	FEDEX	2010-06-23	1834	285	SHIPPED
256	831	2010-06-03	1174.26	96.88	1278.14	FEDEX	2010-06-09	161	399	PROCESSING
257	494	2010-06-14	2465.22	203.38	2672.60	UPS	2010-06-20	1276	913	SHIPPED
258	959	2010-06-15	9086.33	749.62	9839.95	MAIL	2010-06-20	414	960	PENDING
259	484	2010-06-02	5846.21	482.31	6332.52	SHIP	2010-06-07	1430	723	DENIED
260	881	2010-07-16	4998.55	412.38	5414.93	MAIL	2010-07-18	853	1626	DENIED
261	647	2010-05-31	5943.04	490.30	6437.34	COURIER	2010-06-06	1353	64	DENIED
262	412	2010-05-26	5407.63	446.13	5857.76	UPS	2010-05-30	1673	1079	PENDING
263	700	2010-06-19	7981.22	658.45	8643.67	MAIL	2010-06-19	415	559	DENIED
264	132	2010-07-07	8792.35	725.37	9521.72	UPS	2010-07-13	1223	1169	DENIED
265	476	2010-07-03	7334.25	605.08	7943.33	COURIER	2010-07-08	901	768	DENIED
266	805	2010-06-10	4633.06	382.23	5019.29	COURIER	2010-06-15	465	1953	PENDING
267	908	2010-06-11	5300.15	437.26	5741.41	SHIP	2010-06-14	211	1761	SHIPPED
268	654	2010-06-17	3652.35	301.32	3957.67	COURIER	2010-06-22	393	869	DENIED
269	648	2010-07-12	1286.60	106.14	1396.74	FEDEX	2010-07-16	1405	1687	PROCESSING
270	198	2010-07-05	2474.74	204.17	2682.91	SHIP	2010-07-08	1010	1732	SHIPPED
271	792	2010-06-06	1163.71	96.01	1263.72	COURIER	2010-06-12	722	1936	SHIPPED
272	711	2010-07-02	1761.20	145.30	1910.50	COURIER	2010-07-02	1940	1385	DENIED
273	912	2010-07-07	4215.52	347.78	4567.30	UPS	2010-07-09	255	352	DENIED
274	678	2010-07-02	3640.10	300.31	3944.41	SHIP	2010-07-06	779	1527	PENDING
275	555	2010-06-21	4804.41	396.36	5204.77	COURIER	2010-06-28	1142	1779	DENIED
276	398	2010-06-27	3810.31	314.35	4128.66	COURIER	2010-06-29	204	841	PENDING
277	556	2010-05-25	6675.76	550.75	7230.51	AIR	2010-05-25	1475	133	SHIPPED
278	104	2010-06-27	6672.04	550.44	7226.48	MAIL	2010-06-29	1708	1500	PENDING
279	359	2010-07-03	7826.79	645.71	8476.50	UPS	2010-07-06	1449	1774	PROCESSING
280	764	2010-05-27	9044.52	746.17	9794.69	AIR	2010-06-02	983	1470	PENDING
281	89	2010-06-14	3639.83	300.29	3944.12	COURIER	2010-06-17	325	136	DENIED
282	283	2010-06-28	9659.96	796.95	10460.91	COURIER	2010-07-05	519	479	DENIED
283	475	2010-06-30	8896.03	733.92	9633.95	SHIP	2010-06-30	202	958	DENIED
284	29	2010-06-26	2099.90	173.24	2277.14	MAIL	2010-06-27	48	1487	SHIPPED
285	448	2010-05-28	8967.09	739.78	9710.87	UPS	2010-06-02	599	1674	DENIED
286	323	2010-07-15	5079.86	419.09	5502.95	FEDEX	2010-07-18	1592	109	DENIED
287	801	2010-06-22	2595.03	214.09	2813.12	MAIL	2010-06-23	30	731	PROCESSING
288	447	2010-06-08	422.84	34.88	461.72	AIR	2010-06-11	190	1141	PENDING
289	191	2010-06-04	7678.17	633.45	8315.62	MAIL	2010-06-04	481	744	SHIPPED
290	526	2010-06-20	4557.77	376.02	4940.79	UPS	2010-06-26	484	191	PENDING
291	929	2010-06-14	755.44	62.32	821.76	UPS	2010-06-19	1059	1424	PROCESSING
292	482	2010-05-22	1662.72	137.17	1803.89	MAIL	2010-05-27	1315	1894	PENDING
293	219	2010-06-29	2168.57	178.91	2354.48	MAIL	2010-06-29	173	1871	DENIED
294	982	2010-06-25	8120.83	669.97	8794.80	MAIL	2010-06-30	1090	1707	PENDING
295	371	2010-06-11	781.88	64.51	850.39	AIR	2010-06-12	1636	556	DENIED
296	777	2010-07-10	1528.15	126.07	1660.22	COURIER	2010-07-16	1132	1943	PROCESSING
297	687	2010-06-09	5727.55	472.52	6204.07	SHIP	2010-06-15	1883	444	PROCESSING
298	565	2010-06-13	3842.75	317.03	4163.78	UPS	2010-06-16	1311	1818	PENDING
299	925	2010-06-01	6348.58	523.76	6876.34	FEDEX	2010-06-07	9	1942	SHIPPED
300	90	2010-07-12	8544.09	704.89	9252.98	UPS	2010-07-15	1784	871	PROCESSING
301	261	2010-06-28	3066.97	253.03	3324.00	SHIP	2010-07-01	103	278	PENDING
302	865	2010-06-12	1615.47	133.28	1752.75	FEDEX	2010-06-13	807	18	PENDING
303	673	2010-06-04	6252.93	515.87	6772.80	MAIL	2010-06-05	868	1162	PROCESSING
304	262	2010-07-02	6290.48	518.96	6813.44	UPS	2010-07-03	1720	160	SHIPPED
305	171	2010-07-10	6247.30	515.40	6766.70	FEDEX	2010-07-11	75	902	SHIPPED
306	438	2010-07-16	870.94	71.85	946.79	COURIER	2010-07-23	1348	575	PROCESSING
307	552	2010-06-21	2000.73	165.06	2169.79	COURIER	2010-06-24	774	1815	DENIED
308	683	2010-06-16	6292.76	519.15	6815.91	FEDEX	2010-06-21	1903	1899	PROCESSING
309	233	2010-06-28	9950.47	820.91	10775.38	AIR	2010-07-03	1363	164	PROCESSING
310	525	2010-06-27	4697.28	387.53	5088.81	COURIER	2010-06-30	1460	328	PROCESSING
311	98	2010-05-23	2745.19	226.48	2975.67	MAIL	2010-05-30	1199	1954	PROCESSING
312	58	2010-07-16	5934.85	489.63	6431.48	SHIP	2010-07-16	1465	510	PROCESSING
313	980	2010-07-18	1426.95	117.72	1548.67	UPS	2010-07-21	142	1675	DENIED
314	18	2010-06-26	2541.00	209.63	2754.63	UPS	2010-07-02	938	1658	PROCESSING
315	381	2010-06-05	6348.14	523.72	6875.86	COURIER	2010-06-07	446	762	PROCESSING
316	259	2010-06-11	5963.63	492.00	6462.63	AIR	2010-06-13	1665	534	PENDING
317	559	2010-07-02	4390.75	362.24	4756.99	FEDEX	2010-07-08	602	1947	PENDING
318	773	2010-06-07	5917.59	488.20	6411.79	COURIER	2010-06-12	1471	1913	PENDING
319	886	2010-06-16	2480.04	204.60	2688.64	AIR	2010-06-21	1132	1480	PROCESSING
320	138	2010-06-28	9714.37	801.44	10519.81	FEDEX	2010-07-02	258	564	PROCESSING
321	545	2010-07-09	6950.41	573.41	7527.82	COURIER	2010-07-10	931	1411	PENDING
322	557	2010-07-14	113.69	9.38	127.07	SHIP	2010-07-17	1705	563	PROCESSING
323	442	2010-06-15	7684.41	633.96	8322.37	SHIP	2010-06-18	1974	148	DENIED
324	311	2010-05-24	5586.28	460.87	6051.15	SHIP	2010-05-24	1489	370	SHIPPED
325	142	2010-06-13	6055.39	499.57	6558.96	FEDEX	2010-06-16	892	1850	DENIED
326	80	2010-07-13	719.85	59.39	783.24	AIR	2010-07-17	1264	273	PROCESSING
327	534	2010-06-17	99.94	8.25	112.19	COURIER	2010-06-19	1883	514	SHIPPED
328	655	2010-07-12	6648.33	548.49	7200.82	MAIL	2010-07-13	1427	1918	PROCESSING
329	66	2010-07-05	7101.88	585.91	7691.79	COURIER	2010-07-07	1991	917	DENIED
330	203	2010-07-17	3273.56	270.07	3547.63	SHIP	2010-07-24	412	1472	DENIED
331	121	2010-06-29	2041.42	168.42	2213.84	COURIER	2010-07-03	218	1626	SHIPPED
332	568	2010-06-28	7547.98	622.71	8174.69	SHIP	2010-06-28	230	1618	PENDING
333	781	2010-06-19	9283.32	765.87	10053.19	FEDEX	2010-06-20	1282	200	DENIED
334	763	2010-05-22	4340.57	358.10	4702.67	FEDEX	2010-05-27	378	857	PROCESSING
335	181	2010-06-27	5010.63	413.38	5428.01	COURIER	2010-06-28	1131	680	DENIED
336	192	2010-07-15	3022.83	249.38	3276.21	AIR	2010-07-17	361	1528	DENIED
337	334	2010-05-25	4793.12	395.43	5192.55	SHIP	2010-05-29	1195	1644	SHIPPED
338	930	2010-06-24	118.48	9.77	132.25	FEDEX	2010-06-25	259	1562	PROCESSING
339	816	2010-05-24	5053.77	416.94	5474.71	AIR	2010-05-29	293	1413	SHIPPED
340	568	2010-06-12	3265.49	269.40	3538.89	AIR	2010-06-14	152	404	PROCESSING
341	709	2010-06-22	2820.94	232.73	3057.67	UPS	2010-06-23	590	1592	PROCESSING
342	522	2010-06-23	2707.77	223.39	2935.16	AIR	2010-06-23	1307	119	PENDING
343	481	2010-07-02	542.17	44.73	590.90	FEDEX	2010-07-06	1978	342	SHIPPED
344	215	2010-07-08	4988.48	411.55	5404.03	UPS	2010-07-14	1503	297	PROCESSING
345	773	2010-06-28	9172.07	756.70	9932.77	FEDEX	2010-07-05	1810	1157	PROCESSING
346	436	2010-06-26	356.47	29.41	389.88	AIR	2010-06-27	59	810	DENIED
347	54	2010-07-12	8154.61	672.76	8831.37	COURIER	2010-07-12	1385	1054	PENDING
348	736	2010-07-14	727.70	60.04	791.74	SHIP	2010-07-15	409	1005	SHIPPED
349	191	2010-07-03	1088.29	89.78	1182.07	UPS	2010-07-03	1241	1053	DENIED
350	274	2010-07-07	4244.16	350.14	4598.30	AIR	2010-07-11	153	1542	PROCESSING
351	128	2010-06-19	657.23	54.22	715.45	SHIP	2010-06-23	1649	1090	PENDING
352	352	2010-06-13	1061.29	87.56	1152.85	SHIP	2010-06-19	356	1109	PROCESSING
353	483	2010-05-25	5047.78	416.44	5468.22	UPS	2010-05-29	831	487	DENIED
354	10	2010-05-24	7708.45	635.95	8348.40	SHIP	2010-05-28	1334	1100	PENDING
355	771	2010-05-28	5766.47	475.73	6248.20	SHIP	2010-05-31	1049	683	DENIED
356	191	2010-06-30	9038.14	745.65	9787.79	AIR	2010-07-06	140	1672	DENIED
357	402	2010-07-17	8669.84	715.26	9389.10	FEDEX	2010-07-21	1201	1914	DENIED
358	411	2010-06-22	8277.41	682.89	8964.30	COURIER	2010-06-22	62	330	SHIPPED
359	682	2010-07-17	5228.37	431.34	5663.71	UPS	2010-07-24	1748	1313	DENIED
360	20	2010-05-28	9340.11	770.56	10114.67	AIR	2010-05-28	1109	426	SHIPPED
361	452	2010-05-29	638.60	52.68	695.28	MAIL	2010-05-31	211	351	PROCESSING
362	88	2010-07-15	7711.89	636.23	8352.12	MAIL	2010-07-22	1335	388	PROCESSING
363	315	2010-05-26	45.25	3.73	52.98	MAIL	2010-05-26	177	310	DENIED
364	300	2010-06-03	7125.68	587.87	7717.55	COURIER	2010-06-10	1358	205	PROCESSING
365	73	2010-07-17	928.19	76.58	1008.77	MAIL	2010-07-20	447	1671	SHIPPED
366	135	2010-06-01	4532.34	373.92	4910.26	FEDEX	2010-06-02	1640	287	PENDING
367	359	2010-06-16	4267.09	352.03	4623.12	AIR	2010-06-23	8	1250	DENIED
368	261	2010-06-08	7567.28	624.30	8195.58	MAIL	2010-06-12	87	1343	SHIPPED
369	199	2010-06-15	9767.72	805.84	10577.56	FEDEX	2010-06-16	586	1504	PROCESSING
370	182	2010-07-12	8152.95	672.62	8829.57	SHIP	2010-07-13	330	428	SHIPPED
371	603	2010-06-20	5578.79	460.25	6043.04	UPS	2010-06-20	1476	1755	PROCESSING
372	88	2010-06-13	3729.82	307.71	4041.53	MAIL	2010-06-15	639	505	DENIED
373	283	2010-06-08	4018.29	331.51	4353.80	MAIL	2010-06-12	1610	376	DENIED
374	4	2010-06-23	5532.94	456.47	5993.41	AIR	2010-06-29	858	416	SHIPPED
375	472	2010-05-31	7454.48	614.99	8073.47	MAIL	2010-05-31	1524	1286	PROCESSING
376	506	2010-06-08	6290.38	518.96	6813.34	SHIP	2010-06-13	1720	729	DENIED
377	775	2010-06-08	4108.45	338.95	4451.40	SHIP	2010-06-13	1976	779	SHIPPED
378	578	2010-07-12	4608.06	380.16	4992.22	UPS	2010-07-17	1825	1079	DENIED
379	9	2010-05-24	3374.42	278.39	3656.81	SHIP	2010-05-27	1594	926	SHIPPED
380	557	2010-06-27	7598.36	626.86	8229.22	UPS	2010-07-02	1963	810	SHIPPED
381	52	2010-06-26	6501.04	536.34	7041.38	AIR	2010-07-03	1193	323	PENDING
382	607	2010-06-02	6450.98	532.21	6991.19	AIR	2010-06-02	1190	930	PROCESSING
383	138	2010-07-18	628.32	51.84	684.16	COURIER	2010-07-21	1522	543	PROCESSING
384	938	2010-06-16	3978.36	328.21	4310.57	AIR	2010-06-19	867	225	PENDING
385	247	2010-05-29	9657.07	796.71	10457.78	MAIL	2010-05-29	1266	346	DENIED
386	219	2010-05-29	7992.73	659.40	8660.13	MAIL	2010-06-03	993	1454	SHIPPED
387	675	2010-05-22	4722.64	389.62	5116.26	FEDEX	2010-05-23	1835	878	PENDING
388	295	2010-06-25	401.55	33.13	438.68	FEDEX	2010-06-25	1640	1938	SHIPPED
389	661	2010-06-25	5916.43	488.11	6408.54	MAIL	2010-06-29	1188	191	DENIED
390	540	2010-05-23	4161.28	343.31	4508.59	SHIP	2010-05-30	432	321	PROCESSING
391	546	2010-06-05	7362.48	607.40	7973.88	AIR	2010-06-07	889	1165	PROCESSING
392	134	2010-05-27	4267.60	352.08	4627.68	COURIER	2010-05-31	465	1774	PROCESSING
393	871	2010-06-18	1391.45	114.79	1510.24	SHIP	2010-06-25	1168	1410	PROCESSING
394	582	2010-06-24	3327.15	274.49	3605.64	COURIER	2010-07-01	551	119	SHIPPED
395	675	2010-06-18	6937.23	572.32	7513.55	AIR	2010-06-22	1055	886	PENDING
396	713	2010-06-12	97.26	8.02	109.28	SHIP	2010-06-15	739	669	PENDING
397	932	2010-05-22	2529.83	208.71	2742.54	FEDEX	2010-05-22	411	1113	SHIPPED
398	570	2010-07-01	670.48	55.31	729.79	SHIP	2010-07-01	1726	1631	PENDING
399	443	2010-06-03	3153.42	260.16	3417.58	MAIL	2010-06-05	853	611	PROCESSING
400	871	2010-06-10	7226.70	596.20	7826.90	FEDEX	2010-06-15	1826	823	DENIED
401	61	2010-07-17	1680.13	138.61	1822.74	SHIP	2010-07-21	928	500	SHIPPED
402	690	2010-05-29	5893.55	486.22	6383.77	MAIL	2010-05-31	598	1319	DENIED
403	22	2010-06-25	8558.83	706.10	9268.93	AIR	2010-07-01	710	827	PENDING
404	937	2010-06-07	4700.79	387.82	5092.61	SHIP	2010-06-09	1974	1993	PENDING
405	726	2010-05-23	8849.98	730.12	9584.10	FEDEX	2010-05-24	1447	1164	SHIPPED
406	75	2010-06-06	466.44	38.48	508.92	SHIP	2010-06-07	1324	11	PENDING
407	747	2010-05-30	2914.04	240.41	3158.45	SHIP	2010-06-05	658	1366	DENIED
408	336	2010-06-15	917.52	75.70	997.22	COURIER	2010-06-22	1772	808	DENIED
409	921	2010-06-16	8203.23	676.77	8884.00	COURIER	2010-06-18	1699	1946	PENDING
410	205	2010-06-17	6441.70	531.44	6977.14	UPS	2010-06-17	1711	1662	SHIPPED
411	493	2010-05-22	7011.06	578.41	7593.47	COURIER	2010-05-26	1955	1540	SHIPPED
412	548	2010-06-17	7519.78	620.38	8144.16	MAIL	2010-06-21	1479	58	PENDING
413	194	2010-06-12	2249.51	185.58	2442.09	SHIP	2010-06-18	1149	1023	DENIED
414	583	2010-05-24	187.65	15.48	207.13	MAIL	2010-05-25	978	898	PROCESSING
415	37	2010-06-08	9917.04	818.16	10739.20	SHIP	2010-06-09	894	1562	DENIED
416	721	2010-06-15	7660.26	631.97	8296.23	UPS	2010-06-19	1479	914	DENIED
417	59	2010-07-07	2665.13	219.87	2889.00	UPS	2010-07-12	130	1993	DENIED
418	322	2010-07-14	9010.59	743.37	9757.96	UPS	2010-07-14	1775	374	DENIED
419	475	2010-06-07	7781.99	642.01	8428.00	FEDEX	2010-06-12	1562	474	SHIPPED
420	295	2010-05-29	9947.98	820.71	10772.69	COURIER	2010-06-02	1492	1161	PENDING
421	219	2010-07-04	7968.33	657.39	8629.72	UPS	2010-07-07	341	1643	PROCESSING
422	420	2010-07-04	8643.57	713.09	9360.66	UPS	2010-07-11	371	1952	PENDING
423	340	2010-05-23	7583.89	625.67	8213.56	FEDEX	2010-05-28	1588	206	SHIPPED
424	239	2010-06-13	5705.93	470.74	6180.67	SHIP	2010-06-18	1377	248	DENIED
425	346	2010-06-19	6638.15	547.65	7189.80	FEDEX	2010-06-23	1152	1863	SHIPPED
426	187	2010-06-29	2020.27	166.67	2190.94	UPS	2010-07-05	1135	892	SHIPPED
427	414	2010-06-23	7361.01	607.28	7972.29	UPS	2010-06-25	1893	1693	SHIPPED
428	116	2010-07-15	768.35	63.39	835.74	SHIP	2010-07-21	1825	517	SHIPPED
429	642	2010-07-03	5362.98	442.45	5809.43	FEDEX	2010-07-05	259	1945	PROCESSING
430	854	2010-05-24	2995.89	247.16	3247.05	UPS	2010-05-25	250	543	DENIED
431	178	2010-06-30	705.14	58.17	767.31	FEDEX	2010-07-06	1126	1766	PENDING
432	800	2010-07-10	7592.86	626.41	8223.27	UPS	2010-07-11	211	525	PROCESSING
433	283	2010-07-14	159.10	13.13	176.23	MAIL	2010-07-16	510	1515	PROCESSING
434	105	2010-06-02	6209.73	512.30	6726.03	UPS	2010-06-04	330	752	DENIED
435	201	2010-06-24	2072.28	170.96	2247.24	AIR	2010-06-30	1149	388	DENIED
436	505	2010-05-28	1996.91	164.75	2165.66	SHIP	2010-06-02	129	1416	SHIPPED
437	501	2010-07-06	2601.07	214.59	2819.66	SHIP	2010-07-13	1446	911	DENIED
438	423	2010-06-20	5418.99	447.07	5870.06	UPS	2010-06-22	1980	1578	SHIPPED
439	703	2010-06-23	2325.30	191.84	2521.14	COURIER	2010-06-28	1270	621	SHIPPED
440	586	2010-06-27	3731.61	307.86	4043.47	SHIP	2010-06-27	1104	1225	SHIPPED
441	562	2010-06-02	8374.07	690.86	9068.93	MAIL	2010-06-09	1679	1560	SHIPPED
442	229	2010-05-26	9932.71	819.45	10756.16	MAIL	2010-05-27	855	1534	SHIPPED
443	104	2010-07-19	8021.93	661.81	8687.74	MAIL	2010-07-20	624	850	PENDING
444	147	2010-06-17	4613.74	380.63	4998.37	SHIP	2010-06-17	1282	1808	SHIPPED
445	876	2010-07-14	9176.99	757.10	9938.09	SHIP	2010-07-20	1084	705	PENDING
446	13	2010-07-10	6635.28	547.41	7186.69	AIR	2010-07-11	748	1980	PENDING
447	947	2010-05-31	1485.15	122.52	1611.67	FEDEX	2010-06-02	673	321	SHIPPED
448	216	2010-06-26	2943.16	242.81	3189.97	UPS	2010-06-26	1132	1601	PENDING
449	358	2010-07-01	3193.88	263.50	3461.38	MAIL	2010-07-05	298	996	SHIPPED
450	537	2010-07-16	7319.43	603.85	7927.28	AIR	2010-07-20	1196	1515	PENDING
451	885	2010-07-18	7218.53	595.53	7818.06	FEDEX	2010-07-21	1701	478	SHIPPED
452	221	2010-06-05	8828.83	728.38	9561.21	MAIL	2010-06-08	922	567	PROCESSING
453	507	2010-05-30	6266.32	516.97	6787.29	FEDEX	2010-06-02	1216	1141	PROCESSING
454	411	2010-06-10	2656.10	219.13	2879.23	UPS	2010-06-12	1048	1107	PENDING
455	6	2010-06-08	3387.95	279.51	3671.46	COURIER	2010-06-10	1249	634	DENIED
456	602	2010-06-16	1468.46	121.15	1593.61	UPS	2010-06-17	1750	1410	PENDING
457	329	2010-07-01	5689.57	469.39	6162.96	MAIL	2010-07-04	1879	362	PENDING
458	456	2010-06-13	868.87	71.68	944.55	MAIL	2010-06-17	493	452	DENIED
459	863	2010-07-19	7648.52	631.00	8283.52	COURIER	2010-07-24	169	808	DENIED
460	191	2010-05-24	3404.91	280.91	3689.82	COURIER	2010-05-24	1032	746	PENDING
461	360	2010-07-02	2537.90	209.38	2751.28	AIR	2010-07-05	1660	1365	PROCESSING
462	282	2010-05-31	3137.63	258.85	3400.48	MAIL	2010-06-06	43	975	SHIPPED
463	131	2010-06-20	4410.36	363.85	4778.21	MAIL	2010-06-23	1278	1858	DENIED
464	280	2010-06-30	9862.94	813.69	10680.63	AIR	2010-06-30	1161	1105	PENDING
465	573	2010-06-06	9996.35	824.70	10825.05	MAIL	2010-06-11	214	703	SHIPPED
466	953	2010-07-18	6908.73	569.97	7482.70	AIR	2010-07-23	1614	74	DENIED
467	877	2010-07-18	7751.88	639.53	8395.41	COURIER	2010-07-21	1382	386	PENDING
468	5	2010-06-08	4148.62	342.26	4494.88	SHIP	2010-06-12	807	628	PENDING
469	745	2010-06-04	775.17	63.95	843.12	UPS	2010-06-07	1101	1947	PROCESSING
470	426	2010-07-19	5480.13	452.11	5937.24	FEDEX	2010-07-25	1215	380	SHIPPED
471	419	2010-05-29	8177.84	674.67	8856.51	SHIP	2010-06-03	325	113	PROCESSING
472	523	2010-05-28	8005.09	660.42	8669.51	UPS	2010-06-02	1231	543	PROCESSING
473	743	2010-06-23	520.77	42.96	567.73	UPS	2010-06-30	1579	493	PROCESSING
474	930	2010-05-25	4228.05	348.81	4580.86	AIR	2010-05-26	1702	1768	SHIPPED
475	440	2010-06-05	5667.10	467.54	6138.64	SHIP	2010-06-08	1011	1871	PENDING
476	41	2010-07-01	3824.83	315.55	4144.38	UPS	2010-07-02	1190	375	DENIED
477	810	2010-06-03	4510.75	372.14	4886.89	SHIP	2010-06-10	890	233	DENIED
478	195	2010-07-19	1396.68	115.23	1515.91	SHIP	2010-07-22	1379	1478	DENIED
479	645	2010-05-26	2087.47	172.22	2263.69	COURIER	2010-06-02	453	486	PROCESSING
480	216	2010-06-17	1769.25	145.96	1919.21	MAIL	2010-06-23	22	1595	DENIED
481	692	2010-07-05	6941.12	572.64	7517.76	AIR	2010-07-05	1750	93	DENIED
482	49	2010-07-12	3494.40	288.29	3786.69	MAIL	2010-07-18	483	1668	SHIPPED
483	161	2010-07-06	7579.99	625.35	8209.34	COURIER	2010-07-06	1308	1452	DENIED
484	136	2010-06-17	1853.65	152.93	2013.58	MAIL	2010-06-17	400	1585	DENIED
485	183	2010-06-09	1445.51	119.25	1568.76	COURIER	2010-06-13	761	620	DENIED
486	82	2010-06-11	9178.54	757.23	9939.77	MAIL	2010-06-14	226	44	DENIED
487	57	2010-06-10	3683.41	303.88	3991.29	COURIER	2010-06-17	1130	1744	DENIED
488	742	2010-06-01	3668.72	302.67	3975.39	SHIP	2010-06-03	637	830	DENIED
489	21	2010-06-23	4369.60	360.49	4735.09	COURIER	2010-06-28	883	1179	PROCESSING
490	965	2010-07-13	9381.41	773.97	10159.38	AIR	2010-07-16	427	1346	PENDING
491	483	2010-06-28	2847.71	234.94	3086.65	MAIL	2010-07-02	1709	1692	DENIED
492	139	2010-05-27	1072.64	88.49	1165.13	UPS	2010-06-03	1629	62	SHIPPED
493	161	2010-06-23	9645.07	795.72	10444.79	COURIER	2010-06-23	259	1438	PROCESSING
494	230	2010-05-23	5478.14	451.95	5934.09	SHIP	2010-05-30	546	372	DENIED
495	469	2010-05-31	4242.96	350.04	4597.00	UPS	2010-06-01	1772	288	DENIED
496	699	2010-06-03	879.49	72.56	956.05	AIR	2010-06-10	1727	477	PROCESSING
497	419	2010-07-19	8529.90	703.72	9237.62	MAIL	2010-07-20	929	1835	PENDING
498	665	2010-07-01	2293.18	189.19	2486.37	AIR	2010-07-04	1962	1842	PENDING
499	514	2010-06-24	7123.45	587.68	7715.13	AIR	2010-06-27	1432	130	PENDING
500	370	2010-06-01	9014.04	743.66	9761.70	COURIER	2010-06-08	806	1112	PROCESSING
501	949	2010-06-02	5373.35	443.30	5820.65	SHIP	2010-06-07	70	248	DENIED
502	197	2010-07-09	2204.51	181.87	2391.38	UPS	2010-07-15	465	928	PROCESSING
503	53	2010-07-14	6371.24	525.63	6900.87	AIR	2010-07-18	1368	6	PROCESSING
504	285	2010-07-09	9817.52	809.95	10631.47	COURIER	2010-07-15	1387	1230	PROCESSING
505	995	2010-07-18	5848.87	482.53	6335.40	COURIER	2010-07-25	35	26	SHIPPED
506	716	2010-06-19	1807.03	149.08	1960.11	MAIL	2010-06-26	431	1238	DENIED
507	56	2010-07-04	5137.83	423.87	5565.70	MAIL	2010-07-06	1564	1865	DENIED
508	184	2010-06-26	6180.54	509.89	6694.43	UPS	2010-06-28	1548	413	DENIED
509	163	2010-07-15	2942.38	242.75	3189.13	FEDEX	2010-07-18	1327	1272	SHIPPED
510	6	2010-07-10	5209.11	429.75	5642.86	COURIER	2010-07-13	1465	1940	SHIPPED
511	303	2010-06-29	3999.39	329.95	4333.34	AIR	2010-07-01	1890	1837	DENIED
512	973	2010-05-22	8661.71	714.59	9380.30	COURIER	2010-05-23	631	1792	PENDING
513	822	2010-07-07	5907.41	487.36	6398.77	AIR	2010-07-08	1249	190	SHIPPED
514	361	2010-05-26	3441.99	283.96	3729.95	MAIL	2010-05-31	1634	465	DENIED
515	200	2010-06-18	1245.89	102.79	1352.68	MAIL	2010-06-22	1248	260	PROCESSING
516	200	2010-07-05	1881.57	155.23	2040.80	UPS	2010-07-05	1872	1648	PROCESSING
517	231	2010-06-11	343.25	28.32	375.57	AIR	2010-06-17	1037	1782	PROCESSING
518	332	2010-05-30	8163.31	673.47	8842.78	FEDEX	2010-06-06	852	401	PROCESSING
519	826	2010-05-24	5315.11	438.50	5757.61	SHIP	2010-05-24	353	1406	DENIED
520	174	2010-06-05	9663.53	797.24	10464.77	FEDEX	2010-06-09	299	765	DENIED
521	463	2010-06-05	115.02	9.49	131.51	FEDEX	2010-06-12	629	446	DENIED
522	405	2010-07-17	2027.64	167.28	2198.92	AIR	2010-07-19	982	688	SHIPPED
523	511	2010-06-27	7673.52	633.07	8310.59	SHIP	2010-07-01	1517	1575	PENDING
524	645	2010-06-19	1820.88	150.22	1975.10	AIR	2010-06-24	1151	585	DENIED
525	690	2010-05-30	7191.14	593.27	7788.41	COURIER	2010-06-06	1638	1938	PROCESSING
526	482	2010-07-11	6998.83	577.40	7580.23	MAIL	2010-07-12	682	1726	PENDING
527	671	2010-06-24	7171.15	591.62	7766.77	SHIP	2010-06-30	1684	1419	SHIPPED
528	7	2010-05-27	8706.84	718.31	9429.15	FEDEX	2010-06-01	1378	1213	SHIPPED
529	51	2010-05-28	1891.07	156.01	2051.08	COURIER	2010-05-29	1505	542	SHIPPED
530	481	2010-05-25	1656.74	136.68	1797.42	COURIER	2010-05-31	1897	1538	PROCESSING
531	962	2010-06-16	9447.86	779.45	10231.31	MAIL	2010-06-20	1875	1023	PROCESSING
532	424	2010-06-20	1781.25	146.95	1932.20	COURIER	2010-06-23	1460	461	PENDING
533	716	2010-07-01	6246.24	515.31	6765.55	AIR	2010-07-08	16	109	DENIED
534	305	2010-07-04	6246.05	515.30	6765.35	SHIP	2010-07-11	172	1243	PENDING
535	462	2010-05-31	8645.54	713.26	9362.80	FEDEX	2010-06-04	852	1509	PENDING
536	23	2010-06-02	74.63	6.16	84.79	MAIL	2010-06-08	1671	153	PROCESSING
537	330	2010-07-19	8352.79	689.11	9045.90	SHIP	2010-07-24	1534	858	PENDING
538	892	2010-06-24	3941.32	325.16	4270.48	AIR	2010-06-29	1200	258	PENDING
539	253	2010-06-26	6584.00	543.18	7131.18	AIR	2010-06-29	786	1384	SHIPPED
540	32	2010-07-08	3632.82	299.71	3936.53	COURIER	2010-07-11	475	735	PROCESSING
541	491	2010-06-12	6701.69	552.89	7258.58	SHIP	2010-06-16	1627	218	DENIED
542	62	2010-07-14	8803.95	726.33	9534.28	SHIP	2010-07-20	130	738	PROCESSING
543	689	2010-05-31	4649.05	383.55	5036.60	SHIP	2010-05-31	801	1258	PENDING
544	75	2010-07-09	4668.46	385.15	5057.61	MAIL	2010-07-09	451	1922	PROCESSING
545	592	2010-06-06	6001.88	495.16	6504.04	AIR	2010-06-12	420	256	DENIED
546	186	2010-07-10	1341.89	110.71	1456.60	AIR	2010-07-17	1930	1121	PROCESSING
547	59	2010-06-19	3750.82	309.44	4064.26	SHIP	2010-06-25	980	899	PENDING
548	135	2010-06-07	8187.37	675.46	8866.83	AIR	2010-06-10	206	244	PROCESSING
549	285	2010-07-03	161.76	13.35	179.11	FEDEX	2010-07-07	399	46	SHIPPED
550	540	2010-06-21	3578.78	295.25	3878.03	FEDEX	2010-06-23	1897	1112	SHIPPED
551	166	2010-07-13	979.82	80.84	1064.66	FEDEX	2010-07-14	1738	1891	DENIED
552	391	2010-07-13	7518.53	620.28	8142.81	FEDEX	2010-07-19	1401	562	SHIPPED
553	788	2010-06-05	4184.29	345.20	4533.49	AIR	2010-06-12	1252	90	DENIED
554	299	2010-05-29	1503.38	124.03	1631.41	AIR	2010-06-01	908	1955	PENDING
555	743	2010-06-19	698.30	57.61	759.91	COURIER	2010-06-21	1697	1423	DENIED
556	866	2010-07-17	80.79	6.67	91.46	COURIER	2010-07-19	1800	1067	PROCESSING
557	378	2010-05-22	4077.69	336.41	4418.10	UPS	2010-05-25	1851	1210	PENDING
558	519	2010-06-09	2378.03	196.19	2578.22	AIR	2010-06-10	1029	1352	PROCESSING
559	601	2010-06-07	2542.64	209.77	2756.41	FEDEX	2010-06-12	897	518	PROCESSING
560	316	2010-06-16	4842.22	399.48	5245.70	UPS	2010-06-18	1100	324	DENIED
561	189	2010-07-11	8413.46	694.11	9111.57	SHIP	2010-07-15	1451	1604	PENDING
562	54	2010-06-30	4868.91	401.69	5274.60	COURIER	2010-07-07	1549	957	SHIPPED
563	374	2010-06-30	8632.29	712.16	9348.45	UPS	2010-06-30	1349	269	DENIED
564	131	2010-07-18	8792.49	725.38	9521.87	SHIP	2010-07-21	1487	526	DENIED
565	175	2010-07-12	9996.63	824.72	10825.35	UPS	2010-07-19	31	730	PENDING
566	189	2010-05-29	100.49	8.29	112.78	MAIL	2010-06-04	494	873	SHIPPED
567	650	2010-06-05	1331.49	109.85	1445.34	MAIL	2010-06-10	498	1377	DENIED
568	57	2010-06-17	9936.41	819.75	10763.16	UPS	2010-06-21	906	1245	PENDING
569	262	2010-07-02	7517.38	620.18	8141.56	AIR	2010-07-06	24	1725	PROCESSING
570	822	2010-07-16	3641.25	300.40	3945.65	AIR	2010-07-20	1154	503	DENIED
571	163	2010-07-14	2592.89	213.91	2810.80	MAIL	2010-07-20	1832	82	PENDING
572	157	2010-07-14	4998.31	412.36	5414.67	FEDEX	2010-07-18	873	639	PENDING
573	787	2010-06-28	2607.25	215.10	2826.35	FEDEX	2010-07-04	68	494	DENIED
574	717	2010-05-27	9067.15	748.04	9819.19	COURIER	2010-06-02	48	357	PROCESSING
575	994	2010-06-29	1852.52	152.83	2009.35	COURIER	2010-07-05	1527	502	PROCESSING
576	696	2010-05-27	9874.40	814.64	10693.04	UPS	2010-06-03	1961	1815	PENDING
577	988	2010-06-26	6452.46	532.33	6988.79	MAIL	2010-06-27	51	411	SHIPPED
578	678	2010-06-22	7306.88	602.82	7913.70	AIR	2010-06-24	983	1871	PROCESSING
579	369	2010-06-20	8273.84	682.59	8960.43	FEDEX	2010-06-21	1927	166	SHIPPED
580	957	2010-06-20	1038.03	85.64	1127.67	AIR	2010-06-22	988	583	SHIPPED
581	249	2010-05-28	6742.87	556.29	7303.16	SHIP	2010-05-30	1479	1843	PROCESSING
582	644	2010-07-04	5700.23	470.27	6178.50	MAIL	2010-07-05	433	408	SHIPPED
583	373	2010-05-23	2343.20	193.31	2540.51	MAIL	2010-05-23	414	1913	SHIPPED
584	958	2010-07-11	9246.37	762.83	10013.20	SHIP	2010-07-13	1810	82	SHIPPED
585	133	2010-06-05	516.51	42.61	563.12	UPS	2010-06-08	1330	445	DENIED
586	427	2010-06-30	9430.13	777.99	10212.12	AIR	2010-07-06	1875	513	SHIPPED
587	374	2010-06-15	1372.44	113.23	1489.67	SHIP	2010-06-20	803	340	DENIED
588	313	2010-07-13	12.42	1.02	17.44	UPS	2010-07-17	654	1927	DENIED
589	148	2010-05-23	1834.05	151.31	1989.36	MAIL	2010-05-23	1904	1262	DENIED
590	584	2010-07-16	7218.01	595.49	7817.50	SHIP	2010-07-19	685	860	SHIPPED
591	117	2010-07-03	7401.79	610.65	8016.44	UPS	2010-07-03	998	1044	PROCESSING
592	749	2010-06-20	7713.64	636.38	8354.02	AIR	2010-06-27	1779	1641	PROCESSING
593	630	2010-06-17	1885.73	155.57	2048.30	UPS	2010-06-24	538	435	SHIPPED
594	645	2010-06-02	545.03	44.96	593.99	MAIL	2010-06-06	160	1385	PENDING
595	415	2010-07-08	5017.33	413.93	5435.26	SHIP	2010-07-14	27	798	PROCESSING
596	936	2010-06-21	1670.42	137.81	1812.23	UPS	2010-06-27	1871	818	DENIED
597	977	2010-06-04	9493.50	783.21	10280.71	AIR	2010-06-09	500	1597	DENIED
598	104	2010-05-28	9372.17	773.20	10149.37	AIR	2010-05-30	1206	1277	DENIED
599	8	2010-07-03	302.25	24.94	331.19	COURIER	2010-07-10	53	1228	SHIPPED
600	86	2010-06-10	1710.27	141.10	1855.37	FEDEX	2010-06-17	478	1446	PROCESSING
601	514	2010-06-03	7581.17	625.45	8213.62	COURIER	2010-06-10	1834	720	SHIPPED
602	769	2010-06-11	4534.68	374.11	4912.79	UPS	2010-06-13	1351	265	SHIPPED
603	153	2010-07-14	9520.62	785.45	10310.07	FEDEX	2010-07-17	332	61	SHIPPED
604	512	2010-07-09	5319.46	438.86	5762.32	UPS	2010-07-16	949	440	PROCESSING
605	616	2010-06-20	967.73	79.84	1051.57	SHIP	2010-06-22	1248	423	DENIED
606	859	2010-06-17	6290.50	518.97	6813.47	COURIER	2010-06-18	1532	1682	SHIPPED
607	654	2010-07-09	9844.97	812.21	10661.18	AIR	2010-07-12	182	1116	DENIED
608	467	2010-07-04	225.73	18.62	248.35	MAIL	2010-07-06	568	543	DENIED
609	891	2010-06-16	2584.51	213.22	2801.73	UPS	2010-06-17	959	1392	SHIPPED
610	222	2010-07-04	3147.79	259.69	3411.48	COURIER	2010-07-11	1243	1767	PROCESSING
611	103	2010-06-20	5299.07	437.17	5740.24	FEDEX	2010-06-26	188	394	PROCESSING
612	678	2010-06-06	5176.94	427.10	5608.04	COURIER	2010-06-09	111	1687	PENDING
613	65	2010-07-04	1192.33	98.37	1294.70	MAIL	2010-07-10	323	1906	DENIED
614	388	2010-06-27	3155.12	260.30	3419.42	COURIER	2010-07-02	1966	936	DENIED
615	848	2010-07-18	4721.73	389.54	5115.27	AIR	2010-07-20	825	788	PROCESSING
616	94	2010-05-29	3396.45	280.21	3680.66	COURIER	2010-06-04	1446	11	SHIPPED
617	233	2010-07-13	4711.37	388.69	5104.06	FEDEX	2010-07-15	1965	1134	SHIPPED
618	971	2010-06-27	7220.19	595.67	7819.86	SHIP	2010-06-30	1556	959	PROCESSING
619	434	2010-05-28	1529.74	126.20	1659.94	FEDEX	2010-06-04	1765	37	DENIED
620	981	2010-06-11	3682.43	303.80	3990.23	SHIP	2010-06-12	1392	1649	DENIED
621	924	2010-06-23	2646.56	218.34	2869.90	AIR	2010-06-25	911	1294	PROCESSING
622	88	2010-06-25	7651.63	631.26	8286.89	UPS	2010-06-25	124	859	DENIED
623	927	2010-06-03	8268.28	682.13	8954.41	SHIP	2010-06-10	247	1754	SHIPPED
624	115	2010-07-20	5110.82	421.64	5536.46	UPS	2010-07-23	1615	31	PROCESSING
625	920	2010-06-13	5817.21	479.92	6301.13	FEDEX	2010-06-20	546	147	SHIPPED
626	291	2010-06-29	3153.29	260.15	3417.44	FEDEX	2010-07-06	196	402	PENDING
627	390	2010-07-01	3436.96	283.55	3724.51	AIR	2010-07-07	1327	1195	SHIPPED
628	534	2010-07-10	9285.74	766.07	10055.81	FEDEX	2010-07-11	453	828	DENIED
629	137	2010-06-04	4060.59	335.00	4402.59	AIR	2010-06-08	624	1036	SHIPPED
630	804	2010-07-18	4540.05	374.55	4918.60	UPS	2010-07-19	1121	402	DENIED
631	58	2010-07-01	5388.68	444.57	5837.25	AIR	2010-07-05	1728	150	SHIPPED
632	828	2010-07-10	7247.52	597.92	7849.44	FEDEX	2010-07-12	1004	928	SHIPPED
633	975	2010-07-16	9471.16	781.37	10256.53	FEDEX	2010-07-18	340	1325	DENIED
634	522	2010-06-27	8600.70	709.56	9314.26	UPS	2010-07-03	466	778	PROCESSING
635	371	2010-06-29	6917.47	570.69	7492.16	UPS	2010-07-02	445	604	SHIPPED
636	134	2010-05-29	9859.59	813.42	10677.01	COURIER	2010-05-30	1853	869	DENIED
637	532	2010-06-06	4392.33	362.37	4758.70	AIR	2010-06-08	130	298	SHIPPED
638	646	2010-06-11	4309.37	355.52	4668.89	COURIER	2010-06-18	127	1407	DENIED
639	21	2010-06-05	5112.54	421.78	5538.32	COURIER	2010-06-12	240	711	PROCESSING
640	181	2010-06-11	2742.82	226.28	2973.10	SHIP	2010-06-14	1552	289	PROCESSING
641	528	2010-06-28	9828.56	810.86	10643.42	MAIL	2010-07-03	193	1957	DENIED
642	797	2010-06-27	6488.52	535.30	7027.82	FEDEX	2010-07-04	112	1554	PENDING
643	258	2010-06-09	3056.60	252.17	3312.77	COURIER	2010-06-12	439	1670	DENIED
644	306	2010-07-20	8081.59	666.73	8752.32	FEDEX	2010-07-27	1340	1298	PROCESSING
645	65	2010-06-29	1848.98	152.54	2007.52	FEDEX	2010-06-30	1118	575	SHIPPED
646	325	2010-06-30	8673.42	715.56	9392.98	FEDEX	2010-07-03	1442	641	PROCESSING
647	992	2010-07-16	5464.48	450.82	5919.30	UPS	2010-07-19	763	184	PENDING
\.


--
-- Data for Name: tpcw_shopping_cart; Type: TABLE DATA; Schema: public; Owner: tpc
--

COPY tpcw_shopping_cart (sc_id, sc_time) FROM stdin;
\.


--
-- Data for Name: tpcw_shopping_cart_line; Type: TABLE DATA; Schema: public; Owner: tpc
--

COPY tpcw_shopping_cart_line (scl_sc_id, scl_qty, scl_i_id) FROM stdin;
\.


--
-- Name: pk_address; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT pk_address PRIMARY KEY (addr_id);


--
-- Name: pk_author; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY author
    ADD CONSTRAINT pk_author PRIMARY KEY (a_id);


--
-- Name: pk_country; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT pk_country PRIMARY KEY (co_id);


--
-- Name: pk_customer; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT pk_customer PRIMARY KEY (c_id);


--
-- Name: pk_item; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT pk_item PRIMARY KEY (i_id);


--
-- Name: pk_order_line; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY order_line
    ADD CONSTRAINT pk_order_line PRIMARY KEY (ol_id, ol_o_id);


--
-- Name: pk_orders; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (o_id);


--
-- Name: pk_stock; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY stock
    ADD CONSTRAINT pk_stock PRIMARY KEY (s_i_id);


--
-- Name: pk_test_run; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY test_run
    ADD CONSTRAINT pk_test_run PRIMARY KEY (test_run_id);


--
-- Name: tpcw_address_pkey; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY tpcw_address
    ADD CONSTRAINT tpcw_address_pkey PRIMARY KEY (addr_id);


--
-- Name: tpcw_author_pkey; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY tpcw_author
    ADD CONSTRAINT tpcw_author_pkey PRIMARY KEY (a_id);


--
-- Name: tpcw_cc_xacts_pkey; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY tpcw_cc_xacts
    ADD CONSTRAINT tpcw_cc_xacts_pkey PRIMARY KEY (cx_o_id);


--
-- Name: tpcw_country_pkey; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY tpcw_country
    ADD CONSTRAINT tpcw_country_pkey PRIMARY KEY (co_id);


--
-- Name: tpcw_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY tpcw_customer
    ADD CONSTRAINT tpcw_customer_pkey PRIMARY KEY (c_id);


--
-- Name: tpcw_item_pkey; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY tpcw_item
    ADD CONSTRAINT tpcw_item_pkey PRIMARY KEY (i_id);


--
-- Name: tpcw_order_line_pkey; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY tpcw_order_line
    ADD CONSTRAINT tpcw_order_line_pkey PRIMARY KEY (ol_id, ol_o_id);


--
-- Name: tpcw_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY tpcw_orders
    ADD CONSTRAINT tpcw_orders_pkey PRIMARY KEY (o_id);


--
-- Name: tpcw_shopping_cart_line_pkey; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY tpcw_shopping_cart_line
    ADD CONSTRAINT tpcw_shopping_cart_line_pkey PRIMARY KEY (scl_sc_id, scl_i_id);


--
-- Name: tpcw_shopping_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: tpc; Tablespace: 
--

ALTER TABLE ONLY tpcw_shopping_cart
    ADD CONSTRAINT tpcw_shopping_cart_pkey PRIMARY KEY (sc_id);


--
-- Name: addr_co_id; Type: FK CONSTRAINT; Schema: public; Owner: tpc
--

ALTER TABLE ONLY address
    ADD CONSTRAINT addr_co_id FOREIGN KEY (addr_co_id) REFERENCES country(co_id);


--
-- Name: i_a_id; Type: FK CONSTRAINT; Schema: public; Owner: tpc
--

ALTER TABLE ONLY item
    ADD CONSTRAINT i_a_id FOREIGN KEY (i_a_id) REFERENCES author(a_id);


--
-- Name: o_c_id; Type: FK CONSTRAINT; Schema: public; Owner: tpc
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT o_c_id FOREIGN KEY (o_c_id) REFERENCES customer(c_id);


--
-- Name: o_ship_addr_id; Type: FK CONSTRAINT; Schema: public; Owner: tpc
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT o_ship_addr_id FOREIGN KEY (o_ship_addr_id) REFERENCES address(addr_id);


--
-- Name: ol_i_id; Type: FK CONSTRAINT; Schema: public; Owner: tpc
--

ALTER TABLE ONLY order_line
    ADD CONSTRAINT ol_i_id FOREIGN KEY (ol_i_id) REFERENCES item(i_id);


--
-- Name: ol_o_id; Type: FK CONSTRAINT; Schema: public; Owner: tpc
--

ALTER TABLE ONLY order_line
    ADD CONSTRAINT ol_o_id FOREIGN KEY (ol_o_id) REFERENCES orders(o_id);


--
-- Name: s_i_id; Type: FK CONSTRAINT; Schema: public; Owner: tpc
--

ALTER TABLE ONLY stock
    ADD CONSTRAINT s_i_id FOREIGN KEY (s_i_id) REFERENCES item(i_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

