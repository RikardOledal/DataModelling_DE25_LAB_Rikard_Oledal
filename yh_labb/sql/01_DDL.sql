CREATE TABLE IF NOT EXISTS "Student" (
  "student_id" SERIAL PRIMARY KEY,
  "class_id" integer NOT NULL,
  "first_name" varchar(50) NOT NULL,
  "last_name" varchar(50) NOT NULL,
  "address_id" integer NOT NULL,
  "email" varchar(255) NOT NULL,
  "student_info_id" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS "StudentInfo" (
  "student_info_id" SERIAL PRIMARY KEY,
  "phone_nr" varchar(20),
  "social_security_nr" varchar(12) UNIQUE NOT NULL CHECK (social_security_nr ~ '^[0-9]{12}$'),
  "private_email" varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS "Address" (
  "address_id" SERIAL PRIMARY KEY,
  "address" varchar(100) NOT NULL,
  "zip_code" varchar(5) NOT NULL CHECK (zip_code ~ '^[0-9]{5}$'),
  "city_id" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS "City" (
  "city_id" SERIAL PRIMARY KEY,
  "city_name" varchar(50)
);

CREATE TABLE IF NOT EXISTS "Class" (
  "class_id" SERIAL PRIMARY KEY,
  "class_code" varchar(5) UNIQUE,
  "educatorlead_id" integer,
  "program_id" integer,
  "ind_course_id" integer,
  "class_start" date NOT NULL,
  CONSTRAINT "check_class_source" CHECK (((program_id IS NOT NULL AND ind_course_id IS NULL) OR (program_id IS NULL AND ind_course_id IS NOT NULL)))
);

CREATE TABLE IF NOT EXISTS "IndependentCourse" (
  "ind_course_id" SERIAL PRIMARY KEY,
  "ind_course_code" varchar(5) UNIQUE,
  "course_id" integer,
  "name" varchar(50) NOT NULL,
  "school_id" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS "Program" (
  "program_id" SERIAL PRIMARY KEY,
  "program_code" varchar(5) UNIQUE,
  "name" varchar(50) NOT NULL,
  "description" varchar(255) NOT NULL,
  "school_id" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS "ProgramCourse" (
  "programcourse_id" SERIAL PRIMARY KEY,
  "program_id" integer NOT NULL,
  "course_id" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS "Course" (
  "course_id" SERIAL PRIMARY KEY,
  "course_code" varchar(5) NOT NULL,
  "name" varchar(50) NOT NULL,
  "points" integer,
  "description" varchar(255)
);

CREATE TABLE IF NOT EXISTS "CourseEducator" (
  "courseeducator_id" SERIAL PRIMARY KEY,
  "course_id" integer,
  "educator_id" integer
);

CREATE TABLE IF NOT EXISTS "Educator" (
  "educator_id" SERIAL PRIMARY KEY,
  "staff_id" integer,
  "consultant_id" integer,
  CONSTRAINT "check_educator_source" CHECK (((staff_id IS NOT NULL AND consultant_id IS NULL) OR
     (staff_id IS NULL AND consultant_id IS NOT NULL)))
);

CREATE TABLE IF NOT EXISTS "EducationLeader" (
  "educatorlead_id" SERIAL PRIMARY KEY,
  "staff_id" integer
);

CREATE TABLE IF NOT EXISTS "School" (
  "school_id" SERIAL PRIMARY KEY,
  "name" varchar(50) NOT NULL,
  "address_id" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS "Staff" (
  "staff_id" SERIAL PRIMARY KEY,
  "first_name" varchar(50) NOT NULL,
  "last_name" varchar(50) NOT NULL,
  "role" varchar(50) NOT NULL,
  "address_id" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS "Salary" (
  "salary_id" SERIAL PRIMARY KEY,
  "staff_id" integer NOT NULL,
  "monthly_salary" Decimal(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS "Consultant" (
  "consultant_id" SERIAL PRIMARY KEY,
  "consultingco_id" integer NOT NULL,
  "first_name" varchar(50) NOT NULL,
  "last_name" varchar(50) NOT NULL,
  "role" varchar(50) NOT NULL,
  "address_id" integer NOT NULL,
  "consultantinfo_id" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS "Consultant_info" (
  "consultantinfo_id" SERIAL PRIMARY KEY,
  "hour_fee" Decimal(8,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS "ConsultingCo" (
  "consultingco_id" SERIAL PRIMARY KEY,
  "name" varchar(50) NOT NULL,
  "organization_number" varchar(10) UNIQUE NOT NULL CHECK (organization_number ~ '^[0-9]{10}$'),
  "f_tax" bool DEFAULT true,
  "address_id" integer NOT NULL
);

ALTER TABLE "Student" ADD FOREIGN KEY ("class_id") REFERENCES "Class" ("class_id");

ALTER TABLE "Student" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("address_id");

ALTER TABLE "Student" ADD FOREIGN KEY ("student_info_id") REFERENCES "StudentInfo" ("student_info_id");

ALTER TABLE "Address" ADD FOREIGN KEY ("city_id") REFERENCES "City" ("city_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("educatorlead_id") REFERENCES "EducationLeader" ("educatorlead_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id");

ALTER TABLE "Class" ADD FOREIGN KEY ("ind_course_id") REFERENCES "IndependentCourse" ("ind_course_id");

ALTER TABLE "IndependentCourse" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id");

ALTER TABLE "IndependentCourse" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "Program" ADD FOREIGN KEY ("school_id") REFERENCES "School" ("school_id");

ALTER TABLE "ProgramCourse" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id");

ALTER TABLE "ProgramCourse" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id");

ALTER TABLE "CourseEducator" ADD FOREIGN KEY ("course_id") REFERENCES "Course" ("course_id");

ALTER TABLE "CourseEducator" ADD FOREIGN KEY ("educator_id") REFERENCES "Educator" ("educator_id");

ALTER TABLE "Educator" ADD FOREIGN KEY ("staff_id") REFERENCES "Staff" ("staff_id");

ALTER TABLE "Educator" ADD FOREIGN KEY ("consultant_id") REFERENCES "Consultant" ("consultant_id");

ALTER TABLE "EducationLeader" ADD FOREIGN KEY ("staff_id") REFERENCES "Staff" ("staff_id");

ALTER TABLE "School" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("address_id");

ALTER TABLE "Staff" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("address_id");

ALTER TABLE "Salary" ADD FOREIGN KEY ("staff_id") REFERENCES "Staff" ("staff_id");

ALTER TABLE "Consultant" ADD FOREIGN KEY ("consultingco_id") REFERENCES "ConsultingCo" ("consultingco_id");

ALTER TABLE "Consultant" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("address_id");

ALTER TABLE "Consultant" ADD FOREIGN KEY ("consultantinfo_id") REFERENCES "Consultant_info" ("consultantinfo_id");

ALTER TABLE "ConsultingCo" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("address_id");
