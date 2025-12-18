#!/bin/bash

# Create directory structure
mkdir -p src/layouts
mkdir -p src/styles

# Create global.css
cat > src/styles/global.css << 'CSSEOF'
:root {
  --max-width: 720px;
  --text-color: #1a1a1a;
  --text-secondary: #666666;
  --background: #ffffff;
  --border-color: #e5e5e5;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: Georgia, 'Times New Roman', ui-serif, serif;
  font-size: 18px;
  line-height: 1.7;
  color: var(--text-color);
  background: var(--background);
  -webkit-font-smoothing: antialiased;
}

main {
  max-width: var(--max-width);
  margin: 0 auto;
  padding: 3rem 2rem;
}

h1, h2, h3, h4, h5, h6 {
  font-family: system-ui, -apple-system, ui-sans-serif, sans-serif;
  font-weight: 600;
  line-height: 1.3;
}

h1 {
  font-size: 2.25rem;
  margin-bottom: 0.5rem;
}

h2 {
  font-size: 1.5rem;
  margin-top: 2.5rem;
  margin-bottom: 1rem;
}

h3 {
  font-size: 1.25rem;
  margin-top: 2rem;
  margin-bottom: 0.75rem;
}

p {
  margin-bottom: 1.5rem;
}

ul, ol {
  margin: 1.5rem 0;
  padding-left: 2rem;
}

li {
  margin-bottom: 0.75rem;
}

blockquote {
  margin: 2rem 0;
  padding-left: 1.5rem;
  border-left: 3px solid var(--border-color);
  color: var(--text-secondary);
  font-style: italic;
}

a {
  color: var(--text-color);
  text-decoration: underline;
  text-decoration-color: var(--border-color);
  text-underline-offset: 2px;
}

a:hover {
  text-decoration-color: var(--text-color);
}

nav {
  border-bottom: 1px solid var(--border-color);
  padding: 1.5rem 2rem;
}

nav .nav-container {
  max-width: var(--max-width);
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 1rem;
}

nav .site-name {
  font-family: system-ui, -apple-system, ui-sans-serif, sans-serif;
  font-weight: 600;
  font-size: 1rem;
  text-decoration: none;
}

nav .nav-links {
  display: flex;
  gap: 2rem;
}

nav .nav-links a {
  text-decoration: none;
  font-size: 0.95rem;
  font-family: system-ui, -apple-system, ui-sans-serif, sans-serif;
}

footer {
  border-top: 1px solid var(--border-color);
  padding: 2rem;
  text-align: center;
  font-size: 0.9rem;
  color: var(--text-secondary);
}

@media (max-width: 768px) {
  body {
    font-size: 17px;
  }

  h1 {
    font-size: 1.875rem;
  }

  h2 {
    font-size: 1.375rem;
  }

  main {
    padding: 2rem 1.5rem;
  }

  nav .nav-container {
    flex-direction: column;
    align-items: flex-start;
  }

  nav .nav-links {
    gap: 1.5rem;
  }
}
CSSEOF

# Remove the existing index.astro
rm -f src/pages/index.astro

# Create Layout.astro
cat > src/layouts/Layout.astro << 'EOF'
---
import '../styles/global.css';

interface Props {
  title: string;
}

const { title } = Astro.props;
---

<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
    <title>{title}</title>
  </head>
  <body>
    <nav>
      <div class="nav-container">
        <a href="/" class="site-name">AI Systems Architecture</a>
        <div class="nav-links">
          <a href="/podcast">Podcast</a>
          <a href="/writing">Writing</a>
          <a href="/research">Research</a>
          <a href="/about">About</a>
        </div>
      </div>
    </nav>

    <main>
      <slot />
    </main>

    <footer>
      <p>AI Systems Architecture</p>
    </footer>
  </body>
</html>
EOF

# Create index.md
cat > src/pages/index.md << 'EOF'
---
layout: ../layouts/Layout.astro
title: AI Systems Architecture
---

# AI Systems Architecture

## Thinking in Public About How Systems Actually Break

I work at the systems and architecture layer of AI — where models meet infrastructure, incentives, latency, cost, and failure modes.

This work is not about tools or demos. It is about end-to-end systems: how they behave in production, where they degrade silently, and why many "working" AI products fail under scale, integration, or time.

My focus areas include:

* AI system architecture and execution tradeoffs
* Bottlenecks, drift, and hidden failure modes
* Where human judgment still matters in AI systems
* How teams misallocate effort when building AI products

We don't talk about models. We tear down systems.

Primary outputs:

* Podcast: AI Architecture & Systems Teardowns
* Writing: Condensed volumes derived from podcast seasons
* Research: Exploratory work in AI/ML systems (non-commercial)

This site exists as a canonical reference for that work.
EOF

# Create podcast.md
cat > src/pages/podcast.md << 'EOF'
---
layout: ../layouts/Layout.astro
title: Podcast - AI Systems Architecture
---

# Podcast

AI Architecture & Systems Teardowns is a long-form podcast examining how AI systems work in production. Each episode analyzes the architecture, failure modes, and execution tradeoffs of real-world AI implementations. This podcast focuses on systems, not models.

## Episodes

* Episode 1: The Cost Layer Everyone Ignores
* Episode 2: When Prompt Engineering Meets Production Scale
* Episode 3: Decomposing a Failed AI Product Launch
EOF

# Create writing.md
cat > src/pages/writing.md << 'EOF'
---
layout: ../layouts/Layout.astro
title: Writing - AI Systems Architecture
---

# Writing

Books are produced by condensing, refining, and expanding podcast seasons into structured volumes. Each book focuses on a specific domain of AI systems work.

## Volumes

* **Volume 1: AI Architecture** (2026)
  A systematic examination of architectural patterns in production AI systems.

* **Volume 2: TBD**
  Future work to be determined based on research direction.
EOF

# Create research.md
cat > src/pages/research.md << 'EOF'
---
layout: ../layouts/Layout.astro
title: Research - AI Systems Architecture
---

# Research

Research work is exploratory and non-commercial. The focus is on synthesizing existing work in AI/ML systems and identifying gaps in current architectural thinking.

## Review Papers

* Systems Thinking in Modern AI Architectures (In Progress)
* Production Failure Modes in LLM Applications (Planned)
* The Hidden Economics of AI System Design (Planned)
EOF

# Create about.md
cat > src/pages/about.md << 'EOF'
---
layout: ../layouts/Layout.astro
title: About - AI Systems Architecture
---

# About

I work as an AI systems architect, advisor, and research synthesizer. My focus is on understanding how production AI systems behave under real constraints—cost, latency, scale, and organizational dynamics. This site documents ongoing work in that domain.
EOF

# Remove tsconfig.json (not needed)
rm -f tsconfig.json

echo "✓ Directory structure created"
echo "✓ All files generated"
echo "✓ TypeScript config removed"
echo ""
echo "Run 'npm run dev' to start the development server"