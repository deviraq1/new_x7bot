do local _ = {
  admins = {},
  disabled_channels = {},
  enabled_plugins = {
    "banhammer",
    "subergroup",
    "checks",
    "plugins",
    "super2",
    "me",
    "re_replay",
    "Help",
    "lock_tafia",
    "lock_badword",
    "lock_smiles",
    "lock_rdod"
  },
  info_text = "",
  moderation = {
    data = "./data/moderation.json"
  },
  sudo_users = {
    242937336,
    128549161
  }
}
return _
end