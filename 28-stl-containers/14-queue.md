# `std::queue`

`std::queue` is a container adaptor implementing FIFO behavior.

```cpp
std::queue<int> q;

q.push(10);
q.push(20);
q.push(30);
```

Front:

```cpp
q.front(); // 10
```

Back:

```cpp
q.back(); // 30
```

## Common Operations

```cpp
q.push(10);
q.emplace(20);
q.pop();
q.front();
q.back();
q.empty();
q.size();
```

Core operations are constant time.

## FIFO

```text
push 10
push 20
push 30

pop → 10
pop → 20
pop → 30
```

## Important

`std::queue` is a container adaptor. It does not expose iterators.

The default underlying container is `std::deque`.
