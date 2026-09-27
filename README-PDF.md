# C++ Masterclass PDF Setup — v3

This version is intended for the final printable C++ Masterclass book.

## What it does

- Includes exactly the 38 learning chapters:
  `01-cpp-fundamentals` through `38-modern-cpp-23`
- Excludes `99-interview-revision`
- Groups the PDF into 38 major chapters matching the repository structure
- Does not insert `\newpage` between Markdown files
- Does not intentionally create blank pages
- Preserves normal Pandoc syntax highlighting for C++ code
- Does not expose Windows backslashes as LaTeX commands
- Generates a table of contents

## Build

From the repository root:

```powershell
.\build-pdf.ps1
```

If PowerShell blocks the script:

```powershell
powershell -ExecutionPolicy Bypass -File .\build-pdf.ps1
```

Output:

```text
build/
├── cpp-masterclass-combined.md
└── cpp-masterclass.pdf
```

## Expected structure

The PDF will contain:

```text
Chapter 1  — C++ Fundamentals
Chapter 2  — Operators and Expressions
Chapter 3  — Constants and Conversions
...
Chapter 38 — Modern C++23
```

The interview-revision folder is intentionally not included.

## Git

Add:

```gitignore
/build/
```

to `.gitignore`.
