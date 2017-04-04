do local _ = {
  admins = {},
  disabled_channels = {},
  enabled_plugins = {
    "banhammer",
    "groupmanager",
    "msg-checks",
    "plugins",
    "tools",
    "me",
    "replay",
    "pohot",
  },
  info_text = "",
  moderation = {
    data = "./data/moderation.json"
  },
  sudo_users = {
    209099061,
  }
}
return _
end
