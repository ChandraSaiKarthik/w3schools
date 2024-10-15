:: This command is used to repack the Git repository and reduce its size
:: It is useful when the repository has grown too large and needs to be reduced in size
:: It can be run periodically to keep the repository size under control

:: https://stackoverflow.com/questions/5613345/how-to-shrink-the-git-folder

:: It does this by:
:: -a: including all objects in the pack
:: -d: deleting any existing packs
:: -f: forcefully overwriting any existing packs
:: --depth=250: limiting the depth of the delta window to 250
:: --window=250: limiting the window size to 250


git repack -a -d -f --depth=250 --window=250