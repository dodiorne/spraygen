📘 Spraygen
Advanced Password Generation Utility for Offensive Security, Red Teams, and Audit Readiness

Spraygen is a modernized password generation tool designed to support offensive security assessments, red-team operations, and audit readiness workflows. It produces realistic, policy-aware password candidates based on common enterprise patterns, customizable templates, and controlled randomness.

Originally created by 3ndG4me, this enhanced version—maintained at github.com/dodiorne/spraygen—includes a fully updated project structure, installer, packaging improvements, and support for modern Python environments.

Spraygen is not a password spraying or authentication attack tool.
It is strictly a password generator.

🔧 Features

Generates password candidates using:

Base words

Years & seasons

Customizable suffixes, prefixes, and special characters

Human-realistic patterns

Supports future template-based generation (e.g., {word}{year}{special})

CLI-friendly output for use in pipelines

Clean Python package layout (pip install, pipx install, or installer script)

Kali Linux–compatible (PEP 668 safe)

Lightweight and dependency-free by design

📦 Installation Options

Spraygen supports multiple installation paths depending on your environment.

Option 1 — Installer Script (Recommended for Kali)

Kali Linux blocks system-wide pip installs by default (PEP 668).
The installer provides a fully isolated, virtual-environment-based installation.

curl -s https://raw.githubusercontent.com/dodiorne/spraygen/main/install/installer.sh -o installer.sh
chmod +x installer.sh
./installer.sh


Once installed, run:

spraygen --help

Option 2 — pipx Installation

If pipx is available:

pipx install git+https://github.com/dodiorne/spraygen.git

Option 3 — Local Development Install
git clone https://github.com/dodiorne/spraygen.git
cd spraygen
pip install .

▶️ Usage

Spraygen will evolve to support extended flags in Spraygen v2.
The current CLI provides a standardized entrypoint:

spraygen


Example usage for future enhancements (placeholder):

spraygen --words words.txt --years 2020-2025 --specials "!@#" --output passwords.txt


Output can be piped into other tools:

spraygen | sort -u | tee gen.txt

🗂 Project Structure
spraygen/
    generator.py        # Core logic
    __init__.py
install/
    installer.sh        # Virtualenv-based installer
tests/
pyproject.toml          # Modern Python build format
requirements.txt
README.md

🧪 Development

Clone your fork:

git clone https://github.com/dodiorne/spraygen.git
cd spraygen


Install locally:

pip install -e .


Run generator:

spraygen

🤝 Contributing

Contributions are welcome. The most valuable additions include:

Parameterized password generation logic

Additional pattern libraries

Template-based model (e.g., {{word}}{{year}}{{special}})

Entropy scoring

JSON/CSV export options

Unit tests for reproducibility

Packaging and CI improvements

Submit pull requests to:

https://github.com/dodiorne/spraygen/pulls

🛣 Roadmap
v2.0.x

Full argparse-driven CLI

Wordlist support (--words)

Leetspeak transformations (--leet)

Enterprise password policy modeling

Season-based mutations (Winter2024!)

Output file support (--output file.txt)

Pipeline-friendly modes

Entropy scoring and strength classification

v2.1+

Template engine for custom password formats

Markov chain–based generation modes

“Business realism” modeling using company themes

Pluggable generator modules

🔒 Security Notice

Spraygen generates password candidates for legitimate security assessments, audit readiness, and internal red-team operations.
It must only be used with explicit authorization.

iFlock Security Consulting does not endorse unauthorized access or misuse of this tool.

📄 License

Spraygen retains the open-source license structure of the original project.
See: LICENSE in the repository.

⭐ Acknowledgements

Original tool by: 3ndG4me
Modernization, enhancements, installer, and ongoing development by:
Derek Odiorne / iFlock Security Consulting
https://github.com/dodiorne/spraygen
