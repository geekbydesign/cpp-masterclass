# Prefix and Postfix Operators

`++` and `--` have both prefix and postfix forms.

```cpp
++x; // prefix
x++; // postfix
```

## Prefix

Typical overload:

```cpp
Counter& operator++()
{
    ++value;
    return *this;
}
```

The object is modified first and the updated object is returned.

## Postfix

Typical overload:

```cpp
Counter operator++(int)
{
    Counter old = *this;
    ++value;
    return old;
}
```

The dummy `int` parameter distinguishes postfix from prefix.

Usage:

```cpp
++x; // operator++()
x++; // operator++(int)
```

The dummy integer is not used to represent an actual increment amount.

## Return Types

Typical convention:

```text
prefix  -> T&
postfix -> T
```

because postfix must preserve the old value.

## Performance

Postfix may require creating a temporary copy, so prefix is often preferred when the old value is not needed.

## Interview Tip

The most important distinction:

```cpp
operator++()       // prefix
operator++(int)    // postfix
```

The `int` is only a signature marker.
