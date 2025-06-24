create type polymorphic.item_type as enum (
  'TOPIC'
);

create table polymorphic.relational_items (
  id serial primary key,

  type polymorphic.item_type not null default 'TOPIC'::polymorphic.item_type,
  updated_at timestamptz not null default now()
);

create table polymorphic.relational_topics (
  id int primary key references polymorphic.relational_items,
  title text not null
);

comment on table polymorphic.relational_items is $$
  @interface mode:relational type:type
  @type TOPIC references:relational_topics
  $$;
