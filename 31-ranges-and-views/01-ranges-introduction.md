# Ranges Introduction

C++20 ranges provide a more composable way to work with sequences.

Traditional algorithms often use iterator pairs:

```cpp
std::sort(v.begin(), v.end());
```

Ranges allow:

```cpp
std::ranges::sort(v);
```

## What Is a Range?

Conceptually, a range represents something that can provide a beginning and an end.

```cpp
std::ranges::begin(r);
std::ranges::end(r);
```

A range can be:
- A container.
- An array.
- A view.
- Another range-producing object.

## Why Ranges?

Ranges improve:
- Readability.
- Generic programming.
- Algorithm composition.
- Lazy processing.
- Safety through concepts.
- Separation of data from operations.

## C++20 Range Algorithms

```cpp
std::ranges::sort(v);
std::ranges::find(v, 10);
std::ranges::count(v, 10);
```

## Views

A view is a lightweight, usually lazy representation of another range.

```cpp
auto result = v
    | std::views::filter(...)
    | std::views::transform(...);
```

The view normally does not create a new container containing the transformed elements.

## Key Idea

```text
Container/range
      ↓
    view
      ↓
  algorithm
```
