insert into faction (name)
values ('Alliance'),
       ('Horde')
on conflict do nothing;

insert into race (name, racial_trait_1, racial_trait_2)
values ()
on conflict do nothing;

insert into class (name)
values ()
on conflict do nothing;

insert into specialization (class_name, specialization_name)
values ()
on conflict do nothing;

insert into gear (name, primary_stat, secondary_stat, material, tradable)
values ()
on conflict do nothing;

insert into "set" (name, set_bonus)
values ()
on conflict do nothing;

insert into location (map_region)
values ()
on conflict do nothing;

insert into dungeon (dungeon_name, boss)
values ()
on conflict do nothing;

insert into raid (raid_name, boss)
values ()
on conflict do nothing;

insert into vendor (first_name, surname, price)
values ()
on conflict do nothing;