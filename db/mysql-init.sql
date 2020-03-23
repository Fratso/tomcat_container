USE AUTISSIER;
CREATE TABLE user(
 id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 user VARBINARY(128) NOT NULL,
 password VARCHAR(256) NOT NULL,
 date_created DATE NOT NULL,
 is_admin BOOLEAN);


INSERT INTO user VALUES(1, aes_encrypt('Bobdylan77', 'toto'), SHA2('toto', 256), CURDATE(), False);
INSERT INTO user VALUES(2, aes_encrypt('outpala', 'toto'), SHA2('outpal', 256), CURDATE(), False);
INSERT INTO user VALUES(3, aes_encrypt('admin', 'toto'), SHA2('dckdskjfdso&&896433/!', 256), CURDATE(), True);
INSERT INTO user VALUES(4, aes_encrypt('yesfix', 'toto'), SHA2('okboomer', 256), CURDATE(), True);
INSERT INTO user VALUES(5, aes_encrypt('debug', 'toto'), SHA2('noway', 256), CURDATE(), False);
INSERT INTO user VALUES(6, aes_encrypt('commando', 'toto'), SHA2('allbobsarevisible', 256), CURDATE(), False);
INSERT INTO user VALUES(7, aes_encrypt('jeanne', 'toto'), SHA2('aymard', 256), CURDATE(), False);
INSERT INTO user VALUES(8, aes_encrypt('uglyapple', 'toto'), SHA2('macisnice', 256), CURDATE(), False);

