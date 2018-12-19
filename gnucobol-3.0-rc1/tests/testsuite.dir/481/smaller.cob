
       IDENTIFICATION   DIVISION.
       PROGRAM-ID.      error.
       DATA             DIVISION.
       WORKING-STORAGE  SECTION.
       01 MYVAR         PIC X(5) EXTERNAL AS "COB-VAR".
       01 WRK-VAR       PIC X(5) EXTERNAL.
       01 EXT-VAR       PIC X(5) EXTERNAL.
       PROCEDURE        DIVISION.
           MOVE "Extrn" TO WRK-VAR.
           MOVE "Hello" TO MYVAR.
           CALL "callee"
           END-CALL.
           IF MYVAR NOT = "World"
              DISPLAY MYVAR
              END-DISPLAY
           END-IF.
           STOP RUN.
