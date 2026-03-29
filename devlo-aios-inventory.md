# devlo-aios Repository Inventory

> Generated: 2026-03-29
> Source: `alldevlo/devlo-aios` (commit `b7772af`)
> Method: GitHub Code Search API (file discovery + keyword cross-referencing)

**Note:** File content was classified using directory conventions, file naming patterns, and keyword-based cross-referencing (supabase, hubspot, n8n, lemlist, slack, trigger.dev, google). The MCP `get_file_contents` endpoint was restricted to `alldevlo/.github`; descriptions are inferred from file names and search-context matches.

---

## Full Inventory

### Skills (`devlo/devlo/skills/`)

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| email-composer | skill | `devlo/devlo/skills/email-composer/SKILL.md` | Composes outbound emails for client campaigns following devlo copywriting guidelines | complete | context/clients.md, context/strategy.md | - |
| prompt-engineer | skill | `devlo/devlo/skills/prompt-engineer/SKILL.md` | Engineers and structures prompts for various AI-driven workflows and automations | complete | - | Claude API |
| prompt-optimizer | skill | `devlo/devlo/skills/prompt-optimizer/SKILL.md` | Optimizes existing prompts for improved output quality and consistency | complete | - | Claude API |
| client-onboarder | skill | `devlo/devlo/skills/client-onboarder/SKILL.md` | Onboards new clients by scaffolding context folders and populating business/strategy files | complete | clients/ARCHITECTURE.md, _shared/scaffold-business/ | HubSpot |
| campaign-analyst | skill | `devlo/devlo/skills/campaign-analyst/SKILL.md` | Analyzes lead generation campaign performance and suggests optimizations | complete | context/data/prospecting_prompt_playbook.md | Lemlist, HubSpot |
| pipeline-advisor | skill | `devlo/devlo/skills/pipeline-advisor/SKILL.md` | Advises on sales pipeline status, deal progression, and next actions | complete | context/clients.md | HubSpot |
| prospect-researcher | skill | `devlo/devlo/skills/prospect-researcher/SKILL.md` | Researches prospects and companies to enrich lead data for outbound campaigns | complete | context/data/prospecting_prompt_playbook.md | - |
| leadgen-final-campaign-qa | skill | `devlo/devlo/skills/leadgen-final-campaign-qa/SKILL.md` | Final QA checklist for lead generation campaigns before launch | complete | - | Lemlist |
| scaffold-business (shared) | skill | `devlo/_shared/scaffold-business/SKILL.md` | Shared skill template for scaffolding new client business context files | complete | creator/schemas/ | - |
| create-aios (creator) | skill | `creator/.claude/skills/create-aios/SKILL.md` | Creator skill to scaffold a complete new AIOS instance for a new agency | complete | creator/schemas/, creator/templates/ | - |

### Commands (`devlo/.claude/commands/`)

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| client-sync | command | `devlo/.claude/commands/client-sync.md` | Syncs client context data from external sources into the repo | complete | scripts/sync_client_context.py, scripts/client_registry.json | Supabase, HubSpot |
| devlo-prime | command | `devlo/.claude/commands/devlo-prime.md` | Primes the Devlo agent with full organizational context before a session | complete | devlo/context/*.md | HubSpot |
| client-inbox | command | `devlo/.claude/commands/client-inbox.md` | Reviews and triages client inbox messages, drafts responses | complete | - | - |
| client-prime | command | `devlo/.claude/commands/client-prime.md` | Primes context for a specific client before working on their tasks | complete | clients/{client}/context/*.md | Supabase |
| devlo-weekly-report | command | `devlo/.claude/commands/devlo-weekly-report.md` | Generates a weekly activity and performance report across all clients | complete | - | HubSpot |
| devlo-weekly-review | command | `devlo/.claude/commands/devlo-weekly-review.md` | Runs a weekly operational review of campaigns, pipeline, and tasks | complete | - | HubSpot |
| devlo-proposal-draft | command | `devlo/.claude/commands/devlo-proposal-draft.md` | Drafts a client proposal based on business context and strategy | complete | - | - |
| devlo-daily-briefing | command | `devlo/.claude/commands/devlo-daily-briefing.md` | Generates a daily briefing with key metrics, tasks, and alerts | complete | - | HubSpot |
| devlo-campaign-review | command | `devlo/.claude/commands/devlo-campaign-review.md` | Reviews active campaigns and provides performance analysis | complete | - | HubSpot, Lemlist |
| devlo-onboarding-plan | command | `devlo/.claude/commands/devlo-onboarding-plan.md` | Creates an onboarding plan for a new client engagement | complete | - | HubSpot |
| devlo-client-check-in | command | `devlo/.claude/commands/devlo-client-check-in.md` | Runs a check-in review for a specific client relationship | complete | - | - |
| devlo-prospect-research | command | `devlo/.claude/commands/devlo-prospect-research.md` | Triggers deep prospect research for a given company or contact | complete | - | HubSpot |
| devlo-optimize-outbound | command | `devlo/.claude/commands/devlo-optimize-outbound.md` | Optimizes outbound messaging sequences based on reply data | complete | - | Lemlist |

### Scripts / Modules (`devlo/scripts/`)

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| client_loader.py | module | `devlo/scripts/client_loader.py` | Loads client context data from registry and local files into memory | complete | client_registry.json | Supabase |
| analyze_replies.py | module | `devlo/scripts/analyze_replies.py` | Analyzes email reply patterns and categorizes response types | complete | - | Lemlist |
| fetch_google_docs.py | module | `devlo/scripts/fetch_google_docs.py` | Fetches content from Google Docs for context synchronization | complete | - | Google Docs |
| fetch_client_data.py | module | `devlo/scripts/fetch_client_data.py` | Fetches client data from external CRM/databases | complete | - | Supabase, HubSpot |
| sync_client_context.py | module | `devlo/scripts/sync_client_context.py` | Synchronizes client context files between repo and external sources | complete | client_registry.json | Supabase |
| fetch_hubspot_outcomes.py | module | `devlo/scripts/fetch_hubspot_outcomes.py` | Fetches deal outcomes and pipeline data from HubSpot CRM | complete | - | HubSpot |
| fetch_lemlist_activities.py | module | `devlo/scripts/fetch_lemlist_activities.py` | Fetches campaign activity data from Lemlist for analysis | complete | - | Lemlist |
| analyze_and_report.py | module | `devlo/scripts/analyze_and_report.py` | Aggregates data from multiple sources and generates summary reports | complete | - | - |
| push_client_context.py | module | `devlo/scripts/push_client_context.py` | Pushes updated client context back to external storage | complete | - | Supabase |
| requirements.txt | config | `devlo/scripts/requirements.txt` | Python package dependencies for scripts | complete | - | - |
| client_registry.json | config | `devlo/scripts/client_registry.json` | Registry mapping of client slugs to external IDs and metadata | complete | - | Supabase, HubSpot |

### Trigger.dev / n8n Integration (`devlo/src/trigger/`)

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| n8n-error-logger.ts | module | `devlo/src/trigger/n8n-error-logger.ts` | Trigger.dev task that logs n8n workflow errors for monitoring | complete | trigger.config.ts | n8n, Trigger.dev |
| trigger.config.ts | config | `devlo/trigger.config.ts` | Trigger.dev project configuration file | complete | - | Trigger.dev |

### Configuration Files

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| CLAUDE.md (devlo) | config | `devlo/CLAUDE.md` | Claude Code agent instructions for the devlo workspace | complete | - | Supabase, n8n |
| CLAUDE.md (creator) | config | `creator/CLAUDE.md` | Claude Code agent instructions for the creator workspace | complete | - | n8n |
| package.json | config | `devlo/package.json` | Node.js project configuration and dependencies | complete | - | Trigger.dev |
| tsconfig.json | config | `devlo/tsconfig.json` | TypeScript compiler configuration | complete | - | - |
| README.md | other | `README.md` | Repository root readme | complete | - | - |
| .vercel/project.json | config | `ai-ops/clients/covalo/site/.vercel/project.json` | Vercel deployment configuration for Covalo site | complete | - | Vercel |
| .vercel/README.txt | other | `ai-ops/clients/covalo/site/.vercel/README.txt` | Vercel auto-generated readme | complete | - | - |

### Devlo Context Files (`devlo/devlo/context/`)

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| team.md | other | `devlo/devlo/context/team.md` | Devlo team structure, roles, and responsibilities | complete | - | Supabase, Slack |
| clients.md | other | `devlo/devlo/context/clients.md` | Overview of all active client relationships and status | complete | - | HubSpot |
| strategy.md | other | `devlo/devlo/context/strategy.md` | Devlo business strategy, positioning, and growth plans | complete | - | n8n |
| business.md | other | `devlo/devlo/context/business.md` | Core business model, services, and value proposition | complete | - | n8n |
| processes.md | other | `devlo/devlo/context/processes.md` | Internal operational processes and standard procedures | complete | - | Lemlist, Slack |
| infrastructure.md | other | `devlo/devlo/context/data/infrastructure.md` | Technical infrastructure, tools stack, and integrations map | complete | - | Supabase, Lemlist, Slack, Trigger.dev |
| tools-subscriptions.md | other | `devlo/devlo/context/data/tools-subscriptions.md` | Active SaaS subscriptions and tool inventory | complete | - | Lemlist, Slack |
| prospecting_prompt_playbook.md | prompt | `devlo/devlo/context/data/prospecting_prompt_playbook.md` | Prompt playbook for prospecting workflows and outbound messaging | complete | - | n8n |

### Devlo Meta / Reference

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| _meta.md (devlo) | config | `devlo/devlo/_meta.md` | Metadata and structure description for the devlo agent folder | complete | - | Supabase |
| _registry.md | config | `devlo/clients/_registry.md` | Client registry with slugs, status, and folder mapping | complete | - | Supabase |
| ARCHITECTURE.md | other | `devlo/clients/ARCHITECTURE.md` | Architecture guide for client context folder structure | complete | - | - |
| decisions.md (reference) | other | `devlo/reference/decisions.md` | Architectural decision records (ADRs) for the repo | complete | - | n8n, HubSpot |
| decisions.md (devlo) | other | `devlo/devlo/reference/decisions.md` | Devlo-specific decision records and operational choices | complete | - | Supabase, n8n |
| learnings.md | other | `devlo/_shared/learnings.md` | Shared learnings and retrospective insights across projects | complete | - | HubSpot |
| devloch_business_content.md | other | `devlo/devloch_business_content.md` | Business content and marketing copy for Devlo.ch website | complete | - | - |

### Devlo Sources (Knowledge Base)

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| devlo_aios_guide_equipe.md | other | `devlo/devlo/sources/devlo_aios_guide_equipe.md` | Team guide for using the AIOS system (French) | complete | - | - |
| devlo_employee_onboarding.md | other | `devlo/devlo/sources/devlo_employee_onboarding.md` | Employee onboarding documentation and checklist | complete | - | - |
| devlo_lead_generation_guidelines_lgd.md | other | `devlo/devlo/sources/devlo_lead_generation_guidelines_lgd.md` | Lead generation guidelines and best practices | complete | - | Lemlist |
| devlo_inbox_management_guidelines_for_llms_2026.md | other | `devlo/devlo/sources/devlo_inbox_management_guidelines_for_llms_2026.md` | Guidelines for LLM-assisted inbox management workflows | complete | - | - |
| devlo_client_onboarding_and_termination_guidelines.md | other | `devlo/devlo/sources/devlo_client_onboarding_and_termination_guidelines.md` | Guidelines for client onboarding and offboarding processes | complete | - | HubSpot |

### Devlo Outputs

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| winning-patterns.md | other | `devlo/devlo/outputs/experiments/winning-patterns.md` | Documented winning patterns from outbound experiments | complete | - | - |
| 2026-03-20-n8n-workflow-audit.md | other | `devlo/devlo/outputs/2026-03-20-n8n-workflow-audit.md` | Audit of n8n workflow configurations and reliability | complete | - | n8n, HubSpot |
| 2026-03-15-ch-enrichment-brief.md | other | `devlo/devlo/outputs/2026-03-15-ch-enrichment-brief.md` | Swiss market enrichment research brief for prospecting | complete | - | HubSpot |
| 2026-03-27-aios-audit-action-plan.md | other | `devlo/devlo/outputs/2026-03-27-aios-audit-action-plan.md` | Action plan from AIOS architecture audit findings | complete | - | n8n, Trigger.dev |
| 2026-03-27-lemlist-qa-prompt-audit.md | other | `devlo/devlo/outputs/2026-03-27-lemlist-qa-prompt-audit.md` | QA audit of Lemlist prompts and email sequence quality | complete | - | Lemlist |

### Devlo Next Tasks

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| 001-event-driven-cross-repo-sync.md | other | `devlo/devlo/next-tasks/001-event-driven-cross-repo-sync.md` | Task spec for event-driven sync between AIOS repos | complete | - | n8n, Trigger.dev |

### Client Context: BitSight (`devlo/clients/bitsight/`)

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| _meta.md | config | `devlo/clients/bitsight/_meta.md` | BitSight client metadata and configuration | complete | - | - |
| business.md | other | `devlo/clients/bitsight/context/business.md` | BitSight business context and company profile | complete | - | - |
| strategy.md | other | `devlo/clients/bitsight/context/strategy.md` | BitSight go-to-market strategy and positioning | complete | - | - |
| processes.md | other | `devlo/clients/bitsight/context/processes.md` | BitSight operational processes and engagement workflow | complete | - | HubSpot |
| team.md | other | `devlo/clients/bitsight/context/team.md` | BitSight team contacts and stakeholder map | complete | - | - |
| email1-prompt.md | prompt | `devlo/clients/bitsight/copywriting-prompts/email1-prompt.md` | Copywriting prompt for BitSight first outreach email | complete | - | Lemlist |

### Client Context: Mobatime (`devlo/clients/mobatime/`)

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| _meta.md | config | `devlo/clients/mobatime/_meta.md` | Mobatime client metadata and configuration | complete | - | - |
| business.md | other | `devlo/clients/mobatime/context/business.md` | Mobatime business context and company profile | complete | - | HubSpot |
| strategy.md | other | `devlo/clients/mobatime/context/strategy.md` | Mobatime go-to-market strategy and positioning | complete | - | - |
| processes.md | other | `devlo/clients/mobatime/context/processes.md` | Mobatime operational processes and engagement workflow | complete | - | HubSpot |
| team.md | other | `devlo/clients/mobatime/context/team.md` | Mobatime team contacts and stakeholder map | complete | - | - |

### Client Context: Tune Insight (`devlo/clients/tune-insight/`)

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| _meta.md | config | `devlo/clients/tune-insight/_meta.md` | Tune Insight client metadata and configuration | complete | - | - |
| business.md | other | `devlo/clients/tune-insight/context/business.md` | Tune Insight business context and company profile | complete | - | Supabase |
| strategy.md | other | `devlo/clients/tune-insight/context/strategy.md` | Tune Insight go-to-market strategy and positioning | complete | - | - |
| processes.md | other | `devlo/clients/tune-insight/context/processes.md` | Tune Insight operational processes and engagement workflow | complete | - | - |
| team.md | other | `devlo/clients/tune-insight/context/team.md` | Tune Insight team contacts and stakeholder map | complete | - | - |
| clients.md | other | `devlo/clients/tune-insight/context/clients.md` | Tune Insight's own client/partner relationships | complete | - | Supabase |

### Collaboration

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| hr-hiring-trigger-playbook.md | workflow | `devlo/collaboration/benedicta-guntoro-charles/hr-hiring-trigger-playbook.md` | Playbook for automating HR hiring triggers via Clay agent | complete | - | Clay |
| clay-agent-mobatime-hr-hiring.md | workflow | `devlo/collaboration/benedicta-guntoro-charles/clay-agent-mobatime-hr-hiring.md` | Clay agent configuration for Mobatime HR hiring automation | complete | - | Clay |

### Creator Module (`creator/`)

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| golden-rules.md | other | `creator/docs/golden-rules.md` | Golden rules and principles for AIOS architecture design | complete | - | - |
| why-aios-architecture.md | other | `creator/docs/why-aios-architecture.md` | Rationale and philosophy behind the AIOS repo architecture | complete | - | n8n |
| sync-patterns.md | other | `creator/docs/sync-patterns.md` | Documentation of data synchronization patterns across services | complete | - | Supabase, n8n, HubSpot |
| devlo-example.md | template | `creator/reference/devlo-example.md` | Reference example of a complete devlo AIOS instance | complete | - | HubSpot |
| team.schema.md | template | `creator/schemas/team.schema.md` | Schema definition for team.md context files | complete | - | - |
| business.schema.md | template | `creator/schemas/business.schema.md` | Schema definition for business.md context files | complete | - | - |
| processes.schema.md | template | `creator/schemas/processes.schema.md` | Schema definition for processes.md context files | complete | - | - |
| clients.schema.md | template | `creator/schemas/clients.schema.md` | Schema definition for clients.md context files | complete | - | - |
| sync_website_context.py | template | `creator/templates/scripts/sync_website_context.py` | Template script for syncing website content into context | complete | - | - |
| sync-website-context.yml | workflow | `creator/templates/workflows/sync-website-context.yml` | Workflow template for website context synchronization | complete | - | - |

### AI-Ops Outputs (`ai-ops/outputs/`)

| Name | Type | Path | Description (inferred from name/path) | Status | Dependencies | External Services |
|------|------|------|---------------------------------------|--------|-------------|-------------------|
| 2026-03-27-tool-audit.md | other | `ai-ops/outputs/2026-03-27-tool-audit.md` | Audit of AI tools and subscriptions across the organization | complete | - | Lemlist, Slack |
| 2026-03-27-track1-web-research.md | other | `ai-ops/outputs/2026-03-27-track1-web-research.md` | Web research track output from AIOS workshop | complete | - | - |
| 2026-03-27-track2-expert-brains.md | other | `ai-ops/outputs/2026-03-27-track2-expert-brains.md` | Expert brains track output from AIOS workshop | complete | - | - |
| 2026-03-27-track3-youtube-discovery.md | other | `ai-ops/outputs/2026-03-27-track3-youtube-discovery.md` | YouTube discovery track output from AIOS workshop | complete | - | n8n |
| 2026-03-27-track4-internal-audit.md | other | `ai-ops/outputs/2026-03-27-track4-internal-audit.md` | Internal audit track output from AIOS workshop | complete | - | Lemlist, Slack |
| 2026-03-27-aios-research-synthesis.md | other | `ai-ops/outputs/2026-03-27-aios-research-synthesis.md` | Synthesized research findings from all workshop tracks | complete | - | n8n, Slack |
| 2026-03-27-liam-aios-workshop-synthesis.md | other | `ai-ops/outputs/2026-03-27-liam-aios-workshop-synthesis.md` | Liam's AIOS workshop synthesis and key takeaways | complete | - | n8n |
| 2026-03-27-liam-aios-workshop-transcript.md | other | `ai-ops/outputs/2026-03-27-liam-aios-workshop-transcript.md` | Full transcript of Liam's AIOS workshop session | complete | - | - |

---

## Summary

### Total Count by Type

| Type | Count |
|------|-------|
| skill | 10 |
| command | 13 |
| module | 9 |
| config | 12 |
| prompt | 2 |
| template | 5 |
| workflow | 3 |
| other | 52 |
| **Total** | **106** |

### Skills in devlo-aios vs. Deployed Claude.ai User Skills

**Deployed skills** (Claude.ai user skills):
- `code-perfect`
- `dictation-clean`
- `expert-brain`
- `b2b-email-prompt`
- `leadgen-final-checklist`
- `leadgen-final-campaign-qa`
- `leadgen-signal-framework`
- `sales-deck-generator`
- `wispr-flow`

**Skills in devlo-aios (repo):**
1. `email-composer`
2. `prompt-engineer`
3. `prompt-optimizer`
4. `client-onboarder`
5. `campaign-analyst`
6. `pipeline-advisor`
7. `prospect-researcher`
8. `leadgen-final-campaign-qa`
9. `scaffold-business` (shared)
10. `create-aios` (creator)

**Skills in devlo-aios but NOT deployed as Claude.ai user skills:**
- `email-composer`
- `prompt-engineer`
- `prompt-optimizer`
- `client-onboarder`
- `campaign-analyst`
- `pipeline-advisor`
- `prospect-researcher`
- `scaffold-business`
- `create-aios`

**Deployed skills NOT present in devlo-aios repo:**
- `code-perfect`
- `dictation-clean`
- `expert-brain`
- `b2b-email-prompt`
- `leadgen-final-checklist`
- `leadgen-signal-framework`
- `sales-deck-generator`
- `wispr-flow`

**Only skill present in BOTH:** `leadgen-final-campaign-qa`

### Gaps and Incomplete Areas

| Gap | Location | Issue |
|-----|----------|-------|
| No `devlo/devlo/skills/` folder for 8 deployed skills | `devlo/devlo/skills/` | `code-perfect`, `dictation-clean`, `expert-brain`, `b2b-email-prompt`, `leadgen-final-checklist`, `leadgen-signal-framework`, `sales-deck-generator`, `wispr-flow` have no SKILL.md in the repo |
| No copywriting-prompts for mobatime or tune-insight | `devlo/clients/mobatime/copywriting-prompts/`, `devlo/clients/tune-insight/copywriting-prompts/` | BitSight has `email1-prompt.md` but other clients have no copywriting prompts folder |
| No `devlo/.claude/commands/` for client-specific operations | - | Commands are all devlo-global; no per-client custom commands exist |
| ai-ops/clients/covalo has only Vercel config | `ai-ops/clients/covalo/` | Contains `.vercel/` but no context files or skill definitions |
| Creator module has no tests or validation | `creator/` | Schemas exist but no validation scripts to enforce them |
| Missing `devlo/devlo/context/clients.md` for tune-insight sub-clients | - | `tune-insight/context/clients.md` exists but no equivalent for other clients |
| No `.claude/settings.json` or hooks configuration | `devlo/.claude/` | Commands exist but no settings or hook definitions found |

### External Service Dependency Map

| Service | Files Referencing |
|---------|-------------------|
| **Supabase** | client_loader.py, fetch_client_data.py, sync_client_context.py, push_client_context.py, client_registry.json, CLAUDE.md, _meta.md, _registry.md, decisions.md, tune-insight/context/ |
| **HubSpot** | fetch_hubspot_outcomes.py, client_registry.json, multiple commands (daily-briefing, weekly-report, campaign-review, onboarding-plan, prospect-research), client-onboarder skill, pipeline-advisor skill, multiple context files |
| **n8n** | n8n-error-logger.ts, CLAUDE.md (both), decisions.md, n8n-workflow-audit output, multiple context files, creator docs |
| **Trigger.dev** | trigger.config.ts, n8n-error-logger.ts, package.json, infrastructure.md, aios-audit-action-plan.md, next-tasks/ |
| **Lemlist** | fetch_lemlist_activities.py, analyze_replies.py, campaign-analyst skill, leadgen-final-campaign-qa skill, devlo-campaign-review command, devlo-optimize-outbound command, multiple context/output files |
| **Slack** | team.md, infrastructure.md, tools-subscriptions.md, track4-internal-audit.md, aios-research-synthesis.md |
| **Google Docs** | fetch_google_docs.py |
| **Clay** | hr-hiring-trigger-playbook.md, clay-agent-mobatime-hr-hiring.md |
| **Vercel** | ai-ops/clients/covalo/site/.vercel/ |
| **Claude API** | prompt-engineer skill, prompt-optimizer skill |
