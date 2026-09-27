# Tricky C++ Questions

## 1. Is `std::move` actually moving an object?

No.

```cpp
std::move(x);
```

primarily performs a cast that enables move semantics.

---

## 2. Is a named rvalue reference an rvalue?

No.

```cpp
void f(Widget&& w)
{
    // w is an lvalue expression
}
```

Use:

```cpp
std::move(w);
```

when you intentionally want to move from it.

---

## 3. Does `const` always mean compile-time constant?

No.

```cpp
const int x = runtimeValue();
```

`x` cannot be modified, but its value need not be known at compile time.

---

## 4. Does `constexpr` always mean the function runs at compile time?

No.

A `constexpr` function can also be called at runtime when the context is not a constant-expression context.

---

## 5. Does `consteval` mean the same as `constexpr`?

No.

`consteval` creates an immediate function whose calls require constant evaluation.

---

## 6. Does `inline` guarantee inlining?

No.

`inline` primarily affects ODR/linkage rules. The optimizer decides whether to inline machine code.

---

## 7. Are arrays pointers?

No.

```cpp
int a[3];
```

is an array.

It can decay to:

```cpp
int*
```

in many expressions, but the types are different.

---

## 8. Can a reference be reseated?

No.

```cpp
int a = 1;
int b = 2;

int& r = a;
r = b;
```

This assigns `b` to `a`; it does not make `r` refer to `b`.

---

## 9. Is `sizeof(pointer)` the size of the pointed-to object?

No.

```cpp
sizeof(int*) // pointer size
```

It is unrelated to:

```cpp
sizeof(int)
```

---

## 10. Is `sizeof(array)` equal to `sizeof(pointer)`?

No.

```cpp
int a[10];

sizeof(a); // size of entire array
sizeof(&a[0]); // size of pointer
```

---

## 11. Does `shared_ptr` make an object thread-safe?

No.

It makes ownership/reference-count management safe according to its specified guarantees, but the managed object's own state may still require synchronization.

---

## 12. Does `weak_ptr` keep the object alive?

No.

It is non-owning.

```cpp
auto p = weak.lock();
```

temporarily obtains a `shared_ptr` if the object is still alive.

---

## 13. Does `std::vector::reserve()` change size?

No.

```cpp
v.reserve(100);
```

changes capacity, not the number of elements.

---

## 14. Does `clear()` necessarily release vector capacity?

No.

```cpp
v.clear();
```

removes elements but does not generally guarantee capacity reduction.

---

## 15. Does `unordered_map` always have O(1) lookup?

No.

Average complexity is typically O(1), but worst-case lookup can be O(n).

---

## 16. Does `std::move` make a variable unusable?

No.

A moved-from object remains a valid object, but its state is generally unspecified unless documented otherwise.

---

## 17. Is copy elision the same as move semantics?

No.

Copy elision can eliminate the copy/move operation entirely.

Move semantics provide an operation that transfers resources when an object is moved.

---

## 18. Can you return a reference to a local variable?

No.

```cpp
int& get()
{
    int x = 10;
    return x; // dangling reference
}
```

---

## 19. Can a `const` object be moved efficiently?

Usually not through a normal move constructor:

```cpp
Widget(Widget&&);
```

does not accept `const Widget&&`.

Moving from a const object commonly falls back to copying.

---

## 20. Is `volatile` useful for thread synchronization?

No.

`volatile` does not provide atomicity or inter-thread synchronization.

---

## 21. Is `std::atomic<int>` equivalent to a mutex?

No.

Atomic operations can protect individual atomic state, while mutexes can protect larger critical sections and invariants.

---

## 22. Does `if constexpr` execute at runtime?

No.

The condition determines which branch participates in template instantiation/compilation.

---

## 23. Does `std::string_view` own its string?

No.

It is a non-owning view.

This can dangle:

```cpp
std::string_view view;

{
    std::string text = "hello";
    view = text;
}
```

---

## 24. Does `std::span` own the underlying data?

No.

It is a non-owning view over a contiguous sequence.

---

## 25. Is `std::optional<T>` a pointer?

No.

It represents optional presence of a `T`; it is not an ownership pointer.

---

## 26. Is `std::variant` the same as a C union?

No.

`std::variant` is type-safe and tracks which alternative is active.

---

## 27. Does `std::expected<T, E>` replace all exceptions?

No.

It is useful for explicit value-or-error APIs. Exceptions remain appropriate for many forms of exceptional control flow.

---

## 28. Are coroutines threads?

No.

A coroutine is a suspendable/resumable execution mechanism. It can run on an existing thread.

---

## 29. Does `std::thread` automatically join?

No.

A joinable `std::thread` must be joined or detached before destruction; otherwise destruction calls `std::terminate()`.

`std::jthread` provides automatic joining.

---

## 30. Does `std::list` always outperform `std::vector` for insertion?

No.

Although linked-list insertion can be O(1) at a known position, poor cache locality and allocation overhead often make `vector` preferable in practice.

---

## 31. Can a base class constructor call a derived constructor?

No.

Construction proceeds from base toward derived.

A derived constructor initializes its direct bases; an indirect base is initialized by the intermediate base.

---

## 32. Are private members inherited?

The derived object contains the base subobject, but private base members are not directly accessible from derived code.

---

## 33. Can a friend function be inherited?

No.

Friendship is not inherited and is not transitive.

---

## 34. Does a static member function have a `this` pointer?

No.

It is not associated with a particular object instance.

---

## 35. Does `auto` preserve top-level `const`?

Usually not when copying:

```cpp
const int x = 10;
auto y = x; // int
```

Use:

```cpp
const auto y = x;
```

when constness is required.

---

## 36. Is `T&&` always an rvalue reference?

Not always.

```cpp
template <typename T>
void f(T&& value);
```

can be a forwarding reference when `T` is deduced.

---

## 37. Does a range-based `for` always copy elements?

No.

```cpp
for (auto value : values)       // copy
for (auto& value : values)      // reference
for (const auto& value : values)// const reference
```

---

## 38. Does `reserve()` construct elements?

No.

It reserves storage capacity; it does not create elements.

---

## 39. Can `std::move` be harmful?

Yes.

Moving from an object transfers its resources/state according to its move operation. Afterward, the source should only be used in ways allowed for its moved-from state.

---

## 40. What is the biggest C++ interview trap?

Knowing syntax without understanding:

```text
object lifetime
ownership
value categories
const correctness
undefined behavior
ODR/linkage
exception safety
iterator invalidation
thread safety
```

Strong C++ interviews usually test reasoning about these rules rather than syntax alone.
