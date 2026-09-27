# Module Interface and Implementation

A module can separate its public interface from implementation details.

## Interface Unit

```cpp
export module math;

export int add(int a, int b);
```

## Implementation Unit

```cpp
module math;

int add(int a, int b)
{
    return a + b;
}
```

The implementation unit belongs to the named module but does not itself provide the primary exported interface.

## Consumer

```cpp
import math;

int main()
{
    return add(1, 2);
}
```

## Why Separate?

This can provide:
- Cleaner public interfaces.
- Better encapsulation.
- Reduced exposure of implementation details.
- A structure similar to interface/implementation separation.

## Important

A module implementation unit begins with:

```cpp
module math;
```

rather than:

```cpp
export module math;
```

The exact organization and build process depend on the compiler/build system.
