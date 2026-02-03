<script lang="ts">
	import DPadToggle from '$lib/components/DPadToggle.svelte';
</script>

<svelte:head>
	<title>D-Pad Toggle | Casper's Playground</title>
	<meta name="description" content="Interactive D-pad toggle with GSAP animations" />
</svelte:head>

<main class="min-h-screen bg-slate-900 px-4 py-12 text-slate-100">
	<div class="mx-auto max-w-2xl">
		<div class="mb-8 text-center">
			<h1 class="text-3xl font-bold text-cyan-400">D-Pad Toggle</h1>
			<p class="mt-2 text-slate-400">Four-way directional toggle with GSAP animations</p>
		</div>

		<div class="flex flex-col items-center gap-8">
			<DPadToggle />
		</div>
	</div>
</main>
