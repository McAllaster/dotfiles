# Set a gnome theme to that of a string

function gnome-theme --argument-names themename --description "Set a gnome theme to that of a supplied string"
  switch "$themename"
    case ""
      echo "No theme name supplied"
      exit 1
  end

  gsettings set org.gnome.desktop.interface gtk-theme "$themename"
  gsettings set org.gnome.desktop.wm.preferences theme "$themename"
  gsettings set org.gnome.shell.extensions.user-theme name "$themename"
end
