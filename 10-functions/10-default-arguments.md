# Default Arguments

Default arguments provide a value when the caller omits an argument.

```cpp
void log(std::string text, int level = 1);
```

Calls:

```cpp
log("Hello");    // level = 1
log("Hello", 2);
```

Default arguments are normally specified in the declaration, often in a header.

### Rules

Parameters with defaults generally appear at the end:

```cpp
void f(int a, int b = 10, int c = 20);
```

Then:

```cpp
f(1);
f(1, 2);
f(1, 2, 3);
```

Avoid repeating default arguments in both declaration and definition.

**Interview:** Default arguments are resolved at compile time and are different from overloading.
