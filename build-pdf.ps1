$ErrorActionPreference = "Stop"

# ------------------------------------------------------------
# C++ Masterclass PDF Builder
# Builds Chapters 01-38 only
# Excludes 39-concurrency and 99-interview-revision
# ------------------------------------------------------------

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$BuildDir = Join-Path $RepoRoot "build"

$CombinedMd = Join-Path $BuildDir "cpp-masterclass-combined.md"
$PdfFile    = Join-Path $BuildDir "cpp-masterclass.pdf"

# ------------------------------------------------------------
# Check required tools
# ------------------------------------------------------------

if (-not (Get-Command pandoc -ErrorAction SilentlyContinue)) {
    throw "Pandoc was not found in PATH. Install Pandoc first."
}

if (-not (Get-Command xelatex -ErrorAction SilentlyContinue)) {
    throw "XeLaTeX was not found in PATH. Install a LaTeX distribution such as MiKTeX."
}

# ------------------------------------------------------------
# Create build directory
# ------------------------------------------------------------

if (-not (Test-Path $BuildDir)) {
    New-Item -ItemType Directory -Path $BuildDir | Out-Null
}

# ------------------------------------------------------------
# Chapter titles
# ------------------------------------------------------------

$ChapterTitles = @{
    "01" = "C++ Fundamentals"
    "02" = "Operators and Expressions"
    "03" = "Constants and Conversions"
    "04" = "Control Flow"
    "05" = "Loops"
    "06" = "Arrays"
    "07" = "Pointers and References"
    "08" = "Memory Management"
    "09" = "Strings"
    "10" = "Functions"
    "11" = "Enums and Type Aliases"
    "12" = "Lambdas and Callables"
    "13" = "Static, Inline and Recursion"
    "14" = "Debugging"
    "15" = "Templates"
    "16" = "Concepts"
    "17" = "Classes and OOP"
    "18" = "Constructors and Initialization"
    "19" = "Copy and Move Semantics"
    "20" = "Namespaces and Linkage"
    "21" = "Memory Management"
    "22" = "Operator Overloading"
    "23" = "Comparisons and Spaceship"
    "24" = "Inheritance"
    "25" = "Polymorphism"
    "26" = "Exception Handling"
    "27" = "Class Templates"
    "28" = "STL Containers"
    "29" = "Iterators"
    "30" = "STL Algorithms"
    "31" = "Ranges and Views"
    "32" = "Coroutines"
    "33" = "Modules"
    "34" = "Modern C++11"
    "35" = "Modern C++14"
    "36" = "Modern C++17"
    "37" = "Modern C++20"
    "38" = "Modern C++23"
}

# ------------------------------------------------------------
# Find Chapters 01-38
# ------------------------------------------------------------

$ChapterDirs = Get-ChildItem -Path $RepoRoot -Directory |
    Where-Object {
        $_.Name -match '^(0[1-9]|[12][0-9]|3[0-8])-'
    } |
    Sort-Object Name

if ($ChapterDirs.Count -eq 0) {
    throw "No chapter directories were found."
}

Write-Host ""
Write-Host "Found $($ChapterDirs.Count) chapter directories."
Write-Host ""

# ------------------------------------------------------------
# Create UTF-8 without BOM writer
# ------------------------------------------------------------

$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$Writer = New-Object System.IO.StreamWriter(
    $CombinedMd,
    $false,
    $Utf8NoBom
)

try {

    # --------------------------------------------------------
    # Metadata
    # --------------------------------------------------------

    $MetadataFile = Join-Path $RepoRoot "metadata.yaml"

    if (-not (Test-Path $MetadataFile)) {
        throw "metadata.yaml was not found."
    }

    $Writer.WriteLine("---")
    $Writer.WriteLine("title: `"C++ Masterclass`"")
    $Writer.WriteLine("subtitle: `"C++ Fundamentals to Modern C++23`"")
    $Writer.WriteLine("author: `"__`"")
    $Writer.WriteLine("lang: en-US")
    $Writer.WriteLine("---")
    $Writer.WriteLine("")

    # --------------------------------------------------------
    # Add chapters
    # --------------------------------------------------------

    foreach ($ChapterDir in $ChapterDirs) {

        $ChapterNumber = $ChapterDir.Name.Substring(0, 2)

        if (-not $ChapterTitles.ContainsKey($ChapterNumber)) {
            Write-Warning "No title found for $($ChapterDir.Name). Skipping."
            continue
        }

        $Title = $ChapterTitles[$ChapterNumber]

        Write-Host "Processing Chapter $ChapterNumber - $Title"

        # Chapter heading
        $Writer.WriteLine("# Chapter $ChapterNumber - $Title")
        $Writer.WriteLine("")

        # Find markdown files
        $MarkdownFiles = Get-ChildItem `
            -Path $ChapterDir.FullName `
            -Filter "*.md" `
            -File |
            Sort-Object Name

        foreach ($MarkdownFile in $MarkdownFiles) {

            Write-Host "   + $($MarkdownFile.Name)"

            # Read explicitly as UTF-8
            $Content = [System.IO.File]::ReadAllText(
                $MarkdownFile.FullName,
                [System.Text.Encoding]::UTF8
            )

            $Writer.WriteLine($Content)
            $Writer.WriteLine("")
            $Writer.WriteLine("")
        }

        # Page break between chapters
        $Writer.WriteLine("\newpage")
        $Writer.WriteLine("")
    }

}
finally {
    $Writer.Close()
}

# ------------------------------------------------------------
# Build PDF
# ------------------------------------------------------------

Write-Host ""
Write-Host "Building PDF..."
Write-Host ""

pandoc `
    $CombinedMd `
    "--from=markdown" `
    "--metadata-file=$MetadataFile" `
    "--pdf-engine=xelatex" `
    "--toc" `
    "--toc-depth=1" `
    "--number-sections=false" `
    "--syntax-highlighting=tango" `
    "-o" `
    $PdfFile

if (-not (Test-Path $PdfFile)) {
    throw "PDF generation failed."
}

Write-Host ""
Write-Host "=============================================="
Write-Host "PDF generated successfully!"
Write-Host "=============================================="
Write-Host ""
Write-Host "Combined Markdown:"
Write-Host $CombinedMd
Write-Host ""
Write-Host "PDF:"
Write-Host $PdfFile
Write-Host ""