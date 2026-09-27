# Function Basics

A function is a named block of code that performs a specific operation.

```cpp
int add(int a, int b)
{
    return a + b;
}
```

Call:

```cpp
int result = add(2, 3);
```

### Basic Parts

```cpp
return_type function_name(parameters)
{
    // body
}
```

Functions improve reuse, readability, testing, and separation of concerns.

**Interview:** A function may return a value or `void`; parameters are local to the function.
