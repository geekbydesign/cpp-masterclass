# `std::transform`

`std::transform` applies a transformation to elements and writes the results to an output range.

## Unary Transform

```cpp
std::vector<int> v{1, 2, 3};
std::vector<int> result(3);

std::transform(
    v.begin(),
    v.end(),
    result.begin(),
    [](int x) {
        return x * 2;
    }
);
```

Result:

```text
2 4 6
```

## In-Place Transform

```cpp
std::transform(
    v.begin(),
    v.end(),
    v.begin(),
    [](int x) {
        return x * 2;
    }
);
```

## Binary Transform

Two input ranges can be combined:

```cpp
std::vector<int> a{1, 2, 3};
std::vector<int> b{10, 20, 30};
std::vector<int> result(3);

std::transform(
    a.begin(),
    a.end(),
    b.begin(),
    result.begin(),
    [](int x, int y) {
        return x + y;
    }
);
```

Result:

```text
11 22 33
```

## Complexity

Linear in the number of processed elements.

## Important

For binary `transform`, the second input range must contain enough elements for the requested operations.

## C++20

```cpp
std::ranges::transform(v, result.begin(), operation);
```

## Interview Tip

Think of `transform` as:

```text
input element(s)
      ↓
   operation
      ↓
output element
```
