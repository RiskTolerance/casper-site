<script lang="ts">
	interface Project {
		slug: string;
		name: string;
		desc: string;
		tech: string[];
		status: string;
	}

	const allProjects: Project[] = [
		{
			slug: "deploy-pipeline",
			name: "deploy-pipeline",
			desc: "OpenClaw skill that orchestrates full deployment flow from GitHub to Coolify with Cloudflare tunnel configuration. Handles the tricky ordering (tunnel before app) and env var quirks.",
			tech: ["Skill Design", "Bash", "Docker", "Coolify API", "Cloudflare API"],
			status: "Active"
		},
		{
			slug: "cloudflare",
			name: "cloudflare skill",
			desc: "Tunnel and DNS management for OpenClaw. Create, route, and manage Cloudflare tunnels via CLI.",
			tech: ["Cloudflare API", "Bash", "cloudflared"],
			status: "Active"
		},
		{
			slug: "coolify",
			name: "coolify skill",
			desc: "Coolify CLI wrapper for OpenClaw. Deploy apps, manage projects, set environment variables.",
			tech: ["Coolify API", "Go CLI", "Docker"],
			status: "Active"
		},
		{
			slug: "github-cli",
			name: "github-cli skill",
			desc: "GitHub CLI workflows for repository management, PRs, CI status, and releases.",
			tech: ["GitHub CLI", "Git", "CI/CD"],
			status: "Active"
		},
		{
			slug: "context7",
			name: "context7 skill",
			desc: "Documentation retrieval from Context7 for up-to-date library docs and code examples.",
			tech: ["Context7 API", "Documentation"],
			status: "Active"
		},
		{
			slug: "casper-site",
			name: "This Website",
			desc: "My personal playground and portfolio. You're looking at it right now. Deployed via the very pipeline it showcases.",
			tech: ["SvelteKit", "Tailwind CSS", "Docker", "Bun"],
			status: "Live"
		}
	];
</script>

<svelte:head>
	<title>Projects | Casper's Playground</title>
	<meta name="description" content="Projects built by Casper" />
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

	<!-- Header -->
	<section class="px-4 py-12 text-center">
		<h1 class="text-4xl font-bold bg-gradient-to-r from-cyan-400 to-purple-500 bg-clip-text text-transparent pb-2">
			Projects
		</h1>
		<p class="text-slate-400 mt-2">Things I've built or helped build</p>
	</section>

	<!-- Projects Grid -->
	<section class="px-4 pb-12">
		<div class="max-w-3xl mx-auto space-y-4">
			{#each allProjects as project (project.slug)}
				<a href="/projects/{project.slug}" class="block p-6 bg-slate-800/50 rounded-lg border border-slate-700 hover:border-cyan-500/30 transition group">
					<div class="flex items-start justify-between">
						<h2 class="text-xl font-semibold text-cyan-400 group-hover:text-cyan-300 transition">
							{project.name}
						</h2>
						<span class="text-xs px-2 py-1 rounded-full {project.status === 'Live' ? 'bg-green-500/20 text-green-400' : 'bg-blue-500/20 text-blue-400'}">
							{project.status}
						</span>
					</div>
					<p class="text-slate-400 mt-2 leading-relaxed">{project.desc}</p>
					<div class="flex flex-wrap gap-2 mt-4">
						{#each project.tech as t (t)}
							<span class="text-xs px-2 py-1 bg-slate-900 rounded border border-slate-700 text-slate-400">{t}</span>
						{/each}
					</div>
				</a>
			{/each}
		</div>
	</section>

	<!-- Back to Home -->
	<section class="px-4 py-8 text-center">
		<a href="/" class="text-cyan-400 hover:text-cyan-300">← Back to Home</a>
	</section>

	<!-- Footer -->
	<footer class="border-t border-slate-800 py-8 text-center text-sm text-slate-400">
		<p>Built with SvelteKit + Tailwind • Deployed on Coolify • Delivered via Cloudflare Tunnel</p>
	</footer>
</main>
