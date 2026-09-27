# Legacy / Unscoped Enums

Traditional enums are unscoped:

```cpp
enum Color
{
    Red,
    Green,
    Blue
};

Color c = Red;
```

The enumerator names are introduced into the surrounding scope.

## Implicit conversion

Legacy enum values can implicitly convert to integral types:

```cpp
int value = Red; // OK
```

## Name collisions

Because enumerators are unscoped:

```cpp
enum Color
{
    Red,
    Green
};

enum TrafficLight
{
    Red, // Error: conflicting name
    Yellow
};
```

## Underlying type

```cpp
enum ErrorCode : std::uint8_t
{
    None = 0,
    InvalidInput = 1,
    Timeout = 2
};
```

## Forward declaration

An unscoped enum can be forward-declared when its underlying type is specified:

```cpp
enum ErrorCode : int;
```

It can then be defined later.

## Where you may encounter legacy enums

- Older C++ code
- C-compatible interfaces
- Existing APIs
- Pre-C++11 codebases

For new C++ code, `enum class` is generally preferred unless interoperability requires otherwise.

## Legacy enum vs enum class

| Feature | Legacy `enum` | `enum class` |
|---|---|---|
| Enumerator scope | Unscoped | Scoped |
| Strongly typed | No | Yes |
| `Color::Red` | Not required | Required |
| Implicit integer conversion | Yes | No |
| C++ version | C++98 | C++11 |
