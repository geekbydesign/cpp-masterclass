# Exception Safety

Exception safety describes what guarantees code provides when an exception occurs.

## 1. No-Throw Guarantee

The operation never allows an exception to escape.

```cpp
void cleanup() noexcept;
```

## 2. Strong Guarantee

If an operation fails, program state remains unchanged.

Conceptually:

```text
operation succeeds → state changes
operation throws   → state unchanged
```

## 3. Basic Guarantee

If an operation throws:
- No resources leak.
- Object invariants remain valid.
- The program remains usable.

The exact state may have changed.

## 4. No Guarantee

The operation may leave state corrupted or resources improperly managed.

Avoid this whenever practical.

## RAII and Exception Safety

RAII is fundamental:

```cpp
void process()
{
    std::vector<int> data;
    // ...
    // data is automatically destroyed if an exception occurs
}
```

Resource-owning objects clean themselves up during stack unwinding.

## Strong-Guarantee Pattern

A common technique is:

```text
prepare temporary state
        ↓
perform potentially failing work
        ↓
commit change
```

This is often called **commit-or-rollback**.

## Interview Summary

```text
No-throw → cannot throw
Strong   → failure leaves state unchanged
Basic    → invariants/resources preserved
None     → no useful guarantee
```

Exception safety is closely connected to RAII, ownership, transaction-like updates, and `noexcept`.
