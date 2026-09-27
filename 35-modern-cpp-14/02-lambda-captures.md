# Lambda Captures

C++14 continued the C++11 lambda capture model and added useful support for **generalized lambda captures** (init-capture).

## Capture by Value

```cpp
int x = 10;

auto f = [x]()
{
    std::cout << x;
};
```

The lambda stores its own copy of `x`.

## Capture by Reference

```cpp
int x = 10;

auto f = [&x]()
{
    x++;
};
```

The lambda refers to the original object.

## Capture All

```cpp
[=]()
{
    // capture used local variables by value
}
```

```cpp
[&]()
{
    // capture used local variables by reference
}
```

You can also mix captures:

```cpp
int x = 10;
int y = 20;

auto f = [x, &y]()
{
    y += x;
};
```

## Generalized Lambda Capture

C++14 allows initializing a capture directly:

```cpp
auto p = std::make_unique<int>(42);

auto f = [p = std::move(p)]()
{
    std::cout << *p;
};
```

This is called **init-capture** or **generalized lambda capture**.

It is especially useful for move-only objects.

## Move Capture

```cpp
std::unique_ptr<int> ptr = std::make_unique<int>(10);

auto lambda = [ptr = std::move(ptr)]()
{
    std::cout << *ptr;
};
```

After the move:

```cpp
ptr
```

in the surrounding scope no longer owns the object.

## Capture Expression

The initializer does not have to be a variable:

```cpp
auto f = [value = 10 * 20]()
{
    std::cout << value;
};
```

## Lifetime Warning

Reference captures do not extend the lifetime of the referenced object:

```cpp
auto makeLambda()
{
    int x = 10;

    return [&x]()
    {
        return x; // dangling reference after return
    };
}
```

This is invalid to use after `x` is destroyed.

## `mutable`

By-value captures are normally not modifiable inside the lambda:

```cpp
int x = 10;

auto f = [x]() mutable
{
    x++;
};
```

The lambda modifies its stored copy, not the original `x`.

## Key Point

```text
C++11 → basic value/reference captures
C++14 → generalized/init-captures
```

## Interview Point

Generalized lambda capture is particularly important for capturing move-only resources such as `std::unique_ptr`.
