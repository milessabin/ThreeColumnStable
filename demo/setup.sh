cd ~
Xephyr -br -ac -noreset -screen 1024x288 :1 &
sleep 5
DISPLAY=:1 xsetroot -cursor_name left_ptr
DISPLAY=:1 hsetroot -solid '#002b36'
DISPLAY=:1 xmonad &
