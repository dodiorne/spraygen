#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/dodiorne/spraygen.git"
INSTALL_DIR="$HOME/spraygen"
VENV_DIR="$INSTALL_DIR/venv"
LAUNCHER="/usr/local/bin/spraygen"

echo "[+] Preparing Spraygen installation..."

sudo apt install -y python3-venv git

if [ ! -d "$INSTALL_DIR" ]; then
    git clone "$REPO_URL" "$INSTALL_DIR"
else
    (cd "$INSTALL_DIR" && git pull)
fi

python3 -m venv "$VENV_DIR"

source "$VENV_DIR/bin/activate"

pip install --upgrade pip setuptools wheel
pip install "$INSTALL_DIR"

deactivate

sudo bash -c "cat > $LAUNCHER" <<EOF
#!/usr/bin/env bash
source "$VENV_DIR/bin/activate"
spraygen "\$@"
EOF

sudo chmod +x "$LAUNCHER"

echo "[+] Installation complete."
echo "[+] Run Spraygen using: spraygen"

