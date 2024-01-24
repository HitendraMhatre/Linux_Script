#!/bin/bash
LOG_FILE="$HOME/user_history.log"


GROUP_MEMBERS=$(getent group newusers | cut -d: -f4)

echo "-------------------" >> "$LOG_FILE"
date >> "$LOG_FILE"
echo "Users in 'newusers' group:" >> "$LOG_FILE"
echo "$GROUP_MEMBERS" >> "$LOG_FILE"

