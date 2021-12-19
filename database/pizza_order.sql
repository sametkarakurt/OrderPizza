BEGIN;

CREATE TABLE IF NOT EXISTS public.boyut
(
    boyut_id integer NOT NULL,
    boyut_turu character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT boyut_pkey PRIMARY KEY (boyut_id)
);

CREATE TABLE IF NOT EXISTS public.hamur
(
    hamur_id integer NOT NULL,
    hamur_tipi character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT hamur_pkey PRIMARY KEY (hamur_id)
);

CREATE TABLE IF NOT EXISTS public.kenar
(
    kenar_id integer NOT NULL,
    kenar_turu character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT kenar_pkey PRIMARY KEY (kenar_id)
);

CREATE TABLE IF NOT EXISTS public.musteri
(
    musteri_id integer NOT NULL,
    ad_soyad character varying COLLATE pg_catalog."default" NOT NULL,
    telefon_no character varying COLLATE pg_catalog."default" NOT NULL,
    adres character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT musteri_pkey PRIMARY KEY (musteri_id)
);

CREATE TABLE IF NOT EXISTS public.odeme
(
    odeme_id integer NOT NULL,
    odeme_turu character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT odeme_pkey PRIMARY KEY (odeme_id)
);

CREATE TABLE IF NOT EXISTS public.personel
(
    personel_id integer NOT NULL,
    personel_adi character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT personel_pkey PRIMARY KEY (personel_id)
);

CREATE TABLE IF NOT EXISTS public.peynir
(
    peynir_id integer NOT NULL,
    peynir_miktari character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT peynir_pkey PRIMARY KEY (peynir_id)
);

CREATE TABLE IF NOT EXISTS public.pizza
(
    pizza_id integer NOT NULL,
    hamur_id integer NOT NULL,
    sos_id integer NOT NULL,
    boyut_id integer NOT NULL,
    peynir_id integer NOT NULL,
    pizza_secenek_id integer NOT NULL,
    kenar_id integer NOT NULL,
    CONSTRAINT pizza_pkey PRIMARY KEY (pizza_id)
);

CREATE TABLE IF NOT EXISTS public.pizza_secenekleri
(
    pizza_secenek_id integer NOT NULL,
    pizza_secenegi character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pizza_secenekleri_pkey PRIMARY KEY (pizza_secenek_id)
);

CREATE TABLE IF NOT EXISTS public.siparis
(
    siparis_id integer NOT NULL,
    musteri_id integer NOT NULL,
    odeme_id integer NOT NULL,
    teslimat_id integer NOT NULL,
    sube_id integer NOT NULL,
    ucret integer NOT NULL,
    personel_id integer NOT NULL,
    pizza_id integer NOT NULL,
    CONSTRAINT siparis_pkey PRIMARY KEY (siparis_id)
);

CREATE TABLE IF NOT EXISTS public.sos
(
    sos_id integer NOT NULL,
    sos_turu character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT sos_pkey PRIMARY KEY (sos_id)
);

CREATE TABLE IF NOT EXISTS public.sube
(
    sube_id integer NOT NULL,
    sube_adi character varying COLLATE pg_catalog."default" NOT NULL,
    sube_telno character varying COLLATE pg_catalog."default" NOT NULL,
    sube_adres character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT sube_pkey PRIMARY KEY (sube_id)
);

CREATE TABLE IF NOT EXISTS public.teslimat
(
    teslimat_id integer NOT NULL,
    teslimat_turu character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT teslimat_pkey PRIMARY KEY (teslimat_id)
);

CREATE TABLE IF NOT EXISTS public.toplam_kazanc
(
    kazanc integer
);

CREATE TABLE IF NOT EXISTS public.toplam_siparis
(
    toplam_siparis integer
);

ALTER TABLE IF EXISTS public.pizza
    ADD CONSTRAINT boyut_id FOREIGN KEY (boyut_id)
    REFERENCES public.boyut (boyut_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.pizza
    ADD CONSTRAINT hamur_id FOREIGN KEY (hamur_id)
    REFERENCES public.hamur (hamur_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.pizza
    ADD CONSTRAINT kenar_id FOREIGN KEY (kenar_id)
    REFERENCES public.kenar (kenar_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.pizza
    ADD CONSTRAINT peynir_id FOREIGN KEY (peynir_id)
    REFERENCES public.peynir (peynir_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.pizza
    ADD CONSTRAINT pizza_secenek_id FOREIGN KEY (pizza_secenek_id)
    REFERENCES public.pizza_secenekleri (pizza_secenek_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.pizza
    ADD CONSTRAINT sos_id FOREIGN KEY (sos_id)
    REFERENCES public.sos (sos_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.siparis
    ADD CONSTRAINT musteri_id FOREIGN KEY (musteri_id)
    REFERENCES public.musteri (musteri_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public.siparis
    ADD CONSTRAINT odeme_id FOREIGN KEY (odeme_id)
    REFERENCES public.odeme (odeme_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.siparis
    ADD CONSTRAINT personel_id FOREIGN KEY (personel_id)
    REFERENCES public.personel (personel_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.siparis
    ADD CONSTRAINT sube_id FOREIGN KEY (sube_id)
    REFERENCES public.sube (sube_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.siparis
    ADD CONSTRAINT teslimat_id FOREIGN KEY (teslimat_id)
    REFERENCES public.teslimat (teslimat_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

--EKLEME İŞLEMLERİ

-------------------------PİZZA--------------------------------

--PİZZA SEÇENEKLERİ--
INSERT INTO pizza_secenekleri (pizza_secenek_id,pizza_secenegi) VALUES (1,'Bol Malzemos');
INSERT INTO pizza_secenekleri (pizza_secenek_id,pizza_secenegi) VALUES (2,'Tavuklu');
INSERT INTO pizza_secenekleri (pizza_secenek_id,pizza_secenegi) VALUES (3,'Sucuksever');
INSERT INTO pizza_secenekleri (pizza_secenek_id,pizza_secenegi) VALUES (4,'Karışık Pizza');
INSERT INTO pizza_secenekleri (pizza_secenek_id,pizza_secenegi) VALUES (5,'Margarita');
INSERT INTO pizza_secenekleri (pizza_secenek_id,pizza_secenegi) VALUES (6,'Italiano');


--HAMUR--
INSERT INTO hamur (hamur_id,hamur_tipi) VALUES (1,'Orijinal');
INSERT INTO hamur (hamur_id,hamur_tipi) VALUES (2,'İtalyan');
INSERT INTO hamur (hamur_id,hamur_tipi) VALUES (3,'Peynirli');

--BOYUT--

INSERT INTO boyut (boyut_id,boyut_turu) VALUES (1,'Küçük');
INSERT INTO boyut (boyut_id,boyut_turu) VALUES (2,'Orta');
INSERT INTO boyut (boyut_id,boyut_turu) VALUES (3,'Büyük');

--KENAR--

INSERT INTO kenar (kenar_id,kenar_turu) VALUES (1,'Sarımsaklı');
INSERT INTO kenar (kenar_id,kenar_turu) VALUES (2,'Barbekülü');
INSERT INTO kenar (kenar_id,kenar_turu) VALUES (3,'Ballı Hardallı');

--PEYNİR--

INSERT INTO peynir (peynir_id,peynir_miktari) VALUES (1,'Az');
INSERT INTO peynir (peynir_id,peynir_miktari) VALUES (2,'Orta');
INSERT INTO peynir (peynir_id,peynir_miktari) VALUES (3,'Çok');

--SOS--

INSERT INTO sos (sos_id,sos_turu) VALUES (1,'Sarımsak');
INSERT INTO sos (sos_id,sos_turu) VALUES (2,'Ballı Hardallı');
INSERT INTO sos (sos_id,sos_turu) VALUES (3,'Barbekü');
INSERT INTO sos (sos_id,sos_turu) VALUES (4,'Dominos');

-------------------------SİPARİS--------------------------------

--ODEME--
INSERT INTO odeme (odeme_id,odeme_turu) VALUES (1,'Kartla Ödeme');
INSERT INTO odeme (odeme_id,odeme_turu) VALUES (2,'Kapıda Ödeme');

--TESLİMAT--
INSERT INTO teslimat (teslimat_id,teslimat_turu) VALUES (1,'Şubeden Teslim');
INSERT INTO teslimat (teslimat_id,teslimat_turu) VALUES (2,'Adrese Teslim');

--SUBE--
INSERT INTO sube (sube_id,sube_adi,sube_telno,sube_adres) VALUES (1,'Serdivan','02643332222','İstiklal, Bağlar Cd. No: 62/9, 54055 Serdivan/Sakarya');
INSERT INTO sube (sube_id,sube_adi,sube_telno,sube_adres) VALUES (2,'Adapazarı','02642814747','Cumhuriyet, Dr.Nuri Bayar Cd no39/A, 54000 Adapazarı/Sakarya');

--PERSONEL--

INSERT INTO personel (personel_id,personel_adi) VALUES (1,'Ahmet Kapıcı');
INSERT INTO personel (personel_id,personel_adi) VALUES (2,'Elif Aydın');
INSERT INTO personel (personel_id,personel_adi) VALUES (3,'Sercan Polat');
INSERT INTO personel (personel_id,personel_adi) VALUES (4,'Nisa Tunahan');

--------------------TOPLAM SİPARİS -- KAZANC --------------------------

--KAZANC--
INSERT INTO toplam_kazanc (kazanc) VALUES (0);

--SIPARIS--

INSERT INTO toplam_siparis (toplam_siparis) VALUES (0);


-------------------------STORED PROCEDURE--------------------------------

--MÜŞTERİ KAYDETME--

CREATE PROCEDURE save_customer(integer,character varying,character varying,character varying)
LANGUAGE 'plpgsql'
AS $$

BEGIN
INSERT INTO musteri (musteri_id, ad_soyad, telefon_no, adres) values ($1,$2,$3,$4);
COMMIT;

END;
$$;

--SİPARİŞ KAYDETME--

CREATE PROCEDURE save_order(integer,integer,integer,integer,integer,integer,integer,integer)
LANGUAGE 'plpgsql'
AS $$

BEGIN
INSERT INTO siparis (siparis_id, musteri_id, odeme_id, teslimat_id, sube_id, personel_id, ucret,pizza_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8);
COMMIT;

END;
$$;


--PİZZA KAYDETME--

CREATE PROCEDURE save_pizza(integer,integer,integer,integer,integer,integer,integer)
LANGUAGE 'plpgsql'
AS $$

BEGIN
INSERT INTO pizza (pizza_id, pizza_secenek_id, hamur_id, sos_id, boyut_id, peynir_id, kenar_id) VALUES ($1, $2, $3, $4, $5, $6, $7);
COMMIT;

END;
$$;


--GÜNCELLEME--

CREATE PROCEDURE update(character varying,character varying,character varying,integer)
LANGUAGE 'plpgsql'
AS $$

BEGIN
UPDATE musteri SET ad_soyad=$1,telefon_no=$2,adres=$3 WHERE musteri_id=$4;
COMMIT;

END;
$$;

-------------------------------------TRIGGERS------------------------------------------

--KAZANÇ EKLEME--

create or replace function kazanc_ekleme()
returns trigger 
as 
$$
declare
toplam integer;
begin 
toplam:=(select sum(ucret) from siparis);
update toplam_kazanc set kazanc = toplam;
return new;
end;
$$
language plpgsql;

CREATE TRIGGER kazancEkleme
AFTER INSERT 
ON siparis
FOR EACH ROW
EXECUTE PROCEDURE kazanc_ekleme();

--KAZANC SİLME--

create or replace function kazanc_silme()
returns trigger 
as 
$$
declare
toplam integer;
begin 
toplam:=(select sum(ucret) from siparis);
update toplam_kazanc set kazanc = toplam;
return new;
end;
$$
language plpgsql;

CREATE TRIGGER kazancSilme
AFTER DELETE 
ON siparis
FOR EACH ROW
EXECUTE PROCEDURE kazanc_silme();

--TOPLAM SİPARİŞ SAYISINI ARTTIRMA--

create or replace function siparis_ekleme()
returns trigger 
as 
$$
begin
	update toplam_siparis set toplam_siparis = toplam_siparis + 1;
return new;
end;
$$
language plpgsql;

CREATE TRIGGER siparisEkleme
AFTER INSERT 
ON siparis
FOR EACH ROW
EXECUTE PROCEDURE siparis_ekleme();

--TOPLAM SİPARİS SAYISINI AZALTMA--

create or replace function siparis_silme()
returns trigger 
as 
$$
begin
	update toplam_siparis set toplam_siparis = toplam_siparis - 1;
return new;
end;
$$
language plpgsql;

CREATE TRIGGER siparisSilme
AFTER DELETE 
ON siparis
FOR EACH ROW
EXECUTE PROCEDURE siparis_silme();

---------------------------------------FUNCTIONS---------------------------

--SİPARİŞ BİLGİLERİNİ GETİR--
CREATE FUNCTION public.getAll() RETURNS TABLE(musteri_id integer, ad_soyad character varying, telefon_no character varying, adres character varying, siparis_id integer,teslimat_turu character varying,sube_adi character varying, ucret integer, personel_adi character varying,odeme_turu character varying)
LANGUAGE plpgsql
AS $$
begin 
RETURN QUERY
SELECT musteri.musteri_id,musteri.ad_soyad,musteri.telefon_no,musteri.adres,siparis.siparis_id,teslimat.teslimat_turu,sube.sube_adi,siparis.ucret,personel.personel_adi,odeme.odeme_turu FROM musteri JOIN siparis ON musteri.musteri_id = siparis.musteri_id JOIN odeme on odeme.odeme_id = siparis.odeme_id JOIN teslimat on teslimat.teslimat_id = siparis.teslimat_id JOIN sube on sube.sube_id = siparis.sube_id JOIN personel on personel.personel_id = siparis.personel_id;
end;
$$;

--MÜŞTERİ BİLGİLERİ GETİR--

CREATE FUNCTION public.getMusteri(integer) RETURNS TABLE(musteri_id integer, ad_soyad character varying, telefon_no character varying, adres character varying)
LANGUAGE plpgsql
AS $$
begin 
RETURN QUERY
SELECT musteri.musteri_id,musteri.ad_soyad,musteri.telefon_no,musteri.adres FROM musteri JOIN siparis ON musteri.musteri_id = siparis.musteri_id WHERE siparis.siparis_id = $1;
end;
$$;

--PİZZA BİLGİLERİNİ GETİR--
CREATE FUNCTION public.getPizza(integer) RETURNS TABLE(pizza_secenegi character varying, hamur_tipi character varying, sos_turu character varying, boyut_turu character varying,peynir_miktari character varying, kenar_turu character varying)
LANGUAGE plpgsql
AS $$
begin 
RETURN QUERY
SELECT pizza_secenekleri.pizza_secenegi,hamur.hamur_tipi,sos.sos_turu,boyut.boyut_turu,peynir.peynir_miktari,kenar.kenar_turu FROM pizza JOIN siparis on siparis.pizza_id = pizza.pizza_id JOIN kenar on kenar.kenar_id = pizza.kenar_id JOIN hamur on hamur.hamur_id = pizza.hamur_id JOIN sos on sos.sos_id = pizza.sos_id JOIN boyut on boyut.boyut_id = pizza.boyut_id JOIN peynir on peynir.peynir_id = pizza.peynir_id JOIN pizza_secenekleri on pizza_secenekleri.pizza_secenek_id = pizza.pizza_secenek_id WHERE siparis.siparis_id = $1;
end;
$$;

--SİPARİŞ SİLME--

CREATE FUNCTION public.deleteOrder(integer) RETURNS character varying
LANGUAGE plpgsql
AS $$
begin 
DELETE FROM siparis WHERE siparis.siparis_id=$1;
return "Sipariş Silindi";
end;
$$;



END;