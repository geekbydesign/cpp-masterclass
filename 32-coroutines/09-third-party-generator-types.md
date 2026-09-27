# Third-Party Generator Types

C++20 provides coroutine language support, but higher-level generator abstractions can come from libraries.

One well-known example is **cppcoro**, which provides coroutine-oriented types such as generator abstractions.

The exact API depends on the library version.

## Why Use a Library?

A generator implementation needs to handle details such as:
- `promise_type`
- Coroutine handles.
- Suspension/resumption.
- Lifetime management.
- Exception propagation.
- Iterator integration.
- Value storage/reference behavior.

A library can package these details into a usable abstraction.

## Conceptual Usage

A library generator may provide an interface similar to:

```cpp
auto numbers()
{
    co_yield 1;
    co_yield 2;
    co_yield 3;
}
```

and allow iteration:

```cpp
for (auto value : numbers()) {
    // use value
}
```

The exact generator return type and API are library-specific.

## Other Options

Coroutine libraries/frameworks may provide:
- Generators.
- Tasks.
- Async operations.
- Event-loop integration.
- Scheduling abstractions.

## Important

Do not confuse:

```text
C++20 coroutine language support
```

with:

```text
a complete coroutine-based async/generator library
```

The language provides the machinery; libraries provide higher-level abstractions and policies.

## Interview Focus

For interviews, understand:
- `co_await`
- `co_yield`
- `co_return`
- `promise_type`
- `coroutine_handle`
- coroutine frame
- suspension/resumption
- lifetime and exception behavior

before learning a specific third-party coroutine library.
