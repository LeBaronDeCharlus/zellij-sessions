ZJ_SESSIONS=$(zellij list-sessions)
NO_SESSIONS=$(echo "${ZJ_SESSIONS}" | wc -l)

if [ "{$ZELLIJ}" ] && [ -z "${ZELLIJ_SESSION_NAME}" ]; then
  echo -ne "Active Zellij sessions :\n"
  for i in $(echo "${ZJ_SESSIONS}"); do echo -ne "*${i}\n"; done
  echo -ne '\n'
  read REPLY\?"New zellij session [y/n] ? "
  if [ "${REPLY}" = "y" ]; then
    read SESS\?"Session name : "
    zellij --layout compact attach -c "${SESS}"
  else
    if [ "${NO_SESSIONS}" -ge 1 ]; then
      zellij --layout compact attach \
      "$(echo "${ZJ_SESSIONS}" | sk)"
    else
    fi
  fi
fi
