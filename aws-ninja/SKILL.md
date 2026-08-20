---
name: aws-ninja
description: >-
  Master orchestrator for 100+ AWS agent skills from official AWS repositories.
  Use when working with ANY AWS service, architecture, operations, security,
  cost optimization, migration, or development task. Routes to the optimal
  specialized skill based on context. Triggers: AWS, Amazon, EKS, ECS, Lambda,
  S3, DynamoDB, RDS, Aurora, Bedrock, CDK, CloudFormation, VPC, IAM, security,
  cost, migration, serverless, containers, databases, networking, observability,
  Well-Architected, DevOps, CI/CD, or any AWS service name.
---

# AWS Ninja

**Jump Skill** — Master orchestrator that routes AWS tasks to 100+ specialized skills from official AWS repositories.

## Purpose

This skill acts as an intelligent router to the comprehensive AWS skills library. Instead of manually searching for the right skill, describe your AWS task and this skill will:

1. Identify the most relevant specialized skill(s)
2. Load the full skill instructions on demand
3. Execute the task with expert-level AWS knowledge

## Skill Library Location

**Important:** The skill library location depends on where you cloned the `aws-ninja` repository.

To find the location, run:
```bash
# Find where aws-ninja was cloned
dirname "$(dirname "$(readlink -f ~/.kiro/skills/aws-ninja/SKILL.md 2>/dev/null || echo ~/.kiro/skills/aws-ninja/SKILL.md)")"
```

Or check the common locations:
- If cloned to `~/aws-ninja/` → skills are in `~/aws-ninja/`
- If cloned to `~/GIT/aws-ninja/` → skills are in `~/GIT/aws-ninja/`
- If cloned to `~/projects/aws-ninja/` → skills are in `~/projects/aws-ninja/`

The structure will be:
```
<aws-ninja-dir>/
├── aws-ninja/                      # This skill
├── agent-toolkit-for-aws/          # Official AWS-supported skills & plugins
├── tools-for-devops-agent/         # DevOps Agent operational skills
├── sample-apex-skills/             # Platform engineering (EKS/ECS focus)
├── sample-agent-skills-for-builders/  # CDK, security, testing workflows
├── sample-well-architected-skills-and-steering/  # Well-Architected Framework
├── sample-corgiro-aws-ops-skills/  # Multi-account cloud operations
├── sample-strands-agents-agentskills/  # Strands Agents SDK skills
├── sample-agentcore-websearch-agent-skill/  # AgentCore web search
├── sample-eks-to-agentcore-mcpserver-skills/  # EKS to AgentCore migration
└── sample-devops-agent-custom-mcp-skills/  # Custom DevOps Agent skills
```

## How to Use

1. **Describe your AWS task** — be specific about services, goals, and constraints
2. **I will route to the best skill** — based on the catalog below
3. **Load and execute** — read the full SKILL.md and apply its procedures

## Skill Catalog

### Core Infrastructure Skills (agent-toolkit-for-aws)

#### Compute
| Skill | Path | Use When |
|-------|------|----------|
| `aws-compute` | `plugins/aws-core/skills/aws-compute/` | EC2 instances, Auto Scaling, launch templates, Graviton, IMDSv2 |
| `aws-containers` | `plugins/aws-core/skills/aws-containers/` | ECS, Fargate, ECR, task definitions, service scaling |
| `aws-serverless` | `plugins/aws-core/skills/aws-serverless/` | Lambda, API Gateway, Step Functions, EventBridge, SAM |
| `aws-lambda-microvms` | `skills/specialized-skills/serverless-skills/aws-lambda-microvms/` | Firecracker MicroVMs, tenant isolation, sandboxed compute |
| `aws-lambda-durable-functions` | `skills/specialized-skills/serverless-skills/aws-lambda-durable-functions/` | Long-running Lambda, state persistence, saga patterns |
| `aws-lambda-managed-instances` | `skills/specialized-skills/serverless-skills/aws-lambda-managed-instances/` | Lambda on EC2, cold start elimination |
| `aws-step-functions` | `skills/specialized-skills/serverless-skills/aws-step-functions/` | State machines, ASL, JSONata, workflow orchestration |

#### Databases
| Skill | Path | Use When |
|-------|------|----------|
| `aws-database` | `plugins/aws-core/skills/aws-database/` | Database selection, comparison, routing to specific DB skills |
| `amazon-dynamodb` | `skills/specialized-skills/database-skills/amazon-dynamodb/` | DynamoDB design, access patterns, GSIs, single-table |
| `amazon-aurora-mysql` | `skills/specialized-skills/database-skills/amazon-aurora-mysql/` | Aurora MySQL setup, optimization, troubleshooting |
| `amazon-aurora-postgresql` | `skills/specialized-skills/database-skills/amazon-aurora-postgresql/` | Aurora PostgreSQL setup, optimization |
| `aurora-dsql` | `skills/specialized-skills/database-skills/aurora-dsql/` | Aurora DSQL serverless distributed SQL |
| `amazon-documentdb` | `skills/specialized-skills/database-skills/amazon-documentdb/` | DocumentDB/MongoDB on AWS, migrations |
| `amazon-elasticache` | `skills/specialized-skills/database-skills/amazon-elasticache/` | Redis, Valkey, Memcached, caching strategies |
| `amazon-keyspaces` | `skills/specialized-skills/database-skills/amazon-keyspaces/` | Cassandra-compatible database |
| `amazon-memorydb` | `skills/specialized-skills/database-skills/amazon-memorydb/` | MemoryDB for Redis |
| `amazon-neptune` | `skills/specialized-skills/database-skills/amazon-neptune/` | Graph database, Gremlin, openCypher |
| `amazon-rds` | `skills/specialized-skills/database-skills/amazon-rds/` | RDS MySQL, PostgreSQL, SQL Server, Oracle |
| `amazon-timestream` | `skills/specialized-skills/database-skills/amazon-timestream/` | Time-series database |

#### Networking
| Skill | Path | Use When |
|-------|------|----------|
| `aws-networking` | `skills/core-skills/aws-networking/` | Networking router — Route 53, CloudFront, VPC, ALB/NLB |
| `creating-production-vpc-multi-az` | `skills/specialized-skills/networking-and-content-delivery-skills/` | Production VPC setup, multi-AZ |
| `configuring-vpc-endpoints-for-private-aws-service-access` | `skills/specialized-skills/networking-and-content-delivery-skills/` | PrivateLink, VPC endpoints |
| `connecting-vpcs-with-peering` | `skills/specialized-skills/networking-and-content-delivery-skills/` | VPC peering |
| `cloudfront` | `skills/specialized-skills/networking-and-content-delivery-skills/cloudfront/` | CDN, edge, caching, OAC |
| `route53` | `skills/specialized-skills/networking-and-content-delivery-skills/route53/` | DNS, health checks, routing policies |
| `elastic-load-balancing` | `skills/specialized-skills/networking-and-content-delivery-skills/elastic-load-balancing/` | ALB, NLB, GWLB |
| `waf` | `skills/specialized-skills/networking-and-content-delivery-skills/waf/` | AWS WAF, bot control, rate limiting |
| `directconnect` | `skills/specialized-skills/networking-and-content-delivery-skills/directconnect/` | Direct Connect, hybrid connectivity |

#### Security & Identity
| Skill | Path | Use When |
|-------|------|----------|
| `aws-iam` | `plugins/aws-core/skills/aws-iam/` | IAM policies, roles, permissions |
| `aws-security` | `skills/core-skills/aws-security/` | Security Hub, GuardDuty, Inspector, Macie |
| `signing-in-to-aws` | `plugins/aws-core/skills/signing-in-to-aws/` | AWS authentication, SSO, credentials |
| `creating-secrets-using-best-practices` | `skills/specialized-skills/security-and-identity-skills/` | Secrets Manager, KMS, rotation |
| `setting-up-ec2-instance-profiles` | `skills/specialized-skills/security-and-identity-skills/` | Instance profiles, IAM roles for EC2 |

#### IaC & Deployment
| Skill | Path | Use When |
|-------|------|----------|
| `aws-cdk` | `plugins/aws-core/skills/aws-cdk/` | CDK TypeScript/Python, constructs, stacks |
| `aws-cloudformation` | `plugins/aws-core/skills/aws-cloudformation/` | CloudFormation templates, validation |
| `aws-deployment` | `plugins/aws-core/skills/aws-deployment/` | CodePipeline, CodeBuild, CodeDeploy, CI/CD |
| `terraform-skill` | `sample-apex-skills/skills/terraform-skill/` | Terraform modules, HCL |

#### AI & Machine Learning
| Skill | Path | Use When |
|-------|------|----------|
| `amazon-bedrock` | `plugins/aws-core/skills/amazon-bedrock/` | Bedrock, GenAI, RAG, Agents, AgentCore |
| `aws-ai-ml` | `plugins/aws-core/skills/aws-ai-ml/` | SageMaker, ML workflows |
| `amazon-q-developer` | `skills/specialized-skills/developer-tools-skills/amazon-q-developer/` | Amazon Q Developer |

#### Observability & Operations
| Skill | Path | Use When |
|-------|------|----------|
| `aws-observability` | `plugins/aws-core/skills/aws-observability/` | CloudWatch, X-Ray, logs, metrics, alarms |
| `aws-billing-and-cost-management` | `plugins/aws-core/skills/aws-billing-and-cost-management/` | Cost analysis, budgets, Savings Plans |

#### Messaging & Streaming
| Skill | Path | Use When |
|-------|------|----------|
| `aws-messaging-and-streaming` | `plugins/aws-core/skills/aws-messaging-and-streaming/` | SQS, SNS, Kinesis, EventBridge |
| `amazon-ses` | `skills/specialized-skills/messaging-and-streaming-skills/amazon-ses/` | Email sending, DKIM, deliverability |
| `aws-social-messaging` | `skills/specialized-skills/messaging-and-streaming-skills/aws-social-messaging/` | WhatsApp via AWS |

#### Data Analytics
| Skill | Path | Use When |
|-------|------|----------|
| `amazon-opensearch-service` | `plugins/aws-data-analytics/skills/amazon-opensearch-service/` | OpenSearch, Elasticsearch, vector search |
| `querying-data-lake` | `plugins/aws-data-analytics/skills/querying-data-lake/` | Athena, data lake queries |
| `finding-data-lake-assets` | `plugins/aws-data-analytics/skills/finding-data-lake-assets/` | Glue Catalog, S3 Tables, asset discovery |
| `creating-data-lake-table` | `plugins/aws-data-analytics/skills/creating-data-lake-table/` | Glue tables, Iceberg, data lake setup |
| `storing-and-querying-vectors` | `plugins/aws-data-analytics/skills/storing-and-querying-vectors/` | Vector databases, embeddings |

---

### Kubernetes & Container Platform (sample-apex-skills)

| Skill | Path | Use When |
|-------|------|----------|
| `eks-design` | `skills/eks-design/` | EKS architecture design, ADRs, diagrams |
| `eks-build` | `skills/eks-build/` | EKS Terraform/Helm implementation |
| `eks-recon` | `skills/eks-recon/` | EKS cluster discovery, assessment |
| `eks-upgrade-check` | `skills/eks-upgrade-check/` | EKS upgrade readiness assessment |
| `eks-operation-review` | `skills/eks-operation-review/` | EKS operational review, best practices |
| `eks-security` | `skills/eks-security/` | EKS security hardening, CIS benchmarks |
| `eks-best-practices` | `skills/eks-best-practices/` | EKS reference material, guidance |
| `eks-genai` | `skills/eks-genai/` | GPU/Neuron workloads, ML on EKS |
| `eks-cost-intelligence` | `skills/eks-cost-intelligence/` | EKS cost optimization |
| `eks-platform-engineering` | `skills/eks-platform-engineering/` | IDP, Backstage, golden paths |
| `eks-ingress-migration` | `skills/eks-ingress-migration/` | Ingress controller migrations |
| `ecs-architect` | `skills/ecs-architect/` | ECS architecture design |
| `ecs-build` | `skills/ecs-build/` | ECS implementation |
| `ecs-recon` | `skills/ecs-recon/` | ECS discovery |
| `ecs-security` | `skills/ecs-security/` | ECS security |
| `ecs-devops` | `skills/ecs-devops/` | ECS CI/CD, deployments |
| `ecs-observability` | `skills/ecs-observability/` | ECS monitoring |
| `ecs-genai` | `skills/ecs-genai/` | ML workloads on ECS |
| `graviton-migration` | `skills/graviton-migration/` | Arm64/Graviton migration |

---

### Well-Architected Framework (sample-well-architected-skills-and-steering)

| Skill | Path | Use When |
|-------|------|----------|
| `aws-well-architected-framework-review` | `skills/aws-well-architected-framework-review/` | Full WA review, 6 pillars, 57 questions |
| `wa-builder` | `skills/wa-builder/` | Learn WA, create diagrams, decision trees |
| `wa-guardrails` | `skills/wa-guardrails/` | Preventive controls, Config rules, SCPs |
| `wafr-facilitator` | `skills/wafr-facilitator/` | Facilitate customer WA reviews |
| `migration-readiness` | `skills/migration-readiness/` | 7 Rs assessment, migration planning |

---

### DevOps & Operations (tools-for-devops-agent)

| Skill | Path | Use When |
|-------|------|----------|
| `aws-health-events` | `skills/aws-health-events/` | AWS Health events in incident investigation |
| `support-cases` | `skills/support-cases/` | AWS Support case analysis |
| `service-quota-check` | `skills/service-quota-check/` | Quota limits, capacity planning |
| `eks-operation-review` | `skills/eks-operation-review/` | EKS operational review |
| `rds-operation-review` | `skills/rds-operation-review/` | RDS/Aurora operational review |
| `msk-operations` | `skills/msk-operations/` | MSK Kafka operations |
| `database-rds-devops` | `skills/database-rds-devops/` | Aurora MySQL/PostgreSQL diagnostics |
| `database-migration-service-expertise` | `skills/database-migration-service-expertise/` | DMS troubleshooting |
| `aws-vpc-dns-investigation` | `skills/aws-vpc-dns-investigation/` | VPC DNS resolution issues |
| `investigation-cost-guardrail` | `skills/investigation-cost-guardrail/` | Cost guardrails for investigations |
| `enrich-with-aws-security-agent` | `skills/enrich-with-aws-security-agent/` | Security context for incidents |
| `wiz-security-context` | `skills/wiz-security-context/` | Wiz security integration |

---

### CDK & Builder Skills (sample-agent-skills-for-builders)

| Skill | Path | Use When |
|-------|------|----------|
| `aws-cdk-development` | `skills/aws-cdk-development/` | CDK expert patterns |
| `aws-mcp-setup` | `skills/aws-mcp-setup/` | AWS MCP server configuration |
| `security-scan` | `skills/security-scan/` | SAST, IaC scanning, ASH |
| `cost-estimator` | `skills/cost-estimator/` | CDK infrastructure cost estimation |
| `create-install-scripts` | `skills/create-install-scripts/` | Install scripts, CI pipelines |
| `aws-cost-operations` | `skills/aws-cost-operations/` | Cost analysis, CloudWatch alarms |
| `aws-agentic-ai` | `skills/aws-agentic-ai/` | Bedrock AgentCore deployment |
| `agentcore-mcp-oauth-facade` | `skills/agentcore-mcp-oauth-facade/` | OAuth + MCP facade for AgentCore |
| `agentcore-browser-web-scraping` | `skills/agentcore-browser-web-scraping/` | Web scraping on AgentCore |
| `end-to-end-testing` | `skills/end-to-end-testing/` | E2E testing with evidence capture |
| `gitlab-docs-publishing` | `skills/gitlab-docs-publishing/` | GitLab Pages documentation |
| `quip-to-gitlab-wiki` | `skills/quip-to-gitlab-wiki/` | Quip to GitLab migration |
| `strands-context-manager` | `skills/strands-context-manager/` | Strands Agents context management |

---

### Multi-Account Operations (sample-corgiro-aws-ops-skills)

| Skill | Path | Use When |
|-------|------|----------|
| `corgiro` | `skills/corgiro/` | AWS Organization sweep, multi-account reports |

---

### DevOps Agent Custom Skills (sample-devops-agent-custom-mcp-skills)

| Skill | Path | Use When |
|-------|------|----------|
| `deployment-correlation-triage` | `skills/deployment-correlation-triage/` | Correlate deployments with incidents |
| `postgres-performance-investigation` | `skills/postgres-performance-investigation/` | PostgreSQL performance issues |

---

### Security Agent Skills (agent-toolkit-for-aws/plugins/aws-agents-for-devsecops)

| Skill | Path | Use When |
|-------|------|----------|
| `setup-security-agent` | `skills/setup-security-agent/` | Configure AWS Security Agent |
| `setup-devops-agent` | `skills/setup-devops-agent/` | Configure AWS DevOps Agent |
| `scanning-with-aws-security-agent` | `skills/scanning-with-aws-security-agent/` | Full security scan |
| `diff-scanning-with-aws-security-agent` | `skills/diff-scanning-with-aws-security-agent/` | Scan only changed code |
| `threat-modeling-with-aws-security-agent` | `skills/threat-modeling-with-aws-security-agent/` | STRIDE threat modeling |
| `pentesting-with-aws-security-agent` | `skills/pentesting-with-aws-security-agent/` | Penetration testing |
| `remediating-with-aws-security-agent` | `skills/remediating-with-aws-security-agent/` | Fix security findings |
| `investigating-incidents-with-aws-devops-agent` | `skills/investigating-incidents-with-aws-devops-agent/` | Incident investigation |
| `analyzing-release-readiness` | `skills/analyzing-release-readiness/` | Release readiness assessment |
| `running-release-tests` | `skills/running-release-tests/` | Pre-release testing |

---

## Routing Logic

When a task arrives, I follow this decision tree:

```
1. Is it about EKS/Kubernetes?
   → sample-apex-skills/skills/eks-*

2. Is it about ECS/Fargate containers?
   → sample-apex-skills/skills/ecs-* OR agent-toolkit-for-aws/.../aws-containers

3. Is it about Well-Architected review or compliance?
   → sample-well-architected-skills-and-steering/skills/*

4. Is it about a specific AWS database?
   → agent-toolkit-for-aws/skills/specialized-skills/database-skills/<db-name>

5. Is it about security scanning or threat modeling?
   → agent-toolkit-for-aws/plugins/aws-agents-for-devsecops/skills/*

6. Is it about incident investigation or operations?
   → tools-for-devops-agent/skills/*

7. Is it about CDK/IaC development?
   → sample-agent-skills-for-builders/skills/aws-cdk-development
   → agent-toolkit-for-aws/.../aws-cdk

8. Is it about a core AWS service?
   → agent-toolkit-for-aws/plugins/aws-core/skills/*

9. Is it about serverless (Lambda, Step Functions)?
   → agent-toolkit-for-aws/skills/specialized-skills/serverless-skills/*

10. Is it about networking (VPC, Route 53, CloudFront)?
    → agent-toolkit-for-aws/skills/specialized-skills/networking-and-content-delivery-skills/*

11. Is it about cost optimization?
    → agent-toolkit-for-aws/.../aws-billing-and-cost-management
    → sample-agent-skills-for-builders/skills/cost-estimator

12. Is it about multi-account operations?
    → sample-corgiro-aws-ops-skills/skills/corgiro
```

## Execution Pattern

When routing to a skill:

1. **Announce the skill** — Tell the user which skill I'm activating
2. **Load the SKILL.md** — Read the full instructions from the skill path
3. **Follow the skill's procedures** — Execute according to its "How to Use" section
4. **Load references on demand** — Pull from `references/` directory as needed

## Example Interactions

**User:** "Design an EKS cluster for a fintech workload"
**Route:** → `sample-apex-skills/skills/eks-design/SKILL.md`

**User:** "Why is my Lambda timing out?"
**Route:** → `agent-toolkit-for-aws/skills/specialized-skills/serverless-skills/debugging-lambda-timeouts/SKILL.md`

**User:** "Run a Well-Architected review on this repo"
**Route:** → `sample-well-architected-skills-and-steering/skills/aws-well-architected-framework-review/SKILL.md`

**User:** "Help me set up DynamoDB for a multi-tenant SaaS"
**Route:** → `agent-toolkit-for-aws/skills/specialized-skills/database-skills/amazon-dynamodb/SKILL.md`

**User:** "Investigate this EKS incident"
**Route:** → `tools-for-devops-agent/skills/eks-operation-review/SKILL.md`

**User:** "Scan this code for security issues"
**Route:** → `agent-toolkit-for-aws/plugins/aws-agents-for-devsecops/skills/scanning-with-aws-security-agent/SKILL.md`

---

## Updating the Skill Library

To update the skills to the latest versions, run from the aws-ninja directory:

```bash
# Navigate to where you cloned aws-ninja
cd /path/to/aws-ninja

# Update all repositories
./sync-repos.sh
```

Or manually update each repo:

```bash
cd /path/to/aws-ninja
for repo in agent-toolkit-for-aws tools-for-devops-agent sample-*; do
  [[ -d "$repo/.git" ]] && (cd "$repo" && git pull)
done
```

---

## Statistics

- **Total Skills:** 100+
- **Repositories:** 10
- **Categories:** Compute, Databases, Networking, Security, IaC, AI/ML, Observability, Analytics, DevOps, Well-Architected
- **Sources:** Official AWS (aws/), AWS Samples (aws-samples/)
