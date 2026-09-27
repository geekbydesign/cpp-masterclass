# enum class

`enum class` is a scoped, strongly typed enumeration introduced in C++11.

```cpp
enum class Color
{
    Red,
    Green,
    Blue
};

Color color = Color::Red;
```

## Scoped enumerators

```cpp
Color::Red
```

is required because enumerator names stay inside the enum's scope.

## Strong typing

Different enum classes are different types:

```cpp
enum class Status { Success, Failure };
enum class Result { Success, Failure };

// Status::Success != Result::Success
```

## No implicit integer conversion

```cpp
int x = Color::Red; // Error
```

Use an explicit conversion:

```cpp
int x = static_cast<int>(Color::Red);
```

## Underlying type

You can specify the underlying integral type:

```cpp
enum class ErrorCode : std::uint8_t
{
    None,
    InvalidInput,
    Timeout
};
```

Useful for controlling representation and interfacing with binary/protocol data.

## Key points

- C++11 feature.
- Scoped and strongly typed.
- No implicit conversion to `int`.
- Underlying type can be specified.
- Preferred over legacy enums for most new C++ code.
