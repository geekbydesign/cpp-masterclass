# Uniform Initialization

Uniform initialization uses brace syntax `{}` for many kinds of initialization.

```cpp
int x{10};

std::string name{"Alice"};

std::vector<int> values{1, 2, 3};

Point p{10, 20};
```

## Benefits

- Consistent initialization syntax.
- Helps prevent narrowing conversions.
- Works naturally with aggregates.
- Integrates with `std::initializer_list`.

## Narrowing Prevention

```cpp
int x = 3.14; // allowed, conversion occurs
int y{3.14};  // error: narrowing
```

## Empty Braces

```cpp
int x{};
```

Value-initializes `x` to zero.

For a class:

```cpp
Person p{};
```

This uses an appropriate default/value initialization path.

## `{}` vs `()`

Brace initialization can prefer `std::initializer_list` constructors.

```cpp
std::vector<int> a(5, 10); // five elements, each 10
std::vector<int> b{5, 10}; // two elements: 5 and 10
```

This is an important practical difference.

## Interview Tip

"Uniform initialization" is a broad style/pattern using braces. It is not a single language mechanism; brace initialization interacts with aggregate initialization, constructors, initializer lists, and narrowing rules.
