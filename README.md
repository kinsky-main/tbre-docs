# Formula Student ASF Typst Template

A highly customizable, locally deployed Typst template designed for the 2026 Formula Student Autonomous System Form (ASF) reports. 

This template features automatic list-of-abbreviations generation and an automated changelog powered by `git-cliff` [1].

Use (git-cliff)[https://git-cliff.org/] to generate changelog.typ from your git commit history following the Conventional Commits specification TYPE(CHAPTER): COMMIT MESSAGE

## Prerequisites
To compile this document locally, you will need:
1. **Typst CLI**: For compiling the document into a PDF.
2. **git-cliff**: A command-line tool that generates changelogs from your Git repository history using conventional commits [2, 3].

## Installing as a Local Package from a Remote Repository
To use this template across multiple projects without copying the source files every time, you can install it into Typst's local package directory directly from the remote repository.

**Step 1: Locate your Typst local package directory**
Typst looks for local packages in a specific data directory depending on your operating system:
* **Windows:** `%APPDATA%\typst\packages\local\`
* **macOS:** `~/Library/Application Support/typst/packages/local/`
* **Linux:** `~/.local/share/typst/packages/local/`

**Step 2: Clone the repository**
Create a folder structure matching the package name and version defined in the `typst.toml` file (`asf-template/0.1.0`), and clone the remote repository into it. 

For example, on Linux/macOS:
```bash
mkdir -p ~/.local/share/typst/packages/local/asf-template/0.1.0
git clone <YOUR_REMOTE_REPO_URL> ~/.local/share/typst/packages/local/asf-template/0.1.0

## Project Structure
Ensure your project directory looks like this:
```text
.
├── typst.toml       # The Typst package manifest
├── lib.typ          # The template formatting, preamble, and helper functions
├── main.typ         # Your actual report content
├── cliff.toml       # The git-cliff configuration and Typst table template
└── changelog.typ    # (Auto-generated) The changelog table created by git-cliff