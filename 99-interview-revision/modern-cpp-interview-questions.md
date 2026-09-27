# Modern C++ Interview Questions

## 1. What major features were introduced in C++11?

Examples:

```text
auto
range-for
lambdas
smart pointers
move semantics
rvalue references
nullptr
std::thread
constexpr
```

## 2. What did C++14 add?

Important examples:

```text
generic lambdas
generalized lambda captures
relaxed constexpr
variable templates
```

## 3. What are important C++17 features?

```text
structured bindings
if constexpr
optional
variant
any
string_view
filesystem
fold expressions
inline variables
```

## 4. What are important C++20 features?

```text
concepts
ranges
coroutines
modules
<=> 
span
consteval
constinit
designated initializers
```

## 5. What are important C++23 features?

```text
expected
print / println
more ranges/views
deducing this
if consteval
generator
mdspan
flat containers
```

## 6. `constexpr` vs `consteval`?

```text
constexpr  → may be evaluated at compile time
consteval  → immediate function; call requires constant evaluation
```

## 7. `constexpr` vs `constinit`?

```text
constexpr → constant-expression capability
constinit → static initialization guarantee
```

## 8. `optional` vs `expected`?

```text
optional<T>
→ value or absence

expected<T, E>
→ value or error
```

## 9. `variant` vs `any`?

```text
variant<A, B>
→ known set of alternatives

any
→ runtime type-erased value of arbitrary supported type
```

## 10. `string_view` vs `span`?

```text
string_view
→ character sequence

span<T>
→ contiguous sequence of T
```

Both are non-owning.

## 11. What are concepts?

Compile-time constraints on templates.

```cpp
template <std::integral T>
T add(T a, T b);
```

## 12. What are ranges?

C++20 abstractions for composing algorithms and lazy views.

## 13. What are coroutines?

Suspendable/resumable functions using:

```cpp
co_await
co_yield
co_return
```

They are not automatically threads.

## 14. What are modules?

A language-level mechanism for defining/importing compiled interfaces and controlling exported declarations.

## 15. What is `<=>`?

The C++20 three-way comparison operator.

## 16. What is `std::span`?

A non-owning view over contiguous objects.

## 17. What is `std::expected`?

A C++23 type representing either a value or an error.

## 18. What is `std::print`?

C++23 formatted output facility:

```cpp
std::println("value = {}", value);
```

## 19. What is a generic lambda?

C++14 lambda whose parameters use `auto`:

```cpp
auto f = [](auto x)
{
    return x;
};
```

## 20. What is generalized lambda capture?

C++14 init-capture:

```cpp
auto f = [p = std::move(ptr)] {};
```

## 21. What is `if constexpr`?

Compile-time branching inside templates.

## 22. What is `if consteval`?

C++23 mechanism for detecting whether evaluation is occurring during constant evaluation.

## 23. What is `std::jthread`?

C++20 thread abstraction that integrates automatic joining and cooperative cancellation through stop tokens.

## 24. What is the modern C++ ownership philosophy?

Prefer:

```text
value semantics
→ unique_ptr
→ shared_ptr when shared ownership is real
→ raw pointer/reference for non-owning relationships
```

rather than using raw owning pointers.

## 25. What is the modern C++ design philosophy?

Prefer:
- RAII.
- Value semantics.
- Strong types.
- Standard containers.
- Algorithms/ranges.
- Concepts for template constraints.
- Explicit ownership.
- `const` correctness.
- Compile-time computation where useful.
