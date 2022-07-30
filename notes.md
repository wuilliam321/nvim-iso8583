# Work - DH

## VPON-251 - upload photo
 - Tracing is pending


## Requirements for redirection to onboarding plugin:

For entities with onboarding steps:
User has new vendors and
All user vendors should have state "Onboarding" in Salesforce and
None of the vendors has completed onboarding (from our onboarding plugin)


For entities without onboarding steps but user training:
User has new vendors and
All user vendors should have state "Onboarding" in Salesforce and
User didn't complete training

## Infrastructure
* srv: (outter one) instantiate everything and pass down into lib and infra
  * lib:  (business, hopefully no external dependecies, should not know anything of http, grpc, should depend on abstractions)
    * infra (touch point with the exterior, model convernions to prevent coupling/exposing details to lib)

Mocks

```
mockgen -source <file>.go -destination=<file>_mocks.go -package=<file_package>
```

```
mockgen --build_flags=--mod=mod -package=<file_package> -destination=<lower_case_interface_name>_mocks.go github.com/path/to/interface <actuatl_interface_name>
```

```
  req := &otProto.GetOpeningTimesFeaturesRequest{
    VendorID: "PY_UY;33144",
  }
  co := grpc.CallOption(grpc.WaitForReady(true))
  md := metadata.New(map[string]string{"Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjZjdEJqWUpyamtoekt1OXlIX2ZoRmszNER0TWxvcTNCd1ZEMTMxbVZUREEifQ.eyJjb3VudHJ5IjoiVVkiLCJ1c2VyIjp7ImxvY2FsZSI6ImVzIiwibmFtZSI6Ild1aWxsaWFtIiwiZW1haWwiOiJwZXlhX3BleWFfMjFAbWFpbGluYXRvci5jb20iLCJyb2xlIjoiQURNSU4ifSwidmVyc2lvbiI6IjEiLCJpbXBlcnNvbmF0b3IiOmZhbHNlLCJ2ZW5kb3JzIjp7IlBZX1VZIjpbIjMzMTQ0Il19LCJpYXQiOjE2NDg0OTE1MzQsImV4cCI6MTY0ODU3NzkzNCwiYXVkIjoiZ2xvYmFsIiwiaXNzIjoicG9ydGFsQXV0aCIsInN1YiI6ImV1LWJkZDkyMjExLWYwMDYtNGRlYi05MWFhLWNjZWJmOGUxNDkxNCJ9.ccrbZN0t53NWpjGkmwuGPX0tMDVMMnK0qoQ5IEUMhWhJd-feSuBFR4D2sEeDYP-uqq1E8NMxTyixOnDffYzQCzrwtmbednaLWTdY9nJVLSZVN9yNvQOobT9zobz6FYMPeeIAQs4c3qXTq4SJ9qN88l79Ba2XuDLo_tgrLTLuq2pYXj4ehrcM-dR0y_AAGbroVxOjJdCSpvfKXpSqPd3X3r40Ll79CI3E-opxLu-wgG2VCESBaZrD2eDiKh3_TfjxCZys2L0iHe8tf_EksoOI_Olqc14aMBTp6Y-nfVT3AUbnu5ws4FkY8ta7lwhapHMR3tdx8zpy_WIU3XIoUFgcUA"})
  ctx := metadata.NewOutgoingContext(context.Background(), md)
  res, err := otServiceClient.GetOpeningTimesFeatures(ctx, req, co)
  fmt.Print(res)
  fmt.Print(err)
```

 GetMenu proto
 GetCalendar proto add config
 make compile-proto after altering proto


prd-vendor-onboarding.cmfiqzw3durh.eu-west-1.rds.amazonaws.com

## Useful commands
```
docker-compose -f docker-compose.yaml -f docker-compose-seed.yaml down --rmi all --remove-orphans
```

























































Repeat macro
@@

Search
CTRL+g and CTRL+t

Change list
g; g,

Open url in current cursor
gx

# Personal
CV carlos
Clean up vim plugins

## Investigate
 * Cache and Sharding
 * atota full details

# Others
## Links
* https://martinfowler.com/articles/feature-toggles.html
 * Strategy Pattern, Factory Pattern, Dependency Injection Pattern
* Rocket chat https://rocket.chat/pricing/
* Academy of Mastermnd https://academy.mastermnd.io/

## Sideproject
 - Cobra: https://github.com/spf13/cobra

# Daily goals
 * [ ] 30 min - Read book (Refactoring)
 * [ ] 30 min - Read Bible
 * [ ] 60 min - ADOne
 * [ ]


# Germany
## Other
  * [ ] Alan curso
  * [ ] Certificado A1 Gilza
## TOM
  * [ ] (tom) clearly identifiable by microchip
  * [ ] (tom) properly vaccinated against rabies
  * [ ] (tom) accompanied by a veterinary inspector's certificate in which the microchip has been entered
  * [ ] (tom) vaccination certificates, and in some cases blood-test details must be carried
## Visa (PDF Uruguay)
  * [ ] llenar 2 formularios de solicitud y la declaración de conformidad
  * [ ] tomar 2 fotos actuales aptas para uso biométrico tamaño 3,5 x 4,5 cm
  * [ ] Passport > 6 months
  * [X] Cédula uruguaya; extranjeros residentes en Uruguay deberán presentar identificación de extranjeros residentes
  * [X] Certificados de formación profesional, diplomas, etc. con sus respectivas traducciones al alemán
  * [X] Contrato de trabajo en original en idioma alemán, firmado por el empleador y el empleado
  * [ ] Eventualmente permiso de trabajo otorgado por la Agencia Federal de Empleo
  * [ ] Indicación de un primer domicilio en Alemania
  * [ ] Contratación de un seguro médico conforme a las normas de la UE (30.000)
  * [ ] Traducciones (I have check the requirements of the German Embassy in Uruguay again, and indeed they do not require an apostille for most documents. The documents that should get an apostille are the ones related to the person, such as the marriage certificate (which is a required document for your wife's application) and birth certificates (a birth certificate is not mentioned on these visa check lists but may be required for your registration appointment here in Berlin)
  * [X] Marriage certificate, if the application is for a spouse
  * [X] Birth certificate, if the application is for your child
## Work Permit [Checklist](https://assignee.relotalent.com/#/app/my-guides/content/d2b42941-f25d-4637-a6ee-56f172c25231)
  * [ ] Passport > 6 months
  * [ ] Copy of Work Permit and visa document both sides
  * [X] Signed employment contract
  * [ ] Proof of current health
  * [ ] Rental contract
  * [ ] Confirmation of your registration at the townhall
  * [ ] Payslips from your first two months of work at Delivery Hero + your two most recent Payslips
  * [ ] CV/Resume
  * [X] Degree certificate
  * [X] Certificate of employment : Certificate from Delivery Hero regarding the duration of continuous employment
  * [ ] Application form "Antrag auf Erteilung eines Aufenthaltstitels"

