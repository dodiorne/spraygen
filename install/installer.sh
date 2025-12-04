#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/dodiorne/spraygen.git"
INSTALL_DIR="$HOME/spraygen"
VENV_DIR="$INSTALL_DIR/venv"
LAUNCHER="/usr/local/bin/spraygen"

echo "[+] Preparing Spraygen installation..."

# Ensure dependencies exist
sudo apt update -y
sudo apt install -y python3-venv git

# Clone or update repo
if [ ! -d "$INSTALL_DIR" ]; then
    echo "[+] Cloning repository..."
    git clone "$REPO_URL" "$INSTALL_DIR"
else
    echo "[+] Updating repository..."
    (cd "$INSTALL_DIR" && git pull)
fi

# Create virtual environment
echo "[+] Creating virtual environment..."
python3 -m venv "$VENV_DIR"

source "$VENV_DIR/bin/activate"

echo "[+] Upgrading pip, setuptools, wheel..."
pip install --upgrade pip setuptools wheel

echo "[+] Installing Python dependencies..."
pip install -r "$INSTALL_DIR/requirements.txt"

echo "[+] Installing Spraygen package..."
pip install "$INSTALL_DIR"

deactivate

# Create launcher
echo "[+] Creating Spraygen launcher at $LAUNCHER ..."
sudo bash -c "cat > $LAUNCHER" <<EOF
#!/usr/bin/env bash
source "$VENV_DIR/bin/activate"
spraygen "\$@"
EOF

sudo chmod +x "$LAUNCHER"

echo ""
echo "[+] Spraygen installation complete."
echo "[+] Run using: spraygen --help"
echo ""
