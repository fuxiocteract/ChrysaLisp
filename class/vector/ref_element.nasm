%include 'inc/func.inc'
%include 'class/class_vector.inc'

	def_func class/vector/ref_element
		;inputs
		;r0 = vector object
		;r1 = vector element
		;outputs
		;r0 = vector object
		;r1 = object

		vp_push r0
		vp_cpy [r0 + vector_array], r0
		f_call ref, ref, {[r0 + (r1 * ptr_size)]}
		vp_cpy r0, r1
		vp_pop r0
		vp_ret

	def_func_end
