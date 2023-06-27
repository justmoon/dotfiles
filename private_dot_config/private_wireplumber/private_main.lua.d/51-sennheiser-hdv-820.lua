rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.usb-SENNHEISER_SENNHEISER_HDV_820_2-2366404J800050004-00.analog-stereo" },
    },
  },
  apply_properties = {
    ["device.intended-roles"] = "Virtual",
  }
}

table.insert(alsa_monitor.rules, rule)

