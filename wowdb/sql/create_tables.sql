drop table if exists gear_location;
drop table if exists specialization_gear;
drop table if exists race_class;

drop table if exists gear;
drop table if exists vendor;
drop table if exists raid;
drop table if exists dungeon;
drop table if exists location;

drop table if exists specialization;
drop table if exists "set";
drop table if exists class;
drop table if exists race;
drop table if exists faction;


create table faction (
    id serial primary key,
    name varchar(100) not null,
    unique (name)
);

create table race (
    id serial primary key,
    name varchar(100) not null,
    racial_trait_1 varchar(100) not null,
    racial_trait_2 varchar(100) not null,
    unique (name),
    unique (racial_trait_1),
    unique (racial_trait_2)
);

create table class (
    id serial primary key,
    name varchar(100) not null,
    unique (name)
);

create table race_class (
    race_id serial,
    class_id serial,
    foreign key (race_id)
      references race (id),
    foreign key (class_id)
      references class (id)
);

create table specialization (
    id serial primary key,
    class_name varchar(100),
    specialization_name varchar(100) not null,
    foreign key (class_name)
      references class(name)
);

create table gear (
    id serial primary key,
    name varchar(300) not null,
    primary_stat varchar(100) not null,
    secondary_stat_1 varchar(100) not null,
    secondary_stat_2 varchar(100) not null,
    material varchar(100) not null,
    tradable varchar(100) not null
);

create table specialization_gear (
    specialization_id serial,
    gear_id serial,
    foreign key (specialization_id)
      references specialization (id),
    foreign key (gear_id)
      references gear (id)
);

create table "set" (
    set_id serial primary key,
    name varchar(300) not null,
    set_bonus varchar(100) not null,
    unique (name)
);

create table location (
    id serial primary key,
    map_region varchar(100) not null,
    unique (map_region)
);

create table gear_location (
    gear_id serial,
    location_id serial,
    foreign key (gear_id)
      references gear (id),
    foreign key (location_id)
      references location (id)
);

create table dungeon (
    id serial,
    dungeon_name varchar(100) not null,
    boss varchar(100) not null,
    unique (dungeon_name),
    unique (boss),
    foreign key (id)
      references location (id)
);

create table raid (
    id serial,
    raid_name varchar(100) not null,
    boss varchar(100) not null,
    unique (raid_name),
    unique (boss),
    foreign key (id)
      references location (id)
);

create table vendor (
    id serial,
    first_name varchar(100) not null,
    surname varchar(100),
    price money,
    foreign key (id)
      references location (id)
);