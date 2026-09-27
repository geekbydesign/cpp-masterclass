# Moving Lvalues

An lvalue normally cannot bind to an rvalue-reference parameter:

```cpp
std::string s = "hello";

void consume(std::string&&);

consume(s); // error
```

Use `std::move` when you intentionally want to transfer from the lvalue:

```cpp
consume(std::move(s));
```

## Important

After:

```cpp
consume(std::move(s));
```

`s` still exists, but its value should not be assumed to be unchanged.

## Ownership Example

```cpp
std::unique_ptr<int> p = std::make_unique<int>(42);

std::unique_ptr<int> q = std::move(p);
```

Now ownership has transferred to `q`.

## Do Not Move If You Still Need the Value

Bad pattern:

```cpp
std::string name = "Alice";

process(std::move(name));

std::cout << name; // do not assume the old value
```

If you need the original value afterward, do not move from the object.

## Interview Tip

`std::move` is an explicit statement of intent:

> "I no longer need this object's current value in its existing state."
