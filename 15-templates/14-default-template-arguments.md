# Default Template Arguments

Template parameters can have default values.

## Class template

```cpp
template <typename T, typename U = int>
struct Pair
{
    T first;
    U second;
};
```

Usage:

```cpp
Pair<double> p; // U = int
```

Or:

```cpp
Pair<double, long> p;
```

## Function template

Function templates can also have default template arguments:

```cpp
template <typename T = int>
void process(T value)
{
}
```

```cpp
process(10);
process<double>(2.5);
```

## Template parameter ordering

For class templates, once a template parameter has a default, parameters to its right generally also need defaults.

```cpp
template <typename T, typename U = int>
struct Pair;
```

is valid.

## Default template argument vs default function argument

They are different:

```cpp
template <typename T = int>
void process(T value);
```

`T = int` is a **template default**.

```cpp
void process(int value = 10);
```

`10` is a **function default argument**.

## Interview point

Template defaults are useful for reducing verbosity while still allowing customization.
