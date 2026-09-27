# Template Type Deduction

When a function template is called, the compiler can often deduce template parameters from the function arguments.

```cpp
template <typename T>
void print(T value)
{
}

print(10);      // T = int
print(3.14);    // T = double
```

## By value

For:

```cpp
template <typename T>
void f(T value);
```

top-level `const` and references are generally not preserved in `T`.

```cpp
const int x = 10;

f(x); // T is int
```

## Reference parameter

```cpp
template <typename T>
void f(T& value);
```

Now `T` can preserve cv-qualification:

```cpp
const int x = 10;

f(x); // T = const int
```

## Const reference

```cpp
template <typename T>
void f(const T& value);
```

For:

```cpp
const int x = 10;
f(x);
```

`T` is `int`.

## Array deduction

A reference parameter can preserve an array type:

```cpp
template <typename T, std::size_t N>
void print(T (&array)[N])
{
}
```

For:

```cpp
int values[5];
print(values);
```

the compiler can deduce:

```text
T = int
N = 5
```

## Important rule

Template argument deduction is based on the parameter type and argument type. It is not simply "look at the variable's declared type."

## Interview point

Know the differences between:

```cpp
T
T&
const T&
T&&
```

because deduction behavior changes with the parameter form.
