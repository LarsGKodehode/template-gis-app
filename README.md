<p align="center">
  <a href="https://github.com/larsgkodehode">
    <picture>
      <img src="documentation/assets/logo.svg" height="128">
    </picture>
    <h1 align="center">{{ application_title }}</h1>
  </a>

  <p align="center">
    <a href="https://nixos.org/">
      <img alt="Static Badge" src="https://img.shields.io/badge/Nix-2.23.3-blue?style=for-the-badge&logo=nixos&logoSize=auto">
    </a>
    <a href="https://opencontainers.org/">
      <img alt="Static Badge" src="https://img.shields.io/badge/OCI-1.1.0-purple?style=for-the-badge&logo=opencontainersinitiative&logoSize=auto">
    </a>
  </p>

  <p align="center">
    <a href="https://react.dev/">
      <img alt="Static Badge" src="https://img.shields.io/badge/React-18-lightblue?style=for-the-badge&logo=react&logoSize=auto">
    </a>
    <a href="https://vis.gl/">
      <img alt="Static Badge" src="https://img.shields.io/badge/Vis.gl-gray?style=for-the-badge&logoSize=auto">
    </a>
    <a href="https://mapbox.com/">
      <img alt="Static Badge" src="https://img.shields.io/badge/Mapbox-gray?style=for-the-badge&logo=mapbox&logoSize=auto">
    </a>
  </p>

  <p align="center">
    <img alt="GitHub License" src="https://img.shields.io/github/license/larsgkodehode/template-gis-app?style=for-the-badge">
  </p>
</p>

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

This is a baseline project structure, fill out or remove based on project specifics

```
.
│   # Project workflows and GitHub templates
├── /.github
│   # Documentation for the project, its usage, along with design files
├── /documentation
│   # Modules that can be shared across applications
├── /modules
│   # Concrete applications for deployment
├── /applications
│   # Concrete backend services for deployment
├── /services
│   # System infrastructure description for environments
├── /infrastructure
│   # Description of currently deployements across environments
├── /deployements
│   # Development environment description, and packaging descriptions
└── flake.nix
```

## Technologies

These covers the baseline of a typical Web Application with GIS components. Modify to fit project scope

### External Tools

- [GitHub]()
  - Version Control Platform
  - Source repository
  - Issue Tracker
  - Design Log
- [Slack]() Asynchronous Communication Platform
- [Figma]() Graphical User Interface design tool
- [Mapbox Studio]() Map Design studio
- [shields.io & simpleicons.org]() For live and static badges

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
