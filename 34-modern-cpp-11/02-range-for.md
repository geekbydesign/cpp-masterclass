# Range-Based `for`

C++11 introduced range-based `for` loops for convenient iteration over ranges.

## Basic Syntax

```cpp
std::vector<int> values{1, 2, 3};

for (int value : values)
{
    std::cout << value << '\n';
}
```

Equivalent conceptually to iterator-based traversal.

## Use `auto`

```cpp
for (auto value : values)
{
}
```

## Modify Elements

Use a reference:

```cpp
for (auto& value : values)
{
    value *= 2;
}
```

## Read Without Copying

Use a const reference:

```cpp
for (const auto& value : values)
{
    std::cout << value << '\n';
}
```

## Arrays

```cpp
int values[] = {1, 2, 3};

for (int value : values)
{
    std::cout << value << '\n';
}
```

## Important Difference

```cpp
for (auto value : values)
```

copies each element.

```cpp
for (auto& value : values)
```

accesses the original element.

```cpp
for (const auto& value : values)
```

avoids copying and prevents modification.

## C++11 Context

Range-based `for` works with arrays and types providing suitable `begin`/`end` support.

## Interview Point

Use `const auto&` when you only need to read potentially expensive objects without copying them.
