create or replace function StellarCountByAlpha (vMin number,vMax number, vclase VARCHAR2) return number
is
    n1 number(30);
    existe number;
begin

select count(*) into existe from objeto_estelar where class=vclase;

if vclase is null then
    select count(*) into n1 from objeto_estelar where alpha>vMin and alpha<vMax;
    return n1;
else
    if existe>0 then
        select count(*) into n1 from objeto_estelar where alpha>vMin and alpha<vMax and class=vclase;
        return n1;
    else
        return -1;
    end if;
end if;
end;
/

create or replace function StellarCountByDelta (vMin number,vMax number, vclase VARCHAR2) return number
is
    n1 number(30);
    existe number;
begin

select count(*) into existe from objeto_estelar where class=vclase;

if vclase is null then
    select count(*) into n1 from objeto_estelar where Delta>vMin and Delta<vMax;
    return n1;
else
    if existe>0 then
        select count(*) into n1 from objeto_estelar where Delta>vMin and Delta<vMax and class=vclase;
        return n1;
    else
        return -1;
    end if;
end if;
end;
/


-- Actualizar objetos QUASAR
UPDATE objeto_estelar
SET alpha = alpha + 0.01, delta = delta - 0.0065
WHERE class = 'QUASAR' AND (redshift > 2 OR redshift < -2);

-- Actualizar objetos ESTRELLA
UPDATE objeto_estelar
SET alpha = alpha + 0.0047, delta = delta - 0.0016
WHERE class = 'ESTRELLA' AND (redshift > 2 OR redshift < -2);
