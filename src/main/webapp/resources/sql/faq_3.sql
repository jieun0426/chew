  CREATE TABLE "MBC"."FAQ_3" 
   (   "NUM" NUMBER(6,0), 
   "ID" VARCHAR2(20 BYTE), 
   "TITLE" VARCHAR2(50 BYTE), 
   "CONTENT" VARCHAR2(1000 BYTE), 
   "WDATE" DATE, 
   "STATE" VARCHAR2(20 BYTE), 
   "GROUPS" NUMBER(6,0), 
   "STEP" NUMBER(1,0), 
   "SECRET" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into MBC.FAQ_3
SET DEFINE OFF;
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10103,'eeee','좋아요 한 매장은 어디서 보나요?','몰아서 보려고 좋아요 해뒀는데
어디서 볼 수 있나요',to_date('25/05/09','RR/MM/DD'),'미답변',10087,0,0);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10105,'eeee','맛집 되게 적네요','좀 새로운 맛집 없나요',to_date('25/05/09','RR/MM/DD'),'미답변',10088,0,1);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10107,'meee','매장등록 문의 남깁니다','새로 오픈했는데 저희 매장도 여기 올리고 싶어요',to_date('25/05/09','RR/MM/DD'),'미답변',10089,0,1);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10109,'qwer','예약을 하고싶은데','인원수가 너무 적어요 ㅠㅠ
저희 대가족인데',to_date('25/05/09','RR/MM/DD'),'미답변',10090,0,0);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10111,'jiji','sns 로그인 하고싶은데','언제쯤 구현되나요
문의 남기려고 회원가입 대충 해서
비번도 몰라요',to_date('25/05/09','RR/MM/DD'),'미답변',10091,0,0);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10113,'jiji','메뉴는요?','메뉴가 없는데???',to_date('25/05/09','RR/MM/DD'),'미답변',10092,0,0);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10117,'jing55','맛집이라면서 평점들이 ㅋㅋㅋ','맛없는 집 잘 거르고 갑니다 ^^',to_date('25/05/09','RR/MM/DD'),'미답변',10093,0,1);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10118,'jing55','왜 답변 안달아주세요','빨리빨리',to_date('25/05/09','RR/MM/DD'),'미답변',10094,0,1);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10119,'jing55','제 말이 들리지 않나요','왜 답변 안해주냐고요',to_date('25/05/09','RR/MM/DD'),'미답변',10095,0,1);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10120,'jing55','답변해달라고!!','왜왜왜 안달아주는데',to_date('25/05/09','RR/MM/DD'),'미답변',10096,0,1);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10121,'koko','매장 이미지 어떻게 넣나요?','저희 매장 이미지를 좀 바꾸고 싶어요
이미지는 어떻게 바꾸나요?',to_date('25/05/09','RR/MM/DD'),'미답변',10097,0,0);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10123,'jing55','나만 답변 안해주냐','사람 차별하네 재미없게
난 간다',to_date('25/05/09','RR/MM/DD'),'미답변',10098,0,0);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10124,'korea','입점 문의','저희 매장도 입점하고 싶습니다',to_date('25/05/09','RR/MM/DD'),'미답변',10124,0,1);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10100,'korea','첫 FAQ 작성','1',to_date('25/05/09','RR/MM/DD'),'미답변',10085,0,0);
Insert into MBC.FAQ_3 (NUM,ID,TITLE,CONTENT,WDATE,STATE,GROUPS,STEP,SECRET) values (10102,'eeee','안녕하세요','비밀번호를 잊어버렸어요',to_date('25/05/09','RR/MM/DD'),'미답변',10086,0,0);
--------------------------------------------------------
--  DDL for Index FAQ_3_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MBC"."FAQ_3_PK" ON "MBC"."FAQ_3" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table FAQ_3
--------------------------------------------------------

  ALTER TABLE "MBC"."FAQ_3" ADD CONSTRAINT "FAQ_3_PK" PRIMARY KEY ("NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MBC"."FAQ_3" MODIFY ("NUM" NOT NULL ENABLE);