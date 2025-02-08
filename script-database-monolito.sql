--Script criação das tabelas do banco de dados unificado - Arquitetura Monolítica

create table if not exists profile (
  id serial primary key,
  role varchar(255)  NOT NULL
);

create table if not exists user_account (
  id serial primary key,
  email varchar(255) NOT NULL,
  password varchar(45) NOT NULL,
  profile_id int references profile(id) NOT NULL
);

create table if not exists professional (
  id serial primary key,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  register_number varchar(255) NOT NULL,
  user_id int references user_account(id) NOT NULL
);

create table if not exists course (
  id serial primary key,
  name varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  syllabus text NOT NULL,
  total_hours int NOT NULL,
  goal_point int NOT NULL
);

create table if not exists course_activity (
  id serial primary key,
  score int NOT NULL,
  activity_type int NOT NULL,
  course_id int references course(id) NOT NULL,
  professional_id int references professional(id) NOT NULL
);

create table if not exists course_activity_type (
  id serial primary key,
  type varchar(255) NOT NULL
);

create table if not exists progress (
  id serial primary key,
  status varchar(45) NOT NULL,
  course_id int references course(id) NOT NULL,
  professional_id int references professional(id) NOT NULL,
  status_date timestamp NOT NULL
);

create table if not exists ranking (
  id serial primary key,
  total_score int NOT NULL,
  professional_id int references professional(id) NOT NULL
);


--Inserindo campos de tipos para testes

insert into profile (role) values ('Admin'), ('Professor'), ('Aluno');
insert into user_account (email, password, profile_id) values ('admin@email.com', 'admin', 1), ('joao@email.com', 'professor', 2);
insert into professional (name, email, register_number, user_id) values ('Joao da Silva', 'joao@email.com', '123456', 2);
insert into course_activity_type (type) values ('Prova'), ('Trabalho'), ('Atividade'), ('Atividade prática')

