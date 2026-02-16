# BMI Calculator Frontend Documentation

## Project overview and goals

This repository contains a single-container React web application intended to be a BMI (Body Mass Index) calculator. The product goal is to provide a lightweight, easy-to-use UI where a user enters height and weight, the app calculates BMI, and then shows the corresponding BMI category (underweight, normal, overweight, obese).

At the time of writing, the codebase under `frontend_bmi_calculator/src/App.js` is still based on the default Create React App template and currently demonstrates a theme toggle (light/dark) rather than the BMI calculator UI. This documentation therefore describes both (a) what is implemented today and (b) the intended BMI calculator behavior described in the work item, so stakeholders understand the goal and developers understand what remains to be built.

## Current implementation status (important)

The current UI renders:

- A header-centered layout with a React logo.
- A light/dark theme toggle button that sets `data-theme` on the `<html>` element.
- Template text and a “Learn React” link.

The BMI-specific inputs, calculation logic, and category display are not yet implemented in the source code.

## Feature list and user flows

### Intended features (target behavior)

The BMI calculator MVP is expected to include:

1. Height input
   - The user can enter their height (commonly in centimeters or meters).
2. Weight input
   - The user can enter their weight (commonly in kilograms).
3. Calculate BMI action
   - The user clicks a “Calculate” button (or equivalent).
4. Result display
   - The UI shows the BMI numeric result (usually rounded to 1–2 decimals).
   - The UI shows a category label:
     - Underweight
     - Normal
     - Overweight
     - Obese
5. Input validation and helpful messaging
   - The UI prevents or clearly messages invalid values (non-numeric, zero, negative).
6. Responsive layout
   - The experience works on mobile and desktop.
7. Theme styling
   - A retro-themed, light-first design aligned with the provided style guide.

### Current features (implemented today)

1. Light/dark theme toggle
   - The user can switch between `light` and `dark` themes.
   - The theme is applied by setting `data-theme` on `document.documentElement`.

### Primary user flow (intended)

1. The user opens the app.
2. The user enters height and weight.
3. The user presses “Calculate”.
4. The app displays BMI and category.
5. The user optionally adjusts inputs to compare results.

### Edge-case flow (intended)

1. The user enters invalid height/weight.
2. The app shows validation feedback and does not compute BMI until inputs are valid.

## UI/UX design notes (retro theme + style guide alignment)

The work item requests a retro feel while following a light theme with blue/cyan accents.

### Style guide reference

The provided style guide emphasizes:

- A light theme.
- Primary accent: `#3b82f6`
- Success/accent: `#06b6d4`
- Background: `#f9fafb`
- Surface: `#ffffff`
- Text: `#111827`
- Layout: a simple centered card with inputs, a calculate button, and a result section below.

### Current styling in the repository

The current `src/App.css` defines theme variables but uses different colors than the provided style guide, for example:

- Light theme button background is currently `--button-bg: #007bff`.
- Text secondary is `--text-secondary: #61dafb`.
- It includes a centered full-height header and a theme toggle positioned in the top-right.

### Practical retro UI guidance (for the BMI UI)

When the BMI calculator UI is implemented, the retro feel can be delivered without heavy frameworks by:

- Using a centered “card” surface with a subtle border and drop shadow.
- Choosing a retro-inspired display font for headings (optional) while keeping body text readable.
- Using slightly exaggerated spacing and “arcade UI” style accents (borders, inset shadows) while still meeting accessibility contrast.
- Keeping inputs large, clear, and mobile-friendly.

This should still respect the light-first palette (blue primary and cyan accent) from the style guide.

## Architecture overview (single frontend container)

This project is a single React container:

- Container: `frontend_bmi_calculator`
- Framework: React (Create React App / `react-scripts`)
- Styling: plain CSS files (`src/App.css`, `src/index.css`)

For a deeper architectural breakdown, see `docs/architecture.md`.

## Environment variables and configuration

This project expects a set of `REACT_APP_*` environment variables to be available (commonly through a `.env` file in a Create React App setup). They may not all be used by the current implementation, but they are part of the container environment contract.

See `docs/configuration.md` for the full list and usage guidance.

## Build and run (preview-aligned)

This repository is intended to be run using the Kavia preview system. Developers typically install dependencies and build/run locally, while users start and stop previews through the platform.

See `docs/setup.md` for practical commands and preview notes.

## Testing strategy

The repository includes Create React App’s default test scaffolding (`src/App.test.js`, `src/setupTests.js`). The current test checks for the “Learn React” link, which aligns with the template UI but not the intended BMI functionality.

See `docs/testing.md` for an outline of a pragmatic testing approach for the BMI calculator.

## Security and compliance considerations

This is a frontend-only application with no authentication and no direct handling of sensitive data beyond user-entered height/weight. Even so, it should follow basic web security hygiene (dependency management, CSP awareness if deployed, safe handling of any configured API URLs).

See `docs/security.md` for details.

## Future enhancements roadmap

See `docs/roadmap.md` for scoped improvements that can be layered on top of the MVP without changing the single-container approach.

## Reference: repository layout

- `frontend_bmi_calculator/`: React application (Create React App)
  - `src/App.js`: Main app component (currently template + theme toggle)
  - `src/App.css`: Theme variables and app styling
  - `src/index.js`: React DOM entry point
  - `package.json`: Dependencies and scripts
- `docs/`: Project documentation (this folder)
- `README.md` at workspace root: minimal workspace marker
