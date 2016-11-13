
create table if not exists gear (
    id serial primary key,
    name varchar(300) not null,
    tradable boolean
);
