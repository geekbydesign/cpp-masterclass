# Multiple Implementation Files

A module can have multiple implementation units.

For example:

```cpp
module math;

int add(int a, int b)
{
    return a + b;
}
```

and another implementation unit:

```cpp
module math;

int subtract(int a, int b)
{
    return a - b;
}
```

Both belong to the same named module.

## Why Split Implementation?

Useful for:
- Large modules.
- Separating components.
- Improving source organization.
- Keeping implementation files manageable.

## Interface vs Implementation

```text
module interface
      ↓
public API
      ↓
implementation units
      ↓
private implementation
```

## Important

Implementation units do not replace the module interface. Importers need the module's reachable interface declarations to use its exported API.
