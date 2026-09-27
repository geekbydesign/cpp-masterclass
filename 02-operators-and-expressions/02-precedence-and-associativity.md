# Precedence and Associativity

When an expression contains multiple operators, C++ uses operator precedence and associativity to determine how it is grouped.

## 1. Precedence

Higher-precedence operators are grouped before lower-precedence operators.

```cpp
int result = 2 + 3 * 4;
```

This is interpreted as:

```cpp
2 + (3 * 4)
```

Result:

```text
14
```

not:

```text
(2 + 3) * 4
```

## 2. Parentheses

Use parentheses when you want to make the intended grouping explicit.

```cpp
int result = (2 + 3) * 4;
```

Result:

```text
20
```

Parentheses also improve readability when precedence is not immediately obvious.

## 3. Associativity

Associativity determines how operators of the same precedence are grouped.

For example, multiplication is left-associative:

```cpp
int result = 20 / 5 * 2;
```

It is grouped as:

```cpp
(20 / 5) * 2
```

## 4. Assignment

Assignment operators associate from right to left.

```cpp
int a;
int b;
int c;

a = b = c = 10;
```

Conceptually:

```cpp
a = (b = (c = 10));
```

## 5. Common Precedence Examples

```cpp
a + b * c
```

means:

```cpp
a + (b * c)
```

```cpp
a && b || c
```

means:

```cpp
(a && b) || c
```

because `&&` has higher precedence than `||`.

## 6. Do Not Memorize Everything

For complex expressions, prefer parentheses:

```cpp
if ((a > b) && (c > d))
{
    // ...
}
```

This is clearer than relying on a large precedence table.

## 7. Precedence Does Not Define Evaluation Order

This distinction is important.

Precedence tells you how an expression is **grouped**.

It does not necessarily tell you the order in which subexpressions are evaluated.

Do not write code that depends on an unspecified or indeterminately sequenced evaluation order.

## 8. Example

```cpp
int result = 10 + 20 / 5 * 2;
```

Grouping:

```cpp
10 + ((20 / 5) * 2)
```

Result:

```text
18
```

## Interview Points

- Precedence determines grouping.
- Associativity determines grouping when operators share precedence.
- Parentheses override normal precedence.
- Precedence is not the same as evaluation order.
- Avoid unnecessarily complicated expressions.
