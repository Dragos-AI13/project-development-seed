# CI Standard (Framework-Agnostic)

Seed-ul include un workflow de calitate (`.github/workflows/ci.yml`) care, în mod implicit, rulează lint/test pentru proiecte Node/Python (dacă detectează fișiere specifice).

Pentru orice alt stack, proiectul poate seta comenzi custom prin variabile de repo.

## Optional Variables (repo-level)
- `CI_SETUP_COMMAND`
  - comandă care rulează înainte de lint/test (ex: install dependencies / setup toolchain)
- `CI_LINT_COMMAND`
  - comandă de lint/quality gate
- `CI_TEST_COMMAND`
  - comandă de test/verification
- `CI_DEP_AUDIT_COMMAND` (optional)
  - comandă de audit pentru vulnerabilități/dependențe (framework/stack specific)
  - dacă e setat, înlocuiește default-urile `npm audit` / `pip-audit` din workflow-ul de security/release

## Semnificație
- Dacă `CI_LINT_COMMAND` e setat, pașii impliciți de lint (Node/Python) sunt dezactivați.
- Dacă `CI_TEST_COMMAND` e setat, pașii impliciți de teste (Node/Python) sunt dezactivați.
- Dacă `CI_SETUP_COMMAND` e setat, acesta rulează înainte de lint/test (recomandat pentru stack-uri non-Node/non-Python).

Pentru proiecte cu alte ecosisteme (ex: Go/Rust/Java/.NET), seed-ul are și un fallback de test “default” bazat pe detectarea fișierelor (ex: `go.mod`, `Cargo.toml`, `pom.xml`, `*.csproj`). Aceste default-uri rulează doar dacă `CI_TEST_COMMAND` nu e setat.

## Execuție
- Comenzile sunt executate pe runner-ul Linux al GitHub Actions (`bash`), deci trebuie să fie compatibile cu shell-ul.

