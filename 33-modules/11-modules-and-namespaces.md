# Modules and Namespaces

Modules and namespaces solve different problems.

## Namespace

A namespace organizes names:

```cpp
namespace graphics {
    class Renderer {};
}
```

Use:

```cpp
graphics::Renderer r;
```

## Module

A module organizes and controls code at the compilation/interface level:

```cpp
export module graphics;
```

## They Can Be Combined

```cpp
export module graphics;

export namespace graphics {
    class Renderer {};
}
```

Then:

```cpp
import graphics;

graphics::Renderer r;
```

## Difference

| Namespace | Module |
|---|---|
| Organizes names | Organizes/compiles program units |
| Prevents name collisions | Controls module interface/dependencies |
| Language scope mechanism | Compilation/dependency mechanism |

## Important

A module does not replace namespaces. Large programs commonly use both.
