# Decrementing Loops

A decrementing loop moves the loop variable toward a lower bound.

## 1. Basic Example

```cpp
for (int i = 10; i > 0; --i)
{
    std::cout << i << '\n';
}
```

Output:

```text
10
9
8
...
1
```

## 2. Inclusive Zero

```cpp
for (int i = 10; i >= 0; --i)
{
    std::cout << i << '\n';
}
```

This prints `10` through `0`.

## 3. Avoid Off-by-One Errors

Compare:

```cpp
i > 0
```

with:

```cpp
i >= 0
```

The first stops before zero.

The second includes zero.

## 4. Reverse Array Traversal

```cpp
for (int i = static_cast<int>(values.size()) - 1;
     i >= 0;
     --i)
{
    std::cout << values[i];
}
```

This can work when the container size fits in `int`.

For large containers or generic code, choose an appropriate index type or use reverse iterators/ranges.

## 5. Unsigned Integer Trap

This is dangerous:

```cpp
for (std::size_t i = values.size() - 1; i >= 0; --i)
{
}
```

Because `std::size_t` is unsigned.

After reaching zero:

```text
0 - 1
```

wraps to the maximum value of the unsigned type.

## 6. Safer Unsigned Pattern

One common pattern is:

```cpp
for (std::size_t i = values.size(); i-- > 0;)
{
    std::cout << values[i];
}
```

The comparison occurs before the decrement result is used as the index.

Another option is reverse iteration:

```cpp
for (auto it = values.rbegin(); it != values.rend(); ++it)
{
    std::cout << *it;
}
```

## 7. Modern C++ Reverse Iteration

When you simply need reverse traversal, prefer:

```cpp
for (auto it = values.rbegin(); it != values.rend(); ++it)
{
}
```

or appropriate ranges/views in C++20.

## Quick Revision

```cpp
for (int i = n; i > 0; --i)
{
}
```

For unsigned indices, be especially careful around zero.

## Interview Point

The unsigned reverse-loop bug is a common C++ interview question.
