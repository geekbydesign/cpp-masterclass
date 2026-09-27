# C++ Interview Questions

## 1. What is the difference between a declaration and a definition?

**Declaration** tells the compiler that something exists.

```cpp
extern int value;
int add(int, int);
```

**Definition** creates the entity or provides its implementation.

```cpp
int value = 10;

int add(int a, int b)
{
    return a + b;
}
```

---

## 2. What is the difference between stack and heap memory?

**Stack**
- Usually stores automatic local variables.
- Lifetime is tied to scope.
- Automatically managed.

**Heap**
- Dynamic storage.
- Lifetime is controlled by the program/ownership mechanism.
- Prefer RAII and smart pointers rather than raw `new`/`delete`.

---

## 3. What is RAII?

**Resource Acquisition Is Initialization** ties resource lifetime to object lifetime.

```cpp
{
    std::lock_guard<std::mutex> lock(mutex);
    // protected code
}
```

When `lock` goes out of scope, the destructor releases the mutex.

RAII applies to memory, locks, files, sockets, and other resources.

---

## 4. What is undefined behavior?

Undefined behavior means the C++ standard imposes no requirements on what happens.

Example:

```cpp
int* p = nullptr;
*p = 10; // UB
```

Other examples include:
- Out-of-bounds access.
- Use-after-free.
- Signed integer overflow.
- Data races.

---

## 5. What is the difference between `const`, `constexpr`, `consteval`, and `constinit`?

```text
const      → object cannot be modified through that object
constexpr  → usable in constant evaluation
consteval  → immediate function; call must be compile-time evaluated
constinit  → enforces static initialization
```

---

## 6. What is the One Definition Rule?

The ODR controls how declarations and definitions may appear across a C++ program.

Violating it can produce compiler or linker errors, or undefined behavior depending on the violation.

---

## 7. What is the difference between `struct` and `class`?

The main language difference is default access:

```cpp
struct S
{
    int value; // public
};

class C
{
    int value; // private
};
```

Default inheritance also differs.

---

## 8. What is `static` used for?

Depending on context, `static` can provide:
- Static storage duration for local variables.
- Class-level members.
- Internal linkage for namespace-scope entities.

Context matters.

---

## 9. What is `inline`?

For functions and variables, `inline` is primarily an ODR/linkage feature allowing suitable multiple definitions across translation units.

It does **not** guarantee machine-code inlining.

---

## 10. What is `nullptr`?

`nullptr` is the C++11 null pointer literal.

```cpp
int* p = nullptr;
```

Prefer it over:

```cpp
int* p = 0;
```

or:

```cpp
int* p = NULL;
```

---

## 11. What is the difference between pointer and reference?

A pointer:
- Can be null.
- Can be reseated.
- Supports pointer arithmetic where applicable.
- Is an object containing an address/value representation.

A reference:
- Must be initialized.
- Normally refers to an existing object.
- Cannot be reseated.

---

## 12. What is the difference between `new/delete` and smart pointers?

Raw allocation:

```cpp
auto p = new Widget;
delete p;
```

Smart ownership:

```cpp
auto p = std::make_unique<Widget>();
```

Smart pointers integrate ownership with RAII and are generally safer.

---

## 13. What are copy and move semantics?

Copy duplicates a resource/value.

Move transfers resources from an object that can be moved from.

```cpp
Widget a;
Widget b = a;            // copy
Widget c = std::move(a); // move
```

---

## 14. What is `std::move`?

`std::move` does not move an object by itself.

It casts an expression to an xvalue so move operations can be selected.

```cpp
auto b = std::move(a);
```

---

## 15. What are the Rule of 3, 5 and 0?

```text
Rule of 3 → destructor, copy constructor, copy assignment
Rule of 5 → Rule of 3 + move constructor + move assignment
Rule of 0 → let members manage resources; define none of these manually
```

Rule of 0 is generally preferred.

---

## 16. What is object slicing?

When a derived object is copied into a base object by value, the derived portion is sliced away.

```cpp
Derived d;
Base b = d;
```

`b` contains only the `Base` part.

---

## 17. What is a virtual function?

A virtual function enables dynamic dispatch through a base-class interface.

```cpp
struct Base
{
    virtual void run();
};
```

---

## 18. Why does a polymorphic base usually need a virtual destructor?

If deleting a derived object through a base pointer is allowed:

```cpp
Base* p = new Derived;
delete p;
```

the base destructor should generally be virtual so the derived destructor is invoked correctly.

---

## 19. What are templates?

Templates provide compile-time generic programming.

```cpp
template <typename T>
T maxValue(T a, T b)
{
    return a > b ? a : b;
}
```

---

## 20. What are concepts?

C++20 concepts constrain templates with named requirements.

```cpp
template <std::integral T>
T add(T a, T b)
{
    return a + b;
}
```

---

## 21. What is the difference between `vector`, `list`, and `deque`?

```text
vector → contiguous storage, excellent random access
deque  → segmented storage, efficient operations at both ends
list   → linked nodes, stable node references but poor cache locality
```

Choose based on operations and invalidation requirements, not simply on insertion complexity.

---

## 22. What is `std::string_view`?

A non-owning view over character data.

```cpp
void print(std::string_view text);
```

The underlying characters must outlive the view.

---

## 23. What is `std::span`?

A C++20 non-owning view over a contiguous sequence.

```cpp
void process(std::span<int> data);
```

It does not own the elements.

---

## 24. What is `std::optional`?

Represents a value that may or may not exist.

```cpp
std::optional<int> findValue();
```

---

## 25. What is `std::variant`?

A type-safe discriminated union.

```cpp
std::variant<int, std::string> value;
```

Exactly one alternative is active.

---

## 26. What is `std::expected`?

C++23 value-or-error representation:

```cpp
std::expected<Result, Error>
```

It explicitly represents successful and unsuccessful results.

---

## 27. What is a lambda?

A lambda creates a callable closure object.

```cpp
auto add = [](int a, int b)
{
    return a + b;
};
```

---

## 28. What is the difference between `auto` and `decltype`?

`auto` deduces a variable/function return type using deduction rules.

`decltype` determines the type according to the expression's `decltype` rules.

```cpp
int x = 10;

auto a = x;        // int
decltype(x) b = 20; // int
```

---

## 29. What is a dangling pointer?

A pointer referring to an object whose lifetime has ended.

```cpp
int* p;

{
    int x = 10;
    p = &x;
}

// p is dangling
```

Using it is undefined behavior.

---

## 30. What is the difference between compile-time and runtime polymorphism?

```text
compile-time → templates, overloads, concepts
runtime      → virtual functions/dynamic dispatch
```
