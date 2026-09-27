# Lambda Syntax

## General syntax

```cpp
[capture](parameters) -> return_type
{
    // body
}
```

Example:

```cpp
auto add = [](int a, int b) -> int
{
    return a + b;
};
```

## Components

### Capture list

```cpp
[...]
```

Specifies which surrounding variables the lambda can access.

### Parameters

```cpp
(int a, int b)
```

Works similarly to normal function parameters.

### Return type

```cpp
-> int
```

Usually optional because the compiler can deduce it.

### Body

```cpp
{
    return a + b;
}
```

Contains the lambda implementation.

## Empty capture list

```cpp
[]()
{
    std::cout << "Hello";
};
```

An empty capture list means the lambda does not capture local variables.

## Calling immediately

A lambda can be invoked immediately:

```cpp
int result = [](int x)
{
    return x * 2;
}(5);
```

## `mutable`

A lambda that captures by value cannot normally modify its captured copy:

```cpp
int x = 10;

auto f = [x]() mutable
{
    ++x;
};
```

`mutable` allows modification of the lambda's internal copy.

## Explicit return type

Useful when return expressions have different types or when clarity is desired:

```cpp
auto convert = [](double value) -> int
{
    return static_cast<int>(value);
};
```

## Interview checklist

Know:

- `[]`
- parameters
- optional `-> return_type`
- lambda body
- `mutable`
- capture list
