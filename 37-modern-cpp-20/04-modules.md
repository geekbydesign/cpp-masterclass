# Modules

C++20 introduced the C++ modules language feature for organizing and importing code without relying solely on textual header inclusion.

## Module Interface

```cpp
export module math;

export int add(int a, int b)
{
    return a + b;
}
```

## Import

```cpp
import math;

int result = add(1, 2);
```

## Export

Only exported declarations are part of the module's public interface:

```cpp
export module math;

int helper();

export int calculate(int x);
```

## Partitions

Large modules can be divided into partitions:

```cpp
export module math:geometry;
```

A primary module interface can re-export a partition:

```cpp
export module math;

export import :geometry;
```

## Module vs Header

```text
#include
→ textual preprocessing/inclusion

import
→ module dependency/interface mechanism
```

Modules can improve dependency management and encapsulation.

## Implementation Units

A module can have implementation units:

```cpp
module math;
```

These can contain implementation details for the named module.

## Important

Compiler and build-system support for modules varies by toolchain, so practical module setup is compiler/build-system dependent.

## Interview Point

Know the core vocabulary:

```text
module interface
export
import
module implementation unit
module partition
reachability
```
