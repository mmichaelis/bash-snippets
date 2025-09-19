# Conventional Commits Configuration Guide

## What's Been Configured

### VS Code Settings (`.vscode/settings.json`)

- **Line Length Validation**:
  - Subject line: 50 characters max
  - Body: 72 characters max
- **Visual Rulers**: Lines at 50 and 72 characters in commit message editor
- **Auto-commit Prevention**: All auto-commit features disabled
- **GitLens Integration**: Optimized for conventional commits

### Git Configuration

- **Commit Template**: `.gitmessage` with conventional commit format
- **Editor**: VS Code set as default Git editor
- **Manual Confirmation**: Required for sync, force push, etc.

## Key Features

### Line Length Enforcement

✅ **Subject Line**: Limited to 50 characters  
✅ **Body Text**: Wrapped at 72 characters  
✅ **Visual Guides**: Rulers show exact limits  

### Auto-Commit Prevention

✅ **Smart Commit**: Disabled  
✅ **Auto Fetch**: Disabled  
✅ **Auto Stash**: Disabled  
✅ **Confirmation Required**: For all destructive operations  

### Conventional Commit Support

✅ **Template**: Pre-filled with conventional format  
✅ **Scopes**: Configured for 'snippets' scope  
✅ **Type Hints**: Available in commit message editor  

## How to Use

### Creating a Commit

1. Stage your changes: `git add .`
2. Start commit: `git commit` (VS Code will open)
3. Follow the template format:

   ```
   feat(snippets): add new navigation script
   
   Add enhanced cd functionality with bookmarks
   and directory history support.
   
   Closes #123
   ```

### Visual Indicators

- **Red line at 50 chars**: Subject line limit
- **Yellow line at 72 chars**: Body wrap point
- **Input validation**: Real-time feedback for length

### Conventional Commit Types

- `feat`: New features
- `fix`: Bug fixes  
- `docs`: Documentation
- `style`: Code style changes
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Tests
- `chore`: Build/tooling changes

## Benefits

- ✅ **No accidental commits**: Manual confirmation required
- ✅ **Proper formatting**: Automatic line length validation
- ✅ **Consistent style**: Template ensures conventional format
- ✅ **Better readability**: Optimal line lengths for all Git tools
- ✅ **Team compatibility**: Follows industry standards
