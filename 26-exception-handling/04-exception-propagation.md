# Exception Propagation

If a function does not handle an exception, it propagates to its caller.

```cpp
void c()
{
    throw std::runtime_error("failure");
}

void b()
{
    c();
}

void a()
{
    b();
}

int main()
{
    try {
        a();
    }
    catch (const std::exception& e) {
        std::cout << e.what();
    }
}
```

## Propagation Path

```text
c()
 ↓
b()
 ↓
a()
 ↓
main() catch
```

The runtime searches outward through active function calls for a matching handler.

## Stack Unwinding
As the exception propagates, local objects whose scopes are exited are destroyed.

This is a major reason RAII is important in exception-safe C++ code.
