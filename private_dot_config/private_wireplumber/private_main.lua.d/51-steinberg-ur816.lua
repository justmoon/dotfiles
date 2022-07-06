rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.usb-Yamaha_Corporation_Steinberg_UR816C-00.pro-output-0" },
    },
  },
  apply_properties = {
    ["device.intended-roles"] = "Virtual",
  }
}

table.insert(alsa_monitor.rules, rule)

