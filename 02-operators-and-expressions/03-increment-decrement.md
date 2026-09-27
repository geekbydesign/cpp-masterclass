# Increment and Decrement

The increment and decrement operators modify an object by one.

```cpp
++
--
```

## 1. Prefix Increment

```cpp
int x = 10;
++x;
```

Now:

```text
x == 11
```

Prefix increment performs the increment before the value is used as the result of the expression.

```cpp
int x = 10;
int y = ++x;
```

Result:

```text
x == 11
y == 11
```

## 2. Postfix Increment

```cpp
int x = 10;
x++;
```

Now:

```text
x == 11
```

The postfix expression yields the value before the increment.

```cpp
int x = 10;
int y = x++;
```

Result:

```text
x == 11
y == 10
```

## 3. Prefix Decrement

```cpp
int x = 10;
int y = --x;
```

Result:

```text
x == 9
y == 9
```

## 4. Postfix Decrement

```cpp
int x = 10;
int y = x--;
```

Result:

```text
x == 9
y == 10
```

## 5. Common Loop Usage

```cpp
for (int i = 0; i < 10; ++i)
{
    // ...
}
```

For ordinary scalar integers, `++i` and `i++` generally produce the same observable loop behavior when the value of the increment expression itself is not used.

## 6. Iterators

For some iterators, prefix increment is conventionally preferred:

```cpp
++it;
```

because postfix increment may need to preserve the old iterator value.

For simple integer loops this distinction usually has no practical performance consequence.

## 7. Don't Create Confusing Expressions

Avoid code such as:

```cpp
int y = x++ + ++x;
```

Do not rely on complicated modification/evaluation interactions.

Keep increment/decrement operations simple and clear.

## Quick Revision

```text
++x → increment, then yield new value
x++ → yield old value, then increment

--x → decrement, then yield new value
x-- → yield old value, then decrement
```

## Interview Question

### Prefix vs postfix?

Prefix returns the modified value.

Postfix returns the previous value and then performs the modification.
