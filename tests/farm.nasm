%include 'inc/func.inc'
%include 'inc/mail.inc'
%include 'class/class_string.inc'

;;;;;;;;;;;
; test code
;;;;;;;;;;;

def_func tests/farm

	const num_child, 128

	ptr name, ids, msg
	ulong cnt

	push_scope

	;task
	func_call string, create_from_cstr, {"tests/farm_child"}, {name}

	;open farm
	func_call sys_task, open_farm, {name, num_child}, {ids}

	;send exit messages etc
	assign {num_child}, {cnt}
	loop_while {cnt != 0}
		assign {cnt - 1}, {cnt}
		continueifnot {ids[cnt * id_size].id_mbox}
		func_call sys_mail, alloc, {}, {msg}
		assign {ids[cnt * id_size].id_mbox}, {msg->msg_dest.id_mbox}
		assign {ids[cnt * id_size].id_cpu}, {msg->msg_dest.id_cpu}
		func_call sys_mail, send, {msg}
		func_call sys_task, yield
	loop_end

	;free name and ID array
	func_call string, deref, {name}
	func_call sys_mem, free, {ids}
	pop_scope
	return

def_func_end
