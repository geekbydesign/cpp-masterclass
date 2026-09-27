# Function Overloading and References

Reference-qualified parameter types can distinguish overloads in applicable cases:

```cpp
void process(int&);
void process(const int&);
```

For:

```cpp
int x = 10;
const int y = 20;

process(x); // int&
process(y); // const int&
```

However, overload sets involving value, pointer, and reference parameters can become ambiguous.

Example:

```cpp
void f(int);
void f(int&);
```

Calling:

```cpp
int x = 10;
f(x); // ambiguous
```

**Interview:** Always consider conversion rank and reference binding when analyzing overload resolution.
