---
description: Intelligent Git/GitHub Workflow Management
globs:
alwaysApply: false
version: 1.0
encoding: UTF-8
---

# Git Flow Command

Intelligent git/GitHub workflow management command that analyzes current repository state and guides
through logical next steps with context-aware automation.

## Overview

This command orchestrates git and GitHub operations through specialized sub-agents, providing
intent-aware workflow automation that distinguishes between preparation, implementation, and
maintenance tasks.

<process_flow>

<step number="1" subagent="git-state-analyzer" name="analyze_repository_state">

### Step 1: Analyze Repository State

Analyze current git status, branch context, and GitHub integration to understand the current
workflow state.

<analysis_areas> <git_status> - Working directory status (clean/dirty) - Current branch
identification - Staged and unstaged changes - Remote tracking status </git_status>
<github_context> - Repository information and permissions - Open issues and pull requests -
Branch-to-issue relationships - Available labels and milestones </github_context> <workflow_state> -
Current workflow phase (setup/development/review) - Related work items and dependencies - Previous
commit patterns and conventions </workflow_state> </analysis_areas>

<instructions>
  ACTION: Execute comprehensive repository state analysis
  GATHER: Git status, branch info, GitHub context
  IDENTIFY: Current workflow phase and related work
  PREPARE: Context for intent parsing
</instructions>

</step>

<step number="2" subagent="intent-parser" name="determine_user_intent">

### Step 2: Parse User Intent

Analyze user request to determine specific workflow intent and required actions.

<intent_categories> <preparation> - "prepare for task X" → Setup only (issue + branch creation) -
"start working on X" → Setup + initial implementation scaffold - "setup feature Y" → Branch and
issue preparation </preparation> <development> - "work on task X" → Full development workflow -
"implement feature Y" → Complete implementation cycle - "continue work" → Resume development on
current branch </development> <maintenance> - "commit changes" → Commit and push current work -
"create PR" → Pull request creation and management - "finish task" → Task completion and cleanup
</maintenance> </intent_categories>

<instructions>
  ACTION: Parse user request for specific intent
  CLASSIFY: Intent type (prepare/develop/maintain)
  DETERMINE: Required workflow steps
  VALIDATE: Intent matches current repository state
</instructions>

</step>

<step number="3" subagent="github-manager" name="handle_github_operations" condition="if_github_operations_required">

### Step 3: GitHub Operations Management

Handle GitHub issue creation, PR management, label creation, and repository metadata.

<github_operations> <issue_management> - Create issues from task specifications - Link issues to
branches via naming conventions - Update issue checkboxes from commit messages - Apply appropriate
labels and assignments </issue_management> <pull_request_management> - Create PRs with
template-driven descriptions - Link related issues automatically - Apply metadata (labels,
assignees, milestones) - Update PR status based on workflow phase </pull_request_management>
<repository_metadata> - Create standard labels if missing - Assign all issues and PRs to @me -
Manage milestones and project associations - Ensure proper repository configuration
</repository_metadata> </github_operations>

<instructions>
  ACTION: Execute required GitHub operations
  CREATE: Issues, PRs, labels as needed
  ASSIGN: Always assign work to @me
  LINK: Establish proper issue-branch-PR relationships
</instructions>

</step>

<step number="4" subagent="git-operations" name="handle_git_operations" condition="if_git_operations_required">

### Step 4: Git Operations Management

Handle branch creation, commits, pushes, and repository state management.

<git_operations> <branch_management> - Create feature branches with naming conventions - Switch
between branches as needed - Manage branch relationships and merging - Clean up completed branches
</branch_management> <commit_management> - Stage changes logically - Generate conventional commit
messages - Include proper issue references - Group related changes appropriately
</commit_management> <remote_operations> - Push branches to remote repository - Manage remote
tracking relationships - Handle merge conflicts and rebasing - Synchronize with upstream changes
</remote_operations> </git_operations>

<instructions>
  ACTION: Execute required git operations
  FOLLOW: Conventional commit and branch naming standards
  MAINTAIN: Clean repository state and history
  SYNC: Ensure proper remote synchronization
</instructions>

</step>

<step number="5" subagent="template-processor" name="process_templates" condition="if_templates_needed">

### Step 5: Template Processing

Load and process templates for commits, PRs, and issues with context-aware content generation.

<template_processing> <template_hierarchy> - Project templates (.github/ directory) - Global
templates (~/.claude/templates/) - Built-in fallback templates </template_hierarchy>
<content_generation> - Replace template variables with context data - Generate commit messages from
change analysis - Create PR descriptions with change summaries - Build issue content from
specifications </content_generation> <customization> - Ask user for missing required information -
Validate generated content for completeness - Allow user to review and modify before use
</customization> </template_processing>

<instructions>
  ACTION: Process templates with current context
  GENERATE: Context-aware content for git/GitHub operations
  VALIDATE: Template output for completeness
  CUSTOMIZE: Allow user input for missing details
</instructions>

</step>

</process_flow>

## Intent-Based Execution

### Preparation Workflow

**Triggers**: "prepare for task X", "setup feature Y"

- Steps: 1 → 2 → 3 → 4 (GitHub + Git setup only)
- **No implementation** - stops after branch and issue creation

### Development Workflow

**Triggers**: "work on task X", "implement feature Y"

- Steps: 1 → 2 → 3 → 4 → 5 (Full workflow with templates)
- Includes actual implementation and commit cycles

### Maintenance Workflow

**Triggers**: "commit changes", "create PR", "finish task"

- Steps: 1 → 2 → conditional sub-steps
- Handles ongoing work management and completion

## Safety Features

- **Intent validation**: Confirms parsed intent matches user expectation
- **State validation**: Ensures operations are appropriate for current state
- **User confirmation**: Asks for approval on ambiguous operations
- **Template validation**: Reviews generated content before use
- **Rollback capability**: Allows undo of problematic operations

## Output Guidelines

- **No AI Signatures**: Never add AI-generated signatures, credits, or "Generated with Claude Code"
  messages to commits, PRs, or issues
- **Clean Content**: Generate clean, professional content without Claude/AI attribution
- **User Voice**: All content should appear as written by the user, not the AI
