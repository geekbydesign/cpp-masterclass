# Function Declarations and Definitions

## Declaration

A declaration tells the compiler that a function exists:

```cpp
int add(int, int);
```

## Definition

The definition provides the implementation:

```cpp
int add(int a, int b)
{
    return a + b;
}
```

The declaration can be placed in a header:

```cpp
// math.h
int add(int, int);
```

and the definition in a source file:

```cpp
// math.cpp
int add(int a, int b)
{
    return a + b;
}
```

A function must be declared before it is used.

**Interview:** Declaration != definition. Headers commonly contain declarations; `.cpp` files commonly contain definitions.
