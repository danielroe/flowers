
# 🚧 Repository update 🚧

This repository has been archived. Please feel free to [contact me directly](https://github.com/danielroe) if you have any questions.

<hr>
# Nuxt 3 Minimal Starter

Look at the [Nuxt 3 documentation](https://nuxt.com/docs/getting-started/introduction) to learn more.

## Setup

### Install EdgeDB CLI

```bash
# npm
bun install
curl --proto '=https' --tlsv1.2 -sSf https://sh.edgedb.com | sh
```

### Initialize EdgeDB Project

```bash
edgedb project init
```

### Configure EdgeDB Auth

Open the EdgeDB UI to configure authentication:

```bash
edgedb ui
```

Inside the EdgeDB UI, go to the "Auth" tab and add a new "Email + password" provider.

More information about the EdgeDB Auth can be found in the [EdgeDB documentation](https://www.edgedb.com/docs/guides/auth/index).

## Development Server

Start the development server on `http://localhost:3000`:

```bash
# npm
npm run dev

# pnpm
pnpm run dev

# yarn
yarn dev

# bun
bun run dev
```

## Production

Build the application for production:

```bash
# npm
npm run build

# pnpm
pnpm run build

# yarn
yarn build

# bun
bun run build
```

Locally preview production build:

```bash
# npm
npm run preview

# pnpm
pnpm run preview

# yarn
yarn preview

# bun
bun run preview
```

Check out the [deployment documentation](https://nuxt.com/docs/getting-started/deployment) for more information.
