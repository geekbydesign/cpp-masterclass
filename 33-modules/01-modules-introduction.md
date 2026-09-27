# Modules Introduction

C++20 modules provide a language-level mechanism for organizing and importing code.

Traditional C++ commonly uses:

```cpp
#include "math.h"
```

Modules use:

```cpp
import math;
```

## Why Modules?

Modules can improve:
- Compilation scalability.
- Dependency management.
- Encapsulation.
- Build-system structure.
- Separation between exported and non-exported implementation details.

## Header Model vs Module Model

### Headers

```text
source.cpp
   ↓
#include
   ↓
header text is included
   ↓
preprocessor
```

### Modules

```text
source.cpp
   ↓
import module
   ↓
compiled module interface
```

A module is not simply a header with a different extension.

## Key Concepts

Important C++20 module terms:

- Module interface unit.
- Module implementation unit.
- `export`.
- `import`.
- Module partitions.
- Global module fragment.
- Private module fragment.
- Module ownership.
- Reachability.

## Important

Compiler and build-system support for modules varies by compiler/version, so practical setup details are toolchain-specific.
