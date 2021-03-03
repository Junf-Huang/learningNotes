5.1 创建数据文件大小20M的表空间
> CREATE TABLESPACE usertbs1 datafile 
'D:\tmp\usertbs1.DBF' SIZE 20M;

5.2 区定制分配
> CREATE TABLESPACE usertbs1 datafile 
'D:\tmp\usertbs1.DBF' SIZE 20M
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 512K;
-区间管理本地统一大小

5.3 每次自动扩展1M，最大值为100MB
> ALTER DATABASE DATAFILE 
'D:\tmp\usertbs1.DBF' 
AUTOEXTEND ON NEXT 1M MAXSIZE 100M;
-自动延伸

5.4 创建临时表空间
> CREATE TEMPORARY TABLESPACE temptbs TEMPFILE
'D:\tmp\temptbs.DBF' SIZE 20M
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 10M;
 /*设置当前默认表空间*/
> ALTER DATABASE DEFAULT TABLESPACE temptbs;

5.5 对表空间联机脱机
> ALTER TABLESPACE usertbs1 OFFLINE;
> ALTER TABLESPACE usertbs1 ONLINE;

5.9 为表空间添加数据文件
> ALTER TABLESPACE usertbs1 ADD DATAFILE
'D:\tmp\USERS05.DBF' SIZE 50M;

10题与3题一样

5.12 数据文件更名
> ALTER TABLESPACE usertbs1 OFFLINE;
手动改数据文件名为 USERS005.DBFs
> ALTER TABLESPACE usertbs1 RENAME DATAFILE
'D:\tmp\USERTBS1.DBF' TO 
'D:\tmp\USERS005.DBF';
> ALTER TABLESPACE usertbs1 ONLINE;

5.14 添加重做日志组，包含redo5a.log和redo5b.log,大小为5MB
> ALTER DATABASE ADD LOGFILE GROUP 4
('D:\tmp\redo5a.log', 'D:\tmp\redo5b.log')
SIZE 5M;

5.15 添加日志文件成员
> ALTER DATABASE ADD LOGFILE MEMBER
'D:\tmp\redo5c.log' TO GROUP 4;

5.16 切换归档模式且自动归档
> SHUTDOWN IMMEDIATE
> STARTUP MOUNT
> ALTER DATABASE ARCHIVELOG
> ALTER DATABASE OPEN

5.17 设置数据库归档路径
> ALTER SYSTEM SET log_archive_dest="D:\ORACLE\BACKUP";

6.2 建表
> CREATE TABLE exer_class(
    CNO NUMBER(2) PRIMARY KEY,
    CNAME VARCHAR(20),
    NUM NUMBER(3)
);
> CREATE TABLE exer_studnet(
    SNO NUMBER(4) PRIMARY KEY,
    SNAME VARCHAR(10) UNIQUE,
    SAGE NUMBER,
    SEX CHAR(2),
    CNO NUMBER(2)
);

6.3 添加检查约束
> ALTER TABLE exer_studnet ADD 
CONSTRAINT S_CK CHECK (SAGE BETWEEN 0 AND 100);

6.4 取值为M或F，默认M (importance)
> ALTER TABLE exer_studnet ADD 
CONSTRAINT SEX_CK CHECK(SEX IN ('M','F'));
> ALTER TABLE exer_studnet MODIFY SEX DEFAULT 'M';

6.5 建立唯一索引
> CREATE UNIQUE INDEX class_name_index ON exer_class(CNAME) TABLESPACE indx;

6.6 创建视图
> CREATE VIEW cl_stu_view as 
SELECT c.CNO, c.CNAME, s.SNO, s.SNAME FROM exer_class c, exer_studnet s 
WHERE s.CNO=c.CNO;

6.7 创建序列
> CREATE SEQUENCE no_seq START WITH 100000001 INCREMENT BY 1 NOCACHE NOCYCLE;

6.8 表格分区
> CREATE TABLESPACE EXAMPLE DATAFILE
'D:\tmp\EXAMPLE.DBF' SIZE 50M;
> CREATE TABLESPACE ORCLTBS1 DATAFILE
'D:\tmp\ORCLTBS1.DBF' SIZE 50M;
> CREATE TABLESPACE ORCLTBS2 DATAFILE
'D:\tmp\ORCLTBS2.DBF' SIZE 50M;

> CREATE TABLE exer_student_range(
    SNO NUMBER(4) PRIMARY KEY,
    SNAME VARCHAR(10) UNIQUE,
    SAGE NUMBER,
    SEX CHAR(2),
    CNO NUMBER(2)
)
PARTITION BY RANGE(SAGE)(
    PARTITION P1 VALUES LESS THAN (20) TABLESPACE EXAMPLE,
    PARTITION P2 VALUES LESS THAN (30) TABLESPACE ORCLTBS1,
    PARTITION P3 VALUES LESS THAN (MAXVALUE) TABLESPACE ORCLTBS2
);

6.9 按性别分区
> CREATE TABLE exer_student_list(
    SNO NUMBER(4) PRIMARY KEY,
    SNAME VARCHAR(10) UNIQUE,
    SAGE NUMBER,
    SEX CHAR(2),
    CNO NUMBER(2)
)
PARTITION BY LIST(SEX)(
    PARTITION male VALUES('M') TABLESPACE ORCLTBS1,
    PARTITION female VALUES('F') TABLESPACE ORCLTBS2
);

6.10 本地分区索引
> CREATE INDEX student_local ON exer_student_range(SAGE) LOCAL;


9.1 输出所有员工
> SET SERVEROUTPUT ON;
> DECLARE
    CURSOR cursor_emp IS 
    SELECT ENAME, EMPNO, SAL, DEPTNO from emp;
BEGIN
    FOR emp_record IN cursor_emp
  LOOP
    DBMS_OUTPUT.PUT_LINE(emp_record.ENAME||' '||emp_record.EMPNO
    ||' '||emp_record.SAL||' '||emp_record.DEPTNO);
  END LOOP;
END;
/  

9.2 输出比平均工资高的员工
> SET SERVEROUTPUT ON;
> DECLARE
    CURSOR cursor_emp IS 
    SELECT ENAME, EMPNO, SAL, DEPTNO FROM EMP 
    WHERE SAL>(SELECT AVG(SAL) FROM EMP);
BEGIN
    FOR emp_record IN cursor_emp
  LOOP
    DBMS_OUTPUT.PUT_LINE(emp_record.ENAME||' '||emp_record.EMPNO
    ||' '||emp_record.SAL||' '||emp_record.DEPTNO);
  END LOOP;
END;
/  

9.3 输出员工及部门名
> SET SERVEROUTPUT ON;
> DECLARE
    CURSOR cursor_emp IS 
    SELECT ENAME, EMPNO, SAL, DNAME FROM EMP e,  DEPT d
    WHERE e.DEPTNO=d.DEPTNO;
BEGIN
    FOR emp_record IN cursor_emp
  LOOP
    DBMS_OUTPUT.PUT_LINE(emp_record.ENAME||' '||emp_record.EMPNO
    ||' '||emp_record.SAL||' '||emp_record.DNAME);
  END LOOP;
END;
/

9.4 查找员工
> SET SERVEROUTPUT ON;
> DECLARE
    emp_record EMP%ROWTYPE;
BEGIN
    SELECT * INTO emp_record FROM EMP where ENAME='Smith'; 
    DBMS_OUTPUT.PUT_LINE(emp_record.ENAME||' '||emp_record.EMPNO
        ||' '||emp_record.SAL||' '||emp_record.HIREDATE||' '||emp_record.DEPTNO);
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    INSERT INTO EMP(EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO) VALUES
    (210, 'Smith', 'AD_VP', 7500, to_date ('2000-10-05', 'YYYY-MM-DD'), 50);
    WHEN TOO_MANY_ROWS THEN
    FOR v_emp IN (SELECT * INTO emp_record FROM EMP where ENAME='Smith')
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_emp.ENAME||' '||v_emp.EMPNO
        ||' '||v_emp.SAL||' '||v_emp.HIREDATE||' '||v_emp.DEPTNO);
  END LOOP;
END;
/

10.1 创建存储过程
CREATE OR REPLACE PROCEDURE outSal(
    id EMP.EMPNO%TYPE)
AS
  salary EMP.SAL%TYPE;
BEGIN
  SELECT SAL INTO salary FROM EMP WHERE EMP.EMPNO=id;
  DBMS_OUTPUT.PUT_LINE(salary);
EXCEPTION 
  WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('对不起，没有此员工！');
END outSal;
/
> call outSal(210);

10.2 加工资
CREATE OR REPLACE PROCEDURE increaSal(
  id EMP.EMPNO%TYPE)
AS
  emp_increment NUMBER;
  emp_dept EMP.DEPTNO%TYPE;
BEGIN
  SELECT DEPTNO INTO emp_dept FROM EMP WHERE EMP.EMPNO=id;
	
  IF emp_dept=10 THEN emp_increment := 140;
  ELSIF emp_dept=20 THEN emp_increment := 200;
  ELSIF emp_dept=30 THEN emp_increment := 250;
  ELSE emp_increment := 300;
  END IF;

  UPDATE emp SET sal = sal + emp_increment
  WHERE	EMP.EMPNO=id;
END;
/
> call increaSal(210);

10.5 创建包，包含函数和过程
> CREATE OR REPLACE PACKAGE mypkg IS
  FUNCTION maxSal(dno EMP.DEPTNO%TYPE) return EMP.SAL%TYPE; 
  PROCEDURE staff(dno EMP.DEPTNO%TYPE);
END mypkg;
/

> CREATE OR REPLACE PACKAGE BODY mypkg IS
    FUNCTION maxSal(dno EMP.DEPTNO%TYPE) 
    return EMP.SAL%TYPE IS
  max_sal EMP.SAL%TYPE;
  BEGIN
    SELECT MAX(SAL) INTO max_sal
    FROM  EMP where DEPTNO=dno;
    RETURN max_sal;
  END maxSal;
  
  PROCEDURE staff(dno EMP.DEPTNO%TYPE) IS
    CURSOR cursor_emp IS  
    SELECT EMPNO, ENAME FROM (SELECT EMPNO, ENAME, SAL FROM EMP WHERE DEPTNO=dno) 
    where SAL=maxSal(dno);
  BEGIN
    FOR emp_record IN cursor_emp
    loop  
        dbms_output.put_line('No:'||emp_record.EMPNO||' Name:'||emp_record.ENAME);
    end loop;
  END staff;
END mypkg;
/
> EXECUTE dbms_output.put_line(mypkg.maxSal(20));
> EXECUTE mypkg.staff(20); 

10.6 包含过程和游标
> CREATE OR REPLACE PACKAGE mypkg IS
    CURSOR cursor_emp IS SELECT * FROM EMP;
    PROCEDURE staff;
END mypkg;
/
> CREATE OR REPLACE PACKAGE BODY mypkg IS  
  PROCEDURE staff IS
  BEGIN
    FOR emp_record IN cursor_emp
    loop  
        EXIT WHEN cursor_emp%ROWCOUNT>5 or cursor_emp%NOTFOUND;
        dbms_output.put_line('No:'||emp_record.EMPNO||' Name:'||emp_record.ENAME);
    end loop;
  END staff;
END mypkg;
/
> EXECUTE  MyPKG.staff; 

10.7 创建触发器
> CREATE OR REPLACE TRIGGER trg_secure_emp
    BEFORE INSERT OR UPDATE OR DELETE ON EMP
BEGIN
    IF TO_CHAR(SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '17:00'
    THEN
        RAISE_APPLICATION_ERROR (-20005, 'You can only change table in normal time.');
    END IF;
END trg_secure_emp;
/

10.8 触发事件，统计
> CREATE OR REPLACE TRIGGER trg_secure_emp
    AFTER INSERT OR UPDATE OR DELETE ON EMP
DECLARE
    v_count NUMBER;
    v_sal NUMBER(7,2);
BEGIN
    SELECT COUNT(DISTINCT EMPNO), AVG(SAL) INTO v_count, v_sal FROM EMP;
    dbms_output.put_line('Count:'|| v_count||' AvgSal:'||v_sal);
END trg_secure_emp;
/

13.1 创建用户
> CREATE USER usera_exer IDENTIFIED BY usera
DEFAULT TABLESPACE USERS QUOTA 10M ON USERS
ACCOUNT LOCK;  

13.2
> CREATE USER userb_exer IDENTIFIED BY userb
DEFAULT TABLESPACE USERS QUOTA 10M ON USERS;  

13.3 赋权
> GRANT CREATE SESSION TO usera_exer WITH ADMIN OPTION;
> GRANT SELECT, UPDATE ON SCOTT.EMP TO usera_exer WITH GRANT OPTION;

13.4 解锁
> ALTER USER usera_exer ACCOUNT UNLOCK;

13.5 登录修改赋权
> GRANT SELECT, UPDATE ON SCOTT.EMP TO userb_exer WITH GRANT OPTION;

13.6 禁止授权
> REVOKE CREATE SESSION FROM usera_exer;
> GRANT CREATE SESSION TO usera_exer;

13.7 回收
> REVOKE SELECT, UPDATE ON SCOTT.EMP FROM usera_exer;
> GRANT SELECT, UPDATE ON SCOTT.EMP TO userb_exer;

13.8 创建角色
> CREATE ROLE rola;
> CREATE ROLE rolb;
> GRANT CREATE TABLE TO rola;
> GRANT INSERT, DELETE ON SCOTT.EMP TO rola;
> GRANT CONNECT, RESOURCE TO rolb;

13.9 授予角色
> GRANT rola TO usera_exer;

13.10 创建概要文件
> CREATE PROFILE usera_profile LIMIT
CONNECT_TIME 30 
IDLE_TIME 10 
PASSWORD_LIFE_TIME 20
FAILED_LOGIN_ATTEMPTS 4 
PASSWORD_LOCK_TIME 10; 

> ALTER USER usera_exer PROFILE usera_profile;

14.1 冷备份
> SELECT file_name FROM dba_data_files;
> SELECT member FROM v$logfile;
> SELECT value FROM v$parameter WHERE name='control_files';
> SHUTDOWN IMMEDIATE;
 /*手动复制粘贴文件*/
> STARTUP

14.2 热备份
/*开启归档模式*/
> SHUTDOWN IMMEDIATE
> STARTUP MOUNT
> ALTER DATABASE ARCHIVELOG;
> ALTER DATABASE OPEN;
> SELECT tablespace_name, file_name FROM dba_data_files ORDER BY tablespace_name;
> ALTER TABLESPACE USERS BEGIN BACKUP;
 /*手动复制粘贴文件*/
> ALTER TABLESPACE USERS END BACKUP;
 /*对其余的表空间进行相同操作*/
> ALTER DATABASE BACKUP CONTROLFILE  TO 'D:\tmp\CONTROL.CTL'
> ALTER SYSTEM ARCHIVE LOG CURRENT;
> ALTER SYSTEM SWITCH LOGFILE;
 /*手动复制粘贴归档日志文件和初始化参数文件
    归档日志文件位置：
    show parameter db_recovery_file_dest;
    初始化参数文件位置：
    SELECT NAME, VALUE FROM V$parameter WHERE NAME='spfile';
    */
14.3
/*参考以上操作*/

14.4 热备份恢复
> SHUTDOWN IMMEDIATE
> STARTUP MOUNT
> ALTER DATABASE ARCHIVELOG;
> ALTER DATABASE DATAFILE 'D:\APP\JUNF\ORADATA\ORCL\USERS01.DBF' OFFLINE;
/*复制粘贴DBF文件*/
> RECOVER DATAFILE 'D:\APP\JUNF\ORADATA\ORCL\USERS01.DBF';
> ALTER DATABASE DATAFILE 'D:\APP\JUNF\ORADATA\ORCL\USERS01.DBF' ONLINE;

14.8 EXPDP 
 /*手动本地建立目录tmp*/
> CREATE OR REPLACE DIRECTORY dumpdir AS 'D:\tmp';
> GRANT READ, WRITE ON DIRECTORY dumpdir TO SCOTT;
 /*在cmd敲
 expdp scott/scott DIRECTORY=dumpdir DUMPFILE=scott.dmp SCHEMAS=scott
 */

15.4
> set time on
/*直接照打*/

15.5 闪回查询
> set time on
>select * from exercise as of 
timestamp to_timestamp('2018-6-6 15:40:10', 'YYYY-MM-DD HH24:MI:SS');

15.6 闪回版本查询
> set time on
> SELECT versions_xid XID, versions_starttime STARTTIME, versions_endtime ENDTIME, versions_operation OPERATION, 
sno, sname FROM exercise VERSIONS BETWEEN TIMESTAMP 
to_timestamp('2018-6-15 15:35:10', 'YYYY-MM-DD HH24:MI:SS')
AND 
to_timestamp('2018-6-16 15:42:10', 'YYYY-MM-DD HH24:MI:SS')
WHERE sno=100 ORDER BY STARTTIME;

15.7 闪回表
> set time on
> ALTER TABLE exercise ENABLE ROW MOVEMENT;
> FLASHBACK TABLE exercise TO TIMESTAMP to_timestamp('2018-6-16 15:40:10', 'YYYY-MM-DD HH24:MI:SS');

15.8 闪回删除
> ALTER SYSTEM SET RECYCLEBIN=ON;
> SELECT OBJECT_NAME, ORIGINAL_NAME, TYPE FROM USER_RECYCLEBIN;
> FLASHBACK TABLE exercise TO BEFORE DROP;

15.9 闪回日志
> ALTER SYSTEM SET db_flashback_retention_target=4320;

15.10 闪回数据库
 /*开启归档模式*/
> SHUTDOWN IMMEDIATE
> STARTUP MOUNT
> ALTER DATABASE FLASHBACK ON;
> ALTER DATABASE OPEN;
> set time on
 /*以上操作都得在表操作之前*/
> SHUTDOWN IMMEDIATE
> STARTUP MOUNT EXCLUSIVE
> FLASHBACK DATABASE TO TIMESTAMP (to_timestamp('2018-6-16 15:30:00', 'YYYY-MM-DD HH24:MI:SS'));
> ALTER DATABASE OPEN RESETLOGS;