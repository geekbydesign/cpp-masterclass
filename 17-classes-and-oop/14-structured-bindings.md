# Structured Bindings

Structured bindings, introduced in C++17, allow multiple values to be unpacked into named variables.

## Example with array

```cpp
int values[] = {10, 20, 30};

auto [a, b, c] = values;
```

Now:

```text
a = 10
b = 20
c = 30
```

## Pair

```cpp
std::pair<int, std::string> result{1, "OK"};

auto [code, message] = result;
```

## Reference binding

```cpp
auto& [a, b] = result;
```

Now the bindings refer to the original object's elements.

Changing `a` changes `result.first`.

## Const

```cpp
const auto& [code, message] = result;
```

Useful for read-only access without copying.

## Struct/class

Structured bindings can work with suitable aggregate/public-member or tuple-like types.

```cpp
struct Point
{
    int x;
    int y;
};

Point p{10, 20};

auto [x, y] = p;
```

## Range-based loop

A common use:

```cpp
std::vector<std::pair<int, std::string>> items;

for (const auto& [id, name] : items)
{
    std::cout << id << ' ' << name;
}
```

## Important point

Structured bindings introduce names that provide access to components of an object; they are not simply a textual replacement for member access.

## Version

Structured bindings → **C++17**
