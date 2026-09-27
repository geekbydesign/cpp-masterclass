# Mutable Members

The `mutable` specifier allows a non-static data member to be modified even when the containing object is const.

```cpp
class Cache
{
    mutable int hits = 0;

public:
    void access() const
    {
        ++hits;
    }
};
```

## Why use `mutable`?

Typical uses include:

- caching
- lazy computation
- instrumentation
- logically const bookkeeping

Example:

```cpp
class Data
{
    mutable bool cached = false;
    mutable int cache = 0;

public:
    int getValue() const
    {
        if (!cached)
        {
            cache = 42;
            cached = true;
        }

        return cache;
    }
};
```

The operation is logically const even though internal implementation state changes.

## Const object

```cpp
const Data data;

data.getValue();
```

The mutable members can still change.

## Do not overuse

`mutable` should not be used to bypass const-correctness casually.

The intended model is:

```text
logical state unchanged
implementation/cache state may change
```

## Important limitation

`mutable` applies to non-static data members. It is not a general way to remove constness from arbitrary objects.

## Interview point

`mutable` supports the distinction between **logical constness** and **physical/implementation state**.
