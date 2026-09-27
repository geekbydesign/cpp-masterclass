# Generator Coroutine

A generator coroutine produces values incrementally instead of producing the complete sequence at once.

Conceptual example:

```cpp
Generator<int> numbers()
{
    for (int i = 1; i <= 5; ++i) {
        co_yield i;
    }
}
```

A consumer can request values one at a time.

## Workflow

```text
generator()
    ↓
co_yield 1
    ↓ suspend
consumer receives 1
    ↓ resume
co_yield 2
    ↓ suspend
consumer receives 2
    ↓
...
```

## Why Generators?

They provide:
- Lazy production.
- Low temporary storage requirements.
- Natural representation of sequences.
- Ability to represent potentially large or unbounded sequences.

## Coroutine State

Local state survives suspension:

```cpp
Generator<int> counter()
{
    int value = 0;

    while (true) {
        co_yield value++;
    }
}
```

Each resume continues from the previous suspension point.

## C++20

C++20 provides the coroutine language primitives but not a general-purpose standard generator type matching this exact example. A generator type must be supplied by a library or implemented using the coroutine machinery.

## Important

A generator coroutine is not necessarily a thread and does not imply parallel execution.
