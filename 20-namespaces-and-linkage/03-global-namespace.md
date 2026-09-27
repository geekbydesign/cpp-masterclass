# Global Namespace

Names declared outside any named namespace belong to the global namespace.

```cpp
int globalValue = 10;

void process()
{
}
```

These belong to the global namespace.

## Global Scope Operator

The global namespace can be explicitly accessed using `::`.

```cpp
int value = 10;

namespace A
{
    int value = 20;

    void print()
    {
        std::cout << value;    // A::value
        std::cout << ::value;  // global value
    }
}
```

## Why Use `::`?

It can disambiguate a global name from a name in a nested scope.

```cpp
::function();
```

means the function is looked up from the global namespace.

## Avoid Excessive Global Names

Global names can create:

- name collisions
- hidden dependencies
- harder maintenance

Prefer named namespaces for application/library code.

## Interview Tip

The global namespace exists even when you do not explicitly write a namespace declaration.
