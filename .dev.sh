# git

echo "Git setup"
git config --global user.name "jirkapenzes"
git config --global user.email "jirkapenzes@gmail.com"

# GitHub: Generating SSH keys
# https://help.github.com/articles/generating-ssh-keys/

# Lists the files in your .ssh directory, if they exist
ls -al ~/.ssh

# Creates a new ssh key, using the provided email as a label
ssh-keygen -t rsa -b 4096 -C "jirkapenzes@gmail.com"

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add your SSH key to the ssh-agent
ssh-add ~/.ssh/id_rsa

# Copies the contents of the id_rsa.pub file to your clipboard
pbcopy < ~/.ssh/id_rsa.pub

echo "SSH key for GitHub was generated and was copied to clipboard"
echo "Please copy ssh key into GitHub administration"
echo "Press any key to continue ..."
read



# tomcat
# https://wolfpaulus.com/jounal/mac/tomcat8/
# http://blog.bolshchikov.net/post/50277857673/installing-tomcat-on-macos-with-homebrew

brew install tomcat

tomcat_version="$(ls /usr/local/Cellar/tomcat/)"
echo "Installed Tomcat" $tomcat_version

tomcat_dir="/usr/local/Cellar/tomcat/$tomcat_version/libexec"
sudo ln -s $tomcat_dir /Library/Tomcat
sudo chown -R jirkapenzes /Library/Tomcat
sudo chmod +x /Library/Tomcat/bin/*.sh

echo "Tomcat was succesfull installed"
echo "You can run it via /Library/Tomcat/bin/startup.sh"
echo "Tomcat will be located to localhost:8080"