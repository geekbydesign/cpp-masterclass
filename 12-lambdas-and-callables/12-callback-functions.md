# Callback Functions

A callback is callable behavior supplied to another function so that it can be invoked later or during an operation.

## Function pointer callback

```cpp
int square(int x)
{
    return x * x;
}

void process(int value, int (*callback)(int))
{
    std::cout << callback(value);
}

process(5, square);
```

## Lambda callback

```cpp
process(5,
        [](int x)
        {
            return x * x;
        });
```

## Function object callback

```cpp
struct Square
{
    int operator()(int x) const
    {
        return x * x;
    }
};

process(5, Square{});
```

The exact callback parameter type determines which callables can be accepted.

## Generic callback with template

Templates provide a flexible approach:

```cpp
template <typename Callable>
void process(int value, Callable callback)
{
    std::cout << callback(value);
}
```

Now many callable types can be passed without converting them to `std::function`.

## Callback use cases

Common examples:

- STL algorithms
- event handling
- asynchronous operations
- customization points
- C APIs
- GUI frameworks
- timers

## Lifetime consideration

If a callback is stored and executed later, captured references or `this` pointers must remain valid.

## Interview point

A callback is a concept, not a specific C++ type. A callback can be implemented using:

- function pointers
- lambdas
- functors
- `std::function`
- other callable objects
