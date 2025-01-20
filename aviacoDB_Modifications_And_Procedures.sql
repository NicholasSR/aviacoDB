/*
  FILE: AviaCo_DB_Modifications_And_Procedures.sql
  AUTHOR: Nicholas Steven
  DESCRIPTION: This script applies the following changes for AviaCo database:

  1. Modification of MODEL table to add MOD_WAIT_CHG
  2. Modification of CHARTER table to add cost-related columns
  3. Updating CHARTER columns for wait charge, flight charge, tax, etc.
  4. Modification of PILOT table to add PIL_PIC_HRS
  5. Stored procedure PRC_PIC_HOURS
  6. Stored procedure PRC_CHAR_HOURS
*/

/**********************************
 * 1. Modification of MODEL Table
 **********************************/
ALTER TABLE MODEL
ADD MOD_WAIT_CHG float(8);

UPDATE MODEL
SET MOD_WAIT_CHG = 100
WHERE MOD_CODE = 'C-90A';

UPDATE MODEL
SET MOD_WAIT_CHG = 50
WHERE MOD_CODE = 'PA31-350';

UPDATE MODEL
SET MOD_WAIT_CHG = 75
WHERE MOD_CODE = 'PA23-250';

/**********************************
 * 2. Modification of CHARTER Table
 **********************************/
ALTER TABLE CHARTER
ADD CHAR_WAIT_CHG float(8),
ADD CHAR_FLT_CHG_HR float(8),
ADD CHAR_FLT_CHG float(8),
ADD CHAR_TAX_CHG float(8),
ADD CHAR_TOT_CHG float(8),
ADD CHAR_PYMT float(8),
ADD CHAR_BALANCE float(8);

/**********************************
 * 3(a) - 3(e) Updating CHARTER Columns
 **********************************/
/* 3(a) */
UPDATE CHARTER
JOIN AIRCRAFT ON CHARTER.AC_NUMBER = AIRCRAFT.AC_NUMBER
JOIN MODEL ON AIRCRAFT.MOD_CODE = MODEL.MOD_CODE
SET CHARTER.CHAR_WAIT_CHG = MODEL.MOD_WAIT_CHG;

/* 3(b) */
UPDATE CHARTER
JOIN AIRCRAFT ON CHARTER.AC_NUMBER = AIRCRAFT.AC_NUMBER
JOIN MODEL ON AIRCRAFT.MOD_CODE = MODEL.MOD_CODE
SET CHARTER.CHAR_FLT_CHG_HR = MODEL.MOD_CHG_MILE;

/* 3(c) */
UPDATE CHARTER
SET CHAR_FLT_CHG = CHAR_HOURS_FLOWN * CHAR_FLT_CHG_HR;

/* 3(d) */
UPDATE CHARTER
SET CHAR_TAX_CHG = CHAR_FLT_CHG * 0.15;

/* 3(e) */
UPDATE CHARTER
SET CHAR_TOT_CHG = CHAR_FLT_CHG + CHAR_TAX_CHG;

/**********************************
 * 4. Modification of PILOT Table
 **********************************/
ALTER TABLE PILOT
ADD PIL_PIC_HRS float(8) DEFAULT 0;

/**********************************
 * 5. Stored Procedure: PRC_PIC_HOURS
 **********************************/
DELIMITER //
CREATE PROCEDURE PRC_PIC_HOURS(IN p_EMP_NUM INT)
BEGIN
    DECLARE v_total_hours FLOAT(8);

    SELECT SUM(c.CHAR_HOURS_FLOWN) INTO v_total_hours
    FROM CHARTER c
    JOIN CREW cr ON c.CHAR_TRIP = cr.CHAR_TRIP
    WHERE cr.EMP_NUM = p_EMP_NUM
      AND cr.CREW_JOB = 'Pilot';

    IF v_total_hours IS NULL THEN
        SET v_total_hours = 0;
    END IF;

    UPDATE PILOT
    SET PIL_PIC_HRS = v_total_hours
    WHERE EMP_NUM = p_EMP_NUM;
END //
DELIMITER ;

/**********************************
 * 6. Stored Procedure: PRC_CHAR_HOURS
 **********************************/
DELIMITER //
CREATE PROCEDURE PRC_CHAR_HOURS(IN ac VARCHAR(5))
BEGIN
    UPDATE AIRCRAFT
    SET AC_TTAF = (SELECT SUM(CHAR_HOURS_FLOWN) FROM CHARTER WHERE AC_NUMBER = ac),
        AC_TTEL = (SELECT SUM(CHAR_HOURS_FLOWN) FROM CHARTER WHERE AC_NUMBER = ac),
        AC_TTER = (SELECT SUM(CHAR_HOURS_FLOWN) FROM CHARTER WHERE AC_NUMBER = ac)
    WHERE AC_NUMBER = ac;
END //
DELIMITER ;

/* End of script */
