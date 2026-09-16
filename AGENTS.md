# AI Coding Instructions

## Project Scope

This is a small iPhone-friendly web application.

## Files AI Should Read 建立工作範圍

The primary source files are:

- index.html
- All Markdown files in the repository root
- All Markdown files under docs/ 


## Files AI Should NOT Read Unless Explicitly Requested 排除工作範圍

Do not inspect these directories unless the user specifically asks:

- backup/
- old/
- archive/
- test-data/
- screenshots/

## Important Rules

- Do not modify archived versions.
- Do not inspect old versions to determine current behavior unless explicitly requested.
- Treat index.html, app.js and style.css as the current implementation.
- Before modifying code:
1. Read docs/PROJECT_CONTEXT.md.
2. Read docs/CURRENT_STATE.md.
3. Read the relevant sections of docs/PRODUCT_SPEC.md.
4. Read docs/BUSINESS_RULES.md when the change affects business logic.
5. Read docs/UI_SPEC.md when the change affects UI/UX.
6. Read docs/API_INTEGRATION.md when the change affects external services.
7. Read docs/DECISIONS.md when the change may conflict with an existing design decision.

Treat the current implementation file as:
- index.html

Do not assume app.js or style.css exists unless those files are actually added to the repository.

Source-of-truth priority:
- The user's current explicit instruction has highest priority.
- Among project documents, use PROJECT_CONTEXT.md, PRODUCT_SPEC.md, BUSINESS_RULES.md, DECISIONS.md, and CURRENT_STATE.md as the primary sources of truth.
- README.md is primarily for human-facing project information.
- Historical/original documents, if added later under docs/original/, are reference material and should not override current project documentation.

## Versioning 版本規則

- Current baseline version: V3.7.
- The next version must be V3.8.
- Do not create multi-level versions such as V3.7.1 or V3.7.6.5.
- Keep version references consistent across code and documentation.

## Documentation Maintenance 文件維護

- Do not silently rewrite established project rules.
- If a code change makes current documentation inaccurate, identify the affected document.
- After a confirmed requirement or design change, update the appropriate documentation before or together with the code change.
- Keep CURRENT_STATE.md synchronized with the actual implementation after completed changes.
- Record important confirmed design decisions in DECISIONS.md.
- Record released changes in CHANGELOG.md.

## Current Architecture 目前架構

- This project is currently a single-file web application.
- The primary implementation file is `index.html`.
- Do not split the application into app.js/style.css or other source files unless the user explicitly requests that architectural change.
- Preserve existing functionality when making incremental changes.

## Protected Configuration

- Never replace, expose, or invent Supabase secret/service-role keys.
- The browser application may contain the intended Supabase publishable key.
- Do not invent credentials, tokens, passwords, or private configuration values.
- Do not modify backend security/RLS assumptions without explicitly identifying the impact and obtaining confirmation when the change is a project-level decision.

## Requirement Change Detection 自動偵測可能的新規則並更新md

When the user introduces a new requirement, constraint,
preference, or project decision that may affect future work:

1. Do not silently treat it as a permanent rule.
2. Identify it as a potential project change.
3. Ask the user whether it should be recorded.
4. If confirmed, update the appropriate documentation file.
5. Do not update documentation for temporary ideas or discussion.