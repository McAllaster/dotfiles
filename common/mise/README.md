# Mise

[Mise](https://mise.jdx.dev) is used to install common dev tools, managing their versions for different projects/directory structures.

The `.mise.toml` file in the project root can be symlinked to `$HOME/.config/mise/config.toml` to be used as the system's default versions.
Additionally, [default Node packages](https://mise.jdx.dev/lang/node.html#default-node-packages) can be installed automatically by symlinking `.default-npm-packages` (in this directory) to `$HOME/.default-npm-packages`.
