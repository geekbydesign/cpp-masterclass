# `export`

`export` controls which declarations are made available to importers.

## Export a Declaration

```cpp
export module math;

export int add(int a, int b);
```

## Export a Definition

```cpp
export module math;

export int add(int a, int b)
{
    return a + b;
}
```

## Export Block

Multiple declarations can be exported together:

```cpp
export {
    int add(int, int);
    int subtract(int, int);
}
```

## Exporting a Class

```cpp
export class Calculator {
public:
    int add(int a, int b);
};
```

## Non-Exported Implementation

```cpp
export module math;

int helper(int x)
{
    return x * 2;
}

export int calculate(int x)
{
    return helper(x);
}
```

Importers can use `calculate()` but cannot directly use `helper()` merely because it exists in the module.

## Key Point

Think of `export` as defining the module's public interface.
