# Logical Operators

Logical operators combine boolean conditions.

## 1. Operators

```text
&&    logical AND
||    logical OR
!     logical NOT
```

## 2. Logical AND

Both operands must be true.

```cpp
if (age >= 18 && hasLicense)
{
    // allowed
}
```

Truth table:

| A | B | A && B |
|---|---|---|
| false | false | false |
| false | true | false |
| true | false | false |
| true | true | true |

## 3. Logical OR

At least one operand must be true.

```cpp
if (isAdmin || isOwner)
{
    // allowed
}
```

Truth table:

| A | B | A \|\| B |
|---|---|---|
| false | false | false |
| false | true | true |
| true | false | true |
| true | true | true |

## 4. Logical NOT

Negates a boolean value.

```cpp
bool ready = true;

if (!ready)
{
    // false branch
}
```

## 5. Short-Circuit Evaluation

`&&` and `||` short-circuit.

For `&&`:

```cpp
if (ptr != nullptr && *ptr == 10)
{
}
```

If `ptr != nullptr` is false, the second operand is not evaluated.

For `||`:

```cpp
if (isCached || loadFromDatabase())
{
}
```

If `isCached` is true, `loadFromDatabase()` is not called.

## 6. Practical Use

Short-circuiting is useful for safe conditional evaluation:

```cpp
if (index >= 0 && index < size)
{
    // safe to use index
}
```

## 7. `!` and Boolean Context

```cpp
if (!error)
{
    // no error
}
```

For explicit boolean conversion, C++ also supports:

```cpp
bool result = static_cast<bool>(value);
```

## 8. Avoid Side Effects in Conditions

Prefer:

```cpp
if (ready && update())
{
}
```

only when the short-circuit behavior is intentional.

Avoid overly complicated expressions where function calls have surprising side effects.

## Interview Points

- `&&` means logical AND.
- `||` means logical OR.
- `!` means logical NOT.
- `&&` and `||` short-circuit.
- Short-circuiting affects whether the right operand is evaluated.
