# Structured Bindings

C++17 introduced structured bindings for unpacking multiple values into named variables.

## Basic Example

```cpp
std::pair<int, std::string> data{42, "hello"};

auto [number, text] = data;
```

Now:

```cpp
number // 42
text   // "hello"
```

## References

Use `auto&` to refer to the original elements:

```cpp
std::pair<int, int> point{10, 20};

auto& [x, y] = point;

x = 100;
```

`point.first` is now `100`.

## Const

```cpp
const auto [x, y] = point;
```

The bindings are treated as const.

## Arrays

Structured bindings also work with arrays:

```cpp
int values[] = {10, 20, 30};

auto [a, b, c] = values;
```

## Class-Like Types

They work with:
- Arrays.
- Types with public data members.
- Tuple-like types providing the required tuple interface.

Example:

```cpp
std::tuple<int, double, std::string> value{1, 2.5, "test"};

auto [a, b, c] = value;
```

## Common Use

```cpp
for (const auto& [key, value] : myMap)
{
    std::cout << key << ' ' << value;
}
```

This is one of the most common structured-binding patterns.

## Important

Structured bindings do not simply mean "copy every member." The behavior depends on the initializer and the form of `auto`, `auto&`, or `const auto&`.

## Interview Point

Structured bindings improve readability when working with pairs, tuples, arrays, and tuple-like objects.
