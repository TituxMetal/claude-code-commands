# Claude Code Git Flow Command System

A sophisticated, modular git workflow system for Claude Code that provides intent-aware automation
for GitHub-integrated development workflows.

## 🎯 Overview

The Git Flow Command System is a comprehensive solution that orchestrates git and GitHub operations
through specialized sub-agents, providing intelligent workflow automation that understands the
difference between preparation, implementation, and maintenance tasks.

### Key Features

- **🧠 Intent-Aware Processing**: Distinguishes between "prepare", "work on", and "maintain"
  commands
- **📦 Modular Architecture**: Five specialized sub-agents handle specific responsibilities
- **🔄 GitHub Integration**: Automatic issue creation, PR management, and label standardization
- **📝 Smart Templates**: Hierarchical template system with context-aware variable processing
- **🔒 Safety First**: No AI signatures in commits/PRs, validation checkpoints, and user
  confirmations
- **⚡ Workflow Optimization**: Streamlines common git operations with intelligent defaults

## 📋 Prerequisites

- **Claude Code**: Latest version installed and configured
- **Git**: Version 2.20 or higher
- **GitHub CLI**: Version 2.0 or higher, authenticated (`gh auth login`)
- **Unix-like Environment**: Linux, macOS, or WSL on Windows
- **Repository**: Must be a git repository with GitHub remote

## 🚀 Installation

### Quick Install (Recommended)

```bash
# Clone the repository
git clone https://github.com/TituxMetal/claude-code-commands.git
cd claude-code-commands

# Run the installer
chmod +x install.sh
./install.sh
```

### Manual Installation

1. **Create the required directories:**

   ```bash
   mkdir -p ~/.claude/commands
   mkdir -p ~/.claude/agents
   mkdir -p ~/.claude/templates
   ```

2. **Copy the command file:**

   ```bash
   cp commands/git-flow.md ~/.claude/commands/
   ```

3. **Copy all agent files:**

   ```bash
   cp agents/*.md ~/.claude/agents/
   ```

4. **Copy template files:**

   ```bash
   cp templates/*.md ~/.claude/templates/
   ```

5. **Verify installation:**

   ```bash
   # Check if files are in place
   ls -la ~/.claude/commands/git-flow.md
   ls -la ~/.claude/agents/
   ls -la ~/.claude/templates/
   ```

## 🏗️ System Architecture

### Component Overview

```asciiart
┌─────────────────────────────────────────────────────┐
│                  /git-flow Command                   │
│                  (Main Orchestrator)                 │
└────────────────────┬────────────────────────────────┘
                     │
     ┌───────────────┼───────────────┬───────────────┐
     │               │               │               │
     ▼               ▼               ▼               ▼
┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐
│  State   │ │  Intent  │ │  GitHub  │ │   Git    │
│ Analyzer │ │  Parser  │ │ Manager  │ │Operations│
└──────────┘ └──────────┘ └──────────┘ └──────────┘
                                             │
                                             ▼
                                    ┌──────────────┐
                                    │   Template   │
                                    │  Processor   │
                                    └──────────────┘
```

### Sub-Agent Responsibilities

| Agent                  | Primary Role           | Key Functions                              |
| ---------------------- | ---------------------- | ------------------------------------------ |
| **git-state-analyzer** | Repository Analysis    | Git status, branch info, GitHub metadata   |
| **intent-parser**      | Request Interpretation | Classifies intent, validates against state |
| **github-manager**     | GitHub Operations      | Issues, PRs, labels, assignments           |
| **git-operations**     | Git Commands           | Branches, commits, pushes, merges          |
| **template-processor** | Content Generation     | Commit messages, PR descriptions, issues   |

## 💡 Usage

### Basic Commands

```bash
# Check current status and get recommendations
/git-flow

# Prepare for a new task (creates issue and branch, no implementation)
/git-flow prepare for task 11

# Start working on a task (full development workflow)
/git-flow work on authentication feature

# Commit current changes
/git-flow commit my changes

# Create a pull request
/git-flow create PR for current work
```

### Workflow Examples

#### 1. Preparation Workflow

**Use when:** You want to set up work for later without starting implementation

```bash
/git-flow prepare for user authentication feature
```

**What happens:**

1. Creates GitHub issue with appropriate labels
2. Creates feature branch following naming conventions
3. Assigns issue to @me
4. **Stops** - No implementation begins

#### 2. Development Workflow

**Use when:** You're ready to implement a feature or fix

```bash
/git-flow work on task 123
```

**What happens:**

1. Analyzes repository state
2. Creates/updates issue if needed
3. Creates feature branch
4. Allows you to implement
5. Helps with commits using conventional format
6. Creates PR when ready

#### 3. Maintenance Workflow

**Use when:** Managing existing work

```bash
/git-flow commit changes
```

**What happens:**

1. Analyzes current changes
2. Generates conventional commit message
3. Updates related GitHub issue
4. Pushes to remote

### Intent Recognition Examples

The system understands various phrasings:

| Your Command              | Detected Intent | Action             |
| ------------------------- | --------------- | ------------------ |
| "prepare for next sprint" | Preparation     | Setup only         |
| "setup feature X"         | Preparation     | Setup only         |
| "work on bug fix"         | Development     | Full workflow      |
| "implement feature Y"     | Development     | Full workflow      |
| "commit my work"          | Maintenance     | Commit & push      |
| "finish current task"     | Maintenance     | Complete & cleanup |

## ⚙️ Customization

### Template System

Templates follow a hierarchical loading system:

1. **Project Templates** (highest priority): `.github/` directory
2. **Global Templates**: `~/.claude/templates/`
3. **Built-in Templates**: Fallback defaults

To customize templates, create your own in `~/.claude/templates/`:

```bash
# Custom commit message template
cat > ~/.claude/templates/commit-message.md << 'EOF'
{{type}}({{scope}}): {{description}}

{{body}}

{{footer}}
EOF
```

### Branch Naming Conventions

Default patterns (customizable via templates):

- Features: `feature/{issue-number}-{description}`
- Bug fixes: `fix/{issue-number}-{description}`
- Documentation: `docs/{description}`
- Refactoring: `refactor/{description}`

### Label Management

The system automatically creates standard labels if missing:

- `feature` (blue)
- `bug` (red)
- `enhancement` (green)
- `documentation` (yellow)
- `ready-for-review` (green)
- `work-in-progress` (yellow)

## 🔍 Advanced Features

### Conditional Workflow Execution

The command uses XML-style step definitions with conditions:

```xml
<step number="3"
      subagent="github-manager"
      condition="if_github_operations_required">
```

### State Validation Matrix

| Repository State       | Valid Intents            | Invalid Intents          |
| ---------------------- | ------------------------ | ------------------------ |
| Clean + Main Branch    | Preparation, Status      | Development, Maintenance |
| Clean + Feature Branch | Development, Maintenance | Preparation              |
| Dirty + Feature Branch | Maintenance, Development | Preparation              |

### Template Variables

Available in commit/PR/issue templates:

- Git: `{{current_branch}}`, `{{changed_files}}`, `{{commit_hash}}`
- GitHub: `{{repository_name}}`, `{{issue_number}}`, `{{pr_number}}`
- Workflow: `{{intent_type}}`, `{{task_description}}`, `{{change_type}}`

## 🐛 Troubleshooting

### Common Issues

#### GitHub CLI Not Authenticated

```bash
# Fix: Authenticate with GitHub
gh auth login
```

#### Permission Denied Errors

```bash
# Fix: Ensure proper permissions
chmod +x ~/.claude/commands/git-flow.md
```

#### Template Not Loading

```bash
# Check template locations
ls -la ~/.claude/templates/
ls -la .github/
```

#### Branch Already Exists

The system will detect existing branches and suggest alternatives or allow you to switch to them.

### Debug Mode

Enable verbose output by setting the debug flag:

```bash
# In your command
/git-flow --debug prepare for task
```

## 🤝 Contributing

Contributions are welcome! The modular architecture makes it easy to:

1. Add new sub-agents for specialized tasks
2. Create custom templates for your workflow
3. Extend intent parsing capabilities
4. Add new workflow patterns

### Adding a New Sub-Agent

1. Create agent file: `~/.claude/agents/your-agent.md`
2. Define agent role and capabilities
3. Add to workflow in main command
4. Test with various scenarios

## 📚 Documentation

- [Quick Start Guide](QUICKSTART.md) - Get started in 5 minutes
- [License](LICENSE.md) - MIT License terms

## 🔄 Version History

### v1.0.0 (Current)

- Initial release with 5 specialized sub-agents
- Intent-aware workflow processing
- Hierarchical template system
- Full GitHub integration
- Safety features and validation

### Roadmap

- [ ] Configuration file support

## 📄 License

MIT License - See LICENSE file for details

## 🙏 Acknowledgments

Built for the Claude Code community to streamline git workflows and enhance productivity.

---

_For issues, feature requests, or contributions, please visit the
[GitHub repository](https://github.com/TituxMetal/claude-code-commands)._
