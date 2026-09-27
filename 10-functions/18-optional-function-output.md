# Optional Function Output

Sometimes a function cannot always produce a meaningful result.

Instead of using a magic value:

```cpp
int find(...)
{
    return -1; // ambiguous if -1 is valid data
}
```

you can model absence explicitly.

Modern C++ uses:

```cpp
std::optional<int>
```

Example:

```cpp
std::optional<int> find(...)
{
    // return value when found
    // return std::nullopt when absent
}
```

This makes the API contract clearer.

**Key idea:** Represent "value may be absent" explicitly rather than inventing sentinel values.
