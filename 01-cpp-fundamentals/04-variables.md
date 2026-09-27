# Variables

A variable is a named object whose value can be stored and changed during program execution.

## 1. Declaration

```cpp
int age;
```

This declares an `int` variable.

## 2. Initialization

```cpp
int age = 30;
```

Other forms:

```cpp
int a(10);       // direct initialization
int b{10};       // list initialization
int c = {10};    // copy-list initialization
```

Prefer braces when appropriate because they prevent narrowing conversions.

```cpp
int x{3.14};     // error: narrowing
```

## 3. Assignment

Initialization and assignment are different operations.

```cpp
int x = 10;  // initialization
x = 20;      // assignment
```

## 4. Naming Rules

Identifiers can contain:

- letters
- digits
- underscore

A name cannot begin with a digit.

Valid:

```cpp
int value1;
int _value;
int total_count;
```

Avoid names beginning with `_` in certain contexts because the standard reserves several underscore naming patterns.

## 5. Initialization Matters

An uninitialized local fundamental variable has an indeterminate value.

```cpp
int x;       // indeterminate value
```

Do not read `x` before assigning a valid value.

Prefer:

```cpp
int x{};
```

which value-initializes it to zero.

## 6. `const` Variables

A `const` object cannot be modified after initialization.

```cpp
const int maxUsers = 100;
```

This is covered in more detail in the constants section.

## 7. Variable Scope

```cpp
int globalValue = 10;

int main()
{
    int localValue = 20;

    {
        int innerValue = 30;
    }

    // innerValue is not accessible here
}
```

Scope determines where a name can be used.

## 8. Lifetime

Scope and lifetime are related but different.

- **Scope**: where a name is accessible.
- **Lifetime**: how long the object exists.

Example:

```cpp
{
    int x = 10;
}
```

`x` is accessible only inside the block and normally exists for the duration of that block.

## 9. Shadowing

An inner declaration can hide an outer declaration.

```cpp
int value = 10;

{
    int value = 20;
    std::cout << value; // 20
}
```

The inner `value` shadows the outer one.

## 10. Global Variables

```cpp
int globalValue = 10;
```

Global state should be used carefully because it increases coupling and can make code harder to reason about.

## 11. `static` Local Variable

A local static variable retains its value between function calls.

```cpp
void counter()
{
    static int count = 0;
    ++count;

    std::cout << count << '\n';
}
```

Calls produce:

```text
1
2
3
```

Its storage duration is static, while its name has block scope.

## 12. Variable Type

The type determines:

- what values can be represented
- object size and alignment requirements
- operations available
- interpretation of stored bits

Example:

```cpp
int count = 10;
double price = 12.5;
char grade = 'A';
bool enabled = true;
```

## Interview Points

- Declaration introduces a name/type.
- Initialization gives an object its initial value.
- Assignment changes an already-existing object.
- Scope is about name visibility.
- Lifetime is about object existence.
- Local fundamental variables are not automatically initialized.
- `static` changes storage duration for a local variable.
