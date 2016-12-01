create or replace function pop_spec_plate_strength(spec int)
returns boolean
as $$
declare
   success boolean;
begin
  success := false;
  if (spec == 1 || spec == 2 || spec == 3 ||
      spec == 18 || spec == 19 || spec == 32 ||
      spec == 33 || spec == 34)
  then
    select g.id
    from gear g
    where g.material like '%Plate'
      and g.primary_stat like '%Strength';
    insert into specialization_gear(specialization_id, gear_id)
    values (spec, g.id);
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_mail_agility(spec int)
returns boolean
as $$
declare
  success boolean;
begin
  success := false;
  if (spec == 8 || spec == 9 || spec == 10 ||
      spec == 27)
  then
    select g.id
    from gear g
    where g.material like '%Mail'
      and g.primary_stat like '%Agility';
    insert into specialization_gear(specialization_id, gear_id)
    values (spec, g.id);
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_cloth_intellect(spec int)
returns boolean
as $$
declare
  success boolean;
begin
  success := false;
  if (spec == 11 || spec == 12 || spec == 13 ||
      spec == 20 || spec == 21 || spec == 22 ||
      spec == 29 || spec == 30 || spec == 31)
  then
    select g.id
    from gear g
    where g.material like '%Cloth'
      and g.primary_stat like '%Intellect';
    insert into specialization_gear(specialization_id, gear_id)
    values (spec, g.id);
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_leather_intellect(spec int)
returns boolean
as $$
declare
  success boolean;
begin
  success := false;
  if (spec == 4 || spec == 5 || spec == 15)
  then
    select g.id
    from gear g
    where g.material like '%Leather'
      and g.primary_stat like '%Intellect';
    insert into specialization_gear(specialization_id, gear_id)
    values (spec, g.id);
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_leather_agility(spec int)
returns boolean
as $$
declare
  success boolean;
begin
  success := false;
  if (spec == 7 || spec == 16 || spec == 23 ||
      spec == 24 || spec == 25)
  then
    select g.id
    from gear g
    where g.material like '%Leather'
      and g.primary_stat like '%Agility';
    insert into specialization_gear(specialization_id, gear_id)
    values (spec, g.id);
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_mail_intellect(spec int)
returns boolean
as $$
declare
  success boolean;
begin
  success := false;
  if (spec == 26 || spec == 28)
  then
    select g.id
    from gear g
    where g.material like '%Mail'
      and g.primary_stat like '%Intellect';
    insert into specialization_gear(specialization_id, gear_id)
    values (spec, g.id);
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_plate_intellect(spec int)
returns boolean
as $$
declare
  success boolean;
begin
  success := false;
  if (spec == 17)
  then
    select g.id
    from gear g
    where g.material like '%Plate'
      and g.primary_stat like '%Intellect';
    insert into specialization_gear(specialization_id, gear_id)
    values (spec, g.id);
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_leather_strength(spec int)
returns boolean
as $$
declare
  success boolean;
begin
  success := false;
  if (spec == 6 || spec == 14)
  then
    select g.id
    from gear g
    where g.material like '%Leather'
      and g.primary_stat like '%Strength';
    insert into specialization_gear(specialization_id, gear_id)
    values (spec, g.id);
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

