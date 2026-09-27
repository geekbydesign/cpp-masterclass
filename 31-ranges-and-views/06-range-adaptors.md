# Range Adaptors

Range adaptors create views from existing ranges.

Common adaptors include:

```cpp
std::views::filter
std::views::transform
std::views::take
std::views::drop
std::views::reverse
std::views::take_while
std::views::drop_while
```

## Filter

```cpp
auto result =
    v | std::views::filter([](int x) {
        return x > 10;
    });
```

## Transform

```cpp
auto result =
    v | std::views::transform([](int x) {
        return x * 2;
    });
```

## Take / Drop

```cpp
auto first5 = v | std::views::take(5);
auto skip5  = v | std::views::drop(5);
```

## Reverse

```cpp
auto reversed = v | std::views::reverse;
```

## Key Idea

Range adaptors generally create a new view describing how to access the original range rather than eagerly creating a new container.
