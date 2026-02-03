<script lang="ts">
	import { gsap } from 'gsap';

	// Svelte 5 runes for state
	let activeDirection = $state<'up' | 'down' | 'left' | 'right' | null>(null);
	let isAnimating = $state(false);

	// Button configuration with colors and labels
	const directions = [
		{ id: 'up' as const, label: '▲', color: 'from-cyan-500 to-cyan-600', activeColor: 'from-cyan-400 to-cyan-500' },
		{ id: 'right' as const, label: '▶', color: 'from-purple-500 to-purple-600', activeColor: 'from-purple-400 to-purple-500' },
		{ id: 'down' as const, label: '▼', color: 'from-pink-500 to-pink-600', activeColor: 'from-pink-400 to-pink-500' },
		{ id: 'left' as const, label: '◀', color: 'from-emerald-500 to-emerald-600', activeColor: 'from-emerald-400 to-emerald-500' }
	];

	function handleDirectionClick(direction: 'up' | 'down' | 'left' | 'right', event: MouseEvent) {
		const target = event.currentTarget as HTMLElement;
		
		if (activeDirection === direction) {
			// Deactivate
			animateButton(target, false);
			activeDirection = null;
		} else {
			// Deactivate previous if exists
			if (activeDirection) {
				const prevButton = document.querySelector(`[data-direction="${activeDirection}"]`) as HTMLElement;
				if (prevButton) animateButton(prevButton, false);
			}
			// Activate new
			animateButton(target, true);
			activeDirection = direction;
		}
	}

	function animateButton(element: HTMLElement, isActive: boolean) {
		isAnimating = true;
		
		const tl = gsap.timeline({
			onComplete: () => { isAnimating = false; }
		});

		if (isActive) {
			// Press down and pop up with glow
			tl.to(element, {
				duration: 0.1,
				scale: 0.9,
				y: 2,
				ease: 'power2.out'
			})
			.to(element, {
				duration: 0.3,
				scale: 1.05,
				y: 0,
				ease: 'elastic.out(1, 0.5)'
			});

			// Add glow effect
			gsap.to(element, {
				duration: 0.3,
				boxShadow: '0 0 30px rgba(255,255,255,0.3), 0 0 60px rgba(255,255,255,0.1)',
				ease: 'power2.out'
			});
		} else {
			// Release animation
			tl.to(element, {
				duration: 0.15,
				scale: 1,
				y: 0,
				ease: 'power2.out'
			});

			// Remove glow
			gsap.to(element, {
				duration: 0.3,
				boxShadow: '0 4px 6px -1px rgba(0,0,0,0.3)',
				ease: 'power2.out'
			});
		}
	}

	function getButtonPosition(direction: string): string {
		switch (direction) {
			case 'up': return 'col-start-2 row-start-1';
			case 'left': return 'col-start-1 row-start-2';
			case 'right': return 'col-start-3 row-start-2';
			case 'down': return 'col-start-2 row-start-3';
			default: return '';
		}
	}

	function getButtonClasses(direction: typeof directions[0]): string {
		const isActive = activeDirection === direction.id;
		const baseClasses = 'relative flex h-20 w-20 items-center justify-center rounded-xl text-2xl font-bold text-white transition-colors duration-200 bg-gradient-to-br shadow-lg cursor-pointer select-none';
		const colorClasses = isActive ? direction.activeColor : direction.color;
		const activeClasses = isActive ? 'ring-2 ring-white/50' : 'hover:brightness-110';
		return `${baseClasses} ${colorClasses} ${activeClasses}`;
	}
</script>

<div class="flex flex-col items-center gap-8">
	<!-- D-Pad Container -->
	<div class="relative rounded-2xl bg-slate-800/50 p-8 backdrop-blur">
		<!-- Grid layout for D-pad shape -->
		<div class="grid grid-cols-3 grid-rows-3 gap-2">
			{#each directions as direction}
				<button
					data-direction={direction.id}
					class="{getButtonPosition(direction.id)} {getButtonClasses(direction)}"
					onclick={(e) => handleDirectionClick(direction.id, e)}
					disabled={isAnimating}
					aria-pressed={activeDirection === direction.id}
					aria-label="{direction.id} direction"
				>
					{direction.label}
				</button>
			{/each}
			
			<!-- Center indicator -->
			<div class="col-start-2 row-start-2 flex items-center justify-center">
				<div class="h-12 w-12 rounded-full bg-slate-700 shadow-inner flex items-center justify-center">
					<div class="h-4 w-4 rounded-full bg-slate-600 transition-all duration-300"
						class:bg-cyan-400={activeDirection === 'up'}
						class:bg-purple-400={activeDirection === 'right'}
						class:bg-pink-400={activeDirection === 'down'}
						class:bg-emerald-400={activeDirection === 'left'}
						class:shadow-[0_0_15px]={activeDirection !== null}
						class:shadow-cyan-400={activeDirection === 'up'}
						class:shadow-purple-400={activeDirection === 'right'}
						class:shadow-pink-400={activeDirection === 'down'}
						class:shadow-emerald-400={activeDirection === 'left'}
					></div>
				</div>
			</div>
		</div>
	</div>

	<!-- State Display -->
	<div class="min-h-[80px] text-center">
		{#if activeDirection}
			<div class="space-y-2">
				<p class="text-lg text-slate-300">
					Active: <span class="font-semibold capitalize text-cyan-400">{activeDirection}</span>
				</p>
				<div class="flex items-center justify-center gap-2 text-sm text-slate-500">
					<span class="h-2 w-2 rounded-full bg-green-500 animate-pulse"></span>
					Tracking with Svelte 5 runes
				</div>
			</div>
		{:else}
			<p class="text-slate-500 italic">Click a direction to activate</p>
		{/if}
	</div>

	<!-- Debug state display -->
	<div class="rounded-lg border border-slate-700 bg-slate-800/30 px-4 py-3 text-xs text-slate-400 font-mono">
		<span class="text-slate-500">$state:</span> {JSON.stringify({ activeDirection, isAnimating })}
	</div>
</div>

<style>
	/* Custom styles for smoother interactions */
	button {
		touch-action: manipulation;
	}
	
	button:active {
		outline: none;
	}
	
	button:focus-visible {
		outline: 2px solid rgba(255, 255, 255, 0.5);
		outline-offset: 2px;
	}
</style>
