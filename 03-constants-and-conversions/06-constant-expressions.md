# Constant Expressions

A constant expression is an expression that can be evaluated during translation according to the C++ constant-evaluation rules.

## 1. Basic Example

```cpp
constexpr int x = 10;
constexpr int y = x * 2;
```

Both initializers are constant expressions.

## 2. `constexpr` Variable

```cpp
constexpr int size = 10;

int array[size];
```

`size` can be used where a constant expression is required.

## 3. Runtime Values Are Different

```cpp
int x = getValue();

constexpr int y = x; // error
```

`x` is a runtime variable and cannot be used as the initializer of a `constexpr` variable.

## 4. `const` Does Not Always Mean Constant Expression

Consider:

```cpp
const int x = getValue();
```

`x` is const, but if `getValue()` is evaluated at runtime, `x` is not a constant expression.

By contrast:

```cpp
const int x = 10;
```

can be usable as a constant expression in appropriate contexts.

## 5. `constexpr`

The usual way to explicitly request a compile-time constant is:

```cpp
constexpr int size = 100;
```

## 6. Constant Expression Function

```cpp
constexpr int square(int x)
{
    return x * x;
}

constexpr int result = square(5);
```

The call can be evaluated at compile time.

## 7. Integral Constant Expressions

Integral constant expressions are important in contexts such as:

```cpp
constexpr int size = 10;

int array[size];
```

and compile-time conditions.

## 8. `if constexpr`

A condition used by `if constexpr` must be a constant expression.

```cpp
template <typename T>
void process(T value)
{
    if constexpr (std::is_integral_v<T>)
    {
        // ...
    }
}
```

## 9. Constant Evaluation Is Not the Same as Optimization

Do not confuse:

```text
compile-time evaluation
```

with:

```text
compiler optimization
```

A compiler may optimize ordinary runtime code, but a constant expression has specific language rules that allow or require compile-time evaluation in particular contexts.

## 10. Related Keywords

```text
const       → read-only object
constexpr   → constant evaluation
consteval   → immediate compile-time function
constinit   → static initialization guarantee
```

## Interview Points

- Constant expression is a language concept, not merely an optimization.
- `constexpr` variables require constant initialization.
- A `const` object is not automatically a constant expression in every situation.
- `constexpr` functions can participate in compile-time evaluation.
