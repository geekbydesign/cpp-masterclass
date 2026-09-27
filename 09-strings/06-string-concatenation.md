# String Concatenation

## `operator+`

```cpp
std::string first = "Hello";
std::string second = "World";

std::string result = first + " " + second;
```

## `operator+=`

```cpp
std::string text = "Hello";

text += " World";
text += '!';
```

## `append`

```cpp
text.append(" World");
```

You can append part of another string:

```cpp
std::string source = "Hello World";
text.append(source, 0, 5);
```

## `push_back`

```cpp
text.push_back('!');
```

## `pop_back`

```cpp
text.pop_back();
```

The string must not be empty.

## Important Trap

Two C-string literals cannot be concatenated using `+`:

```cpp
// "Hello" + "World" // not string concatenation
```

Use `std::string`:

```cpp
std::string result = std::string("Hello") + "World";
```

## Interview Points

Know:

```cpp
+
+=
append()
push_back()
pop_back()
```

**Key idea:** `std::string` provides dynamic string concatenation without manual buffers.
