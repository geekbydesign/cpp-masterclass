# Lambda Basics

## What is a lambda?

A lambda is an anonymous function that can be defined directly where it is needed.

```cpp
auto add = [](int a, int b)
{
    return a + b;
};

int result = add(2, 3);
```

The lambda itself has a unique, unnamed closure type.

## Basic use

```cpp
std::vector<int> values{1, 2, 3, 4};

std::for_each(values.begin(), values.end(),
              [](int value)
              {
                  std::cout << value << ' ';
              });
```

Lambdas are commonly used for:

- callbacks
- STL algorithms
- custom sorting
- filtering
- event handlers
- local operations

## Lambda without parameters

```cpp
auto greet = []
{
    std::cout << "Hello\n";
};

greet();
```

## Returning a value

```cpp
auto square = [](int x)
{
    return x * x;
};
```

The return type can usually be deduced.

## Key points

- Introduced in C++11.
- A lambda is an unnamed function object.
- The compiler creates a unique closure type.
- Lambdas can capture variables from the surrounding scope.
- Lambdas are especially useful with STL algorithms.
