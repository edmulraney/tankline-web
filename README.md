# tankline-web

Prototype micro-frontends (fully fledged webpack builds, no iframes) inside a monorepo with trunk based development.

# Misc notes
Single release branch won't allow product areas to independently release their work.

Branching/tagging
develop (all working in same latest develop seems great for integration (trunk based development))
payments-1.0.1
payments-1.0.2
take release cut -> release-payments
bugfix... creates new tag payments-1.0.3
payments-1.0.4
promote payments-1.0.4 to production - doesn't need a branch?

the `scripts` folder possibly should be the only thing that lives outside the monorepo
- rename to `ci-tools`?
- the issue of it living inside the monorepo is that is we perform changes to the ci scripts those changes won't exist for any previous tag
- the reason the script exists at all in code instead of all in the CI server is so that we have as much in source control as possible rather than needing to depend on build server so much.
- potential improvement: if it was a repo outside the monorepo then we could always pull latest into the monorepo and not worry about old tags 
