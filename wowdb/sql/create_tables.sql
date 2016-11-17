create table if not exists faction (
    id serial primary key,
    name varchar(100) not null,
    unique (name)
);

create table if not exists race (
    id serial primary key,
    name varchar(100) not null,
    racial_trait_1 varchar(100) not null,
    racial_trait_2 varchar(100) not null,
    unique (name),
    unique (racial_trait_1),
    unique (racial_trait_2)
);

create table if not exists class (
    id serial primary key,
    name varchar(100) not null,
    unique (name)
);

create table if not exists specialization (
    id serial primary key,
    class_name varchar(100),
    specialization_name varchar(100) not null,
    foreign key (class_name)
      references class(name)
);

create table if not exists gear (
    id serial primary key,
    name varchar(300) not null,
    primary_stat varchar(100) not null,
    secondary_stat varchar(100) not null,
    material varchar(100) not null,
    tradable varchar(100) not null
);

create table if not exists "set" (
    set_id serial primary key,
    name varchar(300) not null,
    set_bonus varchar(100) not null,
    unique (name)
);

create table if not exists location (
    id serial primary key,
    map_region varchar(100) not null,
    unique (map_region)
);

create table if not exists dungeon (
    id serial,
    dungeon_name varchar(100) not null,
    boss varchar(100) not null,
    unique (dungeon_name),
    unique (boss),
    foreign key (id)
      references location (id)
);

create table if not exists raid (
    id serial,
    raid_name varchar(100) not null,
    boss varchar(100) not null,
    unique (raid_name),
    unique (boss),
    foreign key (id)
      references location (id)
);

create table if not exists vendor (
    id serial,
    first_name varchar(100) not null,
    surname varchar(100),
    price money,
    foreign key (id)
      references location (id)
);