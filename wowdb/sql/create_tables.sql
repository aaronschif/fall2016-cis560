drop table if exists comment;
drop table if exists "user";
drop table if exists specialization_gear;
drop table if exists race_class;
drop table if exists faction_race;
drop table if exists boss_dungeon;
drop table if exists boss_raid;
drop table if exists boss_gear;
drop table if exists vendor_gear;
drop table if exists spec_set;
drop table if exists set_gear;

drop table if exists "set";
drop table if exists race CASCADE ;
drop table if exists faction_race CASCADE ;

drop table if exists bosses;
drop table if exists gear;
drop table if exists vendor;
drop table if exists raid;
drop table if exists dungeon;
drop table if exists location;

drop table if exists specialization;
drop table if exists class;
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
    class_id int,
    specialization_name varchar(100) not null,
    foreign key (class_id)
      references class(id)
);

create table gear (
    id int primary key,
    name varchar(300) not null,
    slot varchar(100) not null,
    primary_stat_val int not null,
    primary_stat varchar(100) not null,
    sec_stat_1_val int not null,
    secondary_stat_1 varchar(100) not null,
    sec_stat_2_val int not null,
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
    set_bonus varchar(100) not null,
    unique (name)
);

create table set_gear (
    set_id int,
    gear_id int,
    foreign key (set_id)
      references "set" (set_id),
    foreign key (gear_id)
      references gear (id)
);

create table spec_set (
    spec_id int,
    set_id int,
    foreign key (spec_id)
      references specialization (id),
    foreign key (set_id)
      references "set" (set_id)
);

create table location (
    id int primary key,
    loc_type varchar(100) not null,
    map_region varchar(100) not null
);

create table dungeon (
    id int,
    dungeon_name varchar(100) not null,
    unique (dungeon_name),
    foreign key (id)
      references location (id)
);

create table raid (
    id int,
    raid_name varchar(100) not null,
    unique (raid_name),
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

create table bosses (
    boss_id int primary key,
    name varchar(300) not null,
    unique (name)
);

create table boss_dungeon (
    dungeon_id int,
    boss_id int,
    foreign key (dungeon_id)
      references location (id),
    foreign key (boss_id)
      references bosses (boss_id)
);

create table boss_raid (
    raid_id int,
    boss_id int,
    foreign key (raid_id)
      references location (id),
    foreign key (boss_id)
      references bosses (boss_id)
);

create table vendor_gear (
    vendor_id int,
    gear_id int,
    foreign key (vendor_id)
      references location (id),
    foreign key (gear_id)
      references gear (id)
);

create table boss_gear (
    boss_id int,
    gear_id int,
    foreign key (boss_id)
      references bosses (boss_id),
    foreign key (gear_id)
      references gear (id)
);

create table "user"(
    id serial primary key,
    username varchar(50) not null unique,
    password varchar(50)
);

create table comment (
    id serial primary key,
    "user" int references "user"(id) not null,
    "gear" int references "gear"(id) not null,
    commented timestamp not null default now(),
    comment text not null
);
