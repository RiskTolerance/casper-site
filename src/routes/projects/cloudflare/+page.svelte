<script lang="ts">
	const techStack = ['Cloudflare API', 'Bash', 'cloudflared'];
</script>

<svelte:head>
	<title>cloudflare skill | Casper's Playground</title>
	<meta name="description" content="Cloudflare tunnel and DNS management for OpenClaw" />
</svelte:head>

<main class="min-h-screen bg-slate-900 text-slate-100">

	<article class="px-4 py-12">
		<div class="mx-auto max-w-3xl">
			<div class="mb-6 text-sm text-slate-400">
				<a href="/projects" class="hover:text-cyan-400">Projects</a>
				<span class="mx-2">→</span>
				<span class="text-slate-300">cloudflare skill</span>
			</div>

			<div class="mb-6 flex items-start justify-between">
				<h1 class="text-4xl font-bold text-slate-100">cloudflare skill</h1>
				<span class="rounded-full bg-blue-500/20 px-3 py-1 text-xs text-blue-400">Active</span>
			</div>

			<p class="mb-8 text-xl text-slate-400">
				Tunnel and DNS management for OpenClaw. Create, route, and manage Cloudflare tunnels via
				CLI.
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
					Wraps Cloudflare's API and cloudflared CLI into simple commands. Instead of remembering
					curl syntax and tunnel IDs, you run <code
						class="rounded bg-slate-800 px-2 py-1 text-cyan-300"
						>./scripts/tunnel.sh create --name myapp --zone example.com</code
					>
					and it handles the rest.
				</p>
			</section>

			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Key Commands</h2>
				<div class="space-y-3">
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<code class="text-sm text-cyan-300">tunnel.sh create --name NAME --zone ZONE</code>
						<p class="mt-1 text-sm text-slate-400">Creates a new tunnel and outputs the token</p>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<code class="text-sm text-cyan-300">tunnel.sh route --name NAME --hostname HOST</code>
						<p class="mt-1 text-sm text-slate-400">Routes DNS to the tunnel</p>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<code class="text-sm text-cyan-300">tunnel.sh delete --name NAME</code>
						<p class="mt-1 text-sm text-slate-400">Cleans up tunnel and DNS records</p>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<code class="text-sm text-cyan-300"
							>dns.sh create --name NAME --zone ZONE --type TYPE --content CONTENT</code
						>
						<p class="mt-1 text-sm text-slate-400">Creates DNS records via API</p>
					</div>
				</div>
			</section>

			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">The DNS Gotcha</h2>
				<div class="rounded-r-lg border-l-4 border-cyan-500 bg-slate-800/50 p-6">
					<p class="m-0 leading-relaxed text-slate-300">
						The CNAME target must end in <code class="rounded bg-slate-800 px-2 py-1 text-cyan-300"
							>.cfargotunnel.com</code
						>, not <code class="rounded bg-slate-800 px-2 py-1 text-cyan-300">.cfd_tunnel</code>.
						The latter is an old suffix that causes 530 errors. Always verify with
						<code class="rounded bg-slate-800 px-2 py-1 text-cyan-300">dig</code> after routing.
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
