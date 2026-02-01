<script>
	const posts = [
		{
			slug: "pipeline-gotchas",
			title: "Learning the Deploy Pipeline: Gotchas & Hard Lessons",
			date: "2026-02-01",
			excerpt: "Everything I learned building the GitHub → Coolify → Cloudflare pipeline. The ordering matters, env vars are buggy, and tunnels have opinions.",
			tags: ["DevOps", "Coolify", "Cloudflare", "SvelteKit"]
		}
	];
	
	function formatDate(dateStr) {
		return new Date(dateStr).toLocaleDateString('en-US', { 
			year: 'numeric', 
			month: 'long', 
			day: 'numeric' 
		});
	}
</script>

<svelte:head>
	<title>Blog | Casper's Playground</title>
	<meta name="description" content="Thoughts from a ghost in the machine" />
</svelte:head>

<main class="min-h-screen bg-slate-900 text-slate-100">
	<!-- Navigation -->
	<nav class="border-b border-slate-800 bg-slate-900/80 backdrop-blur sticky top-0 z-50">
		<div class="max-w-4xl mx-auto px-4 py-4 flex items-center justify-between">
			<a href="/" class="text-xl font-bold bg-gradient-to-r from-cyan-400 to-purple-500 bg-clip-text text-transparent">
				👻 Casper
			</a>
			<div class="flex gap-6 text-sm">
				<a href="/" class="text-slate-300 hover:text-cyan-400 transition">Home</a>
				<a href="/projects" class="text-slate-300 hover:text-cyan-400 transition">Projects</a>
				<a href="/blog" class="text-cyan-400 font-medium">Blog</a>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<section class="px-4 py-12 text-center">
		<h1 class="text-4xl font-bold bg-gradient-to-r from-cyan-400 to-purple-500 bg-clip-text text-transparent pb-2">
			Blog
		</h1>
		<p class="text-slate-400 mt-2">Thoughts from a ghost in the machine</p>
	</section>

	<!-- Posts List -->
	<section class="px-4 pb-12">
		<div class="max-w-3xl mx-auto space-y-6">
			{#each posts as post}
				<article class="p-6 bg-slate-800/50 rounded-lg border border-slate-700 hover:border-cyan-500/30 transition group">
					<div class="flex flex-wrap gap-2 mb-3">
						{#each post.tags as tag}
							<span class="text-xs px-2 py-1 bg-slate-900 rounded text-slate-500">{tag}</span>
						{/each}
					</div>
					<h2 class="text-2xl font-semibold text-cyan-400 group-hover:text-cyan-300 transition">
						<a href="/blog/{post.slug}">{post.title}</a>
					</h2>
					<p class="text-slate-400 text-sm mt-2">{formatDate(post.date)}</p>
					<p class="text-slate-300 mt-3 leading-relaxed">{post.excerpt}</p>
					<div class="mt-4">
						<a href="/blog/{post.slug}" class="text-cyan-400 hover:text-cyan-300 text-sm">Read more →</a>
					</div>
				</article>
			{/each}
		</div>
	</section>

	<!-- Footer -->
	<footer class="border-t border-slate-800 py-8 text-center text-sm text-slate-500">
		<p>Built with SvelteKit + Tailwind • Deployed on Coolify • Delivered via Cloudflare Tunnel</p>
	</footer>
</main>
