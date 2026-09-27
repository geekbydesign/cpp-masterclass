# Submodules

C++ does not use a separate language construct called a traditional "submodule" in the same sense as some other languages.

The C++ module mechanism uses **module partitions** to divide a named module.

Example:

```cpp
export module graphics;

export import :shapes;
export import :rendering;
```

Partitions:

```cpp
export module graphics:shapes;
```

```cpp
export module graphics:rendering;
```

## Naming

```text
graphics
graphics:shapes
graphics:rendering
```

The colon identifies a module partition.

## Why Use Partitions?

They allow a large module to be organized into logical pieces while retaining a single named module from the user's perspective.

## Important

Do not think of:

```text
graphics:shapes
```

as a completely independent top-level module. It is a partition of `graphics`.
