# Issue Template

## Title

{{issue_title}}

## Description

{{issue_description}}

## Acceptance Criteria

{{acceptance_criteria}}

## Type of Issue

- [ ] Bug report
- [ ] Feature request
- [ ] Enhancement
- [ ] Documentation
- [ ] Question
- [ ] Other

## Priority

- [ ] Critical (blocks release)
- [ ] High (important for this release)
- [ ] Medium (nice to have for this release)
- [ ] Low (can be postponed)

## Environment (if applicable)

- **OS**: {{os_info}}
- **Browser**: {{browser_info}}
- **Version**: {{version_info}}
- **Node version**: {{node_version}}

## Steps to Reproduce (for bugs)

{{steps_to_reproduce}}

## Expected Behavior

{{expected_behavior}}

## Actual Behavior

{{actual_behavior}}

## Possible Solution

{{possible_solution}}

## Additional Context

{{additional_context}}

## Related Issues

{{related_issues}}

## Definition of Done

- [ ] {{done_criteria_1}}
- [ ] {{done_criteria_2}}
- [ ] {{done_criteria_3}}

---

## Template Variables

This template uses the following variables that will be replaced by the git-flow-agent:

- `{{issue_title}}`: Descriptive title for the issue
- `{{issue_description}}`: Detailed description of the issue or feature
- `{{acceptance_criteria}}`: Clear criteria for when this issue is complete
- `{{steps_to_reproduce}}`: For bugs, steps to reproduce the issue
- `{{expected_behavior}}`: What should happen
- `{{actual_behavior}}`: What actually happens (for bugs)
- `{{possible_solution}}`: Suggested approach or solution
- `{{additional_context}}`: Any additional context or screenshots
- `{{related_issues}}`: Links to related issues or PRs
- `{{os_info}}`, `{{browser_info}}`, `{{version_info}}`, `{{node_version}}`: Environment details
- `{{done_criteria_1}}`, `{{done_criteria_2}}`, `{{done_criteria_3}}`: Specific completion criteria

## Example Usage

When the git-flow-agent creates an issue, it will:

1. Generate a descriptive title based on current work context
2. Fill in description and acceptance criteria
3. Auto-detect environment information where possible
4. Create appropriate task checkboxes for definition of done
5. Assign the issue to @me automatically
6. Apply relevant labels (feature, bug, enhancement, etc.)
7. Link to any related issues or pull requests
