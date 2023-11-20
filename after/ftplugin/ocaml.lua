vim.opt_local.shiftwidth = 2

-- dune build in tmux popup
vim.keymap.set('n', '<localleader>db',
	":silent! ! tmux popup -h 90\\% -w 80\\% 'dune build'<CR>",
	-- tmux popups don't inherit some env vars when running a command,
	-- so to get dune to work we need to make sure the env for opam is
	-- set correctly.
	-- ":silent! ! tmux popup -h 90\\% -w 80\\% 'eval $(opam env --set-switch) && dune build'<CR>",
	{ buffer = true, desc = '[d]une [b]uild' })

-- dune build and send output to buffer
vim.keymap.set('n', '<localleader>dB',
	":r! dune build<CR>",
	{ buffer = true, desc = '[d]une [B]uild (send output to buffer)' })

-- dune relase build in tmux popup
-- Nice because it doesn't error when there are warnings
vim.keymap.set('n', '<localleader>dR',
	":silent! ! tmux popup -h 90\\% -w 80\\% 'dune build --profile release'<CR>",
	{ buffer = true, desc = '[d]une [R]elease build' })

-- dune test
vim.keymap.set('n', '<localleader>dt',
	":silent! ! tmux popup -h 90\\% -w 80\\% 'dune test'<CR>",
	{ buffer = true, desc = '[d]une [t]est' })

-- dune test, suppressing warnings
vim.keymap.set('n', '<localleader>dT',
	":silent! ! tmux popup -h 90\\% -w 80\\% \"OCAMLPARAM='_,warn-error=-a' dune test\"<CR>",
	{ buffer = true, desc = '[d]une [T]est (suppress warnings)' })

-- dune utop
vim.keymap.set('n', '<localleader>du',
	":silent! ! tmux popup -h 90\\% -w 80\\% \"OCAMLPARAM='_,warn-error=-a' dune utop\"<CR>",
	{ buffer = true, desc = '[d]une [u]top (suppress warnings)' })

-- dune promote
-- when you are using ppx_expect and you run dune test, it shows a diff of the updated
-- test output. If you want that new output to be what's expected, you can run `dune promote`
-- and it will patch that new output into the test as what should be expected
vim.keymap.set('n', '<localleader>dp', ":! dune promote<CR>", { buffer = true, desc = '[d]une [p]romote' })
