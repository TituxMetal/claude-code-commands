# Branch Naming Convention Template

## Standard Branch Naming Patterns

### Feature Branches

```text
feature/{issue-number}-{short-description}
feature/{short-description}
```

**Examples**:

- `feature/123-user-authentication`
- `feature/45-shopping-cart-api`
- `feature/payment-integration`

### Bug Fix Branches

```text
fix/{issue-number}-{short-description}
bugfix/{issue-number}-{short-description}
fix/{short-description}
```

**Examples**:

- `fix/456-login-validation`
- `bugfix/78-cart-calculation`
- `fix/mobile-responsive-layout`

### Hotfix Branches

```text
hotfix/{issue-number}-{short-description}
hotfix/{version}-{short-description}
```

**Examples**:

- `hotfix/789-security-vulnerability`
- `hotfix/1.2.3-critical-bug`

### Enhancement Branches

```text
enhancement/{issue-number}-{short-description}
improve/{issue-number}-{short-description}
```

**Examples**:

- `enhancement/234-performance-optimization`
- `improve/567-user-experience`

### Documentation Branches

```text
docs/{issue-number}-{short-description}
docs/{short-description}
```

**Examples**:

- `docs/123-api-documentation`
- `docs/readme-updates`

### Refactoring Branches

```text
refactor/{issue-number}-{short-description}
refactor/{short-description}
```

**Examples**:

- `refactor/456-user-service`
- `refactor/database-queries`

### Test Branches

```text
test/{issue-number}-{short-description}
test/{short-description}
```

**Examples**:

- `test/789-unit-test-coverage`
- `test/integration-tests`

### CI/CD Branches

```text
ci/{issue-number}-{short-description}
ci/{short-description}
```

**Examples**:

- `ci/123-github-actions`
- `ci/deployment-pipeline`

## Branch Naming Rules

### General Guidelines

- Use lowercase letters only
- Use hyphens (-) to separate words, not underscores or spaces
- Keep descriptions short but descriptive (2-4 words max)
- Include issue number when available
- Use present tense in descriptions ("add-feature" not "added-feature")

### Character Restrictions

- No spaces or special characters except hyphens
- No consecutive hyphens
- No leading or trailing hyphens
- Maximum 50 characters total

### Issue Integration

When creating branches from GitHub issues:

- Always include the issue number if available
- Format: `{type}/{issue-number}-{description}`
- The git-flow-agent will parse issue numbers from branch names
- Ensures automatic linking between branches and issues

## Template Variables

The git-flow-agent uses these variables when creating branch names:

- `{{branch_type}}`: Detected type (feature, fix, docs, etc.)
- `{{issue_number}}`: GitHub issue number if available
- `{{description}}`: Short, kebab-case description
- `{{full_branch_name}}`: Complete generated branch name

## Examples by Context

### From GitHub Issue

If working on GitHub issue #123 "Implement user authentication":

- Generated branch: `feature/123-user-authentication`

### Manual Feature Creation

If user says "I want to add a shopping cart":

- Generated branch: `feature/shopping-cart`

### Bug Fix from Issue

If working on issue #456 "Fix login validation bug":

- Generated branch: `fix/456-login-validation`

### Documentation Update

If adding API documentation:

- Generated branch: `docs/api-documentation`

## Branch Name Validation

The git-flow-agent will validate branch names to ensure:

- Follows naming conventions
- No invalid characters
- Appropriate length
- Matches intended work type
- Includes issue number when available
