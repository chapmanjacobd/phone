# Defined via `source`
function key-refresh-ssh --argument label
    set oldkey (mktemp --tmpdir=(path resolve ~/.ssh/old/) id_ed25519_XXXXX)
    mv ~/.ssh/id_ed25519 $oldkey
    mv ~/.ssh/id_ed25519.pub $oldkey.pub

    ssh-keygen -t ed25519 -C $label -q -N '' </dev/zero || true

    ssh-copy-id -f -i ~/.ssh/id_ed25519.pub -o "IdentityFile "$oldkey pakon
    and ssh pakon filterfile ~/.ssh/authorized_keys (cat $oldkey.pub)
    cat ~/.ssh/id_ed25519.pub
end
