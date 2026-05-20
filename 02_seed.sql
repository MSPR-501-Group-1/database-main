-- ============================================================
-- SEED PostgreSQL — aligné sur le schéma DDL v2
-- ============================================================

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ============================================================
-- health_goal
-- ============================================================
INSERT INTO health_goal (goal_id, label, description) VALUES
  ('GOAL_001', 'Weight Loss',      'Reduce body weight through balanced diet and exercise'),
  ('GOAL_002', 'Muscle Gain',      'Increase lean muscle mass through strength training'),
  ('GOAL_003', 'Endurance',        'Improve cardiovascular endurance and stamina'),
  ('GOAL_004', 'Flexibility',      'Enhance range of motion and reduce injury risk'),
  ('GOAL_005', 'General Wellness', 'Maintain overall health and well-being');

-- ============================================================
-- ingredient  (sans usda_name, conforme au DDL v2)
-- ============================================================
INSERT INTO ingredient (
  ingredient_id,
  name,
  category,
  nutriscore,
  calories_g,
  fat_g,
  fiber_g,
  sugar_g,
  sodium_mg,
  cholesterol_mg,
  protein_g,
  carbs_g
) VALUES
  ('ING_001', 'Chicken',      'MEAT',      'A', 1.65, 0.36,  0.0,  0.0, 74.0, 85.0, 31.0,  0.0),
  ('ING_002', 'Broccoli',     'VEGETABLE', 'A', 0.34, 0.04,  2.6,  0.7, 33.0,  0.0,  2.8,  7.0),
  ('ING_003', 'Brown rice',   'GRAIN',     'B', 1.11, 0.09,  1.8,  0.4,  5.0,  0.0,  2.6, 23.0),
  ('ING_004', 'Whole milk',   'DAIRY',     'C', 0.61, 0.33,  0.0,  4.8, 44.0, 10.0,  3.2,  4.8),
  ('ING_005', 'Banana',       'FRUIT',     'A', 0.89, 0.03,  2.6, 12.2,  1.0,  0.0,  1.1, 23.0),
  ('ING_006', 'Salmon',       'MEAT',      'A', 2.08, 1.30,  0.0,  0.0, 59.0, 63.0, 20.0,  0.0),
  ('ING_007', 'Olive oil',    'OTHER',     'D', 8.84,10.00,  0.0,  0.0,  0.0,  0.0,  0.0,  0.0),
  ('ING_008', 'Oats',         'GRAIN',     'A', 3.89, 0.67, 10.6,  0.0,  2.0,  0.0, 16.9, 66.0),
  ('ING_009', 'Greek yogurt', 'DAIRY',     'A', 0.59, 0.04,  0.0,  3.2, 36.0,  5.0, 10.0,  3.6),
  ('ING_010', 'Spinach',      'VEGETABLE', 'A', 0.23, 0.04,  2.2,  0.4, 79.0,  0.0,  2.9,  3.6);

-- ============================================================
-- recipe
-- ============================================================
INSERT INTO recipe (recipe_id, title, instructions) VALUES
  ('RCP_001', 'Grilled Chicken and Broccoli',
   'Season chicken with salt and pepper. Grill 6 min each side. Steam broccoli 5 min. Serve together.'),
  ('RCP_002', 'Salmon Rice Bowl',
   'Cook brown rice. Pan-sear salmon 4 min each side with olive oil. Serve over rice with spinach.'),
  ('RCP_003', 'Overnight Oats',
   'Mix oats with milk and yogurt. Add banana slices. Refrigerate overnight. Serve cold.'),
  ('RCP_004', 'Spinach Omelette',
   'Beat eggs. Cook spinach in olive oil 2 min. Pour eggs over and fold when set.'),
  ('RCP_005', 'Protein Power Bowl',
   'Cook brown rice. Grill chicken breast. Saute broccoli and spinach. Assemble bowl and drizzle olive oil.');

-- ============================================================
-- exercise
-- ============================================================
INSERT INTO exercise (
  exercise_id,
  name,
  description,
  body_part_target,
  video_url,
  difficulty_level,
  equipment_required,
  category
) VALUES
  ('EXC_001', 'Push-Up',     'Classic bodyweight chest exercise',          'CHEST',     'https://videos.example.com/pushup',     'BEGINNER',     'None',          'STRENGTH'),
  ('EXC_002', 'Squat',       'Fundamental lower body strength movement',   'LEGS',      'https://videos.example.com/squat',      'BEGINNER',     'None',          'STRENGTH'),
  ('EXC_003', 'Deadlift',    'Compound posterior chain exercise',          'BACK',      'https://videos.example.com/deadlift',   'INTERMEDIATE', 'Barbell',       'STRENGTH'),
  ('EXC_004', 'Running',     'Steady-state cardio session',                'FULL_BODY', 'https://videos.example.com/running',    'BEGINNER',     'Shoes',         'CARDIO'),
  ('EXC_005', 'Plank',       'Isometric core stability hold',              'CORE',      'https://videos.example.com/plank',      'BEGINNER',     'None',          'BALANCE'),
  ('EXC_006', 'Pull-Up',     'Vertical pulling bodyweight movement',       'BACK',      'https://videos.example.com/pullup',     'INTERMEDIATE', 'Pull-up bar',   'STRENGTH'),
  ('EXC_007', 'Yoga Flow',   'Dynamic flexibility and breathing sequence', 'FULL_BODY', 'https://videos.example.com/yoga',       'BEGINNER',     'Yoga mat',      'FLEXIBILITY'),
  ('EXC_008', 'Burpee',      'High-intensity full body conditioning',      'FULL_BODY', 'https://videos.example.com/burpee',     'INTERMEDIATE', 'None',          'CARDIO'),
  ('EXC_009', 'Bench Press', 'Horizontal pressing strength exercise',      'CHEST',     'https://videos.example.com/benchpress', 'INTERMEDIATE', 'Barbell+Bench', 'STRENGTH'),
  ('EXC_010', 'Jump Rope',   'High-intensity cardiovascular drill',        'FULL_BODY', 'https://videos.example.com/jumprope',   'BEGINNER',     'Jump rope',     'CARDIO');

-- ============================================================
-- etl_execution
-- ============================================================
INSERT INTO etl_execution (
  execution_id, name, started_at, ended_at, status,
  records_extracted, records_loaded, records_rejected, error_message
) VALUES
  ('ETL_001', 'Nutrition', '2025-01-10 06:00:00', '2025-01-10 06:15:00', 'REJECTED',     49988, 49988,    0, NULL),
  ('ETL_002', 'Exercises', '2025-01-10 06:15:00', '2025-01-10 06:20:00', 'LOADED',        1300,  1300,    0, NULL),
  ('ETL_003', 'Nutrition', '2025-01-14 02:00:00', '2025-01-14 02:45:00', 'LOADED',       99999, 98500,  750, NULL),
  ('ETL_004', 'Exercises', '2025-01-05 06:00:00', '2025-01-05 06:05:00', 'TRANSFORMED',   1300,     0, 1300, 'Connection timeout'),
  ('ETL_005', 'Nutrition', '2025-01-01 00:30:00', '2025-01-01 00:45:00', 'TRANSFORMED',   3000,  3000,    0, NULL);

-- ============================================================
-- data_quality_check_
-- ============================================================
INSERT INTO data_quality_check_ (
  check_id, target_table, check_type, check_rule,
  records_checked, records_failed, checked_at, status, execution_id
) VALUES
  ('CHK_001', 'ingredient',   'NULL_CHECK',      'calories_g IS NOT NULL',            50000, 12, '2025-01-10 06:16:00', TRUE,  'ETL_001'),
  ('CHK_002', 'ingredient',   'RANGE_CHECK',     'calories_g BETWEEN 0 AND 900',      50000,  3, '2025-01-10 06:16:30', TRUE,  'ETL_001'),
  ('CHK_003', 'exercise',     'DUPLICATE_CHECK', 'DISTINCT exercise_id',               1300,  0, '2025-01-10 06:21:00', TRUE,  'ETL_002'),
  ('CHK_004', 'user_metrics', 'RANGE_CHECK',     'resting_bpm BETWEEN 30 AND 220',   99999,  7, '2025-01-14 02:46:00', TRUE,  'ETL_003'),
  ('CHK_005', 'ingredient',   'NULL_CHECK',      'name IS NOT NULL',                   3000,  0, '2025-01-01 00:31:00', TRUE,  'ETL_005');

-- ============================================================
-- data_anomaly
-- ============================================================
INSERT INTO data_anomaly (
  anomaly_id, source_table, anomaly_table, field_name, record_identifier,
  original_value, detected_at, severity, is_resolved, resolution_action,
  check_id, execution_id
) VALUES
  ('ANO_001', 'ingredient',   'ingredient',   'calories_g',   'ING_UNKNOWN_001', '-5.0',   '2025-01-10 06:17:00', 'HIGH',   TRUE,  'Set to NULL and flagged for review', 'CHK_002', 'ETL_001'),
  ('ANO_002', 'ingredient',   'ingredient',   'calories_g',   'ING_UNKNOWN_002', '1200.0', '2025-01-10 06:17:05', 'MEDIUM', FALSE, NULL,                                  'CHK_002', 'ETL_001'),
  ('ANO_003', 'user_metrics', 'user_metrics', 'resting_bpm',  'MET_UNKNOWN_001', '225',    '2025-01-14 02:47:00', 'HIGH',   TRUE,  'Replaced with rolling average',      'CHK_004', 'ETL_003');

-- ============================================================
-- role
-- ============================================================
INSERT INTO role (role_id, role_type, is_system) VALUES
  ('ROLE_01', 'FREEMIUM',     FALSE),
  ('ROLE_02', 'PREMIUM',      FALSE),
  ('ROLE_03', 'PREMIUM_PLUS', FALSE),
  ('ROLE_04', 'B2B',          FALSE),
  ('ROLE_05', 'ADMIN',        TRUE);

-- ============================================================
-- organization
-- ============================================================
INSERT INTO organization (organization_id, name) VALUES
  ('ORG_001', 'FitCorp Enterprise'),
  ('ORG_002', 'City Gym Network'),
  ('ORG_003', 'MutualSante Plus'),
  ('ORG_004', 'Green Health NGO'),
  ('ORG_005', 'SportTech Labs');

-- ============================================================
-- user_
-- ============================================================
INSERT INTO user_ (
  user_id, email, password_hash, first_name, last_name,
  birth_date, gender_code, height_cm, current_weight_kg,
  allergies, diet_type, is_active, role_id, created_at, updated_at
) VALUES
  ('USR_001', 'alice.martin@email.com',  crypt('Password1!', gen_salt('bf')), 'Alice',    'Martin',   '1990-04-15', 1, 1.81, 78.50, 'NONE',   'NONE',        TRUE,  'ROLE_02', '2024-03-01', '2025-01-14 08:00:00'),
  ('USR_002', 'bob.dupont@email.com',    crypt('Password2!', gen_salt('bf')), 'Bob',      'Dupont',   '1985-08-22', 1, 1.65, 62.00, 'MILK',   'VEGETARIAN',  TRUE,  'ROLE_01', '2024-04-10', '2025-01-13 09:00:00'),
  ('USR_003', 'claire.leroy@email.com',  crypt('Password3!', gen_salt('bf')), 'Claire',   'Leroy',    '1995-12-05', 2, 1.75, 95.20, 'GLUTEN', 'NONE',        TRUE,  'ROLE_03', '2024-05-20', '2025-01-12 10:00:00'),
  ('USR_004', 'david.petit@email.com',   crypt('Password4!', gen_salt('bf')), 'David',    'Petit',    '1992-06-30', 1, 1.70, 55.00, 'NONE',   'VEGAN',       TRUE,  'ROLE_04', '2024-06-15', '2025-01-11 11:00:00'),
  ('USR_005', 'emma.blanc@email.com',    crypt('Password5!', gen_salt('bf')), 'Emma',     'Blanc',    '1998-02-14', 2, 1.68, 71.00, 'NUTS',   'KETO',        TRUE,  'ROLE_02', '2024-07-01', '2025-01-10 12:00:00'),
  ('USR_006', 'francois.noir@email.com', crypt('Password6!', gen_salt('bf')), 'Francois', 'Noir',     '1988-09-17', 1, 1.82, 85.00, 'NONE',   'NONE',        FALSE, 'ROLE_01', '2024-08-05', '2025-01-09 08:00:00'),
  ('USR_007', 'admin@healthapp.com',     crypt('AdminPass!', gen_salt('bf')), 'Admin',    'System',   '1980-01-01', 1, 1.60, 58.00, 'SOY',    'PESCATARIAN', TRUE,  'ROLE_05', '2023-01-01', '2025-01-08 09:00:00'),
  ('USR_008', 'hugo.bernard@email.com',  crypt('Password8!', gen_salt('bf')), 'Hugo',     'Bernard',  '1991-03-22', 1, 1.78, 82.30, 'NONE',   'NONE',        TRUE,  'ROLE_01', '2024-02-05', '2026-03-22 08:00:00'),
  ('USR_009', 'ines.garnier@email.com',  crypt('Password9!', gen_salt('bf')), 'Ines',     'Garnier',  '1994-11-09', 2, 1.66, 59.20, 'NONE',   'VEGETARIAN',  TRUE,  'ROLE_02', '2024-03-18', '2026-03-22 08:00:00'),
  ('USR_010', 'julien.roche@email.com',  crypt('Password10!',gen_salt('bf')), 'Julien',   'Roche',    '1987-07-12', 1, 1.84, 88.70, 'MILK',   'NONE',        TRUE,  'ROLE_03', '2024-05-01', '2026-03-22 08:00:00'),
  ('USR_011', 'lea.faure@email.com',     crypt('Password11!',gen_salt('bf')), 'Lea',      'Faure',    '1999-01-31', 2, 1.72, 64.40, 'NUTS',   'PESCATARIAN', TRUE,  'ROLE_01', '2024-06-10', '2026-03-22 08:00:00'),
  ('USR_012', 'marc.rey@email.com',      crypt('Password12!',gen_salt('bf')), 'Marc',     'Rey',      '1983-09-03', 1, 1.75, 91.10, 'NONE',   'KETO',        FALSE, 'ROLE_04', '2024-01-25', '2026-03-22 08:00:00'),
  ('USR_013', 'nina.laurent@email.com',  crypt('Password13!',gen_salt('bf')), 'Nina',     'Laurent',  '1993-05-11', 2, 1.69, 66.00, 'NONE',   'NONE',        TRUE,  'ROLE_01', '2024-02-14', '2026-03-22 08:00:00'),
  ('USR_014', 'omar.morel@email.com',    crypt('Password14!',gen_salt('bf')), 'Omar',     'Morel',    '1986-10-27', 1, 1.80, 79.30, 'NONE',   'NONE',        TRUE,  'ROLE_02', '2024-03-03', '2026-03-22 08:00:00');

-- ============================================================
-- user_metrics  (nouvelle structure DDL v2)
-- metric_id, recorded_at, age, gender, height_cm, weight_kg, bmi,
-- body_fat_percentage, resting_bpm, health_goal, target_timeline_weeks,
-- fitness_level, fatigue_score, has_gym_access, workout_variety_preference,
-- injury_type, injury_severity, medical_condition, user_id
-- ============================================================
INSERT INTO user_metrics (
  metric_id, recorded_at, age, gender, height_cm, weight_kg, bmi,
  body_fat_percentage, resting_bpm, health_goal, target_timeline_weeks,
  fitness_level, fatigue_score, has_gym_access, workout_variety_preference,
  injury_type, injury_severity, medical_condition, user_id
) VALUES
  -- USR_001 Alice Martin — muscle_gain, intermediate
  ('MET_001', '2025-01-01', 34, 'Female', 181.00, 78.50, 23.94,  18.5, 68, 'muscle_gain',    12, 'intermediate', 3, TRUE,  4, 'none',     'none',     'none',        'USR_001'),
  ('MET_002', '2025-01-02', 34, 'Female', 181.00, 78.30, 23.88,  18.4, 70, 'muscle_gain',    12, 'intermediate', 2, TRUE,  4, 'none',     'none',     'none',        'USR_001'),
  ('MET_003', '2025-01-03', 34, 'Female', 181.00, 78.10, 23.82,  18.3, 67, 'muscle_gain',    12, 'intermediate', 4, TRUE,  4, 'none',     'none',     'none',        'USR_001'),

  -- USR_002 Bob Dupont — fat_loss, beginner
  ('MET_004', '2025-01-01', 39, 'Male',   165.00, 62.00, 22.77,  22.1, 72, 'fat_loss',       16, 'beginner',     3, FALSE, 2, 'none',     'none',     'none',        'USR_002'),
  ('MET_005', '2025-01-02', 39, 'Male',   165.00, 61.80, 22.70,  22.0, 71, 'fat_loss',       16, 'beginner',     2, FALSE, 2, 'none',     'none',     'none',        'USR_002'),

  -- USR_003 Claire Leroy — fat_loss, beginner, knee injury
  ('MET_006', '2025-01-01', 29, 'Female', 175.00, 95.20, 31.08,  28.0, 78, 'fat_loss',       24, 'beginner',     5, TRUE,  3, 'knee',     'mild',     'none',        'USR_003'),

  -- USR_004 David Petit — endurance, advanced
  ('MET_007', '2025-01-01', 32, 'Male',   170.00, 55.00, 19.03,  15.0, 60, 'endurance',       8, 'advanced',     1, TRUE,  5, 'none',     'none',     'none',        'USR_004'),

  -- USR_005 Emma Blanc — general_health, intermediate
  ('MET_008', '2025-01-01', 26, 'Female', 168.00, 71.00, 25.15,  24.0, 73, 'general_health', 12, 'intermediate', 3, TRUE,  3, 'none',     'none',     'none',        'USR_005'),

  -- USR_006 Francois Noir — general_health, beginner, back injury
  ('MET_009', '2025-01-01', 36, 'Male',   182.00, 85.00, 25.66,  20.5, 74, 'general_health', 20, 'beginner',     4, FALSE, 2, 'back',     'moderate', 'none',        'USR_006'),

  -- USR_007 Admin — muscle_gain, intermediate
  ('MET_010', '2025-01-01', 45, 'Male',   160.00, 58.00, 22.66,  17.0, 62, 'muscle_gain',    16, 'intermediate', 2, TRUE,  4, 'none',     'none',     'none',        'USR_007'),

  -- USR_008 Hugo Bernard — endurance, intermediate
  ('MET_011', '2026-01-01', 34, 'Male',   178.00, 82.30, 25.97,  21.0, 65, 'endurance',      12, 'intermediate', 3, TRUE,  4, 'none',     'none',     'none',        'USR_008'),

  -- USR_009 Ines Garnier — general_health, beginner
  ('MET_012', '2026-01-01', 31, 'Female', 166.00, 59.20, 21.49,  20.0, 70, 'general_health', 16, 'beginner',     2, FALSE, 3, 'none',     'none',     'none',        'USR_009'),

  -- USR_010 Julien Roche — muscle_gain, advanced, shoulder injury
  ('MET_013', '2026-01-01', 38, 'Male',   184.00, 88.70, 26.19,  19.5, 63, 'muscle_gain',     8, 'advanced',     4, TRUE,  5, 'shoulder', 'mild',     'none',        'USR_010'),

  -- USR_011 Lea Faure — fat_loss, beginner
  ('MET_014', '2026-01-01', 26, 'Female', 172.00, 64.40, 21.77,  23.0, 75, 'fat_loss',       20, 'beginner',     3, FALSE, 2, 'none',     'none',     'none',        'USR_011'),

  -- USR_012 Marc Rey — general_health, intermediate, hypertension
  ('MET_015', '2026-01-01', 42, 'Male',   175.00, 91.10, 29.76,  26.0, 80, 'general_health', 24, 'intermediate', 5, TRUE,  3, 'none',     'none',     'hypertension','USR_012'),

  -- USR_013 Nina Laurent — general_health, beginner
  ('MET_016', '2026-01-01', 32, 'Female', 169.00, 66.00, 23.13,  22.0, 69, 'general_health', 12, 'beginner',     2, FALSE, 2, 'none',     'none',     'none',        'USR_013'),

  -- USR_014 Omar Morel — endurance, advanced
  ('MET_017', '2026-01-01', 39, 'Male',   180.00, 79.30, 24.48,  16.5, 58, 'endurance',       8, 'advanced',     1, TRUE,  5, 'none',     'none',     'none',        'USR_014');

-- Métriques dynamiques récentes (fenêtres analytiques)
INSERT INTO user_metrics (
  metric_id, recorded_at, age, gender, height_cm, weight_kg, bmi,
  body_fat_percentage, resting_bpm, health_goal, target_timeline_weeks,
  fitness_level, fatigue_score, has_gym_access, workout_variety_preference,
  injury_type, injury_severity, medical_condition, user_id
) VALUES
  ('MET_101', CURRENT_DATE - 1,  34, 'Female', 181.00, 77.60, 23.67, 17.9, 65, 'muscle_gain',    12, 'intermediate', 2, TRUE,  4, 'none', 'none', 'none', 'USR_001'),
  ('MET_102', CURRENT_DATE - 2,  39, 'Male',   165.00, 60.90, 22.37, 21.3, 68, 'fat_loss',       16, 'beginner',     3, FALSE, 2, 'none', 'none', 'none', 'USR_002'),
  ('MET_103', CURRENT_DATE - 3,  29, 'Female', 175.00, 93.50, 30.53, 27.0, 75, 'fat_loss',       24, 'beginner',     5, TRUE,  3, 'knee', 'mild', 'none', 'USR_003'),
  ('MET_104', CURRENT_DATE - 4,  26, 'Female', 168.00, 69.60, 24.66, 23.5, 70, 'general_health', 12, 'intermediate', 3, TRUE,  3, 'none', 'none', 'none', 'USR_005'),
  ('MET_105', CURRENT_DATE - 8,  34, 'Female', 181.00, 77.80, 23.73, 18.0, 66, 'muscle_gain',    12, 'intermediate', 3, TRUE,  4, 'none', 'none', 'none', 'USR_001'),
  ('MET_106', CURRENT_DATE - 10, 29, 'Female', 175.00, 93.80, 30.63, 27.2, 76, 'fat_loss',       24, 'beginner',     4, TRUE,  3, 'knee', 'mild', 'none', 'USR_003'),
  ('MET_107', CURRENT_DATE - 36, 34, 'Female', 181.00, 78.40, 23.92, 18.4, 69, 'muscle_gain',    12, 'intermediate', 3, TRUE,  4, 'none', 'none', 'none', 'USR_001'),
  ('MET_108', CURRENT_DATE - 42, 39, 'Male',   165.00, 61.70, 22.66, 21.9, 72, 'fat_loss',       16, 'beginner',     3, FALSE, 2, 'none', 'none', 'none', 'USR_002'),
  ('MET_109', CURRENT_DATE - 50, 29, 'Female', 175.00, 95.00, 31.02, 27.9, 80, 'fat_loss',       24, 'beginner',     5, TRUE,  3, 'knee', 'mild', 'none', 'USR_003'),
  ('MET_110', CURRENT_DATE - 58, 32, 'Male',   170.00, 54.80, 18.96, 14.9, 63, 'endurance',       8, 'advanced',     1, TRUE,  5, 'none', 'none', 'none', 'USR_004'),
  ('MET_111', CURRENT_DATE -110, 34, 'Female', 181.00, 79.20, 24.15, 18.9, 72, 'muscle_gain',    12, 'intermediate', 4, TRUE,  4, 'none', 'none', 'none', 'USR_001'),
  ('MET_112', CURRENT_DATE -140, 26, 'Female', 168.00, 71.30, 25.26, 24.6, 75, 'general_health', 12, 'intermediate', 4, TRUE,  3, 'none', 'none', 'none', 'USR_005')
ON CONFLICT (metric_id) DO UPDATE SET
  recorded_at              = EXCLUDED.recorded_at,
  age                      = EXCLUDED.age,
  gender                   = EXCLUDED.gender,
  height_cm                = EXCLUDED.height_cm,
  weight_kg                = EXCLUDED.weight_kg,
  bmi                      = EXCLUDED.bmi,
  body_fat_percentage      = EXCLUDED.body_fat_percentage,
  resting_bpm              = EXCLUDED.resting_bpm,
  health_goal              = EXCLUDED.health_goal,
  target_timeline_weeks    = EXCLUDED.target_timeline_weeks,
  fitness_level            = EXCLUDED.fitness_level,
  fatigue_score            = EXCLUDED.fatigue_score,
  has_gym_access           = EXCLUDED.has_gym_access,
  workout_variety_preference = EXCLUDED.workout_variety_preference,
  injury_type              = EXCLUDED.injury_type,
  injury_severity          = EXCLUDED.injury_severity,
  medical_condition        = EXCLUDED.medical_condition,
  user_id                  = EXCLUDED.user_id;

-- ============================================================
-- login_history
-- ============================================================
INSERT INTO login_history (last_login_id, user_id, last_login) VALUES
  ('LOG_001', 'USR_001', '2025-01-14 08:10:00'),
  ('LOG_002', 'USR_002', '2025-01-14 09:05:00'),
  ('LOG_003', 'USR_003', '2025-01-14 10:20:00'),
  ('LOG_004', 'USR_004', '2025-01-14 11:00:00'),
  ('LOG_005', 'USR_005', '2025-01-13 18:35:00'),
  ('LOG_006', 'USR_007', '2025-01-14 06:45:00'),
  ('LOG_007', 'USR_001', '2026-03-21 08:05:00'),
  ('LOG_008', 'USR_002', '2026-03-21 08:40:00'),
  ('LOG_009', 'USR_003', '2026-03-21 09:10:00'),
  ('LOG_010', 'USR_004', '2026-03-20 07:55:00'),
  ('LOG_011', 'USR_005', '2026-03-20 08:20:00'),
  ('LOG_012', 'USR_006', '2026-03-20 21:40:00'),
  ('LOG_013', 'USR_007', '2026-03-20 06:35:00'),
  ('LOG_014', 'USR_001', '2026-03-19 07:50:00'),
  ('LOG_015', 'USR_002', '2026-03-19 19:20:00'),
  ('LOG_016', 'USR_003', '2026-03-18 08:15:00'),
  ('LOG_017', 'USR_004', '2026-03-18 12:55:00'),
  ('LOG_018', 'USR_005', '2026-03-18 20:40:00'),
  ('LOG_019', 'USR_006', '2026-03-17 22:10:00'),
  ('LOG_020', 'USR_007', '2026-03-17 07:05:00'),
  ('LOG_021', 'USR_001', '2026-03-16 08:10:00'),
  ('LOG_022', 'USR_002', '2026-03-15 08:45:00'),
  ('LOG_023', 'USR_003', '2026-03-15 13:05:00'),
  ('LOG_024', 'USR_004', '2026-03-14 09:30:00'),
  ('LOG_025', 'USR_005', '2026-03-13 18:40:00'),
  ('LOG_026', 'USR_006', '2026-03-12 20:10:00'),
  ('LOG_027', 'USR_007', '2026-03-11 19:50:00'),
  ('LOG_028', 'USR_001', '2026-02-28 08:05:00'),
  ('LOG_029', 'USR_002', '2026-02-21 08:25:00'),
  ('LOG_030', 'USR_003', '2026-02-14 18:55:00'),
  ('LOG_031', 'USR_004', '2026-02-10 07:10:00'),
  ('LOG_032', 'USR_005', '2026-01-20 18:05:00'),
  ('LOG_033', 'USR_006', '2026-01-05 18:40:00'),
  ('LOG_034', 'USR_007', '2025-12-15 08:30:00'),
  -- USR_008-014
  ('LOG_035', 'USR_008', '2026-03-21 07:40:00'),
  ('LOG_036', 'USR_008', '2026-03-18 19:35:00'),
  ('LOG_037', 'USR_008', '2026-03-09 08:20:00'),
  ('LOG_038', 'USR_008', '2026-02-25 21:10:00'),
  ('LOG_039', 'USR_009', '2026-03-13 10:05:00'),
  ('LOG_040', 'USR_009', '2026-03-02 18:15:00'),
  ('LOG_041', 'USR_009', '2026-02-20 08:45:00'),
  ('LOG_042', 'USR_010', '2026-02-18 07:55:00'),
  ('LOG_043', 'USR_010', '2026-01-28 20:30:00'),
  ('LOG_044', 'USR_011', '2025-12-10 09:10:00'),
  ('LOG_045', 'USR_012', '2025-11-05 11:25:00'),
  ('LOG_046', 'USR_011', '2026-03-10 08:55:00'),
  ('LOG_047', 'USR_012', '2026-02-10 20:20:00'),
  ('LOG_048', 'USR_011', '2026-03-22 09:40:00'),
  ('LOG_049', 'USR_014', '2025-11-20 17:25:00');

-- login_history dynamique (fenêtres 20 jours)
INSERT INTO login_history (last_login_id, user_id, last_login)
SELECT
  'LOG_REC_' || to_char(gs.day_ref, 'YYYYMMDD') || '_' || usr.user_id AS last_login_id,
  usr.user_id,
  (date_trunc('day', gs.day_ref) + usr.login_time)::timestamp AS last_login
FROM generate_series(CURRENT_DATE - interval '20 days', CURRENT_DATE, interval '1 day') AS gs(day_ref)
CROSS JOIN (
  VALUES
    ('USR_001', time '07:40:00'),
    ('USR_002', time '08:15:00'),
    ('USR_003', time '18:05:00'),
    ('USR_005', time '20:20:00'),
    ('USR_007', time '06:55:00')
) AS usr(user_id, login_time)
WHERE (EXTRACT(DOY FROM gs.day_ref)::int + ascii(right(usr.user_id, 1))) % 2 = 0
ON CONFLICT (last_login_id) DO UPDATE SET
  user_id    = EXCLUDED.user_id,
  last_login = EXCLUDED.last_login;

ANALYZE login_history;

-- ============================================================
-- meal
-- ============================================================
INSERT INTO meal (meal_id, consumed_at, quantity_grams, calories_consumed, user_id) VALUES
  ('MEAL_001', '2025-01-14 12:00:00', 350, 520, 'USR_001'),
  ('MEAL_002', '2025-01-14 08:30:00', 400, 610, 'USR_002'),
  ('MEAL_003', '2025-01-14 13:10:00', 300, 480, 'USR_003'),
  ('MEAL_004', '2025-01-14 19:00:00', 250, 310, 'USR_004'),
  ('MEAL_005', '2025-01-13 20:00:00', 500, 820, 'USR_005'),
  ('MEAL_006', '2025-01-13 12:40:00', 300, 450, 'USR_001'),
  ('MEAL_007', '2025-01-13 21:15:00', 200, 350, 'USR_007');

-- Repas dynamiques récents
INSERT INTO meal (meal_id, consumed_at, quantity_grams, calories_consumed, user_id) VALUES
  ('MEAL_101', now() - interval '1 day'   + interval '08:20:00', 360, 520, 'USR_001'),
  ('MEAL_102', now() - interval '2 days'  + interval '12:50:00', 410, 650, 'USR_003'),
  ('MEAL_103', now() - interval '3 days'  + interval '19:10:00', 330, 540, 'USR_005'),
  ('MEAL_104', now() - interval '4 days'  + interval '16:30:00', 190, 260, 'USR_002'),
  ('MEAL_105', now() - interval '8 days'  + interval '08:10:00', 420, 590, 'USR_001'),
  ('MEAL_106', now() - interval '10 days' + interval '12:35:00', 470, 710, 'USR_003'),
  ('MEAL_107', now() - interval '36 days' + interval '19:05:00', 360, 640, 'USR_004'),
  ('MEAL_108', now() - interval '42 days' + interval '16:20:00', 210, 290, 'USR_002'),
  ('MEAL_109', now() - interval '50 days' + interval '07:45:00', 340, 480, 'USR_007'),
  ('MEAL_110', now() - interval '58 days' + interval '13:10:00', 430, 670, 'USR_005'),
  ('MEAL_111', now() - interval '110 days'+ interval '12:10:00', 450, 760, 'USR_003'),
  ('MEAL_112', now() - interval '140 days'+ interval '20:15:00', 390, 610, 'USR_001')
ON CONFLICT (meal_id) DO UPDATE SET
  consumed_at       = EXCLUDED.consumed_at,
  quantity_grams    = EXCLUDED.quantity_grams,
  calories_consumed = EXCLUDED.calories_consumed,
  user_id           = EXCLUDED.user_id;

-- ============================================================
-- meal_ingredient
-- ============================================================
INSERT INTO meal_ingredient (ingredient_id, meal_id, quantity) VALUES
  ('ING_001', 'MEAL_001', 200), ('ING_002', 'MEAL_001', 150),
  ('ING_008', 'MEAL_002',  80), ('ING_009', 'MEAL_002', 100), ('ING_005', 'MEAL_002',  80),
  ('ING_006', 'MEAL_003', 180), ('ING_003', 'MEAL_003', 100),
  ('ING_010', 'MEAL_004', 100), ('ING_008', 'MEAL_004',  80),
  ('ING_001', 'MEAL_005', 250), ('ING_007', 'MEAL_005',  20),
  ('ING_003', 'MEAL_006', 150), ('ING_002', 'MEAL_006', 100),
  ('ING_006', 'MEAL_007', 150), ('ING_010', 'MEAL_007',  80),
  ('ING_008', 'MEAL_101',  85), ('ING_009', 'MEAL_101', 120),
  ('ING_001', 'MEAL_102', 170), ('ING_003', 'MEAL_102', 105),
  ('ING_006', 'MEAL_103', 150), ('ING_010', 'MEAL_103', 100),
  ('ING_008', 'MEAL_104',  60), ('ING_005', 'MEAL_104',  70),
  ('ING_001', 'MEAL_105', 160), ('ING_003', 'MEAL_105', 100),
  ('ING_001', 'MEAL_106', 180), ('ING_002', 'MEAL_106', 120),
  ('ING_006', 'MEAL_107', 170), ('ING_010', 'MEAL_107', 100),
  ('ING_008', 'MEAL_108',  70), ('ING_005', 'MEAL_108',  60),
  ('ING_009', 'MEAL_109', 160), ('ING_005', 'MEAL_109',  90),
  ('ING_003', 'MEAL_110', 140), ('ING_001', 'MEAL_110', 150),
  ('ING_001', 'MEAL_111', 210), ('ING_003', 'MEAL_111', 120),
  ('ING_006', 'MEAL_112', 150), ('ING_008', 'MEAL_112',  90)
ON CONFLICT (ingredient_id, meal_id) DO UPDATE SET quantity = EXCLUDED.quantity;

-- ============================================================
-- recipe_ingredients
-- ============================================================
INSERT INTO recipe_ingredients (ingredient_id, recipe_id, quantity) VALUES
  ('ING_001', 'RCP_001', 200), ('ING_002', 'RCP_001', 150),
  ('ING_006', 'RCP_002', 180), ('ING_003', 'RCP_002', 100),
  ('ING_010', 'RCP_002',  50), ('ING_007', 'RCP_002',  10),
  ('ING_008', 'RCP_003',  80), ('ING_004', 'RCP_003', 120),
  ('ING_009', 'RCP_003', 100), ('ING_005', 'RCP_003',  80),
  ('ING_010', 'RCP_004', 100), ('ING_007', 'RCP_004',  10),
  ('ING_001', 'RCP_005', 200), ('ING_003', 'RCP_005', 100),
  ('ING_002', 'RCP_005', 100), ('ING_010', 'RCP_005',  50),
  ('ING_007', 'RCP_005',  15);

-- ============================================================
-- workout_session
-- ============================================================
INSERT INTO workout_session (session_id, start_at, end_at, calories_burned, notes, user_id) VALUES
  ('WS_001', '2026-03-14 06:30:00', '2026-03-14 07:30:00', 450, 'Morning strength session',     'USR_001'),
  ('WS_002', '2026-03-14 07:15:00', '2026-03-14 08:00:00', 380, 'Yoga and flexibility',         'USR_002'),
  ('WS_003', '2026-03-13 18:00:00', '2026-03-13 19:15:00', 600, 'HIIT circuit training',        'USR_003'),
  ('WS_004', '2026-03-14 05:45:00', '2026-03-14 07:15:00', 520, 'Long run and core work',       'USR_004'),
  ('WS_005', '2026-03-12 17:30:00', '2026-03-12 18:20:00', 410, 'Upper body hypertrophy',       'USR_005'),
  ('WS_006', '2026-03-11 19:00:00', '2026-03-11 19:30:00', 200, 'Light stretching session',     'USR_006'),
  ('WS_007', '2026-03-14 20:00:00', '2026-03-14 21:00:00', 480, 'Full body compound movements', 'USR_007'),
  ('WS_008', '2026-03-21 06:15:00', '2026-03-21 07:00:00', 320, 'Morning run',                  'USR_001'),
  ('WS_009', '2026-03-21 18:00:00', '2026-03-21 18:45:00', 280, 'Evening HIIT',                 'USR_002'),
  ('WS_010', '2026-03-20 07:00:00', '2026-03-20 07:50:00', 410, 'Strength circuit',             'USR_003'),
  ('WS_011', '2026-03-20 12:30:00', '2026-03-20 13:10:00', 300, 'Lunchtime cardio',             'USR_004'),
  ('WS_012', '2026-03-20 19:00:00', '2026-03-20 19:40:00', 360, 'Yoga flow',                    'USR_005'),
  ('WS_013', '2026-03-20 21:00:00', '2026-03-20 21:30:00', 210, 'Stretching',                   'USR_006'),
  ('WS_014', '2026-03-19 06:45:00', '2026-03-19 07:30:00', 350, 'Interval run',                 'USR_007'),
  ('WS_015', '2026-03-19 08:30:00', '2026-03-19 09:10:00', 330, 'Core + mobility',              'USR_001'),
  ('WS_016', '2026-03-19 18:15:00', '2026-03-19 19:00:00', 400, 'Crossfit WOD',                 'USR_002'),
  ('WS_017', '2026-03-18 07:20:00', '2026-03-18 08:05:00', 360, 'Hill sprints',                 'USR_003'),
  ('WS_018', '2026-03-18 12:00:00', '2026-03-18 12:40:00', 290, 'Rowing session',               'USR_004'),
  ('WS_019', '2026-03-18 19:30:00', '2026-03-18 20:10:00', 300, 'Pilates',                      'USR_005'),
  ('WS_020', '2026-03-18 21:15:00', '2026-03-18 21:45:00', 200, 'Cooldown',                     'USR_006'),
  ('WS_021', '2026-03-17 06:00:00', '2026-03-17 06:50:00', 380, 'Tempo run',                    'USR_007'),
  ('WS_022', '2026-03-17 08:15:00', '2026-03-17 09:05:00', 420, 'Upper body',                   'USR_001'),
  ('WS_023', '2026-03-17 12:45:00', '2026-03-17 13:20:00', 260, 'Quick cardio',                 'USR_002'),
  ('WS_024', '2026-03-17 18:00:00', '2026-03-17 19:00:00', 480, 'Long ride',                    'USR_003'),
  ('WS_025', '2026-03-16 06:30:00', '2026-03-16 07:20:00', 390, 'Strength',                     'USR_004'),
  ('WS_026', '2026-03-16 09:00:00', '2026-03-16 09:40:00', 310, 'Yoga',                         'USR_005'),
  ('WS_027', '2026-03-16 17:30:00', '2026-03-16 18:10:00', 300, 'Circuit',                      'USR_006'),
  ('WS_028', '2026-03-16 19:45:00', '2026-03-16 20:30:00', 420, 'Boxing',                       'USR_007'),
  ('WS_029', '2026-03-15 06:10:00', '2026-03-15 06:50:00', 320, 'Easy run',                     'USR_001'),
  ('WS_030', '2026-03-15 07:30:00', '2026-03-15 08:10:00', 300, 'Mobility',                     'USR_002'),
  ('WS_031', '2026-03-15 12:15:00', '2026-03-15 12:55:00', 280, 'Rowing',                       'USR_003'),
  ('WS_032', '2026-03-15 17:00:00', '2026-03-15 17:45:00', 360, 'Strength + cardio',            'USR_004'),
  ('WS_033', '2026-03-15 19:00:00', '2026-03-15 19:40:00', 330, 'HIIT',                         'USR_005'),
  ('WS_034', '2026-03-15 20:30:00', '2026-03-15 21:00:00', 200, 'Stretch',                      'USR_006'),
  ('WS_035', '2026-03-10 07:10:00', '2026-03-10 07:50:00', 300, 'Morning run',                  'USR_007'),
  ('WS_036', '2026-03-09 18:00:00', '2026-03-09 18:45:00', 340, 'Cross training',               'USR_001'),
  ('WS_037', '2026-03-08 06:30:00', '2026-03-08 07:10:00', 310, 'Hill repeats',                 'USR_002'),
  ('WS_038', '2026-03-07 12:00:00', '2026-03-07 12:40:00', 270, 'Lunchtime circuit',            'USR_003'),
  ('WS_039', '2026-03-06 19:00:00', '2026-03-06 19:50:00', 380, 'Strength',                     'USR_004'),
  ('WS_040', '2026-03-05 07:15:00', '2026-03-05 07:55:00', 290, 'Recovery',                     'USR_005'),
  ('WS_041', '2026-03-04 18:20:00', '2026-03-04 19:00:00', 350, 'Run',                          'USR_006'),
  ('WS_042', '2026-03-03 06:50:00', '2026-03-03 07:35:00', 390, 'Interval',                     'USR_007'),
  ('WS_043', '2026-03-02 08:00:00', '2026-03-02 08:40:00', 300, 'Yoga',                         'USR_001'),
  ('WS_044', '2026-03-01 17:30:00', '2026-03-01 18:10:00', 310, 'Circuit',                      'USR_002'),
  ('WS_045', '2026-02-28 19:00:00', '2026-02-28 19:50:00', 360, 'Boxing',                       'USR_003'),
  ('WS_046', '2026-02-27 06:20:00', '2026-02-27 07:05:00', 380, 'Long run',                     'USR_004'),
  ('WS_047', '2026-02-26 12:10:00', '2026-02-26 12:50:00', 290, 'Row',                          'USR_005'),
  ('WS_048', '2026-02-25 18:00:00', '2026-02-25 18:45:00', 330, 'Strength',                     'USR_006'),
  ('WS_049', '2026-02-24 07:30:00', '2026-02-24 08:10:00', 300, 'Recovery',                     'USR_007'),
  ('WS_050', '2026-02-23 19:15:00', '2026-02-23 19:55:00', 340, 'HIIT',                         'USR_001'),
  ('WS_051', '2026-02-22 06:45:00', '2026-02-22 07:25:00', 310, 'Tempo run',                    'USR_002'),
  ('WS_052', '2026-02-21 12:00:00', '2026-02-21 12:40:00', 280, 'Midday bike',                  'USR_003'),
  ('WS_053', '2026-02-20 18:30:00', '2026-02-20 19:10:00', 300, 'Strength',                     'USR_004'),
  ('WS_054', '2026-02-19 07:00:00', '2026-02-19 07:45:00', 350, 'Intervals',                    'USR_005'),
  ('WS_055', '2026-02-18 17:45:00', '2026-02-18 18:25:00', 320, 'Circuit',                      'USR_006'),
  ('WS_056', '2026-02-17 06:15:00', '2026-02-17 07:00:00', 360, 'Run',                          'USR_007'),
  ('WS_057', '2026-02-16 19:00:00', '2026-02-16 19:45:00', 330, 'Boxing',                       'USR_001'),
  ('WS_058', '2026-02-15 08:30:00', '2026-02-15 09:10:00', 300, 'Strength',                     'USR_002'),
  ('WS_059', '2026-02-14 18:00:00', '2026-02-14 18:40:00', 290, 'Evening jog',                  'USR_003'),
  ('WS_060', '2026-02-10 06:20:00', '2026-02-10 07:00:00', 320, 'Run',                          'USR_004'),
  ('WS_061', '2026-02-05 18:00:00', '2026-02-05 18:45:00', 340, 'Cross training',               'USR_005'),
  ('WS_062', '2026-02-01 07:00:00', '2026-02-01 07:40:00', 300, 'Intervals',                    'USR_006'),
  ('WS_063', '2026-01-28 12:30:00', '2026-01-28 13:10:00', 280, 'Lunchtime core',               'USR_007'),
  ('WS_064', '2026-01-25 19:00:00', '2026-01-25 19:45:00', 360, 'Strength',                     'USR_001'),
  ('WS_065', '2026-01-20 06:30:00', '2026-01-20 07:20:00', 380, 'Long run',                     'USR_002'),
  ('WS_066', '2026-01-15 17:00:00', '2026-01-15 17:40:00', 300, 'Tempo',                        'USR_003'),
  ('WS_067', '2026-01-10 08:00:00', '2026-01-10 08:40:00', 290, 'Yoga',                         'USR_004'),
  ('WS_068', '2026-01-05 18:30:00', '2026-01-05 19:10:00', 330, 'HIIT',                         'USR_005'),
  ('WS_069', '2025-12-30 06:15:00', '2025-12-30 07:00:00', 310, 'Recovery run',                 'USR_006'),
  ('WS_070', '2025-12-25 12:00:00', '2025-12-25 12:45:00', 300, 'Boxing',                       'USR_007'),
  ('WS_071', '2025-12-20 19:00:00', '2025-12-20 19:40:00', 320, 'Strength',                     'USR_001'),
  ('WS_072', '2025-12-15 07:30:00', '2025-12-15 08:10:00', 300, 'Intervals',                    'USR_002'),
  ('WS_073', '2025-12-10 17:30:00', '2025-12-10 18:10:00', 340, 'Circuit',                      'USR_003'),
  ('WS_074', '2025-12-05 06:45:00', '2025-12-05 07:30:00', 380, 'Long ride',                    'USR_004'),
  ('WS_075', '2025-12-02 18:15:00', '2025-12-02 19:00:00', 350, 'Rowing',                       'USR_005'),
  ('WS_076', '2025-12-01 07:00:00', '2025-12-01 07:40:00', 290, 'Yoga flow',                    'USR_006'),
  ('WS_077', '2025-11-28 12:00:00', '2025-11-28 12:45:00', 300, 'Midday HIIT',                  'USR_007'),
  ('WS_078', '2025-11-20 18:00:00', '2025-11-20 18:50:00', 360, 'Strength',                     'USR_001'),
  ('WS_079', '2025-11-15 06:30:00', '2025-11-15 07:10:00', 310, 'Easy run',                     'USR_002'),
  ('WS_080', '2025-11-10 19:30:00', '2025-11-10 20:10:00', 330, 'Boxing',                       'USR_003'),
  ('WS_081', '2025-11-05 08:00:00', '2025-11-05 08:45:00', 350, 'Intervals',                    'USR_004'),
  ('WS_082', '2025-11-01 17:00:00', '2025-11-01 17:40:00', 300, 'Core',                         'USR_005'),
  ('WS_083', '2025-10-25 06:15:00', '2025-10-25 07:00:00', 320, 'Run',                          'USR_006'),
  ('WS_084', '2025-10-20 19:00:00', '2025-10-20 19:40:00', 300, 'Row',                          'USR_007'),
  ('WS_085', '2025-10-15 07:30:00', '2025-10-15 08:10:00', 310, 'Strength',                     'USR_001'),
  ('WS_086', '2025-10-10 12:30:00', '2025-10-10 13:10:00', 280, 'Lunchtime ride',               'USR_002'),
  ('WS_087', '2025-10-05 18:45:00', '2025-10-05 19:25:00', 340, 'HIIT',                         'USR_003'),
  ('WS_088', '2025-09-30 06:50:00', '2025-09-30 07:30:00', 300, 'Recovery',                     'USR_004'),
  ('WS_089', '2025-09-25 17:15:00', '2025-09-25 17:55:00', 320, 'Circuit',                      'USR_005'),
  ('WS_090', '2025-09-20 08:00:00', '2025-09-20 08:40:00', 290, 'Yoga',                         'USR_006'),
  ('WS_091', '2025-09-15 19:00:00', '2025-09-15 19:45:00', 360, 'Strength',                     'USR_007'),
  ('WS_092', '2025-09-10 07:10:00', '2025-09-10 07:50:00', 300, 'Run',                          'USR_001'),
  ('WS_093', '2025-09-05 18:00:00', '2025-09-05 18:40:00', 310, 'Intervals',                    'USR_002'),
  ('WS_094', '2025-08-30 06:30:00', '2025-08-30 07:10:00', 320, 'Hill repeats',                 'USR_003'),
  ('WS_095', '2025-08-25 12:00:00', '2025-08-25 12:40:00', 280, 'Core & mobility',              'USR_004'),
  ('WS_096', '2025-08-20 19:30:00', '2025-08-20 20:10:00', 340, 'Boxing',                       'USR_005'),
  ('WS_097', '2025-08-15 07:00:00', '2025-08-15 07:40:00', 300, 'Recovery',                     'USR_006'),
  ('WS_098', '2025-08-10 17:45:00', '2025-08-10 18:25:00', 330, 'Circuit',                      'USR_007'),
  ('WS_099', '2025-08-05 06:20:00', '2025-08-05 07:05:00', 360, 'Long ride',                    'USR_001'),
  ('WS_100', '2025-08-01 18:00:00', '2025-08-01 18:40:00', 310, 'Rowing',                       'USR_002'),
  -- USR_008-011
  ('WS_101', '2026-03-21 07:00:00', '2026-03-21 07:55:00', 390, 'Progressive run',     'USR_008'),
  ('WS_102', '2026-03-20 18:20:00', '2026-03-20 19:05:00', 340, 'Lower body session',  'USR_009'),
  ('WS_103', '2026-03-18 06:40:00', '2026-03-18 07:30:00', 370, 'Intervals',           'USR_008'),
  ('WS_104', '2026-03-12 19:00:00', '2026-03-12 19:35:00', 260, 'Recovery mobility',   'USR_010'),
  ('WS_105', '2026-03-11 07:10:00', '2026-03-11 07:50:00', 300, 'Easy cardio',         'USR_009'),
  ('WS_106', '2026-02-24 18:10:00', '2026-02-24 19:00:00', 360, 'Strength',            'USR_010'),
  ('WS_107', '2026-02-19 06:50:00', '2026-02-19 07:30:00', 280, 'Tempo',               'USR_009'),
  ('WS_108', '2026-01-30 17:30:00', '2026-01-30 18:15:00', 320, 'Circuit',             'USR_011');

-- workout_session dynamique (fenêtres 20 jours)
INSERT INTO workout_session (session_id, start_at, end_at, calories_burned, notes, user_id)
SELECT
  'WS_REC_' || to_char(gs.day_ref, 'YYYYMMDD') || '_' || usr.user_id AS session_id,
  (date_trunc('day', gs.day_ref) + usr.start_time)::timestamp AS start_at,
  (date_trunc('day', gs.day_ref) + usr.start_time + interval '45 minutes')::timestamp AS end_at,
  usr.calories_burned,
  'Seed recency workout session',
  usr.user_id
FROM generate_series(CURRENT_DATE - interval '20 days', CURRENT_DATE, interval '1 day') AS gs(day_ref)
CROSS JOIN (
  VALUES
    ('USR_001', time '06:25:00', 420),
    ('USR_002', time '07:10:00', 360),
    ('USR_003', time '18:15:00', 500),
    ('USR_005', time '19:00:00', 340)
) AS usr(user_id, start_time, calories_burned)
WHERE (EXTRACT(DOY FROM gs.day_ref)::int + ascii(right(usr.user_id, 1))) % 3 = 0
ON CONFLICT (session_id) DO UPDATE SET
  start_at        = EXCLUDED.start_at,
  end_at          = EXCLUDED.end_at,
  calories_burned = EXCLUDED.calories_burned,
  notes           = EXCLUDED.notes,
  user_id         = EXCLUDED.user_id;

-- ============================================================
-- workout_session_exercise
-- ============================================================
INSERT INTO workout_session_exercise (session_id, exercise_id, sets) VALUES
  ('WS_001', 'EXC_001', 4), ('WS_001', 'EXC_009', 4), ('WS_001', 'EXC_005', 3),
  ('WS_002', 'EXC_007', 3),
  ('WS_003', 'EXC_008', 5), ('WS_003', 'EXC_001', 4),
  ('WS_004', 'EXC_004', 1), ('WS_004', 'EXC_005', 3),
  ('WS_005', 'EXC_006', 4), ('WS_005', 'EXC_009', 4),
  ('WS_006', 'EXC_007', 3),
  ('WS_007', 'EXC_003', 4), ('WS_007', 'EXC_002', 4),
  ('WS_008', 'EXC_004', 1),
  ('WS_009', 'EXC_008', 4),
  ('WS_010', 'EXC_001', 4), ('WS_010', 'EXC_002', 4),
  ('WS_011', 'EXC_004', 1),
  ('WS_012', 'EXC_007', 3),
  ('WS_013', 'EXC_005', 3),
  ('WS_014', 'EXC_004', 1),
  ('WS_015', 'EXC_005', 3),
  ('WS_016', 'EXC_008', 5),
  ('WS_017', 'EXC_004', 1),
  ('WS_018', 'EXC_003', 4),
  ('WS_019', 'EXC_007', 3),
  ('WS_020', 'EXC_005', 2),
  ('WS_021', 'EXC_004', 1),
  ('WS_022', 'EXC_009', 4),
  ('WS_023', 'EXC_004', 1),
  ('WS_024', 'EXC_010', 6),
  ('WS_025', 'EXC_001', 4),
  ('WS_026', 'EXC_007', 3),
  ('WS_027', 'EXC_002', 4),
  ('WS_028', 'EXC_008', 5),
  ('WS_029', 'EXC_004', 1),
  ('WS_030', 'EXC_005', 3),
  ('WS_031', 'EXC_003', 4),
  ('WS_032', 'EXC_001', 4),
  ('WS_033', 'EXC_008', 4),
  ('WS_034', 'EXC_007', 2),
  ('WS_035', 'EXC_004', 1),
  ('WS_036', 'EXC_010', 6),
  ('WS_037', 'EXC_004', 1),
  ('WS_038', 'EXC_002', 4),
  ('WS_039', 'EXC_009', 4),
  ('WS_040', 'EXC_001', 4),
  ('WS_041', 'EXC_004', 1),
  ('WS_042', 'EXC_008', 5),
  ('WS_043', 'EXC_007', 3),
  ('WS_044', 'EXC_002', 4),
  ('WS_045', 'EXC_006', 4),
  ('WS_046', 'EXC_004', 1),
  ('WS_047', 'EXC_003', 4),
  ('WS_048', 'EXC_009', 4),
  ('WS_049', 'EXC_007', 3),
  ('WS_050', 'EXC_008', 4),
  ('WS_101', 'EXC_004', 1), ('WS_101', 'EXC_010', 5),
  ('WS_102', 'EXC_002', 4), ('WS_102', 'EXC_005', 3),
  ('WS_103', 'EXC_008', 4),
  ('WS_104', 'EXC_007', 3),
  ('WS_105', 'EXC_004', 1),
  ('WS_106', 'EXC_009', 4),
  ('WS_107', 'EXC_001', 4),
  ('WS_108', 'EXC_003', 4);

-- workout_session_exercise dynamique
INSERT INTO workout_session_exercise (session_id, exercise_id, sets)
SELECT
  'WS_REC_' || to_char(gs.day_ref, 'YYYYMMDD') || '_' || usr.user_id AS session_id,
  usr.exercise_id,
  usr.sets
FROM generate_series(CURRENT_DATE - interval '20 days', CURRENT_DATE, interval '1 day') AS gs(day_ref)
CROSS JOIN (
  VALUES
    ('USR_001', 'EXC_004', 1),
    ('USR_002', 'EXC_002', 4),
    ('USR_003', 'EXC_008', 5),
    ('USR_005', 'EXC_007', 3)
) AS usr(user_id, exercise_id, sets)
WHERE (EXTRACT(DOY FROM gs.day_ref)::int + ascii(right(usr.user_id, 1))) % 3 = 0
ON CONFLICT (session_id, exercise_id) DO UPDATE SET sets = EXCLUDED.sets;

-- ============================================================
-- user_health_goal
-- ============================================================
INSERT INTO user_health_goal (user_id, goal_id) VALUES
  ('USR_001', 'GOAL_002'),
  ('USR_002', 'GOAL_001'),
  ('USR_003', 'GOAL_001'),
  ('USR_004', 'GOAL_003'),
  ('USR_005', 'GOAL_005'),
  ('USR_006', 'GOAL_004'),
  ('USR_007', 'GOAL_002'),
  ('USR_008', 'GOAL_003'),
  ('USR_009', 'GOAL_005'),
  ('USR_010', 'GOAL_002'),
  ('USR_011', 'GOAL_001'),
  ('USR_012', 'GOAL_004'),
  ('USR_013', 'GOAL_005'),
  ('USR_014', 'GOAL_003');

-- ============================================================
-- user_organization
-- ============================================================
INSERT INTO user_organization (user_id, organization_id) VALUES
  ('USR_004', 'ORG_001'),
  ('USR_001', 'ORG_002'),
  ('USR_003', 'ORG_003'),
  ('USR_007', 'ORG_005');

-- ============================================================
-- etl_execution dynamique (60 jours — qualité des données)
-- ============================================================
INSERT INTO etl_execution (
  execution_id, name, started_at, ended_at, status,
  records_extracted, records_loaded, records_rejected, error_message
)
SELECT
  'ETL_DQ_' || to_char(gs.day_ref, 'YYYYMMDD') AS execution_id,
  'DataQuality Daily',
  (date_trunc('day', gs.day_ref) + interval '02:00:00')::timestamp,
  (date_trunc('day', gs.day_ref) + interval '02:20:00')::timestamp,
  'LOADED'::pipeline_status_enum,
  (62000 + ((EXTRACT(DOY FROM gs.day_ref)::int % 7) * 1300))::int,
  (61000 + ((EXTRACT(DOY FROM gs.day_ref)::int % 7) * 1180))::int,
  (400  + ((EXTRACT(DOY FROM gs.day_ref)::int % 5) * 60))::int,
  NULL
FROM generate_series(CURRENT_DATE - interval '59 days', CURRENT_DATE, interval '1 day') AS gs(day_ref)
ON CONFLICT (execution_id) DO UPDATE SET
  name              = EXCLUDED.name,
  started_at        = EXCLUDED.started_at,
  ended_at          = EXCLUDED.ended_at,
  status            = EXCLUDED.status,
  records_extracted = EXCLUDED.records_extracted,
  records_loaded    = EXCLUDED.records_loaded,
  records_rejected  = EXCLUDED.records_rejected,
  error_message     = EXCLUDED.error_message;

-- etl_execution dynamique (14 jours — correction anomalies)
INSERT INTO etl_execution (
  execution_id, name, started_at, ended_at, status,
  records_extracted, records_loaded, records_rejected, error_message
)
SELECT
  'ETL_FIX_' || to_char(gs.day_ref, 'YYYYMMDD') AS execution_id,
  'Anomaly Correction Pack',
  (date_trunc('day', gs.day_ref) + interval '04:05:00')::timestamp,
  (date_trunc('day', gs.day_ref) + interval '04:18:00')::timestamp,
  CASE
    WHEN EXTRACT(DOW FROM gs.day_ref) IN (0, 6) THEN 'REJECTED'
    WHEN EXTRACT(DOW FROM gs.day_ref) = 3        THEN 'TRANSFORMED'
    ELSE 'LOADED'
  END::pipeline_status_enum,
  (18000 + ((EXTRACT(DOY FROM gs.day_ref)::int % 6) * 450))::int,
  (17000 + ((EXTRACT(DOY FROM gs.day_ref)::int % 6) * 390))::int,
  (350   + ((EXTRACT(DOY FROM gs.day_ref)::int % 5) * 45))::int,
  CASE
    WHEN EXTRACT(DOW FROM gs.day_ref) IN (0, 6) THEN 'Validation failed: unresolved anomalies above threshold'
    ELSE NULL
  END
FROM generate_series(CURRENT_DATE - interval '13 days', CURRENT_DATE, interval '1 day') AS gs(day_ref)
ON CONFLICT (execution_id) DO UPDATE SET
  name              = EXCLUDED.name,
  started_at        = EXCLUDED.started_at,
  ended_at          = EXCLUDED.ended_at,
  status            = EXCLUDED.status,
  records_extracted = EXCLUDED.records_extracted,
  records_loaded    = EXCLUDED.records_loaded,
  records_rejected  = EXCLUDED.records_rejected,
  error_message     = EXCLUDED.error_message;

-- ============================================================
-- data_quality_check_ dynamique (60 jours)
-- ============================================================
INSERT INTO data_quality_check_ (
  check_id, target_table, check_type, check_rule,
  records_checked, records_failed, checked_at, status, execution_id
)
SELECT
  'CHK_DQ_' || to_char(gs.day_ref, 'YYYYMMDD') || '_' || tpl.suffix AS check_id,
  tpl.target_table, tpl.check_type, tpl.check_rule,
  (tpl.base_checked + ((EXTRACT(DOY FROM gs.day_ref)::int % 9) * 320))::int AS records_checked,
  GREATEST(0, LEAST(
    (tpl.base_checked + 6000),
    ROUND((tpl.base_checked + ((EXTRACT(DOY FROM gs.day_ref)::int % 9) * 320))
      * (tpl.base_fail_ratio
         + (((EXTRACT(DOY FROM gs.day_ref)::int % 11) - 5) * 0.0012)
         + CASE
             WHEN EXTRACT(DOW FROM gs.day_ref) IN (1, 2) THEN 0.018
             WHEN EXTRACT(DOY FROM gs.day_ref)::int % 10 = 0 THEN 0.026
             ELSE 0
           END))::int
  )) AS records_failed,
  (date_trunc('day', gs.day_ref) + tpl.check_time)::timestamp AS checked_at,
  TRUE AS status,
  'ETL_DQ_' || to_char(gs.day_ref, 'YYYYMMDD') AS execution_id
FROM generate_series(CURRENT_DATE - interval '59 days', CURRENT_DATE, interval '1 day') AS gs(day_ref)
CROSS JOIN (VALUES
  ('N', 'ingredient',   'NULL_CHECK',      'name IS NOT NULL',                    42000, 0.010, time '02:23:00'),
  ('R', 'ingredient',   'RANGE_CHECK',     'calories_g BETWEEN 0 AND 900',        41000, 0.014, time '02:25:00'),
  ('D', 'exercise',     'DUPLICATE_CHECK', 'DISTINCT exercise_id',                 2800, 0.003, time '02:27:00'),
  ('U', 'user_metrics', 'RANGE_CHECK',     'resting_bpm BETWEEN 30 AND 220',      36000, 0.012, time '02:29:00')
) AS tpl(suffix, target_table, check_type, check_rule, base_checked, base_fail_ratio, check_time)
ON CONFLICT (check_id) DO UPDATE SET
  target_table    = EXCLUDED.target_table,
  check_type      = EXCLUDED.check_type,
  check_rule      = EXCLUDED.check_rule,
  records_checked = EXCLUDED.records_checked,
  records_failed  = EXCLUDED.records_failed,
  checked_at      = EXCLUDED.checked_at,
  status          = EXCLUDED.status,
  execution_id    = EXCLUDED.execution_id;

-- data_quality_check_ dynamique (14 jours — correction)
INSERT INTO data_quality_check_ (
  check_id, target_table, check_type, check_rule,
  records_checked, records_failed, checked_at, status, execution_id
)
SELECT
  'CHK_FIX_' || to_char(gs.day_ref, 'YYYYMMDD') || '_' || tpl.suffix AS check_id,
  tpl.target_table, tpl.check_type, tpl.check_rule,
  (tpl.base_checked + ((EXTRACT(DOY FROM gs.day_ref)::int % 7) * 140))::int AS records_checked,
  GREATEST(1, ROUND(
    (tpl.base_checked + ((EXTRACT(DOY FROM gs.day_ref)::int % 7) * 140))
    * (tpl.base_fail_ratio + CASE WHEN EXTRACT(DOW FROM gs.day_ref) IN (1,2) THEN 0.015 ELSE 0.006 END)
  )::int) AS records_failed,
  (date_trunc('day', gs.day_ref) + tpl.check_time)::timestamp AS checked_at,
  FALSE AS status,
  'ETL_FIX_' || to_char(gs.day_ref, 'YYYYMMDD') AS execution_id
FROM generate_series(CURRENT_DATE - interval '13 days', CURRENT_DATE, interval '1 day') AS gs(day_ref)
CROSS JOIN (VALUES
  ('A', 'ingredient',   'RANGE_CHECK',       'calories_g BETWEEN 0 AND 900',        12000, 0.016, time '04:22:00'),
  ('B', 'user_metrics', 'RANGE_CHECK',       'resting_bpm BETWEEN 30 AND 220',       9800, 0.013, time '04:24:00'),
  ('C', 'exercise',     'NULL_CHECK',        'name IS NOT NULL',                      4600, 0.009, time '04:26:00'),
  ('D', 'ingredient',   'CONSISTENCY_CHECK', 'fat_g + carbs_g + protein_g <= 100',   9000, 0.011, time '04:28:00')
) AS tpl(suffix, target_table, check_type, check_rule, base_checked, base_fail_ratio, check_time)
ON CONFLICT (check_id) DO UPDATE SET
  target_table    = EXCLUDED.target_table,
  check_type      = EXCLUDED.check_type,
  check_rule      = EXCLUDED.check_rule,
  records_checked = EXCLUDED.records_checked,
  records_failed  = EXCLUDED.records_failed,
  checked_at      = EXCLUDED.checked_at,
  status          = EXCLUDED.status,
  execution_id    = EXCLUDED.execution_id;

-- ============================================================
-- data_anomaly dynamique (20 jours — récent)
-- ============================================================
INSERT INTO data_anomaly (
  anomaly_id, source_table, anomaly_table, field_name, record_identifier,
  original_value, detected_at, severity, is_resolved, resolution_action,
  check_id, execution_id
)
SELECT
  'ANO_REC_' || to_char(gs.day_ref, 'YYYYMMDD') AS anomaly_id,
  'ingredient', 'ingredient', 'calories_g',
  'ING_REC_' || to_char(gs.day_ref, 'YYYYMMDD') AS record_identifier,
  CASE WHEN EXTRACT(DOW FROM gs.day_ref) IN (2, 5) THEN '1200' ELSE '-15' END,
  (date_trunc('day', gs.day_ref) + interval '03:10:00')::timestamp,
  CASE WHEN EXTRACT(DOW FROM gs.day_ref) IN (2, 5) THEN 'HIGH' ELSE 'MEDIUM' END,
  CASE WHEN EXTRACT(DOW FROM gs.day_ref) IN (2, 5) THEN TRUE ELSE FALSE END,
  CASE WHEN EXTRACT(DOW FROM gs.day_ref) IN (2, 5) THEN 'Corrected by recency seed rule' ELSE NULL END,
  'CHK_DQ_' || to_char(gs.day_ref, 'YYYYMMDD') || '_R',
  'ETL_DQ_' || to_char(gs.day_ref, 'YYYYMMDD')
FROM generate_series(CURRENT_DATE - interval '20 days', CURRENT_DATE - interval '1 day', interval '4 days') AS gs(day_ref)
ON CONFLICT (anomaly_id) DO UPDATE SET
  source_table      = EXCLUDED.source_table,
  anomaly_table     = EXCLUDED.anomaly_table,
  field_name        = EXCLUDED.field_name,
  record_identifier = EXCLUDED.record_identifier,
  original_value    = EXCLUDED.original_value,
  detected_at       = EXCLUDED.detected_at,
  severity          = EXCLUDED.severity,
  is_resolved       = EXCLUDED.is_resolved,
  resolution_action = EXCLUDED.resolution_action,
  check_id          = EXCLUDED.check_id,
  execution_id      = EXCLUDED.execution_id;

-- data_anomaly dynamique (14 jours — correction)
INSERT INTO data_anomaly (
  anomaly_id, source_table, anomaly_table, field_name, record_identifier,
  original_value, detected_at, severity, is_resolved, resolution_action,
  check_id, execution_id
)
SELECT
  'ANO_FIX_' || to_char(gs.day_ref, 'YYYYMMDD') || '_' || tpl.suffix AS anomaly_id,
  tpl.source_table, tpl.anomaly_table, tpl.field_name,
  tpl.record_identifier_prefix || '_' || to_char(gs.day_ref, 'YYYYMMDD'),
  tpl.original_value,
  (date_trunc('day', gs.day_ref) + tpl.detect_time)::timestamp,
  tpl.severity,
  CASE WHEN tpl.suffix = 'D' AND EXTRACT(DOW FROM gs.day_ref) IN (2,4) THEN TRUE ELSE FALSE END,
  CASE WHEN tpl.suffix = 'D' AND EXTRACT(DOW FROM gs.day_ref) IN (2,4) THEN 'Resolved by data steward during seed replay' ELSE NULL END,
  'CHK_FIX_' || to_char(gs.day_ref, 'YYYYMMDD') || '_' || tpl.suffix,
  'ETL_FIX_' || to_char(gs.day_ref, 'YYYYMMDD')
FROM generate_series(CURRENT_DATE - interval '13 days', CURRENT_DATE, interval '1 day') AS gs(day_ref)
CROSS JOIN (VALUES
  ('A', 'ingredient',   'ingredient',   'calories_g',     'ING_FIX_NEG',  '-45.2',  'HIGH',   time '04:31:00'),
  ('B', 'user_metrics', 'user_metrics', 'resting_bpm',    'MET_FIX_HIGH', '238',    'HIGH',   time '04:32:00'),
  ('C', 'exercise',     'exercise',     'name',           'EXC_FIX_NULL', '<NULL>', 'MEDIUM', time '04:33:00'),
  ('D', 'ingredient',   'ingredient',   'protein_g',      'ING_FIX_SUM',  '132.7',  'MEDIUM', time '04:34:00')
) AS tpl(suffix, source_table, anomaly_table, field_name, record_identifier_prefix, original_value, severity, detect_time)
ON CONFLICT (anomaly_id) DO UPDATE SET
  source_table      = EXCLUDED.source_table,
  anomaly_table     = EXCLUDED.anomaly_table,
  field_name        = EXCLUDED.field_name,
  record_identifier = EXCLUDED.record_identifier,
  original_value    = EXCLUDED.original_value,
  detected_at       = EXCLUDED.detected_at,
  severity          = EXCLUDED.severity,
  is_resolved       = EXCLUDED.is_resolved,
  resolution_action = EXCLUDED.resolution_action,
  check_id          = EXCLUDED.check_id,
  execution_id      = EXCLUDED.execution_id;

-- ============================================================
-- Refresh statistiques planificateur
-- ============================================================
ANALYZE login_history;
ANALYZE user_metrics;
ANALYZE workout_session;
