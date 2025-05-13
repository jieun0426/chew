# 맛집 예약 사이트 - 츄토피아

웹 기반 맛집 예약 서비스입니다. 사용자는 맛집을 검색하고, 원하는 시간에 맞춰 실시간으로 예약할 수 있습니다.<br>
이 프로젝트는 사용자 친화적인 UI/UX와 백엔드 예약 시스템의 설계에 중점을 두었습니다.
<br><br>

## 목차
- 프로젝트 소개
- 기술 스택
- 주요 기능
- UseCase Description
- UseCase Diagram
- 화면 미리보기
- 설치 및 실행 방법
- SQL 스크립트
- 디렉토리 구조
- 회고 및 느낀점
<br><br>

# 프로젝트 소개
- 목표 : 간편한 예약 시스템과 직관적인 맛집 탐색 기능 제공
- 대상 : 외식 전 예약을 선호하는 사용자
- 기획 기간 : 2025.04.04 - 2025.04.08
- 개발 기간 : 2025.04.09 - 2025.05.14
<br><br>

# 기술 스택
- 프론트엔드 : HTML, CSS, JavaScript, AJAX
- 백엔드 : Java (Spring MVC), Tiles (템플릿 프레임워크)  
- Datebase : MyBatis, Oracle
<br><br>

# 주요 기능
- 맛집 검색 (키워드, 지역 필터)
- 날짜 및 시간 선택 후 예약
- 사용자 로그인 및 마이페이지(회원정보 수정, 내가 쓴 리뷰, 예약 보기)
- FAQ 등록 및 비밀글 쓰기
- 관리자 페이지(매장 관리, 회원관리, 예약 관리 등)
<br><br>

# UseCase Description
![image](https://github.com/user-attachments/assets/55120a83-e64a-44e7-89b1-9bf7a74c6d87)
<br><br>

# UseCase Diagram
![image](https://github.com/user-attachments/assets/de57a48c-62a0-4dad-a23b-ec38f34eb7a8)
<br><br>

# 화면 미리보기
![main_gif](https://github.com/user-attachments/assets/79a96541-bd9c-4a05-a45d-0f8665503284)
<br><br><br>
![detail](https://github.com/user-attachments/assets/826df5e8-f3dc-4b51-935c-08baec717933)

<br><br>
# 설치 및 실행 방법
1. 이 저장소 클론:
- git clone https://github.com/jieun0426/chew.git

2. IDE에서 열기

3. 서버 설정
- 포트번호 8077

<br><br>
## SQL 스크립트

- SQL 파일은 'sql/' 폴더에 있습니다.
- 직접 DB에 적용하거나 테스트 시 참고하세요.
  ※ commit 잊지 마세요 ※

| 파일명       | 설명                |
|--------------|---------------------|
| [schema.sql](./sql/schema.sql) | 테이블 구조 정의 |
| [data.sql](./sql/data.sql)     | 초기 데이터 삽입 |

<br><br>


<br><br>
# 디렉토리 구조

<br><br>
# 회고 및 느낀점
- MVC 패턴을 실제로 적용해보며 이해도가 높아짐
- Git 협업 경험이 생김

