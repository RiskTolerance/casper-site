<script lang="ts">
	import { gsap } from 'gsap';

	// Svelte 5 runes for state
	let activeDirection = $state<'up' | 'down' | 'left' | 'right' | null>(null);
	let previousDirection = $state<'up' | 'down' | 'left' | 'right' | null>(null);
	let isAnimating = $state(false);
	let shapeElement: HTMLDivElement | null = $state(null);

	// Position coordinates for the shape (percent-based for responsiveness)
	// Grid is 3x3, each cell is roughly 33.33%
	// We center the shape in each directional cell
	const positions = {
		up:    { x: 50,  y: 16.67 },   // Top center (col 2, row 1)
		right: { x: 83.33, y: 50 },    // Right center (col 3, row 2)
		down:  { x: 50,  y: 83.33 },   // Bottom center (col 2, row 3)
		left:  { x: 16.67, y: 50 }    // Left center (col 1, row 2)
	};

	// Button configuration
	const directions = [
		{ id: 'up' as const,    label: '▲', color: 'from-cyan-500 to-cyan-600',    activeColor: 'from-cyan-400 to-cyan-500',    trailColor: '#22d3ee' },
		{ id: 'right' as const, label: '▶', color: 'from-purple-500 to-purple-600', activeColor: 'from-purple-400 to-purple-500', trailColor: '#c084fc' },
		{ id: 'down' as const,  label: '▼', color: 'from-pink-500 to-pink-600',    activeColor: 'from-pink-400 to-pink-500',    trailColor: '#f472b6' },
		{ id: 'left' as const,  label: '◀', color: 'from-emerald-500 to-emerald-600', activeColor: 'from-emerald-400 to-emerald-500', trailColor: '#34d399' }
	];

	// Track animation count for the 12 possible paths
	let animationPaths = $state<Record<string, number>>({});

	function handleDirectionClick(direction: 'up' | 'down' | 'left' | 'right', event: MouseEvent) {
		const target = event.currentTarget as HTMLElement;
		
		if (activeDirection === direction) {
			// Deactivate
			animateButton(target, false);
			previousDirection = activeDirection;
			activeDirection = null;
		} else {
			// Deactivate previous if exists
			if (activeDirection) {
				const prevButton = document.querySelector(`[data-direction="${activeDirection}"]`) as HTMLElement;
				if (prevButton) animateButton(prevButton, false);
			}
			
			// Track the transition
			if (activeDirection) {
				const pathKey = `${activeDirection}→${direction}`;
				animationPaths[pathKey] = (animationPaths[pathKey] || 0) + 1;
			}
			
			previousDirection = activeDirection;
			// Activate new
			animateButton(target, true);
			activeDirection = direction;
			
			// Animate shape to new position
			animateShapeTo(direction);
		}
	}

	function animateShapeTo(direction: 'up' | 'down' | 'left' | 'right') {
		if (!shapeElement) return;
		
		const pos = positions[direction];
		
		gsap.to(shapeElement, {
			duration: 0.4,
			left: `${pos.x}%`,
			top: `${pos.y}%`,
			ease: 'back.out(1.7)',
			onStart: () => {
				// Pulse effect on departure
				if (previousDirection) {
					gsap.fromTo(shapeElement, 
						{ scale: 1 },
						{ scale: 0.8, duration: 0.15, ease: 'power2.in', yoyo: true, repeat: 1 }
					);
				}
			}
		});
		
		// Rotate shape based on direction
		const rotations = { up: 0, right: 90, down: 180, left: -90 };
		gsap.to(shapeElement, {
			duration: 0.3,
			rotation: rotations[direction],
			ease: 'power2.out'
		});
	}

	function animateButton(element: HTMLElement, isActive: boolean) {
		const tl = gsap.timeline();

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
		const baseClasses = 'relative flex h-20 w-20 items-center justify-center rounded-xl text-2xl font-bold text-white transition-colors duration-200 bg-gradient-to-br shadow-lg cursor-pointer select-none z-10';
		const colorClasses = isActive ? direction.activeColor : direction.color;
		const activeClasses = isActive ? 'ring-2 ring-white/50' : 'hover:brightness-110';
		return `${baseClasses} ${colorClasses} ${activeClasses}`;
	}

	function getCurrentTrailColor(): string {
		if (!activeDirection) return '#64748b';
		const dir = directions.find(d => d.id === activeDirection);
		return dir?.trailColor || '#64748b';
	}
</script>

<div class="flex flex-col items-center gap-8">
	<!-- D-Pad Container with Moving Shape -->
	<div class="relative rounded-2xl bg-slate-800/50 p-8 backdrop-blur">
		<!-- Grid layout for D-pad -->
		<div class="relative grid grid-cols-3 grid-rows-3 gap-2 w-[280px] h-[280px]">
			{#each directions as direction}
				<button
					data-direction={direction.id}
					class="{getButtonPosition(direction.id)} {getButtonClasses(direction)}"
					onclick={(e) => handleDirectionClick(direction.id, e)}
					aria-pressed={activeDirection === direction.id}
					aria-label="{direction.id} direction"
				>
					{direction.label}
				</button>
			{/each}
			
			<!-- Center cell (empty, shape passes through here) -->
			<div class="col-start-2 row-start-2 flex items-center justify-center">
				<div class="h-12 w-12 rounded-full bg-slate-700 shadow-inner"></div>
			</div>
			
			<!-- Moving Shape - starts centered -->
			<div
				bind:this={shapeElement}
				class="absolute h-10 w-10 -ml-5 -mt-5 rounded-lg shadow-xl z-20 pointer-events-none"
				style="left: 50%; top: 50%; transform: translate(-50%, -50%);"
				class:bg-gradient-to-br={activeDirection !== null}
				class:from-cyan-400={activeDirection === 'up'}
				class:to-cyan-600={activeDirection === 'up'}
				class:from-purple-400={activeDirection === 'right'}
				class:to-purple-600={activeDirection === 'right'}
				class:from-pink-400={activeDirection === 'down'}
				class:to-pink-600={activeDirection === 'down'}
				class:from-emerald-400={activeDirection === 'left'}
				class:to-emerald-600={activeDirection === 'left'}
				class:bg-slate-600={activeDirection === null}
			>
				<!-- Inner glow effect -->
				<div class="absolute inset-1 rounded-md bg-white/20"></div>
			</div>
		</div>
		
		<!-- Trail lines SVG overlay -->
		<svg class="absolute inset-0 pointer-events-none opacity-20" viewBox="0 0 100 100" preserveAspectRatio="none">
			<!-- Cross pattern showing possible paths -->
			<line x1="50" y1="16.67" x2="50" y2="83.33" stroke={getCurrentTrailColor()} stroke-width="0.5" stroke-dasharray="2 2">
				{#if activeDirection === 'up' || activeDirection === 'down'}
					<animate attributeName="opacity" values="0.2;0.5;0.2" dur="1s" repeatCount="indefinite" />
				{/if}
			</line>
			<line x1="16.67" y1="50" x2="83.33" y2="50" stroke={getCurrentTrailColor()} stroke-width="0.5" stroke-dasharray="2 2">
				{#if activeDirection === 'left' || activeDirection === 'right'}
					<animate attributeName="opacity" values="0.2;0.5;0.2" dur="1s" repeatCount="indefinite" />
				{/if}
			</line>
		</svg>
	</div>

	<!-- State Display -->
	<div class="min-h-[100px] text-center">
		{#if activeDirection}
			<div class="space-y-2">
				<p class="text-lg text-slate-300">
					Active: <span class="font-semibold capitalize" style="color: {getCurrentTrailColor()}">{activeDirection}</span>
				</p>
				{#if previousDirection}
					<p class="text-sm text-slate-500">
						From: <span class="capitalize">{previousDirection}</span>
						<span class="mx-2">→</span>
						<span class="capitalize">{activeDirection}</span>
					</p>
				{/if}
				<div class="flex items-center justify-center gap-2 text-xs text-slate-500">
					<span class="h-1.5 w-1.5 rounded-full bg-green-500 animate-pulse"></span>
					12 possible animation paths
				</div>
			</div>
		{:else}
			<p class="text-slate-500 italic">Click a direction to move the shape</p>
		{/if}
	</div>

	<!-- Animation Path Stats -->
	{#if Object.keys(animationPaths).length > 0}
		<div class="rounded-lg border border-slate-700 bg-slate-800/30 px-4 py-3">
			<p class="mb-2 text-xs font-semibold uppercase tracking-wider text-slate-500">Paths Traveled</p>
			<div class="flex flex-wrap justify-center gap-2">
				{#each Object.entries(animationPaths) as [path, count]}
					<span class="rounded bg-slate-700/50 px-2 py-1 text-xs text-slate-300 font-mono">
						{path}: {count}
					</span>
				{/each}
			</div>
		</div>
	{/if}

	<!-- Debug state display -->
	<div class="rounded-lg border border-slate-700 bg-slate-800/30 px-4 py-3 text-xs text-slate-400 font-mono">
		<span class="text-slate-500">$state:</span> {JSON.stringify({ activeDirection, previousDirection, pathCount: Object.keys(animationPaths).length })}
	</div>
</div>

<style>
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
