-- Change: schema_add_ingredient_price_per_kg
-- Date: 2026-05-24
-- Purpose: add price_per_kg column to ingredient table for cost calculations in meal plans

BEGIN;

ALTER TABLE ingredient
  ADD COLUMN IF NOT EXISTS price_per_kg DECIMAL(10,5);

COMMIT;
