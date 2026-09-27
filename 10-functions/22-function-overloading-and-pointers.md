# Function Overloading and Pointers

Pointer parameter types can distinguish overloads:

```cpp
void process(int*);
void process(double*);
```

Calls:

```cpp
int* p = nullptr;
double* q = nullptr;

process(p);
process(q);
```

Pointers can also participate in overload resolution through conversions.

Be careful with:

```cpp
void f(int);
void f(int*);
```

because:

```cpp
f(0);        // int overload
f(nullptr);  // pointer overload
```

**Interview:** `nullptr` is preferable to `0` when passing a null pointer because it has a dedicated null-pointer type.
