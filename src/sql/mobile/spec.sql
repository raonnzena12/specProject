CREATE TABLE MOBILE (
	MO_NO	NUMBER		NOT NULL,
	MO_CODE	VARCHAR2(100)		NOT NULL,
	MO_NAME	VARCHAR2(100)		NOT NULL,
	MO_BRANDCODE	NUMBER		NOT NULL
);

CREATE TABLE BRAND (
	BRAND_CODE	NUMBER		NOT NULL,
	BRAND_NAME	VARCHAR2(100)		NOT NULL
);

CREATE TABLE OS (
	OS_CODE	NUMBER		NOT NULL,
	OS_NAME	VARCHAR2(100)		NOT NULL
);

CREATE TABLE BATTERY (
	BAT_CODE	NUMBER		NOT NULL,
	MIN_BATTERY	NUMBER		NOT NULL,
	MAX_BATTERY	NUMBER		NOT NULL
);

CREATE TABLE USER (
	USER_NO	number		NOT NULL,
	USER_EMAIL	VARCHAR2(100)		NOT NULL,
	USER_PWD	VARCHAR2(100)		NOT NULL,
	USER_NAME	VARCHAR2(100)		NOT NULL,
	USER_PHONE	VARCHAR2(100)		NULL,
	USER_ENDATE	date	DEFAULT SYSDATE	NOT NULL,
	USER_MDDATE	date	DEFAULT SYSDATE	NOT NULL,
	USER_EVENT	VARCHAR2(100)		NOT NULL,
	USER_VERIFY	number	DEFAULT 0	NULL,
	USER_STATUS	number		NOT NULL,
	USER_MNO	NUMBER		NULL
);

CREATE TABLE BOARD (
	BNO	NUMBER		NOT NULL,
	BTITLE	VARCHAR2(100)		NOT NULL,
	BCONTENT	CLOB		NOT NULL,
	BCOUNT	NUMBER	DEFAULT 0	NOT NULL,
	BREGDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	BMODIDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	BCODE	NUMBER		NOT NULL,
	BWRITER	number		NOT NULL,
	BSTATUS	NUMBER		NOT NULL
);

CREATE TABLE COMMENT (
	CNO	NUMBER		NOT NULL,
	CCONTENT	VARCHAR2(4000)		NOT NULL,
	CREGDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	CMODIDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	CWRITER	NUMBER		NOT NULL,
	CSTATUS	NUMBER		NOT NULL,
	BNO	NUMBER		NOT NULL
);

CREATE TABLE SUBCOMMENT (
	SNO	NUMBER		NOT NULL,
	SCONTENT	VARCHAR2(4000)		NOT NULL,
	SREGDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	SMODIDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	SWRITER	NUMBER		NOT NULL,
	SSTATUS	NUMBER		NOT NULL,
	CNO	NUMBER		NOT NULL
);

CREATE TABLE REVIEW (
	RE_NO	NUMBER		NOT NULL,
	RE_TITLE	VARCHAR2(100)		NOT NULL,
	RE_CONTENT	clob		NOT NULL,
	RE_STAR	NUMBER	DEFAULT 2.5	NOT NULL,
	RE_REGDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	RE_MODIDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	RE_LIKE	NUMBER	DEFAULT 0	NOT NULL,
	RE_WRITER	NUMBER		NOT NULL,
	RE_MNO	NUMBER		NOT NULL,
	RE_STATUS	NUMBER		NOT NULL
);

CREATE TABLE COMPARE (
	COM_NO	NUMBER		NOT NULL,
	COM_COUNT	NUMBER	DEFAULT 0	NOT NULL,
	COM_MNO1	NUMBER		NOT NULL,
	COM_MNO2	NUMBER		NOT NULL
);

CREATE TABLE REVIEW_LIKE (
	LIKE_NO	NUMBER		NOT NULL,
	LIKE_RNO	NUMBER		NOT NULL,
	LIKE_UNO	NUMBER		NOT NULL
);

CREATE TABLE COM_COMM (
	CC_NO	NUMBER		NOT NULL,
	CC_CONTENT	VARCHAR2(4000)		NOT NULL,
	CC_REGDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	CC_MODIDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	CC_CNO	NUMBER		NOT NULL,
    CC_WIRTER	NUMBER		NOT NULL,
	CC_STATUS	NUMBER		NOT NULL
);

CREATE TABLE CALENDAR (
	CAL_NO	NUMBER		NOT NULL,
	CAL_TITLE	VARCHAR2(100)		NOT NULL,
	CAL_URL	VARCHAR2(500)		NULL,
	CAL_DATE	DATE		NOT NULL,
	CAL_STATUS	VARCHAR2(100)		NOT NULL,
	CAL_CODE	NUMBER		NOT NULL
);

CREATE TABLE USER_STATUS (
	STATUS_CODE	number		NOT NULL,
	STATUS_TYPE	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN USER_STATUS.STATUS_TYPE IS 'ê´?ë¦¬ì/?¼ë°?/??´/ì°¨ë¨';

CREATE TABLE REPORT (
	REPORT_NO	NUMBER		NOT NULL,
	REPORT_TITLE	VARCHAR2(100)		NULL,
	REPORT_CONT	VARCHAR2(4000)		NULL,
	REPORT_CONNO	NUMBER		NULL,
	REPORT_TYPE	VARCHAR2(100)		NULL,
	REPORT_DATE	DATE		NULL,
	REPORT_WRI	number		NOT NULL,
	REPORT_USER	number		NOT NULL
);

COMMENT ON COLUMN REPORT.REPORT_TYPE IS 'ê¸?/?ê¸?/ë¦¬ë·°';

CREATE TABLE CON_STATUS (
	STATUS_CODE	NUMBER		NOT NULL,
	STATUS_TYPE	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN CON_STATUS.STATUS_TYPE IS 'ë¸ë¼?¸?/?­? /ë¹ë?ê¸?/?µ?';

CREATE TABLE B_CODE (
	BCODE	NUMBER		NOT NULL,
	BTYPE	VARCHAR2(100)		NOT NULL
);

CREATE TABLE CAL_TYPE (
	CAL_CODE	NUMBER		NOT NULL,
	CAL_TYPE	VARCHAR2(100)		NOT NULL
);

CREATE TABLE MOBILE_LIKE (
	LIKE_NO	number		NOT NULL,
	LIKE_UNO	number		NOT NULL,
	LIKE_MNO	NUMBER		NOT NULL
);

CREATE TABLE MOBILE_DETAIL (
	MO_NO	NUMBER		NOT NULL,
	MO_RELEASE	VARCHAR2(100)		NULL,
	MO_OSVER	VARCHAR2(100)		NULL,
	MO_MATERIAL	VARCHAR2(100)		NULL,
	MO_SIZE	VARCHAR2(100)		NULL,
	MO_WEIGHT	VARCHAR2(100)		NULL,
	MO_LINK	VARCHAR2(100)		NULL,
	MO_INCH	VARCHAR2(100)		NULL,
	MO_RESOL	VARCHAR2(100)		NULL,
	MO_PIXEL	VARCHAR2(100)		NULL,
	MO_DISTYPE	VARCHAR2(100)		NULL,
	MO_DISWIDTH	VARCHAR2(100)		NULL,
	MO_DISHEIGHT	VARCHAR2(100)		NULL,
	MO_AP	VARCHAR2(100)		NULL,
	MO_CPU	VARCHAR2(100)		NULL,
	MO_CPUCORE	VARCHAR2(100)		NULL,
	MO_CPUCLOCK	VARCHAR2(100)		NULL,
	MO_GPU	VARCHAR2(100)		NULL,
	MO_RAM	VARCHAR2(100)		NULL,
	MO_INMEMO	VARCHAR2(100)		NULL,
	MO_OUTMEMO	VARCHAR2(100)		NULL,
	MO_SENSOR	VARCHAR2(100)		NULL,
	MO_IRIS	VARCHAR2(100)		NULL,
	MO_FLASH	VARCHAR2(100)		NULL,
	MO_PICRESOL	VARCHAR2(100)		NULL,
	MO_VIDRESOL	VARCHAR2(100)		NULL,
	MO_VIDFRAME	VARCHAR2(100)		NULL,
	MO_FRESOL	VARCHAR2(100)		NULL,
	MO_FVIDRESOL	VARCHAR2(100)		NULL,
	MO_FVIDREAME	VARCHAR2(100)		NULL,
	MO_CAMERA	VARCHAR2(100)		NULL,
	MO_MAH	VARCHAR2(100)		NULL,
	MO_BATTYPE	VARCHAR2(100)		NULL,
	MO_BATFEATURE	VARCHAR2(100)		NULL,
	MO_WIRELESS	VARCHAR2(100)		NULL,
	MO_STANDBY	VARCHAR2(100)		NULL,
	MO_PROTOCOL	VARCHAR2(100)		NULL,
	MO_WIFI	VARCHAR2(100)		NULL,
	MO_BLUETOOTH	VARCHAR2(100)		NULL,
	MO_USB	VARCHAR2(100)		NULL,
	MO_BIO	VARCHAR2(100)		NULL,
	MO_PAYMENT	VARCHAR2(100)		NULL,
	MO_VERIFY	VARCHAR2(100)		NULL,
	MO_ETC	VARCHAR2(100)		NULL,
	MO_STATUS	VARCHAR2(100)		NULL,
	MO_BRANDCODE	NUMBER		NOT NULL,
	MO_OSCODE	NUMBER		NOT NULL,
	MO_BATCODE	NUMBER		NOT NULL
);

ALTER TABLE MOBILE ADD CONSTRAINT PK_MOBILE PRIMARY KEY (
	MO_NO
);

ALTER TABLE BRAND ADD CONSTRAINT PK_BRAND PRIMARY KEY (
	BRAND_CODE
);

ALTER TABLE OS ADD CONSTRAINT PK_OS PRIMARY KEY (
	OS_CODE
);

ALTER TABLE BATTERY ADD CONSTRAINT PK_BATTERY PRIMARY KEY (
	BAT_CODE
);

ALTER TABLE USER ADD CONSTRAINT PK_USER PRIMARY KEY (
	USER_NO
);

ALTER TABLE BOARD ADD CONSTRAINT PK_BOARD PRIMARY KEY (
	BNO
);

ALTER TABLE COMMENT ADD CONSTRAINT PK_COMMENT PRIMARY KEY (
	CNO
);

ALTER TABLE SUBCOMMENT ADD CONSTRAINT PK_SUBCOMMENT PRIMARY KEY (
	SNO
);

ALTER TABLE REVIEW ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	RE_NO
);

ALTER TABLE COMPARE ADD CONSTRAINT PK_COMPARE PRIMARY KEY (
	COM_NO
);

ALTER TABLE REVIEW_LIKE ADD CONSTRAINT PK_REVIEW_LIKE PRIMARY KEY (
	LIKE_NO,
	LIKE_RNO,
	LIKE_UNO
);

ALTER TABLE COM_COMM ADD CONSTRAINT PK_COM_COMM PRIMARY KEY (
	CC_NO
);

ALTER TABLE CALENDAR ADD CONSTRAINT PK_CALENDAR PRIMARY KEY (
	CAL_NO
);

ALTER TABLE USER_STATUS ADD CONSTRAINT PK_USER_STATUS PRIMARY KEY (
	STATUS_CODE
);

ALTER TABLE REPORT ADD CONSTRAINT PK_REPORT PRIMARY KEY (
	REPORT_NO
);

ALTER TABLE CON_STATUS ADD CONSTRAINT PK_CON_STATUS PRIMARY KEY (
	STATUS_CODE
);

ALTER TABLE B_CODE ADD CONSTRAINT PK_B_CODE PRIMARY KEY (
	BCODE
);

ALTER TABLE CAL_TYPE ADD CONSTRAINT PK_CAL_TYPE PRIMARY KEY (
	CAL_CODE
);

ALTER TABLE MOBILE_LIKE ADD CONSTRAINT PK_MOBILE_LIKE PRIMARY KEY (
	LIKE_NO,
	LIKE_UNO,
	LIKE_MNO
);

ALTER TABLE MOBILE_DETAIL ADD CONSTRAINT PK_MOBILE_DETAIL PRIMARY KEY (
	MO_NO
);

ALTER TABLE MOBILE ADD CONSTRAINT FK_BRAND_TO_MOBILE_1 FOREIGN KEY (
	MO_BRANDCODE
)
REFERENCES BRAND (
	BRAND_CODE
);

ALTER TABLE USER ADD CONSTRAINT FK_USER_STATUS_TO_USER_1 FOREIGN KEY (
	USER_STATUS
)
REFERENCES USER_STATUS (
	STATUS_CODE
);

ALTER TABLE USER ADD CONSTRAINT FK_MOBILE_TO_USER_1 FOREIGN KEY (
	USER_MNO
)
REFERENCES MOBILE (
	MO_NO
);

ALTER TABLE BOARD ADD CONSTRAINT FK_B_CODE_TO_BOARD_1 FOREIGN KEY (
	BCODE
)
REFERENCES B_CODE (
	BCODE
);

ALTER TABLE BOARD ADD CONSTRAINT FK_USER_TO_BOARD_1 FOREIGN KEY (
	BWRITER
)
REFERENCES USER (
	USER_NO
);

ALTER TABLE BOARD ADD CONSTRAINT FK_CON_STATUS_TO_BOARD_1 FOREIGN KEY (
	BSTATUS
)
REFERENCES CON_STATUS (
	STATUS_CODE
);

ALTER TABLE COMMENT ADD CONSTRAINT FK_USER_TO_COMMENT_1 FOREIGN KEY (
	CWRITER
)
REFERENCES USER (
	USER_NO
);

ALTER TABLE COMMENT ADD CONSTRAINT FK_CON_STATUS_TO_COMMENT_1 FOREIGN KEY (
	CSTATUS
)
REFERENCES CON_STATUS (
	STATUS_CODE
);

ALTER TABLE COMMENT ADD CONSTRAINT FK_BOARD_TO_COMMENT_1 FOREIGN KEY (
	BNO
)
REFERENCES BOARD (
	BNO
);

ALTER TABLE SUBCOMMENT ADD CONSTRAINT FK_USER_TO_SUBCOMMENT_1 FOREIGN KEY (
	SWRITER
)
REFERENCES USER (
	USER_NO
);

ALTER TABLE SUBCOMMENT ADD CONSTRAINT FK_CON_STATUS_TO_SUBCOMMENT_1 FOREIGN KEY (
	SSTATUS
)
REFERENCES CON_STATUS (
	STATUS_CODE
);

ALTER TABLE SUBCOMMENT ADD CONSTRAINT FK_COMMENT_TO_SUBCOMMENT_1 FOREIGN KEY (
	CNO
)
REFERENCES COMMENT (
	CNO
);

ALTER TABLE REVIEW ADD CONSTRAINT FK_USER_TO_REVIEW_1 FOREIGN KEY (
	RE_WRITER
)
REFERENCES USER (
	USER_NO
);

ALTER TABLE REVIEW ADD CONSTRAINT FK_MOBILE_TO_REVIEW_1 FOREIGN KEY (
	RE_MNO
)
REFERENCES MOBILE (
	MO_NO
);

ALTER TABLE REVIEW ADD CONSTRAINT FK_CON_STATUS_TO_REVIEW_1 FOREIGN KEY (
	RE_STATUS
)
REFERENCES CON_STATUS (
	STATUS_CODE
);

ALTER TABLE COMPARE ADD CONSTRAINT FK_MOBILE_TO_COMPARE_1 FOREIGN KEY (
	COM_MNO1
)
REFERENCES MOBILE (
	MO_NO
);

ALTER TABLE COMPARE ADD CONSTRAINT FK_MOBILE_TO_COMPARE_2 FOREIGN KEY (
	COM_MNO2
)
REFERENCES MOBILE (
	MO_NO
);

ALTER TABLE REVIEW_LIKE ADD CONSTRAINT FK_REVIEW_TO_REVIEW_LIKE_1 FOREIGN KEY (
	LIKE_RNO
)
REFERENCES REVIEW (
	RE_NO
);

ALTER TABLE REVIEW_LIKE ADD CONSTRAINT FK_USER_TO_REVIEW_LIKE_1 FOREIGN KEY (
	LIKE_UNO
)
REFERENCES USER (
	USER_NO
);

ALTER TABLE COM_COMM ADD CONSTRAINT FK_CON_STATUS_TO_COM_COMM_1 FOREIGN KEY (
	CC_STATUS
)
REFERENCES CON_STATUS (
	STATUS_CODE
);

ALTER TABLE COM_COMM ADD CONSTRAINT FK_USER_TO_1 FOREIGN KEY (
	CC_WIRTER
)
REFERENCES USER_TABLE (
	USER_NO
);

ALTER TABLE COM_COMM ADD CONSTRAINT FK_COMPARE_TO_COM_COMM_1 FOREIGN KEY (
	CC_CNO
)
REFERENCES COMPARE (
	COM_NO
);

ALTER TABLE CALENDAR ADD CONSTRAINT FK_CAL_TYPE_TO_CALENDAR_1 FOREIGN KEY (
	CAL_CODE
)
REFERENCES CAL_TYPE (
	CAL_CODE
);

ALTER TABLE REPORT ADD CONSTRAINT FK_USER_TO_REPORT_1 FOREIGN KEY (
	REPORT_WRI
)
REFERENCES USER (
	USER_NO
);

ALTER TABLE REPORT ADD CONSTRAINT FK_USER_TO_REPORT_2 FOREIGN KEY (
	REPORT_USER
)
REFERENCES USER (
	USER_NO
);

ALTER TABLE MOBILE_LIKE ADD CONSTRAINT FK_USER_TO_MOBILE_LIKE_1 FOREIGN KEY (
	LIKE_UNO
)
REFERENCES USER (
	USER_NO
);

ALTER TABLE MOBILE_LIKE ADD CONSTRAINT FK_MOBILE_TO_MOBILE_LIKE_1 FOREIGN KEY (
	LIKE_MNO
)
REFERENCES MOBILE (
	MO_NO
);

ALTER TABLE MOBILE_DETAIL ADD CONSTRAINT FK_MOBILE_TO_MOBILE_DETAIL_1 FOREIGN KEY (
	MO_NO
)
REFERENCES MOBILE (
	MO_NO
);

ALTER TABLE MOBILE_DETAIL ADD CONSTRAINT FK_BRAND_TO_MOBILE_DETAIL_1 FOREIGN KEY (
	MO_BRANDCODE
)
REFERENCES BRAND (
	BRAND_CODE
);

ALTER TABLE MOBILE_DETAIL ADD CONSTRAINT FK_OS_TO_MOBILE_DETAIL_1 FOREIGN KEY (
	MO_OSCODE
)
REFERENCES OS (
	OS_CODE
);

ALTER TABLE MOBILE_DETAIL ADD CONSTRAINT FK_BATTERY_TO_MOBILE_DETAIL_1 FOREIGN KEY (
	MO_BATCODE
)
REFERENCES BATTERY (
	BAT_CODE
);

DELETE BRAND;

DROP SEQUENCE BRAND_SEQ;
CREATE SEQUENCE BRAND_SEQ NOCACHE;

INSERT INTO BRAND VALUES(BRAND_SEQ.NEXTVAL, '?¼?±? ?');
INSERT INTO BRAND VALUES(BRAND_SEQ.NEXTVAL, 'LG? ?');
INSERT INTO BRAND VALUES(BRAND_SEQ.NEXTVAL, '? ?');
INSERT INTO BRAND VALUES(BRAND_SEQ.NEXTVAL, '?¬?');
INSERT INTO BRAND VALUES(BRAND_SEQ.NEXTVAL, 'HTC');
INSERT INTO BRAND VALUES(BRAND_SEQ.NEXTVAL, 'ëª¨í ë¡ë¼');
INSERT INTO BRAND VALUES(BRAND_SEQ.NEXTVAL, 'KT Tech');
INSERT INTO BRAND VALUES(BRAND_SEQ.NEXTVAL, 'SK ?? ??¤');
INSERT INTO BRAND VALUES(BRAND_SEQ.NEXTVAL, '?? ëª¨ë°?¼');
INSERT INTO BRAND VALUES(BRAND_SEQ.NEXTVAL, '?¸?¤?');

CREATE SEQUENCE OS_SEQ NOCACHE;

INSERT INTO OS VALUES(OS_SEQ.NEXTVAL, '??ë¡ì´?');
INSERT INTO OS VALUES(OS_SEQ.NEXTVAL, 'iOS');

DROP TABLE BATTERY CASCADE CONSTRAINTS; 
ALTER TABLE MOBILE_DETAIL DROP COLUMN MO_BATCODE;

ALTER TABLE MOBILE ADD (MO_NAME_EN VARCHAR2(100));
ALTER TABLE MOBILE_DETAIL DROP COLUMN MO_BRANDCODE;

CREATE OR REPLACE VIEW MOBILE_VIEW AS
    SELECT A.MO_NO NO, A.MO_CODE ëª¨ë¸ë²í¸, A.MO_NAME ? ?ëª?, A.MO_NAME_EN ? ?ëª?(??´), C.BRAND_NAME BRAND, B.MO_RELEASE ë°ë§¤?¼,
        D.OS_NAME OS?´ë¦?, B.MO_OSVER OSë²ì ¼, B.MO_MATERIAL ì£¼ì?¬ì§?, B.MO_SIZE ?¬ê¸?, B.MO_WEIGHT ë¬´ê²,
        B.MO_LINK ?°ê²°ë¨?, B.MO_INCH ?¡? ?¬ê¸?, B.MO_RESOL ?ë©´í´??, B.MO_PIXEL ?½???¸ì¹?, B.MO_DISTYPE ?ë©´í??,
        B.MO_DISWIDTH ?ë©´í­, B.MO_DISHEIGHT ?ë©´ë?´, B.MO_AP AP, B.MO_CPU CPU, B.MO_CPUCORE CPUì½ì´,
        B.MO_CPUCLOCK CPU?´?­, B.MO_GPU GPU, B.MO_RAM RAM, B.MO_INMEMO ?´?¥ë©ëª¨ë¦?, B.MO_OUTMEMO ?¸?¥ë©ëª¨ë¦?,
        B.MO_SENSOR ì¹´ë©?¼?¼?, B.MO_IRIS ì¹´ë©?¼ì¡°ë¦¬ê°?, B.MO_FLASH ì¹´ë©?¼???¬, B.MO_PICRESOL ?¬ì§í´??,
        B.MO_VIDRESOL ???¹??´??, B.MO_VIDFRAME ???¹??? ?, B.MO_FRESOL ? ë©´ì¬ì§í´??,
        B.MO_FVIDRESOL ? ë©´ë¹??´??, B.MO_FVIDREAME ? ë©´ë¹??? ?,
        B.MO_CAMERA ì¹´ë©?¼, B.MO_MAH ë°°í°ë¦?, B.MO_BATTYPE ë°°í°ë¦¬í??, 
        B.MO_FASTCHAR ê³ ìì¶©ì , B.MO_REMOVEBAT ?ì°©ì¬ë¶?, B.MO_WIRELESS ë¬´ì ì¶©ì , B.MO_STANDBY ??ê¸°ìê°?,
        B.MO_PROTOCOL ?µ? ê·ê²©, B.MO_WIFI WIFI, B.MO_BLUETOOTH ë¸ë£¨?¬?¤, B.MO_USB USBë²ì ¼, B.MO_BIO ?ì²´ì¸?,
        B.MO_PAYMENT ëª¨ë°?¼ê²°ì , B.MO_VERIFY ?¸ì¦?, B.MO_ETC ETC, B.MO_STATUS STATUS,
        E.MI_FRONTNAME ? ë©´ì´ë¯¸ì?, E.MI_BACKNAME ?ë©´ì´ë¯¸ì?, E.MI_PATH ???¥ê²½ë¡
FROM MOBILE A
JOIN BRAND C ON (MO_BRANDCODE = BRAND_CODE)
JOIN MOBILE_DETAIL B ON ( A.MO_NO = B.MO_NO )
JOIN OS D ON ( MO_OSCODE = D.OS_CODE )
LEFT JOIN MOBILE_IMAGE E ON (A.MO_NO = E.REF_MO_NO);

SELECT A.MO_NO NO, A.MO_CODE ëª¨ë¸ë²í¸, A.MO_NAME ? ?ëª?, A.MO_NAME_EN ? ?ëª?(??´), C.BRAND_NAME ? ì¡°ì¬, B.MO_RELEASE ë°ë§¤?¼,
        D.OS_NAME OS?´ë¦?, B.MO_OSVER OSë²ì ¼, B.MO_MATERIAL ì£¼ì?¬ì§?, B.MO_SIZE ?¬ê¸?, B.MO_WEIGHT ë¬´ê²,
        B.MO_LINK ?°ê²°ë¨?, B.MO_INCH ?¡? ?¬ê¸?, B.MO_RESOL ?ë©´í´??, B.MO_PIXEL ?½???¸ì¹?, B.MO_DISTYPE ?ë©´í??,
        B.MO_DISWIDTH ?ë©´í­, B.MO_DISHEIGHT ?ë©´ë?´, B.MO_AP AP, B.MO_CPU CPU, B.MO_CPUCORE CPUì½ì´,
        B.MO_CPUCLOCK CPU?´?­, B.MO_GPU GPU, B.MO_RAM RAM, B.MO_INMEMO ?´?¥ë©ëª¨ë¦?, B.MO_OUTMEMO ?¸?¥ë©ëª¨ë¦?,
        B.MO_SENSOR ì¹´ë©?¼?¼?, B.MO_IRIS ì¹´ë©?¼ì¡°ë¦¬ê°?, B.MO_FLASH ì¹´ë©?¼???¬, B.MO_PICRESOL ?¬ì§í´??,
        B.MO_VIDRESOL ???¹??´??, B.MO_VIDFRAME ???¹??? ?, B.MO_FRESOL ? ë©´ì¬ì§í´??,
        B.MO_FVIDRESOL ? ë©´ë¹??´??, B.MO_FVIDREAME ? ë©´ë¹??? ?,
        B.MO_CAMERA ì¹´ë©?¼, B.MO_MAH ë°°í°ë¦?, B.MO_BATTYPE ë°°í°ë¦¬í??, 
        B.MO_FASTCHAR ê³ ìì¶©ì , B.MO_REMOVEBAT ?ì°©ì¬ë¶?, B.MO_WIRELESS ë¬´ì ì¶©ì , B.MO_STANDBY ??ê¸°ìê°?,
        B.MO_PROTOCOL ?µ? ê·ê²©, B.MO_WIFI WIFI, B.MO_BLUETOOTH ë¸ë£¨?¬?¤, B.MO_USB USBë²ì ¼, B.MO_BIO ?ì²´ì¸?,
        B.MO_PAYMENT ëª¨ë°?¼ê²°ì , B.MO_VERIFY ?¸ì¦?, B.MO_ETC ETC, B.MO_STATUS STATUS,
        E.MI_FRONTNAME ? ë©´ì´ë¯¸ì?, E.MI_BACKNAME ?ë©´ì´ë¯¸ì?, E.MI_PATH ???¥ê²½ë¡
FROM MOBILE A
JOIN BRAND C ON (MO_BRANDCODE = BRAND_CODE)
JOIN MOBILE_DETAIL B ON ( A.MO_NO = B.MO_NO )
JOIN OS D ON ( MO_OSCODE = D.OS_CODE )
LEFT JOIN MOBILE_IMAGE E ON (A.MO_NO = E.REF_MO_NO);

SELECT * FROM MOBILE_VIEW;



CREATE OR REPLACE VIEW MOBILE_INSERT AS
SELECT A.MO_NO NO, A.MO_CODE ëª¨ë¸ë²í¸, A.MO_NAME ? ?ëª?, A.MO_NAME_EN ? ?ëª?(??´), A.MO_BRANDCODE ? ì¡°ì¬ì½ë, B.MO_RELEASE ë°ë§¤?¼,
        B.MO_OSCODE OSì½ë, B.MO_OSVER OSë²ì ¼, B.MO_MATERIAL ì£¼ì?¬ì§?, B.MO_SIZE ?¬ê¸?, B.MO_WEIGHT ë¬´ê²,
        B.MO_LINK ?°ê²°ë¨?, B.MO_INCH ?¡? ?¬ê¸?, B.MO_RESOL ?ë©´í´??, B.MO_PIXEL ?½???¸ì¹?, B.MO_DISTYPE ?ë©´í??,
        B.MO_DISWIDTH ?ë©´í­, B.MO_DISHEIGHT ?ë©´ë?´, B.MO_AP AP, B.MO_CPU CPU, B.MO_CPUCORE CPUì½ì´,
        B.MO_CPUCLOCK CPU?´?­, B.MO_GPU GPU, B.MO_RAM RAM, B.MO_INMEMO ?´?¥ë©ëª¨ë¦?, B.MO_OUTMEMO ?¸?¥ë©ëª¨ë¦?,
        B.MO_SENSOR ì¹´ë©?¼?¼?, B.MO_IRIS ì¹´ë©?¼ì¡°ë¦¬ê°?, B.MO_FLASH ì¹´ë©?¼???¬, B.MO_PICRESOL ?¬ì§í´??,
        B.MO_VIDRESOL ???¹??´??, B.MO_VIDFRAME ???¹??? ?, B.MO_FRESOL ? ë©´ì¬ì§í´??,
        B.MO_FVIDRESOL ? ë©´ë¹??´??, B.MO_FVIDREAME ? ë©´ë¹??? ?,
        B.MO_CAMERA ì¹´ë©?¼, B.MO_MAH ë°°í°ë¦?, B.MO_BATTYPE ë°°í°ë¦¬í??, 
        B.MO_FASTCHAR ê³ ìì¶©ì , B.MO_REMOVEBAT ?ì°©ì¬ë¶?, B.MO_WIRELESS ë¬´ì ì¶©ì , B.MO_STANDBY ??ê¸°ìê°?,
        B.MO_PROTOCOL ?µ? ê·ê²©, B.MO_WIFI WIFI, B.MO_BLUETOOTH ë¸ë£¨?¬?¤, B.MO_USB USBë²ì ¼, B.MO_BIO ?ì²´ì¸?,
        B.MO_PAYMENT ëª¨ë°?¼ê²°ì , B.MO_VERIFY ?¸ì¦?, B.MO_ETC ETC, B.MO_STATUS ??ì½ë

FROM MOBILE A
JOIN BRAND C ON (MO_BRANDCODE = BRAND_CODE)
JOIN MOBILE_DETAIL B ON ( A.MO_NO = B.MO_NO );

DROP VIEW MOBILE_INSERT;

DELETE MOBILE_DETAIL;

INSERT INTO MOBILE VALUES (0, 'TEST', 'TEST', 1, 'TEST');
INSERT INTO MOBILE_DETAIL VALUES (0, SYSDATE, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 0, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST',
'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST',
'TEST', 'TEST', 0, 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 1,
'TEST', 'TEST');

ALTER TABLE MOBILE_DETAIL MODIFY(MO_INCH NUMBER);
ALTER TABLE MOBILE_DETAIL DROP COLUMN MO_BATFEATURE;
ALTER TABLE MOBILE_DETAIL ADD(MO_FASTCHAR VARCHAR2(100));
ALTER TABLE MOBILE_DETAIL ADD(MO_REMOVEBAT VARCHAR2(100));
ALTER TABLE MOBILE_DETAIL MODIFY(MO_RELEASE DATE);
ALTER TABLE MOBILE_DETAIL MODIFY(MO_MAH NUMBER);

CREATE SEQUENCE MOB_SEQ NOCACHE;
DELETE MOBILE_DETAIL WHERE MO_NO=6;
DELETE MOBILE CASCADE WHERE MO_NO=6 ;

SELECT 'DROP TABLE ' || TABLE_NAME || ' CASCADE CONSTRAINTS;' FROM user_tables;

DROP TABLE MOBILE CASCADE CONSTRAINTS;
DROP TABLE BRAND CASCADE CONSTRAINTS;
DROP TABLE OS CASCADE CONSTRAINTS;
DROP TABLE USER CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE COMMENT CASCADE CONSTRAINTS;
DROP TABLE SUBCOMMENT CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE COMPARE CASCADE CONSTRAINTS;
DROP TABLE REVIEW_LIKE CASCADE CONSTRAINTS;
DROP TABLE COM_COMM CASCADE CONSTRAINTS;
DROP TABLE CALENDAR CASCADE CONSTRAINTS;
DROP TABLE USER_STATUS CASCADE CONSTRAINTS;
DROP TABLE REPORT CASCADE CONSTRAINTS;
DROP TABLE CON_STATUS CASCADE CONSTRAINTS;
DROP TABLE B_CODE CASCADE CONSTRAINTS;
DROP TABLE CAL_TYPE CASCADE CONSTRAINTS;
DROP TABLE MOBILE_LIKE CASCADE CONSTRAINTS;
DROP TABLE MOBILE_DETAIL CASCADE CONSTRAINTS;

SELECT * FROM (SELECT ROWNUM RNUM, M.* FROM (SELECT * FROM MOBILE_VIEW WHERE STATUS = 'Y' and brand in ('? ?') ORDER BY 1 DESC) M ) WHERE RNUM BETWEEN 1 AND 10;

BEGIN
    FOR I IN 1..500
    LOOP
        INSERT INTO MOBILE VALUES (MOB_SEQ.NEXTVAL, I||'CODE', I||'??¤?¸?´ë¦?',  ROUND(DBMS_RANDOM.VALUE(1,10)), I||'TESTNAME');
        INSERT INTO MOBILE_DETAIL VALUES (MOB_SEQ.CURRVAL, SYSDATE, 'VER', 'TEST', 'TEST', 'TEST', 'TEST',  ROUND(DBMS_RANDOM.VALUE(4,9)), 'TEST', 'TEST', 'TEST', 'TEST', 'TEST',
'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST',
'TEST', 'TEST',  ROUND(DBMS_RANDOM.VALUE(500,5000)), 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', ROUND(DBMS_RANDOM.VALUE(1,2)),
'TEST', 'TEST');
    END LOOP;
END;
/

SELECT ROUND(DBMS_RANDOM.VALUE(1,2)) FROM DUAL;
UPDATE mobile_detail SET MO_STATUS = 'Y' WHERE MO_NO > 50;

COMMIT;
SELECT * FROM (SELECT ROWNUM RNUM, M.* FROM (SELECT * FROM MOBILE_VIEW WHERE STATUS = 'Y' AND brand IN ( '?¼?±? ?','LG? ?'  ) ORDER BY 1 DESC) M ) WHERE RNUM BETWEEN 1 AND 10;

CREATE TABLE MO_COMM (
	MCO_NO	NUMBER		NOT NULL,
	MCO_CONTENT	VARCHAR2(4000)		NULL,
	MCO_REGDATE	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	MCO_MODIDATE	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
	MO_NO	NUMBER		NOT NULL,
	MCO_USERNO	NUMBER		NOT NULL,
	MCO_STATUS	NUMBER		NOT NULL
);

ALTER TABLE MO_COMM ADD CONSTRAINT PK_MO_COMM PRIMARY KEY (
	MCO_NO
);

ALTER TABLE MO_COMM ADD CONSTRAINT FK_MOBILE_TO_MO_COMM_1 FOREIGN KEY (
	MO_NO
)
REFERENCES MOBILE (
	MO_NO
);
ALTER TABLE MO_COMM ADD CONSTRAINT FK_USER_TABLE_TO_MO_COMM_1 FOREIGN KEY (
	MCO_USERNO
)
REFERENCES USER_TABLE (
	USER_NO
);

ALTER TABLE MO_COMM ADD CONSTRAINT FK_CON_STATUS_TO_MO_COMM_1 FOREIGN KEY (
	MCO_STATUS
)
REFERENCES CON_STATUS (
	STATUS_CODE
);

INSERT INTO MO_COMM VALUES( 0, '?ê¸???¤?¸', DEFAULT, DEFAULT, 0, 0, 1);


INSERT INTO CON_STATUS VALUES( 1, '?¼ë°?');
INSERT INTO CON_STATUS VALUES( 2, '?­? ');
INSERT INTO CON_STATUS VALUES( 3, '? ê³ ì ?¬');

INSERT INTO USER_STATUS VALUES( 0, 'TEST');

SELECT * FROM MO_COMM WHERE MCO_STATUS = 1;

INSERT INTO USER_TABLE VALUES(0, 'admin', '1234', 'admin', null, sysdate, sysdate, 'Y', default, null, null, 0);

CREATE SEQUENCE SEQ_MOCTEST NOCACHE;

BEGIN
    FOR I IN 1..100
    LOOP
        INSERT INTO MO_COMM VALUES (SEQ_MOCTEST.NEXTVAL, I||'ë²ì§¸ ?ê¸?', DEFAULT, DEFAULT, ROUND(DBMS_RANDOM.VALUE(1,25))*2, 0, 1);
       
    END LOOP;
END;
/
COMMIT;

SELECT ROUND(DBMS_RANDOM.VALUE(3,50)) FROM DUAL;

--- ëª¨ë°?¼ ?ê¸? + ? ?? ??´ë¸?
SELECT MCO_NO, MCO_CONTENT, MCO_REGDATE, MO_NO, MCO_USERNO, USER_NAME, MCO_STATUS FROM MO_COMM 
JOIN USER_TABLE ON ( MCO_USERNO = USER_NO ) WHERE MO_NO = 40;

--- ëª¨ë°?¼ ?ê¸? + ? ????´ë¸? ë·? ??±
CREATE OR REPLACE VIEW MOBILE_COMMENT_VIEW AS
SELECT MCO_NO, MCO_CONTENT, MCO_REGDATE, MO_NO, MCO_USERNO, USER_NAME, MCO_STATUS FROM MO_COMM 
JOIN USER_TABLE ON ( MCO_USERNO = USER_NO );

---- ëª¨ë°?¼ ?ê¸? ë·? ??¤?¸
SELECT m.*, (SELECT COUNT(*) FROM REPORT_TABLE WHERE REPORT_WRI = 0 AND REPORT_CONNO = MCO_NO ) I_REPORT FROM MOBILE_COMMENT_VIEW m WHERE MO_NO = 42;

UPDATE MO_COMM SET MCO_STATUS = 2, MCO_MODIDATE = SYSTIMESTAMP WHERE MCO_NO = 0;
SELECT * FROM MOBILE_COMMENT_VIEW WHERE MCO_STATUS = 1 AND MCO_NO = 123;
UPDATE MO_COMM SET MCO_CONTENT = 'AAA', MCO_MODIDATE = SYSTIMESTAMP WHERE MCO_STATUS = 1 AND MCO_NO = 123;
DELETE FROM USER_TABLE WHERE USER_NO = 6;
COMMIT;

INSERT INTO REVIEW VALUES (0, 'TEST REVIEW', 'TEST REVEIW', 4, SYSDATE, SYSDATE, 0, 0, 0, 1 );
CREATE SEQUENCE SEQ_REV NOCACHE;
BEGIN
    FOR I IN 1..100
    LOOP
        INSERT INTO REVIEW VALUES (SEQ_REV.NEXTVAL, I||'ë²ì§¸ ë¦¬ë·°',  I||'ë²ì§¸ ë¦¬ë·° ?´?©', ROUND(DBMS_RANDOM.VALUE(1,10))*0.5, SYSDATE, SYSDATE, 0, 0, ROUND(DBMS_RANDOM.VALUE(2,50)), 1);
       
    END LOOP;
END;
/

SELECT * FROM REVIEW WHERE RE_MNO = 50;
---------------- ëª¨ë°?¼ ë¦¬ë·° + ëª¨ë°?¼ ì¢ì?---ë¦¬ë·°ë³?  ì¢ì? ê°?? ?¸ê¸?
SELECT * FROM COUNT_REVIEW_LIKE;

------------ ì¢ì? ê°?? ë·°ì?±
CREATE OR REPLACE VIEW COUNT_REVIEW_LIKE AS
SELECT RE_NO, COUNT(LIKE_NO) COUNT_L FROM REVIEW R
JOIN REVIEW_LIKE ON ( RE_NO = LIKE_RNO )
GROUP BY RE_NO;



----------------- ë¦¬ë·° ì¡°í?© ë·? ??±
CREATE OR REPLACE VIEW MOBILE_REVIEW AS
SELECT RE_NO, RE_TITLE, RE_CONTENT, RE_STAR, RE_REGDATE, RE_MODIDATE, COUNT_L, RE_WRITER, USER_NAME, RE_MNO, RE_STATUS
FROM REVIEW
LEFT JOIN COUNT_REVIEW_LIKE USING ( RE_NO )
JOIN USER_TABLE ON  ( RE_WRITER = USER_NO );

--------------------- ë¦¬ë·° ì¡°í?© ??êµ¬ë¬¸
SELECT RE_NO, RE_TITLE, RE_CONTENT, RE_STAR, RE_REGDATE, RE_MODIDATE, (SELECT COUNT(*) FROM REVIEW_LIKE WHERE LIKE_UNO = 0 GROUP BY LIKE_RNO) IM_LIKE, COUNT_L, RE_WRITER, USER_NAME, RE_MNO, RE_STATUS FROM MOBILE_REVIEW M ;
SELECT RE_NO, RE_TITLE, RE_CONTENT, RE_STAR, RE_REGDATE, RE_MODIDATE, (SELECT COUNT(*) FROM REVIEW_LIKE WHERE LIKE_UNO = 0 and re_no=like_rno GROUP BY LIKE_RNO) IM_LIKE, COUNT_L, RE_WRITER, USER_NAME, RE_MNO, RE_STATUS, (SELECT COUNT(*) FROM REPORT_TABLE WHERE REPORT_WRI = 0 AND RE_NO = REPORT_CONNO) I_REPORT  FROM MOBILE_REVIEW M WHERE RE_MNO = 51 ORDER BY 1 DESC;



----------------- USER_TABLE ê°? ?°?´?° ?£ê¸?
BEGIN
    FOR I IN 1..100
    LOOP
        INSERT INTO USER_TABLE VALUES (
            SEQ_UNO.NEXTVAL,
            'test'||I||'@test.co.kr',
           '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==',
            'test'||I, NULL, SYSDATE, SYSDATE, 'Y', 1, NULL, NULL, 1, NULL);
    END LOOP;
END;
/
commit;
INSERT INTO USER_TABLE  VALUES ( SEQ_UNO.NEXTVAL, 'test01@test.co.kr', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', 'test1', NULL, SYSDATE, SYSDATE, 'Y', 1, NULL, NULL, 1, NULL);

-------------------------- ë¦¬ë·° ì¢ì? ??´ë¸? insertë¬? ?? 


----------------------------------- ë¦¬ë·° ??´ë¸? insert ë¬? ?? 
INSERT INTO REVIEW VALUES (SEQ_REV.NEXTVAL, ?, ?, ?, SYSDATE, SYSDATE, 0, ?, ?, 1);

-------------------------------- ë¦¬ë·° ??´ë¸? ?­?  updateë¬? ?? 
UPDATE REVIEW SET RE_STATUS = '2' WHERE ;

------------------------------------ ë¦¬ë·° select ë¬? ?? 
SELECT * FROM REVIEW WHERE RE_STATUS = 1 AND RE_NO = 3;

--- ------------- ë¦¬ë·°UPDATEë¬? ?? 
UPDATE REVIEW SET RE_TITLE = 'AAA', RE_CONTENT = 'AAA', RE_STAR = 6 WHERE RE_NO = 3 AND RE_STATUS = 1;

-------------------COMPARE ?© SEQUENCE ??±
CREATE SEQUENCE SEQ_MCP NOCACHE;

SELECT COUNT(*) FROM COMPARE WHERE COM_MNO1 = 0 AND COM_MNO2 = 1;

------------------------ ??¤?¨ ë·?
CREATE OR REPLACE VIEW MYBOARD
AS
SELECT ROWNUM RNUM, BNO, BTITLE, BCONTENT, BCOUNT, TO_CHAR(BREGDATE,'yyyy-mm-dd hh:mi:ss') BREGDATE,TO_CHAR(BMODIDATE,'yyyy-mm-dd hh:mi:ss') BMODIDATE, BCODE, BWRITER, BSTATUS, BCATEGORY FROM BOARD WHERE BSTATUS = 1 ORDER BY 1 DESC;

SELECT * FROM MYBOARD WHERE BWRITER = 1;

SELECT M.*,(SELECT COUNT(*) FROM COMMENTT C WHERE C.BNO = M.BNO) COMM_COUNT FROM MYBOARD M;

CREATE OR REPLACE VIEW MYBOARDLIST
AS;
SELECT ROWNUM RRNUM, M.*,(SELECT COUNT(*) FROM COMMENTT C WHERE C.BNO = M.BNO) COMM_COUNT FROM MYBOARD M WHERE BWRITER = 1;

SELECT * FROM MYBOARDLIST WHERE BWRITER = 1 ;

SELECT * FROM (SELECT ROWNUM RRNUM, M.*,(SELECT COUNT(*) FROM COMMENTT C WHERE C.BNO = M.BNO) COMM_COUNT FROM MYBOARD M WHERE BWRITER = ?) WHERE RRNUM BETWEEN ? AND ?;


------------------------------ COMPARE ??´ë¸? INSERT êµ¬ë¬¸ ??
INSERT INTO COMPARE VALUES(SEQ_MCP.NEXTVAL, 0, 4, 5);
---------------------------- COMPARE ??´ë¸? UPDATE êµ¬ë¬¸ ??
UPDATE COMPARE SET COM_COUNT = COM_COUNT +1 WHERE COM_MNO1 = ? AND COM_MNO2 = ?;

--------------------------- ??´ ??¤?¸? ? ???¤ ??´ë¦¬ê¸°
UPDATE USER_TABLE SET USER_STATUS = 1 WHERE USER_NO > 0;
COMMIT;

--------------------------- ë¹êµ ?ê¸? ë·? ë§ë¤ê¸?
CREATE OR REPLACE VIEW COMPARE_COMMENT_VIEW
AS
SELECT CC_NO, CC_CONTENT, CC_REGDATE, CC_MODIDATE, CC_STATUS, CC_WIRTER, USER_NAME, CC_CNO
FROM COM_COMM
LEFT JOIN USER_TABLE ON ( CC_WIRTER = USER_NO );

--------------------------- ë¹êµ ?ê¸??© ????¤ ??±
CREATE SEQUENCE SEQ_MCC NOCACHE;
INSERT INTO COM_COMM VALUES (SEQ_MCC.NEXTVAL, ? ,DEFAULT, DEFAULT, ?, ?, 1);

delete compare where com_no in (4, 6,7,8, 9);

drop table com_comm;

---------------------------- ëª¨ë°?¼ ?´ë¯¸ì??© ??´ë¸? ?? 
DROP TABLE MOBILE_IMAGE;
CREATE TABLE MOBILE_IMAGE (
	REF_MO_NO	NUMBER		NOT NULL,
	MI_FRONTNAME	VARCHAR2(4000)		NULL,
	MI_BACKNAME	VARCHAR2(4000)		NULL,
	MI_PATH	VARCHAR2(4000)		NULL,
	MI_UPDATE	DATE	DEFAULT SYSDATE	NULL
);

ALTER TABLE MOBILE_IMAGE ADD CONSTRAINT PK_MOBILE_IMAGE PRIMARY KEY (
	REF_MO_NO
);

ALTER TABLE MOBILE_IMAGE ADD CONSTRAINT FK_M_DETAIL_TO_M_IMAGE_1 FOREIGN KEY (
	REF_MO_NO
)
REFERENCES MOBILE_DETAIL (
	MO_NO
);

SELECT * FROM MOBILE_VIEW WHERE NO = 10 AND STATUS = 'Y';

drop table report;

CREATE TABLE REPORT (
	REPORT_NO	NUMBER		NOT NULL,
	REPORT_TITLE	VARCHAR2(100)		NULL,
	REPORT_CONT	VARCHAR2(4000)		NULL,
	REPORT_CONNO	NUMBER		NULL,
	REPORT_DATE	DATE		NULL,
	REPORT_RESULT	CLOB		NULL,
	REPORT_WRI	number		NOT NULL,
	REPORT_USER	number		NOT NULL,
	REPORT_REF_NO	NUMBER		NOT NULL
);

CREATE TABLE REPORT_TYPE (
	R_REF_NO	NUMBER		NOT NULL,
	R_REF_NAME	VARCHAR2(100)		NULL
);

ALTER TABLE REPORT ADD CONSTRAINT PK_REPORT PRIMARY KEY (
	REPORT_NO
);

ALTER TABLE REPORT ADD CONSTRAINT FK_USER_TABLE_TO_REPORT_1 FOREIGN KEY (
	REPORT_WRI
)
REFERENCES USER_TABLE (
	USER_NO
);

ALTER TABLE REPORT ADD CONSTRAINT FK_USER_TABLE_TO_REPORT_2 FOREIGN KEY (
	REPORT_USER
)
REFERENCES USER_TABLE (
	USER_NO
);

ALTER TABLE REPORT_TYPE ADD CONSTRAINT PK_REPORT_TYPE PRIMARY KEY (
	R_REF_NO
);


ALTER TABLE REPORT ADD CONSTRAINT FK_REPORT_TYPE_TO_REPORT_1 FOREIGN KEY (
	REPORT_REF_NO
)
REFERENCES REPORT_TYPE (
	R_REF_NO
);

alter table REPORT DROP column REPORT_TITLE;
alter table report rename to REPORT_TABLE;
commit;

-------------------------- ? ê³ ê²?? insert ?? 
CREATE SEQUENCE SEQ_REP NOCACHE;
INSERT INTO REPORT VALUES (SEQ_REP.NEXTVAL, ?, ?, SYSDATE, NULL, ?, ?, ?);

SELECT M.*, (SELECT COUNT(*) FROM REPORT_TABLE WHERE REPORT_WRI = 0 AND REPORT_CONNO = MCO_NO AND REPORT_REF_NO = 5) I_REPORT, (SELECT COUNT(*) FROM REPORT_TABLE WHERE REPORT_REF_NO = 5 AND REPORT_CONNO = MCO_NO) REPORTED FROM MOBILE_COMMENT_VIEW M WHERE MO_NO = 50;
SELECT C.*, (SELECT COUNT(*) FROM REPORT_TABLE WHERE REPORT_WRI = 0 AND REPORT_CONNO = CC_NO AND REPORT_REF_NO = 6) I_REPORT, (SELECT COUNT(*) FROM REPORT_TABLE WHERE REPORT_REF_NO = 6 AND REPORT_CONNO = CC_NO) REPORTED FROM COMPARE_COMMENT_VIEW C WHERE CC_CNO = 30;

--------------------------------- mobile updateë¬? ?? 
UPDATE MOBILE SET MO_CODE = ?, MO_NAME = ?, MO_NAME_EN = ?, MO_BRANDCODE = ? WHERE MO_NO = ?,
UPDATE MOBILE_DETAIL SET MO_REREASE = ?, MO_OSVER = ?, MO_MATERIAL = ?, MO_SIZE = ?, MO_WEIGHT = ?, MO_LINK = ?, MO_INCH = ?, MO_RESOL = ?, MO_PIXEL = ?, MO_DISTYPE = ?, MO_DISWIDTH = ?, MO_DISHEIGHT = ?, MO_AP = ?, MO_CPU = ?, MO_CPUCORE = ?, MO_CPUCLOCK = ?, MO_GPU = ?, MO_RAM = ?, MO_INMEMO = ?, MO_OUTMEMO = ?, MO_SENSOR = ?, MO_IRIS = ?, MO_FLASH = ?, MO_PICRESOL = ?, MO_VIDRESOL = ?, MO_VIDFRAME = ?, MO_FRESOL = ?, MO_FVIDRESOL = ?, MO_FVIDREAME = ?, MO_CAMERA = ?, MO_MAH = ?, MO_VATTYPE = ?, MO_FASTCHAR = ?, MO_REMOVEBAT = ?, MO_WIRELESS = ?, MO_STANDBY = ?, MO_PROTOCOL = ?, MO_WIFI = ?, MO_BLUETOOTH = ?, MO_USB = ?, MO_BIO = ?, MO_PAYMENT = ?, MO_VERIFY = ?, MO_ETC = ?, MO_STATUS = ?, MO_OSCODE = ? WHERE MO_NO = ?;
UPDATE MOBILE_IMAGE SET MI_FRONTNAME = ?, MI_BACKNAME = ?, MI_PATH = ?, MI_UPDATE = SYSDATE WHERE REF_MO_NO = ?

UPDATE MOBILE_IMAGE SET MI_FRONTNAME = 'aaa', MI_BACKNAME = 'aaa', MI_PATH = 'aaa', MI_UPDATE = SYSDATE WHERE REF_MO_NO = 5;

ALTER TABLE MOBILE MODIFY(MO_code VARCHAR2(400)); 

---------- °ü¸®ÀÚ : ±Û °ü¸®
select * from board order by 1 desc;
SELECT COUNT(*) FROM BOARD;

CREATE OR REPLACE VIEW ADMIN_BOARD_VIEW
AS
SELECT ROWNUM RNUM, BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY
FROM (
SELECT BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY
FROM BOARD B
JOIN USER_TABLE U ON ( BWRITER = USER_NO )
ORDER BY 1 DESC) ;

CREATE OR REPLACE VIEW ADMIN_BOARD_VIEW_ASC
AS
SELECT ROWNUM RNUM, BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY
FROM (
SELECT BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY
FROM BOARD B
JOIN USER_TABLE U ON ( BWRITER = USER_NO )
ORDER BY 1 ASC) ;

CREATE OR REPLACE VIEW ADMIN_BOARD_VIEW_COUNT_DESC
AS
SELECT ROWNUM RNUM, BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY
FROM (
SELECT BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY
FROM BOARD B
JOIN USER_TABLE U ON ( BWRITER = USER_NO )
ORDER BY 4 DESC) ;

CREATE OR REPLACE VIEW ADMIN_BOARD_VIEW_COUNT_ASC
AS
SELECT ROWNUM RNUM, BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY
FROM (
SELECT BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY
FROM BOARD B
JOIN USER_TABLE U ON ( BWRITER = USER_NO )
ORDER BY 4 ASC) ;

SELECT * FROM ( SELECT ROWNUM RNUM, BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY FROM ( SELECT BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY FROM BOARD B JOIN USER_TABLE U ON ( BWRITER = USER_NO ) ORDER BY 1 DESC) WHERE USER_NAME LIKE '%' || 'test' || '%') WHERE RNUM BETWEEN 1 AND 10;

SELECT * FROM ADMIN_BOARD_VIEW WHERE RNUM BETWEEN 1 AND 10;
SELECT * FROM ADMIN_BOARD_VIEW_ASC WHERE RNUM BETWEEN 1 AND 10;
SELECT * FROM ADMIN_BOARD_VIEW_COUNT_DESC WHERE RNUM BETWEEN 1 AND 10;
SELECT * FROM ADMIN_BOARD_VIEW_COUNT_ASC WHERE RNUM BETWEEN 1 AND 10;

UPDATE BOARD SET BSTATUS = 2, BMODIDATE = SYSDATE WHERE BNO  = ?;
UPDATE BOARE SET BSTATUS = 2, BMODIDATE = SYSDATE WHERE BNO IN ( );
SELECT * FROM ( SELECT ROWNUM RNUM, BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY FROM ( SELECT BNO, BTITLE, BCONTENT, BCOUNT, BREGDATE, BMODIDATE, BCODE, BWRITER, USER_NAME, BSTATUS, BCATEGORY FROM BOARD B JOIN USER_TABLE U ON ( BWRITER = USER_NO ) ORDER BY 1 DESC) WHERE USER_NAME LIKE '%' || 'test' || '%') WHERE RNUM BETWEEN 1 AND 30;
SELECT M.*, (SELECT COUNT(*) FROM REPORT_TABLE WHERE REPORT_WRI = 0 AND REPORT_CONNO = MCO_NO AND REPORT_REF_NO = 5) I_REPORT, (SELECT COUNT(*) FROM REPORT_TABLE WHERE REPORT_REF_NO = 5 AND REPORT_CONNO = MCO_NO) REPORTED FROM MOBILE_COMMENT_VIEW M WHERE MO_NO = 10 ORDER BY 1;

UPDATE BOARD SET BSTATUS = 1 WHERE BSTATUS > 1;

------------- ADMIN COMMENT VIEW »ý¼º

CREATE OR REPLACE VIEW ADMIN_COMMENT_VIEW
AS
SELECT ROWNUM RNUM, A.*
FROM
(SELECT T.* 
FROM
(SELECT CNO, CCONTENT, CREGDATE, CMODIDATE,  BNO REF_NO, CWRITER, CSTATUS, '1' AS CTABLENO, USER_NAME FROM COMMENTT
JOIN USER_TABLE U ON ( CWRITER = U.USER_NO )
UNION
SELECT C.*, '2' AS CTABLENO, USER_NAME FROM COM_COMM C
JOIN USER_TABLE U ON ( CC_WIRTER = U.USER_NO )
UNION
SELECT M.*, '3' AS CTABLENO, USER_NAME FROM MO_COMM M
JOIN USER_TABLE U ON ( MCO_USERNO = U.USER_NO )) T
ORDER BY CREGDATE DESC) A;

CREATE OR REPLACE VIEW ADMIN_COMMENT_VIEW_ACS
AS;
SELECT ROWNUM RNUM, A.*
FROM
(SELECT T.* 
FROM
(SELECT CNO, CCONTENT, CREGDATE, CMODIDATE,  BNO REF_NO, CWRITER, CSTATUS, '1' AS CTABLENO, USER_NAME FROM COMMENTT
JOIN USER_TABLE U ON ( CWRITER = U.USER_NO )
UNION
SELECT C.*, '2' AS CTABLENO, USER_NAME FROM COM_COMM C
JOIN USER_TABLE U ON ( CC_WIRTER = U.USER_NO )
UNION
SELECT M.*, '3' AS CTABLENO, USER_NAME FROM MO_COMM M
JOIN USER_TABLE U ON ( MCO_USERNO = U.USER_NO )) T
ORDER BY CREGDATE ASC) A;

SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT T.*  FROM (SELECT CNO, CCONTENT, CREGDATE, CMODIDATE,  BNO REF_NO, CWRITER, CSTATUS, '1' AS CTABLENO, USER_NAME FROM COMMENTT JOIN USER_TABLE U ON ( CWRITER = U.USER_NO ) UNION SELECT C.*, '2' AS CTABLENO, USER_NAME FROM COM_COMM C JOIN USER_TABLE U ON ( CC_WIRTER = U.USER_NO ) UNION SELECT M.*, '3' AS CTABLENO, USER_NAME FROM MO_COMM M JOIN USER_TABLE U ON ( MCO_USERNO = U.USER_NO )) T WHERE CCONTENT LIKE '%' || '´ñ±Û' || '%' ORDER BY CREGDATE DESC) A) WHERE RNUM BETWEEN 1 AND 10;

SELECT * FROM ADMIN_COMMENT_VIEW_ACS;
ORDER BY CREGDATE ASC;
SELECT COUNT(*) FROM ADMIN_COMMENT_VIEW;

update user_table set user_name = 'testtest', user_phone= '', user_mno = '' where user_no = 20; 