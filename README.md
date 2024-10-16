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

## [Step1]

<br/><br/><br/><br/>

## [Step2]

<br/><br/><br/><br/>

## [Step3]
