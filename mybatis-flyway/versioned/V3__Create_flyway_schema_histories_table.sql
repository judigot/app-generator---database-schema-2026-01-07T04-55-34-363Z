-- Flyway migration: V3__Create_flyway_schema_histories_table.sql
-- MyBatis + Flyway migration for flyway_schema_history
DROP TABLE IF EXISTS "flyway_schema_history";

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

INSERT INTO
  "flyway_schema_history" (
    installed_rank,
    version,
    description,
    type,
    script,
    checksum,
    installed_by,
    installed_on,
    execution_time,
    success
  )
VALUES
  (
    1,
    NULL,
    'alius',
    'toties',
    'cito',
    NULL,
    'arbitro',
    '2025-01-11T13:26:26.234Z',
    1818195798407476,
    TRUE
  ),
  (
    2,
    'argentum',
    'utrum',
    'natus',
    'admitto',
    8692247902129603,
    'usus',
    '2025-12-19T23:18:20.249Z',
    1189624423892839,
    TRUE
  ),
  (
    3,
    'exercitationem',
    'amo',
    'tam',
    'candidus',
    5650903234865405,
    'cumque',
    '2025-09-18T18:50:17.303Z',
    6465461351210834,
    FALSE
  ),
  (
    4,
    'socius',
    'cras',
    'contego',
    'certe',
    7540698696570283,
    'solium',
    '2025-02-14T12:48:10.885Z',
    6949873846294322,
    TRUE
  ),
  (
    5,
    'certe',
    'cena',
    'ars',
    'succedo',
    2965700168196640,
    'utrimque',
    '2025-10-20T17:43:46.278Z',
    2091896054506233,
    TRUE
  );