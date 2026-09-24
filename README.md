# C++ Masterclass

A comprehensive C++ learning and revision repository covering C++ fundamentals through advanced modern C++, including C++11, C++14, C++17, C++20, and C++23.

The notes are for easier learning, revision, and interview preparation.

## Goals

* Build strong C++ fundamentals from scratch.
* Understand memory, pointers, references, and object lifetime.
* Master OOP, inheritance, and polymorphism.
* Understand copy/move semantics and RAII.
* Learn templates, type traits, and C++20 concepts.
* Become comfortable with STL containers, iterators, and algorithms.
* Understand modern C++ features from C++11 through C++23.
* Cover advanced topics such as ranges, views, coroutines, and modules.
* Maintain concise notes for quick revision.
* Build a dedicated C++ interview revision reference.

## Repository Structure

```text
cpp-deep-dive/
│
├── README.md
│
├── 01-cpp-fundamentals/
│   ├── 01-first-cpp-program.md
│   ├── 02-functions.md
│   ├── 03-input-output.md
│   ├── 04-variables.md
│   ├── 05-data-types.md
│   ├── 06-auto.md
│   ├── 07-scope.md
│   ├── 08-lifetime.md
│   └── 09-storage-duration.md
│
├── 02-operators-and-expressions/
│   ├── 01-arithmetic-operators.md
│   ├── 02-precedence-and-associativity.md
│   ├── 03-increment-decrement.md
│   ├── 04-compound-assignment.md
│   ├── 05-relational-operators.md
│   ├── 06-logical-operators.md
│   ├── 07-bitwise-operators.md
│   ├── 08-bitwise-compound-assignment.md
│   ├── 09-ternary-operator.md
│   ├── 10-comma-operator.md
│   └── 11-output-formatting.md
│
├── 03-constants-and-conversions/
│   ├── 01-literals.md
│   ├── 02-const.md
│   ├── 03-constexpr.md
│   ├── 04-consteval.md
│   ├── 05-constinit.md
│   ├── 06-constant-expressions.md
│   ├── 07-implicit-conversions.md
│   ├── 08-explicit-conversions.md
│   ├── 09-overflow-and-underflow.md
│   └── 10-numeric-limits.md
│
├── 04-control-flow/
│   ├── 01-if-else.md
│   ├── 02-else-if.md
│   ├── 03-switch.md
│   ├── 04-short-circuit-evaluation.md
│   ├── 05-integral-conditions.md
│   ├── 06-if-constexpr.md
│   ├── 07-if-with-initializer.md
│   ├── 08-switch-with-initializer.md
│   ├── 09-variable-scope-in-control-flow.md
│   └── 10-switch-scope.md
│
├── 05-loops/
│   ├── 01-for-loop.md
│   ├── 02-multiple-declarations.md
│   ├── 03-while-loop.md
│   ├── 04-do-while.md
│   ├── 05-range-based-for.md
│   ├── 06-break-and-continue.md
│   ├── 07-infinite-loops.md
│   ├── 08-decrementing-loops.md
│   ├── 09-nested-loops.md
│   ├── 10-comma-operator-in-loops.md
│   └── 11-loop-patterns.md
│
├── 06-arrays/
│   ├── 01-c-style-arrays.md
│   ├── 02-array-declaration-and-initialization.md
│   ├── 03-array-size.md
│   ├── 04-array-bounds.md
│   ├── 05-character-arrays.md
│   ├── 06-multidimensional-arrays.md
│   ├── 07-multidimensional-character-arrays.md
│   ├── 08-array-and-pointers.md
│   ├── 09-array-function-parameters.md
│   └── 10-array-algorithms.md
│
├── 07-pointers-and-references/
│   ├── 01-pointers.md
│   ├── 02-pointer-to-const.md
│   ├── 03-const-pointer.md
│   ├── 04-const-pointer-to-const.md
│   ├── 05-pointer-vs-reference.md
│   ├── 06-pointer-arithmetic.md
│   ├── 07-pointer-comparison.md
│   ├── 08-pointers-and-arrays.md
│   ├── 09-nullptr.md
│   ├── 10-dangling-pointers.md
│   ├── 11-references.md
│   ├── 12-const-references.md
│   ├── 13-references-and-range-for.md
│   └── 14-program-memory-map.md
│
├── 08-memory-management/
│   ├── 01-stack-and-heap.md
│   ├── 02-dynamic-memory.md
│   ├── 03-new-and-delete.md
│   ├── 04-dynamic-arrays.md
│   ├── 05-memory-leaks.md
│   ├── 06-dangling-pointers.md
│   ├── 07-new-failure.md
│   ├── 08-null-pointer-safety.md
│   └── 09-raii.md
│
├── 09-strings/
│   ├── 01-character-manipulation.md
│   ├── 02-c-strings.md
│   ├── 03-c-string-manipulation.md
│   ├── 04-c-string-copy-and-concatenation.md
│   ├── 05-std-string-basics.md
│   ├── 06-string-concatenation.md
│   ├── 07-string-access.md
│   ├── 08-string-size-and-capacity.md
│   ├── 09-string-modification.md
│   ├── 10-string-comparison.md
│   ├── 11-string-copy-replace-resize-swap.md
│   ├── 12-string-search.md
│   ├── 13-string-number-conversions.md
│   ├── 14-escape-sequences.md
│   ├── 15-raw-string-literals.md
│   └── 16-string-view.md
│
├── 10-functions/
│   ├── 01-function-basics.md
│   ├── 02-function-declarations-and-definitions.md
│   ├── 03-function-parameters.md
│   ├── 04-pass-by-value.md
│   ├── 05-pass-by-pointer.md
│   ├── 06-pass-by-reference.md
│   ├── 07-pass-by-const-reference.md
│   ├── 08-array-function-parameters.md
│   ├── 09-multidimensional-array-parameters.md
│   ├── 10-default-arguments.md
│   ├── 11-function-return-values.md
│   ├── 12-return-by-reference.md
│   ├── 13-return-by-pointer.md
│   ├── 14-auto-return-type.md
│   ├── 15-decltype-and-return-types.md
│   ├── 16-constexpr-functions.md
│   ├── 17-consteval-functions.md
│   ├── 18-optional-function-output.md
│   ├── 19-std-optional.md
│   ├── 20-function-overloading.md
│   ├── 21-function-overloading-and-const.md
│   ├── 22-function-overloading-and-pointers.md
│   ├── 23-function-overloading-and-references.md
│   ├── 24-inline-functions.md
│   ├── 25-recursive-functions.md
│   └── 26-command-line-arguments.md
│
├── 11-enums-and-type-aliases/
│   ├── 01-enum-class.md
│   ├── 02-enum-class-using-enum.md
│   ├── 03-legacy-enums.md
│   ├── 04-enum-scoping.md
│   └── 05-type-aliases.md
│
├── 12-lambdas-and-callables/
│   ├── 01-lambda-basics.md
│   ├── 02-lambda-syntax.md
│   ├── 03-capture-lists.md
│   ├── 04-capture-by-value.md
│   ├── 05-capture-by-reference.md
│   ├── 06-capture-all.md
│   ├── 07-this-capture.md
│   ├── 08-generic-lambdas.md
│   ├── 09-function-objects.md
│   ├── 10-functors.md
│   ├── 11-function-pointers.md
│   ├── 12-callback-functions.md
│   └── 13-std-function.md
│
├── 13-static-inline-and-recursion/
│   ├── 01-static-variables.md
│   ├── 02-static-local-variables.md
│   ├── 03-inline-functions.md
│   └── 04-recursion.md
│
├── 14-debugging/
│   ├── 01-call-stack.md
│   ├── 02-debugging-basics.md
│   ├── 03-debugging-in-vs-code.md
│   ├── 04-debugging-in-visual-studio.md
│   ├── 05-debugging-arrays-and-loops.md
│   └── 06-debugging-pointers.md
│
├── 15-templates/
│   ├── 01-function-templates.md
│   ├── 02-template-type-deduction.md
│   ├── 03-explicit-template-arguments.md
│   ├── 04-template-parameters-by-reference.md
│   ├── 05-template-specialization.md
│   ├── 06-template-specialization-vs-overloading.md
│   ├── 07-function-template-overloading.md
│   ├── 08-multiple-template-parameters.md
│   ├── 09-template-return-type-deduction.md
│   ├── 10-decltype.md
│   ├── 11-trailing-return-types.md
│   ├── 12-decltype-auto.md
│   ├── 13-non-type-template-parameters.md
│   ├── 14-default-template-arguments.md
│   ├── 15-auto-template-parameters.md
│   ├── 16-named-template-parameters.md
│   ├── 17-type-traits.md
│   └── 18-if-constexpr-with-templates.md
│
├── 16-concepts/
│   ├── 01-concepts-basics.md
│   ├── 02-building-custom-concepts.md
│   ├── 03-requires-clause.md
│   ├── 04-combining-concepts.md
│   ├── 05-conjunction-and-disjunction.md
│   ├── 06-concepts-and-auto.md
│   └── 07-standard-library-concepts.md
│
├── 17-classes-and-oop/
│   ├── 01-classes-and-objects.md
│   ├── 02-class-members.md
│   ├── 03-constructors.md
│   ├── 04-default-constructors.md
│   ├── 05-setters-and-getters.md
│   ├── 06-destructors.md
│   ├── 07-constructor-destructor-order.md
│   ├── 08-this-pointer.md
│   ├── 09-struct-vs-class.md
│   ├── 10-object-size.md
│   ├── 11-const-objects.md
│   ├── 12-const-member-functions.md
│   ├── 13-mutable-members.md
│   ├── 14-structured-bindings.md
│   ├── 15-encapsulation.md
│   ├── 16-friend-functions.md
│   ├── 17-friend-classes.md
│   ├── 18-static-members.md
│   ├── 19-static-member-functions.md
│   ├── 20-nested-classes.md
│   └── 21-member-initialization.md
│
├── 18-constructors-and-initialization/
│   ├── 01-constructor-default-parameters.md
│   ├── 02-initializer-lists.md
│   ├── 03-initializer-list-vs-memberwise-initialization.md
│   ├── 04-explicit-constructors.md
│   ├── 05-constructor-delegation.md
│   ├── 06-copy-constructors.md
│   ├── 07-copying-objects-in-arrays.md
│   ├── 08-shallow-vs-deep-copy.md
│   ├── 09-move-constructors.md
│   ├── 10-deleted-constructors.md
│   ├── 11-initializer-list-constructors.md
│   ├── 12-aggregate-initialization.md
│   ├── 13-designated-initializers.md
│   └── 14-uniform-initialization.md
│
├── 19-copy-and-move-semantics/
│   ├── 01-copy-constructor.md
│   ├── 02-copy-assignment.md
│   ├── 03-move-constructor.md
│   ├── 04-move-assignment.md
│   ├── 05-rule-of-three.md
│   ├── 06-rule-of-five.md
│   ├── 07-rule-of-zero.md
│   ├── 08-lvalues-and-rvalues.md
│   ├── 09-rvalue-references.md
│   ├── 10-std-move.md
│   ├── 11-moving-temporaries.md
│   ├── 12-move-only-types.md
│   ├── 13-moving-lvalues.md
│   ├── 14-move-semantics-and-pointers.md
│   └── 15-rvo-and-nrvo.md
│
├── 20-namespaces-and-linkage/
│   ├── 01-namespaces.md
│   ├── 02-namespaces-across-files.md
│   ├── 03-global-namespace.md
│   ├── 04-using-declarations.md
│   ├── 05-anonymous-namespaces.md
│   ├── 06-nested-namespaces.md
│   ├── 07-namespace-aliases.md
│   ├── 08-compilation-model.md
│   ├── 09-declarations-and-definitions.md
│   ├── 10-one-definition-rule.md
│   ├── 11-linkage.md
│   ├── 12-external-variables.md
│   ├── 13-inline-variables.md
│   ├── 14-inline-vs-static.md
│   └── 15-forward-declarations.md
│
├── 21-memory-management/
│   ├── 01-raii.md
│   ├── 02-unique-ptr.md
│   ├── 03-unique-ptr-parameters.md
│   ├── 04-unique-ptr-return-values.md
│   ├── 05-unique-ptr-arrays.md
│   ├── 06-shared-ptr.md
│   ├── 07-shared-ptr-reference-counting.md
│   ├── 08-unique-to-shared-ptr.md
│   ├── 09-shared-ptr-arrays.md
│   ├── 10-shared-ptr-parameters.md
│   ├── 11-shared-ptr-return-values.md
│   ├── 12-weak-ptr.md
│   └── 13-smart-pointer-best-practices.md
│
├── 22-operator-overloading/
│   ├── 01-operator-overloading-basics.md
│   ├── 02-member-vs-non-member-operators.md
│   ├── 03-arithmetic-operators.md
│   ├── 04-subscript-operator.md
│   ├── 05-stream-insertion-operator.md
│   ├── 06-stream-extraction-operator.md
│   ├── 07-compound-assignment-operators.md
│   ├── 08-unary-operators.md
│   ├── 09-prefix-and-postfix.md
│   ├── 10-copy-assignment-operator.md
│   ├── 11-custom-type-conversions.md
│   └── 12-functors.md
│
├── 23-comparisons-and-spaceship/
│   ├── 01-comparison-operators.md
│   ├── 02-equality-operators.md
│   ├── 03-three-way-comparison.md
│   ├── 04-defaulted-equality.md
│   ├── 05-defaulted-spaceship.md
│   ├── 06-custom-spaceship.md
│   ├── 07-strong-weak-and-partial-ordering.md
│   └── 08-comparison-operators-and-implicit-conversions.md
│
├── 24-inheritance/
│   ├── 01-inheritance-basics.md
│   ├── 02-protected-members.md
│   ├── 03-member-access-specifiers.md
│   ├── 04-public-private-and-protected-inheritance.md
│   ├── 05-using-base-members.md
│   ├── 06-inheritance-and-constructors.md
│   ├── 07-inheriting-base-constructors.md
│   ├── 08-copy-constructors-with-inheritance.md
│   ├── 09-inheritance-and-destructors.md
│   ├── 10-function-hiding.md
│   └── 11-inheritance-hierarchies.md
│
├── 25-polymorphism/
│   ├── 01-static-binding.md
│   ├── 02-dynamic-binding.md
│   ├── 03-virtual-functions.md
│   ├── 04-override.md
│   ├── 05-final.md
│   ├── 06-object-slicing.md
│   ├── 07-polymorphic-objects-in-containers.md
│   ├── 08-virtual-destructors.md
│   ├── 09-pure-virtual-functions.md
│   ├── 10-abstract-classes.md
│   ├── 11-interfaces.md
│   ├── 12-default-arguments-with-virtual-functions.md
│   ├── 13-dynamic-cast.md
│   ├── 14-typeid.md
│   ├── 15-rtti.md
│   └── 16-polymorphism-and-access-control.md
│
├── 26-exception-handling/
│   ├── 01-exceptions.md
│   ├── 02-try-catch.md
│   ├── 03-throw.md
│   ├── 04-exception-propagation.md
│   ├── 05-multiple-catch-handlers.md
│   ├── 06-nested-try-blocks.md
│   ├── 07-custom-exceptions.md
│   ├── 08-exception-hierarchies.md
│   ├── 09-polymorphic-exceptions.md
│   ├── 10-rethrowing-exceptions.md
│   ├── 11-terminate.md
│   ├── 12-catch-all.md
│   ├── 13-noexcept.md
│   ├── 14-exceptions-in-destructors.md
│   ├── 15-standard-exceptions.md
│   └── 16-exception-safety.md
│
├── 27-class-templates/
│   ├── 01-class-template-basics.md
│   ├── 02-class-template-instances.md
│   ├── 03-non-type-template-parameters.md
│   ├── 04-multiple-template-parameters.md
│   ├── 05-default-template-parameters.md
│   ├── 06-explicit-template-instantiation.md
│   ├── 07-class-template-specialization.md
│   ├── 08-partial-template-specialization.md
│   ├── 09-template-method-specialization.md
│   ├── 10-friend-functions-with-templates.md
│   ├── 11-stream-operators-with-class-templates.md
│   ├── 12-type-traits-with-class-templates.md
│   ├── 13-static-assert-with-templates.md
│   └── 14-concepts-with-class-templates.md
│
├── 28-stl-containers/
│   ├── 01-vector.md
│   ├── 02-array.md
│   ├── 03-deque.md
│   ├── 04-forward-list.md
│   ├── 05-list.md
│   ├── 06-pair.md
│   ├── 07-set.md
│   ├── 08-map.md
│   ├── 09-multiset.md
│   ├── 10-multimap.md
│   ├── 11-unordered-set.md
│   ├── 12-unordered-map.md
│   ├── 13-stack.md
│   ├── 14-queue.md
│   └── 15-priority-queue.md
│
├── 29-iterators/
│   ├── 01-iterator-basics.md
│   ├── 02-iterator-types.md
│   ├── 03-iterator-traversal.md
│   ├── 04-reverse-iterators.md
│   ├── 05-constant-iterators.md
│   ├── 06-std-begin-and-end.md
│   ├── 07-custom-iterator-theory.md
│   ├── 08-custom-input-iterators.md
│   ├── 09-custom-output-iterators.md
│   ├── 10-custom-forward-iterators.md
│   ├── 11-custom-bidirectional-iterators.md
│   ├── 12-custom-random-access-iterators.md
│   ├── 13-raw-pointers-as-iterators.md
│   └── 14-wrapping-other-iterators.md
│
├── 30-stl-algorithms/
│   ├── 01-algorithm-basics.md
│   ├── 02-all-of.md
│   ├── 03-for-each.md
│   ├── 04-max-element-and-min-element.md
│   ├── 05-find.md
│   ├── 06-copy.md
│   ├── 07-sort.md
│   └── 08-transform.md
│
├── 31-ranges-and-views/
│   ├── 01-ranges-introduction.md
│   ├── 02-range-algorithms.md
│   ├── 03-ranges-with-iterators.md
│   ├── 04-projections.md
│   ├── 05-views.md
│   ├── 06-range-adaptors.md
│   ├── 07-view-composition.md
│   ├── 08-pipe-operator.md
│   └── 09-range-factories.md
│
├── 32-coroutines/
│   ├── 01-coroutine-introduction.md
│   ├── 02-coroutine-workflow.md
│   ├── 03-coroutine-keywords.md
│   ├── 04-coroutine-infrastructure.md
│   ├── 05-co-await.md
│   ├── 06-co-yield.md
│   ├── 07-co-return.md
│   ├── 08-generator-coroutine.md
│   └── 09-third-party-generator-types.md
│
├── 33-modules/
│   ├── 01-modules-introduction.md
│   ├── 02-first-module.md
│   ├── 03-export.md
│   ├── 04-module-interface-and-implementation.md
│   ├── 05-multiple-interface-files.md
│   ├── 06-multiple-implementation-files.md
│   ├── 07-import.md
│   ├── 08-submodules.md
│   ├── 09-module-interface-partitions.md
│   ├── 10-class-templates-as-modules.md
│   ├── 11-modules-and-namespaces.md
│   ├── 12-visibility-and-reachability.md
│   ├── 13-private-module-fragments.md
│   └── 14-module-best-practices.md
│
├── 34-modern-cpp-11/
│   ├── 01-auto.md
│   ├── 02-range-for.md
│   ├── 03-lambda.md
│   ├── 04-smart-pointers.md
│   ├── 05-move-semantics.md
│   ├── 06-rvalue-references.md
│   └── 07-thread.md
│
├── 35-modern-cpp-14/
│   ├── 01-generic-lambda.md
│   ├── 02-lambda-captures.md
│   ├── 03-relaxed-constexpr.md
│   └── 04-variable-templates.md
│
├── 36-modern-cpp-17/
│   ├── 01-structured-bindings.md
│   ├── 02-if-constexpr.md
│   ├── 03-optional.md
│   ├── 04-variant.md
│   ├── 05-any.md
│   ├── 06-string-view.md
│   ├── 07-filesystem.md
│   ├── 08-fold-expressions.md
│   ├── 09-inline-static-members.md
│   └── 10-designated-initializers-preview.md
│
├── 37-modern-cpp-20/
│   ├── 01-concepts.md
│   ├── 02-ranges.md
│   ├── 03-coroutines.md
│   ├── 04-modules.md
│   ├── 05-three-way-comparison.md
│   ├── 06-span.md
│   ├── 07-consteval.md
│   ├── 08-constinit.md
│   ├── 09-designated-initializers.md
│   └── 10-modern-cpp20-summary.md
│
├── 38-modern-cpp-23/
│   ├── 01-expected.md
│   ├── 02-print.md
│   ├── 03-views.md
│   └── 04-new-language-and-library-features.md
│
├── 39-concurrency/
│   ├── 01-thread.md
│   ├── 02-thread-lifecycle.md
│   ├── 03-passing-data-to-threads.md
│   ├── 04-mutex.md
│   ├── 05-lock-guard.md
│   ├── 06-unique-lock.md
│   ├── 07-condition-variable.md
│   ├── 08-atomic.md
│   ├── 09-future-promise.md
│   ├── 10-async.md
│   └── 11-jthread.md
│
└── 99-interview-revision/
    ├── cpp-interview-questions.md
    ├── oop-interview-questions.md
    ├── memory-interview-questions.md
    ├── pointers-and-references-interview-questions.md
    ├── copy-and-move-interview-questions.md
    ├── templates-interview-questions.md
    ├── stl-interview-questions.md
    ├── modern-cpp-interview-questions.md
    ├── concurrency-interview-questions.md
    └── tricky-cpp-questions.md
```

## Learning Approach

Each `.md` file focuses on a specific C++ concept and is designed for:

* Learning the concept
* Understanding the syntax
* Reviewing important rules
* Studying practical examples
* Preparing for C++ interviews
* Quick revision before interviews

The notes are intended to complement the course rather than reproduce the course lectures verbatim.

## C++ Version

The repository covers:

* C++11
* C++14
* C++17
* C++20
* C++23

Interview-oriented examples will generally prefer **C++17 or earlier** where practical, while C++20 and C++23 features are clearly identified.

## Interview Preparation

The repository is designed to build a strong foundation for experienced C++ developer interviews.

The dedicated `99-interview-revision/` directory contains interview-focused questions covering:

* C++ fundamentals
* OOP
* Memory management
* Pointers and references
* Copy and move semantics
* Templates
* STL
* Modern C++
* Concurrency
* Tricky C++ concepts

## Related Learning

Concurrency/multithreading is also covered in this repository, but detailed multithreading study can be maintained separately when needed.

The broader interview preparation can be combined with:

```text
cpp-deep-dive
    ↓
C++ Language + OOP + STL + Modern C++

cpp-dsa-notes
    ↓
Data Structures & Algorithms
```

The goal is to build a practical and interview-ready C++ knowledge base that can be continuously expanded and revised.
