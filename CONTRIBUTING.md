# Contributing to AWS Ninja

Thank you for your interest in contributing to AWS Ninja!

## How to Contribute

### Reporting Issues

- **Routing issues:** Include your prompt and expected vs actual skill
- **Installation issues:** Include your OS, shell, and AI agent
- **Missing skills:** Check if an official AWS skill exists first

### Adding New Skill Sources

1. Fork this repository
2. Add the repository URL to `repos.md` inside the ` ```repos` block
3. Run `./sync-repos.sh` to verify it clones correctly
4. Update routing logic in `aws-ninja/SKILL.md` if needed
5. Submit a Pull Request

### Improving Routing Logic

The routing decision tree lives in `aws-ninja/SKILL.md`. When improving:

- Test with multiple prompt variations
- Ensure no regressions for existing routes
- Document the routing pattern in your PR

### Adding Agent Support

Agent configurations live in `install-aws-ninja.sh`. To add a new agent:

1. Find the agent's global and project skill paths
2. Add entry to the `AGENTS` array: `"agent-id|~/.path/skills|.local/skills"`
3. Test installation with `./install-aws-ninja.sh agent-id`

## Code of Conduct

Be respectful and constructive. We're all here to make AI agents better at AWS.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
