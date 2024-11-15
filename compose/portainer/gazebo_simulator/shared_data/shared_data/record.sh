#!/bin/bash

path="/etc/docker/bag_files/"

# By default, we record everything.
# Except for this list of EXCLUDED topics:
exclude=(

# IN GENERAL, DON'T RECORD CAMERAS
#
# If you want to record cameras, create a copy of this script
# and place it at your tmux session.
#
# Please, seek an advice of a senior researcher of MRS about
# what can be recorded. Recording too much data can lead to
# ROS communication hiccups, which can lead to eland, failsafe
# or just a CRASH.

'(.*)camera_front/image_raw'
'(.*)camera_front/camera_info'
'(.*)camera_front/image_raw/compressed(.*)'
'(.*)camera_front/image_raw/theora(.*)'
'(.*)camera_front/image_raw/compressedDepth(.*)'

'(.*)camera_down/image_raw'
'(.*)camera_down/camera_info'
'(.*)camera_down/image_raw/compressed(.*)'
'(.*)camera_down/image_raw/theora(.*)'
'(.*)camera_down/image_raw/compressedDepth(.*)'

'(.*)camera_front_throttled/image_raw'
'(.*)camera_front_throttled/camera_info'
# '(.*)camera_front_throttled/image_raw/compressed(.*)'
'(.*)camera_front_throttled/image_raw/theora(.*)'
'(.*)camera_front_throttled/image_raw/compressedDepth(.*)'

'(.*)camera_down_throttled/image_raw'
'(.*)camera_down_throttled/camera_info'
# '(.*)camera_down_throttled/image_raw/compressed(.*)'
'(.*)camera_down_throttled/image_raw/theora(.*)'
'(.*)camera_down_throttled/image_raw/compressedDepth(.*)'

'(.*)apriltag(.*)'

'(.*)ov_msckf(.*)'

'(.*)mavros(.*)'

'(.*)mavlink(.*)'

'(.*)estimation_manager(.*)proc'
'(.*)estimation_manager(.*)raw'
'(.*)estimation_manager(.*)input'
'(.*)estimation_manager(.*)odom'
'(.*)estimation_manager(.*)innovation'

'(.*)vins_republisher(.*)'

'(.*)parameter_descriptions'
'(.*)parameter_updates'

'(.*)mpc_tracker/string'

'(.*)bond'
)

# file's header
filename=`mktemp`
echo "<launch>" > "$filename"
echo "<arg name=\"UAV_NAME\" default=\"\$(env UAV_NAME)\" />" >> "$filename"
echo "<group ns=\"\$(arg UAV_NAME)\">" >> "$filename"

echo -n "<node pkg=\"rosbag\" type=\"record\" name=\"rosbag_record\" output=\"screen\" args=\"-o $path -a" >> "$filename"

# if there is anything to exclude
if [ "${#exclude[*]}" -gt 0 ]; then

  echo -n " -x " >> "$filename"

  # list all the string and separate the with |
  for ((i=0; i < ${#exclude[*]}; i++));
  do
    echo -n "${exclude[$i]}" >> "$filename"
    if [ "$i" -lt "$( expr ${#exclude[*]} - 1)" ]; then
      echo -n "|" >> "$filename"
    fi
  done

fi

echo "\">" >> "$filename"

echo "<remap from=\"~status_msg_out\" to=\"mrs_uav_status/display_string\" />" >> "$filename"
echo "<remap from=\"~data_rate_out\" to=\"~data_rate_MB_per_s\" />" >> "$filename"

# file's footer
echo "</node>" >> "$filename"
echo "</group>" >> "$filename"
echo "</launch>" >> "$filename"

cat $filename
roslaunch $filename

