# Frontend Architecture (BMI Calculator)

## Overview

The BMI Calculator is implemented as a single React frontend container (`frontend_bmi_calculator`). The intended purpose is to provide a browser-based user interface that collects a user’s height and weight, calculates BMI on the client, and displays both the numeric result and a BMI category. The current codebase is still largely the Create React App template, with a light/dark theme toggle implemented in `src/App.js`.

## System Components

The system consists of a single deployable component:

- React application (Create React App)
  - `src/index.js` mounts the React component tree into the DOM element with id `root`.
  - `src/App.js` defines the top-level `App` component. Today it manages theme state and renders a template header. In the target state it should contain or compose the BMI input form and result display.
  - `src/App.css` provides global theme variables (light and dark) and component-level styles such as the theme toggle button.
  - `src/index.css` provides baseline global styles for the document body and `code` elements.

There is no backend container in this work item and no database component.

## Data Flow

In the intended BMI calculator implementation, data flow is expected to be entirely client-side:

1. The user enters height and weight into controlled form inputs.
2. The app stores these values in React component state.
3. When the user triggers calculation, the app derives BMI from state values and computes a category label.
4. The computed BMI and category are rendered in the result section.

In the current implementation, data flow is limited to theme state:

1. The user clicks the theme toggle button.
2. `App` updates `theme` via React `useState`.
3. A `useEffect` writes the theme into the DOM by setting `data-theme` on `document.documentElement`.
4. CSS selectors in `App.css` apply the corresponding theme variables.

## Technology Stack

- React 18 with Create React App (`react-scripts`)
- JavaScript (no TypeScript)
- Styling via plain CSS files
- Testing scaffolding via Jest and Testing Library (as provided by Create React App)
- ESLint configuration via `eslint.config.mjs`

## Deployment Architecture

The deployment is a single static frontend build:

- Development mode uses the Create React App dev server (`react-scripts start`).
- Production builds output static assets in the `build/` directory (`react-scripts build`).

In the Kavia environment, the app is typically accessed via the platform’s preview URL. Users start and stop previews through the preview system, which maps the container’s port (commonly 3000) to an accessible URL.

## Security Considerations

Because this is a frontend-only application:

- There is no authentication or authorization implemented at the application layer.
- The main security considerations are supply-chain risk (npm dependencies), safe configuration of any API base URLs if introduced, and standard browser-side concerns like avoiding unsafe HTML injection patterns if user content is ever rendered.

The current code does not accept or render untrusted HTML and only manipulates the DOM for a theme attribute.

## Scalability & Performance

The app is small and should perform well as a static site. Performance and scalability considerations are primarily:

- Keeping bundle size low by avoiding heavy dependencies.
- Avoiding unnecessary re-renders during input and calculation.
- Ensuring good mobile performance via responsive CSS.

There are no server-side scalability concerns because no backend is present.

## Error Handling & Monitoring

In the current state, there is no application-level logging, telemetry, or error boundary setup.

In the target BMI implementation, error handling should include:

- Client-side validation for height and weight input values.
- Clear user-facing messages for invalid input.

If monitoring is desired in the future, it should be introduced as an optional, explicitly configured client-side telemetry integration, gated behind environment variables.
