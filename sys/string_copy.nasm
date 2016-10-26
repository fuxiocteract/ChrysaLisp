%include 'inc/func.inc'

def_func sys/string_copy
	;inputs
	;r0 = string
	;r1 = string copy
	;outputs
	;r0 = string end
	;r1 = string copy end
	;trashes
	;r2

	loop_start
		vp_cpy_ub [r0], r2
		vp_cpy_ub r2, [r1]
		vp_inc r0
		vp_inc r1
	loop_until r2, ==, 0
	vp_ret

def_func_end
