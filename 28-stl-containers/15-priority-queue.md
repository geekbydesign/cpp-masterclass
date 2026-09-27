# `std::priority_queue`

`std::priority_queue` is a container adaptor where the highest-priority element is available at the top.

By default, it is a max-heap.

```cpp
std::priority_queue<int> pq;

pq.push(10);
pq.push(30);
pq.push(20);

pq.top(); // 30
```

## Complexity

| Operation | Complexity |
|---|---|
| `top()` | `O(1)` |
| `push()` | `O(log n)` |
| `pop()` | `O(log n)` |

## Min-Heap

```cpp
std::priority_queue<
    int,
    std::vector<int>,
    std::greater<int>
> pq;
```

Now the smallest element is at the top.

## Custom Comparator

```cpp
struct Compare {
    bool operator()(int a, int b) const {
        return a > b;
    }
};

std::priority_queue<int, std::vector<int>, Compare> pq;
```

## Important

`priority_queue` does not provide sorted iteration. Only the highest-priority element is directly accessible.

Typical implementation: binary heap over an underlying random-access container, usually `std::vector`.
