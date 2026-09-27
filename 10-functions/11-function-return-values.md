# Function Return Values

A function can return a value:

```cpp
int square(int x)
{
    return x * x;
}
```

For `void`:

```cpp
void print()
{
    return;
}
```

A non-void function should return an appropriate value on every reachable path.

```cpp
bool isPositive(int x)
{
    if (x > 0)
        return true;

    return false;
}
```

Return by value is often the preferred way to return a new value/object. Modern C++ can optimize returned objects through copy elision/move semantics.

**Interview:** Never return a pointer/reference to a local automatic object.
