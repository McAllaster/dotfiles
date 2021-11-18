#!/usr/bin/fish

# Set prompt colors
set -U fish_color_normal normal
set -U fish_color_command magenta
set -U fish_color_quote green
set -U fish_color_redirection cyan
set -U fish_color_end magenta
set -U fish_color_error red
set -U fish_color_param blue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator cyan
set -U fish_color_escape cyan
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion green
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_color_comment yellow
set -U fish_color_match --background=brblue

# Install Fisher
if not type -q fisher
	curl -sL https://git.io/fisher | source
	fisher install jorgebucaran/fisher
end

# Install Fisher plugins
set hydro_installed false
set nvm_installed false

for plugin in (fisher list)
	if [ "$plugin" = "jorgebucaran/hydro" ]
		set hydro_installed true
	end
	if [ "$plugin" = "jorgebucaran/nvm.fish" ]
		set nvm_installed true
	end
end

if not $hydro_installed
	fisher install jorgebucaran/hydro
end

set -U hydro_color_pwd cyan
set -U hydro_color_git white
set -U hydro_color_prompt green
set -U hydro_color_duration yellow

# Node Version Manager

if not $nvm_installed
	fisher install jorgebucaran/nvm.fish
end

nvm install lts
set -U nvm_default_version lts
