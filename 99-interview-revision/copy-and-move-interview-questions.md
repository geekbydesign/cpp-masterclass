# Copy and Move Interview Questions

## 1. What is a copy constructor?

```cpp
Widget(const Widget& other);
```

Constructs a new object from another object.

## 2. What is copy assignment?

```cpp
Widget& operator=(const Widget& other);
```

Assigns to an existing object.

## 3. What is a move constructor?

```cpp
Widget(Widget&& other) noexcept;
```

Constructs an object by transferring resources from a movable source.

## 4. What is move assignment?

```cpp
Widget& operator=(Widget&& other) noexcept;
```

Transfers resources into an already-existing object.

## 5. What does `std::move` do?

It casts an expression to an xvalue. It does not itself perform the move.

## 6. Why is `std::move` needed?

A named variable is an lvalue, even when its declared type is an rvalue reference.

```cpp
Widget&& w = create();

use(std::move(w));
```

## 7. What is the Rule of 3?

If a class manually manages a resource and defines one of:

```text
destructor
copy constructor
copy assignment
```

it often needs to consider all three.

## 8. Rule of 5?

Adds:

```text
move constructor
move assignment
```

## 9. Rule of 0?

Prefer composing the class from RAII/resource-owning members so no special resource-management functions are needed.

## 10. What is copy elision?

The compiler can omit certain copy/move operations when language rules permit it.

Since C++17, some cases are guaranteed.

## 11. What is NRVO?

Named Return Value Optimization:

```cpp
Widget create()
{
    Widget w;
    return w;
}
```

The compiler may construct `w` directly in the caller's result object.

## 12. Why should move constructors often be `noexcept`?

Standard containers may prefer moving during reallocation when the move operation is known not to throw.

## 13. What is a moved-from object?

A valid object whose value/state is generally unspecified unless the type documents a stronger post-move state.

## 14. Can you move from a `const` object?

Technically an rvalue can be const, but normal move constructors take non-const `T&&`. Therefore moving from a const object commonly selects copying instead.

## 15. What is perfect forwarding?

Preserving the value category of an argument when forwarding it.

Typical pattern:

```cpp
template <typename T>
void wrapper(T&& value)
{
    target(std::forward<T>(value));
}
```

## 16. What is a forwarding reference?

A deduced `T&&` parameter:

```cpp
template <typename T>
void f(T&& value);
```

can bind to both lvalues and rvalues and deduces differently depending on the argument.

## 17. Why should a moved-from object remain valid?

Because it must still be safely destructible and assignable unless the type documents otherwise.

## 18. Copy vs move?

```text
copy → duplicate ownership/resource state
move → transfer ownership/resource state
```
