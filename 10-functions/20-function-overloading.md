# Function Overloading

Multiple functions can have the same name if their parameter lists differ.

```cpp
int add(int a, int b);
double add(double a, double b);
```

The compiler selects the appropriate overload based on the arguments.

```cpp
add(1, 2);
add(1.5, 2.5);
```

### Cannot Overload Only by Return Type

```cpp
int f();
double f(); // error
```

The return type alone does not distinguish overloads.

### Common Differences

Overloads can differ by:

- Number of parameters.
- Parameter types.
- Parameter references/cv qualifications in applicable cases.

**Interview:** Overload resolution happens at compile time.
