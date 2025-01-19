#!/bin/bash
# Simple script to test AxiDraw is connected and working correctly with the axicli

SLEEP_DURATION=0.5
DISTANCE=50

send_command_version() {
  echo "🧪 Get Version"
  echo "===================="
  axicli --version
  echo "===================="
  sleep $SLEEP_DURATION
}

send_command_walk_mmy() {
  echo "🧪 Walk Y-Axis: ${DISTANCE}mm"
  axicli -m manual -M walk_mmy --dist $DISTANCE
  sleep $SLEEP_DURATION
}

send_command_lower_pen() {
  echo "🧪 Lower Pen"
  axicli -m manual -M lower_pen
  sleep $SLEEP_DURATION
}

send_command_raise_pen() {
  echo "🧪 Raise Pen"
  axicli -m manual -M raise_pen
  sleep $SLEEP_DURATION
}

send_command_walk_mmx() {
  echo "🧪 Walk X-Axis: ${DISTANCE}mm"
  axicli -m manual -M walk_mmx --dist $DISTANCE
  sleep $SLEEP_DURATION
}

send_command_walk_home() {
  echo "🧪 Walk Home"
  axicli --mode=manual --manual_cmd=walk_home
  sleep $SLEEP_DURATION
}

send_command_disengage_motors() {
  echo "🧪 Disengage Motors"
  axicli -m manual -M disable_xy
  sleep $SLEEP_DURATION
}

# Execute commands sequentially
echo "===================="
echo "Quick AxiDraw Test..."
echo "===================="

sleep $SLEEP_DURATION
send_command_version
send_command_walk_mmy
send_command_lower_pen
send_command_raise_pen
send_command_walk_mmx
send_command_lower_pen
send_command_raise_pen
send_command_walk_home
send_command_disengage_motors

echo "===================="
echo "Test complete."
echo "===================="
