## 📌 학습목표

- 인덱스의 종류와 동작 원리를 학습하고, 이를 활용해 쿼리를 작성할 수 있다.
- 실행계획을 읽고 해석해, 적절하게 쿼리를 수정할 수 있다.
- 쿼리를 보고 실행계획을 예측할 수 있다.

<br/><br/><br/><br/>

## 📝 공통 요구사항

- 데이터베이스는 MySQL을 사용한다. 
- 테스트는 표면 계층만 테스트한다.
- PR을 올린 후, 실행 계획을 wiki에 작성한다.
- 논의하고 싶은 내용이 있다면 Discussion에 등록 후, 스터디원들에게 공유한다.

<br/><br/><br/><br/>

## 💻 프로그램 실행

build.gradle의 url, user, password 값이 환경 변수로 설정돼 있으며, 해당 값을 등록한 후 프로그램을 실행합니다.

```groovy
jooq {
    version = "${jooqVersion}"
    configurations {
        sakilaDB {
            generationTool {
                jdbc {
                    driver = "com.mysql.cj.jdbc.Driver"
                    url = System.getenv("DATABASE_URL")
                    user = System.getenv("USERNAME")
                    password = System.getenv("PASSWORD")
                }

    ......

```

<br/><br/><br/><br/>

스키마는 **`src/main/resources/schema`** 폴더 내부에 있으며, 스키마 등록 후 **`./gradlew build`** 명령어를 실행합니다.

```sql
CREATE TABLE IF NOT EXISTS users
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY                                  NOT NULL COMMENT 'PK',
    country_id       BIGINT                                                             NOT NULL COMMENT '국가 PK',
    `name`           VARCHAR(200) DEFAULT ''                                            NOT NULL COMMENT '이름',
    nickname         VARCHAR(255)                                                       NULL COMMENT '닉네임',
    gender           ENUM ('MAN', 'WOMAN', 'NONE')                                      NULL COMMENT '성별',
    created_at       TIMESTAMP    DEFAULT CURRENT_TIMESTAMP                             NOT NULL COMMENT '생성일',
    last_modified_at TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '최종 수정일',
    deleted          TINYINT(1)   DEFAULT 0                                             NOT NULL COMMENT '삭제 유무'
) ENGINE = 'InnoDB'
  CHARSET = utf8mb4 COMMENT '사용자';

......

```

<br/><br/><br/><br/>

# Step1.

- 최근 1년 동안 월별 새로운 사용자 유입 수를 계산하고 이를 내림차순으로 나타낸다.
- 최근 1년 동안 월별 새로운 사용자 유입을 계산한다. 이때 월별 남성과 여성의 수를 구분하여 표시한다.
- 활성 사용자 중에서 최근 1년간 서비스를 이용한 적 없는 사용자를 조회한다. 여기서 활성 사용자란 최근 단위 2년 동안 10번 이상 구매 이력이 있는 사용자를 의미한다.
- 최근 1년 동안 달에 한 번 이상의 구매 이력이 있거나, 10만 원 이상의 구매 이력이 있는 사용자를 조회한다.
- 최근 3개월 안에 구매 이력이 있는 사람 중에서 최초 구매 이력을 기준으로 가장 오래된 사용자 10명을 조회한다.
- 재구매율이 5% 이상인 상품을 모두 조회한다. 특정 사용자가 제품을 구매하고 이를 1년 이내에 다시 구매하는 경우 재구매로 인정한다.
- 한국에서의 연도별 활성 사용자 비율을 조회한다. 여기서 활성 사용자란 최근 단위 시간(2년) 동안 10번 이상 구매 이력이 있는 사용자를 의미한다.
- 2023년 평균 구매 기간이 10일 이내인 사용자를 모두 출력한다. 구매 기간이란, 특정 사용자가 상품을 구매한 시점 A와 바로 다음 구매 시점 B 사이의 구간 길이를 말한다.
  - 예를 들어 특정 사용자가 2024.09.15에 상품을 구매하고 2024.09.16에 상품을 구매, 2024.09.18에 상품을 또 구매한다면 구매 기간은 각각 1일, 2일이다.
  - 단, 마지막 구매날짜 ~ 현재 날짜도 구매 기간에 포함한다. 현재 날짜를 2024.09.25라고 가정 하면 2024.09.18 이후 구매한 적이 없으므로, 최종 구매 기간은 각각 1일, 2일, 7일이라 볼 수 있고, 평균 구매 기간은 3일(소수점 첫째 자리에서 반올림)로 간주한다.
- 2023년 평균 구매 기간이 10일 이내인 사용자를 모두 출력한다.
- 루팡은 2010~2020까지 연도별, VIP 사용자의 변화를 분석하려 한다. 이에 대한 쿼리를 작성한다. VIP유저는 전년도에 1,000만 원 이상을 구매한 사용자를 의미한다.
- 연도별 VIP 사용자의 수
- 연도별 작년에 VIP 사용자였다가 강등된 사용자의 수
- 연도별 작년에 VIP가 아니었다가 새로 VIP 사용자가 된 사용자의 수를 출력한다.

<br/><br/><br/><br/>

# Step2.

- 주문이 많은 사용자 10명을 조회한다
- 특정 기간 주문량이 가장 많은 사용자 10명을 조회한다.
- 특정 카테고리에서 주문량이 가장 많은 사용자 10명을 조회한다.
- 특정 상점에서 특정 기간 주문량이 가장 많은 사용자 10명을 조회한다.
- 나라별 + 성별별 주문이 가장 많은 카테고리 5개를 조회한다.
- 사용자 별 몇 번의 주문을 했고, 주문 금액이 얼마인지 계산한다.
- 카테고리별 판매량의 나라/성별 비율을 조회한다.
- 국가별 총주문 개수, 금액을 조회한다.
- 국가별로 연도별 매출 성장 속도를 조회하라.
  - 해당 연도의 매출 성장 속도란 아래와 같이 정의한다.
  - 2018년도의 매출 성장 속도 = 2018년도의 매출 / 2017년도의 매출 *100
- 연령대별 베스트 셀러 상품이 무엇인지 출력한다.
- 루팡은 일본에서 사업을 확장하려 했지만, 생각보다 부실한 실적에 고민하고 있다.
  - 루팡은 일본에서 시장 점유율을 늘리기 위해 베스트 셀러 상품에 대해 할인 행사를 진행하고자 한다. 연령대별 베스트 셀러 상품이 무엇인지 출력한다.
  - 여기서 베스트 셀러 상품이란 아래 조건 중 1가지 이상 만족해야 한다. 재 구매율이란 제품을 2회이상 구매한 유저 수 / 제품을 구매한 유저 수 * 100 을 의미한다. 
    - 일본에서 판매된 실적 중 판매순위 10위 이내.
    - 일본에서 판매된 실적 중 재구매율 70% 이상.

<br/><br/><br/><br/>

## [Step3]
### Q1. 월 별 주문 개수와 총 주문 금액을 집계합니다.
### Q2. 제품 별 판매된 총 수량과 금액을 계산하고, 가장 많이 판매된 상위 10개를 집계한다.
### Q3. 각 나라별로 가장 판매량이 많은 카테고리와, 가장 판매량이 부진한 카테고리를 조회한다.
### Q4. 사용자가 서비스에 가입하고 처음으로 주문한 상품의 카테고리를 계산하여, 카테고리 별로 그 수를 조회한다.
### Q5. 2020년부터 2022년까지 코로나 기간 동안, </br>각 연도별 판매량이 모두 코로나 이전 판매량보다 10% 이상 증가한 카테고리를 조회하고, </br> 2010년부터 2024년까지의 판매량을 함께 표시한다.
코로나 이전 판매량은 2010~2019까지의 평균 판매량으로 계산한다.

ex1) 상품 A의 코로나 이전 평균 판매량이 10만건, 2020년도에 11만건 2021년도에 13만건 2022년에 12만건이라면 상품A는 조건을 만족하는 상품이다.

ex2) 상품 B의 코로나 이전 평균 판매량이 10만건, 2020년도에 11만건 2021년도에 13만건 2022년에 10.5만건이라면 상품B는 조건을 만족하지 못한다.

### Q6. 2022년보다 2023년에 전체 판매량이 10%이상 증가한 상품을 내림차순으로 조회한다

### Q7. 1년 이상 기간동안 월별 판매량이 top100안에 항상 들었던 상점을 조회한다.

### Q8. 최근 1년 동안 꾸준히 월별 판매량이 증가하고 있는 상점을 조회한다.

### Q9. 상품에 등급을 매겨 출력하라.
쿠팡은 상품에 등급을 매기고자 한다.
상품 등급은 'A'~'D'까지 존재하며, 등급을 매기는 상세 기준은 아래와 같다.
'A' : 아래 3가지 조건중 하나 이상 만족하는 경우
1. 최근 3년간 매출이 지속적으로 10%이상 증가한 경우
2. 작년 매출이 1억원 이상 발생한 경우
3. 작년에 10만명 이상의 유저에게 물품을 판매한 경우.

'B': 아래 3가지 조건중 하나 이상 만족하는 경우
1. 최근 3년간 매출이 지속적으로 7%이상 증가한 경우
2. 작년 매출이 7억원 이상 발생한 경우
3. 작년에 7만명 이상의 유저에게 물품을 판매한 경우.

'C': 아래 3가지 조건중 하나 이상 만족하는 경우
1. 최근 3년간 매출이 지속적으로 5%이상 증가한 경우
2. 작년 매출이 5억원 이상 발생한 경우
3. 작년에 5만명 이상의 유저에게 물품을 판매한 경우.

'D': 'A'~'C'까지의 조건 중 하나도 만족하지 못하는 경우

부가설명:
1. 특정 상품이 'A'조건도 만족하고 'B'조건도 만족할 경우 더 높은 등급을 부여한다.
   예) 1번 조건을 통해 'A'를 만족하고 2번 조건을 통해 'B'를 만족할 경우 'A'등급 부여

2. 상품 최초 개시 날짜가 1년이 안되는 경우 -> 'A','B','C'중 어떤 것도 만족할 가능성이 없으므로 'D'등급 부여"

### Q10.아래 지문을 읽고 답하라.
쿠팡은 우수 상품에게 수수료를 줄여주는 우수 상품 우대 정책을 실시하려 한다.
우수 상품 조건은 아래 조건 중 하나 이상을 만족해야한다.
1. 연 매출 10억원 이상의 상품.
2. 연 판매량 10만건 이상의 상품.

기존 수수료는 30%이며 우수 상품 조건에 해당할 경우 수수료 10%를 깎아준다.

또한, 쿠팡은 수수료 절감 해택을 줄 경우 기업들이 상품 가격을 5% 내리는 행사를 진행하게 할 예정이다. (상품 판매자는 반드시 진행해야한다.)
그리고 쿠팡은 우수 상품들의 판매량이 30%증가할 것으로 기대하고있다.

1. 우수 상품을 선별하고 수수료 절감과 판매량 증진이 기대한 대로 이루어 졌을 경우 상품별 쿠팡이 얼마만큼의 이득을 얻는지 계산하여 출력하라.
2. 쿠팡이 총 얼마만큼의 이득을 얻었는지 총 액을 계산하여 출력하라.

이득이 아니라 손해를 본 경우 -로 표시하면 된다.
<br/><br/><br/><br/>

## [Step4]
### Q1. 월 별 제품 평가가 높은 상위 10개를 추출한다.
### Q2. 카테고리별 상품의 개수를 조회한다.
### Q3. 카테고리별 평점 5.0이상의 상품 개수를 조회한다.
### Q4. 각 제품별 리뷰 개수가 많은 상위 10명을 조회한다.
### Q5. 전체 상점 중 평점이 가장높은 상위 100개의 상점을 계산하고, 그 중 카테고리별로 개수를 조회한다.
### Q6. 2023년 1분기보다 2024년 1분기에 전체 판매량이 10%이상 증가한 상품을 내림차순으로 조회한다.
### Q7. 2023.08.01을 기준으로 현재 월별 판매량이 가장 급등한 상점을 조회한다.
단, 2023.08.01이전에 판매량이 없는 상점은 제외한다.
### Q8. 최근 1달 동안 카테고리 별로 판매 실적이 가장 부진한 상점을 10개씩 조회한다.
### Q9. 전년도에 상품을 3개 국가 이상에서 활발하게 팔았던 상점을 조회하라.

활발하게 팔리는 국가란 본인 상점 매출의 15%이상 혹은 1억원 이상의 매출이 나오는 국가를 의미한다.

### Q10. 상품 판매가 어느 한쪽의 성별에만 치우쳐진 상품들을 조회하라.
상품 판매가 한쪽 성별에 치우쳐 져 있다는 것은 어느 한쪽 성별의 판매가 90%이상인 경우를 의미한다.

예) 남성 유저의 구입이 90% 이상인 경우"
