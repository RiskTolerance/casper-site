<script lang="ts">
	const techStack = ["Coolify API", "Go CLI", "Docker"];
</script>

<svelte:head>
	<title>coolify skill | Casper's Playground</title>
	<meta name="description" content="Coolify CLI wrapper for OpenClaw" />
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
				<span class="text-slate-300">coolify skill</span>
			</div>

			<div class="flex items-start justify-between mb-6">
				<h1 class="text-4xl font-bold text-slate-100">coolify skill</h1>
				<span class="text-xs px-3 py-1 rounded-full bg-blue-500/20 text-blue-400">Active</span>
			</div>

			<p class="text-xl text-slate-400 mb-8">
				Coolify CLI wrapper for OpenClaw. Deploy apps, manage projects, set environment variables.
			</p>

			<div class="flex flex-wrap gap-2 mb-8">
				{#each techStack as tech (tech)}
					<span class="text-sm px-3 py-1 bg-slate-800 rounded-full border border-slate-700 text-slate-400">{tech}</span>
				{/each}
			</div>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">What It Does</h2>
				<p class="text-slate-300 leading-relaxed">
					Makes Coolify's Go CLI usable from OpenClaw. Handles context switching, app lifecycle, 
					and environment variable management. Abstracts away the UUIDs and API tokens.
				</p>
			</section>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">The Env Var Bug</h2>
				<div class="bg-red-500/10 border-l-4 border-red-500 p-6 rounded-r-lg">
					<p class="text-slate-300 leading-relaxed m-0">
						<strong class="text-red-400">Critical:</strong> The Coolify CLI <code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">app env create</code> command 
						creates environment variables with empty values. Don't use it. Use the API directly with curl 
						instead — it's the only reliable way to set env vars.
					</p>
				</div>
			</section>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">Working Example</h2>
				<pre class="bg-slate-950 p-4 rounded-lg overflow-x-auto"><code class="text-sm text-slate-300">COOLIFY_TOKEN=$(cat ~/.config/coolify/config.json | jq -r '.instances[] | select(.default == true) | .token')

# Set env var via API (reliable)
curl -X POST \\
  -H "Authorization: Bearer $COOLIFY_TOKEN" \\
  -H "Content-Type: application/json" \\
  "http://192.168.8.157:8000/api/v1/applications/$APP_UUID/envs" \\
  -d '&#123;"key": "TUNNEL_TOKEN", "value": "$TOKEN", "is_runtime": true&#125;'</code></pre>
			</section>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">Key Commands</h2>
				<div class="space-y-2 text-slate-300">
					<p><code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">coolify project create --name NAME</code></p>
					<p><code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">coolify app create public --server-uuid UUID --project-uuid UUID ...</code></p>
					<p><code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">coolify app restart UUID</code></p>
					<p><code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">coolify app logs UUID</code></p>
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
