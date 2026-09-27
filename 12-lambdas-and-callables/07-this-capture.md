# `this` Capture

Lambdas defined inside non-static member functions can access members through `this`.

```cpp
class Counter
{
    int value = 0;

public:
    void run()
    {
        auto f = [this]()
        {
            ++value;
        };

        f();
    }
};
```

## `this` is a pointer

Inside the lambda, member access uses the captured `this` pointer:

```cpp
[this]()
{
    value++;
};
```

is conceptually accessing:

```cpp
this->value
```

## Implicit `this` capture

Depending on the default capture mode:

```cpp
[this]()
{
    value++;
}
```

or:

```cpp
[&]()
{
    value++;
}
```

may be used.

## `[*this]`

C++17 introduced capturing the current object by value:

```cpp
auto f = [*this]()
{
    // lambda stores a copy of the current object
};
```

This differs from `[this]`, which captures the pointer.

## `[this]` vs `[*this]`

| Capture | Meaning |
|---|---|
| `[this]` | Capture pointer to current object |
| `[*this]` | Copy the current object into the lambda |

## Lifetime hazard

With `[this]`, the object must remain alive while the lambda uses the captured pointer.

```cpp
class Worker
{
public:
    std::function<void()> create()
    {
        return [this]()
        {
            // requires Worker object to still exist
        };
    }
};
```

Storing such a callback beyond the object's lifetime can cause undefined behavior.

## Interview point

The key distinction is:

- `[this]` → pointer
- `[*this]` → object copy (C++17)
