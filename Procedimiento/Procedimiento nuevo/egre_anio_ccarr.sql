set lines 500
set colsep ; ;
set headsep off;
set feedback off;
set echo off;
set pages 50000
set ver off

def an1=&anio_inicial
def an2=&anio_final

spool d:/seciu/salidas/g_egre_anio_ccar.csv

ttitle ' Listado de los egresados (no incluye titulos parciales) entre los a√±os ' &an1 ' y ' &an2 skip 2 

select e.estci, e.nomest NOMBRE, trunc(g.feceg/10000) A—O_EGRESO, g.carr, g.ciclo, c.nomcar CARRERA, i.nomcic CICLO, e.sexo SEXO, lug.nomlugar LUGAR_NACIMIENTO, e.nacido FECHA_NACIMIENTO, g.feceg FECHA_EGRESO, e.tel TELEFONO, e.dir DIRECCION, e.mail
from   estudiantes e, egresos g, titulos t, carreras c, ciclos i, lugares lug
where e.estci = g.estci and trunc(g.feceg/10000) between &an1 and &an2
and   t.tipotit = 'T' and g.carr = t.carr and g.ciclo = t.ciclo and g.titulo = t.titulo
and   c.carr = g.carr and i.carr = g.carr and i.ciclo = g.ciclo 
and   lug.lugar = e.lugar 
order by e.nomest
/

spool off
set numw 10