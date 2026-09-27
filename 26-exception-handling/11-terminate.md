# `std::terminate`

`std::terminate()` ends exception handling by invoking the currently installed terminate handler.

```cpp
std::terminate();
```

By default, the terminate handler calls `std::abort()`.

## Common Situations
`std::terminate()` can be triggered when:
- An exception escapes a `noexcept` function.
- No matching handler is found.
- An exception is thrown while another exception is already being processed during certain destruction paths.
- Other language/runtime termination conditions occur.

## Custom Terminate Handler

```cpp
std::set_terminate([] {
    std::cerr << "Terminating";
    std::abort();
});
```

## Important
`terminate` is not normal exception recovery. Once termination occurs, normal exception propagation does not continue.
