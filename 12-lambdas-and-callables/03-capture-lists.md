# Capture Lists

The capture list controls how a lambda accesses variables from its surrounding scope.

```cpp
int x = 10;

auto f = [x]()
{
    std::cout << x;
};
```

## Capture nothing

```cpp
[]() { }
```

The lambda cannot directly access local automatic variables from the surrounding scope.

## Capture by value

```cpp
int x = 10;

auto f = [x]()
{
    std::cout << x;
};
```

The lambda stores its own copy of `x`.

## Capture by reference

```cpp
int x = 10;

auto f = [&x]()
{
    x++;
};
```

The lambda refers to the original `x`.

## Capture all by value

```cpp
[x, y]()
{
    // ...
}
```

Explicit capture is often clearer.

You can capture all eligible automatic variables by value:

```cpp
[=]()
{
    // ...
}
```

## Capture all by reference

```cpp
[&]()
{
    // ...
}
```

## Mixed capture

```cpp
[x, &y]()
{
    // x by value
    // y by reference
}
```

## Default capture with exceptions

```cpp
[=, &counter]()
{
    // everything else by value
    // counter by reference
}
```

```cpp
[&, x]()
{
    // everything else by reference
    // x by value
}
```

## Important lifetime issue

A reference capture can become dangerous if the lambda outlives the referenced object:

```cpp
auto create()
{
    int value = 10;

    return [&value]()
    {
        return value; // dangling reference after create returns
    };
}
```

## Interview point

Capture mode determines how state enters the lambda's closure object. Always consider object lifetime when using reference captures.
