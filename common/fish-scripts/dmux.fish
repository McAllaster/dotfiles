function dmux --argument-names dir --description "Start a tmux development session"
  switch "$dir"
    case ""
      set session (basename $PWD)
    case \*
      set session (basename $dir)
  end

  tmux new-session -d -s "$session" -n "edit" -c "$dir"; or return
  tmux new-window -t "$session" -n "explore" -c "$dir"
  tmux new-window -t "$session" -n "run" -c "$dir"
  tmux split-window -h -t "$session:run" -c "$dir"
  tmux select-window -t "$session" -t "edit"
end
