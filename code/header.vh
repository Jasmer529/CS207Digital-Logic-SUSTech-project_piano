`define high_do 191132
`define low_do  764526
`define high_re 170068
`define low_re  680272
`define high_mi 151515
`define low_mi  606060
`define high_fa 142857
`define low_fa  571428
`define high_la 113637
`define low_la  454546
`define high_si 101215
`define low_si  404858
`define high_so 127551
`define low_so  510204
`define do 381680
`define re 340136
`define me 303030
`define fa 285714
`define so 255102
`define la 227273
`define si 202429
`define CLK  60000000                      
`define beat 40 * 500000
`define gap 10 * 500000
`define LED0 8'b0000_0001                       // LED for C
`define LED1 8'b0000_0010                       // LED for D
`define LED2 8'b0000_0100                       // LED for E
`define LED3 8'b0000_1000                       // LED for F
`define LED4 8'b0001_0000                       // LED for G
`define LED5 8'b0010_0000                       // LED for A
`define LED6 8'b0100_0000                       // LED for B
`define LEDM 8'b0000_0000                       // LED off
`define note1 7'b0000001
`define note2 7'b0000010
`define note3 7'b0000100
`define note4 7'b0001000
`define note5 7'b0010000
`define note6 7'b0100000
`define note7 7'b1000000

`define index_period beat + gap


`define littleStar 240'b000000100001001010010101001010010110101100000011000110101101011000110001000010000000001001010100101001011010110110001100000000100101010010100101101011011000110000000010000100101001010100101001011010110000001100011010110101100011000100001000

`define happySong 325'b0000001000010000100101010010010100001000010010101001011011000110001011010100101000000010010100001001010100101101010010010100001010010110101001001010000101001001010010000001000010000100101010010010100001000010010101001011011000110001011010100101000000010010100101010010100100101000010000100101010010110110001100010110101001010

`define Ringing 295'b0000001000010010101001100011000101001010010100101101011010110101101011000000101001001010000110001010000000101001010010100000001010010100101000000011000000001001010000100101001010100101001010010100101001011010110101101011010110000001010010010100001100010100000001010010100101000000010100101001010

`define brush 280'b0000001000010010101001011010010000001000010100110001010011000101001100000000110001001010100101101001000000110001000010100101101011010010100100000010000100101010010110100100000010000101001100010100110001010011000000001100010010101001011010010000001000010100110001010011000101001100
 
`define Star_length 48
`define happy_length 65
`define Ring_length 59
`define brush_length 56
 
`define modestar 2'b10100
`define modehappy 2'b10010
`define modering 2'b10001
`define led0 7'b0000000
`define led1 7'b0000001
`define led2 7'b0000010
`define led3 7'b0000100
`define led4 7'b0001000
`define led5 7'b0010000
`define led6 7'b0100000
`define led7 7'b1000000

`define sed0 8'b1111_1100
`define sed1 8'b0110_0000
`define sed2 8'b1101_1010
`define sed3 8'b1111_0010
`define sed4 8'b0110_0110
`define sed5 8'b1011_0110
`define sed6 8'b1011_1110
`define sed7 8'b1110_0000
`define sed8 8'b1111_1110
`define sed9 8'b1111_0110

`define sedR 8'b1110_1110 //R
`define sedS 8'b1011_0110//S
`define sedi 8'b0010_0000// i
`define sedo 8'b0011_1010//o 
`define sedt 8'b0001_1110//t
`define sedn 8'b0010_1010 //n
`define seda 8'b0011_1011 //a
`define sedg 8'b1111_0110//g
`define sedr 8'b0000_1010//r
`define sedd 8'b0111_1010//d
`define sedu 8'b0011_1000 //u
`define sedb 8'b0011_1110 //b


`define SEG0 8'b1111_1100                       // Display '0'
`define SEG1 8'b0110_0000                       // Display '1'
`define SEG2 8'b1101_1010                       // Display '2'
`define SEG3 8'b1111_0010                       // Display '3'
`define SEG9 8'b1111_0110                       // Display '9'
`define Go  10'b0100110010 
`define no  10'b1011010010 
`define ba  10'b0101101010 




`define SEGA 8'b1110_1110                       // Display 'A'
`define SEGB 8'b0011_1110                       // Display 'B'
`define SEGC 8'b1001_1100                       // Display 'C'
`define SEGD 8'b0111_1010                       // Display 'D'
`define SEGo 8'b0011_1010                       // Display 'o'
`define SEGR 8'b0000_1010                       // Display 'r'
`define SEGt 8'b0001_1110                       // Display 't'
`define SEGu 8'b0011_1000                       // Display 'u'
`define SEGn 8'b0010_1010                       // Display 'n'
`define SEGN 8'b1110_1100                       // Display 'N'
`define SEGU 8'b0111_1100                       // Display 'U
`define l1 7'b1000000
`define l2 7'b0100000
`define l3 7'b0010000
`define l4 7'b0001000
`define l5 7'b0000100
`define l6 7'b0000010
`define l7 7'b0000001

`define IN0 5'b00000                            // Encode of '0'
`define IN1 5'b00001                            // Encode of '1'
`define IN2 5'b00010                            // Encode of '2'
`define IN3 5'b00011                            // Encode of '3'
`define IN9 5'b01001                            // Encode of '9'
`define INA 5'b01010                            // Encode of 'A'
`define INB 5'b01011                            // Encode of 'B'
`define INC 5'b01100                            // Encode of 'C'
`define IND 5'b01101                            // Encode of 'D'
`define INo 5'b10010                            // Encode of 'o'
`define INR 5'b10011                            // Encode of 'r'
`define INt 5'b10100                            // Encode of 't'
`define INu 5'b10101                            // Encode of 'u'
`define INn 5'b10110                            // Encode of 'n'
`define INN 5'b10111                            // Encode of 'N'
`define INU 5'b11000                            // Encode of 'U'

