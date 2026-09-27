# Range Factories

C++20 provides views that can generate or expose sequences without requiring a pre-existing container.

Common range factories include:

```cpp
std::views::iota
std::views::single
std::views::empty
```

## `views::iota`

Generate a sequence beginning at a value:

```cpp
auto numbers = std::views::iota(1);
```

This represents an unbounded sequence.

Bounded form:

```cpp
auto numbers = std::views::iota(1, 10);
```

Conceptually:

```text
1 2 3 4 5 6 7 8 9
```

## Combine with `take`

For an unbounded sequence:

```cpp
auto first10 =
    std::views::iota(1)
    | std::views::take(10);
```

## `views::single`

Creates a one-element view:

```cpp
auto one = std::views::single(42);
```

## `views::empty`

Creates an empty view of a specified element type when needed:

```cpp
auto empty = std::views::empty<int>;
```

## Key Idea

Factories are useful for creating lazy sequences and composing them with other views.

```text
factory
  ↓
view
  ↓
filter/transform/take
  ↓
algorithm
```

## Interview Tip

`views::iota` is especially important because it can represent an infinite range, making lazy adaptors such as `take` essential when a finite result is required.
