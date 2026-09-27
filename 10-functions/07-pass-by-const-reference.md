# Pass by Const Reference

```cpp
void print(const std::string& text)
{
    std::cout << text;
}
```

Advantages:

- Avoids copying large objects.
- Prevents modification through the parameter.
- Can bind to temporaries.

For small types:

```cpp
void f(int value);
```

is often simpler than:

```cpp
void f(const int& value);
```

**Interview:** `const T&` is a common read-only, non-owning parameter type.
