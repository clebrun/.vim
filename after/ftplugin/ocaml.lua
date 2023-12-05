vim.opt_local.shiftwidth = 2

local function def_popup_command(bind, com_str, options)
	local options = options or {}
	local height = options.h or '90'
	local width = options.h or '80'
	local command = string.format(
	-- zsh -ic ensures any env stuff you set up in your .zshrc or whatever
	-- is actually set inside a non-interactive popup
	-- \\ + %% = escaping for % inside a string.format that's sent to :!
		":silent! ! tmux popup -h %s\\%% -w %s\\%% 'zsh -ic \"%s\"'<CR>",
		height, width, com_str
	)

	local desc = options.desc or com_str
	vim.keymap.set('n', bind, command, { buffer = true, desc = desc })
end

def_popup_command("<localleader>db", "dune build", { desc = "[d]une [b]uild" })
def_popup_command("<localleader>dR", "dune build --profile release", { desc = "[d]une [R]elease build" })
def_popup_command("<localleader>dt", "dune test", { desc = "[d]une [t]est" })
def_popup_command("<localleader>dT", "OCAMLPARAM='_,warn-error=-a' dune test",
	{ desc = "[d]une [T]est (ignore warnings)" })
def_popup_command("<localleader>du", "OCAMLPARAM='_,warn-error=-a' dune utop",
	{ desc = "[d]une [u]top (ignore warnings)" })

-- dune build and send output to buffer
vim.keymap.set('n', '<localleader>dB',
	":r! dune build<CR>",
	{ buffer = true, desc = '[d]une [B]uild (send output to buffer)' })

-- dune promote
-- when you are using ppx_expect and you run dune test, it shows a diff of the updated
-- test output. If you want that new output to be what's expected, you can run `dune promote`
-- and it will patch that new output into the test as what should be expected
vim.keymap.set('n', '<localleader>dp', ":! dune promote<CR>", { buffer = true, desc = '[d]une [p]romote' })
