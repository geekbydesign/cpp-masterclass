# Template Parameters by Reference

Templates can accept arguments by reference, preserving properties that pass-by-value deduction may remove.

## `T&`

```cpp
template <typename T>
void process(T& value)
{
}
```

Example:

```cpp
int x = 10;
process(x); // T = int
```

For a const object:

```cpp
const int x = 10;
process(x); // T = const int
```

## `const T&`

```cpp
template <typename T>
void process(const T& value)
{
}
```

This can accept both const and non-const arguments without copying.

```cpp
int x = 10;
const int y = 20;

process(x);
process(y);
```

For both calls, `T` can be deduced as `int`.

## Arrays

Reference parameters prevent array-to-pointer decay:

```cpp
template <typename T, std::size_t N>
void print(T (&array)[N])
{
    // N is the number of elements
}
```

```cpp
int values[5];

print(values);
```

## Why this matters

Compare:

```cpp
template <typename T>
void f(T value);
```

with:

```cpp
template <typename T>
void f(T& value);
```

The first receives a value and usually loses top-level cv/reference information during deduction. The second preserves reference binding and can preserve cv-qualification.

## Interview point

Reference parameters are especially useful for:

- avoiding copies
- preserving arrays
- preserving constness
- writing generic modifying functions
