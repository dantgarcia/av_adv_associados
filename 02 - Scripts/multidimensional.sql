
CREATE TABLE public.dim_data (
                sk_data INTEGER NOT NULL,
                nk_data DATE NOT NULL,
                desc_data_completa VARCHAR(60) NOT NULL,
                nr_ano INTEGER NOT NULL,
                nm_trimestre VARCHAR(20) NOT NULL,
                nr_ano_trimestre VARCHAR(20) NOT NULL,
                nr_mes INTEGER NOT NULL,
                nm_mes VARCHAR(20) NOT NULL,
                ano_mes VARCHAR(20) NOT NULL,
                nr_semana INTEGER NOT NULL,
                ano_semana VARCHAR(20) NOT NULL,
                nr_dia INTEGER NOT NULL,
                nr_dia_ano INTEGER NOT NULL,
                nm_dia_semana VARCHAR(20) NOT NULL,
                flag_final_semana CHAR(3) NOT NULL,
                flag_feriado CHAR(3) NOT NULL,
                nm_feriado VARCHAR(60) NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_data_pk PRIMARY KEY (sk_data)
);


CREATE SEQUENCE public.dim_advogado_sk_advogado_seq;

CREATE SEQUENCE public.dim_advogado_nk_advogado_seq;

CREATE TABLE public.dim_advogado (
                sk_advogado INTEGER NOT NULL DEFAULT nextval('public.dim_advogado_sk_advogado_seq'),
                nk_advogado INTEGER NOT NULL DEFAULT nextval('public.dim_advogado_nk_advogado_seq'),
                cod_adv VARCHAR NOT NULL,
                nm_advogado VARCHAR(50) NOT NULL,
                gender CHAR(1) NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_advogado PRIMARY KEY (sk_advogado)
);


ALTER SEQUENCE public.dim_advogado_sk_advogado_seq OWNED BY public.dim_advogado.sk_advogado;

ALTER SEQUENCE public.dim_advogado_nk_advogado_seq OWNED BY public.dim_advogado.nk_advogado;

CREATE SEQUENCE public.dim_cliente_sk_cliente_seq;

CREATE SEQUENCE public.dim_cliente_nk_cliente_seq;

CREATE TABLE public.dim_cliente (
                sk_cliente INTEGER NOT NULL DEFAULT nextval('public.dim_cliente_sk_cliente_seq'),
                nk_cliente INTEGER NOT NULL DEFAULT nextval('public.dim_cliente_nk_cliente_seq'),
                cod_cliente VARCHAR NOT NULL,
                nm_cliente VARCHAR(50) NOT NULL,
                gender CHAR(1) NOT NULL,
                dt_nascimento DATE NOT NULL,
                profissao VARCHAR(25) NOT NULL,
                estado_civil VARCHAR(10) NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
);


ALTER SEQUENCE public.dim_cliente_sk_cliente_seq OWNED BY public.dim_cliente.sk_cliente;

ALTER SEQUENCE public.dim_cliente_nk_cliente_seq OWNED BY public.dim_cliente.nk_cliente;

CREATE TABLE public.fato_processo (
                num_processo INTEGER NOT NULL,
                tipo_processo VARCHAR(15) NOT NULL,
                dt_inicio DATE NOT NULL,
                dt_fim DATE NOT NULL,
                sk_cliente INTEGER NOT NULL,
                sk_advogado INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                vl_recebido REAL NOT NULL
);


ALTER TABLE public.fato_processo ADD CONSTRAINT dim_data_fato_processo_fk
FOREIGN KEY (sk_data)
REFERENCES public.dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fato_processo ADD CONSTRAINT dim_advogado_fato_processo_fk
FOREIGN KEY (sk_advogado)
REFERENCES public.dim_advogado (sk_advogado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fato_processo ADD CONSTRAINT dim_cliente_fato_processo_fk
FOREIGN KEY (sk_cliente)
REFERENCES public.dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
