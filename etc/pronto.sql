/* Cria a Estrutura do Banco de Dados do Pronto com os registros default */

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

CREATE SEQUENCE hibernate_sequence
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

SELECT pg_catalog.setval('hibernate_sequence', 62, true);

CREATE SEQUENCE seq_ticket
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


CREATE SEQUENCE seq_sprint
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

    
CREATE SEQUENCE seq_ticket_comentario
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

CREATE SEQUENCE seq_ticket_log
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

CREATE SEQUENCE seq_script
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

CREATE SEQUENCE seq_banco_de_dados
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

CREATE SEQUENCE seq_execucao
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

CREATE SEQUENCE seq_retrospectiva
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

CREATE SEQUENCE seq_retrospectiva_item
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

CREATE SEQUENCE seq_cliente
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

create sequence SEQ_CATEGORIA;
	
CREATE TABLE backlog (
    backlog_key integer NOT NULL,
    descricao character varying(255)
);

ALTER TABLE public.backlog OWNER TO pronto;
    
CREATE TABLE kanban_status (
    kanban_status_key integer NOT NULL,
    descricao character varying(255),
    ordem integer,
    fixo integer default 0 not null
);

ALTER TABLE public.kanban_status OWNER TO pronto;

CREATE TABLE papel (
    papel_key integer NOT NULL,
    descricao character varying(255)
);



CREATE TABLE sprint (
    sprint_key integer NOT NULL,
    nome character varying(255),
    data_inicial timestamp without time zone,
    data_final timestamp without time zone,    
    fechado boolean NOT NULL,
    atual boolean NOT NULL
);



CREATE TABLE ticket (
    ticket_key integer NOT NULL,
    titulo character varying(255),
    descricao text,
    cliente character varying(255),
    solicitador character varying(255),
    branch character varying(255),
    valor_de_negocio integer NOT NULL,
    esforco double precision NOT NULL,
    par boolean NOT NULL,
    planejado boolean NOT NULL,
    data_de_criacao timestamp without time zone default now(),
    data_de_pronto timestamp without time zone,
    reporter_key character varying(255),
    pai integer,
    kanban_status_key integer,
    sprint integer,
    tipo_de_ticket_key integer,
    backlog_key integer,
    prioridade integer,
    cliente_key integer,
    prioridade_do_cliente integer,
    script_key integer,
    data_da_ultima_alteracao timestamp without time zone,
    categoria_key integer
);



CREATE TABLE ticket_comentario (
    ticket_comentario_key integer NOT NULL,
    usuario_key character varying(255),
    data timestamp without time zone,
    texto text,
    ticket_key integer
);



CREATE TABLE ticket_desenvolvedor (
    ticket_key integer NOT NULL,
    usuario_key character varying(255) NOT NULL
);




CREATE TABLE ticket_testador (
    ticket_key integer NOT NULL,
    usuario_key character varying(255) NOT NULL
);




CREATE TABLE ticket_log (
    ticket_history_key integer NOT NULL,
    campo character varying(255),
    operacao integer NOT NULL,
    valor_antigo text,
    valor_novo text,
    data timestamp without time zone,
    usuario character varying(255),
    ticket_key integer NOT NULL
);




CREATE TABLE tipo_de_ticket (
    tipo_de_ticket_key integer NOT NULL,
    descricao character varying(255)
);



CREATE TABLE usuario (
    username character varying(100) NOT NULL,
    "password" character varying(30),
    nome character varying(150),
    email character varying(170),
    email_md5 character varying(170),
    cliente_key integer
);



CREATE TABLE usuario_papel (
    usuario_key character varying(255) NOT NULL,
    papel_key integer NOT NULL
);




CREATE TABLE banco_de_dados (
    banco_de_dados_key integer NOT NULL,
    nome character varying(120)
);



CREATE TABLE script (
    script_key integer NOT NULL,
    descricao character varying(120) not null,
    script text    
);



CREATE TABLE execucao (
    execucao_key integer NOT NULL,
    script_key integer NOT NULL,
    banco_de_dados_key integer NOT NULL,
    username character varying(255),
    data  timestamp without time zone
);   



CREATE TABLE tipo_retrospectiva_item (
    tipo_retrospectiva_item_key integer NOT NULL,
    descricao character varying(120),
	tipo_retrospectiva_key integer DEFAULT 1
);



CREATE TABLE retrospectiva (
    retrospectiva_key integer NOT NULL,
    sprint_key integer NOT NULL,
	tipo_retrospectiva_key integer DEFAULT 1 NOT NULL
);



CREATE TABLE retrospectiva_item (
    retrospectiva_item_key integer NOT NULL,
    retrospectiva_key integer NOT NULL,
    tipo_retrospectiva_item_key integer NOT NULL,
    descricao character varying(255) NOT NULL 
);



CREATE TABLE cliente (
    cliente_key integer NOT NULL,
    nome character varying(120)
);



CREATE TABLE tipo_retrospectiva (
    tipo_retrospectiva_key integer NOT NULL,
    descricao character varying(120)
);



CREATE TABLE configuracoes (
	chave varchar(50) primary key,
	valor varchar(100)	
);



CREATE TABLE categoria (
	categoria_key integer primary key,
	descricao varchar(75),
	cor varchar(60)
);



INSERT INTO backlog VALUES (1, 'Ideias');
INSERT INTO backlog VALUES (5, 'Impedimentos');
INSERT INTO backlog VALUES (4, 'Lixeira');
INSERT INTO backlog VALUES (2, 'Product Backlog');
INSERT INTO backlog VALUES (3, 'Sprint Backlog');

INSERT INTO kanban_status VALUES (1, 'To Do', 1, 1);
INSERT INTO kanban_status VALUES (2, 'Doing', 2, 1);
INSERT INTO kanban_status VALUES (21, 'To test', 21, 1);
INSERT INTO kanban_status VALUES (31, 'Testing', 31, 1);
INSERT INTO kanban_status VALUES (100, 'Done', 100, 1);

INSERT INTO papel VALUES (1, 'Product Owner');
INSERT INTO papel VALUES (2, 'Scrum Master');
INSERT INTO papel VALUES (6, 'Administrador');
INSERT INTO papel VALUES (7, 'Cliente');
INSERT INTO papel VALUES (9, 'Equipe');

INSERT INTO tipo_de_ticket VALUES (1, 'Ideia');
INSERT INTO tipo_de_ticket VALUES (2, 'Est�ria');
INSERT INTO tipo_de_ticket VALUES (3, 'Defeito');
INSERT INTO tipo_de_ticket VALUES (5, 'Impedimento');
INSERT INTO tipo_de_ticket VALUES (6, 'Tarefa');

INSERT INTO usuario (username, "password", nome, email) VALUES ('admin', 'ISMvKXpXpadDiUoOSoAfww==', 'Administrador do Pronto', 'adm@adm.com.br');

INSERT INTO usuario_papel VALUES('admin',6);

INSERT INTO tipo_retrospectiva VALUES (1, 'Tradicional');
INSERT INTO tipo_retrospectiva VALUES (2, '6 Chap�us');

INSERT INTO tipo_retrospectiva_item VALUES (1, 'O que foi bem', 1);
INSERT INTO tipo_retrospectiva_item VALUES (2, 'O que pode ser melhorado', 1);

INSERT INTO tipo_retrospectiva_item VALUES (3, 'Chap�u Azul - Objetivos', 2);
INSERT INTO tipo_retrospectiva_item VALUES (4, 'Chap�u Branco - Fatos e Informa��es', 2);
INSERT INTO tipo_retrospectiva_item VALUES (5, 'Chap�u Amarelo - Acontecimentos Positivos', 2);
INSERT INTO tipo_retrospectiva_item VALUES (6, 'Chap�u Preto - Acontecimentos Negativos', 2);
INSERT INTO tipo_retrospectiva_item VALUES (7, 'Chap�u Verde - Ideias', 2);
INSERT INTO tipo_retrospectiva_item VALUES (8, 'Chap�u Vermelho - Sentimentos', 2);

insert into configuracoes values ('tipoDeEstimativa', 'PMG');

ALTER TABLE ONLY backlog
    ADD CONSTRAINT backlog_pkey PRIMARY KEY (backlog_key);

ALTER TABLE ONLY kanban_status
    ADD CONSTRAINT kanban_status_pkey PRIMARY KEY (kanban_status_key);

ALTER TABLE ONLY papel
    ADD CONSTRAINT papel_pkey PRIMARY KEY (papel_key);

ALTER TABLE ONLY sprint
    ADD CONSTRAINT sprint_pkey PRIMARY KEY (sprint_key);

ALTER TABLE ONLY ticket_comentario
    ADD CONSTRAINT ticket_comentario_pkey PRIMARY KEY (ticket_comentario_key);

ALTER TABLE ONLY ticket_desenvolvedor
    ADD CONSTRAINT ticket_desenvolvedor_pkey PRIMARY KEY (ticket_key, usuario_key);
    
ALTER TABLE ONLY ticket_testador
    ADD CONSTRAINT ticket_testador_pkey PRIMARY KEY (ticket_key, usuario_key);

ALTER TABLE ONLY ticket_log
    ADD CONSTRAINT ticket_log_pkey PRIMARY KEY (ticket_history_key);

ALTER TABLE ONLY ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (ticket_key);

ALTER TABLE ONLY tipo_de_ticket
    ADD CONSTRAINT tipo_de_ticket_pkey PRIMARY KEY (tipo_de_ticket_key);

ALTER TABLE ONLY usuario_papel
    ADD CONSTRAINT usuario_papel_pkey PRIMARY KEY (usuario_key, papel_key);

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (username);

ALTER TABLE ONLY banco_de_dados
    ADD CONSTRAINT banco_de_dados_pkey PRIMARY KEY (banco_de_dados_key);

ALTER TABLE ONLY script
    ADD CONSTRAINT script_pkey PRIMARY KEY (script_key);

ALTER TABLE ONLY execucao
    ADD CONSTRAINT execucao_pkey PRIMARY KEY (execucao_key);

ALTER TABLE ONLY tipo_retrospectiva_item
    ADD CONSTRAINT tipo_retrospectiva_item_pkey PRIMARY KEY (tipo_retrospectiva_item_key);

ALTER TABLE ONLY retrospectiva
    ADD CONSTRAINT retrospectiva_pkey PRIMARY KEY (retrospectiva_key);

ALTER TABLE ONLY retrospectiva_item
    ADD CONSTRAINT retrospectiva_item_pkey PRIMARY KEY (retrospectiva_item_key);

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cliente_key);

ALTER TABLE ONLY tipo_retrospectiva
    ADD CONSTRAINT tipo_retrospectiva_pkey PRIMARY KEY (tipo_retrospectiva_key);

ALTER TABLE ONLY usuario_papel
    ADD CONSTRAINT fk4d25cd3566f20c10 FOREIGN KEY (papel_key) REFERENCES papel(papel_key);

ALTER TABLE ONLY usuario_papel
    ADD CONSTRAINT fk4d25cd358e8e74a4 FOREIGN KEY (usuario_key) REFERENCES usuario(username);

ALTER TABLE ONLY ticket_desenvolvedor
    ADD CONSTRAINT fk50e2688d6484a110 FOREIGN KEY (ticket_key) REFERENCES ticket(ticket_key);

ALTER TABLE ONLY ticket_desenvolvedor
    ADD CONSTRAINT fk50e2688d8e8e74a4 FOREIGN KEY (usuario_key) REFERENCES usuario(username);

ALTER TABLE ONLY ticket_testador
    ADD CONSTRAINT fk50e2688d6484a110 FOREIGN KEY (ticket_key) REFERENCES ticket(ticket_key);

ALTER TABLE ONLY ticket_testador
    ADD CONSTRAINT fk50e2688d8e8e74a4 FOREIGN KEY (usuario_key) REFERENCES usuario(username);
    
ALTER TABLE ONLY ticket_log
    ADD CONSTRAINT fk7c90d7916484a110 FOREIGN KEY (ticket_key) REFERENCES ticket(ticket_key);

ALTER TABLE ONLY ticket_comentario
    ADD CONSTRAINT fkae76b2f46484a110 FOREIGN KEY (ticket_key) REFERENCES ticket(ticket_key);

ALTER TABLE ONLY ticket_comentario
    ADD CONSTRAINT fk_ticket_comentario_usuario FOREIGN KEY (usuario_key) REFERENCES usuario(username);

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0c6bb18e7e FOREIGN KEY (backlog_key) REFERENCES backlog(backlog_key);

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0c9fff54d7 FOREIGN KEY (reporter_key) REFERENCES usuario(username);

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0cb145678c FOREIGN KEY (sprint) REFERENCES sprint(sprint_key);

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0cc41181bf FOREIGN KEY (kanban_status_key) REFERENCES kanban_status(kanban_status_key);

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0cd1a566bc FOREIGN KEY (tipo_de_ticket_key) REFERENCES tipo_de_ticket(tipo_de_ticket_key);

ALTER TABLE ONLY ticket
    ADD CONSTRAINT fkcbe86b0ce7f57efc FOREIGN KEY (pai) REFERENCES ticket(ticket_key);

ALTER TABLE ONLY execucao
    ADD CONSTRAINT fk_execucao_script FOREIGN KEY (script_key) REFERENCES script(script_key);    

ALTER TABLE ONLY execucao
    ADD CONSTRAINT fk_exeucao_banco_de_dados FOREIGN KEY (banco_de_dados_key) REFERENCES banco_de_dados(banco_de_dados_key);   
    
ALTER TABLE ONLY execucao
    ADD CONSTRAINT fk_execucao_usuario FOREIGN KEY (username) REFERENCES usuario(username);

ALTER TABLE ONLY retrospectiva
    ADD CONSTRAINT fk_retrospectiva_sprint FOREIGN KEY (sprint_key) REFERENCES sprint(sprint_key);

ALTER TABLE ONLY retrospectiva_item
    ADD CONSTRAINT fk_retrospectiva_item_retrospectiva FOREIGN KEY (retrospectiva_key) REFERENCES retrospectiva(retrospectiva_key);    

ALTER TABLE ONLY tipo_retrospectiva_item
    ADD CONSTRAINT fk_retrospectiva_item_tipo_retrospectiva_item FOREIGN KEY (tipo_retrospectiva_item_key) REFERENCES tipo_retrospectiva_item(tipo_retrospectiva_item_key);

ALTER TABLE ONLY USUARIO
    ADD CONSTRAINT FK_USUARIO_CLIENTE FOREIGN KEY (CLIENTE_KEY) REFERENCES CLIENTE (CLIENTE_KEY);

ALTER TABLE ONLY TICKET
    ADD CONSTRAINT FK_TICKET_CLIENTE FOREIGN KEY (CLIENTE_KEY) REFERENCES CLIENTE (CLIENTE_KEY);

ALTER TABLE ONLY retrospectiva
    ADD CONSTRAINT fk_retrospectiva_tipo_retrospectiva FOREIGN KEY (tipo_retrospectiva_key) REFERENCES tipo_retrospectiva;

ALTER TABLE ONLY tipo_retrospectiva_item
    ADD CONSTRAINT fk_tipo_retrospectiva_item_tipo_retrospectiva FOREIGN KEY (tipo_retrospectiva_key) REFERENCES tipo_retrospectiva;

ALTER TABLE ONLY TICKET
    ADD CONSTRAINT FK_TICKET_SCRIPT FOREIGN KEY (SCRIPT_KEY) REFERENCES SCRIPT (SCRIPT_KEY);

ALTER TABLE ONLY TICKET
    ADD CONSTRAINT FK_TICKET_CATEGORIA FOREIGN KEY (CATEGORIA_KEY) REFERENCES CATEGORIA (CATEGORIA_KEY);

alter table kanban_status add unique (ordem);
    
CREATE INDEX idx_ticket_sprint ON ticket USING btree (sprint);    
CREATE INDEX idx_ticket_tipo_de_ticket ON ticket USING btree (tipo_de_ticket_key);
CREATE INDEX idx_ticket_kaban_status ON ticket USING btree (kanban_status_key);
CREATE INDEX idx_ticket_backlog ON ticket USING btree (backlog_key);
CREATE INDEX idx_ticket_titulo ON ticket USING btree (titulo);
CREATE INDEX idx_ticket_cliente ON ticket USING btree (cliente_key);
CREATE INDEX idx_ticket_branch ON ticket USING btree (branch);
CREATE INDEX idx_execucao_script ON execucao USING btree (script_key);
CREATE INDEX idx_execucao_banco_de_dados ON execucao USING btree (banco_de_dados_key);
CREATE INDEX idx_ticket_script ON TICKET USING btree (SCRIPT_KEY);

CREATE INDEX idx_execucao_data ON EXECUCAO USING btree (data);
CREATE INDEX idx_ticket_data_de_pronto ON TICKET USING btree (data_de_pronto);
CREATE INDEX idx_ticket_pai ON TICKET USING btree (pai);
CREATE INDEX idx_ticket_comentario_ticket ON TICKET_COMENTARIO USING btree (ticket_key);
CREATE INDEX idx_ticket_comentario_data ON TICKET_COMENTARIO USING btree (data);
CREATE INDEX idx_ticket_comentario_usuario ON TICKET_COMENTARIO USING btree (usuario_key);
CREATE INDEX idx_ticket_log_ticket ON TICKET_LOG USING btree (ticket_key);
CREATE INDEX idx_sprint_atual ON SPRINT USING btree (atual);
CREATE INDEX idx_sprint_fechado ON SPRINT USING btree (fechado);
CREATE INDEX idx_retrospectiva_item_retrospectiva ON RETROSPECTIVA_ITEM USING btree (RETROSPECTIVA_KEY);
CREATE INDEX idx_ticket_categoria ON TICKET USING btree (categoria_key);
CREATE INDEX idx_ticket_prioridade  ON ticket  USING btree (prioridade);