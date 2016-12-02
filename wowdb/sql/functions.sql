/* Functions for populating specialization_gear */
create or replace function pop_spec_plate_strength(spec int)
returns boolean
as $$
declare
   i int;
   success boolean;
begin
  success := false;
  if (spec = 1 or spec = 2 or spec = 3 or
      spec = 18 or spec = 19 or spec = 32 or
      spec = 33 or spec = 34)
  then
    for i in select g.id
    from gear g
    where g.material like '%Plate'
      and g.primary_stat like '%Strength'
    loop
      insert into specialization_gear(specialization_id, gear_id)
      values (spec, i);
    end loop;
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_mail_agility(spec int)
returns boolean
as $$
declare
  i int;
  success boolean;
begin
  success := false;
  if (spec = 8 or spec = 9 or spec = 10 or
      spec = 27)
  then
    for i in select g.id
    from gear g
    where g.material like '%Mail'
      and g.primary_stat like '%Agility'
    loop
      insert into specialization_gear(specialization_id, gear_id)
      values (spec, i);
    end loop;
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_cloth_intellect(spec int)
returns boolean
as $$
declare
  i int;
  success boolean;
begin
  success := false;
  if (spec = 11 or spec = 12 or spec = 13 or
      spec = 20 or spec = 21 or spec = 22 or
      spec = 29 or spec = 30 or spec = 31)
  then
    for i in select g.id
    from gear g
    where g.material like '%Cloth'
      and g.primary_stat like '%Intellect'
    loop
      insert into specialization_gear(specialization_id, gear_id)
      values (spec, i);
    end loop;
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_leather_intellect(spec int)
returns boolean
as $$
declare
  i int;
  success boolean;
begin
  success := false;
  if (spec = 4 or spec = 5 or spec = 15)
  then
    for i in select g.id
    from gear g
    where g.material like '%Leather'
      and g.primary_stat like '%Intellect'
    loop
      insert into specialization_gear(specialization_id, gear_id)
      values (spec, i);
    end loop;
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_leather_agility(spec int)
returns boolean
as $$
declare
  i int;
  success boolean;
begin
  success := false;
  if (spec = 7 or spec = 16 or spec = 23 or
      spec = 24 or spec = 25)
  then
    for i in select g.id
    from gear g
    where g.material like '%Leather'
      and g.primary_stat like '%Agility'
    loop
      insert into specialization_gear(specialization_id, gear_id)
      values (spec, i);
    end loop;
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_mail_intellect(spec int)
returns boolean
as $$
declare
  i int;
  success boolean;
begin
  success := false;
  if (spec = 26 or spec = 28)
  then
    for i in select g.id
    from gear g
    where g.material like '%Mail'
      and g.primary_stat like '%Intellect'
    loop
      insert into specialization_gear(specialization_id, gear_id)
      values (spec, i);
    end loop;
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_plate_intellect(spec int)
returns boolean
as $$
declare
  i int;
  success boolean;
begin
  success := false;
  if (spec = 17)
  then
    for i in select g.id
    from gear g
    where g.material like '%Plate'
      and g.primary_stat like '%Intellect'
    loop
      insert into specialization_gear(specialization_id, gear_id)
      values (spec, i);
    end loop;
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_leather_strength(spec int)
returns boolean
as $$
declare
  i int;
  success boolean;
begin
  success := false;
  if (spec = 6 or spec = 14)
  then
    for i in select g.id
    from gear g
    where g.material like '%Leather'
      and g.primary_stat like '%Strength'
    loop
      insert into specialization_gear(specialization_id, gear_id)
      values (spec, i);
    end loop;
    success := true;
  end if;
  return success;
end;
$$ language plpgsql;

create or replace function pop_spec_gear()
returns void
as $$
declare
  i int;
  success boolean;
begin
  for i in select id from specialization
  loop
    success := false;
    while success <> true loop
      success = pop_spec_plate_strength(i);
      if success = true
      then
        exit;
      end if;
      success = pop_spec_mail_agility(i);
      if success = true
      then
        exit;
      end if;
      success = pop_spec_cloth_intellect(i);
      if success = true
      then
        exit;
      end if;
      success = pop_spec_leather_intellect(i);
      if success = true
      then
        exit;
      end if;
      success = pop_spec_leather_agility(i);
      if success = true
      then
        exit;
      end if;
      success = pop_spec_mail_intellect(i);
      if success = true
      then
        exit;
      end if;
      success = pop_spec_plate_intellect(i);
      if success = true
      then
        exit;
      end if;
      success = pop_spec_leather_strength(i);
      if success = true
      then
        exit;
      end if;
    end loop;
  end loop;
end;
$$ language plpgsql;

/* Functions for populating gear_location */
create or replace function pop_gear_loc ()
returns void
as $$
begin
end;
$$ language plpgsql;

