# Docker Drupal Setup

This project uses a shell script to set up and run Docker containers for a Drupal and MySQL environment with a custom Docker network.

## Prerequisites

1. **Docker:** Make sure Docker is installed and running. You can download Docker [here](https://www.docker.com/get-started).
2. **Docker Compose (optional):** While this script doesn’t use Docker Compose, it may be helpful if you want to configure multiple services in YAML files in the future.
3. **`drupal_run.sh` script:** The `drupal_run.sh` file should be in the project’s root directory and marked as executable (see below).

## Script Structure

This script:

1. Stops and removes any existing MySQL and Drupal containers if they are already running.
2. Removes and recreates a Docker network named `drupal-network`.
3. Runs a new MySQL container with the environment variables needed for Drupal.
4. Runs a new Drupal container connected to the same network.
5. Waits a few seconds, then copies a plugin located in `./modules/my-custom-module` to the Drupal container.

## Running the Script

### 1. On Linux or macOS

1. Open a terminal and navigate to the directory where the `drupal_run.sh` script is located.
2. Grant execute permissions to the script (if you haven't already):

    ```bash
    chmod +x drupal_run.sh
    ```

3. Run the script:

    ```bash
    ./drupal_run.sh
    ```

### 2. On Windows

- If using PowerShell or CMD, you can run the script in a Docker installation for Windows with the WSL (Windows Subsystem for Linux) enabled.
- Alternatively, you can copy the commands from the script and run them manually in PowerShell.

### Note for WSL Users

For those using Windows with WSL, ensure Docker is available in WSL, and that the script has execution permissions:

```bash
chmod +x drupal_run.sh
./drupal_run.sh
