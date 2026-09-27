# Encapsulation

Encapsulation means controlling access to an object's internal state and exposing a well-defined interface.

## Basic example

```cpp
class BankAccount
{
private:
    double balance = 0.0;

public:
    void deposit(double amount)
    {
        if (amount > 0)
            balance += amount;
    }

    double getBalance() const
    {
        return balance;
    }
};
```

External code cannot directly modify `balance`.

## Why encapsulate?

Encapsulation helps:

- preserve invariants
- hide implementation details
- reduce coupling
- control state changes
- change implementation without changing the public interface

## Access specifiers

```cpp
public:
protected:
private:
```

### `public`

Accessible through the public interface.

### `private`

Accessible only to the class and permitted friend contexts.

### `protected`

Accessible to the class and derived classes, subject to the usual access rules.

## Encapsulation is more than getters/setters

This:

```cpp
account.setBalance(account.getBalance() + 100);
```

may expose too much representation.

A better interface might be:

```cpp
account.deposit(100);
```

The class controls how the operation is performed.

## Information hiding

Users of a class should ideally depend on what the object **does**, not how it stores its state internally.

## Interview point

Encapsulation reduces coupling and protects invariants by controlling access to implementation details.
