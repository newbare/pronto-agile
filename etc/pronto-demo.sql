/* Cria usu�rios para a vers�o de demonstra��o */
delete from usuario_papel where usuario_key in ('justus', 'coach', 'time', 'cliente');
delete from usuario where username in ('justus', 'coach', 'time', 'cliente');
delete from cliente where cliente_key = 1;

/* Product Owner */
INSERT INTO usuario (username, "password", nome, email) VALUES ('justus', 'O31RL8cW9ISDGdCghWotXw==', 'Justus P.O.', 'roberto@justus.com.br');
INSERT INTO usuario_papel VALUES('justus',1);

/* Scrum Master */
INSERT INTO usuario (username, "password", nome, email) VALUES ('coach', '+TGxOurQAtf82wL4Tg95Tw==', 'Coach S.M.', 'coach@coach.com.br');
INSERT INTO usuario_papel VALUES('coach',2);

/* Equipe */
INSERT INTO usuario (username, "password", nome, email) VALUES ('time', 'B8xpS5s/xjZxD6CLaSLEKw==', 'Membro do Time', 'time@time.com.br');
INSERT INTO usuario_papel VALUES('time',9);

/* Cliente */
INSERT INTO cliente values(1, 'Cliente Teste');
INSERT INTO usuario (username, "password", nome, email, cliente_key) VALUES ('cliente', 'SYOgq4PthuDnITyHg5QBkw==', 'Usu�rio Cliente', 'cliente@cliente.com.br', 1);
INSERT INTO usuario_papel VALUES('cliente',7);