import os
import subprocess

def setup_web_server():
    # 1. Update package lists
    print("Updateing packages")
    subprocess.run(["sudo", "apt-get", "update"], check=True)


    # 2. Install PHP and Apache
    print("Installing PHP and Apache")
    subprocess.run(["sudo", "apt-get", "install", "-y", "php", "apache"], check=True)
    
    # 3. Clone repository
    repo_url = "https://github.com/brikis98/php-app.git"
    dest_dir = "/var/www/html/app"
    
    print(f"Cloning {repo_url}")
    if not os.path.exists(dest_dir):
        subprocess.run(["sudo", "git", "clone", repo_url, dest_dir], check=True)
    
    # 4. Start the service
    print("Starting Apache")
    subprocess.run(["sudo", "service", "apache2", "start"])


if __name__ == "__main__":
    setup_web_server()
