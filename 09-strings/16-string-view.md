# `std::string_view`

## 1. What Is `std::string_view`?

`std::string_view` is a non-owning view of a contiguous character sequence.

```cpp
#include <string_view>

std::string text = "Hello";
std::string_view view = text;
```

`view` does not own or copy the characters.

## 2. Why Use It?

A read-only view can avoid constructing a temporary `std::string` for suitable string-like arguments.

```cpp
void print(std::string_view text)
{
    std::cout << text;
}
```

Both can work:

```cpp
print("Hello");

std::string text = "Hello";
print(text);
```

## 3. Common Operations

```cpp
view.size();
view.empty();
view[0];
view.substr(0, 3);
view.find("ll");
```

## 4. Does Not Own Data

```cpp
std::string_view view;

{
    std::string text = "Hello";
    view = text;
}

// view is dangling here
```

The view does not keep `text` alive.

## 5. `std::string` vs `std::string_view`

| Feature | `std::string` | `std::string_view` |
|---|---|---|
| Owns data | Yes | No |
| Modify characters | Yes | No |
| Dynamic storage | Yes | No |
| Copy cost | Copies/owns string value | Copies only the view |
| Lifetime responsibility | Owns characters | Caller keeps data alive |

## 6. Important Lifetime Rule

Do not return a view to a local string:

```cpp
std::string_view get()
{
    std::string text = "Hello";
    return text; // dangling view
}
```

## 7. C++ Version

`std::string_view` was introduced in **C++17**.

## Interview Points

- Non-owning.
- Usually cheap to copy.
- Useful for read-only string parameters.
- Does not extend the lifetime of underlying characters.
- Lifetime bugs are the main concern.

**Key idea:** `std::string_view` is a lightweight, non-owning window into existing character data.
