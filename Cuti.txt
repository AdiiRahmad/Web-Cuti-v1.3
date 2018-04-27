//Membuat Tabel Karyawan

CREATE TABLE  "KARYAWAN" 
   (	"NIK" CHAR(4), 
	"NAMA" VARCHAR2(20), 
	"AGAMA" VARCHAR2(10), 
	"ALAMAT" VARCHAR2(25), 
	"TANGGAL_LAHIR" DATE, 
	"TGL_MULAI_KERJA" DATE, 
	"JENIS_KELAMIN" VARCHAR2(10), 
	"SISA" NUMBER(2,0), 
	"ID_JABATAN" CHAR(4), 
	"STATUS" VARCHAR2(8), 
	 CONSTRAINT "KARYAWAN_PK" PRIMARY KEY ("NIK") ENABLE
   ) ;ALTER TABLE  "KARYAWAN" ADD CONSTRAINT "JABATAN_FK" FOREIGN KEY ("ID_JABATAN")
	  REFERENCES  "JABATAN" ("ID_JABATAN") ENABLE;


//Membuat Tabel Cuti
CREATE TABLE  "CUTI" 
   (	"ID_CUTI" CHAR(4), 
	"JENIS_CUTI" VARCHAR2(50), 
	"DURASI" NUMBER(5,0), 
	"KETERANGAN_CUTI" VARCHAR2(50), 
	 CONSTRAINT "CUTI_PK" PRIMARY KEY ("ID_CUTI") ENABLE
   ) ;


//Membuat Tabel Detail Cuti
   CREATE TABLE  "DETAIL_CUTI" 
   (	"ID_DETAIL_CUTI" CHAR(4), 
	"NIK" CHAR(4), 
	"ID_CUTI" CHAR(4), 
	"KETERANGAN" VARCHAR2(50), 
	"TANGGAL_MULAI" DATE, 
	"LAMA_CUTI" NUMBER(2,0), 
	"STATUS" VARCHAR2(10), 
	 CONSTRAINT "DETAIL_CUTI_PK" PRIMARY KEY ("ID_DETAIL_CUTI") ENABLE
   ) ;ALTER TABLE  "DETAIL_CUTI" ADD CONSTRAINT "DETAIL_CUTI_FK2" FOREIGN KEY ("ID_CUTI")
	  REFERENCES  "CUTI" ("ID_CUTI") ENABLE;


//Membuat tabel Jabatan
CREATE TABLE  "JABATAN" 
   (	"ID_JABATAN" CHAR(4), 
	"JABATAN" VARCHAR2(15), 
	 CONSTRAINT "JABATAN_PK" PRIMARY KEY ("ID_JABATAN") ENABLE
   ) ;

   TRIGGER DETAIL CUTI
   CREATE OR REPLACE TRIGGER  "SISA" 
after insert or update on Detail_Cuti
for each row 
DECLARE 

SISACUTI NUMBER(10);
begin 
IF (:new.Status ='Diterima') then
   DBMS_OUTPUT.PUT_LINE('PENGAJUAN DITERIMA');
END IF;
IF (:new.Status ='Ditolak') then 
    DBMS_OUTPUT.PUT_LINE('PENGAJUAN DITOLAK');
END IF;
SELECT SISA INTO SISACUTI FROM KARYAWAN WHERE nik =:new.NIK;

IF (SISACUTI < :new.LAMA_CUTI) THEN 
    DBMS_OUTPUT.PUT_LINE('PENGAJUAN DITOLAK SISA CUTI KOSONG');
END IF;
IF (SISACUTI > :new.LAMA_CUTI AND :new.id_cuti ='C004' OR :new.id_cuti ='C005') THEN 
   update Karyawan set SISA = SISA -:new.Lama_Cuti
   where nik =:new.NIK;
END IF;
IF (:new.id_cuti ='C001' OR :new.id_cuti ='C002' OR :new.id_cuti ='C003') then
    dbms_output.put_line('Data berhasil ditambah tanpa mengurangi');
END IF;
END;
/
ALTER TRIGGER  "SISA" ENABLE;



//Insert Ke Tabel Karyawan
insert all
into karyawan values('K001','Administrations','Islam','Islam',to_date('2018-03-01','YYYY-MM-DD'),to_date('2012-11-05','YYYY-MM-DD'),'Laki-Laki','12','J001','Aktif')
select * from dual

//Insert ke Tabel Jabatan
insert all
into jabatan values('J001','Pim.Manager')
into jabatan values('J002','HRD')
into jabatan values('J003','Direksi')
into jabatan values('J004','Karyawan')
into jabatan values('J005','Manager')
into jabatan values('J006','HRD')
into jabatan values('J007','Karyawan')
into jabatan values('J008','HRD')
into jabatan values('J009','Karyawan')
into jabatan values('J010','Karyawan')
into jabatan values('J011','Manager')
into jabatan values('J012','Manager')
into jabatan values('J013','Karyawan')
into jabatan values('J014','HRD')
into jabatan values('J015','Karyawan')
into jabatan values('J016','Manager')
into jabatan values('J017','Karyawan')
into jabatan values('J018','Karyawan')
into jabatan values('J019','HRD')
into jabatan values('J020','Karyawan')
select * from dual


//Insert ke Tabel Cuti
INSERT all
into cuti values('C001','Cuti Kehamilan','60','Tidak Mengurangi Jatah Cuti')
into cuti values('C002','Cuti Menikah','3','Tidak Mengurangi Jatah Cuti')
into cuti values('C003','Cuti Meninggal Dunia','1','Tidak Mengurangi Jatah Cuti')
into cuti values('C004','Cuti Sakit','0','Mengurangi Jatah Cuti')
into cuti values('C005','Cuti Khusus','0','Mengurangi Jatah Cuti')
into cuti values('C006','Cuti Bersama','0','Tidak Mengurangi Jatah Cuti')
select * from dual




