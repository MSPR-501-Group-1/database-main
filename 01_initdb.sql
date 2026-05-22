-- SCRIPT PostreSQL pour la DB

-- Pour le hachage ---------------------------------------
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ENUMS ------------------------------------------------

CREATE TYPE nutriscore_enum AS ENUM (
    'A', 'B', 'C', 'D', 'E'
);

CREATE TYPE ingredient_category_enum AS ENUM (
    'VEGETABLE', 'FRUIT', 'MEAT', 'DAIRY', 'GRAIN', 'BEVERAGE', 'SNACK', 'OTHER'
);

CREATE TYPE exercise_difficulty_enum AS ENUM (
    'BEGINNER', 'INTERMEDIATE', 'ADVANCED'
);

CREATE TYPE exercise_category_enum AS ENUM (
    'CARDIO', 'STRENGTH', 'FLEXIBILITY', 'BALANCE', 'OTHER'
);

CREATE TYPE allergies_enum AS ENUM (
    'NONE', 'MILK', 'GLUTEN', 'SEAFOOD', 'SOY', 'EGGS', 'NUTS', 'OTHER'
);

CREATE TYPE diet_type_enum AS ENUM (
    'NONE', 'VEGETARIAN', 'VEGAN', 'PESCATARIAN', 'KETO', 'PALEO', 'OTHER'
);

CREATE TYPE role_type_enum AS ENUM (
    'FREEMIUM', 'PREMIUM', 'PREMIUM_PLUS', 'B2B', 'ADMIN'
);

CREATE TYPE body_part_enum AS ENUM (
    'ARMS', 'LEGS', 'BACK', 'CHEST', 'SHOULDERS', 'CORE', 'FULL_BODY'
);

CREATE TYPE pipeline_status_enum AS ENUM (
    'PENDING', 'FAILED', 'TRANSFORMED', 'REJECTED', 'LOADED'
);

CREATE TYPE gender_enum AS ENUM (
   'Male', 'Female'
);

CREATE TYPE fitness_level_enum AS ENUM (
   'beginner', 'intermediate', 'advanced'
);

CREATE TYPE injury_type_enum AS ENUM (
   'none', 'back', 'knee', 'ankle', 'wrist', 'shoulder'
);

CREATE TYPE injury_severity_enum AS ENUM (
   'none', 'moderate', 'severe', 'mild'
);

CREATE TYPE medical_condition_enum AS ENUM (
   'diabetes', 'none', 'asthma', 'cardiac', 'hypertension'
);

CREATE TYPE health_goal_enum AS ENUM (
   'fat_loss', 'muscle_gain', 'general_health', 'endurance'
);

-- TABLES ------------------------------------------------

CREATE TABLE health_goal(
   goal_id VARCHAR(255),
   label VARCHAR(50),
   description TEXT,
   PRIMARY KEY(goal_id)
);

CREATE TABLE ingredient(
   ingredient_id VARCHAR(255),
   name VARCHAR(255),
   calories_g DECIMAL(4,1),
   fat_g DECIMAL(4,1),
   nutriscore ENUM,
   category ENUM,
   fiber_g DECIMAL(5,2),
   sugar_g DECIMAL(5,2),
   sodium_mg DECIMAL(5,2),
   cholesterol_mg DECIMAL(5,2),
   protein_g DECIMAL(5,2),
   carbs_g DECIMAL(5,2),
   usda_name VARCHAR(60),
   price_per_kg DECIMAL(10,5),
   PRIMARY KEY(ingredient_id)
);

CREATE TABLE role(
   role_id VARCHAR(255),
   role_type ENUM,
   is_system LOGICAL,
   PRIMARY KEY(role_id)
);

CREATE TABLE organization(
   organization_id VARCHAR(255),
   name VARCHAR(255),
   PRIMARY KEY(organization_id)
);

CREATE TABLE etl_execution(
   execution_id VARCHAR(50),
   started_at DATETIME,
   ended_at DATETIME,
   status LOGICAL,
   records_extracted INT,
   records_loaded INT,
   records_rejected INT,
   error_message TEXT,
   PRIMARY KEY(execution_id)
);

CREATE TABLE data_quality_check_(
   check_id VARCHAR(50),
   target_table VARCHAR(50),
   check_type VARCHAR(50),
   check_rule VARCHAR(50),
   records_checked INT,
   records_failed INT,
   checked_at DATETIME,
   status LOGICAL,
   execution_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(check_id),
   FOREIGN KEY(execution_id) REFERENCES etl_execution(execution_id)
);

CREATE TABLE data_anomaly(
   anomaly_id VARCHAR(50),
   source_table VARCHAR(50),
   anomaly_table VARCHAR(50),
   field_name VARCHAR(50),
   record_identifier VARCHAR(50),
   original_value VARCHAR(50),
   detected_at DATETIME,
   severity VARCHAR(50),
   is_resolved LOGICAL,
   resolution_action VARCHAR(50),
   check_id VARCHAR(50),
   execution_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(anomaly_id),
   FOREIGN KEY(check_id) REFERENCES data_quality_check_(check_id),
   FOREIGN KEY(execution_id) REFERENCES etl_execution(execution_id)
);

CREATE TABLE ai_recommendation(
   recommendation_id VARCHAR(50),
   mongodb_document_id VARCHAR(255) NOT NULL,
   mongodb_collection VARCHAR(255) NOT NULL,
   recommendation_type ENUM,
   confidence_score DECIMAL(3,2),
   status ENUM,
   created_at VARCHAR(50),
   PRIMARY KEY(recommendation_id)
);

CREATE TABLE ai_model_registry(
   model_id VARCHAR(50),
   provider ENUM,
   model_name VARCHAR(255),
   model_version VARCHAR(255),
   supported_request_types ENUM,
   max_tokens_input DECIMAL(15,2),
   max_tokens_output DECIMAL(15,2),
   is_active LOGICAL,
   priority_rank INT,
   cost_per_1k_tokens DECIMAL(15,2),
   cost_per_request DECIMAL(15,2),
   created_at DATETIME,
   PRIMARY KEY(model_id)
);

CREATE TABLE model_performance(
   performance_id VARCHAR(50),
   evaluation_period_start DATETIME,
   evaluation_period_end DATETIME,
   precision_ DECIMAL(5,2),
   model_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(performance_id),
   FOREIGN KEY(model_id) REFERENCES ai_model_registry(model_id)
);

CREATE TABLE user_(
   user_id VARCHAR(255),
   email VARCHAR(255),
   password_hash VARCHAR(255),
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   birth_date DATE,
   gender_code INT,
   diet_type ENUM,
   is_active LOGICAL,
   allergies ENUM,
   height_cm DECIMAL(5,2),
   current_weight_kg DECIMAL(5,2),
   ai_consent LOGICAL,
   created_at DATE,
   updated_at DATETIME,
   role_id VARCHAR(255) NOT NULL,
   PRIMARY KEY(user_id),
   UNIQUE(email),
   FOREIGN KEY(role_id) REFERENCES role(role_id)
);

CREATE TABLE recipe(
   recipe_id VARCHAR(255),
   title VARCHAR(255),
   instructions TEXT,
   ai_generated LOGICAL,
   generation_prompt TEXT,
   created_at DATETIME,
   recommendation_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(recipe_id),
   FOREIGN KEY(recommendation_id) REFERENCES ai_recommendation(recommendation_id)
);

CREATE TABLE meal(
   meal_id VARCHAR(255),
   consumed_at DATETIME,
   quantity_grams INT,
   calories_consumed INT,
   user_id VARCHAR(255) NOT NULL,
   PRIMARY KEY(meal_id),
   FOREIGN KEY(user_id) REFERENCES user_(user_id)
);

CREATE TABLE workout_session(
   session_id VARCHAR(255),
   start_at DATETIME,
   end_at DATETIME,
   calories_burned SMALLINT,
   notes TEXT,
   user_id VARCHAR(255) NOT NULL,
   PRIMARY KEY(session_id),
   FOREIGN KEY(user_id) REFERENCES user_(user_id)
);

CREATE TABLE exercise(
   exercise_id VARCHAR(255),
   name VARCHAR(255),
   description TEXT,
   body_part_target ENUM,
   video_url TEXT,
   difficulty_level ENUM,
   equipment_required TEXT,
   category ENUM,
   ai_recommended LOGICAL,
   adaptability_score DECIMAL(5,2),
   created_at DATETIME,
   recommendation_id VARCHAR(50) NOT NULL,
   PRIMARY KEY(exercise_id),
   FOREIGN KEY(recommendation_id) REFERENCES ai_recommendation(recommendation_id)
);

CREATE TABLE login_history(
   last_login_id VARCHAR(255),
   last_login DATETIME,
   user_id VARCHAR(255) NOT NULL,
   PRIMARY KEY(last_login_id),
   FOREIGN KEY(user_id) REFERENCES user_(user_id)
);

CREATE TABLE user_preference(
   preference_id VARCHAR(255),
   excluded_ingredients Array,
   preferred_cuisines Array,
   budget_max_per_meal DECIMAL(6,2),
   user_id VARCHAR(255) NOT NULL,
   PRIMARY KEY(preference_id),
   UNIQUE(user_id),
   FOREIGN KEY(user_id) REFERENCES user_(user_id)
);

CREATE TABLE ai_request(
   request_id VARCHAR(50),
   idempotency_key VARCHAR(255),
   request_type ENUM,
   input_payload TEXT,
   user_context_snapshot TEXT,
   error_message VARCHAR(50),
   retry_count VARCHAR(50),
   api_cost_usd VARCHAR(50),
   processing_time_ms VARCHAR(50),
   status ENUM,
   created_at DATETIME,
   started_at DATETIME,
   completed_at DATETIME,
   model_id VARCHAR(50) NOT NULL,
   recommendation_id VARCHAR(50) NOT NULL,
   user_id VARCHAR(255) NOT NULL,
   PRIMARY KEY(request_id),
   UNIQUE(recommendation_id),
   UNIQUE(idempotency_key),
   FOREIGN KEY(model_id) REFERENCES ai_model_registry(model_id),
   FOREIGN KEY(recommendation_id) REFERENCES ai_recommendation(recommendation_id),
   FOREIGN KEY(user_id) REFERENCES user_(user_id)
);

CREATE TABLE api_quota(
   quota_id VARCHAR(50),
   period_type ENUM,
   period_start DATETIME,
   period_end DATETIME,
   request_limit INT,
   requests_consumed INT,
   created_at DATETIME,
   user_id VARCHAR(255) NOT NULL,
   PRIMARY KEY(quota_id),
   FOREIGN KEY(user_id) REFERENCES user_(user_id)
);

CREATE TABLE user_metrics(
   metric_id VARCHAR(50),
   recorded_at DATE,
   birth_date DATE,
   gender ENUM,
   height_cm DECIMAL(15,2),
   weight_kg DECIMAL(15,2),
   bmi DECIMAL(15,2),
   body_fat_percentage DECIMAL(15,2),
   resting_bpm BYTE,
   health_goal ENUM,
   target_timeline_weeks BYTE,
   fitness_level ENUM,
   fatigue_score BYTE,
   has_gym_access LOGICAL,
   workout_variety_preference BYTE,
   injury_type ENUM,
   injury_severity ENUM,
   medical_condition ENUM,
   user_id VARCHAR(255) NOT NULL,
   PRIMARY KEY(metric_id),
   FOREIGN KEY(user_id) REFERENCES user_(user_id)
);

CREATE TABLE user_health_goal(
   user_id VARCHAR(255),
   goal_id VARCHAR(255),
   PRIMARY KEY(user_id, goal_id),
   FOREIGN KEY(user_id) REFERENCES user_(user_id),
   FOREIGN KEY(goal_id) REFERENCES health_goal(goal_id)
);

CREATE TABLE meal_ingredient(
   ingredient_id VARCHAR(255),
   meal_id VARCHAR(255),
   quantity INT,
   PRIMARY KEY(ingredient_id, meal_id),
   FOREIGN KEY(ingredient_id) REFERENCES ingredient(ingredient_id),
   FOREIGN KEY(meal_id) REFERENCES meal(meal_id)
);

CREATE TABLE recipe_ingredients(
   ingredient_id VARCHAR(255),
   recipe_id VARCHAR(255),
   quantity INT,
   PRIMARY KEY(ingredient_id, recipe_id),
   FOREIGN KEY(ingredient_id) REFERENCES ingredient(ingredient_id),
   FOREIGN KEY(recipe_id) REFERENCES recipe(recipe_id)
);

CREATE TABLE user_organization(
   user_id VARCHAR(255),
   organization_id VARCHAR(255),
   PRIMARY KEY(user_id, organization_id),
   FOREIGN KEY(user_id) REFERENCES user_(user_id),
   FOREIGN KEY(organization_id) REFERENCES organization(organization_id)
);

CREATE TABLE workout_session_exercise(
   session_id VARCHAR(255),
   exercise_id VARCHAR(255),
   sets INT,
   PRIMARY KEY(session_id, exercise_id),
   FOREIGN KEY(session_id) REFERENCES workout_session(session_id),
   FOREIGN KEY(exercise_id) REFERENCES exercise(exercise_id)
);

CREATE TABLE user_ia_recommendation(
   user_id VARCHAR(255),
   recommendation_id VARCHAR(50),
   PRIMARY KEY(user_id, recommendation_id),
   FOREIGN KEY(user_id) REFERENCES user_(user_id),
   FOREIGN KEY(recommendation_id) REFERENCES ai_recommendation(recommendation_id)
);
