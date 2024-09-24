# Svelte + Vite

A automatic pitch generator for https://muensterhack.de/

## Recommended IDE Setup

[VS Code](https://code.visualstudio.com/) + [Svelte](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode).

## Setup

Install dependencies: `npm install`

Run dev environment: `npm run dev`

Create productive build: `npm run build`

Deploy: `npm run deploy`

### With Docker

Build environment (hacky dev container): `docker build -t mshack-pitch-generator .`

Run: `docker run --rm -p 5173:5173 mshack-pitch-generator`