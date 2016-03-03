%include 'inc/func.inc'
%include 'inc/task.inc'

	fn_function sys/task_yield
		;push task state
		tk_save_state

		;save old stack pointer
		fn_bind sys/task_statics, r15
		vp_cpy [r15 + tk_statics_current_tcb], r15
		vp_cpy r4, [r15 + tk_node_stack]

		;get next task control block
		ln_get_succ r15, r15
		fn_jmp sys/task_restore

	fn_function_end
