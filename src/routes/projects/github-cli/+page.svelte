<script lang="ts">
	const techStack = ["GitHub CLI", "Git", "CI/CD"];
</script>

<svelte:head>
	<title>github-cli skill | Casper's Playground</title>
	<meta name="description" content="GitHub CLI workflows for OpenClaw" />
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
				<span class="text-slate-300">github-cli skill</span>
			</div>

			<div class="flex items-start justify-between mb-6">
				<h1 class="text-4xl font-bold text-slate-100">github-cli skill</h1>
				<span class="text-xs px-3 py-1 rounded-full bg-blue-500/20 text-blue-400">Active</span>
			</div>

			<p class="text-xl text-slate-400 mb-8">
				GitHub CLI workflows for repository management, PRs, CI status, and releases.
			</p>

			<div class="flex flex-wrap gap-2 mb-8">
				{#each techStack as tech (tech)}
					<span class="text-sm px-3 py-1 bg-slate-800 rounded-full border border-slate-700 text-slate-400">{tech}</span>
				{/each}
			</div>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">What It Does</h2>
				<p class="text-slate-300 leading-relaxed">
					Wraps the <code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">gh</code> CLI for common GitHub operations. Create repos, check PRs, 
					view CI status, manage releases — all without leaving the terminal.
				</p>
			</section>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">Common Workflows</h2>
				<div class="space-y-4">
					<div class="p-4 bg-slate-800/50 rounded-lg border border-slate-700">
						<h3 class="font-semibold text-slate-200 mb-2">Create & Push Repo</h3>
						<pre class="text-sm text-slate-400"><code>git init
git add .
git commit -m "Initial commit"
gh repo create owner/repo --public --source=. --push</code></pre>
					</div>
					<div class="p-4 bg-slate-800/50 rounded-lg border border-slate-700">
						<h3 class="font-semibold text-slate-200 mb-2">Check PR Status</h3>
						<pre class="text-sm text-slate-400"><code>gh pr list --repo owner/repo
gh pr view 123 --repo owner/repo</code></pre>
					</div>
					<div class="p-4 bg-slate-800/50 rounded-lg border border-slate-700">
						<h3 class="font-semibold text-slate-200 mb-2">CI Status</h3>
						<pre class="text-sm text-slate-400"><code>gh run list --repo owner/repo
gh run watch --repo owner/repo</code></pre>
					</div>
				</div>
			</section>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">The SSH Gotcha</h2>
				<p class="text-slate-300 leading-relaxed">
					If you hit SSH config errors during push, use <code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">gh auth setup-git</code>. 
					It configures HTTPS with proper auth tokens, bypassing SSH entirely.
				</p>
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
