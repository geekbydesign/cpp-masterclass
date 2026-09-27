# Functions

A function is a named block of code that performs a specific operation.

## 1. Basic Function

```cpp
void greet()
{
    std::cout << "Hello\n";
}
```

Calling it:

```cpp
greet();
```

## 2. Function With Parameters

```cpp
int add(int a, int b)
{
    return a + b;
}
```

Usage:

```cpp
int result = add(10, 20);
```

Here:

- `a` and `b` are parameters.
- `10` and `20` are arguments.
- `result` receives the returned value.

## 3. Function Declaration

A function can be declared before it is defined.

```cpp
int add(int a, int b);

int main()
{
    int result = add(10, 20);
}

int add(int a, int b)
{
    return a + b;
}
```

The declaration tells the compiler that the function exists.

## 4. Function Definition

```cpp
int add(int a, int b)
{
    return a + b;
}
```

The definition contains the implementation.

## 5. Return Type

```cpp
int getValue()
{
    return 42;
}
```

For no return value:

```cpp
void printMessage()
{
    std::cout << "Hello";
}
```

## 6. `return`

`return` exits the current function.

```cpp
int square(int x)
{
    return x * x;

    // unreachable
}
```

A `void` function can use:

```cpp
return;
```

to return early.

## 7. Function Parameters

Parameters can use different passing mechanisms:

```cpp
void byValue(int x);
void byPointer(int* x);
void byReference(int& x);
void byConstReference(const std::string& value);
```

Detailed parameter passing is covered in the Functions section later.

## 8. Default Arguments

```cpp
void print(int value, int count = 1)
{
    // ...
}
```

Now both are valid:

```cpp
print(10);
print(10, 3);
```

Default arguments are normally specified in the declaration visible to the caller.

## 9. Function Overloading

Multiple functions can have the same name if their parameter lists differ.

```cpp
int add(int a, int b);
double add(double a, double b);
```

The compiler selects the appropriate overload based on the arguments.

Return type alone cannot distinguish overloads:

```cpp
int get();
double get(); // error
```

## 10. `inline`

`inline` is primarily an ODR/linkage feature, not a command that forces the compiler to inline a function.

```cpp
inline int square(int x)
{
    return x * x;
}
```

The compiler may or may not actually inline the function call.

## 11. `constexpr` Functions

A `constexpr` function can participate in compile-time evaluation when its arguments and context allow it.

```cpp
constexpr int square(int x)
{
    return x * x;
}

constexpr int value = square(5);
```

## 12. Function Scope

Local variables inside a function normally exist only within their scope.

```cpp
void test()
{
    int x = 10;
}

// x is not accessible here
```

## 13. Recursion

A function can call itself.

```cpp
int factorial(int n)
{
    if (n <= 1)
        return 1;

    return n * factorial(n - 1);
}
```

A recursive function needs a terminating condition.

## 14. Best Practices

- Give functions one clear responsibility.
- Prefer meaningful names.
- Keep parameter lists manageable.
- Prefer `const` where appropriate.
- Avoid unnecessary global state.
- Use return values instead of output parameters when a simple return is sufficient.

## Interview Points

- Declaration vs definition.
- Parameters vs arguments.
- Return type is not part of an overload signature.
- `inline` does not guarantee compiler inlining.
- `constexpr` enables possible compile-time evaluation.
- Recursive functions require a base case.
