-- 권한 테이블
CREATE TABLE IF NOT EXISTS authority (
                                       authority_name VARCHAR(50) NOT NULL PRIMARY KEY
  );

-- 사용자 테이블
CREATE TABLE IF NOT EXISTS "user" (
                                    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                    username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  nickname VARCHAR(50),
  activated BOOLEAN NOT NULL
  );

-- 사용자와 권한 간의 관계 테이블
CREATE TABLE IF NOT EXISTS user_authority (
                                            user_id BIGINT NOT NULL,
                                            authority_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (user_id, authority_name),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES "user"(user_id) ON DELETE CASCADE,
  CONSTRAINT fk_authority FOREIGN KEY (authority_name) REFERENCES authority(authority_name) ON DELETE CASCADE
  );
