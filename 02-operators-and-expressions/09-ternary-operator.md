# Ternary Operator

The conditional or ternary operator is:

```cpp
condition ? expression1 : expression2
```

It selects one of two expressions.

## 1. Basic Example

```cpp
int age = 20;

const char* result = (age >= 18) ? "Adult" : "Minor";
```

If the condition is true, the first expression is selected.

Otherwise, the second is selected.

## 2. Equivalent `if-else`

```cpp
int maxValue;

if (a > b)
    maxValue = a;
else
    maxValue = b;
```

Can be expressed as:

```cpp
int maxValue = (a > b) ? a : b;
```

## 3. It Is an Expression

Unlike a traditional `if` statement, the conditional operator produces a value.

```cpp
int result = condition ? 10 : 20;
```

This makes it useful during initialization and other expressions.

## 4. Nested Ternary

Technically possible:

```cpp
int result = a > 0 ? 1 : b > 0 ? 2 : 3;
```

But this can quickly become difficult to read.

Prefer `if/else` when the logic becomes complex.

## 5. Side Effects

Avoid complicated side effects inside ternary expressions.

Prefer:

```cpp
const int value = valid ? calculateValue() : 0;
```

over expressions that modify several variables.

## 6. Type of the Result

The two selected expressions participate in determining the type of the conditional expression.

For example:

```cpp
auto value = condition ? 10 : 20;
```

deduces an integer type.

When the two operands have different types, implicit conversion rules apply.

## 7. Common Usage

```cpp
std::cout << (score >= 50 ? "Pass" : "Fail");
```

Parentheses can make the expression clearer when used with other operators.

## Quick Revision

```cpp
condition ? true_value : false_value
```

Use ternary when:

- there are two simple alternatives
- the result is naturally an expression

Prefer `if/else` when the logic becomes difficult to read.
