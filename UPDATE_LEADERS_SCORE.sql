--#SET TERMINATOR @
CREATE PROCEDURE UPDATE_LEADERS_SCORE(IN in_School_ID INTEGER,
       IN in_Leader_Score INTEGER)

LANGUAGE SQL
MODIFIES SQL DATA

BEGIN

       
       IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
       UPDATE CHICAGO_PUBLIC_SCHOOLS
       SET Leaders_Icon='Very weak'
       WHERE SCHOOL_ID=in_School_ID;

       ELSEIF in_Leader_Score < 40 THEN
       UPDATE CHICAGO_PUBLIC_SCHOOLS
       SET Leaders_Icon='weak'
       WHERE SCHOOL_ID=in_School_ID;

       ELSEIF in_Leader_Score < 60 THEN
       UPDATE CHICAGO_PUBLIC_SCHOOLS
       SET Leaders_Icon='Average'
       WHERE SCHOOL_ID=in_School_ID;

       ELSEIF in_Leader_Score < 80 THEN
       UPDATE CHICAGO_PUBLIC_SCHOOLS
       SET Leaders_Icon='Strong'
       WHERE SCHOOL_ID=in_School_ID;
       
       ELSEIF in_Leader_Score < 100 THEN
       UPDATE CHICAGO_PUBLIC_SCHOOLS
       SET Leaders_Icon='Very strong'
       WHERE SCHOOL_ID=in_School_ID;


       ELSE 
       ROLLBACK WORK;

       END IF;
       COMMIT WORK;
        
END
@
    