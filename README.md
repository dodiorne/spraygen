# Spraygen

Spraygen is a modernized password generation utility designed for offensive security assessments, red-team operations, and audit readiness workflows. This enhanced fork updates the original project with a modern Python package structure, improved installation methods, and full compatibility with Kali Linux.

Spraygen is a password **generation** tool only. It does not perform password spraying or authentication attempts.

---

## Features

- Generates password candidates from base words.
- Supports year and season-based variations.
- Optional special character combinations.
- CLI-friendly and pipeline-safe output.
- Modern Python packaging (`pip install`, `pipx install`).
- Kali-compatible installer using a virtual environment.

---

## Installation

Spraygen can be installed in several ways depending on your environment.

---

### Installer Script (recommended for Kali Linux)

```bash
curl -s https://raw.githubusercontent.com/dodiorne/spraygen/main/install/installer.sh -o installer.sh
chmod +x installer.sh
./installer.sh
```
#### After Installation

```bash
spraygen --help
```
### Install with pipx

```bash
Install with pipx
```
### Local Development Installation
```
git clone https://github.com/dodiorne/spraygen.git
cd spraygen
pip install .
```
### Contributing

Pull requests are welcome. Areas of improvement include:

Expanded generation patterns.

Wordlist handling.

Template-based password creation.

Entropy scoring.

JSON/CSV output modes.

Unit tests and CI enhancements.

Submit pull requests here:

https://github.com/dodiorne/spraygen/pulls

### Security Notice

Spraygen is intended for authorized testing and audit support only. Unauthorized use is prohibited.

### Acknowledgments

Original author: 3ndG4me

Modernization and ongoing development: Derek Odiorne

Repository: https://github.com/dodiorne/spraygen


