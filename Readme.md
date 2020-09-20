- Follow these steps to add your SSH Keys to production and pre-production servers
- Fork a branch off master
- To generate an encrypted password use following command replacing **<your password>** with
your actual password

```bash
python -c 'import crypt; import os; print crypt.crypt("<your password>", "$6$%s$" % (os.urandom(16).encode("base_64")[:8], ))'

```
- Paste this string in the file /roles/users/vars/main.yml along with your SSH username, password
and groups. You can use 'sudo' as group
- Create a SSH Key pair and put your public key under /roles/users/files
- e.g. if your user name is kushan the name of the file will be ssh_key.kushan.pub
- Commit these changes and raise a PR
- Wait for the tests to pass
- Ask someone from the Infra team to merge your PR
- Your SSH Key will be automatically added to newly spawned instances on production
and pre-production environments