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
create or replace function get_max_gear_num ()
returns int
as $$
declare
  i int;
  max_num int;
begin
  max_num := 0;
  for i in select id from gear
  loop
    max_num := max_num + 1;
  end loop;
  return max_num;
end;
$$ language plpgsql;

/* Source: https://www.if-not-true-then-false.com/2010/postgresql-select-a-random-number-in-a-range-between-two-numbers/
*/
create or replace function get_random_num (int, int)
returns int
as $$
declare
  start_int alias for $1;
  end_int alias for $2;
begin
  return trunc(random() * (end_int-start_int) + start_int);
end;
$$ language plpgsql;

create or replace function get_gear_num (gear_num int)
returns int
as $$
declare
  i int;
begin
  for i in select id
  from gear
  where gear.price is not null
  loop
    if (i = gear_num)
    then
      return i;
    end if;
  end loop;
  return NULL;
end;
$$ language plpgsql;

drop function if exists check_gear_num(int,int);
create or replace function check_gear_num (vend int, gear_num int)
returns boolean
as $$
declare
  i int;
  has_gear boolean;
begin
  has_gear := false;
  for i in select gear_id
           from vendor_gear vg
           where vg.vendor_id = vend
  loop
    if i = gear_num
    then
      has_gear := true;
      exit;
    end if;
  end loop;
  return has_gear;
end;
$$ language plpgsql;

create or replace function pop_vendor_gear ()
returns void
as $$
declare
  i int;
  j int;
  max_gear_num int;
  random_gear_num int;
  gear_num int;
  check_num boolean;
begin
  j := 0;
  check_num := false;
  max_gear_num := get_max_gear_num();
  for i in select id from vendor
  loop
    while j < 5
    loop
      while gear_num is NULL loop
        random_gear_num := get_random_num(1, max_gear_num);
        gear_num := get_gear_num(random_gear_num);
        check_num := check_gear_num (i, gear_num);
        if check_num = true
        then
          gear_num := NULL;
        end if;
      end loop;
      insert into vendor_gear (vendor_id, gear_id)
      values (i, gear_num);
      gear_num := NULL;
      j := j + 1;
    end loop;
    j := 0;
  end loop;
end;
$$ language plpgsql;

/* Query to show vendor in relation to gear
select v.first_name, v.surname, g.name as inventory, g.price as cost
from vendor v, vendor_gear vg, gear g
where vg.vendor_id = v.id
  and vg.gear_id = g.id;
*/

/* Query to show vendor in relation to gear, price, and map_region
select l.map_region, v.first_name, v.surname, g.name as inventory, g.price as cost
from location l, vendor v, vendor_gear vg, gear g
where v.id = l.id
  and vg.vendor_id = v.id
  and vg.gear_id = g.id;
*/

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
select s.name, g1.name as item_1, g2.name as item_2, g3.name as item_3, g4.name as item_4, g5.name as item_5, g6.name
       as item_6
from "set" s, gear g1, gear g2, gear g3, gear g4, gear g5, gear g6
where s.set_item_1 = g1.id
  and s.set_item_2 = g2.id
  and s.set_item_3 = g3.id
  and s.set_item_4 = g4.id
  and s.set_item_5 = g5.id
  and s.set_item_6 = g6.id;
*/

/* Query to show gear in relation to a boss it drops from
select b.name as boss, g.name as drop_items
from bosses b, boss_gear bg, gear g
where bg.boss_id = b.boss_id
  and bg.gear_id = g.id;
*/

/* Query to show sets in relation to specialization
select c.name as class, spec.specialization_name as specialization, s.name as sets
from class c, specialization spec, spec_set ss, "set" s
where spec.class_id = c.id
  and ss.spec_id = spec.id
  and ss.set_id = s.set_id;
*/

/* Query to show gear in relation to vendors
select v.first_name as first_name, v.surname as last_name, g.name as items, g.price as price
from vendor v, vendor_gear vg, gear g
where vg.vendor_id = v.id
  and vg.gear_id = g.id;
*/

/* General query to show gear located in a region, dungeon, and from a boss
select l.map_region as region, d.dungeon_name as dungeon, b.name as boss, g.name as gear
from location l, dungeon d, boss_dungeon bd, bosses b, boss_gear bg, gear g
where d.id = l.id
  and bd.dungeon_id = d.id
  and bd.boss_id = b.boss_id
  and bg.boss_id = b.boss_id
  and bg.gear_id = g.id;
*/

/* General query to show gear located in a region, raid, and from a boss
select l.map_region as region, r.raid_name as raid, b.name as boss, g.name as gear
from location l, raid r, boss_raid br, bosses b, boss_gear bg, gear g
where r.id = l.id
  and br.raid_id = r.id
  and br.boss_id = b.boss_id
  and bg.boss_id = b.boss_id
  and bg.gear_id = g.id;
*/

/* General query to show gear related to a faction, race, and specialization
select f.name as faction, r.name as race, c.name as class, spec.specialization_name as specialization, g.name as gear
from faction f, faction_race fr, race r, race_class rc, class c,
     specialization spec, specialization_gear sg, gear g
where fr.faction_id = f.id
  and fr.race_id = r.id
  and rc.race_id = r.id
  and rc.class_id = c.id
  and spec.class_id = c.id
  and sg.specialization_id = spec.id
  and sg.gear_id = g.id;
*/

/* Overall query to show gear in relation to dungeon, boss, region, faction, race, class, and specialization
select f.name as faction, r.name as race, c.name as class, spec.specialization_name as specialization,
       d.dungeon_name as dungeon, b.name as boss, l.map_region as region, g.name as gear
from faction f, faction_race fr, race r, race_class rc, class c,
     specialization spec, specialization_gear sg, gear g, boss_gear bg,
     bosses b, boss_dungeon bd, dungeon d, location l
where fr.faction_id = f.id
  and fr.race_id = r.id
  and rc.race_id = r.id
  and rc.class_id = c.id
  and spec.class_id = c.id
  and sg.specialization_id = spec.id
  and sg.gear_id = g.id
  and bg.gear_id = g.id
  and bg.boss_id = b.boss_id
  and bd.boss_id = b.boss_id
  and bd.dungeon_id = d.id
  and d.id = l.id
  and f.name like '%Alliance'
  and r.name like '%Human'
  and c.name like '%Warrior';
*/

/* Overall query to show gear in relation to raid, boss, region, faction, race, class, and specialization
select f.name as faction, r.name as race, c.name as class, spec.specialization_name as specialization,
       rd.raid_name as raid, b.name as boss, l.map_region as region, g.name as gear
from faction f, faction_race fr, race r, race_class rc, class c,
     specialization spec, specialization_gear sg, gear g, boss_gear bg,
     bosses b, boss_raid br, raid rd, location l
where fr.faction_id = f.id
  and fr.race_id = r.id
  and rc.race_id = r.id
  and rc.class_id = c.id
  and spec.class_id = c.id
  and sg.specialization_id = spec.id
  and sg.gear_id = g.id
  and bg.gear_id = g.id
  and bg.boss_id = b.boss_id
  and br.boss_id = b.boss_id
  and br.raid_id = rd.id
  and rd.id = l.id
  and f.name like '%Alliance'
  and r.name like '%Human'
  and c.name like '%Warrior';
*/

/* Query to retrieve all gear apart of a set.
select g.name, g.slot, g.primary_stat_val, g.primary_stat, g.sec_stat_1_val,
       g.secondary_stat_1, g.sec_stat_2_val, g.secondary_stat_2, g.material,
       g.tradable, g.price
from "set" s, set_gear sg, gear g
where sg.set_id = s.set_id
  and sg.gear_id = g.id
  and s.name like '%Doomblade';
*/

/*
select l.map_region as region, d.dungeon_name as dungeon, count(b.boss_id) as num_bosses
from location l, dungeon d, boss_dungeon bd, bosses b
where d.id = l.id
  and bd.dungeon_id = d.id
  and bd.boss_id = b.boss_id
group by region, dungeon
having count(b.boss_id) = (select count(*)
                           from boss_dungeon bd, dungeon d
                           where bd.dungeon_id = d.id);
*/

/*
select *
from gear g
where g.primary_stat like '%Strength'
  and g.material like '%Plate';
*/

/* Extra boss gear to be populated in boss_gear table
           (44, ), (44, ), (44, ),
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
           (66, ), (66, ), (66, ),
*/