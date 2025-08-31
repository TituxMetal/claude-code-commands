# Commit Message Template

## Content Guidelines

**IMPORTANT**: Never add AI signatures, credits, or "Generated with Claude Code" messages to commit messages. All commit messages should appear as authored by the user, not the AI. Generate clean, professional commit messages without Claude/AI attribution.

## Conventional Commit Format

```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files
- **revert**: Reverts a previous commit

## Scope Examples

- **api**: API related changes
- **ui**: User interface changes
- **db**: Database related changes
- **auth**: Authentication related
- **config**: Configuration changes
- **deps**: Dependency updates

## Description Guidelines

- Use the imperative mood ("Add feature" not "Added feature")
- Keep first line under 72 characters
- Capitalize first letter
- No period at the end of the subject line

## Body Guidelines (Optional)

- Wrap at 72 characters
- Explain what and why, not how
- Separate from subject with blank line

## Footer Guidelines (Optional)

- Reference issues: `Closes #123`, `Fixes #456`, `Refs #789`
- Breaking changes: `BREAKING CHANGE: description`

## Examples

```text
feat(auth): add JWT token validation

Implement JWT middleware for API authentication.
Includes token expiration and signature validation.

Closes #123
```

```text
fix(ui): resolve button alignment issue

Button was not properly centered on mobile devices.
Updated CSS flexbox properties for consistent layout.

Fixes #456
```

```text
docs: update API documentation

Add examples for new authentication endpoints.
Include error response formats.

Refs #789
```

## Issue Integration

When referencing GitHub issues in commits:

- Use `Closes #issue-number` for commits that fully resolve issues
- Use `Fixes #issue-number` for bug fixes
- Use `Refs #issue-number` for partial work or documentation updates
- Multiple issues: `Closes #123, #456`

## Template Variables

When using this template, the git-flow-agent will replace:

- `{{type}}`: Detected commit type from changes
- `{{scope}}`: Inferred scope from file paths
- `{{description}}`: Generated from change analysis
- `{{issue_reference}}`: Appropriate issue reference format
- `{{body}}`: Optional detailed explanation when needed
