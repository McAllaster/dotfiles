# Git Configuration

## Directory-based Configuration

Different projects might require different Git configurations, whether that be different emails, signing details, etc.
Using a singular "global" configuration might not meet my needs, and managing project-specific configurations is tedious.
Thankfully, Git has a solution: `includeIf`:

```
[includeIf "gitdir:"<PROJECT-PATH>"]
	path = <PATH-TO-SUB-CONFIG>
```

This gives you conditional rule inclusion for a provided path, and all child paths below it.
Simply specify a different file formatted as a `.gitconfig` containing your new rules for that path.

## Signing

Utilize the following category/rule combinations in your `.gitconfig` to automatically sign a commit:

```
[commit]
gpgsign = true

[user]
signingkey = <GPG_KEY_ID>

[gpg]
program = <GPG_PROGRAM>
```

Note that `gpg.program` is not necessary in most cases.
However, if you have to install a _different_ GnuPG binary, like on MacOS, then supplying it may be necessary.

## URL Overrides

Sometimes you may have to override URLs being used by git, whether to force `ssh` usage or otherwise.
This can be accomplished by the following `url` + `insteadOf` combination:

```
[url "<URL_YOU_WANT>"]
	insteadOf = <URL_YOU_DONT>
```

## Rebasing Pulls

Rebase your pulls by default. It's preference, but basically it just helps keep things cleaner, in my opinion.

```
[pull]
	rebase = true
```
