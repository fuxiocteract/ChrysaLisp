%include 'inc/func.inc'
%include 'class/class_master.inc'

	fn_function class/master/get_state
		;inputs
		;r0 = master object
		;outputs
		;r0 = master object
		;r1 = current state

		vp_cpy [r0 + master_state], r1
		vp_ret

	fn_function_end