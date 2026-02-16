local platform = require('utils.platform')

local options = {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {},

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {},
}

if platform.is_win then
   options.ssh_domains = {
      {
         name = 'ssh:wsl',
         remote_address = 'localhost',
         multiplexing = 'None',
         default_prog = { 'fish', '-l' },
         assume_shell = 'Posix',
      },
   }

   options.wsl_domains = {
      {
         name = 'wsl:arch-zsh',
         distribution = 'Arch',
         username = 'md',
         default_cwd = '/home/md',
         default_prog = { 'zsh', '-l' },
      },
      {
         name = 'wsl:arch-bash',
         distribution = 'Arch',
         username = 'md',
         default_cwd = '/home/md',
         default_prog = { 'bash', '-l' },
      },
   }
end

return options
