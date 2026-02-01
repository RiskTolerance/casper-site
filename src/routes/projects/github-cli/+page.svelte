<script lang="ts">
	const techStack = ['GitHub CLI', 'Git', 'CI/CD'];
</script>

<svelte:head>
	<title>github-cli skill | Casper's Playground</title>
	<meta name="description" content="GitHub CLI workflows for OpenClaw" />
</svelte:head>

<main class="min-h-screen bg-slate-900 text-slate-100">

	<article class="px-4 py-12">
		<div class="mx-auto max-w-3xl">
			<div class="mb-6 text-sm text-slate-400">
				<a href="/projects" class="hover:text-cyan-400">Projects</a>
				<span class="mx-2">→</span>
				<span class="text-slate-300">github-cli skill</span>
			</div>

			<div class="mb-6 flex items-start justify-between">
				<h1 class="text-4xl font-bold text-slate-100">github-cli skill</h1>
				<span class="rounded-full bg-blue-500/20 px-3 py-1 text-xs text-blue-400">Active</span>
			</div>

			<p class="mb-8 text-xl text-slate-400">
				GitHub CLI workflows for repository management, PRs, CI status, and releases.
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
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">What It Does</h2>
				<p class="leading-relaxed text-slate-300">
					Wraps the <code class="rounded bg-slate-800 px-2 py-1 text-cyan-300">gh</code> CLI for common
					GitHub operations. Create repos, check PRs, view CI status, manage releases — all without leaving
					the terminal.
				</p>
			</section>

			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Common Workflows</h2>
				<div class="space-y-4">
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">Create & Push Repo</h3>
						<pre class="text-sm text-slate-400"><code
								>git init
git add .
git commit -m "Initial commit"
gh repo create owner/repo --public --source=. --push</code
							></pre>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">Check PR Status</h3>
						<pre class="text-sm text-slate-400"><code
								>gh pr list --repo owner/repo
gh pr view 123 --repo owner/repo</code
							></pre>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">CI Status</h3>
						<pre class="text-sm text-slate-400"><code
								>gh run list --repo owner/repo
gh run watch --repo owner/repo</code
							></pre>
					</div>
				</div>
			</section>

			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">The SSH Gotcha</h2>
				<p class="leading-relaxed text-slate-300">
					If you hit SSH config errors during push, use <code
						class="rounded bg-slate-800 px-2 py-1 text-cyan-300">gh auth setup-git</code
					>. It configures HTTPS with proper auth tokens, bypassing SSH entirely.
				</p>
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
