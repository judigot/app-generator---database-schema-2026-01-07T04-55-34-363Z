DROP TABLE IF EXISTS "flyway_schema_history";

DROP TABLE IF EXISTS "user_authentication";

DROP TABLE IF EXISTS "users";

CREATE TABLE "users" (
  "id" BIGSERIAL PRIMARY KEY,
  "user_id" TEXT UNIQUE NOT NULL,
  "email" VARCHAR(255) UNIQUE NOT NULL,
  "phone_number" TEXT UNIQUE,
  "first_name" TEXT NOT NULL,
  "last_name" TEXT NOT NULL,
  "is_active" BOOLEAN NOT NULL,
  "role" TEXT,
  "mfa_enabled" BOOLEAN NOT NULL,
  "account_start_date" TIMESTAMPTZ (6) NOT NULL,
  "account_expiry_date" TIMESTAMPTZ (6),
  "created_at" TIMESTAMPTZ (6) DEFAULT NOW () NOT NULL,
  "updated_at" TIMESTAMPTZ (6) DEFAULT NOW (),
  "deleted_at" TIMESTAMPTZ (6)
);

CREATE TABLE "user_authentication" (
  "user_id" BIGSERIAL PRIMARY KEY,
  "password" CHAR(60) NOT NULL,
  "otp_code" TEXT,
  "otp_expiry" TIMESTAMPTZ (6),
  "last_login_at" TIMESTAMPTZ (6),
  "last_logout_at" TIMESTAMPTZ (6),
  "failure_count" BIGINT NOT NULL,
  "lock_flag" BOOLEAN NOT NULL,
  "lock_at" TIMESTAMPTZ (6),
  "password_updated_at" TIMESTAMPTZ (6),
  "password_expiry_date" TIMESTAMPTZ (6),
  "password_reset_token" TEXT,
  "password_reset_expiry" TIMESTAMPTZ (6),
  "created_at" TIMESTAMPTZ (6) DEFAULT NOW () NOT NULL,
  "updated_at" TIMESTAMPTZ (6) DEFAULT NOW (),
  "deleted_at" TIMESTAMPTZ (6),
  CONSTRAINT "FK_user_authentication_user_id" FOREIGN KEY ("user_id") REFERENCES "users" ("user_id")
);

CREATE TABLE "flyway_schema_history" (
  "installed_rank" BIGSERIAL PRIMARY KEY,
  "version" TEXT,
  "description" TEXT NOT NULL,
  "type" TEXT NOT NULL,
  "script" TEXT NOT NULL,
  "checksum" BIGINT,
  "installed_by" TEXT NOT NULL,
  "installed_on" TIMESTAMPTZ (6) NOT NULL,
  "execution_time" BIGINT NOT NULL,
  "success" BOOLEAN NOT NULL
);