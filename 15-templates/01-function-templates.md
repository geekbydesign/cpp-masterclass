# Function Templates

Function templates let you write one function that works with multiple types.

```cpp
template <typename T>
T maximum(T a, T b)
{
    return (a > b) ? a : b;
}
```

Usage:

```cpp
maximum(10, 20);       // T = int
maximum(2.5, 1.5);     // T = double
```

## `typename` vs `class`

Both are valid in a template parameter declaration:

```cpp
template <typename T>
```

```cpp
template <class T>
```

For type template parameters, they are equivalent.

## Template instantiation

The compiler generates a specialization when the template is used with a particular type.

```cpp
maximum<int>(10, 20);
maximum<double>(2.5, 1.5);
```

Conceptually:

```text
function template
      ↓
T = int
      ↓
int specialization
```

## Multiple types

```cpp
template <typename T, typename U>
auto add(T a, U b)
{
    return a + b;
}
```

## Key points

- Templates provide compile-time generic programming.
- A function template is not itself a normal function.
- The compiler creates specializations for the types used.
- Type deduction often lets you omit template arguments.
