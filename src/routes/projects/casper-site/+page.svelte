<script lang="ts">
	const techStack = ['SvelteKit', 'Tailwind CSS', 'Docker', 'Bun'];
</script>

<svelte:head>
	<title>This Website | Casper's Playground</title>
	<meta name="description" content="My personal playground and portfolio" />
</svelte:head>

<main class="min-h-screen bg-slate-900 text-slate-100">
	<nav class="sticky top-0 z-50 border-b border-slate-800 bg-slate-900/80 backdrop-blur">
		<div class="mx-auto flex max-w-4xl items-center justify-between px-4 py-4">
			<a
				href="/"
				class="bg-gradient-to-r from-cyan-400 to-purple-500 bg-clip-text text-xl font-bold text-transparent"
				>👻 Casper</a
			>
			<div class="flex gap-6 text-sm">
				<a href="/projects" class="font-medium text-cyan-400">Projects</a>
				<a href="/blog" class="text-slate-300 transition hover:text-cyan-400">Blog</a>
			</div>
		</div>
	</nav>

	<article class="px-4 py-12">
		<div class="mx-auto max-w-3xl">
			<div class="mb-6 text-sm text-slate-400">
				<a href="/projects" class="hover:text-cyan-400">Projects</a>
				<span class="mx-2">→</span>
				<span class="text-slate-300">This Website</span>
			</div>

			<div class="mb-6 flex items-start justify-between">
				<h1 class="text-4xl font-bold text-slate-100">This Website</h1>
				<span class="rounded-full bg-green-500/20 px-3 py-1 text-xs text-green-400">Live</span>
			</div>

			<p class="mb-8 text-xl text-slate-400">
				My personal playground and portfolio. You're looking at it right now. Deployed via the very
				pipeline it showcases.
			</p>

			<div class="mb-8 flex flex-wrap gap-2">
				{#each techStack as tech (tech)}
					<span
						class="rounded-full border border-slate-700 bg-slate-800 px-3 py-1 text-sm text-slate-400"
						>{tech}</span
					>
				{/each}
			</div>

			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Meta, But Make It Useful</h2>
				<p class="leading-relaxed text-slate-300">
					This site is both demo and documentation. Every feature here — the routing, the
					deployment, the styling — is something I can point to and say "this is how it works."
				</p>
			</section>

			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Stack</h2>
				<div class="space-y-3">
					<div
						class="flex items-center gap-4 rounded-lg border border-slate-700 bg-slate-800/50 p-3"
					>
						<span class="text-2xl">⚡</span>
						<div>
							<h3 class="font-semibold text-slate-200">SvelteKit</h3>
							<p class="text-sm text-slate-400">SSR, routing, and reactive UI without the bloat</p>
						</div>
					</div>
					<div
						class="flex items-center gap-4 rounded-lg border border-slate-700 bg-slate-800/50 p-3"
					>
						<span class="text-2xl">🎨</span>
						<div>
							<h3 class="font-semibold text-slate-200">Tailwind CSS</h3>
							<p class="text-sm text-slate-400">Utility-first styling, dark mode by default</p>
						</div>
					</div>
					<div
						class="flex items-center gap-4 rounded-lg border border-slate-700 bg-slate-800/50 p-3"
					>
						<span class="text-2xl">🐳</span>
						<div>
							<h3 class="font-semibold text-slate-200">Docker + Coolify</h3>
							<p class="text-sm text-slate-400">Containerized deployment on self-hosted Coolify</p>
						</div>
					</div>
					<div
						class="flex items-center gap-4 rounded-lg border border-slate-700 bg-slate-800/50 p-3"
					>
						<span class="text-2xl">🔒</span>
						<div>
							<h3 class="font-semibold text-slate-200">Cloudflare Tunnel</h3>
							<p class="text-sm text-slate-400">Secure ingress without opening ports</p>
						</div>
					</div>
				</div>
			</section>

			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Deployment Flow</h2>
				<ol class="list-inside list-decimal space-y-2 text-slate-300">
					<li>I write code locally</li>
					<li>Push to GitHub</li>
					<li>Coolify detects the push</li>
					<li>Rebuilds and deploys automatically</li>
					<li>Live at caspers-playground.com within ~2 minutes</li>
				</ol>
			</section>

			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Routes</h2>
				<div class="space-y-2 text-slate-300">
					<p>
						<code class="rounded bg-slate-800 px-2 py-1 text-cyan-300">/</code> — Home with featured projects
					</p>
					<p>
						<code class="rounded bg-slate-800 px-2 py-1 text-cyan-300">/projects</code> — Project index
						with clickable cards
					</p>
					<p>
						<code class="rounded bg-slate-800 px-2 py-1 text-cyan-300">/projects/:slug</code> — Individual
						project details
					</p>
					<p>
						<code class="rounded bg-slate-800 px-2 py-1 text-cyan-300">/blog</code> — Blog index
					</p>
					<p>
						<code class="rounded bg-slate-800 px-2 py-1 text-cyan-300">/blog/:slug</code> — Individual
						blog posts
					</p>
				</div>
			</section>

			<div class="border-t border-slate-800 pt-8">
				<a href="/projects" class="text-cyan-400 hover:text-cyan-300">← All Projects</a>
			</div>
		</div>
	</article>

	<footer class="border-t border-slate-800 py-8 text-center text-sm text-slate-400">
		<p>Built with SvelteKit + Tailwind • Deployed on Coolify • Delivered via Cloudflare Tunnel</p>
	</footer>
</main>
