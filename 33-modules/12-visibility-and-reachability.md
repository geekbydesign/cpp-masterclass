# Visibility and Reachability

Modules introduce concepts beyond traditional textual inclusion, including **reachability**.

A declaration can exist in a module implementation without being part of the interface available to importers.

Example:

```cpp
export module math;

int helper()
{
    return 42;
}

export int calculate()
{
    return helper();
}
```

An importer can use:

```cpp
calculate();
```

but cannot simply use:

```cpp
helper();
```

because `helper` was not exported as part of the module interface.

## Visibility vs Reachability

Traditional C++ discussions often focus on whether a declaration is visible in a translation unit.

Modules add rules around whether declarations are **reachable** through module imports and exported interfaces.

## Exported API

```text
module
 ├── exported declarations
 │       ↓
 │   reachable by importers
 │
 └── non-exported implementation
         ↓
      internal
```

## Important

Do not assume that because code exists in a module's source files, importers can name it. Export and module reachability determine what is available through the module interface.
