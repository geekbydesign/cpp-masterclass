# `std::stack`

`std::stack` is a container adaptor implementing LIFO behavior.

```cpp
std::stack<int> s;

s.push(10);
s.push(20);
s.push(30);
```

Top:

```cpp
s.top(); // 30
```

## Common Operations

```cpp
s.push(10);
s.emplace(20);
s.pop();
s.top();
s.empty();
s.size();
```

All core operations are constant time.

## LIFO

```text
push 10
push 20
push 30

pop → 30
pop → 20
pop → 10
```

## Important

`std::stack` is an adaptor, not a standalone underlying storage structure. By default it uses `std::deque`.

It does not provide iterators or random access.
