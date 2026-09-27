# Capture All

C++ allows default capture modes.

## Capture everything by value

```cpp
int a = 10;
int b = 20;

auto f = [=]()
{
    return a + b;
};
```

Eligible automatic variables are captured by value when odr-used.

## Capture everything by reference

```cpp
int a = 10;
int b = 20;

auto f = [&]()
{
    ++a;
    ++b;
};
```

The lambda accesses the original variables.

## Mixed default captures

```cpp
int a = 10;
int b = 20;

auto f = [=, &b]()
{
    // a by value
    // b by reference
};
```

Or:

```cpp
auto f = [&, a]()
{
    // a by value
    // other captured variables by reference
};
```

## Prefer explicit captures when practical

Compare:

```cpp
[a, b]()
{
    return a + b;
}
```

with:

```cpp
[=]()
{
    return a + b;
}
```

Explicit captures make the lambda's dependencies obvious and can reduce accidental captures.

## Important point

Default capture does not mean every variable is blindly copied or referenced. Variables are captured when required according to the lambda's use and capture rules.

## Interview checklist

- `[=]` → default capture by value.
- `[&]` → default capture by reference.
- `[=, &x]` → default value, exception `x` by reference.
- `[&, x]` → default reference, exception `x` by value.
- Always consider lifetime with reference capture.
