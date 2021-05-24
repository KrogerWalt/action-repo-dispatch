# Action Repo Dispatch

This is a GitHub Action to start a workflow in a different repository.

## Inputs

|   NAME    |                            DESCRIPTION                                       |   TYPE   | REQUIRED |   DEFAULT   |
|-----------|------------------------------------------------------------------------------|----------|----------|-------------|
| `owner`   | The owner of the repo. So for this project it would be `KrogerWalt`          | `string` | `true`   | N/A         |
| `repo`    | The name of the repo. So for this project it would be `action-repo-dispatch` | `string` | `true`   | N/A         |
| `user`    | The user who owns the PAT.                                                   | `string` | `true`   | N/A         |
| `PAT`     | A Personal Access Token belonging to the user supplied.                      | `string` | `true`   | N/A         |
| `workflow` | The name of the .yml file for which workflow you want started.                 | `string` | `false`  | `build.yml` |
| `branch`  | The name of the branch to use with the workflow you want started.             | `string` | `false`  | `main`      |


## Example

```yaml
name: Build Library and Start App Build

on:
  pull_request:
    types: [closed]

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
... build work for my local repo

      - uses: KrogerWalt/action-repo-dispatch@v1
        with:
          owner: KrogerWalt
          repo: AmazingApp
          user: ${{ secrets.GH_USER }}
          PAT: ${{ secrets.GH_PAT }}
          workflow: update-library.yml

```

In your target repo (KrogerWalt/AmazingApp in this case) you need the 
.github/workflows/ directory to contain a file with the name you provided
(or build.yml if using the default) and that file will need to include 
`workflow_dispatch:` under the `on:` section.

## License

Action Repo Dispatch is released under the [Apache License 2.0](./LICENSE).
