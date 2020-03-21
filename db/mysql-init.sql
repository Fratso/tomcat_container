USE AUTISSIER;
CREATE TABLE user(
 id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 user VARCHAR(128) NOT NULL,
 password VARCHAR(256) NOT NULL,
 date_created DATE NOT NULL,
 is_admin BOOLEAN);
 

INSERT INTO user VALUES(1, 'Bobdylan77', SHA2('toto', 256), CURDATE(), False);
INSERT INTO user VALUES(2, 'outpala', SHA2('outpal', 256), CURDATE(), False);
INSERT INTO user VALUES(3, 'admin', SHA2('dckdskjfdso&&896433/!', 256), CURDATE(), True);
INSERT INTO user VALUES(4, 'yesfix', SHA2('okboomer', 256), CURDATE(), True);
INSERT INTO user VALUES(5, 'debug', SHA2('noway', 256), CURDATE(), False);
INSERT INTO user VALUES(6, 'commando', SHA2('allbobsarevisible', 256), CURDATE(), False);
INSERT INTO user VALUES(7, 'jeanne', SHA2('aymard', 256), CURDATE(), False);
INSERT INTO user VALUES(8, 'uglyapple', SHA2('macisnice', 256), CURDATE(), False);