CREATE INDEX indx_course_id ON enrollments (course_id );
CREATE INDEX indx_student_id ON enrollments (student_id );
CREATE INDEX indx_department ON courses (department );
CREATE INDEX indx_semester ON courses (semester );
CREATE INDEX indx_course_satisfiction_id ON satisfies (course_id );
CREATE INDEX indx_course_requirement_id ON satisfies (requirement_id );submit50 cs50/problems/2024/sql/harvard
