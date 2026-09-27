# Function Parameters

Parameters receive input from the caller.

```cpp
int add(int a, int b)
{
    return a + b;
}
```

`a` and `b` are parameters; `10` and `20` are arguments:

```cpp
add(10, 20);
```

Parameters can be:

```cpp
void f(int value);
void f(int* ptr);
void f(int& ref);
void f(const std::string& text);
```

Parameter passing affects copying, ownership, nullability, and mutability.

**Key idea:** Choose parameter type based on whether the function should copy, modify, optionally receive, or merely observe an object.
