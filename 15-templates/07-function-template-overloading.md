# Function Template Overloading

Multiple function templates can have different parameter patterns.

```cpp
template <typename T>
void process(T value)
{
}

template <typename T>
void process(T* value)
{
}
```

Calls:

```cpp
int x = 10;

process(x);   // first
process(&x);  // pointer overload
```

## Different parameter counts

```cpp
template <typename T>
void print(T value)
{
}

template <typename T, typename U>
void print(T first, U second)
{
}
```

## Non-template overloads

A non-template function can compete with a function template:

```cpp
void process(int value)
{
}

template <typename T>
void process(T value)
{
}
```

For an exact match, the non-template overload can be preferred when otherwise equivalent.

## Overload resolution

The compiler considers:

- viable candidates
- conversions
- template deduction
- specialization/ordering rules
- partial ordering of function templates

## Common pattern

```cpp
template <typename T>
void process(T value)
{
    // generic
}

template <typename T>
void process(T* value)
{
    // pointer-specific
}
```

This is often preferable to trying to partially specialize a function template.

## Interview point

Function-template overloading is different from template specialization. Overloading creates separate overload candidates; specialization customizes a template for specific arguments.
