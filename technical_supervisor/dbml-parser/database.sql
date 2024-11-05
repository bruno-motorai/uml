CREATE TYPE "ads_state" AS ENUM (
  'in_reparation',
  'in_review',
  'stand_by',
  'driving',
  'degraded_driving',
  'mrs'
);

CREATE TYPE "case_state" AS ENUM (
  'open',
  'closed',
  'solved'
);

CREATE TYPE "mrm_type" AS ENUM (
  'straight_stop',
  'inlane_stop',
  'road_should_stop'
);

CREATE TABLE "case" (
  "id" integer PRIMARY KEY,
  "ads_id" integer,
  "user_id" integer,
  "reason_to_be_closed" varchar,
  "send_to_workshop" boolean,
  "created" timestamp,
  "updated" timestamp,
  "closed" timestamp,
  "state" case_state
);

CREATE TABLE "case_comment" (
  "id" integer PRIMARY KEY,
  "case_id" integer,
  "user_id" integer,
  "comment" varchar,
  "created" timestamp
);

CREATE TABLE "comment_image" (
  "id" integer PRIMARY KEY,
  "image" bytea,
  "comment_id" integer,
  "created" timestamp
);

CREATE TABLE "geozone" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "description" varchar,
  "created" timestamp,
  "updated" timestamp,
  "boundaries" JSONB
);

CREATE TABLE "user_geozone" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "geozone_id" integer,
  "created" timestamp,
  "updated" timestamp
);

CREATE TABLE "user" (
  "id" integer PRIMARY KEY,
  "email" varchar,
  "password" varchar,
  "created" timestamp,
  "updated" timestamp
);

CREATE TABLE "user_role" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "role_id" integer,
  "created" timestamp,
  "updated" timestamp
);

CREATE TABLE "role" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "created" timestamp,
  "updated" timestamp
);

CREATE TABLE "role_permission" (
  "id" integer PRIMARY KEY,
  "role_id" integer,
  "permission_id" integer,
  "created" timestamp,
  "updated" timestamp
);

CREATE TABLE "permission" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "created" timestamp,
  "updated" timestamp
);

ALTER TABLE "case" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "case_comment" ADD FOREIGN KEY ("case_id") REFERENCES "case" ("id");

ALTER TABLE "case_comment" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "comment_image" ADD FOREIGN KEY ("comment_id") REFERENCES "case_comment" ("id");

ALTER TABLE "user_geozone" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_geozone" ADD FOREIGN KEY ("geozone_id") REFERENCES "geozone" ("id");

ALTER TABLE "user_role" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_role" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");

ALTER TABLE "role_permission" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");

ALTER TABLE "role_permission" ADD FOREIGN KEY ("permission_id") REFERENCES "permission" ("id");
