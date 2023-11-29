USE WSBrasil;

select * from login;

exec sp_rename 'login.[email.o]','email','column';

exec sp_rename 'mundo','login';

alter table login drop column senha;

alter table login add senha nchar(32);

alter table login add datahoracriacao datetime;

alter table login add datahoradoultimoacesso datetime;

insert into login (email,senha,datahoracriacao,datahoradoultimoacesso)
VALUEs('sddsdsdsd@gmail.com',31432743247327,'2023-10-12T12:23:09','2023-10-14T12:32:00'),
('sddsdewewesdsd@gmail.com',34542743247327,'2023-10-12T12:23:00','2023-10-14T12:32:00'),
('sddsdewewesdsd@gmail.com',34542743247327,'2023-10-12T12:23:00','2023-10-14T12:32:00');

select * from sys.tables;--mostra tabelas
select name, create_date, modify_date  from sys.tables;