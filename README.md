# {{ Application Title }}

A template for developing web based Geospatial Information Applications, using React and Vis.gl.
The set of files here are for a very generic Web GIS application, further refinement needs to be done
to narrow it down to a pure client side app, or one which includes backend systems.

## Content

- [Project Structure](#project-structure)
- [Technologies](#technologies)
  - [External Tools](#external-tools)
  - [Development](#development)
  - [Operations](#operations)
  - [Frontend](#frontend)
    - [Generic](#generic)
    - [GUI](#gui)
    - [GIS Specific](#gis-specific)

## Project Structure

{{ This is a baseline project structure, fill out or remove based on project specifics }}

´´´shell
.
├── /.github        # Project workflows and GitHub templates
├── /documentation  # Documentation for the project, its usage, along with design files
├── /modules        # Modules that can be shared across applications
├── /applications   # Concrete applications for deployment
├── /services       # Concrete backend services for deployment
├── /infrastructure # System infrastructure description for environments
├── /deployements   # Description of currently deployements across environments
└── flake.nix       # Development environment description, and packaging descriptions
´´´

## Technologies

{{ These covers the baseline of a typical Web Application with GIS components. Modify to fit project scope }}

### External Tools

- [GitHub]()
  - Version Control Platform
  - Source repository
  - Issue Tracker
  - Design Log
- [Slack]() Asynchronous Communication Platform
- [Figma]() Graphical User Interface design tool
- [Mapbox Studio]() Map Design studio

### Development

- [Nix]():
  - Manages System definitions
  - Acts as a deterministic and repreducible build system
- [GitHub Actions]() Used for defining project Workflows
  - Continuous Integration
  - Continuous Delivery
  - Automatic Updates
  - Security Scanning

### Operations

- [Docker/OCI Containers]() Standardized Application and Services distribution format
- [Static Web Server]() Minimalistic static file server
- [Sentry]() Application Monitoring
- [Azure, AWS, GCP, Vercel, Netlify]() Infrastructure providers (Have not decided yet)
  - Compute
  - Network
  - Persistence
- [k8s, k3s, k0s]() Complex, versioned orchestration solutions
- [Terraform]() Version Controlled infrastructure description

### Frontend

#### Generic

- [NodeJS]() JavaScript runtime environment
- [NPM]() Manages NodeJS and JS dependencies
- [JavaScript]() Main programming language
- [TypeScript]() Provides a typesystem on top of JavaScript
- [Prettier]() Formats projects
- [ESLint]() Provides linting capabilities to project
- [Vitest]() Used for unit testing and some integration testing
  - [Testing Library]() Library for simplifying testing Web GUIs
  - [Mock Service Workers]() Library mocking out external dependencies
- [Playwright]() Used for End-to-End testing of user journeys
- [Vite PWA]() For providing _applike_ functionality to the web based client
- [Storybook]() A library for creating Design Systems, giving a consistent look to applications

#### GUI

- [React]() Provides a rendering engine for the browser
- [TailwindCSS]() Premade CSS classes
- [Heroicons]() Basic common iconography
- [Framer Motion]() Animation library for React Components
- [RadixUI]() Used as an unstyled React Component library
- [Zustand]() Acts as Publish/Subscribe state management solution
- [TanStack Query]() Provides standardized networked communication patterns
- [TanStack Router]() Handles client side routing

#### GIS Specific

- [Turf.js]() For spatial analysis on JavaScript clients
- [Vis.gl]() Set of Open Source frameworks for GPU powered geospatial visualization
  - [deck.gl]()
  - [luma.gl]()
  - [kepler.gl]()
  - [react-map-gl]()
  - [deck.gl-community]()
- [Mapbox Maps API]() Map data source
- [Google Maps]() Map data source
- [OpenStreetMaps]() Map data source
