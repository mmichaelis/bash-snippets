# Contributing to Bash Snippets

Thank you for your interest in contributing to this bash snippets collection! This guide will help you set up your development environment and understand our contribution workflow.

## 🛠️ Development Environment Setup

### Prerequisites

- **Git**: Version 2.20+ recommended
- **VS Code**: Latest stable version
- **Bash**: Version 4.0+ (most modern systems)
- **ShellCheck**: For linting bash scripts

### VS Code Setup

This project includes VS Code configuration to ensure consistent development experience:

#### Recommended Extensions

When you open this project in VS Code, you'll be prompted to install recommended extensions. These include:

- **Conventional Commits** - Helps create standardized commit messages
- **GitLens** - Enhanced Git capabilities
- **ShellCheck** - Bash script linting
- **Shell Format** - Consistent script formatting
- **Markdown All in One** - Documentation editing
- **Code Spell Checker** - Catch typos

#### Project Settings

The `.vscode/settings.json` file contains project-specific settings:

- **Conventional Commits**: Configured with 'snippets' scope
- **Line Length Validation**: 50 chars for commit subjects, 72 for body
- **Auto-commit Prevention**: All auto-commit features disabled for safety
- **Shell Formatting**: Consistent indentation and style

## 📝 Contribution Workflow

### 1. Fork and Clone

```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR_USERNAME/bash-snippets.git
cd bash-snippets
```

### 2. Create a Feature Branch

```bash
git checkout -b feat/your-feature-name
```

### 3. Make Your Changes

- Add new snippets to the `snippets/` directory
- Follow existing naming conventions
- Include clear comments in your scripts
- Test your scripts on multiple bash versions if possible

### 4. Test Your Changes

```bash
# Run shellcheck on your scripts
shellcheck snippets/your-script.sh

# Test the script functionality
bash snippets/your-script.sh
```

### 5. Commit Your Changes

This project uses **Conventional Commits** for standardized commit messages:

```bash
# Stage your changes
git add .

# Commit with conventional format (VS Code will guide you)
git commit
```

**Commit Message Format:**
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Examples:**
- `feat(snippets): add file search utility script`
- `fix(cd): resolve bookmark creation issue`
- `docs: update installation instructions`

**Types:**
- `feat`: New features or scripts
- `fix`: Bug fixes
- `docs`: Documentation only changes
- `style`: Code style improvements
- `refactor`: Code refactoring
- `test`: Adding or fixing tests
- `chore`: Build process or auxiliary tool changes

**Scope:**
- `snippets`: For changes to script files
- `docs`: For documentation changes
- `config`: For configuration changes

### 6. Push and Create Pull Request

```bash
git push origin feat/your-feature-name
```

Then create a pull request on GitHub with:
- Clear description of what your snippet does
- Examples of usage
- Any dependencies or requirements

## 📋 Code Standards

### Bash Script Guidelines

1. **Shebang**: Use `#!/usr/bin/env bash`
2. **Error Handling**: Include proper error checking
3. **Comments**: Document complex logic
4. **Portability**: Aim for POSIX compliance where possible
5. **Testing**: Test on multiple environments

### File Organization

```
snippets/
├── category/
│   ├── script-name.sh
│   └── README.md (if category needs explanation)
└── README.md (if general snippets)
```

### Naming Conventions

- Use lowercase with hyphens: `my-script.sh`
- Be descriptive: `find-large-files.sh` not `find.sh`
- Include category prefix if needed: `git-branch-cleanup.sh`

## 🔧 VS Code Tips

### Commit Message Helper

When you run `git commit`, VS Code opens with a template:

```
feat(snippets): <brief description>

<detailed explanation of what and why>

Closes #123
```

### Extension Features

- **GitLens**: View file history, blame annotations
- **ShellCheck**: Real-time bash linting
- **Conventional Commits**: Guided commit message creation

### Settings Explanation

Our VS Code settings ensure:
- No accidental commits (manual confirmation required)
- Proper commit message formatting
- Consistent code style
- Enhanced Git integration

## 🤝 Getting Help

- **Issues**: Report bugs or request features via GitHub Issues
- **Discussions**: Use GitHub Discussions for questions
- **Code Review**: All contributions are reviewed for quality and compatibility

## 📜 License

By contributing, you agree that your contributions will be licensed under the same license as this project.

---

**Happy Contributing!** 🎉
