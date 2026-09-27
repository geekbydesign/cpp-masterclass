# Range-Based `for`

A range-based `for` loop is used to iterate over the elements of a range.

It was introduced in C++11.

## 1. Basic Example

```cpp
std::vector<int> values{10, 20, 30};

for (int value : values)
{
    std::cout << value << '\n';
}
```

Each element is copied into `value`.

## 2. `auto`

```cpp
for (auto value : values)
{
    std::cout << value;
}
```

Useful when the element type is complicated.

## 3. Modify Elements

Use a reference:

```cpp
for (auto& value : values)
{
    value *= 2;
}
```

The original elements are modified.

## 4. Read-Only Without Copying

Prefer:

```cpp
for (const auto& value : values)
{
    std::cout << value;
}
```

This avoids copying potentially expensive objects and prevents modification through `value`.

## 5. Move From Elements

C++11 and later can use an rvalue reference in a range loop when explicitly intended:

```cpp
for (auto&& value : values)
{
    // forwarding/reference behavior
}
```

For ordinary revision code, prefer `auto`, `auto&`, or `const auto&` based on intent.

## 6. Arrays

Range-based `for` works with built-in arrays:

```cpp
int values[] = {1, 2, 3, 4};

for (int value : values)
{
    std::cout << value;
}
```

## 7. Strings

```cpp
std::string text = "Hello";

for (char c : text)
{
    std::cout << c << '\n';
}
```

## 8. `const`

For a read-only range:

```cpp
const std::vector<int> values{1, 2, 3};

for (const auto& value : values)
{
    std::cout << value;
}
```

## 9. Equivalent Concept

Conceptually, range-based `for` is implemented using begin/end-style iteration.

You can think of:

```cpp
for (auto& value : values)
{
    process(value);
}
```

as an abstraction over iterator traversal.

The exact expansion has language-defined details, so don't treat a simplified hand-written equivalent as the complete standard wording.

## 10. When to Use It

Prefer range-based `for` when:

- you need every element
- you do not need the numeric index
- you do not need manual iterator control

If the index is essential:

```cpp
for (std::size_t i = 0; i < values.size(); ++i)
{
    // use i and values[i]
}
```

## Quick Revision

```cpp
for (auto value : container)
{
}
```

Copies elements.

```cpp
for (auto& value : container)
{
}
```

Can modify elements.

```cpp
for (const auto& value : container)
{
}
```

Read-only, no element copy.

## Interview Points

- Range-based `for` was introduced in C++11.
- Use references when copying is unnecessary.
- `const auto&` is a common read-only choice.
- Use indexed loops when the index itself is required.
