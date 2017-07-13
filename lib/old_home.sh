while true; do
  ask string old_disk_mount "Where is the old hard disk mounted"

  old_home_dir="$old_disk_mount$HOME"

  [ -n "$old_disk_mount" -a -d "$old_disk_mount" -a -d "$old_home_dir" ] && break
done

