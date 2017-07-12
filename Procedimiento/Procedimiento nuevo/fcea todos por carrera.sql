
set linesize 372;
set pagesize 50000;
set colsep ; ;
set headsep off;
set feedback off;
set echo off;



spool d:/seciu/salidas/fcea_por_carrera.csv

break on e.estci
select e.estci , a.tact, a.mat, m.nommat , a.fecha , a.per, a.tipoper, a.nota NOTAMATERIA, ma.crcurr, i.carr CARR, i.ciclo CICLO, ca.nomcar, i.lugar LUGARINSC, e.nomest NOMBRE,  e.celular CELULAR ,e.anio ANIOFINSEC, e.inst, ins.nominst, ins.tipoinst, ins.lugar LUGARINST, i.feceg, i.fecing FECHAING, i.obs
from estudiantes e, icarr i, activ a, matcarr ma, materias m, institutos ins, carreras ca
where i.fecing between to_number(20120101) and to_number(20170710) and
      i.estci = e.estci and 
	  ((i.carr = 11) OR (i.carr = 12) OR (i.carr = 14) OR (i.carr = 2) OR (i.carr = 3) OR (i.carr = 24) OR (i.carr = 33) OR (i.carr = 74)) and
	  e.estci = a.estci and
	  ma.carr = i.carr and
	  ma.mat = m.mat and
	  ma.mat = a.mat and
	  e.inst = ins.inst and
	  i.carr = ca.carr
order by e.nomest;

spool off;
Clear Break;
/