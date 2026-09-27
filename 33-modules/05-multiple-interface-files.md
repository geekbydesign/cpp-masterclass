# Multiple Interface Files

A module can be organized using multiple interface units through module partitions.

A primary module interface might contain:

```cpp
export module math;

export import :addition;
export import :subtraction;
```

The partition interfaces can contain:

```cpp
export module math:addition;

export int add(int a, int b);
```

and:

```cpp
export module math:subtraction;

export int subtract(int a, int b);
```

The primary interface re-exports the partition interfaces.

## Consumer

```cpp
import math;

add(1, 2);
subtract(5, 2);
```

## Why?

Large modules can be split into logical interface components without exposing each partition directly to every user.

## Important

These are not independent top-level modules. They are partitions belonging to the named module.
