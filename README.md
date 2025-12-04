Spraygen

Advanced Password Generation Utility for Offensive Security, Red Teams, and Audit Readiness

Spraygen is a modernized password generation tool designed to support offensive security assessments, red-team operations, and audit readiness workflows. It produces realistic, policy-aware password candidates based on common enterprise patterns, customizable templates, and controlled randomness.

Originally created by 3ndG4me, this enhanced version—maintained at github.com/dodiorne/spraygen—includes a fully updated project structure, packaging improvements, and a Kali-compliant installer.

Spraygen is not a password spraying or authentication attack tool.
It is strictly a password generator.

Features

Generates password candidates using:

Base words

Years and season-based patterns

Custom suffixes, prefixes, and special characters

Realistic enterprise password behaviors

CLI-friendly output for use in pipelines

Modern Python project structure (pip install, pipx install, installer support)

Kali Linux compatible (PEP 668 safe)

Lightweight and dependency-minimal

Installation

Spraygen supports multiple installation paths depending on your environment.

Option 1: Installer Script (Recommended for Kali Linux)

The installer provides a fully isolated, virtual-environment-based installation that avoids Kali’s PEP 668 restrictions.

Run:

curl -s https://raw.githubusercontent.com/dodiorne/spraygen/main/install/installer.sh -o installer.sh
chmod +x installer.sh
./installer.sh


Once installed:

spraygen --help

Option 2: pipx Installation

If pipx is installed:

pipx install git+https://github.com/dodiorne/spraygen.git

Option 3: Local Development Installation
git clone https://github.com/dodiorne/spraygen.git
cd spraygen
pip install .

Usage

Spraygen v2 will expand capabilities significantly.
Current CLI entrypoint:

spraygen


Example usage for upcoming features (placeholder):

spraygen --words words.txt --years 2020-2025 --specials "!@#" --output passwords.txt


Pipeline example:

spraygen | sort -u | tee generated.txt

Project Structure
spraygen/
    generator.py
    __init__.py
install/
    installer.sh
tests/
pyproject.toml
requirements.txt
README.md

Development

Clone the repository:

git clone https://github.com/dodiorne/spraygen.git
cd spraygen


Install for development:

pip install -e .


Run:

spraygen

Contributing

Contributions are welcome. Potential improvement areas:

Extended password generation logic

Improved argument parsing and CLI options

Template-based password construction

Wordlist integration

Entropy scoring and classification

JSON/CSV output modes

Unit tests

Packaging and CI improvements

Submit pull requests at:

https://github.com/dodiorne/spraygen/pulls

Roadmap
v2.0.x

Argument parsing with argparse

Wordlist support (--words)

Leetspeak transformations (--leet)

Password policy modeling

Season and year combinations

Output file support (--output)

Pipeline-friendly output

Entropy scoring

v2.1+

Template engine (e.g., {word}{year}{special})

Markov chain generation

Business-relevance modeling

Modular generator plugins

Security Notice

Spraygen generates password candidates for legitimate security assessments, audits, and authorized testing.
Unauthorized use is strictly prohibited.

License

See the LICENSE file in the repository.

Acknowledgments

Original author: 3ndG4me

Modernization, enhancements, and ongoing development: Derek Odiorne / iFlock Security Consulting

Repository: https://github.com/dodiorne/spraygen
