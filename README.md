# hacktricks-docker-builder

This repository contains a GitHub Actions workflow that clones the [HackTricks](https://github.com/HackTricks-wiki/hacktricks) repository, replaces the `book.toml` file with your custom version, builds a Docker image from the content, and automatically pushes the image to DockerHub.

## Why replace `book.toml`?

The `book.toml` file is replaced with a custom version to ensure that the HackTricks content can be served and browsed **offline**, without requiring access to external resources or online dependencies.  
This allows you to run a fully functional, self-contained HackTricks instance anywhere—completely disconnected from the Internet.

## Overview

- 🛠 **Automated with GitHub Actions:** Everything is handled by workflows—no manual steps required.
- 🕒 **Weekly updates:** Every week (Sunday at 2:00 AM UTC), the workflow fetches the latest HackTricks content.
- ⚡️ **Custom `book.toml`:** The workflow automatically overwrites the default `book.toml` in HackTricks with your version from this repository, ensuring full offline capability.
- 🐳 **Docker build & publish:** The image is built from the updated content and pushed to DockerHub.

## How It Works

1. **Scheduled Workflow**  
   The GitHub Actions workflow runs on a schedule (every Sunday at 2:00 AM UTC), on every push to `main`, or manually (workflow dispatch).

2. **Clone HackTricks**  
   The workflow clones the latest version of the [HackTricks](https://github.com/HackTricks-wiki/hacktricks) repository.

3. **Replace `book.toml`**  
   Your custom `book.toml` (from this repo) overwrites the original in the `hacktricks/` directory.

4. **Build Docker Image**  
   The Dockerfile (in this repository) uses the updated content to build a new image.

5. **Push to DockerHub**  
   The newly built image is automatically pushed to DockerHub.

## Usage

You can pull the resulting Docker image from DockerHub:

```sh
docker pull <your-dockerhub-username>/hacktricks:latest
```
And run it, for example:
```sh
docker run -d -p 3000:3000 mckevin33/hacktricks:latest
```