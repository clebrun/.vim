vim.keymap.set('n', '<localleader>db',
	-- tmux popups don't inherit some env vars when running a command,
	-- so to get dune to work we need to make sure the env for opam is
	-- set correctly.
	":silent! ! tmux popup -h 90\\% -w 80\\% 'eval $(opam env --set-switch) && dune build'<CR>",
	{ buffer = true, desc = '[d]une [b]uild' })

vim.keymap.set('n', '<localleader>dt',
	-- tmux popups don't inherit some env vars when running a command,
	-- so to get dune to work we need to make sure the env for opam is
	-- set correctly.
	":silent! ! tmux popup -h 90\\% -w 80\\% 'eval $(opam env --set-switch) && dune test'<CR>",
	{ buffer = true, desc = '[d]une [t]est' })

-- when you are using ppx_expect and you run dune test, it shows a diff of the updated
-- test output. If you want that new output to be what's expected, you can run `dune promote`
-- and it will patch that new output into the test as what should be expected
vim.keymap.set('n', '<localleader>dp', ":! dune promote<CR>", { buffer = true, desc = '[d]une [p]romote' })
