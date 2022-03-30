create table advogado (
	cod_adv INT PRIMARY KEY,
	num_oab FOREIGN KEY,
    nm_advogado VARCHAR(50),
	gender VARCHAR(1),
);
insert into advogado (cod_adv, num_oab, nm_advogado, gender) values (1, '347.870 - RJ', 'Jorge Cleber', 'M');
insert into advogado (cod_adv, num_oab, nm_advogado, gender) values (2, '381.668 - RJ', 'Bruno Aguiar', 'M');
