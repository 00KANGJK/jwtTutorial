-- 권한 데이터 삽입
INSERT INTO authority (authority_name) VALUES ('ROLE_USER');
INSERT INTO authority (authority_name) VALUES ('ROLE_ADMIN');

-- 사용자 데이터 삽입
INSERT INTO "user" (username, password, nickname, activated)
VALUES ('admin', '$2a$08$lDnHPz7eUkSi6ao14Twuau08mzhWrL4kyZGGU5xfiGALO/Vxd5DOi', 'Admin', true);

INSERT INTO "user" (username, password, nickname, activated)
VALUES ('user', '$2a$08$lDnHPz7eUkSi6ao14Twuau08mzhWrL4kyZGGU5xfiGALO/Vxd5DOi', 'User', true);

-- 사용자-권한 관계 데이터 삽입
INSERT INTO user_authority (user_id, authority_name) VALUES (1, 'ROLE_ADMIN');
INSERT INTO user_authority (user_id, authority_name) VALUES (1, 'ROLE_USER');
INSERT INTO user_authority (user_id, authority_name) VALUES (2, 'ROLE_USER');
