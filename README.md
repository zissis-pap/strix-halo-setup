# Strix Halo Setup

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![AMD Ryzen AI Max](https://img.shields.io/badge/AMD_Ryzen_AI_Max-ED1C24?logo=amd&logoColor=white)](https://www.amd.com/en/products/processors/laptop/ryzen/ai-300-series/amd-ryzen-ai-max-plus-395.html)
[![CachyOS](https://img.shields.io/badge/CachyOS-007ACC?logo=cachyos&logoColor=white)](https://cachyos.org/)
[![Bash](https://img.shields.io/badge/Bash-4.4+-blue.svg)](https://www.gnu.org/software/bash/)
[![Limine](https://img.shields.io/badge/Limine-FF5722?logo=github&logoColor=white)](https://github.com/limine-bootloader/limine)

## Description

Automates the configuration of AMD GPU kernel parameters for the AMD Strix Halo APUs with 128GB Unified RAM. Appends essential IOMMU and AMDGPU flags to all `cmdline:` entries in `/boot/limine.conf`.

## Features

- ✅ Creates automatic backup before modifications
- ✅ Validates root privileges and configuration file existence
- ✅ Detects if flags are already present (with confirmation prompt)
- ✅ Appends IOMMU and AMDGPU parameters to all cmdline entries
- ✅ Displays updated configuration after modification

## Requirements

- Linux system with Limine bootloader - tested on CachyOS
- Root access (`sudo` or `root` user)
- Bash 4.4+
- `sed` and `grep` utilities

## Technologies

![Bash](https://img.shields.io/badge/-Bash-4EAA43?logo=gnu-bash&logoColor=white)
![POSIX](https://img.shields.io/badge/-POSIX-FFFFFF?logo=linux&logoColor=black)
![Limine](https://img.shields.io/badge/-Limine-FF5722?logo=github&logoColor=white)

## Installation

```bash
git clone https://github.com/yourusername/strix_halo_setup.git
cd strix_halo_setup
chmod +x strix_halo_setup.sh
```

## Usage

Run as root:

```bash
sudo ./strix_halo_setup.sh
```

### Flags Appended

```
iommu=pt amdgpu.gttsize=126976 ttm.pages_limit=32505856
```

### Backup

A backup of the original configuration is automatically saved as:
```
/boot/limine.conf.bak.YYYYMMDD_HHMMSS
```

## License

MIT License - See [LICENSE](LICENSE) for details.
