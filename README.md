# GitHub + Jenkins + Docker (Postman / Newman CI)
## Step 1: Push this exact structure to GitHub:
  postman-docker-ci/
  │── collections/
  │   └── API-Demo.postman_collection.json
  │── reports/                  # Jenkins will create this
  │── Dockerfile
  │── Jenkinsfile
  │── README.md

## Step 2. Final Dockerfile
      FROM postman/newman:alpine
      
      WORKDIR /etc/newman
      
      COPY collections collections
      
      CMD ["run", "collections/API-Demo.postman_collection.json", "-r", "cli,html", "--reporter-html-export", "reports/report.html"]
## Step 3. Push Code to GitHub (Step-by-Step)
  - Initialize Git (once)
  git init
  git add .
  git commit -m "Postman API tests with Docker and Newman"
  -Create GitHub Repo
      •  Go to GitHub → New Repository
      •  Name: postman-docker-ci
      •  Copy repo URL
  -Push code to GitHub
      git branch -M main
      git remote add origin https://github.com/susiparida01/postman-docker-ci.git
      if error: please run below command
      git pull origin main --allow-unrelated-histories
      git push -u origin main
## Step 4. Jenkins Setup
    Install Required Tools
    •	Jenkins
    •	Docker
    •	Git
    Start Jenkins
    •	C:\Users\DELL\Jenkins>java -jar jenkins.war --httpPort=9090
    •	Open browser → http://localhost:9090
    •	Login
    Install Jenkins Plugins
    Manage Jenkins → Plugins
    •	Git
    •	Pipeline
    •	Docker Pipeline
    Restart Jenkins if asked.
## Step 5. Jenkinsfile
        Create Jenkinsfile in repo root.
## 6. Create Jenkins Pipeline Job
      Steps
      1.	Jenkins Dashboard → New Item
      2.	Name: Postman-Docker-CI
      3.	Type: Pipeline
      4.	Pipeline Definition → Pipeline script from SCM
      5.	SCM → Git
      6.	Repo URL → GitHub repo URL
      7.	Branch → main
      8.	Script Path → Jenkinsfile
      9.	Save → Build Now
      7. Jenkins Build Output (What You’ll See)
