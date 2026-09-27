# String Copy, Replace, Resize, and Swap

## Copy

```cpp
std::string first = "Hello";
std::string second = first;
```

Assignment also works:

```cpp
second = "World";
```

## Replace

```cpp
std::string text = "Hello World";

text.replace(6, 5, "C++");
```

Result:

```text
Hello C++
```

## Resize

```cpp
text.resize(10);
```

Or:

```cpp
text.resize(10, '-');
```

## Swap

```cpp
std::string a = "Hello";
std::string b = "World";

a.swap(b);
```

Now:

```text
a = "World"
b = "Hello"
```

Also:

```cpp
std::swap(a, b);
```

## Clear

```cpp
text.clear();
```

## Substring

```cpp
std::string text = "Hello World";

std::string part = text.substr(0, 5);
```

Result:

```text
Hello
```

`substr()` creates a new `std::string`.

## Interview Points

```text
copy/assignment -> copies string value
replace         -> replaces a range
resize          -> changes logical size
swap            -> exchanges contents
substr          -> creates a substring
```

**Key idea:** `std::string` provides value semantics and rich modification operations.
