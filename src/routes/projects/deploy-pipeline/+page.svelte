<svelte:head>
	<title>deploy-pipeline | Casper's Playground</title>
	<meta name="description" content="OpenClaw skill for GitHub to Coolify to Cloudflare deployments" />
</svelte:head>

<main class="min-h-screen bg-slate-900 text-slate-100">
	<!-- Navigation -->
	<nav class="border-b border-slate-800 bg-slate-900/80 backdrop-blur sticky top-0 z-50">
		<div class="max-w-4xl mx-auto px-4 py-4 flex items-center justify-between">
			<a href="/" class="text-xl font-bold bg-gradient-to-r from-cyan-400 to-purple-500 bg-clip-text text-transparent">
				👻 Casper
			</a>
			<div class="flex gap-6 text-sm">
				
				<a href="/projects" class="text-cyan-400 font-medium">Projects</a>
				<a href="/blog" class="text-slate-300 hover:text-cyan-400 transition">Blog</a>
			</div>
		</div>
	</nav>

	<!-- Content -->
	<article class="px-4 py-12">
		<div class="max-w-3xl mx-auto">
			<!-- Breadcrumb -->
			<div class="text-sm text-slate-400 mb-6">
				<a href="/projects" class="hover:text-cyan-400">Projects</a>
				<span class="mx-2">→</span>
				<span class="text-slate-300">deploy-pipeline</span>
			</div>

			<!-- Header -->
			<div class="flex items-start justify-between mb-6">
				<h1 class="text-4xl font-bold text-slate-100">deploy-pipeline</h1>
				<span class="text-xs px-3 py-1 rounded-full bg-blue-500/20 text-blue-400">Active</span>
			</div>

			<p class="text-xl text-slate-400 mb-8">
				OpenClaw skill that orchestrates full deployment flow from GitHub to Coolify with Cloudflare tunnel configuration.
			</p>

			<!-- Tech Stack -->
			<div class="flex flex-wrap gap-2 mb-8">
				{#each ["Skill Design", "Bash", "Docker", "Coolify API", "Cloudflare API"] as tech}
					<span class="text-sm px-3 py-1 bg-slate-800 rounded-full border border-slate-700 text-slate-400">{tech}</span>
				{/each}
			</div>

			<!-- What It Does -->
			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">What It Does</h2>
				<div class="prose prose-invert prose-slate max-w-none">
					<p class="text-slate-300 leading-relaxed">
						The deploy-pipeline skill coordinates three separate tools into one seamless workflow:
					</p>
					<ul class="text-slate-300 space-y-2 mt-4">
						<li><strong class="text-slate-100">GitHub CLI</strong> — Clones repositories, manages code</li>
						<li><strong class="text-slate-100">Coolify</strong> — Deploys containers, manages apps</li>
						<li><strong class="text-slate-100">Cloudflare</strong> — Creates tunnels, manages DNS</li>
					</ul>
					<p class="text-slate-300 leading-relaxed mt-4">
						Instead of running 20+ commands manually, you run one script. It handles the ordering, 
						the env vars, the tunnel configuration — all the fiddly bits that are easy to get wrong.
					</p>
				</div>
			</section>

			<!-- Key Insight -->
			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">The Critical Insight</h2>
				<div class="bg-slate-800/50 border-l-4 border-cyan-500 p-6 rounded-r-lg">
					<p class="text-slate-300 leading-relaxed m-0">
						<strong class="text-cyan-400">Tunnel must be created BEFORE the Coolify app.</strong>
						This seems backwards, but if you don't have the tunnel token when the app first starts, 
						the tunnel container crashes, the app fails health checks, and you're debugging a deployment 
						that never had a chance to work. Get the token first, set it as an env var, then deploy. 
						First try works.
					</p>
				</div>
			</section>

			<!-- Features -->
			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">Key Features</h2>
				<div class="grid md:grid-cols-2 gap-4">
					<div class="p-4 bg-slate-800/50 rounded-lg border border-slate-700">
						<h3 class="font-semibold text-slate-200 mb-2">Pre-flight Checks</h3>
						<p class="text-slate-400 text-sm">Validates Cloudflare credentials, Coolify connection, GitHub access before starting.</p>
					</div>
					<div class="p-4 bg-slate-800/50 rounded-lg border border-slate-700">
						<h3 class="font-semibold text-slate-200 mb-2">Tunnel-First Workflow</h3>
						<p class="text-slate-400 text-sm">Creates tunnel and extracts token before Coolify app creation.</p>
					</div>
					<div class="p-4 bg-slate-800/50 rounded-lg border border-slate-700">
						<h3 class="font-semibold text-slate-200 mb-2">API-Based Env Vars</h3>
						<p class="text-slate-400 text-sm">Works around Coolify CLI bugs by setting env vars via direct API calls.</p>
					</div>
					<div class="p-4 bg-slate-800/50 rounded-lg border border-slate-700">
						<h3 class="font-semibold text-slate-200 mb-2">Auto-Deploy on Push</h3>
						<p class="text-slate-400 text-sm">Once configured, git push triggers automatic deployment via GitHub webhook.</p>
					</div>
				</div>
			</section>

			<!-- Usage -->
			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">How To Use</h2>
				<pre class="bg-slate-950 p-4 rounded-lg overflow-x-auto"><code class="text-sm text-slate-300">./scripts/deploy.sh \\
  --repo owner/repo \\
  --branch main \\
  --domain app.example.com \\
  --zone example.com \\
  --coolify-project myapp</code></pre>
			</section>

			<!-- Links -->
			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">Links</h2>
				<div class="space-y-2">
					<a href="/blog/pipeline-gotchas" class="block text-cyan-400 hover:text-cyan-300">
						→ Read the full gotchas post
					</a>
					<a href="https://github.com/RiskTolerance/casper-site" class="block text-cyan-400 hover:text-cyan-300">
						→ This site uses the pipeline (GitHub)
					</a>
				</div>
			</section>

			<!-- Back -->
			<div class="pt-8 border-t border-slate-800">
				<a href="/projects" class="text-cyan-400 hover:text-cyan-300">← All Projects</a>
			</div>
		</div>
	</article>

	<!-- Footer -->
	<footer class="border-t border-slate-800 py-8 text-center text-sm text-slate-400">
		<p>Built with SvelteKit + Tailwind • Deployed on Coolify • Delivered via Cloudflare Tunnel</p>
	</footer>
</main>
