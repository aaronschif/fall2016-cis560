drop table if exists gear_location;
drop table if exists specialization_gear;
drop table if exists race_class;

drop table if exists "set";

drop table if exists gear;
drop table if exists vendor;
drop table if exists raid;
drop table if exists dungeon;
drop table if exists location;

drop table if exists specialization;
drop table if exists class;
drop table if exists race;
drop table if exists faction;


create table faction (
    id int primary key,
    name varchar(100) not null,
    unique (name)
);

create table race (
    id int primary key,
    name varchar(100) not null,
    racial_trait_1 varchar(100) not null,
    racial_trait_2 varchar(100) not null,
    unique (name),
    unique (racial_trait_1),
    unique (racial_trait_2)
);

create table faction_race (
    faction_id int,
    race_id int,
    foreign key (faction_id)
      references faction (id),
    foreign key (race_id)
      references race (id)
);

create table class (
    id int primary key,
    name varchar(100) not null,
    unique (name)
);

create table race_class (
    race_id int,
    class_id int,
    foreign key (race_id)
      references race (id),
    foreign key (class_id)
      references class (id)
);

create table specialization (
    id int primary key,
    class_name varchar(100),
    specialization_name varchar(100) not null,
    foreign key (class_name)
      references class(name)
);

create table gear (
    id int primary key,
    name varchar(300) not null,
    slot varchar(100) not null,
    primary_stat varchar(100) not null,
    secondary_stat_1 varchar(100) not null,
    secondary_stat_2 varchar(100) not null,
    material varchar(100),
    tradable boolean not null,
    price int DEFAULT NULL /* Currency is gold which acts like an int */
);

create table specialization_gear (
    specialization_id int,
    gear_id int,
    foreign key (specialization_id)
      references specialization (id),
    foreign key (gear_id)
      references gear (id)
);

create table "set" (
    set_id int primary key,
    name varchar(300) not null,
    set_item_1 int not null,
    set_item_2 int not null,
    set_item_3 int,
    set_item_4 int,
    set_item_5 int,
    set_item_6 int,
    set_bonus varchar(100) not null,
    unique (name),
    foreign key (set_item_1)
      references gear (id),
    foreign key (set_item_2)
      references gear (id),
    foreign key (set_item_3)
      references gear (id),
    foreign key (set_item_4)
      references gear (id),
    foreign key (set_item_5)
      references gear (id),
    foreign key (set_item_6)
      references gear (id)
);

create table location (
    id int primary key,
    map_region varchar(100) not null,
    unique (map_region)
);

create table gear_location (
    gear_id int,
    location_id int,
    foreign key (gear_id)
      references gear (id),
    foreign key (location_id)
      references location (id)
);

create table dungeon (
    id int,
    dungeon_name varchar(100) not null,
    boss varchar(100) not null,
    unique (dungeon_name),
    unique (boss),
    foreign key (id)
      references location (id)
);

create table raid (
    id int,
    raid_name varchar(100) not null,
    boss varchar(100) not null,
    unique (raid_name),
    unique (boss),
    foreign key (id)
      references location (id)
);

create table vendor (
    id int,
    first_name varchar(100) not null,
    surname varchar(100),
    foreign key (id)
      references location (id)
);