local wezterm = require("wezterm")

local projects = {}

local function get_file_name(file)
  local file_name = file:match("[^/]*.lua$")
  return file_name:sub(0, #file_name - 4)
end

local function find_project_files()
  local project_dir = wezterm.home_dir .. "/.config/wezterm/projects"

  return wezterm.glob(project_dir .. "/*.lua")
end

local function get_project_choices()
  local choices = {}

  for _, proj_path in ipairs(find_project_files()) do
    local proj_name = get_file_name(proj_path)
    table.insert(choices, #choices + 1, {
      label = proj_name,
      id = proj_path,
    })
  end

  return choices
end

function projects.get_input_selector()
  return {
    action = wezterm.action_callback(function(window, pane, id, label)
      local workspaces = wezterm.mux.get_workspace_names()

      -- If the project workspace already exists, don't create it again. Just switch
      for _, ws in pairs(workspaces) do
        if ws == label then
          wezterm.mux.set_active_workspace(label)
          return
        end
      end

      local project_config = dofile(id)

      local project_startup = project_config.startup

      -- Check the project_startup is set and is a function
      if project_startup == nil or type(project_startup) ~= "function" then
        wezterm.log_error(
          "Project " .. label .. " has no exported 'startup' function (type is " .. type(project_startup) .. ")"
        )
        return
      end

      project_startup(wezterm, label)
    end),
    title = "Project Workspaces",
    choices = get_project_choices(),
  }
end

return projects