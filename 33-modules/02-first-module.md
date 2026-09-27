# First Module

A simple module interface can be written as:

```cpp
export module math;

export int add(int a, int b)
{
    return a + b;
}
```

A source file can import it:

```cpp
import math;

int main()
{
    return add(2, 3);
}
```

## Structure

```text
math module interface
        ↓
      export
        ↓
   add() becomes
   available to importers
```

## Module Declaration

```cpp
export module math;
```

This identifies the module interface unit and gives the module its name.

## Exported vs Non-Exported

```cpp
export module math;

int helper()
{
    return 10;
}

export int add(int a, int b)
{
    return helper() + a + b;
}
```

`helper()` is not exported, while `add()` is.

## Important

A module interface is compiled separately from importing source files. It is not textually pasted into each importer like a traditional header.
