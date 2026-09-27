# Comparison Operators and Implicit Conversions

User-defined comparison operators interact with C++ implicit conversions and overload resolution.

## Example

```cpp
class Distance
{
public:
    Distance(int meters)
        : meters(meters)
    {
    }

    bool operator==(const Distance& other) const
    {
        return meters == other.meters;
    }

private:
    int meters{};
};
```

If the constructor is not `explicit`:

```cpp
Distance d{10};

bool result = (d == 10);
```

the `10` can potentially be converted to `Distance`.

## `explicit` Changes This

```cpp
class Distance
{
public:
    explicit Distance(int meters)
        : meters(meters)
    {
    }

    bool operator==(const Distance& other) const
    {
        return meters == other.meters;
    }

private:
    int meters{};
};
```

Now:

```cpp
d == 10; // conversion is not implicitly allowed
```

and explicit construction is required:

```cpp
d == Distance{10};
```

## Member vs Non-Member Matters

For a member operator:

```cpp
bool operator==(const Distance& other) const;
```

the left operand is the object on which the member function is called.

A non-member operator can provide more symmetric conversion opportunities for both operands, subject to overload-resolution rules.

## `<=>` and Conversions

The same general overload-resolution principles apply when comparing user-defined types with other types.

Be careful with implicit converting constructors because they can make expressions compile when the conversion was not intended.

## Best Practice

Prefer:

```cpp
explicit
```

for converting constructors unless implicit conversion is genuinely useful and unsurprising.

## Interview Tip

When a comparison unexpectedly compiles, inspect:

1. member vs non-member operator
2. converting constructors
3. conversion operators
4. `explicit`
5. overload resolution

The comparison syntax itself does not bypass normal C++ conversion rules.
