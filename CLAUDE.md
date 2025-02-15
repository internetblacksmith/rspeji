# rspeji

RSpec emoji formatter gem — replaces dots with expressive emoji in test output.

## Build Commands

```bash
make test        # Run tests across all RSpec versions
make lint        # Run RuboCop
gem build rspeji.gemspec  # Build gem
gem install rspeji        # Install locally
```

## Critical Rules

- Pin dependencies to exact versions
- Keep docs updated with every code change
- Keep Makefile updated — add new tasks as project evolves
- Emoji sets are defined in `lib/emoji.rb` — keep the LIST constant frozen
- CLI executable lives in `bin/rspeji` — must remain standalone (no Bundler)
