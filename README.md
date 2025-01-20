![image](https://github.com/user-attachments/assets/c81e7ebd-df13-4e3d-9d23-ff65fdcfa013)

# Aviaco Database Modifications and Stored Procedures

This repository contains SQL scripts that modify the **Aviaco** database and implement several stored procedures. 

## Files

- `aviacoDB_Modifications_And_Procedures.sql`: Contains all necessary DDL/DML to:
  1. Modify existing tables (`MODEL`, `CHARTER`, `PILOT`)
  2. Update data in the `CHARTER` table
  3. Add stored procedures (`PRC_PIC_HOURS` and `PRC_CHAR_HOURS`)

## How to Run

1. Ensure you have created the **Aviaco** database using the provided `aviacoDB_Schema.sql` script.
2. Execute `aviacoDB_Modifications_And_Procedures.sql` in your MySQL (or other SQL) environment.
3. Optionally, verify the changes using the sample `SELECT` statements within the script.

## Requirements

- Tested on MySQL 8.x
- Basic knowledge of running SQL scripts in a client (e.g., MySQL Workbench, CLI)
