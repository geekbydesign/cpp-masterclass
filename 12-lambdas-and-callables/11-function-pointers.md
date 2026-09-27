# Function Pointers

A function pointer stores the address of a function.

```cpp
int add(int a, int b)
{
    return a + b;
}

int (*operation)(int, int) = &add;

int result = operation(2, 3);
```

The `&` before the function name is optional when assigning:

```cpp
int (*operation)(int, int) = add;
```

## Calling through the pointer

```cpp
int result = operation(10, 20);
```

The pointer can be invoked like a function.

## Type alias

Function pointer syntax can become easier to read with `using`:

```cpp
using Operation = int(*)(int, int);

Operation operation = add;
```

## Callback example

```cpp
void execute(int a, int b, int (*operation)(int, int))
{
    std::cout << operation(a, b);
}
```

Call:

```cpp
execute(2, 3, add);
```

## Function pointer vs member-function pointer

A non-static member function has a different type:

```cpp
class Worker
{
public:
    void process();
};

void (Worker::*pmf)() = &Worker::process;
```

It requires an object to invoke.

## Function pointer vs lambda

A non-capturing lambda can convert to a compatible function pointer:

```cpp
auto add = [](int a, int b)
{
    return a + b;
};

int (*operation)(int, int) = add;
```

A capturing lambda cannot make this conversion:

```cpp
int x = 10;

auto f = [x](int value)
{
    return value + x;
};

// incompatible with ordinary function pointer
```

## Key points

- Function pointers can point to free functions/static functions.
- They are useful for low-level callbacks and C APIs.
- Capturing lambdas cannot convert to ordinary function pointers.
