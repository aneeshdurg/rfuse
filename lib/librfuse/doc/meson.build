if not platform.endswith('bsd') and platform != 'dragonfly'
  # Installed under rfuse names so they don't clash with the system's fuse3
  rfusermount_man = configure_file(input: 'fusermount3.1', output: 'rfusermount3.1', copy: true)
  mount_rfuse_man = configure_file(input: 'mount.fuse3.8', output: 'mount.rfuse3.8', copy: true)
  install_man(rfusermount_man, mount_rfuse_man)
endif
