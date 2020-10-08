drop table if exists bank_info;
drop extension if exists "pgcrypto";


create extension if not exists "pgcrypto";


create table if not exists bank_info (
    id uuid primary key default gen_random_uuid(),
    url varchar(100) not null,
    bank_code  varchar(100) not null,
    createdAt timestamp without time zone default (now() at time zone 'utc'),
    updatedAt timestamp without time zone default (now() at time zone 'utc'),
    CHECK (url <> ''),
    CHECK (bank_code <> '')
);


drop table if exists payments;


create table if not exists payments (
    id serial primary key,

    amount numeric(10, 4) not null,

    beneficiary_name varchar(100) not null,
    beneficiary_account_number integer not null,
    beneficiary_ifsc_code varchar(100) not null,

    payee_name varchar(100) not null,
    payee_account_number integer not null,
    payee_ifsc_code varchar(100) not null,

    status varchar(100) not null,

    createdAt timestamp without time zone default (now() at time zone 'utc'),
    updatedAt timestamp without time zone default (now() at time zone 'utc')
);


ALTER TABLE bank_info DROP CONSTRAINT IF EXISTS unique_url;
ALTER TABLE bank_info DROP CONSTRAINT IF EXISTS unique_bank_code;


ALTER TABLE bank_info ADD CONSTRAINT unique_url UNIQUE (url);
ALTER TABLE bank_info ADD CONSTRAINT unique_bank_code UNIQUE (bank_code);
