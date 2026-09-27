# Range Algorithms

C++20 provides range-aware versions of many standard algorithms.

Instead of:

```cpp
std::sort(v.begin(), v.end());
```

you can write:

```cpp
std::ranges::sort(v);
```

## Examples

```cpp
std::ranges::find(v, 10);
std::ranges::for_each(v, process);
std::ranges::sort(v);
std::ranges::copy(v, output.begin());
```

## Iterator + Sentinel

Ranges do not always require the beginning and ending objects to have the same type.

A range can be represented conceptually as:

```text
iterator + sentinel
```

This is useful for ranges where the end is represented differently from the iterator.

## Result Types

Some range algorithms return structured result objects rather than a single iterator.

For example, algorithms involving two ranges may return information about both operations.

## C++20 Constraints

Range algorithms use concepts to constrain their parameters.

This usually gives clearer compile-time diagnostics than many older iterator-based templates.

## Key Point

Range algorithms combine:

```text
algorithm + range + concepts
```

and avoid repetitive `begin()` / `end()` calls in many cases.
