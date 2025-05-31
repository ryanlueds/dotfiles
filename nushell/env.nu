# env.nu
#
# Installed by:
# version = "0.104.1"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.


$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
    ($nu.data-dir | path join 'completions') # default home for nushell completions
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]



# $env.PATH = '/Users/ryanlueder/.nvm/versions/node/v20.19.2/bin:/Users/ryanlueder/.codeium/windsurf/bin:/Users/ryanlueder/go/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/TeX/texbin:/usr/local/go/bin:/Users/ryanlueder/.nvm/versions/node/v20.19.2/bin:/Users/ryanlueder/.codeium/windsurf/bin:/Users/ryanlueder/go/bin:/Users/ryanlueder/miniconda3/bin:/Users/ryanlueder/miniconda3/condabin:/Users/ryanlueder/.cargo/bin'

$env.XDG_CONFIG_HOME = $nu.home-path | path join ".config"
let NVM_NODE_BIN = '/Users/ryanlueder/.nvm/versions/node/v20.19.2/bin'


let user_paths = [
    $NVM_NODE_BIN
    '/Users/ryanlueder/go/bin'
    '/usr/local/go/bin'
    '/opt/homebrew/bin'
    '/opt/homebrew/sbin'
    '/Users/ryanlueder/.cargo/bin'
]

$env.PATH = ($user_paths | append $env.PATH | uniq)

const LIB_PATH = ($nu.config-path | path dirname | path join 'modules')
source ($LIB_PATH | path join 'conda.nu')
source ($LIB_PATH | path join 'starship.nu')

$env.EDITOR = 'nvim'
