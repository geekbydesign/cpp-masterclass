# `std::thread`

C++11 introduced standard threading support through `<thread>`.

## Create a Thread

```cpp
#include <thread>

void work()
{
    // work
}

std::thread t(work);

t.join();
```

The new thread starts executing the callable.

## `join()`

```cpp
t.join();
```

Waits for the thread to finish.

A joinable `std::thread` must be joined or detached before destruction, otherwise the program calls `std::terminate()`.

## `detach()`

```cpp
t.detach();
```

Separates the thread from the `std::thread` object.

Use detached threads carefully because the original thread no longer controls their lifetime.

## Pass Arguments

```cpp
void work(int value)
{
}

std::thread t(work, 42);
t.join();
```

Arguments are passed to the thread's callable.

## Lambda Thread

```cpp
std::thread t([] {
    // work
});

t.join();
```

## Member Function

```cpp
class Worker
{
public:
    void process() {}
};

Worker worker;

std::thread t(&Worker::process, &worker);
t.join();
```

`&Worker::process` obtains the pointer to the member function.

## Thread ID

```cpp
std::thread t(work);

std::cout << t.get_id();

t.join();
```

The current thread ID can be obtained with:

```cpp
std::this_thread::get_id();
```

## Hardware Concurrency

```cpp
unsigned count = std::thread::hardware_concurrency();
```

Returns a hint about the number of hardware threads available. It may return `0` if the value is not available.

## C++11 Threading Is More Than `std::thread`

C++11 also introduced important synchronization primitives such as:

- `std::mutex`
- `std::lock_guard`
- `std::unique_lock`
- `std::condition_variable`
- `std::atomic`
- `std::future`
- `std::promise`
- `std::async`

These are covered more deeply in the concurrency section.

## Interview Point

Always reason about thread lifetime and ownership of data. Creating a thread does not automatically make shared data safe.
