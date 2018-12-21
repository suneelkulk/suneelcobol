       IDENTIFICATION DIVISION.
       PROGRAM-ID. acctcreat.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ACCTIN-FILE  ASSIGN TO "CUST-FILE.CSV"
                               ORGANIZATION IS LINE SEQUENTIAL
                               ACCESS MODE IS SEQUENTIAL
                               FILE STATUS IS FILE-STATUS.
                                
           SELECT ACCTOUT-FILE  ASSIGN TO "ACCOUNT.TXT"
                               ORGANIZATION IS LINE SEQUENTIAL
                               ACCESS MODE IS SEQUENTIAL
                               FILE STATUS IS FILE-STATUS. 
       DATA DIVISION.
       FILE SECTION.
       FD   ACCTIN-FILE  RECORD CONTAINS 100 CHARACTERS
                         LABEL RECORDS ARE STANDARD.
                          
       01 CUST-REC           PIC X(100).
        
       FD   ACCTOUT-FILE  RECORD CONTAINS 100 CHARACTERS
                         LABEL RECORDS ARE STANDARD.
                          
       01 ACCOUNT-REC           PIC X(100).  
        
       WORKING-STORAGE SECTION.
       01 FILE-STATUS          PIC X(02).
       01 EOF                  PIC X(01) VALUE "N".
       01 WH-HEADER.
          05 WH-CUST           PIC X(09) VALUE "CUST-NAME".
          05 FILLER            PIC X(15) VALUE SPACES.
          05 WH-PAN            PIC X(10) VALUE "PAN NUMBER".
          05 FILLER            PIC X(05) VALUE SPACES.
          05 WH-AADHAR         PIC X(06) VALUE "AADHAR".
          05 FILLER            PIC X(14) VALUE SPACES.
          05 WH-CITY           PIC X(04) VALUE "CITY".
          05 FILLER            PIC X(16) VALUE SPACES.
          05 WH-ADDR           PIC X(07) VALUE "ADDRESS".
          05 FILLER            PIC X(04) VALUE SPACES.
          05 WH-ACCTNUM        PIC X(10) VALUE "ACCOUNT.NO".
          
       01 WS-DETAIL.
          05 WS-CUST             PIC X(20) VALUE SPACES.
          05 WS-PAN              PIC X(10) VALUE SPACES.
          05 WS-AADHAR           PIC X(12) VALUE SPACES.
          05 WS-CITY             PIC X(20) VALUE SPACES.
          05 WS-ADDR             PIC X(28) VALUE SPACES.
          05 WS-ACCNUM           PIC X(10) VALUE SPACES.
          
       01 WK-ACCT-NUM.
          05 WK-CNTRY            PIC X(02) VALUE "91".
          05 WK-CITY             PIC X(03).
          05 WK-BRNCH            PIC X(03).
          05 WK-RANDOM           PIC X(02).
          
       PROCEDURE DIVISION.
           INITIALIZE    WS-DETAIL
                         CUST-REC
                         ACCOUNT-REC.
           DISPLAY "Thanks to COE team".           
           OPEN INPUT ACCTIN-FILE.
           IF FILE-STATUS = "00"
               DISPLAY " SUCCESSFUL OPEN OF INPUT FILE"
               OPEN OUTPUT ACCTOUT-FILE
               IF FILE-STATUS = "00"
                  DISPLAY "OPEN OUTPUT SUCCESSFUL"
                  WRITE ACCOUNT-REC FROM WH-HEADER
                  MOVE "N"       TO EOF
                  PERFORM FILE-WRITE-PARA UNTIL EOF = "Y"
               ELSE
                  DISPLAY "OPEN OUTPUT FAILED FILE STATUS =" FILE-STATUS
               END-IF
           ELSE
               DISPLAY "OPEN INPUT FAILED FILE STATUS =" FILE-STATUS
           END-IF.

           CLOSE ACCTIN-FILE
                 ACCTOUT-FILE.
            
           STOP RUN. 
            
       FILE-WRITE-PARA.
            DISPLAY ACCOUNT-REC
            READ ACCTIN-FILE AT END
                 MOVE "Y" TO EOF
            END-READ.
            IF EOF NOT= "Y"
               UNSTRING CUST-REC DELIMITED BY "," 
               INTO     WS-CUST
                        WS-PAN
                        WS-AADHAR
                        WS-CITY
                        WS-ADDR
               END-UNSTRING
               EVALUATE WS-CITY
                 WHEN "BANGALORE"
                      MOVE "080"    TO WK-CITY
                      MOVE "111"    TO WK-BRNCH
                      MOVE "01"     TO WK-RANDOM
                      
                 WHEN "HYDERABAD"
                      MOVE "040"    TO WK-CITY
                      MOVE "222"    TO WK-BRNCH
                      MOVE "02"     TO WK-RANDOM
                      
                 WHEN "KOLKATA"
                      MOVE "033"    TO WK-CITY
                      MOVE "333"    TO WK-BRNCH
                      MOVE "01"     TO WK-RANDOM
                      
                 WHEN "MYSORE"
                      MOVE "821"    TO WK-CITY
                      MOVE "444"    TO WK-BRNCH
                      MOVE "99"     TO WK-RANDOM
                      
                 WHEN "NEW DELHI"
                      MOVE "011"    TO WK-CITY
                      MOVE "555"    TO WK-BRNCH
                      MOVE "08"     TO WK-RANDOM
                      
                 WHEN "CHENNAI"
                      MOVE "044"    TO WK-CITY
                      MOVE "666"    TO WK-BRNCH
                      MOVE "08"     TO WK-RANDOM
                      
                 WHEN OTHER
                      MOVE "9100000000" TO WK-ACCT-NUM       
               END-EVALUATE
               
               MOVE WK-ACCT-NUM      TO WS-ACCNUM
               WRITE ACCOUNT-REC FROM WS-DETAIL
               IF FILE-STATUS NOT= "00"
                  DISPLAY "WRITE FAIL IN WRITE-PARA"
                  MOVE "Y" TO EOF
               END-IF
             END-IF.
             EXIT.
