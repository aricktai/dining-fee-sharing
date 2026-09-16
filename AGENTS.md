# AI Coding Instructions

## Project Scope

This is a small iPhone-friendly web application.

## Files AI Should Read 建立工作範圍

The primary source files are:

- index.html
- app.js
- style.css
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
- Before modifying code, read docs/PROJECT.md and docs/REQUIREMENTS.md.

## Requirement Change Detection 自動偵測可能的新規則並更新md

When the user introduces a new requirement, constraint,
preference, or project decision that may affect future work:

1. Do not silently treat it as a permanent rule.
2. Identify it as a potential project change.
3. Ask the user whether it should be recorded.
4. If confirmed, update the appropriate documentation file.
5. Do not update documentation for temporary ideas or discussion.