# C++23 Views and Range Improvements

C++23 continues the C++20 ranges model with additional views and range utilities.

The goal is to make lazy range pipelines more expressive.

## `views::zip`

Combines corresponding elements from multiple ranges.

Conceptually:

```cpp
auto zipped = std::views::zip(names, scores);
```

If:

```text
names  = Alice Bob Charlie
scores =  90   85  95
```

the resulting view produces pairs/tuples such as:

```text
(Alice, 90)
(Bob, 85)
(Charlie, 95)
```

## `views::zip_transform`

Combines elements and applies a transformation.

Conceptually:

```cpp
auto result =
    std::views::zip_transform(
        [](int a, int b) { return a + b; },
        values1,
        values2
    );
```

## `views::adjacent`

Produces adjacent groups from a range.

For:

```text
1 2 3 4
```

an adjacent view can produce:

```text
(1, 2)
(2, 3)
(3, 4)
```

## `views::adjacent_transform`

Combines adjacent elements with a transformation.

```cpp
auto differences =
    std::views::adjacent_transform<2>(
        [](int a, int b) {
            return b - a;
        },
        values
    );
```

## `views::pairwise`

A convenient C++23 view equivalent to the common adjacent-pair case.

```cpp
auto pairs = std::views::pairwise(values);
```

Conceptually:

```text
(1, 2)
(2, 3)
(3, 4)
```

## `views::chunk`

Splits a range into groups of a specified size.

```cpp
auto groups = values | std::views::chunk(3);
```

For:

```text
1 2 3 4 5 6 7
```

the chunks are conceptually:

```text
[1 2 3]
[4 5 6]
[7]
```

## `views::slide`

Produces overlapping windows.

```cpp
auto windows = values | std::views::slide(3);
```

For:

```text
1 2 3 4
```

the windows are:

```text
[1 2 3]
[2 3 4]
```

## `views::chunk_by`

Groups adjacent elements while a binary predicate remains true.

```cpp
auto groups =
    values | std::views::chunk_by(
        [](int a, int b)
        {
            return a == b;
        });
```

## `views::repeat`

Produces an infinite view repeating a value:

```cpp
auto values = std::views::repeat(42);
```

Use a bounded operation such as `take` when needed:

```cpp
auto values =
    std::views::repeat(42)
    | std::views::take(5);
```

## `views::cartesian_product`

Produces combinations from multiple ranges:

```cpp
auto combinations =
    std::views::cartesian_product(
        values1,
        values2
    );
```

## Pipeline Example

```cpp
auto result =
    values
    | std::views::filter(predicate)
    | std::views::transform(transform)
    | std::views::take(10);
```

The C++23 additions make complex range transformations easier to express without creating intermediate containers.

## Important

Views are generally non-owning and lazy. Always consider the lifetime of the underlying ranges.

## Interview Point

C++20 established the ranges/view model; C++23 significantly expands the available view adaptors such as:

```text
zip
zip_transform
adjacent
adjacent_transform
pairwise
chunk
slide
chunk_by
repeat
cartesian_product
```
