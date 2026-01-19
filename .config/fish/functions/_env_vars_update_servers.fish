# Defined interactively
function _env_vars_update_servers --on-variable servers_local --on-variable servers_remote
    set -Ux servers $servers_local $servers_remote
end
