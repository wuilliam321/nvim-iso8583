
VIM - study and test those fugitive commands *fugitive_c*





Print of the school certificate //
CV carlos
review https://github.com/deliveryhero/dh-gss-adapter-api/pull/2/files




Cloudflare:
LB: aws
K8s: adapted


cloudflare - nlb - nginx - alb - servicio

Infosec
No gateway


We already finished our POC, we have an estimation of 1 month but me have some considerations:
 - We are not going to use a getaway (for now), that implies some extra security implementations from our side. We need to check with our InfoSec team.
 - Cloud need to prepare some things from their side because HTTP/2 and gRPC are not used in Peya, so they need to do some research, and next week we'll receive feedback. This could be a blocker.

Out of scope:
Bussy button
Gateway

































# TODO
[ ] - Eliminar la elastic ip address para que no me cobre mas

## SSU service
[ ] Merge AWS  branch

## Shopper Balance Service
Vendor With Pelican https://stg-backoffice-app.pedidosya.com/#/partners/106908
[ ] Wiremock!!! important!
[ ] PR cancelled orders
[ ] Restart on change (funciona?)
[ ] Jarvis delete queue (and topic?)
[ ] Open ticket to delete queue and topic
[ ] Test the cancelled order event
[ ] Failed order, test the retry (how it really works?)
* [ ] Test 2 shoppers, 1 unnassigned other accept the same order, it should work
[x] Hurrier access (https://pedidosya.freshdesk.com/support/tickets/3438)
[x] Pelican access (mail sent)

## Checklists
[ ] PR Checklist [backend]
[ ] Code review Checklist [backend]
[ ] Apdex? https://newrelic.com/blog/best-practices/how-to-choose-apdex-t


# Notes
## vim motions
* `e` includes en line, (ie `de` deletes the word plus end of line)

## Investigate
 * Cache and Sharding
 * atota full details


# Others
## Links
* https://martinfowler.com/articles/feature-toggles.html
 * Strategy Pattern, Factory Pattern, Dependency Injection Pattern
* Rocket chat https://rocket.chat/pricing/
* Academy of Mastermnd https://academy.mastermnd.io/

## TDD
Think Driven Development
* Put the end goal at first (in business language) then cut it to the minimum testable unit
* Do not refactor without test
* Go small
* Write failing test before fixing a bug (0 bug policy) no matter how small and easy it is

# Glosary
CVR = Conversion Rate - Objective - What we want to accomplish
mCVR = Micro-conversion
## Peya - 4 big steps
mCVR1. Home - Shoplist (Growht)
mCVR2. List - ShopDetail (Groceries/Food/Courier)
mCVR3. ShopDetail - Checkout (Groceries/Food/Courier)
mCVR4. Checkout - Payment (Fintech-Payment)

Funnels












# Preguntas de la migracion de usuarios

Usuarios nuevos primero? Flujo de sales force? para no generar legacy users luego de la migracion final?
La lambda ya tendra algunos de los cambios?
Para backoffice por que restringir el ABM? operaciones tendra acceso al radmin?
Nueva jerarquía de usuarios, esto esta pronto para salir o en stg??
























Evaluacion:
Empujar para prod.
