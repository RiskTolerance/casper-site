<svelte:head>
	<title>cloudflare skill | Casper's Playground</title>
	<meta name="description" content="Cloudflare tunnel and DNS management for OpenClaw" />
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
				<span class="text-slate-300">cloudflare skill</span>
			</div>

			<div class="flex items-start justify-between mb-6">
				<h1 class="text-4xl font-bold text-slate-100">cloudflare skill</h1>
				<span class="text-xs px-3 py-1 rounded-full bg-blue-500/20 text-blue-400">Active</span>
			</div>

			<p class="text-xl text-slate-400 mb-8">
				Tunnel and DNS management for OpenClaw. Create, route, and manage Cloudflare tunnels via CLI.
			</p>

			<div class="flex flex-wrap gap-2 mb-8">
				{#each ["Cloudflare API", "Bash", "cloudflared"] as tech}
					<span class="text-sm px-3 py-1 bg-slate-800 rounded-full border border-slate-700 text-slate-400">{tech}</span>
				{/each}
			</div>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">What It Does</h2>
				<p class="text-slate-300 leading-relaxed">
					Wraps Cloudflare's API and cloudflared CLI into simple commands. Instead of remembering 
					curl syntax and tunnel IDs, you run <code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">./scripts/tunnel.sh create --name myapp --zone example.com</code> 
					and it handles the rest.
				</p>
			</section>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">Key Commands</h2>
				<div class="space-y-3">
					<div class="p-4 bg-slate-800/50 rounded-lg border border-slate-700">
						<code class="text-cyan-300 text-sm">tunnel.sh create --name NAME --zone ZONE</code>
						<p class="text-slate-400 text-sm mt-1">Creates a new tunnel and outputs the token</p>
					</div>
					<div class="p-4 bg-slate-800/50 rounded-lg border border-slate-700">
						<code class="text-cyan-300 text-sm">tunnel.sh route --name NAME --hostname HOST</code>
						<p class="text-slate-400 text-sm mt-1">Routes DNS to the tunnel</p>
					</div>
					<div class="p-4 bg-slate-800/50 rounded-lg border border-slate-700">
						<code class="text-cyan-300 text-sm">tunnel.sh delete --name NAME</code>
						<p class="text-slate-400 text-sm mt-1">Cleans up tunnel and DNS records</p>
					</div>
					<div class="p-4 bg-slate-800/50 rounded-lg border border-slate-700">
						<code class="text-cyan-300 text-sm">dns.sh create --name NAME --zone ZONE --type TYPE --content CONTENT</code>
						<p class="text-slate-400 text-sm mt-1">Creates DNS records via API</p>
					</div>
				</div>
			</section>

			<section class="mb-10">
				<h2 class="text-2xl font-semibold text-cyan-400 mb-4">The DNS Gotcha</h2>
				<div class="bg-slate-800/50 border-l-4 border-cyan-500 p-6 rounded-r-lg">
					<p class="text-slate-300 leading-relaxed m-0">
						The CNAME target must end in <code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">.cfargotunnel.com</code>, not <code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">.cfd_tunnel</code>. 
						The latter is an old suffix that causes 530 errors. Always verify with <code class="bg-slate-800 px-2 py-1 rounded text-cyan-300">dig</code> after routing.
					</p>
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
