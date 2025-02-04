BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "shorebird_example_user" ALTER COLUMN "favoriteColor" DROP NOT NULL;

--
-- MIGRATION VERSION FOR shorebird_example
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('shorebird_example', '20250128204634702-v2', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250128204634702-v2', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
