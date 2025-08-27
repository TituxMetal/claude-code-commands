# Quick Start Guide

Get started with the Claude Code Git Flow Command System in 5 minutes!

## 🚀 Installation (1 minute)

```bash
# Clone and install
git clone https://github.com/TituxMetal/claude-code-commands.git
cd claude-code-commands
chmod +x install.sh
./install.sh
```

## ✅ Prerequisites Check (1 minute)

```bash
# Verify git is installed
git --version

# Verify GitHub CLI is installed
gh --version

# Authenticate with GitHub (if not already done)
gh auth login
```

## 🎯 Your First Commands (3 minutes)

### 1. Check Current Status

Start by understanding where you are:

```bash
/git-flow
```

**What you'll see:**

- Current branch and git status
- Workflow recommendations based on state
- Any pending work or issues

### 2. Prepare Work (Setup Only)

Set up a new task without starting implementation:

```bash
/git-flow prepare for user authentication
```

**What happens:**

- ✅ Creates GitHub issue
- ✅ Creates feature branch
- ✅ Assigns issue to you
- ⛔ Stops (no coding starts)

**You'll see:**

```text
Created issue #123: User authentication
Created branch: feature/123-user-authentication
Ready to work! Use '/git-flow work on task 123' when ready to implement.
```

### 3. Work on a Feature

Start actual development:

```bash
/git-flow work on task 123
```

**What happens:**

- ✅ Switches to feature branch
- ✅ Shows issue details
- ✅ Ready for you to code
- ✅ Helps with commits
- ✅ Creates PR when ready

### 4. Commit Your Changes

After making changes:

```bash
/git-flow commit changes
```

**What happens:**

- ✅ Analyzes your changes
- ✅ Generates conventional commit message
- ✅ Commits with proper format
- ✅ Pushes to remote

**Example commit generated:**

```text
feat(auth): implement JWT token validation

Add middleware for validating JWT tokens.
Includes expiration and signature checks.

Refs #123
```

### 5. Create a Pull Request

When ready for review:

```bash
/git-flow create PR
```

**What happens:**

- ✅ Creates PR with template
- ✅ Links to related issue
- ✅ Assigns to you
- ✅ Applies appropriate labels

## 📚 Common Workflows

### Starting Fresh Work

```bash
# Monday morning, starting new sprint
/git-flow prepare for next sprint tasks

# Ready to implement
/git-flow work on task 124
```

### Continuing Yesterday's Work

```bash
# Check where you left off
/git-flow

# Continue on current branch
/git-flow commit my changes
```

### Quick Bug Fix

```bash
# Create and work on bug fix
/git-flow work on login validation bug

# After fixing
/git-flow commit fix
/git-flow create PR
```

## 🎨 Intent Examples

The system understands natural language:

| You Say            | System Understands | Action               |
| ------------------ | ------------------ | -------------------- |
| "prepare for task" | Preparation intent | Setup only           |
| "work on feature"  | Development intent | Full workflow        |
| "commit my work"   | Maintenance intent | Commit & push        |
| "what's next?"     | Status intent      | Show recommendations |

## ⚡ Pro Tips

### 1. Use Natural Language

The command understands context:

```bash
/git-flow prepare for implementing the shopping cart
/git-flow work on authentication system
/git-flow commit the validation fixes
```

### 2. Leverage Auto-Detection

The system detects:

- Issue numbers from branch names
- Change types from file modifications
- Appropriate commit message format
- Required GitHub labels

### 3. Quick Status Checks

Just type `/git-flow` alone to:

- See current branch status
- Get workflow recommendations
- Check for uncommitted changes
- View related issues/PRs

## 🔧 Customization

### Custom Templates

Add your commit template:

```bash
cat > ~/.claude/templates/commit-message.md << 'EOF'
{{type}}: {{description}}

Task: {{issue_number}}
EOF
```

## 📋 Cheat Sheet

```bash
# Status and recommendations
/git-flow

# Setup work (no implementation)
/git-flow prepare for [task description]

# Full development workflow
/git-flow work on [task/feature]

# Commit changes
/git-flow commit [optional message]

# Create pull request
/git-flow create PR

# Complete current task
/git-flow finish task
```

## 🆘 Quick Troubleshooting

### "GitHub CLI not authenticated"

```bash
gh auth login
```

### "Not a git repository"

```bash
git init
git remote add origin [your-repo-url]
```

### "Branch already exists"

The system will ask if you want to switch to it or create a new one.

### "Uncommitted changes"

The system will offer to stash or commit them first.

## 📖 Next Steps

Now that you're up and running:

1. **Explore workflows**: Try different commands to see how they adapt
2. **Customize**: Edit templates to match your style
3. **Read the docs**: Check [README.md](README.md) for advanced features

## 💡 Example Session

Here's a complete workflow example:

```bash
# Start your day
$ /git-flow
> You're on main branch with no changes. Ready to start new work!

# Prepare a task
$ /git-flow prepare for adding user profiles
> Created issue #125: Adding user profiles
> Created branch: feature/125-user-profiles
> Setup complete! Use 'work on task 125' when ready.

# Start working (later)
$ /git-flow work on task 125
> Switched to feature/125-user-profiles
> Issue #125 is open and assigned to you
> Ready for implementation!

# After coding...
$ /git-flow commit changes
> Generated commit: "feat(users): add user profile model and API"
> Pushed to origin/feature/125-user-profiles

# Create PR when done
$ /git-flow create PR
> Created PR #45: "feat(users): add user profile functionality"
> Linked to issue #125
> Ready for review!
```

---

**Need help?** Just run `/git-flow` to see your current status and get contextual help!
