local present, comment = pcall(require, 'Comment')

if not (present) then return end

comment.setup()
