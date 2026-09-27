# Const References

## 1. Syntax

```cpp
const int& ref = value;
```

You can read through the reference but cannot modify the object through it.

```cpp
int value = 10;
const int& ref = value;

// ref = 20; // error
```

## 2. Why Use `const T&`?

Useful for passing larger objects without copying while preventing modification.

```cpp
void print(const std::string& text)
{
    std::cout << text;
}
```

## 3. Can Bind to Temporaries

```cpp
const int& ref = 10;
```

The temporary's lifetime is extended to the lifetime of `ref`.

## 4. Function Parameter

```cpp
void print(const std::vector<int>& values)
{
    for (int value : values)
        std::cout << value;
}
```

No copy of the vector is made.

## 5. Compare With Pass by Value

```cpp
void f(std::string value);         // value parameter
void f(const std::string& value);  // const reference
```

For small scalar types such as `int`, pass-by-value is often simpler.

## 6. Lifetime

A const reference can extend the lifetime of a temporary when it directly binds to that temporary, but a reference must not outlive the object it refers to.

## Interview Points

- `const T&` provides read-only access.
- It avoids copying large objects.
- It can bind to temporaries.
- Always consider reference lifetime.

**Key idea:** `const T&` is a common read-only, non-owning parameter type.
