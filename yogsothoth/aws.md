# AWS

## Installing

Fedora does not distribute AWS CLI v2, so we must install it using the [official instructions](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

However, the _default_ installation method does not use a sane installation location, requiring `sudo` to be used.
Instead, we can manually specify the installation & binary paths using user-owned directories.

```sh
# Assuming the AWS CLI archive has been downloaded and extracted to the current directory
./aws/install -i $HOME/.local/aws-cli -b $HOME/.local/bin
```

> Note that directories `$HOME/.local` and `$HOME/.local/bin` should already exist, with the latter being included in `$PATH` so that we can access the `aws` binary.

### Updating

The official installation instructions can be followed again (downloading the latest archive, etc.).
However, we add a `-u` as a new argument to specify that we are _updating_ the existing installation.

## Single Sign-On

Assuming you're not using different profiles & sessions with `aws sso`, it may be helpful to set up a _default_ profile referencing a single commonly-used session.

For example, your `~/.aws/config` file might look like:
```toml
[profile default]
sso_session = <SESSION_NAME>
sso_account_id = <ACCOUNT_ID>
sso_role_name = <ROLE>
region = <REGION>
output = json
[sso-session <SESSION_NAME>]
sso_start_url = <URL>
sso_region = <REGION>
sso_registration_scopes = sso:account:access
```
