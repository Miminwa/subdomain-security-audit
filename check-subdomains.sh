#!/bin/bash

# ===== CONFIG =====

SUBDOMAINS_FILE="subdomains.txt"

# Known Cloudflare IP ranges 
CLOUDFLARE_RANGES=("104." "172." "2606.")

# ===== SCRIPT =====
echo "🔍 Checking subdomains for non-Cloudflare IPs..."
echo ""

while read -r sub; do
    if [[ -z "$sub" ]]; then continue; fi

    ip_list=$(dig +short "$sub" | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}')

    if [[ -z "$ip_list" ]]; then
        echo "❓ $sub --> No IP resolved"
    else
        for ip in $ip_list; do
            is_cf=false
            for range in "${CLOUDFLARE_RANGES[@]}"; do
                if [[ $ip == $range* ]]; then
                    is_cf=true
                    break
                fi
            done

            if $is_cf; then
                echo "✅ $sub --> $ip (Cloudflare)"
            else
                echo "🚨 $sub --> $ip (⚠️ POSSIBLE ORIGIN IP LEAK)"
            fi
        done
    fi
done < "$SUBDOMAINS_FILE"
