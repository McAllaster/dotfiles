# Git Configuration

## Directory-based Configuration

Different projects might require different Git configurations, whether that be different emails, signing details, etc.
Using a singular "global" configuration might not meet my needs, and managing project-specific configurations is tedious.
Thankfully, Git has a solution: `includeIf`:

```git_config
[includeIf "gitdir:"<PROJECT-PATH>"]
	path = <PATH-TO-SUB-CONFIG>
```

This gives you conditional rule inclusion for a provided path, and all child paths below it.
Simply specify a different file formatted as a `.gitconfig` containing your new rules for that path.

## Signing

Utilize the following category/rule combinations in your `.gitconfig` to automatically sign a commit:

```git_config
[commit]
gpgsign = true

[user]
signingkey = <GPG_KEY_ID>

[gpg]
program = <GPG_PROGRAM>
```

Note that `gpg.program` is not necessary in most cases.
However, if you have to install a _different_ GnuPG binary, like on MacOS, then supplying it may be necessary.

### GPG Key ID

If you are using external keys (like smartcards), ensure that you import the public key related to the key that you wish to use.
You can then trust the key, ensuring that your logs with `git log --show-signature` show up normally.

For example, assuming that you have your public key stored as `public.key`:
```
gpg --import public.key
gpg --list-secret-keys --keyid-format=long
```

This will output your keys, a la:
```
/home/fortiter/.gnupg/pubring.kbx
---------------------------------
sec>  ed25519/AAAAAAAAAAAAAAAA 1970-01-01 [SC]
      AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
      Card serial no. = 0000
uid                 [unknown] Your Name <your@email>
```

In this case, `AAAAAAAAAAAAAAAA` is the key's ID, and you can trust it via:

```
gpg --edit-key AAAAAAAAAAAAAAAA trust
```

This will output the following:

```
Please decide how far you trust this user to correctly verify other users' keys
(by looking at passports, checking fingerprints from different sources, etc.)

  1 = I don't know or won't say
  2 = I do NOT trust
  3 = I trust marginally
  4 = I trust fully
  5 = I trust ultimately
  m = back to the main menu

Your decision?
```

Usually you will want to use `5` for your own key.

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
