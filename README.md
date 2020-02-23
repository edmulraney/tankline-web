# tankline-web

Single release branch won't allow product areas to independently release their work.

develop (all working in same latest develop seems great for integration (trunk based development))
payments-1.0.1
payments-1.0.2
take release cut -> increment minor
payments-1.1.2 (safe for release to do own increments now)

release from payments-1.0.2 - here is the problem - you cant have payment- and core- create the same release branch
you need to create release-payments
bugfix... creates new tag payments-1.0.3
payments-1.0.4

promote payments-1.0.4 to production - doesn't need a branch?
no master?