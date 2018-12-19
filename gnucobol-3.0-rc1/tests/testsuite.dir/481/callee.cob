
       IDENTIFICATION   DIVISION.
       PROGRAM-ID.      callee.
       DATA             DIVISION.
       WORKING-STORAGE  SECTION.
       01 PRG-VAR       PIC X(8) EXTERNAL AS "WRK-VAR".
       01 COB-VAR       PIC X(8) EXTERNAL.
       01 EXT-VAR       PIC X(8) EXTERNAL.
       PROCEDURE        DIVISION.
           IF PRG-VAR NOT = "Extrn"
              DISPLAY PRG-VAR
              END-DISPLAY
           END-IF.
           IF EXT-VAR NOT = "Hello"
              DISPLAY EXT-VAR
              END-DISPLAY
           END-IF.
           MOVE "World" TO EXT-VAR.
           EXIT PROGRAM.
