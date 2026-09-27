# Coroutine Workflow

A coroutine has a lifecycle involving creation, suspension, resumption, and completion.

Conceptually:

```text
coroutine called
      ↓
coroutine state/frame created
      ↓
initial suspend
      ↓
resume
      ↓
body executes
      ↓
co_await / co_yield
      ↓
suspend
      ↓
resume again
      ↓
completion
      ↓
final suspend
      ↓
frame destroyed
```

## Coroutine Frame

The compiler creates coroutine state that must survive across suspensions.

The frame can contain:
- Parameters.
- Local variables whose lifetime spans suspension.
- Promise object.
- Coroutine bookkeeping.

The exact representation is implementation-defined.

## Suspension

A coroutine can suspend at:

```cpp
co_await expression;
co_yield expression;
```

and reaches a final suspension point when it completes.

## Resumption

A coroutine can be resumed through a coroutine handle or through a higher-level abstraction built around it.

```cpp
handle.resume();
```

## Important

Suspending a coroutine preserves the state needed to continue later. It does not mean the function starts from the beginning when resumed.
