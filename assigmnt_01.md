
# Assignment on Linux Commands
Your login name: altschool i.e., home directory /home/altschool. The home directory contains the following sub-directories: code, tests, personal, misc Unless otherwise specified, you are running commands (a to m) from the home directory.

## Preamble....
Creating a user with the requested subdirectories in home directory
1. Creating altschool user with home directory, add to sudo group for elevated previllege, assign preferred shell (bash)...
```bash
sudo userdd -m -G sudo -s /bin/bash altschool
```
2. Setting password to with passwd command and follow prompt...
```bash
sudo passwd altschool
```
3. Changing user and getting into user directory simultaneously...
```bash
sudo su -  altschool
```
4. Creating directories in user's home directory...
```bash
mkdir -v code tests personal misc
```
![creating user and subdirectories](./screenshots/create_user_and_dirs.png)

## Solutions....
a. Change directory to the tests directory using absolute pathname
```bash
    cd /home/altschool/tests
```
![absolute path](./screenshots/cd_absolute-path.png)

b. Change directory to the tests directory using relative pathname. 
    ```bash
    cd ../tests
    ```
![relative path](./screenshots/cd_relative_path.png)

c. Use echo command to create a file named fileA with text content ‘Hello A’ in the misc directory
```bash 
echo Hello A > ./misc/fileA
```
![echo file](./screenshots/echo_file.png)

#### d. Create an empty file named fileB in the misc directory. Populate the file with a dummy content afterwards
```bash
touch ./misc/fileB
head -c 1024 /dev/urandom >>./misc/fileB
```
![empty file, dummy content](./screenshots/empty-file-dumy-content.png)

e. Copy contents of FileA into fileC
```bash
cp ./misc/FileA ./misc/fileC
```
![copy file](./screenshots/copy_file.png)

f. Move contents of fileB into fileD
```bash
mv misc/fileB misc/fileD
```
![moving file](./screenshots/move_or_rename.png)

g. Create a tar archive called misc.tar for the contents of misc directory 
```bash
tar -cvf misc.tar ./misc
```
![tar archive](./screenshots/tar_archiving.png)

h. Compress the tar archive to create a misc.tar.gz file 
```bash
gzip -kv misc.tar
```  
![gzip compression](./screenshots/gzip_compression.png)

i. Create a user and force the user to change his/her password upon login
```bash
sudo useradd -m altschool2
```
follow prompt for password
```bash
sudo passwd -e altschool2
```  
or this command below give the same result.
```bash
sudo chage -d 0 altschool2
```
![new user with expiring password](./screenshots/expiring_user_password.png)

j. Lock a users password
```bash
sudo useradd -m altschool3
```
    
```bash
sudo passwd -l  altschool3
```
![Locked password](./screenshots/locking_user_password.png)

k. Create a user with no login shell
```bash
sudo useradd -m -s /sbin/nologin altschoolnoshell` 
```
![crreating user with no login shell](./screenshots/no_shell_user.png)

l. Disable password based authentication for ssh

```bash
vi /etc/ssh/sshd_config
```
Edit the line with PasswordAuthentication from yes to no, and edit the line usePAM from yes to no, 

then saVe and run...
    `service sshd restart`
![diabaled ssh password login](./screenshots/disabled_ssh_password_login.png)
m. Disable root login for ssh
```bash
vi /etc/ssh/sshd_config
```
Edith or Insert the line  PermitRootLogin no under Authenntication,  
then save and run...
```bash 
    service sshd restart
```
![ssh config edit](./screenshots/disabled_root_ssh_login.png)
