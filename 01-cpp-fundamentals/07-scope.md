# Scope

Scope defines the region of a program where a name can be used.

Scope is about **name visibility**, not how long an object exists.

## 1. Block Scope

A name declared inside `{}` normally has block scope.

```cpp
int main()
{
    int x = 10;

    {
        int y = 20;
        std::cout << x;
        std::cout << y;
    }

    // y is not accessible here
}
```

## 2. Local Scope

A local variable is visible within its enclosing block.

```cpp
void test()
{
    int value = 10;
    std::cout << value;
}
```

`value` cannot be used outside the function.

## 3. Global Scope

A declaration outside functions/classes can have namespace scope.

```cpp
int globalValue = 10;

void test()
{
    std::cout << globalValue;
}
```

The identifier is in the global namespace in this example.

## 4. Namespace Scope

```cpp
namespace Math
{
    int value = 10;
}
```

Access:

```cpp
std::cout << Math::value;
```

## 5. Class Scope

Members declared inside a class have class scope.

```cpp
class Worker
{
public:
    void process();

private:
    int value{};
};
```

`value` is a class member.

## 6. Function Parameter Scope

Parameters are visible inside the function body.

```cpp
void print(int value)
{
    std::cout << value;
}
```

## 7. Shadowing

An inner declaration can hide an outer name.

```cpp
int value = 10;

int main()
{
    int value = 20;

    std::cout << value; // 20
}
```

The local variable shadows the outer variable.

## 8. Scope Resolution Operator

`::` can explicitly identify a name in another scope.

```cpp
int value = 10;

int main()
{
    int value = 20;

    std::cout << value << '\n';
    std::cout << ::value << '\n';
}
```

Output:

```text
20
10
```

## 9. Scope in `if`

```cpp
if (int value = getValue(); value > 0)
{
    std::cout << value;
}
```

`value` is scoped to the `if` statement and its associated branches.

## 10. Scope in `for`

```cpp
for (int i = 0; i < 5; ++i)
{
    // i is available here
}

// i is not available here
```

## 11. Scope vs Lifetime

These are different.

```cpp
{
    int x = 10;
}
```

For a typical automatic local object:

- `x` has block scope.
- The object exists during its lifetime, normally until the block exits.

A `static` local demonstrates the difference:

```cpp
void counter()
{
    static int value = 0;
    ++value;
}
```

The name `value` has block scope, but the object has static storage duration and survives between calls.

## 12. Interview Questions

### Scope vs lifetime?

**Scope** answers:

> Where can I refer to this name?

**Lifetime** answers:

> During what period does this object exist?

### Does leaving scope always destroy an object?

No. Automatic objects normally end their lifetime when their scope exits, but objects with other storage durations can outlive the scope of their names.

## Quick Revision

```text
Block scope
Function parameter scope
Class scope
Namespace scope
Global namespace scope

Scope       → name visibility
Lifetime    → object existence
```
