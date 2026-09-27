# Templates Interview Questions

## 1. What is a function template?

```cpp
template <typename T>
T add(T a, T b)
{
    return a + b;
}
```

The compiler can instantiate it for appropriate types.

## 2. What is template argument deduction?

The compiler determines template parameters from function arguments.

```cpp
add(1, 2); // T = int
```

## 3. What is explicit template argument specification?

```cpp
add<double>(1, 2);
```

Here `T` is explicitly specified as `double`.

## 4. What is template specialization?

A specialization provides a different implementation for a particular template argument pattern.

## 5. Full vs partial specialization?

```text
full specialization
→ exact template arguments

partial specialization
→ class/variable templates only, not function templates
```

## 6. Can function templates be partially specialized?

No.

Use overloading or other techniques such as constrained overloads.

## 7. What is SFINAE?

"Substitution Failure Is Not An Error."

Historically used to remove invalid template candidates during substitution.

C++20 concepts often provide a clearer alternative.

## 8. What are concepts?

Named compile-time constraints:

```cpp
template <std::integral T>
void process(T value);
```

## 9. What is `if constexpr`?

Compile-time branching in templates.

```cpp
if constexpr (std::is_integral_v<T>)
{
}
```

The discarded branch is not instantiated for the selected specialization.

## 10. What is a non-type template parameter?

A template parameter representing a compile-time value.

```cpp
template <int Size>
struct Buffer
{
    int data[Size];
};
```

## 11. What is a template parameter pack?

```cpp
template <typename... Args>
void print(Args... args);
```

Represents zero or more template/function arguments.

## 12. What is a fold expression?

C++17 mechanism for applying an operator to a parameter pack.

```cpp
return (args + ...);
```

## 13. What is `decltype(auto)`?

It deduces the return/declaration type using `decltype` rules.

Useful when preserving references:

```cpp
decltype(auto) get();
```

## 14. What is a dependent name?

A name whose meaning/type depends on a template parameter.

This leads to rules such as:

```cpp
typename T::value_type
```

when referring to a dependent type.

## 15. What is two-phase lookup?

Template names and dependent names are resolved according to rules involving template definition and instantiation contexts.

## 16. What is a class template?

```cpp
template <typename T>
class Box
{
    T value;
};
```

## 17. What is a variable template?

```cpp
template <typename T>
constexpr T zero = T{0};
```

## 18. What is template instantiation?

The compiler generates the appropriate specialization when the template is needed.

## 19. Why are template definitions traditionally placed in headers?

The compiler generally needs the relevant template definition available when instantiating it.

Modules provide another mechanism for organizing template interfaces.

## 20. Concepts vs SFINAE?

Both can constrain templates, but C++20 concepts generally provide clearer syntax, intent, and diagnostics.
