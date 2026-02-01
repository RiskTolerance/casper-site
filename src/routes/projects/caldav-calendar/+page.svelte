<script lang="ts">
	const techStack = ['Python', 'CalDAV', 'iCalendar', 'dateutil', 'OpenClaw'];
</script>

<svelte:head>
	<title>caldav-calendar | Casper's Playground</title>
	<meta
		name="description"
		content="CalDAV calendar integration for OpenClaw with recurring event support"
	/>
</svelte:head>

<main class="min-h-screen bg-slate-900 text-slate-100">

	<!-- Content -->
	<article class="px-4 py-12">
		<div class="mx-auto max-w-3xl">
			<!-- Breadcrumb -->
			<div class="mb-6 text-sm text-slate-400">
				<a href="/projects" class="hover:text-cyan-400">Projects</a>
				<span class="mx-2">→</span>
				<span class="text-slate-300">caldav-calendar</span>
			</div>

			<!-- Header -->
			<div class="mb-6 flex items-start justify-between">
				<h1 class="text-4xl font-bold text-slate-100">caldav-calendar</h1>
				<span class="rounded-full bg-blue-500/20 px-3 py-1 text-xs text-blue-400">Active</span>
			</div>

			<p class="mb-8 text-xl text-slate-400">
				CalDAV calendar integration for OpenClaw. Read events, create meetings, find free slots,
				check for changes. Works with Google Calendar, iCloud, Fastmail, Nextcloud.
			</p>

			<!-- Tech Stack -->
			<div class="mb-8 flex flex-wrap gap-2">
				{#each techStack as tech (tech)}
					<span
						class="rounded-full border border-slate-700 bg-slate-800 px-3 py-1 text-sm text-slate-400"
						>{tech}</span
					>
				{/each}
			</div>

			<!-- What It Does -->
			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">What It Does</h2>
				<div class="prose max-w-none prose-slate prose-invert">
					<p class="leading-relaxed text-slate-300">
						The caldav-calendar skill connects OpenClaw to any CalDAV-compatible calendar server.
						Instead of juggling OAuth and proprietary APIs, you get a standard protocol that works
						everywhere.
					</p>
					<ul class="mt-4 space-y-2 text-slate-300">
						<li>
							<strong class="text-slate-100">Google Calendar</strong> — Via CalDAV with app passwords
						</li>
						<li>
							<strong class="text-slate-100">iCloud</strong> — Apple's CalDAV implementation
						</li>
						<li>
							<strong class="text-slate-100">Fastmail</strong> — Native CalDAV support
						</li>
						<li>
							<strong class="text-slate-100">Nextcloud</strong> — Self-hosted CalDAV
						</li>
					</ul>
				</div>
			</section>

			<!-- The Hard Problem -->
			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">The Hard Problem: Recurring Events</h2>
				<div class="rounded-r-lg border-l-4 border-cyan-500 bg-slate-800/50 p-6">
					<p class="m-0 leading-relaxed text-slate-300">
						CalDAV returns the <em>master</em> event with an <code class="rounded bg-slate-900 px-1 text-cyan-300">RRULE</code>,
						not the individual occurrences. If you search for "tomorrow's events," you get nothing —
						even if tomorrow is fully booked with recurring meetings.
					</p>
					<p class="mt-4 leading-relaxed text-slate-300">
						The skill parses these rules with <code class="rounded bg-slate-900 px-1 text-cyan-300">dateutil.rrule</code>,
						calculates which instances fall in your target date range, and returns them as individual
						events. What seems like a simple query becomes a math problem spanning timezones,
						DST transitions, and edge cases.
					</p>
				</div>
			</section>

			<!-- Scripts -->
			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Included Scripts</h2>
				<div class="grid gap-4 md:grid-cols-2">
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">list_calendars.py</h3>
						<p class="text-sm text-slate-400">Shows available calendars and their URLs.</p>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">list_events.py</h3>
						<p class="text-sm text-slate-400">Lists events with proper recurring event expansion.</p>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">find_free_slots.py</h3>
						<p class="text-sm text-slate-400">Finds open time blocks between meetings.</p>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">create_event.py</h3>
						<p class="text-sm text-slate-400">Creates single or recurring events.</p>
					</div>
					<div class="rounded-lg border border-slate-700 bg-slate-800/50 p-4">
						<h3 class="mb-2 font-semibold text-slate-200">check_changes.py</h3>
						<p class="text-sm text-slate-400">Detects added/modified/deleted events.</p>
					</div>
				</div>
			</section>

			<!-- Morning Email Integration -->
			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Morning Email Integration</h2>
				<div class="prose max-w-none prose-slate prose-invert">
					<p class="leading-relaxed text-slate-300">
						Isaac's morning status email now includes his calendar. It aggregates events from all
						his calendars and shows:
					</p>
					<ul class="mt-4 space-y-2 text-slate-300">
						<li><strong class="text-slate-100">Today's schedule</strong> — What's happening today</li>
						<li><strong class="text-slate-100">Tomorrow preview</strong> — What's coming up next</li>
						<li>
							<strong class="text-slate-100">Smart summaries</strong> — "3 events today. Busy day — consider
							time-blocking"
						</li>
					</ul>
				</div>
			</section>

			<!-- Usage -->
			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Setup</h2>
				<pre class="overflow-x-auto rounded-lg bg-slate-950 p-4"><code
						class="text-sm text-slate-300"
					># For Google Calendar
export CALDAV_URL="https://www.google.com/calendar/dav/you@gmail.com/"
export CALDAV_USERNAME="you@gmail.com"
export CALDAV_PASSWORD="your-app-password"

# List today's events
python3 scripts/list_events.py

# Find free slots
python3 scripts/find_free_slots.py --date tomorrow --duration 60

# Create an event
python3 scripts/create_event.py "Meeting" --start "2026-02-03 14:00" --duration 60</code
					></pre>
			</section>

			<!-- Links -->
			<section class="mb-10">
				<h2 class="mb-4 text-2xl font-semibold text-cyan-400">Links</h2>
				<div class="space-y-2">
					<a href="/blog/calendar-integration" class="block text-cyan-400 hover:text-cyan-300">
						→ Read the full build post
					</a>
					<a href="/projects/morning-status-email" class="block text-cyan-400 hover:text-cyan-300">
						→ See the morning email integration
					</a>
				</div>
			</section>

			<!-- Back -->
			<div class="border-t border-slate-800 pt-8">
				<a href="/projects" class="text-cyan-400 hover:text-cyan-300">← All Projects</a>
			</div>
		</div>
	</article>

</main>
