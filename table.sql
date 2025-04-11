CREATE TABLE member_3 (
	id	varchar2(20)	NOT NULL,
	pw	varchar2(20)	NULL,
	name	varchar2(20)	NULL,
	phone	varchar2(20)	NULL,
	birth	date	NULL
);

CREATE TABLE store_3 (
	storecode	number(7)	NOT NULL,
	storename	varchar2(30)	NULL,
	storeaddress	varchar2(100)	NULL,
	storecategory	varchar2(20)	NULL,
	storelikes	number(6)	NULL,
	storearea	varchar2(20)	NULL,
	storeimage	varchar2(200)	NULL
);

CREATE TABLE booking_3 (
	tablenum	number(7)	NOT NULL,
	storecode	number(7)	NOT NULL,
	id	varchar2(20)	NOT NULL,
	saramsu	number(3)	NULL,
	state	varchar2(10)	NULL,
	bookingdate	date	NULL,
	bookingtime	date	NULL
);

CREATE TABLE review_3 (
	id	varchar2(20)	NOT NULL,
	storecode	number(7)	NOT NULL,
	content	varchar2(200)	NULL,
	stars	number(2)	NULL
);

CREATE TABLE menu_3 (
	storecode	number(7)	NOT NULL,
	menuname	varchar2(30)	NULL,
	price	number(7)	NULL,
	state	varchar2(10)	NULL,
	menuimage	varchar2(200)	NULL
);

ALTER TABLE member_3 ADD CONSTRAINT PK_MEMBER_3 PRIMARY KEY (
	id
);

ALTER TABLE store_3 ADD CONSTRAINT PK_STORE_3 PRIMARY KEY (
	storecode
);

ALTER TABLE booking_3 ADD CONSTRAINT PK_BOOKING_3 PRIMARY KEY (
	tablenum,
	storecode,
	id
);

ALTER TABLE review_3 ADD CONSTRAINT PK_REVIEW_3 PRIMARY KEY (
	id,
	storecode
);

ALTER TABLE menu_3 ADD CONSTRAINT PK_MENU_3 PRIMARY KEY (
	storecode
);

ALTER TABLE booking_3 ADD CONSTRAINT FK_store_3_TO_booking_3_1 FOREIGN KEY (
	storecode
)
REFERENCES store_3 (
	storecode
);

ALTER TABLE booking_3 ADD CONSTRAINT FK_member_3_TO_booking_3_1 FOREIGN KEY (
	id
)
REFERENCES member_3 (
	id
);

ALTER TABLE review_3 ADD CONSTRAINT FK_member_3_TO_review_3_1 FOREIGN KEY (
	id
)
REFERENCES member_3 (
	id
);

ALTER TABLE review_3 ADD CONSTRAINT FK_store_3_TO_review_3_1 FOREIGN KEY (
	storecode
)
REFERENCES store_3 (
	storecode
);

ALTER TABLE menu_3 ADD CONSTRAINT FK_store_3_TO_menu_3_1 FOREIGN KEY (
	storecode
)
REFERENCES store_3 (
	storecode
);

