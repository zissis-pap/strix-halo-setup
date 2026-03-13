#!/usr/bin/env bash
# limine-append-flags.sh
# Appends iommu and AMDGPU flags to every cmdline: entry in /boot/limine.conf

set -euo pipefail

CONF="/boot/limine.conf"
FLAGS="iommu=pt amdgpu.gttsize=126976 ttm.pages_limit=32505856"
#FLAGS="amd_iommu=off amdgpu.gttsize=126976 ttm.pages_limit=32505856"

# --- checks ---
if [[ $EUID -ne 0 ]]; then
    echo "Error: this script must be run as root." >&2
    exit 1
fi

if [[ ! -f "$CONF" ]]; then
    echo "Error: $CONF not found." >&2
    exit 1
fi

# --- backup ---
BACKUP="${CONF}.bak.$(date +%Y%m%d_%H%M%S)"
cp "$CONF" "$BACKUP"
echo "Backup saved to $BACKUP"

# --- check if flags are already present ---
if grep -qP "^\s*cmdline:.*iommu=pt" "$CONF"; then
    echo "Warning: flags appear to already be present in one or more cmdline entries."
    read -rp "Append anyway? [y/N] " answer
    [[ "${answer,,}" == "y" ]] || { echo "Aborted."; exit 0; }
fi

# --- apply ---
MATCHES=$(grep -c "^\s*cmdline:" "$CONF" || true)
sed -i "/^\s*cmdline:/ s|\$| ${FLAGS}|" "$CONF"

echo "Done. Appended flags to ${MATCHES} cmdline entry/entries."
echo ""
echo "Updated cmdline lines:"
grep "cmdline:" "$CONF"