local present, todo_comments = pcall(require, "todo-comments")

if not present then
	return
end

todo_comments.setup({})
