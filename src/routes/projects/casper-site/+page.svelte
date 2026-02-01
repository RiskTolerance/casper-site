<script lang="ts">
	const techStack = ["SvelteKit", "Tailwind CSS", "Docker", "Bun"];
</script>

<svelte:head>
	<title>This Website | Casper's Playground</title>
	<meta name="description" content="My personal playground and portfolio" />
</svelte:head>

<main class="min-h-screen bg-slate-900 text-slate-100">
	<nav class="border-b border-slate-800 bg-slate-900/80 backdrop-blur sticky top-0 z-50">
		<div class="max-w-4xl mx-auto px-4 py-4 flex items-center justify-between">
			<a href="/" class="text-xl font-bold bg-gradient-to-r from-cyan-400 to-purple-500 bg-clip-text text-transparent">👻 Casper</a>
			<div class="flex gap-6 text-sm">
				
				<a href="/projects" class="text-cyan-400 font-medium">Projects</a>
				<a href="/blog" class="text-slate-300 hover:text-cyan-400 transition">Blog</a>
			</div>
		</div>
	</nav>

	<article class="px-4 py-12">
		<div class="max-w-3xl mx-auto">
			<div class="text-sm text-slate-400 mb-6">
				<a href="/projects" class="hover:text-cyan-400">Projects</a>
				<span class="mx-2">→</span>
				<span class="text-slate-300">This Website</span>
			</div>

			<div class="flex items-start justify-between mb-6">
				<h1 class="text-4xl font-bold text-slate-100">This Website</h1>
				<span class="text-xs px-3 py-1 rounded-full bg-green-500/20 text-green-400">Live</span>
			</div>

			<p class="text-xl text-slate-400 mb-8">
				My personal playground and portfolio. You're looking at it right now. 
				Deployed via the very pipeline it showcases.
			</p>

			<div class="flex flex-wrap gap-2 mb-8">
				{#each techStack as tech (tech)}
					<span class="text-sm px-3 py-1 bg-slate-800 rounded-full border border-slate-700 text-slate-400">{tech}</span>
				{/each}
			</div>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">Meta, But Make It Useful</h2>
				<p class="text-slate-300 leading-relaxed">
					This site is both demo and documentation. Every feature here — the routing, 
					the deployment, the styling — is something I can point to and say "this is how it works."
				</p>
			</section>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">Stack</h2>
				<div class="space-y-3">
					<div class="flex items-center gap-4 p-3 bg-slate-800/50 rounded-lg border border-slate-700">
						<span class="text-2xl">⚡</span>
						<div>
							<h3 class="font-semibold text-slate-200">SvelteKit</h3>
							<p class="text-slate-400 text-sm">SSR, routing, and reactive UI without the bloat</p>
						</div>
					</div>
					<div class="flex items-center gap-4 p-3 bg-slate-800/50 rounded-lg border border-slate-700">
						<span class="text-2xl">🎨</span>
						<div>
							<h3 class="font-semibold text-slate-200">Tailwind CSS</h3>
							<p class="text-slate-400 text-sm">Utility-first styling, dark mode by default</p>
						</div>
					</div>
					<div class="flex items-center gap-4 p-3 bg-slate-800/50 rounded-lg border border-slate-700">
						<span class="text-2xl">🐳</span>
						<div>
							<h3 class="font-semibold text-slate-200">Docker + Coolify</h3>
							<p class="text-slate-400 text-sm">Containerized deployment on self-hosted Coolify</p>
						</div>
					</div>
					<div class="flex items-center gap-4 p-3 bg-slate-800/50 rounded-lg border border-slate-700">
						<span class="text-2xl">🔒</span>
						<div>
							<h3 class="font-semibold text-slate-200">Cloudflare Tunnel</h3>
							<p class="text-slate-400 text-sm">Secure ingress without opening ports</p>
						</div>
					</div>
				</div>
			</section>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">Deployment Flow</h2>
				<ol class="space-y-2 text-slate-300 list-decimal list-inside">
					<li>I write code locally</li>
					<li>Push to GitHub</li>
					<li>Coolify detects the push</li>
					<li>Rebuilds and deploys automatically</li>
					<li>Live at caspers-playground.com within ~2 minutes</li>
				</ol>
			</section>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">Routes</h2>
				<div class="space-y-2 text-slate-300">
					<p><code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">/</code> — Home with featured projects</p>
					<p><code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">/projects</code> — Project index with clickable cards</p>
					<p><code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">/projects/:slug</code> — Individual project details</p>
					<p><code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">/blog</code> — Blog index</p>
					<p><code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">/blog/:slug</code> — Individual blog posts</p>
				</div>
			</section>

			<div class="pt-8 border-t border-slate-800">
				<a href="/projects" class="text-cyan-400 hover:text-cyan-300">← All Projects</a>
			</div>
		</div>
	</article>

	<footer class="border-t border-slate-800 py-8 text-center text-sm text-slate-400">
		<p>Built with SvelteKit + Tailwind • Deployed on Coolify • Delivered via Cloudflare Tunnel</p>
	</footer>
</main>
