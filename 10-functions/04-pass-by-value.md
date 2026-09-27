# Pass by Value

A copy of the argument is passed to the function.

```cpp
void update(int value)
{
    value = 100;
}

int x = 10;
update(x);
// x is still 10
```

For class types, a copy/move may occur depending on the argument and overload resolution.

```cpp
void process(std::string text);
```

The function owns its parameter object.

### Advantages

- Simple ownership semantics.
- Function can modify its local copy.
- Often ideal for small types such as `int`, pointers, and lightweight value types.

**Interview:** Changes to a by-value parameter do not change the caller's object.
