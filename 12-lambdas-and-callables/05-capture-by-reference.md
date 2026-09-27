# Capture by Reference

Reference capture allows a lambda to access the original variable.

```cpp
int count = 0;

auto increment = [&count]()
{
    ++count;
};

increment();

std::cout << count; // 1
```

No independent copy of `count` is used for the captured state.

## Changes are visible outside

```cpp
int x = 10;

auto f = [&x]()
{
    x = 50;
};

f();

std::cout << x; // 50
```

## Multiple references

```cpp
int a = 10;
int b = 20;

auto f = [&a, &b]()
{
    ++a;
    ++b;
};
```

## Lifetime hazard

The referenced object must remain alive while the lambda uses it.

Bad example:

```cpp
auto create()
{
    int value = 42;

    return [&value]()
    {
        return value;
    };
}
```

`value` is destroyed when `create()` returns. The returned lambda contains a dangling reference.

## Reference capture and asynchronous code

Be especially careful when a lambda is:

- stored for later
- returned from a function
- passed to another thread
- scheduled as a callback
- used in an asynchronous operation

## Interview point

Reference capture is useful when the lambda must modify or observe the original object, but lifetime must be guaranteed.
