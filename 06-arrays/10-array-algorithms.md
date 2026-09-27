# Array Algorithms

C-style arrays are commonly processed using loops and standard algorithms.

## 1. Traversal

```cpp
int arr[] = {10, 20, 30, 40, 50};

for (std::size_t i = 0; i < std::size(arr); ++i)
{
    std::cout << arr[i] << ' ';
}
```

## 2. Find an Element

Simple loop:

```cpp
int target = 30;

for (std::size_t i = 0; i < std::size(arr); ++i)
{
    if (arr[i] == target)
    {
        std::cout << "Found at index " << i;
        break;
    }
}
```

Time complexity:

```text
O(n)
```

## 3. Find Minimum

```cpp
int minValue = arr[0];

for (std::size_t i = 1; i < std::size(arr); ++i)
{
    if (arr[i] < minValue)
        minValue = arr[i];
}
```

Time: `O(n)`.

## 4. Reverse

Using two indices:

```cpp
std::size_t left = 0;
std::size_t right = std::size(arr) - 1;

while (left < right)
{
    std::swap(arr[left], arr[right]);
    ++left;
    --right;
}
```

Time: `O(n)`

Extra space: `O(1)`.

## 5. Standard Algorithms

```cpp
#include <algorithm>

std::sort(arr, arr + std::size(arr));

std::reverse(arr, arr + std::size(arr));

auto it = std::find(arr, arr + std::size(arr), 30);
```

C-style arrays work naturally with iterator pairs:

```cpp
arr
arr + std::size(arr)
```

## 6. Sum

```cpp
int sum = 0;

for (int value : arr)
    sum += value;
```

Or:

```cpp
#include <numeric>

int sum = std::accumulate(arr, arr + std::size(arr), 0);
```

## 7. Common Algorithms

| Operation | Typical Complexity |
|---|---:|
| Access by index | O(1) |
| Linear search | O(n) |
| Find minimum/maximum | O(n) |
| Traversal | O(n) |
| Reverse | O(n) |
| Sorting | O(n log n) |

## Interview Points

Know both:

1. Manual loop implementation.
2. Equivalent STL algorithm.

Examples:

```cpp
std::sort()
std::find()
std::reverse()
std::accumulate()
```

**Key idea:** Understand the underlying loop and complexity even when using STL algorithms.
