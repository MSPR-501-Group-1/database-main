-- Rollback: schema_add_ingredient_price_per_kg
-- Date: 2026-05-24

BEGIN;

ALTER TABLE ingredient
  DROP COLUMN IF EXISTS price_per_kg;

COMMIT;
