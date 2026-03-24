# Security baseline

- Telemetry-by-default packages are blocked by `spacman`
- AppArmor enabled by default
- DNS over encrypted resolvers via dnscrypt-proxy
- Optional kill-switch through nftables strict mode
- ClamAV available on-demand (`clamscan`, `freshclam`)
