# Multiple Template Parameters

A template can have multiple type parameters.

```cpp
template <typename T, typename U>
auto add(T a, U b)
{
    return a + b;
}
```

Usage:

```cpp
add(10, 2.5);
```

Possible deduction:

```text
T = int
U = double
```

## Multiple type parameters

```cpp
template <typename Key, typename Value>
struct Pair
{
    Key key;
    Value value;
};
```

## Mixed template parameters

A template can combine type and non-type parameters:

```cpp
template <typename T, std::size_t N>
struct Array
{
    T data[N];
};
```

## Default template parameters

```cpp
template <typename T, typename U = int>
struct Pair
{
};
```

Then:

```cpp
Pair<double> p;
```

uses `U = int`.

## Parameter ordering

Template parameters can have different categories:

```cpp
template <typename T, std::size_t N>
void process(T (&array)[N])
{
}
```

The compiler can deduce both from an array argument.

## Interview point

Be comfortable reading templates such as:

```cpp
template <typename T, typename U, std::size_t N>
```

and identifying:

- type parameters
- non-type parameters
- which arguments are deduced
- which have defaults
