#Step 1: Newman CLI to execute post man collection
FROM postman/newman:alpine

#Step 2: Created work dir in container
WORKDIR /etc/newman

#Step 3: copy collections
COPY collections collections

#Step 4: commands to execute collection.json
CMD ["run", "collections/API-Demo.postman_collection.json", "-r", "cli,html", "--reporter-html-export", "reports/report.html"]