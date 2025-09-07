# ILM Template Development Tasks

# Default recipe to display available commands
default:
    @just --list

# Compile the main example template
build:
    typst compile --root . template/main.typ

# Compile the Chinese example template
build-chinese:
    typst compile --root . template/chinese-example.typ

# Compile both example templates
build-all: build build-chinese

# Watch and auto-compile the main template
watch:
    typst watch --root . template/main.typ

# Watch and auto-compile the Chinese template
watch-chinese:
    typst watch --root . template/chinese-example.typ

# Clean generated PDF files
clean:
    rm -f template/*.pdf
    rm -f *.pdf

# Check template syntax without generating PDF
check:
    typst compile --root . template/main.typ --output /dev/null

# Check Chinese template syntax
check-chinese:
    typst compile --root . template/chinese-example.typ --output /dev/null

# Run all checks
check-all: check check-chinese

# Format Typst files (if typstyle is available)
format:
    #!/usr/bin/env bash
    if command -v typstyle >/dev/null 2>&1; then
        find . -name "*.typ" -exec typstyle {} \;
        echo "Formatted all .typ files"
    else
        echo "typstyle not found. Install with: cargo install typstyle"
    fi

# Initialize a new document from template
init NAME:
    mkdir -p {{NAME}}
    cp template/main.typ {{NAME}}/main.typ
    cp template/refs.bib {{NAME}}/refs.bib
    sed -i 's/The Beauty of\\ Sharing Knowledge/{{NAME}}/g' {{NAME}}/main.typ
    sed -i 's/Max Mustermann/Author Name/g' {{NAME}}/main.typ
    echo "Created new document in {{NAME}}/"

# Initialize a Chinese document from template
init-chinese NAME:
    mkdir -p {{NAME}}
    cp template/chinese-example.typ {{NAME}}/main.typ
    cp template/refs.bib {{NAME}}/refs.bib
    sed -i 's/中文文档模板示例/{{NAME}}/g' {{NAME}}/main.typ
    sed -i 's/张三/作者姓名/g' {{NAME}}/main.typ
    echo "Created new Chinese document in {{NAME}}/"

# Show available fonts on the system
fonts:
    #!/usr/bin/env bash
    echo "Checking for Chinese fonts..."
    if command -v fc-list >/dev/null 2>&1; then
        echo "=== Song/Serif Fonts ==="
        fc-list | grep -i -E "(song|serif|simsun|times)" | head -10
        echo "=== Sans/Hei Fonts ==="
        fc-list | grep -i -E "(sans|hei|simhei|arial)" | head -10
        echo "=== Monospace Fonts ==="
        fc-list | grep -i -E "(mono|courier)" | head -10
    else
        echo "fc-list not available. On Ubuntu/Debian: sudo apt install fontconfig"
    fi

# Install recommended Chinese fonts (Ubuntu/Debian)
install-fonts:
    #!/usr/bin/env bash
    echo "Installing recommended Chinese fonts..."
    if command -v apt >/dev/null 2>&1; then
        sudo apt update
        sudo apt install -y fonts-noto-cjk fonts-noto-cjk-extra
        echo "Installed Noto CJK fonts"
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y google-noto-cjk-fonts
        echo "Installed Noto CJK fonts"
    else
        echo "Please install Chinese fonts manually:"
        echo "- Noto CJK fonts: https://github.com/googlefonts/noto-cjk"
        echo "- Source Han fonts: https://github.com/adobe-fonts/source-han-serif"
    fi

# Run git add and commit with conventional message
gac MESSAGE:
    git add .
    git commit -m "{{MESSAGE}}"

# Release workflow - bump version and tag
release VERSION:
    #!/usr/bin/env bash
    echo "Preparing release {{VERSION}}"
    # Update version in typst.toml if it exists
    if [ -f "typst.toml" ]; then
        sed -i 's/version = .*/version = "{{VERSION}}"/' typst.toml
        git add typst.toml
    fi
    git commit -m "chore: bump version to {{VERSION}}"
    git tag -a "v{{VERSION}}" -m "Release v{{VERSION}}"
    echo "Created release v{{VERSION}}. Push with: git push && git push --tags"

# Development server (if using a web preview)
serve PORT="8000":
    #!/usr/bin/env bash
    if command -v python3 >/dev/null 2>&1; then
        echo "Starting development server at http://localhost:{{PORT}}"
        python3 -m http.server {{PORT}}
    elif command -v python >/dev/null 2>&1; then
        echo "Starting development server at http://localhost:{{PORT}}"
        python -m http.server {{PORT}}
    else
        echo "Python not found. Cannot start development server."
    fi