# Solar2D-EmmyLua-Bindings
A repo to with Solar2D to EmmyLua Bindings as well as a script to generate them

To create the bindings, run:
```bash
python generate_solar2d_annotations.py
```

## Installation

1. Copy the solar2d-emmylua folder to your project root or a library path
2. Configure your Lua Language Server to recognize these files

### For lua-language-server (VS Code, NeoVim, etc.)

Add to your `.luarc.json` or settings:

```json
{
  "Lua.workspace.library": [
    "path/to/solar2d-emmylua"
  ]
}
```

### For IntelliJ IDEA with EmmyLua

1. Mark this directory as a "Library Root" in Project Structure
2. Or place in your project root - EmmyLua will auto-detect `---@meta` files

## Documentation

For complete API documentation, see: https://docs.coronalabs.com/api/