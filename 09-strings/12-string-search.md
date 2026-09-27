# String Search

## `find`

```cpp
std::string text = "Hello World";

std::size_t pos = text.find("World");
```

If found, `pos` is the starting index.

## Not Found

```cpp
if (text.find("C++") == std::string::npos)
{
    // not found
}
```

## Find Character

```cpp
text.find('o');
```

## `rfind`

```cpp
text.rfind('o');
```

Searches from the end.

## Character Sets

```cpp
text.find_first_of("aeiou");
text.find_last_of("aeiou");
text.find_first_not_of("aeiou");
text.find_last_not_of("aeiou");
```

## Search From a Position

```cpp
text.find("World", 3);
```

## Interview Points

Know:

```cpp
find()
rfind()
find_first_of()
find_last_of()
find_first_not_of()
find_last_not_of()
std::string::npos
```

**Key idea:** `std::string::npos` represents "not found".
