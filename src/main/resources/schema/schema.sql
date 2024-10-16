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

CREATE TABLE IF NOT EXISTS ratings
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY                                NOT NULL COMMENT 'PK',
    user_id          BIGINT                                                           NOT NULL COMMENT '사용자 PK',
    product_id       BIGINT                                                           NOT NULL COMMENT '상품 PK',
    rating           DOUBLE                                                           NULL COMMENT '평점',
    created_at       TIMESTAMP  DEFAULT CURRENT_TIMESTAMP                             NOT NULL COMMENT '생성일',
    last_modified_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL COMMENT '최종 수정일',
    deleted          TINYINT(1) DEFAULT 0                                             NOT NULL COMMENT '삭제 유무'
) ENGINE = 'InnoDB'
  CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS products
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY                                NOT NULL COMMENT 'PK',
    name             VARCHAR(200)                                                     NOT NULL COMMENT '상품 이름',
    price            DECIMAL(10, 2)                                                   NULL COMMENT '상품 가격',
    qty              INT                                                              NULL COMMENT '수량',
    shop_id          BIGINT                                                           NOT NULL COMMENT 'Shop PK',
    created_at       TIMESTAMP  DEFAULT CURRENT_TIMESTAMP                             NULL COMMENT '생성일',
    last_modified_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL COMMENT '최종 수정일',
    deleted          TINYINT(1) DEFAULT 0                                             NULL COMMENT '삭제 유무'
) ENGINE = 'InnoDB'
  CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS product_categories
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY                                NOT NULL COMMENT 'PK',
    product_id       BIGINT                                                           NOT NULL COMMENT '상품 PK',
    category_id      BIGINT                                                           NOT NULL COMMENT '카테고리 PK',
    created_at       TIMESTAMP  DEFAULT CURRENT_TIMESTAMP                             NULL COMMENT '생성일',
    last_modified_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL COMMENT '최종 수정일',
    deleted          TINYINT(1) DEFAULT 0                                             NULL COMMENT '삭제 유무',
    CONSTRAINT unique_product_categories_product_id_category_id UNIQUE (product_id, category_id)
) ENGINE = 'InnoDB'
  CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS orders
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY                                    NOT NULL COMMENT 'PK',
    user_id          BIGINT                                                               NOT NULL COMMENT '사용자 PK',
    total_amount     DECIMAL(10, 2) DEFAULT 0.00                                          NULL COMMENT '총액',
    created_at       TIMESTAMP      DEFAULT CURRENT_TIMESTAMP                             NOT NULL COMMENT '생성일',
    last_modified_at TIMESTAMP      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL COMMENT '최종 수정일',
    deleted          TINYINT(1)     DEFAULT 0                                             NULL COMMENT '삭제 유무'
) ENGINE = 'InnoDB'
  CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS order_items
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY                                NOT NULL COMMENT 'PK',
    order_id         BIGINT                                                           NOT NULL COMMENT '주문 PK',
    product_id       BIGINT                                                           NOT NULL COMMENT '상품 PK',
    qty              INT                                                              NOT NULL COMMENT '수량',
    deleted          TINYINT(1) DEFAULT 0                                             NULL COMMENT '삭제 유무',
    created_at       TIMESTAMP  DEFAULT CURRENT_TIMESTAMP                             NULL COMMENT '생성일',
    last_modified_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL COMMENT '최종 수정일'
) ENGINE = 'InnoDB'
  CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS countries
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY                                NOT NULL COMMENT 'PK',
    code             VARCHAR(20)                                                      NOT NULL COMMENT '코드',
    en_name          VARCHAR(200)                                                     NOT NULL COMMENT '국가 이름(영문)',
    kr_name          VARCHAR(200)                                                     NOT NULL COMMENT '국가 이름(국문)',
    created_at       TIMESTAMP  DEFAULT CURRENT_TIMESTAMP                             NULL COMMENT '생성일',
    last_modified_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL COMMENT '최종 수정일',
    deleted          TINYINT(1) DEFAULT 0                                             NULL COMMENT '삭제 유무',
    CONSTRAINT unique_name UNIQUE (code)
) ENGINE = 'InnoDB'
  CHARSET = utf8mb4
    COMMENT '국가';

CREATE TABLE IF NOT EXISTS categories
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY                                  NOT NULL COMMENT 'PK',
    name             VARCHAR(200) DEFAULT ''                                            NOT NULL COMMENT '카테고리 이름',
    parent_id        BIGINT                                                             NULL COMMENT '상위 카테고리 PK',
    created_at       TIMESTAMP    DEFAULT CURRENT_TIMESTAMP                             NULL COMMENT '생성일',
    last_modified_at TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL COMMENT '최종 수정일',
    deleted          TINYINT(1)   DEFAULT 0                                             NOT NULL COMMENT '삭제 유무'
) ENGINE = 'InnoDB'
  CHARSET = utf8mb4;

CREATE TABLE shops
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY                                NOT NULL AUTO_INCREMENT COMMENT 'PK',
    user_id          BIGINT                                                           NOT NULL NOT NULL COMMENT '사용자 PK',
    unique_number    VARCHAR(255)                                                     NOT NULL COMMENT '가게 고유 ID',
    name             VARCHAR(255)                                                     NOT NULL COMMENT '이름',
    created_at       TIMESTAMP  DEFAULT CURRENT_TIMESTAMP                             NULL COMMENT '생성일',
    last_modified_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL COMMENT '최종 수정일',
    deleted          TINYINT(1) DEFAULT 0                                             NOT NULL COMMENT '삭제 유무',
    UNIQUE (unique_number)
) ENGINE = 'InnoDB'
  CHARSET = utf8mb4
    COMMENT '가게';
