> [!WARNING]  
> Under construction. If you're here to make mods, move along.

# Glintscript 💎

Glintscript is a Lua-based scripting platform for modding ELDEN RING. It aims to be the environment for custom runtime scripting that's missing from the FromSoftware engine. It's mainly intended to replace the [HKS script extender](https://github.com/ElaDiDu/Scripts-Data-Exposer-FS), and may also be an easier alternative to writing custom DLLs or cheat tables, or a more powerful alternative to the built-in EMEVD event scripting system.

## Usage

1. Add `glintscript-er.dll` as a DLL using me3
2. Add a mod folder (e.g. `mod`) as a package using me3
3. Create Glintscript files ending in `.glint.lua` in the `script\glint\` subdirectory of your mod folder

You can also have other `.lua` files for shared helper functions and constants, but only files named with a `.glint.lua` will be executed automatically.

### Basic setup

Example folder layout:

```
📁 MyModFolder
├--📄 profile.me3
├--📁 dlls
│  └──📄 glintscript.dll
└--📁 mod
   └──📁 script
      └──📁 glint
         └--📄 hello.glint.lua
```

## Prior art

- [Frida](https://frida.re/) - reverse engineering toolkit that inspired the low-level memory access API
- [Scripts-Data-Exposer-FS](https://github.com/ElaDiDu/Scripts-Data-Exposer-FS) - previous ELDEN RING script exposer implementation
