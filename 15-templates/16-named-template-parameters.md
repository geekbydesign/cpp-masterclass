# Named Template Parameters

Template parameters can be given meaningful names to improve readability.

```cpp
template <typename ValueType>
void process(ValueType value)
{
}
```

Instead of:

```cpp
template <typename T>
```

you can use a descriptive name when it makes the code clearer.

## Multiple parameters

```cpp
template <typename Key, typename Value>
struct Entry
{
    Key key;
    Value value;
};
```

The names document intent.

## Naming conventions

Common conventions include:

```cpp
T
U
V
```

for generic types, or descriptive names such as:

```cpp
ValueType
KeyType
Allocator
Predicate
Container
```

## Template parameter names are local

The parameter name is only meaningful within the template declaration/definition.

```cpp
template <typename T>
void process(T value)
{
    T copy = value;
}
```

`T` is a template parameter, not a globally defined type.

## Shadowing

Avoid confusing names that collide with nearby declarations.

## Type vs value names

Make the distinction clear:

```cpp
template <typename T, std::size_t N>
```

Here:

- `T` → type parameter
- `N` → non-type value parameter

## Interview point

Meaningful template parameter names can make complex generic code much easier to understand and maintain.
