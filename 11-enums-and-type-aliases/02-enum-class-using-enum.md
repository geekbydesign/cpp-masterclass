# enum class and `using enum`

C++20 introduced `using enum`, allowing enumerators to be used without repeatedly qualifying them.

```cpp
enum class Color
{
    Red,
    Green,
    Blue
};

using enum Color;

Color c = Red;
```

Without it:

```cpp
Color c = Color::Red;
```

## Scope

`using enum` affects the scope where it appears:

```cpp
void print(Color color)
{
    using enum Color;

    if (color == Red)
    {
        // ...
    }
}
```

## Switch example

```cpp
enum class Status
{
    Ready,
    Running,
    Stopped
};

void handle(Status status)
{
    using enum Status;

    switch (status)
    {
        case Ready:
            break;
        case Running:
            break;
        case Stopped:
            break;
    }
}
```

## Name conflicts

Bringing multiple enums into the same scope can create ambiguity:

```cpp
enum class Color { Red };
enum class TrafficLight { Red };

using enum Color;
using enum TrafficLight;

// Red; // Ambiguous
```

Use `Color::Red` and `TrafficLight::Red` when clarity is important.

## Interview point

`using enum` does **not** make `enum class` unscoped. It only introduces the enumerator names into the current scope.

- `enum class` → C++11
- `using enum` → C++20
