if status is-interactive
	set -gx EDITOR "nvim"
end

# proto (utilizes path additions)
set -gx PROTO_HOME "$HOME/.proto";
fish_add_path -g "$PROTO_HOME/shims"
fish_add_path -g "$PROTO_HOME/bin"
