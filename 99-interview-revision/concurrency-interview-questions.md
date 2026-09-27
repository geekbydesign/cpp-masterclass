# Concurrency Interview Questions

> Detailed multithreading study belongs in the dedicated `cpp-multithreading` repository. This file is a compact interview revision guide.

## 1. What is a thread?

A thread is an execution path within a process.

Multiple threads can execute concurrently.

## 2. What is a race condition?

A race condition occurs when program behavior depends on timing/order between concurrent operations.

## 3. What is a data race?

A data race occurs when conflicting memory accesses happen concurrently without appropriate synchronization and at least one access is a write.

In C++, a data race causes undefined behavior.

## 4. What is a mutex?

A mutex provides mutual exclusion.

```cpp
std::mutex m;

{
    std::lock_guard<std::mutex> lock(m);
    // protected section
}
```

## 5. `lock_guard` vs `unique_lock`?

```text
lock_guard
→ simple RAII ownership
→ minimal overhead/interface

unique_lock
→ flexible locking
→ can unlock/relock
→ works with condition variables
```

## 6. What is a deadlock?

A deadlock occurs when threads wait indefinitely for resources held by each other.

Classic example:

```text
Thread A holds A → waits for B
Thread B holds B → waits for A
```

## 7. How can deadlocks be prevented?

Common techniques:
- Consistent lock ordering.
- `std::scoped_lock`.
- Minimize lock scope.
- Avoid unnecessary nested locking.

## 8. What is a condition variable?

It allows a thread to sleep until another thread signals that a condition may have changed.

```cpp
cv.wait(lock, [] {
    return ready;
});
```

## 9. Why use a predicate with `wait`?

Because condition variables can have spurious wakeups.

Always re-check the condition.

## 10. What is `std::atomic`?

Provides atomic operations on supported types without requiring an external mutex for those individual operations.

```cpp
std::atomic<int> counter{0};
```

## 11. Does atomic mean thread-safe for everything?

No.

An atomic variable protects its own atomic operations. A larger invariant involving multiple variables may still require synchronization.

## 12. What is a future?

Represents a result that may become available later.

```cpp
std::future<int> result;
```

## 13. What is a promise?

A mechanism through which one execution context can provide a result to a corresponding future.

## 14. What is `std::async`?

Runs a callable asynchronously according to the selected launch policy and returns a future.

```cpp
auto future = std::async(std::launch::async, work);
```

## 15. What is `jthread`?

C++20 `std::jthread` provides:
- Automatic joining on destruction.
- Cooperative cancellation through `std::stop_token`.

## 16. What is memory ordering?

Atomic operations can specify ordering constraints such as:

```text
relaxed
acquire
release
acq_rel
seq_cst
```

They control how operations become ordered/visible between threads.

## 17. Is `volatile` a threading primitive?

No.

`volatile` does not provide atomicity or inter-thread synchronization.

## 18. What is false sharing?

Different threads modify separate variables that happen to occupy the same cache line, causing unnecessary cache-coherence traffic.

## 19. What is lock-free programming?

Designing synchronization using atomic operations rather than traditional mutex-based critical sections.

Lock-free algorithms are significantly more difficult to design correctly.

## 20. Thread vs coroutine?

```text
thread    → execution resource
coroutine → suspendable/resumable execution
```

Coroutines do not automatically create additional threads.
