# AWS Skills Full Catalog

Complete catalog of 217 skills from official AWS repositories.

## How to Load a Skill

```bash
# Find where aws-ninja is installed (check for symlink)
AWS_NINJA_DIR="$(dirname "$(readlink -f ~/.kiro/skills/aws-ninja/SKILL.md 2>/dev/null || echo ~/.kiro/skills/aws-ninja/SKILL.md)")"
SKILLS_BASE="$(dirname "$AWS_NINJA_DIR")"

# Read the skill file
cat "$SKILLS_BASE/<repo>/skills/<skill-name>/SKILL.md"

# List skill references
ls "$SKILLS_BASE/<repo>/skills/<skill-name>/references/"
```

Or if you know where you cloned aws-ninja:
```bash
cat /path/to/aws-ninja/<repo>/skills/<skill-name>/SKILL.md
```

---

## agent-toolkit-for-aws (Official AWS Toolkit)

### Core Skills (plugins/aws-core/skills/)

| Skill | Description |
|-------|-------------|
| `amazon-bedrock` | GenAI apps on Bedrock - Converse API, RAG, Agents, Guardrails, AgentCore |
| `aws-ai-ml` | SageMaker, ML workflows |
| `aws-billing-and-cost-management` | Cost analysis, budgets, Savings Plans, Reserved Instances |
| `aws-blocks` | Infrastructure-from-Code framework - APIs, Building Blocks |
| `aws-cdk` | CDK TypeScript/Python, constructs, stacks, deployment |
| `aws-cloudformation` | CloudFormation templates, cfn-lint, cfn-guard, change sets |
| `aws-compute` | EC2, Auto Scaling, launch templates, Graviton, IMDSv2 |
| `aws-containers` | ECS, Fargate, ECR, task definitions, service scaling |
| `aws-database` | Database router - selects correct DB-specific skill |
| `aws-deployment` | CodePipeline, CodeBuild, CodeDeploy, CI/CD pipelines |
| `aws-iam` | IAM policies, roles, permissions, least privilege |
| `aws-messaging-and-streaming` | SQS, SNS, Kinesis, EventBridge |
| `aws-observability` | CloudWatch, X-Ray, logs, metrics, alarms, dashboards |
| `aws-sdk-js-v3-usage` | AWS SDK for JavaScript v3 patterns |
| `aws-sdk-python-usage` | Boto3 patterns and best practices |
| `aws-sdk-swift-usage` | AWS SDK for Swift |
| `aws-secrets-manager` | Secrets Manager integration |
| `aws-serverless` | Lambda, API Gateway, Step Functions, EventBridge, SAM |
| `signing-in-to-aws` | AWS authentication, SSO, credentials |

### Data Analytics Skills (plugins/aws-data-analytics/skills/)

| Skill | Description |
|-------|-------------|
| `amazon-opensearch-service` | OpenSearch, Elasticsearch, vector search, log analytics |
| `connecting-to-data-source` | Data source connections |
| `creating-data-lake-table` | Glue tables, Iceberg, data lake setup |
| `exploring-data-catalog` | Glue Catalog exploration |
| `finding-data-lake-assets` | Asset discovery across Glue, S3 Tables, Redshift |
| `ingesting-into-data-lake` | Data ingestion pipelines |
| `querying-data-lake` | Athena SQL queries, federated catalogs |
| `storing-and-querying-vectors` | Vector databases, embeddings |

### DevSecOps Agent Skills (plugins/aws-agents-for-devsecops/skills/)

| Skill | Description |
|-------|-------------|
| `analyzing-release-readiness` | Release readiness assessment |
| `chatting-with-aws-devops-agent` | DevOps Agent interaction |
| `coordinating-multi-space-devops-agent` | Multi-AgentSpace coordination |
| `diff-scanning-with-aws-security-agent` | Scan only changed code |
| `investigating-incidents-with-aws-devops-agent` | Incident investigation |
| `pentesting-with-aws-security-agent` | Penetration testing |
| `remediating-with-aws-security-agent` | Fix security findings |
| `running-release-tests` | Pre-release testing |
| `scanning-with-aws-security-agent` | Full security scan |
| `setup` | Combined setup |
| `setup-devops-agent` | Configure DevOps Agent |
| `setup-security-agent` | Configure Security Agent |
| `threat-modeling-with-aws-security-agent` | STRIDE threat modeling |

### Agents Skills (plugins/aws-agents/skills/)

| Skill | Description |
|-------|-------------|
| `agents-build` | Build agents on AgentCore |
| `agents-connect` | Connect agents to services |
| `agents-debug` | Debug agent issues |
| `agents-deploy` | Deploy agents to AgentCore |
| `agents-get-started` | Getting started with agents |
| `agents-harden` | Security hardening for agents |
| `agents-optimize` | Agent performance optimization |
| `agents-pay` | AgentCore Payments, x402, microtransactions |

### Specialized Database Skills (skills/specialized-skills/database-skills/)

| Skill | Description |
|-------|-------------|
| `amazon-aurora-mysql` | Aurora MySQL setup, optimization |
| `amazon-aurora-postgresql` | Aurora PostgreSQL setup, optimization |
| `amazon-documentdb` | DocumentDB/MongoDB, migrations, vector search |
| `amazon-dynamodb` | DynamoDB design axioms, access patterns, GSIs |
| `amazon-elasticache` | Redis, Valkey, Memcached, caching strategies |
| `amazon-keyspaces` | Cassandra-compatible database |
| `amazon-memorydb` | MemoryDB for Redis |
| `amazon-neptune` | Graph database, Gremlin, openCypher |
| `amazon-rds` | RDS MySQL, PostgreSQL, SQL Server, Oracle |
| `amazon-timestream` | Time-series database |
| `aurora-dsql` | Aurora DSQL serverless distributed SQL |
| `creating-amazon-aurora-db-cluster-with-instances` | Aurora cluster provisioning |

### Specialized Serverless Skills (skills/specialized-skills/serverless-skills/)

| Skill | Description |
|-------|-------------|
| `aws-lambda-durable-functions` | Long-running Lambda, state persistence |
| `aws-lambda-managed-instances` | Lambda on EC2 instances |
| `aws-lambda-microvms` | Firecracker MicroVMs, sandboxed compute |
| `aws-step-functions` | State machines, ASL, JSONata |
| `connecting-lambda-to-api-gateway` | Lambda + API Gateway integration |
| `connecting-lambda-to-dynamodb` | Lambda + DynamoDB integration |
| `creating-api-gateway-stage` | API Gateway stage setup |
| `debugging-lambda-timeouts` | Lambda timeout troubleshooting |
| `deploying-custom-domain-rest-api` | Custom domain for APIs |

### Specialized Networking Skills (skills/specialized-skills/networking-and-content-delivery-skills/)

| Skill | Description |
|-------|-------------|
| `cloudfront` | CDN, edge, caching, OAC, mTLS |
| `configuring-vpc-endpoints-for-private-aws-service-access` | PrivateLink, VPC endpoints |
| `connecting-vpcs-with-peering` | VPC peering |
| `creating-production-vpc-multi-az` | Production VPC setup |
| `directconnect` | Direct Connect, hybrid connectivity |
| `elastic-load-balancing` | ALB, NLB, GWLB |
| `enabling-lambda-vpc-internet-access` | Lambda VPC internet |
| `global-accelerator` | Global Accelerator |
| `route53` | DNS, health checks, routing policies |
| `route53-cloudfront` | Route 53 + CloudFront integration |
| `site-to-site-vpn` | VPN connections |
| `transit-gateway` | Transit Gateway |
| `waf` | AWS WAF, bot control, rate limiting |

### Specialized Security Skills (skills/specialized-skills/security-and-identity-skills/)

| Skill | Description |
|-------|-------------|
| `creating-secrets-using-best-practices` | Secrets Manager, KMS, rotation |
| `iam-identity-center-permission-sets` | IAM Identity Center |
| `querying-aws-cloudtrail` | CloudTrail analysis |
| `querying-aws-cloudwatch` | CloudWatch Logs SQL queries |
| `querying-aws-s3` | S3 metadata queries |
| `securing-s3-buckets` | S3 security hardening |
| `setting-up-cloudtrail-multi-region` | Multi-region CloudTrail |
| `setting-up-cloudwatch-alarm-notifications` | Alarm notifications |
| `setting-up-ec2-instance-profiles` | Instance profiles |

---

## sample-apex-skills (Platform Engineering)

### EKS Skills

| Skill | Description |
|-------|-------------|
| `eks-best-practices` | EKS reference material, guidance |
| `eks-build` | EKS Terraform/Helm implementation |
| `eks-cost-intelligence` | EKS cost optimization |
| `eks-design` | EKS architecture design, ADRs |
| `eks-genai` | GPU/Neuron workloads, ML on EKS |
| `eks-ingress-migration` | Ingress controller migrations |
| `eks-mcp-server` | EKS MCP server |
| `eks-operation-review` | EKS operational review |
| `eks-platform-engineering` | IDP, Backstage, golden paths |
| `eks-recon` | EKS cluster discovery |
| `eks-security` | EKS security, CIS benchmarks |
| `eks-upgrade-check` | EKS upgrade readiness |

### ECS Skills

| Skill | Description |
|-------|-------------|
| `ecs-architect` | ECS architecture design |
| `ecs-build` | ECS implementation |
| `ecs-devops` | ECS CI/CD |
| `ecs-genai` | ML on ECS |
| `ecs-observability` | ECS monitoring |
| `ecs-operation-review` | ECS operational review |
| `ecs-recon` | ECS discovery |
| `ecs-security` | ECS security |

### Other Skills

| Skill | Description |
|-------|-------------|
| `graviton-migration` | Arm64/Graviton migration |
| `skill-creator` | Create new skills |
| `steering-workflow-creator` | Create steering workflows |
| `terraform-skill` | Terraform modules |
| `update-docs` | Documentation updates |

---

## sample-well-architected-skills-and-steering

| Skill | Description |
|-------|-------------|
| `aws-well-architected-framework-review` | Full WA review, 6 pillars, 57 questions |
| `migration-readiness` | 7 Rs assessment, migration planning |
| `wa-builder` | Learn WA, diagrams, decision trees |
| `wa-guardrails` | Config rules, SCPs, policy checks |
| `wafr-facilitator` | Facilitate customer WA reviews |

---

## tools-for-devops-agent (Operations)

| Skill | Description |
|-------|-------------|
| `aws-health-events` | AWS Health events in incidents |
| `aws-vpc-dns-investigation` | VPC DNS resolution issues |
| `crm-production-investigation-guidelines` | CRM incident guidelines |
| `database-migration-service-expertise` | DMS troubleshooting |
| `database-rds-devops` | Aurora diagnostics |
| `eks-operation-review` | EKS operational review |
| `enrich-with-aws-security-agent` | Security context for incidents |
| `investigation-cost-guardrail` | Cost guardrails |
| `msk-operations` | MSK Kafka operations |
| `rds-operation-review` | RDS/Aurora operational review |
| `service-quota-check` | Quota limits, capacity |
| `skip-scheduled-maintenance` | Skip maintenance incidents |
| `storage-s3-resiliency-expertise` | S3 resiliency |
| `support-cases` | AWS Support analysis |
| `wiz-security-context` | Wiz security integration |

---

## sample-agent-skills-for-builders (CDK/Builder)

| Skill | Description |
|-------|-------------|
| `agentcore-browser-web-scraping` | Web scraping on AgentCore |
| `agentcore-mcp-oauth-facade` | OAuth + MCP facade |
| `aws-agentic-ai` | Bedrock AgentCore deployment |
| `aws-cdk-development` | CDK expert patterns |
| `aws-cost-operations` | Cost analysis, alarms |
| `aws-mcp-setup` | AWS MCP server setup |
| `cost-estimator` | CDK cost estimation |
| `create-install-scripts` | Install scripts, CI |
| `end-to-end-testing` | E2E testing |
| `gitlab-docs-publishing` | GitLab Pages docs |
| `quip-to-gitlab-wiki` | Quip migration |
| `security-scan` | SAST, IaC scanning |
| `strands-context-manager` | Strands Agents context |

---

## sample-corgiro-aws-ops-skills

| Skill | Description |
|-------|-------------|
| `corgiro` | AWS Organization sweep, multi-account reports |

---

## sample-strands-agents-agentskills

| Skill | Description |
|-------|-------------|
| `file-processing` | File processing for agents |
| `pptx` | PowerPoint generation |
| `skill-creator` | Create new skills |

---

## sample-devops-agent-custom-mcp-skills

| Skill | Description |
|-------|-------------|
| `deployment-correlation-triage` | Correlate deployments with incidents |
| `postgres-performance-investigation` | PostgreSQL performance |

---

## sample-agentcore-websearch-agent-skill

| Skill | Description |
|-------|-------------|
| `agentcore-websearch` | AgentCore web search setup |

---

## sample-eks-to-agentcore-mcpserver-skills

| Skill | Description |
|-------|-------------|
| `skills` | EKS to AgentCore migration |
