CREATE TABLE business_customer
(
  id                  BIGINT(11) AUTO_INCREMENT
    PRIMARY KEY,
  gmt_create          DATETIME           NOT NULL,
  gmt_modified        DATETIME           NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  customer_name       VARCHAR(32)        NULL
  COMMENT '客户姓名',
  customer_sex        SMALLINT(1)        NULL
  COMMENT '0:男 1:女',
  customer_idCard     VARCHAR(32)        NULL
  COMMENT '身份证号',
  customer_email      VARCHAR(32)        NULL
  COMMENT '邮箱',
  customer_phone      VARCHAR(32)        NULL
  COMMENT '手机号',
  customer_address    VARCHAR(64)        NULL
  COMMENT '地址',
  customer_credit     INT                NULL
  COMMENT '芝麻信用分',
  customer_creditCard VARCHAR(32)        NULL
  COMMENT '银行卡号',
  customer_salary     DECIMAL(10, 2)     NULL
  COMMENT '月薪',
  customer_company    VARCHAR(64)        NULL
  COMMENT '公司',
  company_address     VARCHAR(64)        NULL
  COMMENT '公司地址',
  company_phone       VARCHAR(32)        NULL
  COMMENT '公司号码',
  black_list          INT(1) DEFAULT '0' NULL
  COMMENT '0:不是黑名单 1:是',
  CONSTRAINT id
  UNIQUE (id)
)
  ENGINE = InnoDB;

CREATE INDEX customer_credit
  ON business_customer (customer_credit);

CREATE TABLE business_loan
(
  id             BIGINT(11) AUTO_INCREMENT
    PRIMARY KEY,
  gmt_create     DATETIME(6)    NOT NULL,
  gmt_modified   DATETIME(6)    NOT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  loan_type      SMALLINT(1)    NULL
  COMMENT '贷款产品类型',
  loan_state     SMALLINT(1)    NULL
  COMMENT '0:未处理 1:通过 2:未通过',
  loan_sum       BIGINT(11)     NULL
  COMMENT '申请总金额',
  loan_rate      DECIMAL(11, 6) NULL
  COMMENT '贷款利率',
  loan_repayment SMALLINT(1)    NULL
  COMMENT '还款类型',
  loan_date      DATETIME(6)    NULL
  COMMENT '申请日期',
  loan_period    INT(2)         NULL
  COMMENT '申请期限',
  customer_id    BIGINT(11)     NULL
  COMMENT '贷款人主键',
  user_id        BIGINT(11)     NULL
  COMMENT '处理人主键',
  CONSTRAINT id
  UNIQUE (id),
  CONSTRAINT loan_customer
  FOREIGN KEY (customer_id) REFERENCES business_customer (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)
  ENGINE = InnoDB;

CREATE INDEX loan_type
  ON business_loan (loan_type);

CREATE INDEX customer_id
  ON business_loan (customer_id);

CREATE INDEX user_id
  ON business_loan (user_id);

CREATE TABLE business_money
(
  id    BIGINT(11) AUTO_INCREMENT
    PRIMARY KEY,
  money BIGINT(11) NOT NULL
)
  ENGINE = InnoDB;

CREATE TABLE business_provide
(
  id           BIGINT(11) AUTO_INCREMENT
    PRIMARY KEY,
  gmt_create   DATETIME(6) NOT NULL,
  gmt_modified DATETIME(6) NOT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  loan_id      BIGINT(11)  NULL
  COMMENT '贷款申请号',
  user_id      BIGINT(11)  NULL
  COMMENT '操作员id',
  provide_sum  VARCHAR(10) NULL
  COMMENT '放贷金额',
  provide_date DATETIME(6) NULL
  COMMENT '放贷日期',
  provide_last DATETIME(6) NULL
  COMMENT '贷款到期日期',
  CONSTRAINT id
  UNIQUE (id),
  CONSTRAINT pl_loan
  FOREIGN KEY (loan_id) REFERENCES business_loan (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)
  ENGINE = InnoDB;

CREATE INDEX pl_loan
  ON business_provide (loan_id);

CREATE TABLE business_rate
(
  id           BIGINT(11) AUTO_INCREMENT
    PRIMARY KEY,
  gmt_create   DATETIME       NOT NULL,
  gmt_modified DATETIME       NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  loan_limit   BIGINT(11)     NULL
  COMMENT '贷款额度',
  credit_range VARCHAR(32)    NULL
  COMMENT '芝麻信用分范围',
  loan_rate    DECIMAL(11, 4) NULL
  COMMENT '贷款利率',
  CONSTRAINT id
  UNIQUE (id)
)
  ENGINE = InnoDB;

CREATE TABLE business_reback
(
  id             BIGINT(11) AUTO_INCREMENT
    PRIMARY KEY,
  gmt_create     DATETIME(6) NOT NULL,
  gmt_modified   DATETIME(6) NOT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  loan_id        BIGINT(11)  NULL
  COMMENT '贷款申请表id',
  reback_date    DATETIME(6) NULL
  COMMENT '还款日期',
  reback_amount  BIGINT      NULL
  COMMENT '还款金额',
  surplus_amount BIGINT      NULL
  COMMENT '贷款剩余金额',
  customer_id    BIGINT(11)  NULL
  COMMENT '客户信息表id',
  CONSTRAINT id
  UNIQUE (id),
  CONSTRAINT ru_loan
  FOREIGN KEY (loan_id) REFERENCES business_loan (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT ru_user
  FOREIGN KEY (customer_id) REFERENCES business_customer (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)
  ENGINE = InnoDB;

CREATE INDEX ru_loan
  ON business_reback (loan_id);

CREATE INDEX ru_user
  ON business_reback (customer_id);

CREATE TABLE count_apply
(
  id            BIGINT(11) AUTO_INCREMENT
    PRIMARY KEY,
  gmt_create    DATETIME NOT NULL,
  gmt_modified  DATETIME NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  apply_sum     INT      NULL
  COMMENT '申请总数',
  apply_passed  INT      NULL
  COMMENT '申请通过总数',
  apply_amount  BIGINT   NULL
  COMMENT '申请金额总数',
  apply_provide BIGINT   NULL
  COMMENT '已放贷总数',
  apply_date    DATETIME NULL
  COMMENT '统计日期',
  CONSTRAINT id
  UNIQUE (id)
)
  ENGINE = InnoDB;

CREATE TABLE count_reback
(
  id            BIGINT(11) AUTO_INCREMENT
    PRIMARY KEY,
  gmt_create    DATETIME(6) NOT NULL,
  gmt_modified  DATETIME(6) NOT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  reback_amount BIGINT      NULL
  COMMENT '已归还贷款额',
  noback_amount BIGINT      NULL
  COMMENT '未归还贷款额',
  CONSTRAINT id
  UNIQUE (id)
)
  ENGINE = InnoDB;

CREATE TABLE system_menu
(
  id           BIGINT(11) AUTO_INCREMENT
  COMMENT '主键，自增id'
    PRIMARY KEY,
  gmt_create   DATETIME    NOT NULL
  COMMENT '主动创建的时间',
  gmt_modified DATETIME    NOT NULL ON UPDATE CURRENT_TIMESTAMP
  COMMENT '被动更新的时间',
  menu_id      BIGINT(11)  NULL
  COMMENT '菜单id',
  menu_name    VARCHAR(32) NULL
  COMMENT '菜单名称',
  menu_url     VARCHAR(32) NULL
  COMMENT '菜单url',
  menu_icon    VARCHAR(32) NULL
  COMMENT '菜单图标',
  parent_id    BIGINT(11)  NULL
  COMMENT '父级菜单id',
  CONSTRAINT id
  UNIQUE (id)
)
  ENGINE = InnoDB;

CREATE INDEX menu_id
  ON system_menu (menu_id);

CREATE TABLE system_mr
(
  id           BIGINT(11) AUTO_INCREMENT
    PRIMARY KEY,
  gmt_create   DATETIME   NOT NULL,
  gmt_modified DATETIME   NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  role_id      BIGINT(11) NULL,
  menu_id      BIGINT(11) NULL,
  status       INT(1)     NULL,
  CONSTRAINT id
  UNIQUE (id),
  CONSTRAINT mr_menu
  FOREIGN KEY (menu_id) REFERENCES system_menu (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)
  ENGINE = InnoDB;

CREATE INDEX role_id
  ON system_mr (role_id);

CREATE INDEX menu_id
  ON system_mr (menu_id);

CREATE TABLE system_role
(
  id           BIGINT(11) AUTO_INCREMENT
  COMMENT '主键，自增id'
    PRIMARY KEY,
  gmt_create   DATETIME    NOT NULL
  COMMENT '主动创建的时间',
  gmt_modified DATETIME    NOT NULL ON UPDATE CURRENT_TIMESTAMP
  COMMENT '被动更新的时间',
  role_name    VARCHAR(32) NULL
  COMMENT '角色名称',
  info         VARCHAR(32) NULL
  COMMENT '备注',
  CONSTRAINT id
  UNIQUE (id)
)
  ENGINE = InnoDB;

ALTER TABLE system_mr
  ADD CONSTRAINT mr_role
FOREIGN KEY (role_id) REFERENCES system_role (id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

CREATE TABLE system_ur
(
  id           BIGINT(11) AUTO_INCREMENT
    PRIMARY KEY,
  gmt_create   DATETIME   NOT NULL,
  gmt_modified DATETIME   NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  user_id      BIGINT(11) NULL,
  role_id      BIGINT(11) NULL,
  CONSTRAINT id
  UNIQUE (id),
  CONSTRAINT ur_role
  FOREIGN KEY (role_id) REFERENCES system_role (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)
  ENGINE = InnoDB;

CREATE INDEX user_id
  ON system_ur (user_id);

CREATE INDEX role_id
  ON system_ur (role_id);

CREATE TABLE system_user
(
  id           BIGINT(11) AUTO_INCREMENT
  COMMENT '主键用户id'
    PRIMARY KEY,
  gmt_create   DATETIME    NOT NULL
  COMMENT '创建时间',
  gmt_modified DATETIME    NOT NULL ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间',
  user_name    VARCHAR(32) NULL CHARSET utf8 COMMENT '账号名',
  password     VARCHAR(32) NULL CHARSET utf8 COMMENT '账号密码',
  phone        VARCHAR(32) NULL CHARSET utf8 COMMENT '手机号码',
  address      VARCHAR(64) NULL CHARSET utf8 COMMENT '用户地址',
  status       INT(1)      NULL
  COMMENT '状态:0 禁用 1 激活',
  CONSTRAINT id
  UNIQUE (id),
  CONSTRAINT userName
  UNIQUE (user_name)
)
  ENGINE = InnoDB
  COLLATE = utf8_hungarian_ci;

ALTER TABLE business_loan
  ADD CONSTRAINT loan_user
FOREIGN KEY (user_id) REFERENCES system_user (id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

ALTER TABLE system_ur
  ADD CONSTRAINT ur_user
FOREIGN KEY (user_id) REFERENCES system_user (id)
  ON UPDATE CASCADE
  ON DELETE CASCADE;


