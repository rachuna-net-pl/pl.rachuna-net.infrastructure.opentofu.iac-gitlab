## Zawartość

- Moduły OpenTofu do zarządzania grupami, projektami i uprawnieniami w GitLab
- Przykładowe konfiguracje wdrożeniowe
- Dokumentacja wdrożeniowa i konfiguracyjna

## Wymagania

- [OpenTofu](https://opentofu.org/) w wersji zgodnej z modułami
- Dostęp do instancji GitLab oraz token z odpowiednimi uprawnieniami

## Szybki start

1. Sklonuj repozytorium:
   ```bash
   git clone https://gitlab.com/pl.rachuna-net/infrastructure/opentofu/iac-gitlab.git
   cd iac-gitlab
   ```

2. Skonfiguruj zmienne środowiskowe i pliki `*.tfvars` zgodnie z dokumentacją.

3. Zainicjuj OpenTofu:
   ```bash
   opentofu init
   ```

4. Zastosuj konfigurację:
   ```bash
   opentofu apply
   ```

## Struktura katalogów

- `modules/` – moduły OpenTofu do ponownego użycia
- `pl.rachuna-net/` – konfiguracje dla poszczególnych grup/projektów
- `docs/` – dokumentacja techniczna
```bash
podman run -it -v $PWD:/opentofu -v ~/.ssh:/root/.ssh -u root registry.gitlab.com/pl.rachuna-net/containers/opentofu:1.0.0 bash
```

## Definicja grupy w gitlab

Przykładowa definicja grupy pl.rachuna-net
```hcl
module "group_pl_rachuna-net" {
    source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-group.git?ref=main"

    name           = "pl.rachuna-net"
    description    = "https://rachuna-net.pl"
    parent_group   = "" # Brak grupy nadrzędnej
    visibility     = "public"
    default_branch = "main"
    labels         = local.labels
    avatar      = "root"

    badges = {
        "release" = {
            link_url    = "https://gitlab.com/%%{project_path}/-/releases"
            image_url   = "https://gitlab.com/%%{project_path}/-/badges/release.svg"
        }
        "pipeline" = {
            link_url    = "https://gitlab.com/%%{project_path}/-/commits/%%{default_branch}"
            image_url   = "https://gitlab.com/%%{project_path}/badges/%%{default_branch}/pipeline.svg"
        }
    }

    variables = {
        "SONAR_HOST_URL" = {
            description = "URL to SonarQube instance"
            value = "https://sonarcloud.io"
        }
        "SONAR_ORGANIZATION" = {
            description = "SonarQube organization"
            value = "pl-rachuna-net"
        }
    }
}
```

## Definicja projektu w gitlab

Przykładowa definicja projektu w gitlab
```hcl
module "gitlab" {
    source                             = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=main"

    name                               = "gitlab"
    description                        = "IaaC - Gitlab Management by OpenTofu"
    visibility                         = "public"
    tags                               = ["opentofu", "opentofu-modules"]
    avatar                          = "gitlab"

    parent_group                       = local.parent_name
    project_type                       = local.project_type

    # sonarqube
    sonarqube_cloud_project_id         = 67040690
    is_enabled_sonarqube               = true
}
```
## Links
- [gitlabhq/gitlab](https://search.opentofu.org/provider/gitlabhq/gitlab/latest)
- [gitlab api - projects](https://docs.gitlab.com/ee/api/projects.html#create-a-project)

