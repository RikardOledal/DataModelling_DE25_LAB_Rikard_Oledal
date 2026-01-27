SELECT 
    s.first_name AS Elev, 
    s.last_name AS Efternamn, 
    a.address AS Gata, 
    ci.city_name AS Stad,
    st.first_name AS Utbildningsledare
FROM "Student" s
JOIN "Address" a ON s.address_id = a.address_id
JOIN "City" ci ON a.city_id = ci.city_id
JOIN "Class" c ON s.class_id = c.class_id
JOIN "EducationLeader" el ON c.educatorlead_id = el.educatorlead_id
JOIN "Staff" st ON el.staff_id = st.staff_id
LIMIT 10;