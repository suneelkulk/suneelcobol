        IDENTIFICATION DIVISION.
        PROGRAM-ID. intro1.
        ENVIRONMENT DIVISION.
        CONFIGURATION SECTION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
            SELECT NINJAI-FILE  ASSIGN TO "NINJAIN.CSV"
                                ORGANIZATION IS LINE SEQUENTIAL
                                ACCESS MODE IS SEQUENTIAL
                                FILE STATUS IS FILE-STATUS.
                                
            SELECT NINJAO-FILE  ASSIGN TO "NINJAOUT.CSV"
                                ORGANIZATION IS LINE SEQUENTIAL
                                ACCESS MODE IS SEQUENTIAL
                                FILE STATUS IS FILE-STATUS. 
        DATA DIVISION.
        FILE SECTION.
        FD   NINJAI-FILE  RECORD CONTAINS 80 CHARACTERS
                          LABEL RECORDS ARE STANDARD
                          
        01 NINJAI-REC           PIC X(90).
        
        FD   NINJAO-FILE  RECORD CONTAINS 80 CHARACTERS
                          LABEL RECORDS ARE STANDARD
                          
        01 NINJAO-REC           PIC X(90).  
        
        WORKING-STORAGE SECTION.
        01 FILE-STATUS          PIC X(02).
        01 EOF                  PIC X(01) VALUE "N".
        01 WS-HEADER.
           05 W-H1              PIC X(05) VALUE "Stock".
           05 FILLER            PIC X(05) VALUE SPACES.
           05 W-H2              PIC X(09) VALUE "NoOFShare".
           05 FILLER            PIC X(05) VALUE SPACES.
           05 W-H3              PIC X(05) VALUE "Bought".
           05 FILLER            PIC X(08) VALUE SPACES.
           05 W-H4              PIC X(04) VALUE "High".
           05 FILLER            PIC X(08) VALUE SPACES.
           05 W-H5              PIC X(03) VALUE "Low".
           05 FILLER            PIC X(08) VALUE SPACES.
           05 W-H6              PIC X(12) VALUE "CurrentPrice".
           05 FILLER            PIC X(08) VALUE SPACES.
           05 W-H7              PIC X(04) VALUE "Gain".
           05 FILLER            PIC X(06) VALUE SPACES.
           
        PROCEDURE DIVISION.
            DISPLAY "THIS IS THE NINJA PROGRAM".
            OPEN INPUT NINJAI-FILE.
            IF FILE-STATUS = "00"
               DISPLAY " SUCCESSFUL OPEN OF INPUT FILE"
               OPEN OUTPUT NINJAO-FILE
               IF FILE-STATUS = "00"
                  DISPLAY "OPEN OUTPUT SUCCESSFUL"
                  WRITE NINJAO-REC FROM WS-HEADER
                  MOVE "N"       TO EOF
                  PERFORM FILE-WRITE-PARA UNTIL EOF = "Y"
               ELSE
                  DISPLAY "OPEN OUTPUT FILE FAILED WITH FILE STATUS =" FILE-STATUS
               END-IF
            ELSE
               DISPLAY "OPEN INPUT FILE FAILED WITH FILE STATUS =" FILE-STATUS
            END-IF.
            
            STOP RUN. 
            
        FILE-WRITE-PARA.
            READ NINJAI-FILE AT END
                 MOVE "Y" TO EOF
            END-READ.
            IF EOF NOT= "Y"
               WRITE NINJAO-REC FROM NINJAI-REC
               IF FILE-STATUS NOT= "00"
                  DISPLAY "WRITE FAIL IN WRITE-PARA"
                  MOVE "Y" TO EOF
               END-IF
             END-IF.
             EXIT.
