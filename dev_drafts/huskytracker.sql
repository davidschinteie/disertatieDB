-- -------------------------------------------------------------
-- TablePlus 3.1.2(296)
--
-- https://tableplus.com/
--
-- Database: huskytracker
-- Generation Time: 2020-03-07 16:27:03.7100
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "okapi"."accounts";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS okapi.accounts_id_seq;

-- Table Definition
CREATE TABLE "okapi"."accounts" (
    "id" int8 NOT NULL DEFAULT nextval('okapi.accounts_id_seq'::regclass),
    "name" varchar,
    "subdomain" varchar,
    "owner_id" uuid,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "subscription_id" varchar,
    "subscription_status" varchar,
    "subscription_plan" varchar,
    "hostedpage_id" varchar,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."activities";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS okapi.activities_id_seq;

-- Table Definition
CREATE TABLE "okapi"."activities" (
    "id" int4 NOT NULL DEFAULT nextval('okapi.activities_id_seq'::regclass),
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."ar_internal_metadata";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."ar_internal_metadata" (
    "key" varchar NOT NULL,
    "value" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("key")
);

DROP TABLE IF EXISTS "okapi"."attachments";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."attachments" (
    "id" uuid NOT NULL,
    "meta" jsonb,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "owner_id" uuid,
    "file_file_name" varchar,
    "file_content_type" varchar,
    "file_file_size" int4,
    "file_updated_at" timestamp,
    "resource_type" varchar,
    "resource_id" uuid,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."companies";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."companies" (
    "id" uuid NOT NULL,
    "name" varchar,
    "description" varchar,
    "website" varchar,
    "phone_number" varchar,
    "location" jsonb,
    "legal_info" jsonb,
    "payment_info" jsonb,
    "created_at" timestamp,
    "updated_at" timestamp,
    "contact_info" jsonb,
    "avatar_id" uuid,
    "default_company" bool DEFAULT false,
    "archived_at" timestamp,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."companies_projects";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."companies_projects" (
    "id" uuid NOT NULL,
    "company_id" uuid,
    "project_id" uuid,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."companies_users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."companies_users" (
    "id" uuid NOT NULL,
    "company_id" uuid,
    "user_id" uuid,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "client_type" varchar,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."events";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."events" (
    "id" uuid NOT NULL,
    "owner_id" uuid,
    "targetable_type" varchar,
    "targetable_id" uuid,
    "type" varchar NOT NULL,
    "meta" jsonb,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."file_attachment_items";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."file_attachment_items" (
    "id" uuid NOT NULL,
    "file_attachment_id" uuid,
    "attachable_id" uuid,
    "attachable_type" varchar,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."friendly_id_slugs";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS okapi.friendly_id_slugs_id_seq;

-- Table Definition
CREATE TABLE "okapi"."friendly_id_slugs" (
    "id" int8 NOT NULL DEFAULT nextval('okapi.friendly_id_slugs_id_seq'::regclass),
    "slug" varchar NOT NULL,
    "sluggable_id" int4 NOT NULL,
    "sluggable_type" varchar(50),
    "scope" varchar,
    "created_at" timestamp,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."image_items";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."image_items" (
    "id" uuid NOT NULL,
    "image_id" uuid,
    "itemable_id" uuid,
    "itemable_type" varchar,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."images";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."images" (
    "id" uuid NOT NULL,
    "meta" jsonb,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "image_attachment_file_name" varchar,
    "image_attachment_content_type" varchar,
    "image_attachment_file_size" int4,
    "image_attachment_updated_at" timestamp,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."memberships";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS okapi.memberships_id_seq;

-- Table Definition
CREATE TABLE "okapi"."memberships" (
    "id" int8 NOT NULL DEFAULT nextval('okapi.memberships_id_seq'::regclass),
    "account_id" int8,
    "user_id" uuid,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."notifications";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."notifications" (
    "id" uuid NOT NULL,
    "read" bool DEFAULT false,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "assignee_id" uuid,
    "message" varchar NOT NULL,
    "mailed" bool DEFAULT false,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."permission_categories";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."permission_categories" (
    "id" uuid NOT NULL DEFAULT okapi.gen_random_uuid(),
    "name" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."permissions";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."permissions" (
    "id" uuid NOT NULL,
    "name" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "description" varchar,
    "role_id" int4,
    "permission_category_id" uuid,
    "pkey" varchar,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."pg_search_documents";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS okapi.pg_search_documents_id_seq;

-- Table Definition
CREATE TABLE "okapi"."pg_search_documents" (
    "id" int4 NOT NULL DEFAULT nextval('okapi.pg_search_documents_id_seq'::regclass),
    "content" text,
    "searchable_type" varchar,
    "searchable_id" uuid,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."projects";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."projects" (
    "id" uuid NOT NULL,
    "title" varchar,
    "brief" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "owner_id" uuid,
    "company_id" uuid,
    "description" text,
    "archived_at" timestamp,
    "archived" bool DEFAULT false,
    "slug" varchar,
    "last_event_at" timestamp,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."roles";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."roles" (
    "id" uuid NOT NULL,
    "name" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."roles_permissions";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."roles_permissions" (
    "role_id" uuid,
    "permission_id" uuid
);

DROP TABLE IF EXISTS "okapi"."schema_migrations";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."schema_migrations" (
    "version" varchar NOT NULL,
    PRIMARY KEY ("version")
);

DROP TABLE IF EXISTS "okapi"."statuses";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."statuses" (
    "id" uuid NOT NULL,
    "owner_id" uuid,
    "name" varchar,
    "color" varchar,
    "order" int4,
    "icon" varchar,
    "type" varchar,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."taxonomies";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."taxonomies" (
    "id" uuid NOT NULL,
    "type" varchar,
    "name" varchar,
    "order" int4,
    "parent_id" uuid,
    "owner_id" uuid,
    "color" varchar,
    "scope" varchar,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."tickets";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS okapi.tickets_readable_id_seq;

-- Table Definition
CREATE TABLE "okapi"."tickets" (
    "id" uuid NOT NULL,
    "title" varchar,
    "description" text,
    "project_id" uuid,
    "owner_id" uuid,
    "due_date" timestamp,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "status_id" uuid,
    "assignee_id" uuid,
    "readable_id" int4 NOT NULL DEFAULT nextval('okapi.tickets_readable_id_seq'::regclass),
    "last_event_at" timestamp,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."tickets_projects_associations";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."tickets_projects_associations" (
    "id" uuid NOT NULL,
    "ticket_id" uuid,
    "user_id" uuid,
    "profile_type" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."tickets_users_associations";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."tickets_users_associations" (
    "id" uuid NOT NULL,
    "ticket_id" uuid,
    "user_id" uuid,
    "profile_type" varchar,
    "created_at" timestamp,
    "updated_at" timestamp,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."user_profile";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."user_profile" (
    "id" uuid NOT NULL,
    "user_id" uuid NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "role_id" uuid,
    "position_id" uuid,
    "avatar_id" uuid,
    "company_id" uuid,
    "skill_ids" jsonb,
    "notification_type" varchar,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."users" (
    "id" uuid NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "user_name" varchar,
    "email" varchar,
    "encrypted_password" varchar NOT NULL DEFAULT ''::character varying,
    "reset_password_token" varchar,
    "reset_password_sent_at" timestamp,
    "remember_created_at" timestamp,
    "sign_in_count" int4 NOT NULL DEFAULT 0,
    "current_sign_in_at" timestamp,
    "last_sign_in_at" timestamp,
    "current_sign_in_ip" inet,
    "last_sign_in_ip" inet,
    "invitation_token" varchar,
    "invitation_created_at" timestamp,
    "invitation_sent_at" timestamp,
    "invitation_accepted_at" timestamp,
    "invitation_limit" int4,
    "invited_by_type" varchar,
    "invited_by_id" int4,
    "invitations_count" int4 DEFAULT 0,
    "first_name" varchar,
    "last_name" varchar,
    "description" varchar,
    "phone_number" varchar,
    "website" varchar,
    "social_handles" jsonb,
    "meta" jsonb,
    "birth" date DEFAULT '2000-01-01'::date,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "okapi"."users_permissions";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."users_permissions" (
    "user_id" uuid,
    "permission_id" uuid
);

DROP TABLE IF EXISTS "okapi"."users_projects_associations";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "okapi"."users_projects_associations" (
    "id" uuid NOT NULL,
    "project_id" uuid,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "user_id" uuid,
    PRIMARY KEY ("id")
);

ALTER TABLE "okapi"."memberships" ADD FOREIGN KEY ("user_id") REFERENCES "okapi"."users"("id");
ALTER TABLE "okapi"."memberships" ADD FOREIGN KEY ("account_id") REFERENCES "okapi"."accounts"("id");
