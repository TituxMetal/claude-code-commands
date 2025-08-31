# Pull Request Template

## Content Guidelines

**IMPORTANT**: Never add AI signatures, credits, or "Generated with Claude Code" messages to pull request descriptions. All PR content should appear as authored by the user, not the AI. Generate clean, professional PR descriptions without Claude/AI attribution.

## Summary

{{summary}}

## Changes Made

{{changes_made}}

## Related Issues

{{related_issues}}

## Type of Change

- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as
      expected)
- [ ] Documentation update
- [ ] Code refactoring
- [ ] Performance improvement
- [ ] Test coverage improvement

## Testing

{{testing_notes}}

## Screenshots (if applicable)

{{screenshots}}

## Checklist

- [ ] My code follows the project's coding standards
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes

## Additional Notes

{{additional_notes}}

---

## Template Variables

This template uses the following variables that will be replaced by the git-flow-agent:

- `{{summary}}`: Brief description of what this PR accomplishes
- `{{changes_made}}`: Detailed list of changes based on git diff analysis
- `{{related_issues}}`: Automatically detected and linked GitHub issues
- `{{testing_notes}}`: Information about testing approach and coverage
- `{{screenshots}}`: Placeholder for UI changes (if applicable)
- `{{additional_notes}}`: Any additional context or considerations

## Example Usage

When the git-flow-agent creates a PR, it will:

1. Analyze the git diff to understand changes
2. Find related GitHub issues by branch name
3. Generate appropriate summary and change descriptions
4. Fill in the template variables with context-aware content
5. Assign the PR to @me automatically
6. Apply appropriate labels based on change type
