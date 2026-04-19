	idnt	"scsiwifi.c"
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_muldiv
	cnop	0,4
_muldiv
	movem.l	l19,-(a7)
	move.w	(10+l21,a7),d1
	move.w	(6+l21,a7),d0
	move.l	(16+l21,a7),a1
	move.l	(12+l21,a7),a0
	move.w	#0,(a0)
	cmp.w	d0,d1
	bhi	l18
l17
	addq.w	#1,(a0)
	sub.w	d1,d0
	cmp.w	d0,d1
	bls	l17
l18
	move.w	d0,(a1)
l19	reg
l21	equ	0
	rts
; stacksize=0
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	__ustoa
	cnop	0,4
__ustoa
	sub.w	#12,a7
	movem.l	l40,-(a7)
	moveq	#10,d4
	moveq	#48,d3
	move.l	(20+l42,a7),a3
	move.w	(18+l42,a7),a1
	lea	(4+l42,a7),a4
	move.l	a4,a2
	lea	(0+l42,a7),a0
	move.l	a0,d2
	lea	(2+l42,a7),a5
l36
	move.l	d2,-(a7)
	move.l	a5,-(a7)
	move.l	d4,-(a7)
	moveq	#0,d0
	move.w	a1,d0
	move.l	d0,a0
	move.l	a0,-(a7)
	jsr	_muldiv
	moveq	#0,d0
	move.w	(16+l42,a7),d0
	add.l	d3,d0
	move.b	d0,(a2)+
	move.w	(18+l42,a7),a1
	add.w	#16,a7
	tst.w	(2+l42,a7)
	bne	l36
	subq.l	#1,a2
	cmp.l	a2,a4
	bhi	l39
l37
	move.b	(a2),(a3)+
	subq.l	#1,a2
	cmp.l	a2,a4
	bls	l37
l39
	move.b	#0,(a3)
l40	reg	a2/a3/a4/a5/d2/d3/d4
	movem.l	(a7)+,a2/a3/a4/a5/d2/d3/d4
l42	equ	28
	add.w	#12,a7
	rts
; stacksize=60
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	__stoa
	cnop	0,4
__stoa
	sub.w	#16,a7
	movem.l	l69,-(a7)
	moveq	#48,d5
	moveq	#10,d4
	move.l	(24+l71,a7),a3
	move.w	(22+l71,a7),a0
	lea	(4+l71,a7),a4
	move.l	a4,a2
	move.w	a0,d1
	blt	l45
	moveq	#0,d0
	bra	l46
l45
	moveq	#1,d0
l46
	move.l	d0,d3
	tst.l	d3
	beq	l49
	move.w	a0,d0
	ext.l	d0
	neg.l	d0
	move.w	d0,a1
	bra	l59
l49
	move.w	a0,a1
l59
	lea	(0+l71,a7),a6
	move.l	a6,d2
	lea	(2+l71,a7),a5
l65
	move.l	d2,-(a7)
	move.l	a5,-(a7)
	move.l	d4,-(a7)
	moveq	#0,d0
	move.w	a1,d0
	move.l	d0,a0
	move.l	a0,-(a7)
	jsr	_muldiv
	moveq	#0,d0
	move.w	(16+l71,a7),d0
	add.l	d5,d0
	move.b	d0,(a2)+
	move.w	(18+l71,a7),a1
	add.w	#16,a7
	tst.w	(2+l71,a7)
	bne	l65
	subq.l	#1,a2
	tst.l	d3
	beq	l55
	move.b	#45,(a3)+
l55
	cmp.l	a2,a4
	bhi	l68
l66
	move.b	(a2),(a3)+
	subq.l	#1,a2
	cmp.l	a2,a4
	bls	l66
l68
	move.b	#0,(a3)
l69	reg	a2/a3/a4/a5/a6/d2/d3/d4/d5
	movem.l	(a7)+,a2/a3/a4/a5/a6/d2/d3/d4/d5
l71	equ	36
	add.w	#16,a7
	rts
; stacksize=72
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	__atous
	cnop	0,4
__atous
	movem.l	l84,-(a7)
	moveq	#48,d4
	moveq	#57,d3
	moveq	#48,d2
	move.l	(4+l86,a7),a0
	moveq	#0,d1
	tst.b	(a0)
	beq	l83
l82
	move.b	(a0),d0
	cmp.b	d0,d4
	bgt	l78
	cmp.b	d0,d3
	blt	l78
	mulu.w	#10,d1
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	sub.l	d2,d0
	add.w	d0,d1
l78
	addq.l	#1,a0
	tst.b	(a0)
	bne	l82
l83
	move.w	d1,d0
l84	reg	d2/d3/d4
	movem.l	(a7)+,d2/d3/d4
l86	equ	12
	rts
; stacksize=12
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	__atos
	cnop	0,4
__atos
	subq.w	#4,a7
	movem.l	l105,-(a7)
	moveq	#57,d6
	moveq	#48,d5
	moveq	#48,d4
	moveq	#45,d3
	move.l	(8+l107,a7),a0
	moveq	#0,d1
	moveq	#0,d2
	tst.b	(a0)
	beq	l104
l103
	move.b	(a0),d0
	move.b	d0,(0+l107,a7)
	cmp.b	d0,d5
	bgt	l93
	move.b	d0,(0+l107,a7)
	cmp.b	d0,d6
	blt	l93
	moveq	#10,d0
	move.l	d2,-(a7)
	move.l	d1,d7
	move.l	d0,d2
	swap	d7
	swap	d2
	mulu.w	d0,d7
	mulu.w	d1,d2
	mulu.w	d0,d1
	add.w	d2,d7
	swap	d7
	clr.w	d7
	add.l	d7,d1
	move.l	(a7)+,d2
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	sub.l	d4,d0
	add.l	d0,d1
	bra	l97
l93
	cmp.b	d0,d3
	bne	l97
	moveq	#1,d2
l97
	addq.l	#1,a0
	tst.b	(a0)
	bne	l103
l104
	tst.l	d2
	beq	l99
	move.l	d1,d0
	neg.l	d0
	bra	l87
l99
	move.w	d1,d0
l87
l105	reg	d2/d3/d4/d5/d6/d7
	movem.l	(a7)+,d2/d3/d4/d5/d6/d7
l107	equ	24
	addq.w	#4,a7
	rts
; stacksize=32
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_tokeniseSetting
	cnop	0,4
_tokeniseSetting
	movem.l	l120,-(a7)
	moveq	#61,d1
	moveq	#1,d0
	move.l	(8+l122,a7),a2
	move.l	(4+l122,a7),a0
	move.l	#0,(a2)
	tst.b	(a0)
	beq	l119
	lea	(1,a0),a1
l118
	cmp.b	(a0),d1
	bne	l114
	move.b	#0,(a0)
	move.l	a1,(a2)
	bra	l108
l114
	addq.l	#1,a0
	addq.l	#1,a1
	tst.b	(a0)
	bne	l118
l119
	moveq	#0,d0
l108
l120	reg	a2
	movem.l	(a7)+,a2
l122	equ	4
	rts
; stacksize=4
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_strcpy_s
	cnop	0,4
_strcpy_s
	movem.l	l127,-(a7)
	move.l	(4+l129,a7),a2
	move.l	(8+l129,a7),a0
	inline
	move.l	a0,d0
.l1
	tst.b	(a0)+
	bne	.l1
	sub.l	a0,d0
	not.l	d0
	einline
	move.w	d0,d1
	cmp.w	(14+l129,a7),d1
	bcs	l126
	move.w	(14+l129,a7),d1
l126
	moveq	#0,d3
	move.w	d1,d3
	move.l	d3,d2
	subq.l	#1,d2
	move.l	a2,a0
	move.l	(8+l129,a7),a1
	inline
	move.l	a0,d0
	cmp.l	#16,d2
	blo	.l5
	moveq	#1,d1
	and.b	d0,d1
	beq	.l1
	move.b	(a1)+,(a0)+
	subq.l	#1,d2
.l1
	move.l	a1,d1
	and.b	#1,d1
	beq	.l3
	cmp.l	#$10000,d2
	blo	.l5
.l2
	move.b	(a1)+,(a0)+
	subq.l	#1,d2
	bne	.l2
	bra	.l7
.l3
	moveq	#3,d1
	and.l	d2,d1
	sub.l	d1,d2
.l4
	move.l	(a1)+,(a0)+
	subq.l	#4,d2
	bne	.l4
	move.w	d1,d2
.l5
	subq.w	#1,d2
	blo	.l7
.l6
	move.b	(a1)+,(a0)+
	dbf	d2,.l6
.l7
	einline
	move.b	#0,(-1,a2,d3.l)
l127	reg	a2/d2/d3
	movem.l	(a7)+,a2/d2/d3
l129	equ	12
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_removeNL
	cnop	0,4
_removeNL
	movem.l	l140,-(a7)
	moveq	#10,d0
	move.l	(4+l142,a7),a0
	tst.b	(a0)
	beq	l139
l138
	cmp.b	(a0),d0
	bne	l136
	move.b	#0,(a0)
	bra	l139
l136
	addq.l	#1,a0
	tst.b	(a0)
	bne	l138
l139
l140	reg
l142	equ	0
	rts
; stacksize=0
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_defaultSettings
	cnop	0,4
_SCSIWifi_defaultSettings
	movem.l	l148,-(a7)
	moveq	#99,d1
	moveq	#101,d0
	move.l	(4+l150,a7),a1
	move.b	#115,(a1)
	lea	(1,a1),a0
	move.b	d1,(a0)+
	move.b	#115,(a0)+
	move.b	#105,(a0)+
	move.b	#46,(a0)+
	move.b	#100,(a0)+
	move.b	d0,(a0)+
	move.b	#118,(a0)+
	move.b	#105,(a0)+
	move.b	d1,(a0)+
	move.b	d0,(a0)+
	move.b	#0,(a0)
	move.w	#-1,(108,a1)
	move.w	#0,(110,a1)
	move.w	#1,(112,a1)
	move.w	#0,(114,a1)
	move.b	#0,(116,a1)
	move.b	#0,(180,a1)
	move.b	#1,(248,a1)
	move.l	#8192,(244,a1)
l148	reg
l150	equ	0
	rts
; stacksize=0
	cnop	0,4
l145
	dc.b	115
	dc.b	99
	dc.b	115
	dc.b	105
	dc.b	46
	dc.b	100
	dc.b	101
	dc.b	118
	dc.b	105
	dc.b	99
	dc.b	101
	dc.b	0
	cnop	0,4
l146
	dc.b	0
	cnop	0,4
l147
	dc.b	0
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_loadSettings
	cnop	0,4
_SCSIWifi_loadSettings
	sub.w	#260,a7
	movem.l	l212,-(a7)
	move.l	(272+l214,a7),a3
	lea	(52+l214,a7),a6
	move.l	a6,(24+l214,a7)
	move.l	(268+l214,a7),(60+l214,a7)
	move.l	(264+l214,a7),(56+l214,a7)
	move.l	a3,-(a7)
	jsr	_SCSIWifi_defaultSettings
	move.l	(28+l214,a7),a6
	addq.l	#8,a6
	move.l	a6,(4+l214,a7)
	move.l	a0,-(a7)
	move.l	(8+l214,a7),a0
	move.l	(a0),a6
	move.l	(a7)+,a0
	move.l	#l155,d1
	move.l	#1005,d2
	jsr	-30(a6)
	move.l	d0,(40+l214,a7)
	addq.w	#4,a7
	beq	l154
	move.l	a3,a6
	add.l	#248,a6
	move.l	a6,(4+l214,a7)
	move.l	(4+l214,a7),a6
	move.b	#0,(a6)
	moveq	#0,d5
	lea	(130+l214,a7),a5
	move.l	a0,-(a7)
	move.l	(4+l214,a7),a0
	move.l	(a0),a6
	move.l	(a7)+,a0
	move.l	(36+l214,a7),d1
	move.l	a5,d2
	move.l	#128,d3
	jsr	-336(a6)
	move.l	a3,(272+l214,a7)
	tst.l	d0
	beq	l210
	move.l	a0,-(a7)
	lea	(48+l214,a7),a0
	move.l	a0,(52+l214,a7)
	move.l	(a7),a0
	move.l	(28+l214,a7),a0
	addq.l	#4,a0
	move.l	a0,(4+l214,a7)
	move.l	(a7),a0
	move.l	a3,a0
	add.l	#108,a0
	move.l	a0,(12+l214,a7)
	move.l	(a7)+,a0
	lea	(110,a3),a2
	lea	(112,a3),a4
	move.l	a0,-(a7)
	move.l	a3,a0
	add.l	#114,a0
	move.l	a0,(16+l214,a7)
	move.l	(a7),a0
	move.l	a3,a0
	add.l	#116,a0
	move.l	a0,(32+l214,a7)
	move.l	(a7),a0
	move.l	a3,a0
	add.l	#180,a0
	move.l	a0,(36+l214,a7)
	move.l	(a7),a0
	move.l	a3,a0
	add.l	#244,a0
	move.l	a0,(20+l214,a7)
	move.l	(a7),a0
	move.l	(28+l214,a7),a0
	addq.l	#8,a0
	move.l	a0,(24+l214,a7)
	move.l	(a7)+,a0
	move.l	a3,(272+l214,a7)
	move.w	#2,a3
l206
	move.l	(48+l214,a7),-(a7)
	move.l	a5,-(a7)
	jsr	_tokeniseSetting
	move.l	a5,(48+l214,a7)
	addq.w	#8,a7
	tst.l	d0
	beq	l211
	moveq	#0,d4
	move.l	a5,(40+l214,a7)
	move.w	#127,a5
l207
	addq.w	#1,d5
	moveq	#0,d0
	move.w	d4,d0
	lsl.l	#2,d0
	lea	l1,a0
	move.l	(0,a0,d0.l),a0
	move.l	(0+l214,a7),a1
	move.l	(a1),a6
	move.l	(40+l214,a7),a1
	jsr	-162(a6)
	tst.l	d0
	bne	l166
	tst.w	d4
	beq	l168
	cmp.w	#1,d4
	beq	l169
	cmp.w	d4,a3
	beq	l170
	cmp.w	#3,d4
	beq	l175
	cmp.w	#4,d4
	beq	l178
	cmp.w	#5,d4
	beq	l179
	cmp.w	#6,d4
	beq	l180
	cmp.w	#7,d4
	beq	l181
	cmp.w	#8,d4
	beq	l182
	bra	l186
l168
	move.l	#108,-(a7)
	move.l	(48+l214,a7),-(a7)
	move.l	(280+l214,a7),-(a7)
	jsr	_strcpy_s
	add.w	#12,a7
	bra	l211
l169
	move.l	(44+l214,a7),-(a7)
	jsr	__atos
	move.l	a0,-(a7)
	move.l	(16+l214,a7),a0
	move.w	d0,(a0)
	move.l	(a7)+,a0
	addq.w	#4,a7
	bra	l211
l170
	move.l	(44+l214,a7),-(a7)
	jsr	__atos
	move.w	d0,(a2)
	addq.w	#4,a7
	cmp.w	(a2),a5
	bge	l172
	move.w	a5,(a2)
l172
	cmp.w	#-128,(a2)
	bge	l211
	move.w	#-128,(a2)
	bra	l211
l175
	move.l	(44+l214,a7),-(a7)
	jsr	__atous
	move.w	d0,(a4)
	addq.w	#4,a7
	cmp.w	(a4),a3
	bcc	l211
	move.w	a3,(a4)
	bra	l211
l178
	move.l	(44+l214,a7),-(a7)
	jsr	__atous
	move.l	a0,-(a7)
	move.l	(20+l214,a7),a0
	move.w	d0,(a0)
	move.l	(a7)+,a0
	addq.w	#4,a7
	bra	l211
l179
	move.l	#64,-(a7)
	move.l	(48+l214,a7),-(a7)
	move.l	(36+l214,a7),-(a7)
	jsr	_strcpy_s
	add.w	#12,a7
	bra	l211
l180
	move.l	#64,-(a7)
	move.l	(48+l214,a7),-(a7)
	move.l	(40+l214,a7),-(a7)
	jsr	_strcpy_s
	add.w	#12,a7
	bra	l211
l181
	move.l	(44+l214,a7),-(a7)
	jsr	__atous
	move.l	a0,-(a7)
	move.l	(24+l214,a7),a0
	moveq	#0,d7
	move.w	d0,d7
	move.l	d7,(a0)
	move.l	(a7)+,a0
	addq.w	#4,a7
	bra	l211
l182
	move.l	(44+l214,a7),-(a7)
	jsr	__atos
	addq.w	#4,a7
	tst.w	d0
	bne	l183
	moveq	#0,d6
	bra	l184
l183
	moveq	#1,d6
l184
	move.l	a0,-(a7)
	move.l	(8+l214,a7),a0
	move.b	d6,(a0)
	move.l	(a7)+,a0
	bra	l211
l186
	subq.w	#1,d5
	bra	l211
l166
	addq.w	#1,d4
	cmp.w	#9,d4
	bcs	l207
l211
	move.l	(40+l214,a7),a5
	move.l	a0,-(a7)
	move.l	(24+l214,a7),a0
	move.l	(a0),a6
	move.l	(a7)+,a0
	move.l	(36+l214,a7),d1
	move.l	a5,d2
	move.l	#128,d3
	jsr	-336(a6)
	tst.l	d0
	bne	l206
l210
	move.l	(272+l214,a7),a3
	tst.w	d5
	bhi	l188
	move.l	a3,-(a7)
	jsr	_SCSIWifi_defaultSettings
	addq.w	#4,a7
l188
	move.l	(24+l214,a7),a0
	move.l	(8,a0),a6
	move.l	(36+l214,a7),d1
	jsr	-36(a6)
	tst.w	d5
	bhi	l189
	move.l	#0,(0+l214,a7)
	bra	l190
l189
	moveq	#1,d7
	move.l	d7,(0+l214,a7)
l190
	move.l	(0+l214,a7),d0
	bra	l151
l154
	move.b	(a3),d0
	ext.w	d0
	ext.l	d0
	move.l	(24+l214,a7),a6
	addq.l	#4,a6
	move.l	a6,(0+l214,a7)
	move.l	a0,-(a7)
	move.l	(4+l214,a7),a0
	move.l	(a0),a6
	move.l	(a7)+,a0
	jsr	-174(a6)
	cmp.b	#71,d0
	bne	l195
	move.b	(a3),d0
	ext.w	d0
	ext.l	d0
	move.l	a0,-(a7)
	move.l	(4+l214,a7),a0
	move.l	(a0),a6
	move.l	(a7)+,a0
	jsr	-174(a6)
	cmp.b	#86,d0
	bne	l195
	move.b	(a3),d0
	ext.w	d0
	ext.l	d0
	move.l	(24+l214,a7),a0
	move.l	(4,a0),a6
	jsr	-174(a6)
	cmp.b	#80,d0
	bne	l195
	move.w	#2,(112,a3)
l195
	moveq	#0,d0
l151
l212	reg	a2/a3/a4/a5/a6/d2/d3/d4/d5/d6/d7
	movem.l	(a7)+,a2/a3/a4/a5/a6/d2/d3/d4/d5/d6/d7
l214	equ	44
	add.w	#260,a7
	rts
	cnop	0,4
l155
	dc.b	69
	dc.b	78
	dc.b	86
	dc.b	58
	dc.b	115
	dc.b	99
	dc.b	115
	dc.b	105
	dc.b	100
	dc.b	97
	dc.b	121
	dc.b	110
	dc.b	97
	dc.b	46
	dc.b	112
	dc.b	114
	dc.b	101
	dc.b	102
	dc.b	115
	dc.b	0
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_saveSettings
	cnop	0,4
_SCSIWifi_saveSettings
	sub.w	#180,a7
	movem.l	l269,-(a7)
	move.l	(188+l271,a7),a4
	lea	(80+l271,a7),a3
	move.l	(184+l271,a7),(88+l271,a7)
	tst.l	(192+l271,a7)
	beq	l220
	move.l	#l222,d0
	bra	l221
l220
	move.l	#l223,d0
l221
	lea	(8,a3),a5
	move.l	(a5),a6
	move.l	d0,d1
	move.l	#1006,d2
	jsr	-30(a6)
	move.l	d0,d5
	beq	l218
	moveq	#1,d3
	moveq	#0,d4
	move.l	a3,a0
	addq.l	#8,a0
	move.l	a0,(0+l271,a7)
	move.l	a3,a0
	addq.l	#8,a0
	move.l	a0,(4+l271,a7)
	lea	(158+l271,a7),a2
	move.l	a4,a0
	add.l	#108,a0
	move.l	a0,(8+l271,a7)
	move.l	a3,a0
	addq.l	#8,a0
	move.l	a0,(12+l271,a7)
	move.l	a4,a0
	add.l	#110,a0
	move.l	a0,(16+l271,a7)
	move.l	a3,a0
	addq.l	#8,a0
	move.l	a0,(20+l271,a7)
	move.l	a4,a0
	add.l	#112,a0
	move.l	a0,(24+l271,a7)
	move.l	a3,a0
	addq.l	#8,a0
	move.l	a0,(28+l271,a7)
	move.l	a4,a0
	add.l	#114,a0
	move.l	a0,(32+l271,a7)
	move.l	a3,a0
	addq.l	#8,a0
	move.l	a0,(36+l271,a7)
	move.l	a4,a0
	add.l	#116,a0
	move.l	a0,(72+l271,a7)
	move.l	a3,a0
	addq.l	#8,a0
	move.l	a0,(40+l271,a7)
	move.l	a4,a0
	add.l	#180,a0
	move.l	a0,(76+l271,a7)
	move.l	a3,a0
	addq.l	#8,a0
	move.l	a0,(44+l271,a7)
	move.l	a4,a0
	add.l	#244,a0
	move.l	a0,(48+l271,a7)
	move.l	a3,a0
	addq.l	#8,a0
	move.l	a0,(52+l271,a7)
	move.l	a4,a0
	add.l	#248,a0
	move.l	a0,(56+l271,a7)
	move.l	a3,a0
	addq.l	#8,a0
	move.l	a0,(60+l271,a7)
	move.l	a3,d6
	addq.l	#8,d6
	move.l	a3,(68+l271,a7)
	move.l	a4,(188+l271,a7)
	move.l	d6,(64+l271,a7)
	move.l	(28+l271,a7),d6
	move.l	(64+l271,a7),a4
	move.l	(24+l271,a7),a3
l266
	moveq	#0,d0
	move.w	d4,d0
	lsl.l	#2,d0
	lea	l1,a0
	move.l	(0,a0,d0.l),d2
	move.l	(a5),a6
	move.l	d5,d1
	jsr	-342(a6)
	tst.l	d0
	bne	l229
	moveq	#0,d3
l229
	move.l	(0+l271,a7),a0
	move.l	(a0),a6
	move.l	d5,d1
	move.l	#l232,d2
	jsr	-342(a6)
	tst.l	d0
	bne	l231
	moveq	#0,d3
l231
	move.w	d4,d7
	cmp.w	#8,d7
	bhi	l260
	lsl.w	#2,d7
	move.l	l272(pc,d7.w),a0
	jmp	(a0)
	cnop	0,4
l272
	dc.l	l234
	dc.l	l237
	dc.l	l240
	dc.l	l243
	dc.l	l246
	dc.l	l249
	dc.l	l252
	dc.l	l255
	dc.l	l258
l234
	move.l	(4+l271,a7),a0
	move.l	(a0),a6
	move.l	d5,d1
	move.l	(188+l271,a7),d2
	jsr	-342(a6)
	tst.l	d0
	bne	l260
	moveq	#0,d3
	bra	l260
l237
	move.l	a2,-(a7)
	move.l	(12+l271,a7),a1
	move.w	(a1),d0
	ext.l	d0
	move.l	d0,a0
	move.l	a0,-(a7)
	jsr	__stoa
	move.l	(20+l271,a7),a0
	move.l	(a0),a6
	move.l	d5,d1
	move.l	a2,d2
	jsr	-342(a6)
	addq.w	#8,a7
	tst.l	d0
	bne	l260
	moveq	#0,d3
	bra	l260
l240
	move.l	a2,-(a7)
	move.l	(20+l271,a7),a1
	move.w	(a1),d0
	ext.l	d0
	move.l	d0,a0
	move.l	a0,-(a7)
	jsr	__stoa
	move.l	(28+l271,a7),a0
	move.l	(a0),a6
	move.l	d5,d1
	move.l	a2,d2
	jsr	-342(a6)
	addq.w	#8,a7
	tst.l	d0
	bne	l260
	moveq	#0,d3
	bra	l260
l243
	move.l	a2,-(a7)
	moveq	#0,d0
	move.w	(a3),d0
	move.l	d0,a0
	move.l	a0,-(a7)
	jsr	__ustoa
	move.l	d6,a0
	move.l	(a0),a6
	move.l	d5,d1
	move.l	a2,d2
	jsr	-342(a6)
	addq.w	#8,a7
	tst.l	d0
	bne	l260
	moveq	#0,d3
	bra	l260
l246
	move.l	a2,-(a7)
	move.l	(36+l271,a7),a1
	moveq	#0,d0
	move.w	(a1),d0
	move.l	d0,a0
	move.l	a0,-(a7)
	jsr	__ustoa
	move.l	(44+l271,a7),a0
	move.l	(a0),a6
	move.l	d5,d1
	move.l	a2,d2
	jsr	-342(a6)
	addq.w	#8,a7
	tst.l	d0
	bne	l260
	moveq	#0,d3
	bra	l260
l249
	move.l	(40+l271,a7),a0
	move.l	(a0),a6
	move.l	d5,d1
	move.l	(72+l271,a7),d2
	jsr	-342(a6)
	tst.l	d0
	bne	l260
	moveq	#0,d3
	bra	l260
l252
	move.l	(44+l271,a7),a0
	move.l	(a0),a6
	move.l	d5,d1
	move.l	(76+l271,a7),d2
	jsr	-342(a6)
	tst.l	d0
	bne	l260
	moveq	#0,d3
	bra	l260
l255
	move.l	a2,-(a7)
	move.l	(52+l271,a7),a1
	move.l	(a1),a0
	move.l	a0,-(a7)
	jsr	__ustoa
	move.l	(60+l271,a7),a0
	move.l	(a0),a6
	move.l	d5,d1
	move.l	a2,d2
	jsr	-342(a6)
	addq.w	#8,a7
	tst.l	d0
	bne	l260
	moveq	#0,d3
	bra	l260
l258
	move.l	a2,-(a7)
	move.l	(60+l271,a7),a0
	moveq	#0,d0
	move.b	(a0),d0
	move.l	d0,-(a7)
	jsr	__ustoa
	move.l	(68+l271,a7),a0
	move.l	(a0),a6
	move.l	d5,d1
	move.l	a2,d2
	jsr	-342(a6)
	addq.w	#8,a7
	tst.l	d0
	bne	l260
	moveq	#0,d3
l260
	move.l	a4,a5
	move.l	(a4),a6
	move.l	d5,d1
	move.l	#l263,d2
	jsr	-342(a6)
	tst.l	d0
	bne	l262
	moveq	#0,d3
l262
	addq.w	#1,d4
	cmp.w	#9,d4
	bcs	l266
	move.l	(68+l271,a7),a3
	move.l	(8,a3),a6
	move.l	d5,d1
	jsr	-36(a6)
	moveq	#0,d0
	move.w	d3,d0
	bra	l215
l218
	moveq	#0,d0
l215
l269	reg	a2/a3/a4/a5/a6/d2/d3/d4/d5/d6/d7
	movem.l	(a7)+,a2/a3/a4/a5/a6/d2/d3/d4/d5/d6/d7
l271	equ	44
	add.w	#180,a7
	rts
	cnop	0,4
l232
	dc.b	61
	dc.b	0
	cnop	0,4
l263
	dc.b	10
	dc.b	0
	cnop	0,4
l222
	dc.b	69
	dc.b	78
	dc.b	86
	dc.b	58
	dc.b	115
	dc.b	99
	dc.b	115
	dc.b	105
	dc.b	100
	dc.b	97
	dc.b	121
	dc.b	110
	dc.b	97
	dc.b	46
	dc.b	112
	dc.b	114
	dc.b	101
	dc.b	102
	dc.b	115
	dc.b	0
	cnop	0,4
l223
	dc.b	69
	dc.b	78
	dc.b	86
	dc.b	65
	dc.b	82
	dc.b	67
	dc.b	58
	dc.b	115
	dc.b	99
	dc.b	115
	dc.b	105
	dc.b	100
	dc.b	97
	dc.b	121
	dc.b	110
	dc.b	97
	dc.b	46
	dc.b	112
	dc.b	114
	dc.b	101
	dc.b	102
	dc.b	115
	dc.b	0
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	__CreateExtIO
	cnop	0,4
__CreateExtIO
	movem.l	l279,-(a7)
	move.l	(8+l281,a7),d2
	move.l	(4+l281,a7),a0
	move.l	#0,a1
	tst.l	d2
	beq	l278
	move.l	(a0),a6
	move.l	(12+l281,a7),d0
	move.l	#65537,d1
	jsr	-198(a6)
	move.l	d0,a1
	tst.l	d0
	beq	l278
	move.l	d2,(14,a1)
	move.w	(14+l281,a7),(18,a1)
	move.b	#7,(8,a1)
l278
	move.l	a1,d0
l279	reg	a6/d2
	movem.l	(a7)+,a6/d2
l281	equ	8
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	__DeleteExtIO
	cnop	0,4
__DeleteExtIO
	movem.l	l286,-(a7)
	move.l	(8+l288,a7),a2
	move.l	a2,d1
	beq	l285
	move.l	#4294967295,(a2)
	move.l	#4294967295,(20,a2)
	moveq	#0,d0
	move.w	(18,a2),d0
	move.l	(4+l288,a7),a0
	move.l	(a0),a6
	move.l	a2,a1
	jsr	-210(a6)
l285
l286	reg	a2/a6
	movem.l	(a7)+,a2/a6
l288	equ	8
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	__CreatePort
	cnop	0,4
__CreatePort
	movem.l	l298,-(a7)
	move.l	(8+l300,a7),d3
	move.l	(4+l300,a7),a3
	move.l	(a3),a6
	moveq	#-1,d0
	jsr	-330(a6)
	move.b	d0,d2
	ext.w	d2
	ext.l	d2
	moveq	#-1,d0
	cmp.l	d2,d0
	bne	l292
	moveq	#0,d0
	bra	l289
l292
	move.l	(a3),a6
	moveq	#34,d0
	move.l	#65537,d1
	jsr	-198(a6)
	move.l	d0,a2
	tst.l	d0
	bne	l294
	move.l	(a3),a6
	move.l	d2,d0
	jsr	-336(a6)
	moveq	#0,d0
	bra	l289
l294
	move.l	d3,(10,a2)
	move.b	(15+l300,a7),(9,a2)
	move.b	#4,(8,a2)
	move.b	#0,(14,a2)
	move.b	d2,(15,a2)
	move.l	(a3),a6
	move.l	#0,a1
	jsr	-294(a6)
	move.l	d0,(16,a2)
	tst.l	d3
	beq	l296
	move.l	(a3),a6
	move.l	a2,a1
	jsr	-354(a6)
	bra	l297
l296
	lea	(20,a2),a0
	move.l	a0,(28,a2)
	lea	(24,a2),a1
	move.l	#0,(a1)
	move.l	a1,(a0)
l297
	move.l	a2,d0
l289
l298	reg	a2/a3/a6/d2/d3
	movem.l	(a7)+,a2/a3/a6/d2/d3
l300	equ	20
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	__DeletePort
	cnop	0,4
__DeletePort
	movem.l	l305,-(a7)
	move.l	(4+l307,a7),a3
	move.l	(8+l307,a7),a2
	tst.l	(10,a2)
	beq	l304
	move.l	(a3),a6
	move.l	a2,a1
	jsr	-360(a6)
l304
	move.l	#4294967295,(16,a2)
	move.l	#4294967295,(20,a2)
	moveq	#0,d0
	move.b	(15,a2),d0
	move.l	(a3),a6
	jsr	-336(a6)
	move.l	(a3),a6
	move.l	a2,a1
	moveq	#34,d0
	jsr	-210(a6)
l305	reg	a2/a3/a6
	movem.l	(a7)+,a2/a3/a6
l307	equ	12
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	__SCSIWifi_close
	cnop	0,4
__SCSIWifi_close
	movem.l	l320,-(a7)
	move.l	(4+l322,a7),a3
	move.l	a3,d0
	beq	l308
	lea	(12,a3),a2
	tst.l	(a2)
	beq	l313
	move.l	(a2),a1
	move.l	(a3),a6
	jsr	-468(a6)
	tst.l	d0
	bne	l315
	move.l	(a2),a1
	move.l	(a3),a6
	jsr	-480(a6)
	move.l	(a2),a1
	move.l	(a3),a6
	jsr	-474(a6)
l315
	lea	(12,a3),a2
	move.l	(a2),a1
	move.l	(a3),a6
	jsr	-450(a6)
	move.l	(a2),-(a7)
	move.l	a3,-(a7)
	jsr	__DeleteExtIO
	addq.w	#8,a7
l313
	lea	(70,a3),a4
	tst.l	(a4)
	beq	l317
	move.l	(a4),a1
	move.l	(a3),a6
	jsr	-690(a6)
l317
	lea	(16,a3),a0
	tst.l	(a0)
	beq	l319
	move.l	(a0),-(a7)
	move.l	a3,-(a7)
	jsr	__DeletePort
	addq.w	#8,a7
l319
	move.l	(a3),a6
	move.l	a3,a1
	jsr	-690(a6)
l308
l320	reg	a2/a3/a4/a6
	movem.l	(a7)+,a2/a3/a4/a6
l322	equ	16
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_open
	cnop	0,4
_SCSIWifi_open
	sub.w	#100,a7
	movem.l	l351,-(a7)
	move.l	(104+l353,a7),d2
	move.l	(108+l353,a7),a5
	lea	(12+l353,a7),a3
	move.w	#0,(76,a3)
	move.l	d2,a0
	move.l	(a0),(a3)
	move.l	d2,d6
	addq.l	#4,d6
	move.l	d6,a6
	move.l	(a6),(4,a3)
	move.l	d2,d5
	addq.l	#8,d5
	move.l	d5,a6
	move.l	(a6),(8,a3)
	move.l	(a3),a6
	moveq	#78,d0
	move.l	#65537,d1
	jsr	-684(a6)
	move.l	d0,a3
	tst.l	d0
	bne	l326
	moveq	#3,d7
	move.l	d7,(a5)
	moveq	#0,d0
	bra	l323
l326
	move.l	d2,a0
	move.l	(a0),(a3)
	move.l	a3,a0
	addq.l	#4,a0
	move.l	a0,(0+l353,a7)
	move.l	d6,a0
	move.l	a1,-(a7)
	move.l	(4+l353,a7),a1
	move.l	(a0),(a1)
	move.l	(a7),a1
	move.l	d5,a1
	move.l	(a1),(8,a3)
	move.l	(a7)+,a1
	move.l	#0,-(a7)
	move.l	#0,-(a7)
	move.l	a3,-(a7)
	jsr	__CreatePort
	move.l	d0,(16+l353,a7)
	move.l	(16+l353,a7),(16,a3)
	add.w	#12,a7
	tst.l	(4+l353,a7)
	bne	l328
	moveq	#3,d7
	move.l	d7,(a5)
	moveq	#0,d0
	bra	l323
l328
	move.l	#48,-(a7)
	move.l	(8+l353,a7),-(a7)
	move.l	a3,-(a7)
	jsr	__CreateExtIO
	move.l	a3,d3
	add.l	#12,d3
	move.l	a0,-(a7)
	move.l	d3,a0
	move.l	d0,(a0)
	move.l	(a7)+,a0
	add.w	#12,a7
	tst.l	d0
	bne	l330
	moveq	#3,d7
	move.l	d7,(a5)
	move.l	a3,-(a7)
	jsr	__SCSIWifi_close
	moveq	#0,d0
	addq.w	#4,a7
	bra	l323
l330
	move.l	(a3),a6
	moveq	#32,d0
	move.l	#65537,d1
	jsr	-684(a6)
	lea	(70,a3),a4
	move.l	d0,(a4)
	move.l	d3,a0
	move.l	(a0),a1
	move.l	d2,a0
	move.w	(12,a0),d0
	ext.l	d0
	move.l	d2,a0
	move.l	(16,a0),a0
	move.l	(a3),a6
	moveq	#0,d1
	jsr	-444(a6)
	tst.b	d0
	beq	l332
	moveq	#2,d7
	move.l	d7,(a5)
	lea	(12,a3),a2
	move.l	(a2),-(a7)
	move.l	a3,-(a7)
	jsr	__DeleteExtIO
	move.l	#0,(a2)
	move.l	a3,-(a7)
	jsr	__SCSIWifi_close
	moveq	#0,d0
	add.w	#12,a7
	bra	l323
l332
	move.l	d2,a1
	move.w	(14,a1),(74,a3)
	lea	(12,a3),a0
	move.l	(a0),a1
	moveq	#30,d0
	move.l	d0,(36,a1)
	move.l	a3,a1
	add.l	#20,a1
	move.l	a1,(4+l353,a7)
	move.l	(a0),a1
	move.l	(4+l353,a7),(40,a1)
	move.l	(a0),a0
	move.w	#28,(28,a0)
	move.w	#6,(36,a3)
	move.l	(a4),(32,a3)
	lea	(50,a3),a1
	move.l	a1,(42,a3)
	move.w	#20,(46,a3)
	move.l	(a3),a6
	moveq	#80,d0
	moveq	#1,d1
	jsr	-684(a6)
	move.l	d0,a2
	move.l	a2,(8+l353,a7)
	move.l	a2,d0
	bne	l334
	moveq	#3,d7
	move.l	d7,(a5)
	move.l	a3,-(a7)
	jsr	__SCSIWifi_close
	moveq	#0,d0
	addq.w	#4,a7
	bra	l323
l334
	move.l	(a4),a1
	move.b	#18,(a1)
	move.l	(a4),a1
	move.b	#0,(1,a1)
	move.l	(a4),a1
	move.b	#0,(2,a1)
	move.l	(a4),a1
	move.b	#0,(3,a1)
	move.l	(a4),a1
	move.b	#64,(4,a1)
	move.l	(a4),a1
	move.b	#0,(5,a1)
	move.w	#0,(48,a3)
	move.l	a3,d4
	add.l	#28,d4
	move.l	d4,a1
	move.l	#0,(a1)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.l	(4+l353,a7),a1
	move.l	(8+l353,a7),(a1)
	moveq	#64,d7
	move.l	d7,(24,a3)
	move.b	#3,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	tst.b	(a2)
	beq	l336
	move.l	(8+l353,a7),a2
	moveq	#4,d7
	move.l	d7,(a5)
	move.l	(a3),a6
	move.l	a2,a1
	jsr	-690(a6)
	move.l	a3,-(a7)
	jsr	__SCSIWifi_close
	moveq	#0,d0
	addq.w	#4,a7
	bra	l323
l336
	move.l	(8+l353,a7),a2
	move.l	a0,-(a7)
	move.l	d4,a0
	moveq	#26,d7
	cmp.l	(a0),d7
	move.l	(a7)+,a0
	bcc	l347
	move.b	#0,(25,a2)
	lea	(90+l353,a7),a0
	move.l	a2,a1
	addq.l	#8,a1
	move.l	a1,(4+l353,a7)
	move.l	(4+l353,a7),a1
	lea	(a1),a6
	move.l	a0,-(a7)
	lea	(94+l353,a7),a0
	moveq.l	#1,d0
l354:
	move.b	(a6)+,(a0)+
	move.b	(a6)+,(a0)+
	move.b	(a6)+,(a0)+
	move.b	(a6)+,(a0)+
	dbra	d0,l354
	move.l	(a7)+,a0
	move.b	#0,(98+l353,a7)
	move.l	(0+l353,a7),a1
	move.l	(a1),a6
	lea	l341,a1
	jsr	-162(a6)
	tst.l	d0
	bne	l340
	lea	(16,a2),a0
	move.l	(4,a3),a6
	lea	l344,a1
	jsr	-162(a6)
	tst.l	d0
	bne	l347
	move.w	#1,(76,a3)
	move.l	(a3),a6
	move.l	a2,a1
	jsr	-690(a6)
	moveq	#1,d7
	move.l	d7,(a5)
	move.l	a3,d0
	bra	l323
l340
	move.b	#0,(13,a2)
	move.l	(4,a3),a6
	move.l	(4+l353,a7),a0
	lea	l349,a1
	jsr	-162(a6)
	tst.l	d0
	bne	l347
	lea	(16,a2),a0
	move.l	(4,a3),a6
	lea	l350,a1
	jsr	-162(a6)
	tst.l	d0
	bne	l347
	move.l	(a3),a6
	move.l	a2,a1
	jsr	-690(a6)
	move.l	#0,(a5)
	move.l	a3,d0
	bra	l323
l347
	moveq	#5,d7
	move.l	d7,(a5)
	move.l	(a3),a6
	move.l	a2,a1
	jsr	-690(a6)
	move.l	a3,-(a7)
	jsr	__SCSIWifi_close
	moveq	#0,d0
	addq.w	#4,a7
l323
l351	reg	a2/a3/a4/a5/a6/d2/d3/d4/d5/d6/d7
	movem.l	(a7)+,a2/a3/a4/a5/a6/d2/d3/d4/d5/d6/d7
l353	equ	44
	add.w	#100,a7
	rts
	cnop	0,4
l344
	dc.b	83
	dc.b	67
	dc.b	83
	dc.b	73
	dc.b	47
	dc.b	76
	dc.b	105
	dc.b	110
	dc.b	107
	dc.b	0
	cnop	0,4
l349
	dc.b	68
	dc.b	97
	dc.b	121
	dc.b	110
	dc.b	97
	dc.b	0
	cnop	0,4
l350
	dc.b	83
	dc.b	67
	dc.b	83
	dc.b	73
	dc.b	47
	dc.b	76
	dc.b	105
	dc.b	110
	dc.b	107
	dc.b	0
	cnop	0,4
l341
	dc.b	65
	dc.b	109
	dc.b	105
	dc.b	103
	dc.b	97
	dc.b	78
	dc.b	69
	dc.b	84
	dc.b	0
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_close
	cnop	0,4
_SCSIWifi_close
	movem.l	l359,-(a7)
	move.l	(4+l361,a7),d0
	beq	l355
	move.l	d0,-(a7)
	jsr	__SCSIWifi_close
	addq.w	#4,a7
l355
l359	reg
l361	equ	0
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_scan
	cnop	0,4
_SCSIWifi_scan
	movem.l	l371,-(a7)
	move.l	(8+l373,a7),a4
	move.l	(4+l373,a7),a3
	moveq	#3,d0
	move.l	d0,(a4)
	lea	(70,a3),a1
	move.l	(a1),a0
	move.b	#28,(a0)
	move.l	(a1),a0
	move.b	#1,(1,a0)
	move.l	(a1),a0
	move.b	#0,(2,a0)
	move.l	(a1),a0
	move.b	#0,(3,a0)
	move.l	(a1),a0
	move.b	#0,(4,a0)
	move.l	(a1),a0
	move.b	#0,(5,a0)
	move.w	#0,(48,a3)
	move.l	#0,(28,a3)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.l	a1,(20,a3)
	moveq	#4,d0
	move.l	d0,(24,a3)
	move.b	#3,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	tst.b	(a2)
	beq	l365
	moveq	#0,d0
	bra	l362
l365
	moveq	#1,d0
	cmp.l	(28,a3),d0
	bne	l367
	move.l	(70,a3),a0
	cmp.b	#-1,(6,a0)
	bne	l369
	move.l	#0,(a4)
	bra	l370
l369
	moveq	#3,d0
	move.l	d0,(a4)
l370
	moveq	#1,d0
	bra	l362
l367
	moveq	#0,d0
l362
l371	reg	a2/a3/a4/a6
	movem.l	(a7)+,a2/a3/a4/a6
l373	equ	16
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_scanComplete
	cnop	0,4
_SCSIWifi_scanComplete
	movem.l	l384,-(a7)
	move.l	(8+l386,a7),a4
	move.l	(4+l386,a7),a3
	moveq	#3,d1
	move.l	d1,(a4)
	lea	(70,a3),a1
	move.l	(a1),a0
	move.b	#28,(a0)
	move.l	(a1),a0
	move.b	#2,(1,a0)
	move.l	(a1),a0
	move.b	#0,(2,a0)
	move.l	(a1),a0
	move.b	#0,(3,a0)
	move.l	(a1),a0
	move.b	#0,(4,a0)
	move.l	(a1),a0
	move.b	#0,(5,a0)
	move.w	#0,(48,a3)
	move.l	#0,(28,a3)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.l	(a1),a5
	addq.l	#6,a5
	move.l	a5,(20,a3)
	moveq	#4,d1
	move.l	d1,(24,a3)
	move.b	#3,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	tst.b	(a2)
	beq	l377
	moveq	#0,d0
	bra	l374
l377
	moveq	#1,d1
	cmp.l	(28,a3),d1
	bne	l379
	move.l	(70,a3),a0
	move.b	(6,a0),d0
	beq	l382
	subq.b	#1,d0
	bne	l383
	moveq	#1,d1
	move.l	d1,(a4)
	bra	l380
l382
	move.l	#0,(a4)
	bra	l380
l383
	moveq	#2,d1
	move.l	d1,(a4)
l380
	moveq	#1,d0
	bra	l374
l379
	moveq	#0,d0
l374
l384	reg	a2/a3/a4/a5/a6
	movem.l	(a7)+,a2/a3/a4/a5/a6
l386	equ	20
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_getScanResults
	cnop	0,4
_SCSIWifi_getScanResults
	movem.l	l400,-(a7)
	moveq	#74,d3
	move.l	(4+l402,a7),a4
	move.l	(8+l402,a7),a3
	move.l	a3,a0
	moveq	#0,d0
	move.l	#742,d2
	inline
	move.l	a0,a1
	cmp.l	#16,d2
	blo	.l3
	move.l	a0,d1
	and.b	#1,d1
	beq	.l1
	move.b	d0,(a0)+
	subq.l	#1,d2
.l1
	move.b	d0,d1
	lsl.w	#8,d0
	move.b	d1,d0
	move.w	d0,d1
	swap	d0
	move.w	d1,d0
	moveq	#3,d1
	and.l	d2,d1
	sub.l	d1,d2
.l2
	move.l	d0,(a0)+
	subq.l	#4,d2
	bne	.l2
	move.w	d1,d2
.l3
	subq.w	#1,d2
	blo	.l5
.l4
	move.b	d0,(a0)+
	dbf	d2,.l4
.l5
	move.l	a1,d0
	einline
	lea	(70,a4),a0
	move.l	(a0),a1
	move.b	#28,(a1)
	move.l	(a0),a1
	move.b	#3,(1,a1)
	move.l	(a0),a1
	move.b	#0,(2,a1)
	move.l	(a0),a1
	move.b	#0,(3,a1)
	move.l	(a0),a1
	move.b	#0,(4,a1)
	move.l	(a0),a0
	move.b	#0,(5,a0)
	move.w	#0,(48,a4)
	move.l	#0,(28,a4)
	lea	(41,a4),a2
	move.b	#1,(a2)
	move.l	a3,(20,a4)
	move.l	#742,(24,a4)
	move.b	#3,(40,a4)
	move.l	(12,a4),a1
	move.l	(a4),a6
	jsr	-456(a6)
	tst.b	(a2)
	beq	l390
	moveq	#0,d0
	bra	l387
l390
	moveq	#2,d4
	cmp.l	(28,a4),d4
	bhi	l392
	move.w	(a3),d1
	move.w	#0,(a3)
	cmp.w	d1,d3
	bhi	l399
l398
	sub.w	d3,d1
	addq.w	#1,(a3)
	cmp.w	d1,d3
	bls	l398
l399
	moveq	#1,d0
	bra	l387
l392
	moveq	#0,d0
l387
l400	reg	a2/a3/a4/a6/d2/d3/d4
	movem.l	(a7)+,a2/a3/a4/a6/d2/d3/d4
l402	equ	28
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_enable
	cnop	0,4
_SCSIWifi_enable
	movem.l	l410,-(a7)
	move.l	(8+l412,a7),d1
	move.l	(4+l412,a7),a3
	lea	(70,a3),a0
	move.l	(a0),a1
	move.b	#14,(a1)
	move.l	(a0),a1
	move.b	#0,(1,a1)
	move.l	(a0),a1
	move.b	#0,(2,a1)
	move.l	(a0),a1
	move.b	#0,(3,a1)
	move.l	(a0),a0
	move.b	#0,(4,a0)
	tst.l	d1
	beq	l406
	move.l	#128,d0
	bra	l407
l406
	moveq	#0,d0
l407
	move.l	(70,a3),a0
	move.b	d0,(5,a0)
	move.w	#0,(48,a3)
	move.l	#0,(28,a3)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.l	#0,(20,a3)
	move.l	#0,(24,a3)
	move.b	#3,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	tst.b	(a2)
	beq	l409
	moveq	#0,d0
	bra	l403
l409
	moveq	#1,d0
l403
l410	reg	a2/a3/a6
	movem.l	(a7)+,a2/a3/a6
l412	equ	12
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_getMACAddress
	cnop	0,4
_SCSIWifi_getMACAddress
	subq.w	#8,a7
	movem.l	l419,-(a7)
	move.l	(16+l421,a7),a4
	move.l	(12+l421,a7),a3
	lea	(70,a3),a1
	move.l	(a1),a0
	move.b	#28,(a0)
	move.l	(a1),a0
	move.b	#9,(1,a0)
	move.l	(a1),a0
	move.b	#0,(2,a0)
	move.l	(a1),a0
	move.b	#0,(3,a0)
	move.l	(a1),a0
	move.b	#0,(4,a0)
	move.l	(a1),a0
	move.b	#0,(5,a0)
	move.w	#0,(48,a3)
	move.l	#0,(28,a3)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.b	#0,(a4)
	move.l	(a1),a5
	addq.l	#6,a5
	move.l	a5,(20,a3)
	moveq	#6,d0
	move.l	d0,(24,a3)
	move.b	#3,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	tst.b	(a2)
	beq	l416
	moveq	#0,d0
	bra	l413
l416
	moveq	#6,d0
	cmp.l	(28,a3),d0
	bne	l418
	move.l	a4,a0
	addq.l	#2,a0
	move.l	a0,(0+l421,a7)
	move.l	(70,a3),a2
	addq.l	#6,a2
	move.l	a2,(4+l421,a7)
	move.l	(4+l421,a7),a0
	move.l	(0+l421,a7),a2
	lea	(a0),a5
	move.l	a1,-(a7)
	lea	(a2),a1
	move.b	(a5)+,(a1)+
	move.b	(a5)+,(a1)+
	move.b	(a5)+,(a1)+
	move.b	(a5)+,(a1)+
	move.b	(a5)+,(a1)+
	move.b	(a5)+,(a1)+
	move.l	(a7)+,a1
	move.b	#1,(a4)
	moveq	#1,d0
	bra	l413
l418
	moveq	#0,d0
l413
l419	reg	a2/a3/a4/a5/a6
	movem.l	(a7)+,a2/a3/a4/a5/a6
l421	equ	20
	addq.w	#8,a7
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_joinNetwork
	cnop	0,4
_SCSIWifi_joinNetwork
	movem.l	l426,-(a7)
	move.l	(4+l428,a7),a3
	lea	(70,a3),a0
	move.l	(a0),a1
	move.b	#28,(a1)
	move.l	(a0),a1
	move.b	#5,(1,a1)
	move.l	(a0),a1
	move.b	#0,(2,a1)
	move.l	(a0),a1
	move.b	#0,(3,a1)
	move.l	(a0),a1
	move.b	#130,(4,a1)
	move.l	(a0),a0
	move.b	#0,(5,a0)
	move.w	#0,(48,a3)
	move.l	#0,(28,a3)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.l	(8+l428,a7),(20,a3)
	move.l	#130,(24,a3)
	move.b	#2,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	tst.b	(a2)
	beq	l425
	moveq	#0,d0
	bra	l422
l425
	moveq	#1,d0
l422
l426	reg	a2/a3/a6
	movem.l	(a7)+,a2/a3/a6
l428	equ	12
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_getNetwork
	cnop	0,4
_SCSIWifi_getNetwork
	movem.l	l444,-(a7)
	move.l	(4+l446,a7),a2
	move.l	(8+l446,a7),a0
	moveq	#0,d0
	moveq	#74,d2
	inline
	move.l	a0,a1
	cmp.l	#16,d2
	blo	.l3
	move.l	a0,d1
	and.b	#1,d1
	beq	.l1
	move.b	d0,(a0)+
	subq.l	#1,d2
.l1
	move.b	d0,d1
	lsl.w	#8,d0
	move.b	d1,d0
	move.w	d0,d1
	swap	d0
	move.w	d1,d0
	moveq	#3,d1
	and.l	d2,d1
	sub.l	d1,d2
.l2
	move.l	d0,(a0)+
	subq.l	#4,d2
	bne	.l2
	move.w	d1,d2
.l3
	subq.w	#1,d2
	blo	.l5
.l4
	move.b	d0,(a0)+
	dbf	d2,.l4
.l5
	move.l	a1,d0
	einline
	lea	(70,a2),a0
	move.l	(a0),a1
	move.b	#28,(a1)
	move.l	(a0),a1
	move.b	#4,(1,a1)
	move.l	(a0),a1
	move.b	#0,(2,a1)
	move.l	(a0),a1
	move.b	#0,(3,a1)
	move.l	(a0),a1
	move.b	#0,(4,a1)
	move.l	(a0),a0
	move.b	#0,(5,a0)
	move.w	#0,(48,a2)
	move.l	#0,(28,a2)
	move.b	#1,(41,a2)
	move.l	(a2),a6
	moveq	#76,d0
	move.l	#65537,d1
	jsr	-684(a6)
	move.l	d0,a3
	tst.l	d0
	bne	l432
	moveq	#0,d0
	bra	l429
l432
	move.l	a3,(20,a2)
	moveq	#76,d6
	move.l	d6,(24,a2)
	move.b	#3,(40,a2)
	move.l	(12,a2),a1
	move.l	(a2),a6
	jsr	-456(a6)
	tst.b	(41,a2)
	beq	l434
	move.l	(a2),a6
	move.l	a3,a1
	jsr	-690(a6)
	moveq	#0,d0
	bra	l429
l434
	move.l	(28,a2),d5
	moveq	#2,d6
	cmp.l	d5,d6
	bcc	l436
	moveq	#0,d0
	move.b	(a3),d0
	lsl.w	#8,d0
	moveq	#0,d1
	move.b	(1,a3),d1
	move.w	d1,d3
	add.w	d0,d3
	cmp.w	#74,d3
	bls	l438
	moveq	#74,d3
l438
	moveq	#0,d0
	move.w	d3,d0
	move.l	d0,a0
	move.l	d5,d0
	subq.l	#2,d0
	cmp.l	a0,d0
	bcc	l440
	move.l	(28,a2),d0
	subq.l	#2,d0
	move.w	d0,d3
l440
	moveq	#0,d2
	move.w	d3,d2
	lea	(2,a3),a1
	move.l	(8+l446,a7),a0
	inline
	move.l	a0,d0
	cmp.l	#16,d2
	blo	.l5
	moveq	#1,d1
	and.b	d0,d1
	beq	.l1
	move.b	(a1)+,(a0)+
	subq.l	#1,d2
.l1
	move.l	a1,d1
	and.b	#1,d1
	beq	.l3
	cmp.l	#$10000,d2
	blo	.l5
.l2
	move.b	(a1)+,(a0)+
	subq.l	#1,d2
	bne	.l2
	bra	.l7
.l3
	moveq	#3,d1
	and.l	d2,d1
	sub.l	d1,d2
.l4
	move.l	(a1)+,(a0)+
	subq.l	#4,d2
	bne	.l4
	move.w	d1,d2
.l5
	subq.w	#1,d2
	blo	.l7
.l6
	move.b	(a1)+,(a0)+
	dbf	d2,.l6
.l7
	einline
	move.l	(a2),a6
	move.l	a3,a1
	jsr	-690(a6)
	cmp.w	#74,d3
	bne	l442
	moveq	#1,d4
	bra	l443
l442
	moveq	#0,d4
l443
	move.l	d4,d0
	bra	l429
l436
	move.l	(a2),a6
	move.l	a3,a1
	jsr	-690(a6)
	moveq	#0,d0
l429
l444	reg	a2/a3/a6/d2/d3/d4/d5/d6
	movem.l	(a7)+,a2/a3/a6/d2/d3/d4/d5/d6
l446	equ	32
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_addMulticastAddress
	cnop	0,4
_SCSIWifi_addMulticastAddress
	subq.w	#8,a7
	movem.l	l451,-(a7)
	move.l	(12+l453,a7),a3
	lea	(70,a3),a1
	move.l	(a1),a0
	move.b	#13,(a0)
	move.l	(a1),a0
	move.b	#0,(1,a0)
	move.l	(a1),a0
	move.b	#0,(2,a0)
	move.l	(a1),a0
	move.b	#6,(3,a0)
	move.l	(a1),a0
	move.b	#0,(4,a0)
	move.l	(a1),a0
	move.b	#0,(5,a0)
	move.w	#0,(48,a3)
	move.l	#0,(28,a3)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.l	(a1),a4
	addq.l	#6,a4
	move.l	a4,(0+l453,a7)
	move.l	(16+l453,a7),a4
	addq.l	#2,a4
	move.l	a4,(4+l453,a7)
	move.l	(4+l453,a7),a4
	move.l	(0+l453,a7),a5
	lea	(a4),a6
	move.l	a0,-(a7)
	lea	(a5),a0
	move.b	(a6)+,(a0)+
	move.b	(a6)+,(a0)+
	move.b	(a6)+,(a0)+
	move.b	(a6)+,(a0)+
	move.b	(a6)+,(a0)+
	move.b	(a6)+,(a0)+
	move.l	(a7)+,a0
	move.l	(a1),a4
	addq.l	#6,a4
	move.l	a4,(20,a3)
	moveq	#6,d1
	move.l	d1,(24,a3)
	move.b	#2,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	moveq	#1,d0
	tst.b	(a2)
	beq	l450
	moveq	#0,d0
l450
l451	reg	a2/a3/a4/a5/a6
	movem.l	(a7)+,a2/a3/a4/a5/a6
l453	equ	20
	addq.w	#8,a7
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_sendFrame
	cnop	0,4
_SCSIWifi_sendFrame
	movem.l	l458,-(a7)
	move.w	(14+l460,a7),d1
	move.l	(4+l460,a7),a3
	lea	(70,a3),a0
	move.l	(a0),a1
	move.b	#10,(a1)
	move.l	(a0),a1
	move.b	#0,(1,a1)
	move.l	(a0),a1
	move.b	#0,(2,a1)
	move.w	d1,d0
	lsr.w	#8,d0
	move.l	(a0),a1
	move.b	d0,(3,a1)
	moveq	#0,d0
	move.w	d1,d0
	and.l	#255,d0
	move.l	(a0),a1
	move.b	d0,(4,a1)
	move.l	(a0),a0
	move.b	#0,(5,a0)
	move.w	#0,(48,a3)
	move.l	#0,(28,a3)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.l	(8+l460,a7),(20,a3)
	moveq	#0,d0
	move.w	d1,d0
	move.l	d0,(24,a3)
	move.b	#2,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	tst.b	(a2)
	beq	l457
	moveq	#0,d0
	bra	l454
l457
	moveq	#1,d0
l454
l458	reg	a2/a3/a6
	movem.l	(a7)+,a2/a3/a6
l460	equ	12
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_receiveFrame
	cnop	0,4
_SCSIWifi_receiveFrame
	movem.l	l470,-(a7)
	moveq	#8,d2
	move.w	(14+l472,a7),d1
	move.l	(4+l472,a7),a3
	move.w	(74,a3),d0
	subq.w	#1,d0
	beq	l464
	subq.w	#1,d0
	beq	l465
	bra	l466
l464
	lea	(70,a3),a0
	move.l	(a0),a1
	move.b	#28,(a1)
	move.l	(a0),a1
	move.b	d2,(1,a1)
	move.l	(a0),a1
	move.b	#168,(2,a1)
	move.w	d1,d0
	lsr.w	#8,d0
	move.l	(a0),a1
	move.b	d0,(3,a1)
	moveq	#0,d0
	move.w	d1,d0
	and.l	#255,d0
	move.l	(a0),a1
	move.b	d0,(4,a1)
	move.l	(a0),a0
	move.b	#0,(5,a0)
	lea	(20,a3),a4
	move.w	#0,(48,a3)
	bra	l463
l465
	lea	(70,a3),a0
	move.l	(a0),a1
	move.b	#28,(a1)
	move.l	(a0),a1
	move.b	d2,(1,a1)
	move.l	(a0),a1
	move.b	#169,(2,a1)
	move.w	d1,d0
	lsr.w	#8,d0
	move.l	(a0),a1
	move.b	d0,(3,a1)
	moveq	#0,d0
	move.w	d1,d0
	and.l	#255,d0
	move.l	(a0),a1
	move.b	d0,(4,a1)
	move.l	(a0),a0
	move.b	#0,(5,a0)
	lea	(20,a3),a4
	move.w	#0,(48,a3)
	bra	l463
l466
	lea	(70,a3),a0
	move.l	(a0),a1
	move.b	d2,(a1)
	move.l	(a0),a1
	move.b	#0,(1,a1)
	move.l	(a0),a1
	move.b	#0,(2,a1)
	move.w	d1,d0
	lsr.w	#8,d0
	move.l	(a0),a1
	move.b	d0,(3,a1)
	moveq	#0,d0
	move.w	d1,d0
	and.l	#255,d0
	move.l	(a0),a1
	move.b	d0,(4,a1)
	move.l	(a0),a0
	move.b	#0,(5,a0)
	lea	(20,a3),a4
	move.w	#0,(48,a3)
l463
	lea	(28,a3),a5
	move.l	#0,(a5)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.l	(8+l472,a7),(a4)
	moveq	#0,d3
	move.w	d1,d3
	move.l	d3,(24,a3)
	move.b	#3,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	tst.b	(a2)
	bne	l467
	moveq	#6,d3
	cmp.l	(a5),d3
	bls	l468
l467
	moveq	#0,d0
	bra	l461
l468
	move.l	(28,a3),d0
l461
l470	reg	a2/a3/a4/a5/a6/d2/d3
	movem.l	(a7)+,a2/a3/a4/a5/a6/d2/d3
l472	equ	28
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_getDeviceInfo
	cnop	0,4
_SCSIWifi_getDeviceInfo
	subq.w	#8,a7
	movem.l	l479,-(a7)
	move.l	(16+l481,a7),a5
	move.l	(12+l481,a7),a3
	lea	(70,a3),a1
	move.l	(a1),a0
	move.b	#28,(a0)
	move.l	(a1),a0
	move.b	#11,(1,a0)
	move.l	(a1),a0
	move.b	#0,(2,a0)
	move.l	(a1),a0
	move.b	#0,(3,a0)
	move.l	(a1),a0
	move.b	#0,(4,a0)
	move.l	(a1),a0
	move.b	#0,(5,a0)
	move.w	#0,(48,a3)
	move.l	#0,(28,a3)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.l	(a1),a4
	addq.l	#6,a4
	move.b	#0,(a5)
	move.l	a4,(20,a3)
	moveq	#12,d0
	move.l	d0,(24,a3)
	move.b	#3,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	tst.b	(a2)
	beq	l476
	moveq	#0,d0
	bra	l473
l476
	moveq	#12,d0
	cmp.l	(28,a3),d0
	bne	l478
	move.l	a5,a0
	addq.l	#6,a0
	move.l	a0,(0+l481,a7)
	move.l	a4,a0
	addq.l	#6,a0
	move.l	a0,(4+l481,a7)
	move.l	(4+l481,a7),a0
	move.l	(0+l481,a7),a2
	move.l	a1,-(a7)
	lea	(a0),a1
	move.l	a3,-(a7)
	lea	(a2),a3
	move.b	(a1)+,(a3)+
	move.b	(a1)+,(a3)+
	move.b	(a1)+,(a3)+
	move.b	(a1)+,(a3)+
	move.b	(a1)+,(a3)+
	move.b	(a1)+,(a3)+
	move.l	(a7)+,a3
	move.l	(a7)+,a1
	moveq	#0,d0
	move.b	(a4),d0
	lsl.w	#8,d0
	moveq	#0,d1
	move.b	(1,a4),d1
	or.w	d1,d0
	move.w	d0,(2,a5)
	moveq	#0,d0
	move.b	(2,a4),d0
	lsl.w	#8,d0
	moveq	#0,d1
	move.b	(3,a4),d1
	or.w	d1,d0
	move.w	d0,(4,a5)
	move.b	#1,(a5)
	moveq	#1,d0
	bra	l473
l478
	moveq	#0,d0
l473
l479	reg	a2/a3/a4/a5/a6
	movem.l	(a7)+,a2/a3/a4/a5/a6
l481	equ	20
	addq.w	#8,a7
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_AmigaNetSendFrames
	cnop	0,4
_SCSIWifi_AmigaNetSendFrames
	movem.l	l486,-(a7)
	move.w	(14+l488,a7),d1
	move.l	(4+l488,a7),a3
	lea	(70,a3),a0
	move.l	(a0),a1
	move.b	#10,(a1)
	move.l	(a0),a1
	move.b	#0,(1,a1)
	move.l	(a0),a1
	move.b	#64,(2,a1)
	move.w	d1,d0
	lsr.w	#8,d0
	move.l	(a0),a1
	move.b	d0,(3,a1)
	moveq	#0,d0
	move.w	d1,d0
	and.l	#255,d0
	move.l	(a0),a1
	move.b	d0,(4,a1)
	move.l	(a0),a0
	move.b	#0,(5,a0)
	move.w	#0,(48,a3)
	move.l	#0,(28,a3)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.l	(8+l488,a7),(20,a3)
	moveq	#0,d0
	move.w	d1,d0
	move.l	d0,(24,a3)
	move.b	#2,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	tst.b	(a2)
	beq	l485
	moveq	#0,d0
	bra	l482
l485
	moveq	#1,d0
l482
l486	reg	a2/a3/a6
	movem.l	(a7)+,a2/a3/a6
l488	equ	12
	rts
	near	code
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SCSIWifi_AmigaNetRecvFrames
	cnop	0,4
_SCSIWifi_AmigaNetRecvFrames
	movem.l	l498,-(a7)
	moveq	#8,d2
	move.w	(14+l500,a7),d1
	move.l	(4+l500,a7),a3
	move.w	(74,a3),d0
	subq.w	#1,d0
	beq	l492
	subq.w	#1,d0
	beq	l493
	bra	l494
l492
	lea	(70,a3),a0
	move.l	(a0),a1
	move.b	#28,(a1)
	move.l	(a0),a1
	move.b	d2,(1,a1)
	move.l	(a0),a1
	move.b	#232,(2,a1)
	move.w	d1,d0
	lsr.w	#8,d0
	move.l	(a0),a1
	move.b	d0,(3,a1)
	moveq	#0,d0
	move.w	d1,d0
	and.l	#255,d0
	move.l	(a0),a1
	move.b	d0,(4,a1)
	move.l	(a0),a0
	move.b	#0,(5,a0)
	lea	(20,a3),a4
	move.w	#0,(48,a3)
	bra	l491
l493
	lea	(70,a3),a0
	move.l	(a0),a1
	move.b	#28,(a1)
	move.l	(a0),a1
	move.b	d2,(1,a1)
	move.l	(a0),a1
	move.b	#233,(2,a1)
	move.w	d1,d0
	lsr.w	#8,d0
	move.l	(a0),a1
	move.b	d0,(3,a1)
	moveq	#0,d0
	move.w	d1,d0
	and.l	#255,d0
	move.l	(a0),a1
	move.b	d0,(4,a1)
	move.l	(a0),a0
	move.b	#0,(5,a0)
	lea	(20,a3),a4
	move.w	#0,(48,a3)
	bra	l491
l494
	lea	(70,a3),a0
	move.l	(a0),a1
	move.b	d2,(a1)
	move.l	(a0),a1
	move.b	#0,(1,a1)
	move.l	(a0),a1
	move.b	#64,(2,a1)
	move.w	d1,d0
	lsr.w	#8,d0
	move.l	(a0),a1
	move.b	d0,(3,a1)
	moveq	#0,d0
	move.w	d1,d0
	and.l	#255,d0
	move.l	(a0),a1
	move.b	d0,(4,a1)
	move.l	(a0),a0
	move.b	#0,(5,a0)
	lea	(20,a3),a4
	move.w	#0,(48,a3)
l491
	lea	(28,a3),a5
	move.l	#0,(a5)
	lea	(41,a3),a2
	move.b	#1,(a2)
	move.l	(8+l500,a7),(a4)
	moveq	#0,d3
	move.w	d1,d3
	move.l	d3,(24,a3)
	move.b	#3,(40,a3)
	move.l	(12,a3),a1
	move.l	(a3),a6
	jsr	-456(a6)
	tst.b	(a2)
	bne	l495
	moveq	#4,d3
	cmp.l	(a5),d3
	bls	l496
l495
	moveq	#0,d0
	bra	l489
l496
	move.l	(28,a3),d0
l489
l498	reg	a2/a3/a4/a5/a6/d2/d3
	movem.l	(a7)+,a2/a3/a4/a5/a6/d2/d3
l500	equ	28
	rts
	cnop	0,4
l2
	dc.b	68
	dc.b	69
	dc.b	86
	dc.b	73
	dc.b	67
	dc.b	69
	dc.b	0
	cnop	0,4
l3
	dc.b	68
	dc.b	69
	dc.b	86
	dc.b	73
	dc.b	67
	dc.b	69
	dc.b	73
	dc.b	68
	dc.b	0
	cnop	0,4
l4
	dc.b	80
	dc.b	82
	dc.b	73
	dc.b	79
	dc.b	82
	dc.b	73
	dc.b	84
	dc.b	89
	dc.b	0
	cnop	0,4
l5
	dc.b	77
	dc.b	79
	dc.b	68
	dc.b	69
	dc.b	0
	cnop	0,4
l6
	dc.b	65
	dc.b	85
	dc.b	84
	dc.b	79
	dc.b	67
	dc.b	79
	dc.b	78
	dc.b	78
	dc.b	69
	dc.b	67
	dc.b	84
	dc.b	0
	cnop	0,4
l7
	dc.b	83
	dc.b	83
	dc.b	73
	dc.b	68
	dc.b	0
	cnop	0,4
l8
	dc.b	75
	dc.b	69
	dc.b	89
	dc.b	0
	cnop	0,4
l9
	dc.b	68
	dc.b	65
	dc.b	84
	dc.b	65
	dc.b	83
	dc.b	73
	dc.b	90
	dc.b	69
	dc.b	0
	cnop	0,4
l10
	dc.b	68
	dc.b	69
	dc.b	66
	dc.b	85
	dc.b	71
	dc.b	0
	section	"DATA",data
	cnop	0,4
l1
	dc.l	l2
	dc.l	l3
	dc.l	l4
	dc.l	l5
	dc.l	l6
	dc.l	l7
	dc.l	l8
	dc.l	l9
	dc.l	l10
