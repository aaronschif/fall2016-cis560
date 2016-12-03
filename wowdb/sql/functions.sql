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

/* Functions for populating vendor_gear */
create or replace function pop_vendor_gear ()
returns void
as $$
declare
  i int;
  j int;
begin
  for i in select id from vendor
  loop
    for j in select id from gear
    where price is not null
    loop
      insert into vendor_gear (vendor_id, gear_id)
      values (i, j);
    end loop;
  end loop;
end;
$$ language plpgsql;

/* Queries to show bosses in relation to dungeons
select distinct d.dungeon_name as Dungeons, string_agg(distinct b.name, ', ') as Bosses
from bosses b, dungeon d, boss_dungeon bd
where d.id = bd.dungeon_id
  and bd.boss_id = b.boss_id
group by Dungeons;

*/

/* Queries to show bosses in relation to raids
select distinct r.raid_name as Raids, string_agg(distinct b.name, ', ') as Bosses
from bosses b, raid r, boss_raid br
where r.id = br.raid_id
  and br.boss_id = b.boss_id
group by Raids;
*/

/* Query to show gear in relation to bosses
select b.name as boss, string_agg(g.name, ', ') as gear_drops
from bosses b, gear g, boss_gear bg
where b.boss_id = bg.boss_id
  and bg.gear_id = g.id
group by boss;
*/

/* Query to show gear in relation to specialization
select s.class_name as class, s.specialization_name as spec, g.name as gear
from specialization s, specialization_gear sg, gear g
where s.id = sg.specialization_id
  and sg.gear_id = g.id;
*/

/* Query to search based on class
select c.name as class, g.name as items, g.material as material
from class c, specialization s, specialization_gear sg, gear g
where s.class_id = c.id
  and sg.specialization_id = s.id
  and sg.gear_id = g.id;
*/

/* Query to select gear based on
select g.name as strength_gear
from gear g
where primary like '%Strength';
*/

/* Query to show sets in relation to class and specialization (INCOMPLETE)
select c.name as class, spec.specialization_name as specialization, s.name as "set"
from class c, specialization spec, specialization_gear sg, gear g, "set" s
where spec.class_id = c.id
  and sg.specialization_id = spec.id
  and sg.gear_id = g.id
  and s.set_item_1 = g.id
  and s.set_item_2 = g.id
  and s.set_item_3 = g.id
  and s.set_item_4 = g.id
  and s.set_item_5 = g.id
  and s.set_item_6 = g.id;
*/

/* Query to show gear items in relation to a set
select s.name,
from "set" s, gear g
where s.set_item_1 = g.id
  and s.set_item_2 = g.id
  and s.set_item_3 = g.id
  and s.set_item_4 = g.id
  and s.set_item_5 = g.id
  and s.set_item_6 = g.id;
*/

/* Query to show gear in relation to a boss it drops from
select b.name as boss, g.name as drop_items
from bosses b, boss_gear bg, gear g
where bg.boss_id = b.boss_id
  and bg.gear_id = g.id;
*/

/*(44, ), (44, ), (44, ),
           (45, ), (45, ), (45, ),
           (46, ), (46, ), (46, ),
           (47, ), (47, ), (47, ),
           (48, ), (48, ), (48, ),
           (49, ), (49, ), (49, ),
           (50, ), (50, ), (50, ),
           (51, ), (51, ), (51, ),
           (52, ), (52, ), (52, ),
           (53, ), (53, ), (53, ),
           (54, ), (54, ), (54, ),
           (55, ), (55, ), (55, ),
           (56, ), (56, ), (56, ),
           (57, ), (57, ), (57, ),
           (58, ), (58, ), (58, ),
           (59, ), (59, ), (59, ),
           (60, ), (60, ), (60, ),
           (61, ), (61, ), (61, ),
           (62, ), (62, ), (62, ),
           (63, ), (63, ), (63, ),
           (64, ), (64, ), (64, ),
           (65, ), (65, ), (65, ),
           (66, ), (66, ), (66, )*/