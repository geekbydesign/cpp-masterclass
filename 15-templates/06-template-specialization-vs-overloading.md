# Template Specialization vs Overloading

Both can provide different behavior for different arguments, but they work differently.

## Overloading

```cpp
template <typename T>
void process(T value)
{
}

void process(int value)
{
}
```

Overload resolution chooses among candidate functions.

## Function template specialization

```cpp
template <typename T>
void process(T value)
{
}

template <>
void process<int>(int value)
{
}
```

This specializes the existing function template.

## Prefer overloading for functions

Function-template specialization can have surprising interactions with overload resolution.

For function templates, overloading is often clearer:

```cpp
void process(int value)
{
    // int-specific behavior
}

template <typename T>
void process(T value)
{
    // generic behavior
}
```

## Partial specialization limitation

Function templates cannot be partially specialized:

```cpp
// Not allowed
template <typename T>
void process<T*>(T* value);
```

Use overloads instead:

```cpp
template <typename T>
void process(T* value)
{
}
```

## Class templates

Class templates support partial specialization:

```cpp
template <typename T>
struct Storage
{
};

template <typename T>
struct Storage<T*>
{
};
```

## Interview comparison

| Feature | Function overloading | Function specialization |
|---|---|---|
| Multiple overloads | Yes | No |
| Partial specialization | No | No |
| Works naturally with functions | Yes | More limited |
| Selection mechanism | Overload resolution | Specialization |
| Common recommendation | Often preferred | Use when specialization is appropriate |

The key point is that specialization and overloading are different language mechanisms.
