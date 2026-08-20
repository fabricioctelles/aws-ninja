<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://capsule-render.vercel.app/api?type=waving&color=0:232F3E,50:FF9900,100:232F3E&height=200&section=header&text=AWS%20Ninja&fontSize=80&fontColor=FFFFFF&animation=twinkling&fontAlignY=35&desc=217%2B%20Skills%20%E2%80%A2%2036%2B%20AI%20Agents%20%E2%80%A2%20One%20Router&descSize=20&descAlignY=55&descAlign=50"/>
  <source media="(prefers-color-scheme: light)" srcset="https://capsule-render.vercel.app/api?type=waving&color=0:FF9900,50:232F3E,100:FF9900&height=200&section=header&text=AWS%20Ninja&fontSize=80&fontColor=232F3E&animation=twinkling&fontAlignY=35&desc=217%2B%20Skills%20%E2%80%A2%2036%2B%20AI%20Agents%20%E2%80%A2%20One%20Router&descSize=20&descAlignY=55&descAlign=50"/>
  <img alt="AWS Ninja Banner" src="https://capsule-render.vercel.app/api?type=waving&color=0:232F3E,50:FF9900,100:232F3E&height=200&section=header&text=AWS%20Ninja&fontSize=80&fontColor=FFFFFF&animation=twinkling&fontAlignY=35&desc=217%2B%20Skills%20%E2%80%A2%2036%2B%20AI%20Agents%20%E2%80%A2%20One%20Router&descSize=20&descAlignY=55&descAlign=50" width="100%"/>
</picture>

<p align="center">
  <a href="#quick-start"><img src="https://img.shields.io/badge/Quick_Start-5_commands-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white" alt="Quick Start"/></a>
  <a href="#skill-catalog"><img src="https://img.shields.io/badge/Skills-217+-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white" alt="Skills"/></a>
  <a href="#supported-ai-agents"><img src="https://img.shields.io/badge/AI_Agents-36+-00C853?style=for-the-badge&logo=robot&logoColor=white" alt="AI Agents"/></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue?style=for-the-badge" alt="License"/></a>
</p>

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=22&duration=3000&pause=1000&color=FF9900&center=true&vCenter=true&multiline=true&repeat=true&width=600&height=80&lines=Orchestrate+217%2B+AWS+skills+for+AI+agents;One+skill+to+route+them+all" alt="Typing SVG"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/EKS-12%20skills-326CE5?logo=kubernetes&logoColor=white" alt="EKS"/>
  <img src="https://img.shields.io/badge/Databases-12%20skills-527FFF?logo=amazon-dynamodb&logoColor=white" alt="Databases"/>
  <img src="https://img.shields.io/badge/Security-20%2B%20skills-DD344C?logo=amazon-aws&logoColor=white" alt="Security"/>
  <img src="https://img.shields.io/badge/Serverless-10%2B%20skills-FF9900?logo=aws-lambda&logoColor=white" alt="Serverless"/>
  <img src="https://img.shields.io/badge/CDK-13%20skills-232F3E?logo=amazon-aws&logoColor=white" alt="CDK"/>
  <img src="https://img.shields.io/badge/Well--Architected-5%20skills-146EB4?logo=amazon-aws&logoColor=white" alt="Well-Architected"/>
</p>

---

## What is AWS Ninja?

**AWS Ninja** is a **jump skill** — an intelligent router that gives AI coding agents instant access to **217+ specialized AWS skills** from official AWS repositories.

Instead of loading all skills into context (which would consume your entire context window), AWS Ninja:

1. **Analyzes** your AWS task (EKS design, Lambda debugging, security scan, cost optimization)
2. **Routes** to the most relevant specialized skill from the catalog
3. **Loads** the full skill instructions on-demand
4. **Executes** with SSA-grade (Solutions Architect) knowledge

**Result:** Your AI agent becomes an AWS expert without context waste.

---

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/fabricioctelles/aws-ninja.git
cd aws-ninja
```

### 2. Sync AWS Skills Library

```bash
./sync-repos.sh
```

### 3. Install to Your AI Agents

```bash
# Install to all detected agents
./install-aws-ninja.sh --global

# Or install to specific agents
./install-aws-ninja.sh claude-code kiro-cli cursor
```

### 4. Start Using

Invoke the skill with `/aws-ninja` followed by your AWS task:

```
/aws-ninja Design an EKS cluster for fintech with PCI-DSS compliance
```

AWS Ninja automatically routes to `eks-design` + `eks-security` skills.

---

## How It Works

```
┌─────────────────────────────────────────────────────────────────┐
│  "Design an EKS cluster for fintech with PCI-DSS compliance"   │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                         AWS NINJA                               │
│                    (Jump Skill Router)                          │
│                                                                 │
│  ✓ Parses task context                                          │
│  ✓ Searches 217 skills catalog                                  │
│  ✓ Identifies: eks-design + eks-security                        │
│  ✓ Loads SKILL.md with full procedures                          │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│              SPECIALIZED SKILL EXECUTION                        │
│                                                                 │
│  Source: sample-apex-skills/skills/eks-design/                  │
│  Knowledge: AWS EKS Best Practices, CIS Benchmarks              │
│  Output: Architecture diagrams, Terraform, ADRs                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Skill Catalog

**217+ skills** organized by AWS service domain. All sourced from **official AWS repositories**.

### Compute & Containers

| Skill | Source | Use When |
|-------|--------|----------|
| `eks-design` | sample-apex-skills | EKS architecture, ADRs, diagrams |
| `eks-build` | sample-apex-skills | EKS Terraform/Helm implementation |
| `eks-security` | sample-apex-skills | EKS hardening, CIS benchmarks, Pod Security |
| `eks-upgrade-check` | sample-apex-skills | EKS version upgrade readiness |
| `eks-cost-intelligence` | sample-apex-skills | EKS cost optimization, Karpenter, Spot |
| `ecs-architect` | sample-apex-skills | ECS architecture design |
| `ecs-build` | sample-apex-skills | ECS Fargate/EC2 implementation |
| `aws-compute` | agent-toolkit | EC2, Auto Scaling, Graviton, IMDSv2 |
| `aws-containers` | agent-toolkit | ECS, Fargate, ECR, task definitions |
| `aws-serverless` | agent-toolkit | Lambda, API Gateway, Step Functions, SAM |
| `graviton-migration` | sample-apex-skills | ARM64/Graviton migration |

### Databases (12 Services)

| Skill | Source | Use When |
|-------|--------|----------|
| `amazon-dynamodb` | agent-toolkit | DynamoDB design, single-table, GSIs, access patterns |
| `amazon-aurora-mysql` | agent-toolkit | Aurora MySQL setup, optimization, troubleshooting |
| `amazon-aurora-postgresql` | agent-toolkit | Aurora PostgreSQL setup, optimization |
| `aurora-dsql` | agent-toolkit | Aurora DSQL serverless distributed SQL |
| `amazon-rds` | agent-toolkit | RDS MySQL, PostgreSQL, SQL Server, Oracle |
| `amazon-documentdb` | agent-toolkit | DocumentDB/MongoDB migrations, vector search |
| `amazon-elasticache` | agent-toolkit | Redis, Valkey, Memcached caching strategies |
| `amazon-neptune` | agent-toolkit | Graph database, Gremlin, openCypher |
| `amazon-keyspaces` | agent-toolkit | Cassandra-compatible database |
| `amazon-memorydb` | agent-toolkit | MemoryDB for Redis |
| `amazon-timestream` | agent-toolkit | Time-series database |

### Security & Identity (20+ Skills)

| Skill | Source | Use When |
|-------|--------|----------|
| `scanning-with-aws-security-agent` | agent-toolkit | Full SAST/IaC security scan |
| `threat-modeling-with-aws-security-agent` | agent-toolkit | STRIDE threat modeling |
| `pentesting-with-aws-security-agent` | agent-toolkit | Penetration testing |
| `remediating-with-aws-security-agent` | agent-toolkit | Fix security findings |
| `aws-iam` | agent-toolkit | IAM policies, roles, least privilege |
| `aws-security` | agent-toolkit | Security Hub, GuardDuty, Inspector, Macie |
| `creating-secrets-using-best-practices` | agent-toolkit | Secrets Manager, KMS, rotation |

### Serverless (10+ Skills)

| Skill | Source | Use When |
|-------|--------|----------|
| `aws-lambda-microvms` | agent-toolkit | Firecracker MicroVMs, tenant isolation |
| `aws-lambda-durable-functions` | agent-toolkit | Long-running Lambda, saga patterns |
| `aws-step-functions` | agent-toolkit | State machines, ASL, JSONata |
| `debugging-lambda-timeouts` | agent-toolkit | Lambda timeout troubleshooting |
| `connecting-lambda-to-api-gateway` | agent-toolkit | Lambda + API Gateway integration |

### Networking & CDN (15+ Skills)

| Skill | Source | Use When |
|-------|--------|----------|
| `creating-production-vpc-multi-az` | agent-toolkit | Production VPC setup |
| `cloudfront` | agent-toolkit | CDN, edge caching, OAC |
| `route53` | agent-toolkit | DNS, health checks, routing policies |
| `elastic-load-balancing` | agent-toolkit | ALB, NLB, GWLB |
| `waf` | agent-toolkit | AWS WAF, bot control, rate limiting |
| `configuring-vpc-endpoints-for-private-aws-service-access` | agent-toolkit | PrivateLink, VPC endpoints |

### Well-Architected Framework

| Skill | Source | Use When |
|-------|--------|----------|
| `aws-well-architected-framework-review` | sample-wa-skills | Full WA review, 6 pillars, 57 questions |
| `wa-guardrails` | sample-wa-skills | Config rules, SCPs, preventive controls |
| `migration-readiness` | sample-wa-skills | 7 Rs assessment, migration planning |

### DevOps & Operations

| Skill | Source | Use When |
|-------|--------|----------|
| `investigating-incidents-with-aws-devops-agent` | agent-toolkit | Incident investigation |
| `aws-health-events` | tools-for-devops | AWS Health events analysis |
| `rds-operation-review` | tools-for-devops | RDS/Aurora operational review |
| `service-quota-check` | tools-for-devops | Quota limits, capacity planning |

### AI & Machine Learning

| Skill | Source | Use When |
|-------|--------|----------|
| `amazon-bedrock` | agent-toolkit | Bedrock, GenAI, RAG, Agents, AgentCore |
| `aws-ai-ml` | agent-toolkit | SageMaker, ML workflows |
| `eks-genai` | sample-apex-skills | GPU/Neuron workloads on EKS |

### IaC & Deployment

| Skill | Source | Use When |
|-------|--------|----------|
| `aws-cdk` | agent-toolkit | CDK TypeScript/Python, constructs |
| `aws-cdk-development` | sample-builders | CDK expert patterns |
| `aws-cloudformation` | agent-toolkit | CloudFormation templates, cfn-lint |
| `terraform-skill` | sample-apex-skills | Terraform modules, HCL |
| `cost-estimator` | sample-builders | CDK infrastructure cost estimation |

<details>
<summary><strong>📋 View Full Skill Catalog (217+ skills)</strong></summary>

See [`aws-ninja/references/skill-catalog.md`](aws-ninja/references/skill-catalog.md) for the complete list organized by repository.

</details>

---

## Supported AI Agents

AWS Ninja installs to **36+ AI coding agents** with one command:

| Agent | Global Path | Status |
|-------|-------------|--------|
| **Claude Code** | `~/.claude/skills/` | ✅ Tested |
| **Kiro CLI** | `~/.kiro/skills/` | ✅ Tested |
| **Cursor** | `~/.cursor/skills/` | ✅ Tested |
| **Windsurf** | `~/.codeium/windsurf/skills/` | ✅ Supported |
| **GitHub Copilot** | `~/.copilot/skills/` | ✅ Supported |
| **Codex CLI** | `~/.codex/skills/` | ✅ Supported |
| **Gemini CLI** | `~/.gemini/skills/` | ✅ Supported |
| **OpenCode** | `~/.config/opencode/skills/` | ✅ Supported |
| **Cline** | `~/.agents/skills/` | ✅ Supported |
| **Roo Code** | `~/.roo/skills/` | ✅ Supported |
| **Continue** | `~/.continue/skills/` | ✅ Supported |
| **Goose** | `~/.config/goose/skills/` | ✅ Supported |
| **Devin** | `~/.config/devin/skills/` | ✅ Supported |
| **OpenHands** | `~/.openhands/skills/` | ✅ Supported |

<details>
<summary><strong>View all 36 supported agents</strong></summary>

| Agent | Global Path |
|-------|-------------|
| Amp | `~/.config/agents/skills/` |
| Augment | `~/.augment/skills/` |
| Cortex | `~/.snowflake/cortex/skills/` |
| Droid | `~/.factory/skills/` |
| Firebender | `~/.firebender/skills/` |
| ForgeCode | `~/.forge/skills/` |
| Grok Build | `~/.grok/skills/` |
| IBM Bob | `~/.bob/skills/` |
| Junie | `~/.junie/skills/` |
| Kilo Code | `~/.kilocode/skills/` |
| Lingma | `~/.lingma/skills/` |
| MiniMax Code | `~/.minimax/skills/` |
| Mistral Vibe | `~/.vibe/skills/` |
| Neovate | `~/.neovate/skills/` |
| OpenClaw | `~/.openclaw/skills/` |
| Pi | `~/.pi/agent/skills/` |
| Qoder | `~/.qoder/skills/` |
| Qwen Code | `~/.qwen/skills/` |
| Tabnine CLI | `~/.tabnine/agent/skills/` |
| Trae | `~/.trae/skills/` |
| Zencoder | `~/.zencoder/skills/` |
| Antigravity | `~/.gemini/antigravity/skills/` |

</details>

---

## Source Repositories

All skills come from **official AWS repositories** — maintained by AWS Solutions Architects, TAMs, and ProServe teams.

| Org | Repository | Skills | Focus |
|-----|------------|--------|-------|
| **aws** | [agent-toolkit-for-aws](https://github.com/aws/agent-toolkit-for-aws) | 100+ | Core services, databases, serverless, security |
| **aws** | [tools-for-devops-agent](https://github.com/aws/tools-for-devops-agent) | 15 | Operations, incidents, RDS/EKS reviews |
| **aws-samples** | [sample-apex-skills](https://github.com/aws-samples/sample-apex-skills) | 25+ | EKS, ECS, platform engineering |
| **aws-samples** | [sample-agent-skills-for-builders](https://github.com/aws-samples/sample-agent-skills-for-builders) | 13 | CDK, testing, cost estimation |
| **aws-samples** | [sample-well-architected-skills-and-steering](https://github.com/aws-samples/sample-well-architected-skills-and-steering) | 5 | Well-Architected reviews |
| **aws-samples** | [sample-corgiro-aws-ops-skills](https://github.com/aws-samples/sample-corgiro-aws-ops-skills) | 1 | Multi-account operations |

---

## Installation Options

### Linux/macOS (Bash)

```bash
git clone https://github.com/fabricioctelles/aws-ninja.git
cd aws-ninja
./sync-repos.sh           # Clone AWS skill repositories
./install-aws-ninja.sh --global
```

**Options:**

```bash
./install-aws-ninja.sh --project              # Project-level only
./install-aws-ninja.sh claude-code cursor     # Specific agents
./install-aws-ninja.sh --symlink --global     # Symlink (development)
./install-aws-ninja.sh --list                 # List supported agents
```

### Windows (PowerShell)

```powershell
git clone https://github.com/fabricioctelles/aws-ninja.git
cd aws-ninja
.\sync-repos.ps1          # Clone AWS skill repositories
.\install-aws-ninja.ps1 -Global
```

**Options:**

```powershell
.\install-aws-ninja.ps1 -Project                    # Project-level only
.\install-aws-ninja.ps1 -Agents claude-code,cursor  # Specific agents
.\install-aws-ninja.ps1 -Symlink -Global            # Symlink (requires admin)
.\install-aws-ninja.ps1 -List                       # List supported agents
```

---

## Usage Examples

Invoke with `/aws-ninja` followed by your task:

| Command | Routed To |
|---------|-----------|
| `/aws-ninja Design an EKS cluster for fintech with PCI-DSS` | `eks-design` + `eks-security` |
| `/aws-ninja Help me choose between DynamoDB and Aurora` | `aws-database` → specific DB skill |
| `/aws-ninja Scan this Terraform for security issues` | `scanning-with-aws-security-agent` |
| `/aws-ninja Reduce costs on our EKS cluster` | `eks-cost-intelligence` |
| `/aws-ninja Why is my Lambda timing out?` | `debugging-lambda-timeouts` |
| `/aws-ninja Run a Well-Architected review` | `aws-well-architected-framework-review` |
| `/aws-ninja Set up a production VPC with private subnets` | `creating-production-vpc-multi-az` |

---

## Updating Skills

AWS skills are actively maintained. Update to latest:

**Linux/macOS:**
```bash
./sync-repos.sh           # Pull latest from all repos
./sync-repos.sh --status  # Check repo status
```

**Windows:**
```powershell
.\sync-repos.ps1          # Pull latest from all repos
.\sync-repos.ps1 -Status  # Check repo status
```

---

## Why Jump Skills?

| Traditional Approach | Jump Skill Approach |
|---------------------|---------------------|
| Load all 217 skills into context | Load only metadata (~500 tokens) |
| ❌ Consumes entire context window | ✅ Minimal context usage |
| ❌ Slower responses | ✅ Fast routing |
| ❌ Irrelevant skills interfere | ✅ Always uses most specific skill |

---

## Project Structure

```
aws-ninja/                        # Clone this anywhere
├── aws-ninja/                    # The skill itself
│   ├── SKILL.md                  # Routing logic + instructions
│   └── references/
│       └── skill-catalog.md      # Full 217 skills catalog
├── install-aws-ninja.sh          # Multi-agent installer (Linux/macOS)
├── install-aws-ninja.ps1         # Multi-agent installer (Windows)
├── sync-repos.sh                 # AWS repos sync script (Linux/macOS)
├── sync-repos.ps1                # AWS repos sync script (Windows)
├── repos.md                      # Source repository URLs
└── README.md

# After ./sync-repos.sh (cloned into same directory):
aws-ninja/
├── agent-toolkit-for-aws/
├── tools-for-devops-agent/
├── sample-apex-skills/
├── sample-agent-skills-for-builders/
├── sample-well-architected-skills-and-steering/
└── ...
```

---

## FAQ

<details>
<summary><strong>Why not install all 217 skills directly?</strong></summary>

**Context window efficiency.** If you installed all 217 skills directly, your AI agent would load all of them at startup, consuming ~50,000+ tokens of your context window before you even ask a question.

AWS Ninja is a **Jump Skill** — it loads only ~500 tokens (skill names + descriptions), then loads the full skill instructions **on-demand** when needed. This means:

- ✅ 100x less context usage at startup
- ✅ Faster responses (less to process)
- ✅ More room for your actual conversation
- ✅ Always uses the most specific skill for your task

Think of it like a library index vs. carrying all the books at once.
</details>

<details>
<summary><strong>Which AI agents are supported?</strong></summary>

36+ agents including Claude Code, Kiro CLI, Cursor, Windsurf, GitHub Copilot, Codex, Gemini CLI, Cline, and more. Run `./install-aws-ninja.sh --list` for the full list.
</details>

<details>
<summary><strong>Where do the skills come from?</strong></summary>

All skills are from official AWS repositories (`aws/` and `aws-samples/` orgs on GitHub). Written by AWS Solutions Architects, TAMs, and ProServe consultants.
</details>

<details>
<summary><strong>How often should I update?</strong></summary>

Run `./sync-repos.sh` weekly or before major projects to get the latest AWS best practices.
</details>

<details>
<summary><strong>Can I add custom skills?</strong></summary>

Yes. Add your repository URL to `repos.md` and update routing logic in `aws-ninja/SKILL.md`.
</details>

<details>
<summary><strong>Does this work offline?</strong></summary>

Yes, after initial `sync-repos.sh`. All skills are cloned locally.
</details>

---

## Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md).

- **Add skill sources:** Edit `repos.md` + update routing
- **Add agent support:** Edit `install-aws-ninja.sh`
- **Report issues:** Include your prompt and expected vs actual routing

---

## License

MIT License. See [LICENSE](LICENSE).

Skills from AWS repositories retain their original licenses (Apache 2.0 or MIT).

---

## Acknowledgments

- **AWS** — For open-sourcing comprehensive agent skills
- **[Agent Skills Specification](https://github.com/awslabs/agent-plugins)** — Standard skill format
- **[skills.sh](https://github.com/vercel-labs/skills)** — Multi-agent installer inspiration
- **[capsule-render](https://github.com/kyechan99/capsule-render)** — Animated banner
- **[readme-typing-svg](https://github.com/DenverCoder1/readme-typing-svg)** — Typing animation

---

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://capsule-render.vercel.app/api?type=waving&color=0:232F3E,50:FF9900,100:232F3E&height=100&section=footer"/>
  <source media="(prefers-color-scheme: light)" srcset="https://capsule-render.vercel.app/api?type=waving&color=0:FF9900,50:232F3E,100:FF9900&height=100&section=footer"/>
  <img alt="Footer" src="https://capsule-render.vercel.app/api?type=waving&color=0:232F3E,50:FF9900,100:232F3E&height=100&section=footer" width="100%"/>
</picture>

<p align="center">
  <sub>Built by</sub>
  <br/>
  <a href="https://ft.ia.br">
    <img src="assets/ft-ia-br.png" alt="ft.ia.br" height="40"/>
  </a>
</p>
