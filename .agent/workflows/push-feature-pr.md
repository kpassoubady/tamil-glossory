---
description: How to safely create a feature branch, push changes, and return to master following Gitflow.
---

# Gitflow Feature Workflow

Follow this workflow whenever you need to make changes to the repository. Do not commit directly to `master` or `main`.

## 1. Preparation
1.  Ensure you are on the `master` (or `main`) branch and it is up to date.
    ```bash
    git checkout master
    git pull origin master
    ```

## 2. Create Feature Branch
1.  Create a branch with a descriptive name using the `feature/` prefix.
    ```bash
    git checkout -b feature/short-description-of-change
    ```
    *Example: `feature/add-health-prompts`, `feature/update-readme`*

## 3. Implementation & Commit
1.  Make your changes (edit files, add new files).
2.  Stage and commit using **Conventional Commits**.
    ```bash
    git add .
    git commit -m "feat: Description of feature"
    ```
    *Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`.*

## 4. Push & PR
1.  Push the branch to the remote repository.
    ```bash
    git push -u origin feature/short-description-of-change
    ```
2.  Instruct the user to open a Pull Request (PR) on GitHub.

## 5. Cleanup
1.  Switch back to the main branch to be ready for the next task.
    ```bash
    git checkout master
    ```
