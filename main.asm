;----Labels----
INIDISP  = $2100
OBJSEL   = $2101
OAMADDL  = $2102
OAMADDH  = $2103
OAMDATA  = $2104
VMAINC   = $2114
VMADDL   = $2116
VMADDH   = $2117
VMDATAL  = $2118
VMDATAH  = $2119
CGADD    = $2121
CGDATA   = $2122
TM       = $212c
NMITIMEN = $4200
RDNMI    = $4210

;----Assembler Directives----
.p816
.i16
.a8

;----Code----
.segment "CODE"
.proc ResetHandler
sei
clc
xce

lda #$81
sta NMITIMEN

jmp GameLoop
.endproc

.proc GameLoop
wai
jmp GameLoop
.endproc

.proc NMIHandler
lda RDNMI
rti
.endproc

;----Interupt and Reset----
.segment "VECTOR"
.addr $0000, $0000, $0000
.addr NMIHandler, $0000, $0000

.word $0000, $0000

.addr $0000, $0000, $0000
.addr $0000, ResetHandler, $0000