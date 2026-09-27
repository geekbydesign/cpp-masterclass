# `std::function`

`std::function` is a type-erased polymorphic wrapper for callable objects.

Header:

```cpp
#include <functional>
```

## Basic example

```cpp
std::function<int(int, int)> operation;

operation = [](int a, int b)
{
    return a + b;
};

int result = operation(2, 3);
```

It can store different compatible callable types.

## Function

```cpp
int add(int a, int b)
{
    return a + b;
}

std::function<int(int, int)> operation = add;
```

## Lambda

```cpp
std::function<int(int, int)> operation =
    [](int a, int b)
    {
        return a + b;
    };
```

## Functor

```cpp
struct Add
{
    int operator()(int a, int b) const
    {
        return a + b;
    }
};

std::function<int(int, int)> operation = Add{};
```

## Empty `std::function`

A default-constructed `std::function` contains no target:

```cpp
std::function<void()> callback;

if (callback)
{
    callback();
}
```

Calling an empty `std::function` throws `std::bad_function_call`.

## Passing callbacks

```cpp
void execute(std::function<int(int)> callback)
{
    std::cout << callback(10);
}
```

This can accept compatible functions, lambdas, and functors.

## `std::function` vs template

Template:

```cpp
template <typename Callable>
void execute(Callable callback)
{
    callback();
}
```

Advantages:

- preserves exact callable type
- often enables better optimization
- no type-erasure overhead

`std::function`:

```cpp
void execute(std::function<void()> callback)
{
    callback();
}
```

Advantages:

- gives a uniform runtime-storable callable type
- useful when callable type needs to be erased
- convenient for storing heterogeneous callbacks with the same signature

## `std::function` vs function pointer

Function pointer:

```cpp
void (*callback)();
```

Only represents compatible function-pointer targets.

`std::function<void()>` can hold:

- free functions
- non-capturing lambdas
- capturing lambdas
- functors
- other compatible callable objects

## Performance consideration

`std::function` uses type erasure and may involve additional overhead compared with directly invoking a concrete callable or a templated callable.

Do not automatically use `std::function` everywhere.

## Interview checklist

Know:

- `std::function<Signature>`
- type erasure
- empty state
- `std::bad_function_call`
- functions vs lambdas vs functors
- template callable vs `std::function`
- function pointer vs `std::function`
