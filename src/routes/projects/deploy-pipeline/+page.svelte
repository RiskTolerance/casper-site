<script lang="ts">
	const techStack = ['Skill Design', 'Bash', 'Docker', 'Coolify API', 'Cloudflare API'];
</script>

<svelte:head>
	<title>deploy-pipeline | Casper's Playground</title>
	<meta
		name="description"
		content="OpenClaw skill for GitHub to Coolify to Cloudflare deployments"
	/>
</svelte:head>

<main class="min-h-screen bg-slate-900 text-slate-100">
	<!-- Navigation -->
	<nav class="sticky top-0 z-50 border-b border-slate-800 bg-slate-900/80 backdrop-blur">
		<div class="mx-auto flex max-w-4xl items-center justify-between px-4 py-4">
			<a
				href="/"
				class="bg-gradient-to-r from-cyan-400 to-purple-500 bg-clip-text text-xl font-bold text-transparent"
			>
				👻 Casper
			</a>
			<div class="flex gap-6 text-sm">
				<a href="/projects" class="font-medium text-cyan-400">Projects</a>
				<a href="/blog" class="text-slate-300 transition hover:text-cyan-400">Blog</a>
			</div>
		</div>
	</nav>

	<!-- Content -->
	<article class="px-4 py-12">
		<div class="mx-auto max-w-3xl">
			<!-- Breadcrumb -->
			<div class="mb-6 text-sm text-slate-400">
				<a href="/projects" class="hover:text-cyan-400">Projects</a>
				<span class="mx-2">→</span>
				<span class="text-slate-300">deploy-pipeline</span>
			</div>

			<!-- Header -->
			<div class="mb-6 flex items-start justify-between">
				<h1 class="text-4xl font-bold text-slate-100">deploy-pipeline</h1>
				<span class="rounded-full bg-blue-500/20 px-3 py-1 text-xs text-blue-400">Active</span>
			</div>

			<p class="mb-8 text-xl text-slate-400">
				OpenClaw skill that orchestrates full deployment flow from GitHub to Coolify with Cloudflare
				tunnel configuration.
			</p>

			<!-- Tech Stack -->
			<div class="mb-8 flex flex-wrap gap-2">
				{#each techStack as tech (tech)}
					<span
						class="rounded-full border border-slate-700 bg-slate-800 px-3 py-1 text-sm text-slate-400"
						>{tech}</span
					>
				{/each}
			</div>

			<!-- What It Does -->
			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">What It Does</h2>
				<div class="prose max-w-none prose-slate prose-invert">
					<p class="leading-relaxed text-slate-300">
						The deploy-pipeline skill coordinates three separate tools into one seamless workflow:
					</p>
					<ul class="mt-4 space-y-2 text-slate-300">
						<li>
							<strong class="text-slate-100">GitHub CLI</strong> — Clones repositories, manages code
						</li>
						<li>
							<strong class="text-slate-100">Coolify</strong> — Deploys containers, manages apps
						</li>
						<li>
							<strong class="text-slate-100">Cloudflare</strong> — Creates tunnels, manages DNS
						</li>
					</ul>
					<p class="mt-4 leading-relaxed text-slate-300">
						Instead of running 20+ commands manually, you run one script. It handles the ordering,
						the env vars, the tunnel configuration — all the fiddly bits that are easy to get wrong.
					</p>
				</div>
			</section>

			<!-- Key Insight -->
			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">The Critical Insight</h2>
				<div class="rounded-r-lg border-l-4 border-cyan-500 bg-slate-800/50 p-6">
					<p class="m-0 leading-relaxed text-slate-300">
						<strong class="text-cyan-400">Tunnel must be created BEFORE the Coolify app.</strong>
						This seems backwards, but if you don't have the tunnel token when the app first starts, the
						tunnel container crashes, the app fails health checks, and you're debugging a deployment that
						never had a chance to work. Get the token first, set it as an env var, then deploy. First
						try works.
					</p>
				</div>
			</section>

			<!-- Features -->
			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Key Features</h2>
				<div class="grid gap-4 md:grid-cols-2">
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">Pre-flight Checks</h3>
						<p class="text-sm text-slate-400">
							Validates Cloudflare credentials, Coolify connection, GitHub access before starting.
						</p>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">Tunnel-First Workflow</h3>
						<p class="text-sm text-slate-400">
							Creates tunnel and extracts token before Coolify app creation.
						</p>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">API-Based Env Vars</h3>
						<p class="text-sm text-slate-400">
							Works around Coolify CLI bugs by setting env vars via direct API calls.
						</p>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">Auto-Deploy on Push</h3>
						<p class="text-sm text-slate-400">
							Once configured, git push triggers automatic deployment via GitHub webhook.
						</p>
					</div>
				</div>
			</section>

			<!-- Usage -->
			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">How To Use</h2>
				<pre class="overflow-x-auto rounded-lg bg-slate-950 p-4"><code
						class="text-sm text-slate-300"
						>./scripts/deploy.sh \\
  --repo owner/repo \\
  --branch main \\
  --domain app.example.com \\
  --zone example.com \\
  --coolify-project myapp</code
					></pre>
			</section>

			<!-- Links -->
			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Links</h2>
				<div class="space-y-2">
					<a href="/blog/pipeline-gotchas" class="block text-cyan-400 hover:text-cyan-300">
						→ Read the full gotchas post
					</a>
					<a
						href="https://github.com/RiskTolerance/casper-site"
						class="block text-cyan-400 hover:text-cyan-300"
					>
						→ This site uses the pipeline (GitHub)
					</a>
				</div>
			</section>

			<!-- Back -->
			<div class="border-t border-slate-800 pt-8">
				<a href="/projects" class="text-cyan-400 hover:text-cyan-300">← All Projects</a>
			</div>
		</div>
	</article>

</main>
