\pset pager off

SELECT 
    s."first_name" || ' ' || s."last_name" AS "Namn",
    s."role" AS "Roll",
    sal."monthly_salary" AS "Månadslön",
    sal."monthly_salary" * 12 AS "Årslön"
FROM "Staff" s
JOIN "Salary" sal ON s."staff_id" = sal."staff_id"
ORDER BY sal."monthly_salary" DESC;

SELECT 
    c."class_code" AS "Klass",
    COALESCE(p."name", ic."name") AS "Utbildning",
    s."first_name" || ' ' || s."last_name" AS "Elev",
    s."email" AS "Skolmail"
FROM "Class" c
LEFT JOIN "Program" p ON c."program_id" = p."program_id"
LEFT JOIN "IndependentCourse" ic ON c."ind_course_id" = ic."ind_course_id"
JOIN "Student" s ON c."class_id" = s."class_id"
ORDER BY c."class_code", s."last_name";

SELECT 
    c."first_name" || ' ' || c."last_name" AS "Konsult",
    co."name" AS "Konsultbolag",
    ci."hour_fee" AS "Timarvode"
FROM "Consultant" c
JOIN "ConsultingCo" co ON c."consultingco_id" = co."consultingco_id"
JOIN "Consultant_info" ci ON c."consultantinfo_id" = ci."consultantinfo_id";