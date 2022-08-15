# golang-app-template

Golang application template for GitHub.

Contains:
- Basic running Go code (just a `cmd` so everything else works)
- A `Makefile` with some Quality of Life for contributing and executing common tasks.
- A `Containerfile` with a boilerplate container with no dependencies.
- [Goreleaser](https://goreleaser.com) configuration and CI.
- A basic Helm chart
- Github actions to build, test and release binaries and container images to the Github container registry.


## Using the template

1. Press the **Use this template** button at the top of this repository.
2. Find and replace `golang-app-template` everywhere you need
3. Rename `cmd/golang-app-template`
4. `make quick-run`

## Makefile

```
$ make help
         build: builds the project for the setup os/arch combinations
         clean:  clean test cache, build files
        format: Executes the formatting pipeline on the project
          help: this screen. Keep it first target to be default
          lint: Check the project for errors
     quick-run: Executes the project using golang
           run: Executes the project build locally
          test: Runs the test suite
```
