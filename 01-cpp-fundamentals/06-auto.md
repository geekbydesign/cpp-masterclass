# `auto`

`auto` asks the compiler to deduce the type of a variable from its initializer.

## 1. Basic Usage

```cpp
auto count = 10;       // int
auto price = 12.5;     // double
auto letter = 'A';     // char
auto ready = true;     // bool
```

The variable still has a specific static type.

`auto` does **not** mean dynamically typed.

## 2. Initialization Is Required

This is invalid:

```cpp
auto value;
```

The compiler needs an initializer to deduce the type.

## 3. `auto` and References

```cpp
int value = 10;

auto a = value;    // int
auto& b = value;   // int&
```

`auto` by itself generally drops top-level references/cv qualifiers during deduction.

## 4. `const`

```cpp
const int value = 10;

auto a = value;        // int
const auto b = value;  // const int
auto& c = value;       // const int&
const auto& d = value; // const int&
```

The exact type deduction depends on whether `auto` is used by value, reference, or pointer.

## 5. Pointers

```cpp
int value = 10;
int* ptr = &value;

auto p = ptr; // int*
```

## 6. `auto` With Iterators

Instead of:

```cpp
std::vector<int>::iterator it = values.begin();
```

you can write:

```cpp
auto it = values.begin();
```

This is one of the common practical uses of `auto`.

## 7. Range-Based For

```cpp
std::vector<int> values{1, 2, 3};

for (auto value : values)
{
    // copy
}
```

By reference:

```cpp
for (auto& value : values)
{
    // modify original
}
```

Read-only:

```cpp
for (const auto& value : values)
{
    // no copy, cannot modify
}
```

## 8. `auto` With Function Returns

```cpp
auto createValue()
{
    return 42;
}
```

The return type is deduced from the return statement.

## 9. `auto` Does Not Preserve Everything

Example:

```cpp
const int x = 10;

auto y = x;
```

`y` is `int`, not `const int`.

If constness matters:

```cpp
const auto y = x;
```

## 10. Braced Initializers

Be careful:

```cpp
auto a = {1, 2, 3};
```

This deduces:

```cpp
std::initializer_list<int>
```

Whereas:

```cpp
auto b{1};
```

deduces `int`.

## 11. Advantages

`auto` can:

- reduce repetitive type names
- make generic code easier to write
- simplify iterator declarations
- make refactoring easier

## 12. Don't Overuse It

This:

```cpp
auto value = getValue();
```

is often useful.

But if the type is important for understanding the code, an explicit type may be clearer.

Prefer readability over blindly replacing every type with `auto`.

## Interview Points

- `auto` is compile-time type deduction.
- `auto` does not make C++ dynamically typed.
- An initializer is required.
- `auto` by value usually drops top-level `const`.
- `auto&` preserves reference semantics.
- `const auto&` is useful for read-only access without copying.
