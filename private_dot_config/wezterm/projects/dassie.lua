local project = {}

function project.startup(wezterm, workspace_name)
	local mux = wezterm.mux
	local project_dir = "/opt/workspace/justmoon/dassie"

	-- shell tab
	local sh_tab, sh_pane, project_window = mux.spawn_window({
		workspace = workspace_name,
		cwd = project_dir,
	})

	sh_tab:set_title("sh")

	-- edit tab
	local edit_tab, edit_pane, _ = project_window:spawn_tab({})

	edit_tab:set_title("edit")
	edit_pane:send_text("nvim\r")

	-- tools tab
	local tools_tab, typecheck_pane, _ = project_window:spawn_tab({})

	tools_tab:set_title("tools")
	typecheck_pane:send_text("rerun --suspend pnpm typecheck\r")
	local lint_pane, _ = typecheck_pane:split({
		direction = "Bottom",
		size = 0.66,
	})
	lint_pane:send_text("rerun --suspend pnpm lint\r")
	local test_pane, _ = lint_pane:split({
		direction = "Bottom",
		size = 0.5,
	})
	test_pane:send_text("rerun --suspend --once pnpm test\r")

	-- git tab
	local git_tab, git_pane, _ = project_window:spawn_tab({})

	git_tab:set_title("git")
	git_pane:send_text("lazygit\r")

	-- todo tab
	local todo_tab, todo_pane, _ = project_window:spawn_tab({})

	todo_tab:set_title("todo")
	todo_pane:send_text("nvim ~/Documents/todo.txt\r")

	-- mirror tab
	local mirror_tab, mirror_pane, _ = project_window:spawn_tab({})

	mirror_tab:set_title("mirror")
	mirror_pane:send_text("pnpm --filter=app-build serve-mirror\r")

	-- run tab
	local run_tab, run_pane, _ = project_window:spawn_tab({})

	run_tab:set_title("run")
	run_pane:send_text("rerun --suspend pnpm start\r")

	mux.set_active_workspace(workspace_name)
	sh_pane:activate()
end

return project
