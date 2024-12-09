;----Labels----
INIDISP  = $2100	;inital setting for screen
OBJSEL   = $2101	;object size & object data area
OAMADDL  = $2102	;address for acessing OAM
OAMADDH  = $2103
OAMDATA  = $2104	;data for OAM write
VMAINC   = $2114	;VRAM address increment value designation
VMADDL   = $2116	;address for VRAM read and write
VMADDH   = $2117
VMDATAL  = $2118	;data for VRAM write
VMDATAH  = $2119	;data for VRAM write
CGADD    = $2121	;address for CGRAM read and write
CGDATA   = $2122	;data for CGRAM write
TM       = $212c	;main screen designation
NMITIMEN = $4200	;enable flag for v-blank
RDNMI    = $4210	;read the NMI flag status

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